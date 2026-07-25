open Smaws_Lib.Xml.Parse
open Types

let unit_of_xml _ = ()
let http_date_of_xml i attrs = Primitive.timestamp_httpdate_of_string (Read.data i)
let epoch_seconds_of_xml i attrs = Primitive.timestamp_epoch_of_string (Read.data i)
let date_time_of_xml i attrs = Primitive.timestamp_iso_of_string (Read.data i)
let string_list_of_xml i attrs = Read.elements_value i "member" Fun.id ()

let nested_string_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> string_list_of_xml i attrs) ()

let integer_enum_of_xml i attrs =
  let s = Read.data i in
  (match s with "1" -> A | "2" -> B | "3" -> C | _ -> failwith "unknown enum value"
    : integer_enum)

let integer_enum_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> integer_enum_of_xml i attrs) ()

let foo_enum_of_xml i attrs =
  let s = Read.data i in
  (match s with
   | "Foo" -> FOO
   | "Baz" -> BAZ
   | "Bar" -> BAR
   | "1" -> ONE
   | "0" -> ZERO
   | _ -> failwith "unknown enum value"
    : foo_enum)

let foo_enum_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> foo_enum_of_xml i attrs) ()

let timestamp_list_of_xml i attrs =
  Read.elements_value i "member" Primitive.timestamp_iso_of_string ()

let boolean_list_of_xml i attrs = Read.elements_value i "member" Primitive.bool_of_string ()
let integer_list_of_xml i attrs = Read.elements_value i "member" Primitive.int_of_string ()
let string_set_of_xml i attrs = Read.elements_value i "member" Fun.id ()

let integer_enum_map_of_xml i attrs =
  Read.sequences i "entry"
    (fun i attrs ->
      let k = Read.element_value i "key" Fun.id () in
      let v = Read.sequence i "value" (fun i attrs -> integer_enum_of_xml i attrs) () in
      (k, v))
    ()

let integer_enum_set_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> integer_enum_of_xml i attrs) ()

let foo_enum_map_of_xml i attrs =
  Read.sequences i "entry"
    (fun i attrs ->
      let k = Read.element_value i "key" Fun.id () in
      let v = Read.sequence i "value" (fun i attrs -> foo_enum_of_xml i attrs) () in
      (k, v))
    ()

let foo_enum_set_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> foo_enum_of_xml i attrs) ()

let greeting_struct_of_xml i attrs =
  let r_hi = ref None in
  Structure.scanSequence i [ "hi" ] (fun tag _ ->
      match tag with
      | "hi" -> r_hi := Some (Read.element_value i "hi" Fun.id ())
      | _ -> Read.skip_element i);
  ({ hi = ( ! ) r_hi } : greeting_struct)

let greeting_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> greeting_struct_of_xml i attrs) ()

let sparse_string_map_of_xml i attrs =
  Read.sequences i "entry"
    (fun i attrs ->
      let k = Read.element_value i "key" Fun.id () in
      let v = Read.element_value i "value" Fun.id () in
      (k, v))
    ()

let sparse_string_list_of_xml i attrs = Read.elements_value i "member" Fun.id ()

let string_map_of_xml i attrs =
  Read.sequences i "entry"
    (fun i attrs ->
      let k = Read.element_value i "key" Fun.id () in
      let v = Read.element_value i "value" Fun.id () in
      (k, v))
    ()

let string_list_map_of_xml i attrs =
  Read.sequences i "entry"
    (fun i attrs ->
      let k = Read.element_value i "key" Fun.id () in
      let v = Read.sequence i "value" (fun i attrs -> string_list_of_xml i attrs) () in
      (k, v))
    ()

let double_list_of_xml i attrs = Read.elements_value i "member" Primitive.double_of_string ()
let integer_set_of_xml i attrs = Read.elements_value i "member" Primitive.int_of_string ()
let text_plain_blob_of_xml i attrs = Primitive.blob_of_string (Read.data i)
let jpeg_blob_of_xml i attrs = Primitive.blob_of_string (Read.data i)
let sparse_short_list_of_xml i attrs = Read.elements_value i "member" Primitive.int_of_string ()

let foo_union_of_xml i attrs =
  let r_string_ = ref None in
  let r_integer = ref None in
  Structure.scanSequence i [ "string"; "integer" ] (fun tag _ ->
      match tag with
      | "string" -> r_string_ := Some (Read.element_value i "string" Fun.id ())
      | "integer" -> r_integer := Some (Read.element_value i "integer" Primitive.int_of_string ())
      | _ -> Read.skip_element i);
  (match ( ! ) r_string_ with
   | Some v -> String v
   | None -> (
       match ( ! ) r_integer with
       | Some v -> Integer v
       | None -> failwith "no union member present in xml response")
    : foo_union)

let union_set_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> foo_union_of_xml i attrs) ()

let structure_set_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> greeting_struct_of_xml i attrs) ()

let list_set_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> string_list_of_xml i attrs) ()

let http_date_set_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> http_date_of_xml i attrs) ()

let date_time_set_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> date_time_of_xml i attrs) ()

let timestamp_set_of_xml i attrs =
  Read.elements_value i "member" Primitive.timestamp_iso_of_string ()

let long_set_of_xml i attrs = Read.elements_value i "member" Primitive.long_of_string ()
let short_set_of_xml i attrs = Read.elements_value i "member" Primitive.int_of_string ()
let byte_set_of_xml i attrs = Read.elements_value i "member" Primitive.int_of_string ()
let boolean_set_of_xml i attrs = Read.elements_value i "member" Primitive.bool_of_string ()
let blob_set_of_xml i attrs = Read.elements_value i "member" Primitive.blob_of_string ()
let blob_list_of_xml i attrs = Read.elements_value i "member" Primitive.blob_of_string ()
let byte_list_of_xml i attrs = Read.elements_value i "member" Primitive.int_of_string ()

let date_time_list_of_xml i attrs =
  Read.sequences i "member" (fun i attrs -> date_time_of_xml i attrs) ()

let float_list_of_xml i attrs = Read.elements_value i "member" Primitive.float_of_string ()
let long_list_of_xml i attrs = Read.elements_value i "member" Primitive.long_of_string ()
let short_list_of_xml i attrs = Read.elements_value i "member" Primitive.int_of_string ()
