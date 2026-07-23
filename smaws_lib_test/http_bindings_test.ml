(* Tests for [Smaws_Lib.Http_bindings]: restXml HTTP binding helpers.
   Covers percent-encoding (greedy vs non-greedy), URI template label
   substitution, @httpQuery-over-@httpQueryParams precedence (incl. list-valued
   maps), @httpHeader-over-@httpPrefixHeaders precedence (incl. empty prefix),
   and @endpoint host-prefix substitution. *)

module H = Smaws_Lib.Http_bindings
module U = Uri

(* ---- percent_encode_path_segment ---- *)

let encode_path () =
  (* greedy labels ({label+}) must NOT percent-encode '/' (or anything else) *)
  Alcotest.(check string)
    "greedy keeps slash" "there/guy"
    (H.percent_encode_path_segment ~greedy:true "there/guy");
  (* non-greedy labels percent-encode per the Path component, including '/' *)
  Alcotest.(check string)
    "non-greedy encodes slash" "a%2Fb"
    (H.percent_encode_path_segment ~greedy:false "a/b");
  Alcotest.(check string)
    "non-greedy encodes space" "a%20b"
    (H.percent_encode_path_segment ~greedy:false "a b");
  Alcotest.(check string)
    "non-greedy plain" "abc"
    (H.percent_encode_path_segment ~greedy:false "abc")

(* ---- percent_encode_query_value ---- *)

let encode_query () =
  Alcotest.(check string) "query encodes space" "a%20b" (H.percent_encode_query_value "a b");
  (* '&' must be encoded so it is not interpreted as a param separator *)
  Alcotest.(check string) "query encodes amp" "a%26b" (H.percent_encode_query_value "a&b");
  Alcotest.(check string) "query plain" "abc" (H.percent_encode_query_value "abc")

(* ---- substitute_labels ---- *)

let subst_labels () =
  Alcotest.(check string)
    "simple label" "/foo/a%20b"
    (H.substitute_labels ~template:"/foo/{bar}" ~labels:[ ("bar", "a b", false) ]);
  (* greedy label keeps '/' unencoded *)
  Alcotest.(check string)
    "greedy label keeps slash" "/foo/there/guy"
    (H.substitute_labels ~template:"/foo/{bar+}" ~labels:[ ("bar", "there/guy", true) ]);
  (* non-greedy label encodes '/' so it cannot inject a path separator *)
  Alcotest.(check string)
    "non-greedy label encodes slash" "/foo/a%2Fb"
    (H.substitute_labels ~template:"/foo/{bar}" ~labels:[ ("bar", "a/b", false) ]);
  (* literal query string embedded in @http uri is preserved *)
  Alcotest.(check string)
    "literal query preserved" "/foo/a%20b?baz=qux"
    (H.substitute_labels ~template:"/foo/{bar}?baz=qux" ~labels:[ ("bar", "a b", false) ]);
  (* multiple labels substituted, each once *)
  Alcotest.(check string)
    "two labels" "/foo/1/bar/2"
    (H.substitute_labels ~template:"/foo/{a}/bar/{b}"
       ~labels:[ ("a", "1", false); ("b", "2", false) ]);
  (* a label absent from the template leaves the template unchanged *)
  Alcotest.(check string)
    "absent label noop" "/foo"
    (H.substitute_labels ~template:"/foo" ~labels:[ ("a", "1", false) ])

(* ---- merge_query_params ---- *)

let merge_query () =
  (* @httpQuery value wins and the conflicting @httpQueryParams entry is
     dropped (not duplicated). *)
  Alcotest.(check int)
    "named wins, map entry dropped" 2
    (List.length
       (H.merge_query_params
          ~named_params:[ ("bar", [ "named" ]) ]
          ~map_params:[ ("bar", [ "map1"; "map2" ]); ("foo", [ "x" ]) ]));
  Alcotest.(check (list (pair string (list string))))
    "named wins, map entry dropped (values)"
    [ ("bar", [ "named" ]); ("foo", [ "x" ]) ]
    (H.merge_query_params
       ~named_params:[ ("bar", [ "named" ]) ]
       ~map_params:[ ("bar", [ "map1"; "map2" ]); ("foo", [ "x" ]) ]);
  (* list-valued map entries are preserved as repeated query keys *)
  Alcotest.(check (list (pair string (list string))))
    "list-valued map preserved"
    [ ("k", [ "a"; "b" ]) ]
    (H.merge_query_params ~named_params:[] ~map_params:[ ("k", [ "a"; "b" ]) ]);
  (* named-only passes through *)
  Alcotest.(check (list (pair string (list string))))
    "named only"
    [ ("a", [ "1" ]) ]
    (H.merge_query_params ~named_params:[ ("a", [ "1" ]) ] ~map_params:[])

(* ---- merge_headers ---- *)

let merge_hdrs () =
  (* @httpHeader wins over @httpPrefixHeaders on the same name; prefix entry
     dropped. Empty prefix ("") matches bare header names. *)
  Alcotest.(check (list (pair string string)))
    "named header wins over empty-prefix"
    [ ("hello", "specific") ]
    (H.merge_headers
       ~named_headers:[ ("hello", "specific") ]
       ~prefix_headers:[ ("", [ ("hello", "prefix-val") ]) ]);
  (* empty prefix with no named conflict passes all entries through bare *)
  Alcotest.(check (list (pair string string)))
    "empty prefix passthrough"
    [ ("x", "1"); ("y", "2") ]
    (H.merge_headers ~named_headers:[] ~prefix_headers:[ ("", [ ("x", "1"); ("y", "2") ]) ]);
  (* non-empty prefix: the [@httpPrefixHeaders] value is the full prefix
     (including the trailing "-"); the header name is [prefix ^ key]. *)
  Alcotest.(check (list (pair string string)))
    "prefix prepends name"
    [ ("foo-a", "1") ]
    (H.merge_headers ~named_headers:[] ~prefix_headers:[ ("foo-", [ ("a", "1") ]) ]);
  (* named header wins over a prefixed entry that resolves to the same name *)
  Alcotest.(check (list (pair string string)))
    "named wins over nonempty prefix"
    [ ("foo-a", "specific") ]
    (H.merge_headers
       ~named_headers:[ ("foo-a", "specific") ]
       ~prefix_headers:[ ("foo-", [ ("a", "prefix-val") ]) ])

(* ---- substitute_host_prefix ---- *)

let subst_host () =
  let base = U.of_string "https://example.com/foo" in
  (* static host prefix prepended to host *)
  Alcotest.(check string)
    "static host prefix" "foo.example.com"
    (U.host_with_default ~default:"" (H.substitute_host_prefix ~host_prefix:"foo." ~labels:[] base));
  (* {label} in host prefix substituted from @hostLabel members *)
  Alcotest.(check string)
    "host label substituted" "123.example.com"
    (U.host_with_default ~default:""
       (H.substitute_host_prefix ~host_prefix:"{account}." ~labels:[ ("account", "123") ] base));
  (* a label embedded in a prefix with a static suffix is substituted in place *)
  Alcotest.(check string)
    "host label mid-prefix" "prod-us.example.com"
    (U.host_with_default ~default:""
       (H.substitute_host_prefix ~host_prefix:"{env}-us." ~labels:[ ("env", "prod") ] base));
  (* path is untouched *)
  Alcotest.(check string)
    "path preserved" "/foo"
    (U.path (H.substitute_host_prefix ~host_prefix:"foo." ~labels:[] base))

let () =
  Alcotest.run "Http_bindings"
    [
      ( "encode_path",
        [
          ("greedy/non-greedy/slash", `Quick, encode_path);
          ("query value encoding", `Quick, encode_query);
        ] );
      ("subst_labels", [ ("label substitution + greedy slash", `Quick, subst_labels) ]);
      ( "merge_query",
        [ ("httpQuery over httpQueryParams precedence + list values", `Quick, merge_query) ] );
      ("merge_headers", [ ("httpHeader over httpPrefixHeaders + empty prefix", `Quick, merge_hdrs) ]);
      ("subst_host", [ ("endpoint host-prefix substitution", `Quick, subst_host) ]);
    ]
