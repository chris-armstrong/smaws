open Smaws_Lib.Xml.Parse
open Types
let unit_of_xml _ = ()
let foo_union_of_xml i =
  let r_integer = ref None in
  let r_string_ = ref None in
  Structure.scanSequence i ["integer"; "string"]
    (fun tag _ ->
       match tag with
       | "integer" ->
           r_integer :=
             (Some
                (Read.element_value i "integer" Primitive.int_of_string ()))
       | "string" ->
           r_string_ := (Some (Read.element_value i "string" Fun.id ()))
       | _ -> Read.skip_element i);
  ((match ( ! ) r_integer with
    | Some v -> Integer v
    | None ->
        (match ( ! ) r_string_ with
         | Some v -> String v
         | None -> failwith "no union member present in xml response")) : 
  foo_union)
let union_set_of_xml i =
  Read.sequences i "member" (fun i _ -> foo_union_of_xml i) ()
let timestamp_set_of_xml i =
  Read.elements_value i "member" Primitive.timestamp_iso_of_string ()
let timestamp_list_of_xml i =
  Read.elements_value i "member" Primitive.timestamp_iso_of_string ()
let text_plain_blob_of_xml i = Primitive.blob_of_string (Read.data i)
let greeting_struct_of_xml i =
  let r_hi = ref None in
  Structure.scanSequence i ["hi"]
    (fun tag _ ->
       match tag with
       | "hi" -> r_hi := (Some (Read.element_value i "hi" Fun.id ()))
       | _ -> Read.skip_element i);
  ({ hi = (( ! ) r_hi) } : greeting_struct)
let structure_set_of_xml i =
  Read.sequences i "member" (fun i _ -> greeting_struct_of_xml i) ()
let string_set_of_xml i = Read.elements_value i "member" Fun.id ()
let string_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
       let k = Read.element_value i "key" Fun.id () in
       let v = Read.element_value i "value" Fun.id () in (k, v)) ()
let string_list_of_xml i = Read.elements_value i "member" Fun.id ()
let string_list_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
       let k = Read.element_value i "key" Fun.id () in
       let v = Read.sequence i "value" (fun i _ -> string_list_of_xml i) () in
       (k, v)) ()
let sparse_string_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
       let k = Read.element_value i "key" Fun.id () in
       let v = Read.element_value i "value" Fun.id () in (k, v)) ()
let sparse_string_list_of_xml i = Read.elements_value i "member" Fun.id ()
let sparse_short_list_of_xml i =
  Read.elements_value i "member" Primitive.int_of_string ()
let short_set_of_xml i =
  Read.elements_value i "member" Primitive.int_of_string ()
let short_list_of_xml i =
  Read.elements_value i "member" Primitive.int_of_string ()
let nested_string_list_of_xml i =
  Read.sequences i "member" (fun i _ -> string_list_of_xml i) ()
let long_set_of_xml i =
  Read.elements_value i "member" Primitive.long_of_string ()
let long_list_of_xml i =
  Read.elements_value i "member" Primitive.long_of_string ()
let list_set_of_xml i =
  Read.sequences i "member" (fun i _ -> string_list_of_xml i) ()
let jpeg_blob_of_xml i = Primitive.blob_of_string (Read.data i)
let integer_set_of_xml i =
  Read.elements_value i "member" Primitive.int_of_string ()
let integer_list_of_xml i =
  Read.elements_value i "member" Primitive.int_of_string ()
let integer_enum_of_xml i =
  let s = Read.data i in
  (match s with
   | "3" -> C
   | "2" -> B
   | "1" -> A
   | _ -> failwith "unknown enum value" : integer_enum)
let integer_enum_set_of_xml i =
  Read.sequences i "member" (fun i _ -> integer_enum_of_xml i) ()
let integer_enum_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
       let k = Read.element_value i "key" Fun.id () in
       let v = Read.sequence i "value" (fun i _ -> integer_enum_of_xml i) () in
       (k, v)) ()
let integer_enum_list_of_xml i =
  Read.sequences i "member" (fun i _ -> integer_enum_of_xml i) ()
let http_date_of_xml i = Primitive.timestamp_httpdate_of_string (Read.data i)
let http_date_set_of_xml i =
  Read.sequences i "member" (fun i _ -> http_date_of_xml i) ()
let greeting_list_of_xml i =
  Read.sequences i "member" (fun i _ -> greeting_struct_of_xml i) ()
let foo_enum_of_xml i =
  let s = Read.data i in
  (match s with
   | "0" -> ZERO
   | "1" -> ONE
   | "Bar" -> BAR
   | "Baz" -> BAZ
   | "Foo" -> FOO
   | _ -> failwith "unknown enum value" : foo_enum)
let foo_enum_set_of_xml i =
  Read.sequences i "member" (fun i _ -> foo_enum_of_xml i) ()
let foo_enum_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
       let k = Read.element_value i "key" Fun.id () in
       let v = Read.sequence i "value" (fun i _ -> foo_enum_of_xml i) () in
       (k, v)) ()
let foo_enum_list_of_xml i =
  Read.sequences i "member" (fun i _ -> foo_enum_of_xml i) ()
let float_list_of_xml i =
  Read.elements_value i "member" Primitive.float_of_string ()
let epoch_seconds_of_xml i =
  Primitive.timestamp_epoch_of_string (Read.data i)
let double_list_of_xml i =
  Read.elements_value i "member" Primitive.double_of_string ()
let date_time_of_xml i = Primitive.timestamp_iso_of_string (Read.data i)
let date_time_set_of_xml i =
  Read.sequences i "member" (fun i _ -> date_time_of_xml i) ()
let date_time_list_of_xml i =
  Read.sequences i "member" (fun i _ -> date_time_of_xml i) ()
let byte_set_of_xml i =
  Read.elements_value i "member" Primitive.int_of_string ()
let byte_list_of_xml i =
  Read.elements_value i "member" Primitive.int_of_string ()
let boolean_set_of_xml i =
  Read.elements_value i "member" Primitive.bool_of_string ()
let boolean_list_of_xml i =
  Read.elements_value i "member" Primitive.bool_of_string ()
let blob_set_of_xml i =
  Read.elements_value i "member" Primitive.blob_of_string ()
let blob_list_of_xml i =
  Read.elements_value i "member" Primitive.blob_of_string ()