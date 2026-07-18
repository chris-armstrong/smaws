(* HTTP binding helpers for restXml protocol.
   Path-template substitution, percent-encoding, query merge, host-prefix substitution. *)

(** Percent-encode a path segment value.
    Greedy labels ({label+}) must NOT percent-encode '/'. Non-greedy labels
    percent-encode per the URI Path component, which encodes '/' as %2F so a
    single-segment label cannot inject a path separator. *)
let percent_encode_path_segment ~greedy s = if greedy then s else Uri.pct_encode ~component:`Path s

(** Percent-encode a query parameter value. *)
let percent_encode_query_value s = Uri.pct_encode ~component:`Query s

(** Index of the first occurrence of [sub] in [s] at or after [from], or [None] if absent. A plain
    stdlib substring search — no [Str] global state, so it is safe to call concurrently with other
    code that still uses [Str] (e.g. [Ini]). *)
let index_of_substring ~from ~sub s =
  let n = String.length s and m = String.length sub in
  if m = 0 then Some (min from n)
  else if m > n || from > n - m then None
  else (
    let last = n - m in
    let rec loop i =
      if i > last then None
      else (
        let rec check j =
          if j >= m then true
          else if String.get s (i + j) <> String.get sub j then false
          else check (j + 1)
        in
        if check 0 then Some i else loop (i + 1))
    in
    loop from)

(** Check if [s] contains [sub]. *)
let contains_substring s sub = Option.is_some (index_of_substring ~from:0 ~sub s)

(** Replace the first occurrence of [pattern] in [s] with [with_], or return [s] unchanged. *)
let replace_first ~pattern ~with_ s =
  match index_of_substring ~from:0 ~sub:pattern s with
  | None -> s
  | Some pos ->
      let len = String.length pattern in
      String.sub s 0 pos ^ with_ ^ String.sub s (pos + len) (String.length s - pos - len)

(** Substitute {label} and {label+} placeholders in a URI template.
    [labels] is a list of (name, value, is_greedy) tuples.
    Returns the resolved URI string. *)
let substitute_labels ~template ~labels =
  List.fold_left
    (fun uri (name, value, greedy) ->
      let placeholder = "{" ^ name ^ "+}" in
      if contains_substring uri placeholder then
        replace_first ~pattern:placeholder ~with_:(percent_encode_path_segment ~greedy value) uri
      else (
        let placeholder = "{" ^ name ^ "}" in
        replace_first ~pattern:placeholder
          ~with_:(percent_encode_path_segment ~greedy:false value)
          uri))
    template labels

(** Merge query parameters from @httpQuery members with @httpQueryParams map.
    @httpQuery takes precedence: if a key appears in both, the @httpQuery value wins
    and the conflicting @httpQueryParams entry is dropped.
    [named_params] is (name, value) list from @httpQuery members.
    [map_params] is (key, value_list) list from @httpQueryParams map.
    Returns (string * string list) list suitable for Uri encoding. *)
let merge_query_params ~named_params ~map_params =
  let named_keys = List.map (fun (k, _) -> k) named_params in
  let filtered_map =
    List.filter_map
      (fun (key, values) -> if List.mem key named_keys then None else Some (key, values))
      map_params
  in
  named_params @ filtered_map

(** Merge headers from @httpHeader members with @httpPrefixHeaders map.
    @httpHeader takes precedence: if a header name appears in both, the @httpHeader value wins.
    [named_headers] is (name, value) list from @httpHeader members.
    [prefix_headers] is (prefix, (key, value) list) list from @httpPrefixHeaders map.
    Returns (string * string) list. *)
let merge_headers ~named_headers ~prefix_headers =
  let named_keys = List.map (fun (k, _) -> k) named_headers in
  let filtered_prefix =
    List.concat_map
      (fun (prefix, entries) ->
        List.filter_map
          (fun (key, value) ->
            let header_name = if prefix = "" then key else prefix ^ "-" ^ key in
            if List.mem header_name named_keys then None else Some (header_name, value))
          entries)
      prefix_headers
  in
  named_headers @ filtered_prefix

(** Substitute host prefix from @endpoint trait into the URI host.
    [host_prefix] is the prefix string (e.g. "foo.").
    [labels] is (name, value) list from @hostLabel members.

    @hostLabel values are DNS labels (RFC 952: ASCII letters/digits/'-'/'.'),
    so they are substituted raw — no encoding. Do NOT pct-encode a host:
    percent-escaping produces an invalid hostname (e.g. "caf%C3%A9"), and the
    correct encoding for an internationalized label would be Punycode
    ("xn--..."), which the [uri] library does not perform and which is out of
    scope (no IDNA dependency; no conformance coverage). A non-ASCII label is
    therefore passed through and will fail at the HTTP layer. *)
let substitute_host_prefix ~host_prefix ~labels uri =
  let resolved_prefix =
    List.fold_left
      (fun prefix (name, value) -> replace_first ~pattern:("{" ^ name ^ "}") ~with_:value prefix)
      host_prefix labels
  in
  let host = Uri.host_with_default ~default:"" uri in
  Uri.with_host uri (Some (resolved_prefix ^ host))
