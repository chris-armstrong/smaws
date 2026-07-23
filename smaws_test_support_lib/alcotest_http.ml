type input_body = Smaws_Lib.Http.input_body [@@deriving show, eq]

let input_body_testable = Alcotest.option (Alcotest.testable pp_input_body equal_input_body)

let input_body_json_testable =
  Alcotest.option (Alcotest.testable Yojson.Basic.pp Yojson.Basic.equal)

(** A testable for comparing HTTP header output. Specifically, [expected] is a list of expected
    header names which need to be present in [actual].

    Keys are case-insensitive. Extra headers in actual are ignored.

    Special handling is implemented for Content-Type headers *)
let headers_eq expected actual =
  List.for_all
    (fun (k, v) ->
      let k = String.lowercase_ascii k in
      let v =
        match String.split_on_char ';' v with
        | res :: _ -> String.trim res
        | [] -> failwith "split_on_char should not return []"
      in
      List.exists
        (fun (k', v') ->
          let has_key = String.equal k (String.lowercase_ascii k') in
          let v' =
            match String.split_on_char ';' v' with
            | res :: _ -> String.trim res
            | [] -> failwith "split_on_char should not return []"
          in
          let has_value = String.equal v v' in
          has_key && has_value)
        actual)
    expected

let headers_pp = Fmt.(list (pair string string))
let headers_testable = Alcotest.testable headers_pp headers_eq
let method_testable = Alcotest.testable Smaws_Lib.Http.pp_method_ Smaws_Lib.Http.equal_method_

let parse_form_body s =
  Uri.query_of_encoded s
  |> List.map (fun (k, vs) -> (k, List.sort String.compare vs))
  |> List.sort (fun (k1, _) (k2, _) -> String.compare k1 k2)

let form_body_equal s1 s2 =
  let equal_pair (k1, v1) (k2, v2) = String.equal k1 k2 && List.equal String.equal v1 v2 in
  List.equal equal_pair (parse_form_body s1) (parse_form_body s2)

let input_body_form_testable = Alcotest.option (Alcotest.testable Fmt.string form_body_equal)

(** A testable for comparing restXml request bodies: both sides are parsed with
    [Smaws_Lib.Xml.Canonical.of_string] and compared as canonical trees, so the comparison is
    insensitive to attribute ordering or incidental whitespace. *)
let xml_body_equal s1 s2 =
  Smaws_Lib.Xml.Canonical.equal
    (Smaws_Lib.Xml.Canonical.of_string s1)
    (Smaws_Lib.Xml.Canonical.of_string s2)

let input_body_xml_testable = Alcotest.option (Alcotest.testable Fmt.string xml_body_equal)

(** A testable for comparing Smithy URIs - only compares the path component *)
let uri_testable =
  Alcotest.testable
    (fun fmt uri -> Fmt.pf fmt "%s" (Uri.path uri))
    (fun exp actual ->
      String.equal (Uri.path exp)
        ( Uri.path actual |> function
          | "" -> "/"
          | x when String.ends_with ~suffix:"/" x -> x
          | x -> x ^ "/" ))

(** [float_equal_nan a b] compares floats, treating NaN as equal to NaN (unlike polymorphic [=], for
    which [nan = nan] is [false]). Infinity and -Infinity compare as equal to themselves as normal.
*)
let float_equal_nan a b = (Float.is_nan a && Float.is_nan b) || a = b

(** A NaN-aware testable for bare floats. *)
let float_testable_nan = Alcotest.testable (fun fmt f -> Fmt.pf fmt "%g" f) float_equal_nan

(** [nan_aware_equal equal] wraps an [equal] so that values differing only in NaN-typed float fields
    still compare equal. The supplied [equal] (typically a [@@deriving eq] function) is used first;
    [Stdlib.compare] — which treats [nan] as equal to [nan], and otherwise agrees with [=] — is used
    as a tiebreaker so only the float fields' NaN behaviour changes. *)
let nan_aware_equal equal a b = equal a b || Stdlib.compare a b = 0

let testable_nan_aware pp equal = Alcotest.testable pp (nan_aware_equal equal)

(** A testable for restXml request URIs: compares the path exactly (no trailing "/" normalisation)
    and the query as a sorted multiset of [(key, value)] pairs, so repeated query keys and parameter
    ordering do not affect equality. (The generic [uri_testable] compares only the path and appends
    a trailing "/", which suits AwsQuery/AwsJson root-"/" URIs but not restXml path+query URIs.) *)
let restxml_uri_canon uri =
  ( Uri.path uri,
    Uri.query uri
    |> List.concat_map (fun (k, vs) -> List.map (fun v -> (k, v)) vs)
    |> List.sort compare )

let restxml_uri_equal a b =
  let p1, q1 = restxml_uri_canon a in
  let p2, q2 = restxml_uri_canon b in
  String.equal p1 p2
  && List.equal (fun (k1, v1) (k2, v2) -> String.equal k1 k2 && String.equal v1 v2) q1 q2

let restxml_uri_testable =
  Alcotest.testable (fun fmt uri -> Fmt.pf fmt "%s" (Uri.to_string uri)) restxml_uri_equal
