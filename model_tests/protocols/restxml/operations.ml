open Types
open Service_metadata
open Xml_deserializers
open Xml_serializers
open Smaws_Lib.Xml.Parse

module SimpleScalarProperties = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : simple_scalar_properties_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/SimpleScalarProperties" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("X-Foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "SimpleScalarPropertiesRequest" (fun w ->
          simple_scalar_properties_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"SimpleScalarProperties" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_string_value = ref None in
            let r_true_boolean_value = ref None in
            let r_false_boolean_value = ref None in
            let r_byte_value = ref None in
            let r_short_value = ref None in
            let r_integer_value = ref None in
            let r_long_value = ref None in
            let r_float_value = ref None in
            let r_double_value = ref None in
            Structure.scanSequence i
              [
                "stringValue";
                "trueBooleanValue";
                "falseBooleanValue";
                "byteValue";
                "shortValue";
                "integerValue";
                "longValue";
                "floatValue";
                "DoubleDribble";
              ] (fun tag _ ->
                match tag with
                | "stringValue" ->
                    r_string_value := Some (Read.element_value i "stringValue" Fun.id ())
                | "trueBooleanValue" ->
                    r_true_boolean_value :=
                      Some (Read.element_value i "trueBooleanValue" Primitive.bool_of_string ())
                | "falseBooleanValue" ->
                    r_false_boolean_value :=
                      Some (Read.element_value i "falseBooleanValue" Primitive.bool_of_string ())
                | "byteValue" ->
                    r_byte_value :=
                      Some (Read.element_value i "byteValue" Primitive.int_of_string ())
                | "shortValue" ->
                    r_short_value :=
                      Some (Read.element_value i "shortValue" Primitive.int_of_string ())
                | "integerValue" ->
                    r_integer_value :=
                      Some (Read.element_value i "integerValue" Primitive.int_of_string ())
                | "longValue" ->
                    r_long_value :=
                      Some (Read.element_value i "longValue" Primitive.long_of_string ())
                | "floatValue" ->
                    r_float_value :=
                      Some (Read.element_value i "floatValue" Primitive.float_of_string ())
                | "DoubleDribble" ->
                    r_double_value :=
                      Some (Read.element_value i "DoubleDribble" Primitive.double_of_string ())
                | _ -> Read.skip_element i);
            ({
               foo =
                 Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-Foo");
               string_value = ( ! ) r_string_value;
               true_boolean_value = ( ! ) r_true_boolean_value;
               false_boolean_value = ( ! ) r_false_boolean_value;
               byte_value = ( ! ) r_byte_value;
               short_value = ( ! ) r_short_value;
               integer_value = ( ! ) r_integer_value;
               long_value = ( ! ) r_long_value;
               float_value = ( ! ) r_float_value;
               double_value = ( ! ) r_double_value;
             }
              : simple_scalar_properties_response)))
      ~error_deserializer
end

module TimestampFormatHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : timestamp_format_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/TimestampFormatHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.member_epoch_seconds with
          | Some v ->
              [
                ( "X-memberEpochSeconds",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v) v );
              ]
          | None -> []);
          (match request.member_http_date with
          | Some v ->
              [
                ( "X-memberHttpDate",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.member_date_time with
          | Some v ->
              [
                ( "X-memberDateTime",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
          (match request.default_format with
          | Some v ->
              [
                ( "X-defaultFormat",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.target_epoch_seconds with
          | Some v ->
              [
                ( "X-targetEpochSeconds",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v) v );
              ]
          | None -> []);
          (match request.target_http_date with
          | Some v ->
              [
                ( "X-targetHttpDate",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v) v
                );
              ]
          | None -> []);
          (match request.target_date_time with
          | Some v ->
              [
                ( "X-targetDateTime",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"TimestampFormatHeaders" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           member_epoch_seconds =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_epoch_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-memberEpochSeconds");
           member_http_date =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-memberHttpDate");
           member_date_time =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-memberDateTime");
           default_format =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-defaultFormat");
           target_epoch_seconds =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_epoch_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-targetEpochSeconds");
           target_http_date =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-targetHttpDate");
           target_date_time =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-targetDateTime");
         }
          : timestamp_format_headers_i_o))
      ~error_deserializer
end

module XmlAttributes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlAttributes" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlAttributesRequest"
        ~attrs:
          (List.concat [ (match request.attr with Some s -> [ ("test", s, None) ] | None -> []) ])
        (fun w -> xml_attributes_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributes" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_foo = ref None in
            Structure.scanSequence i [ "foo" ] (fun tag _ ->
                match tag with
                | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
                | _ -> Read.skip_element i);
            ({
               foo = ( ! ) r_foo;
               attr =
                 Option.map
                   (fun s -> s)
                   (List.find_map
                      (fun ((_, n), v) -> if String.equal n "test" then Some v else None)
                      attrs);
             }
              : xml_attributes_response)))
      ~error_deserializer
end

module XmlAttributesInMiddle = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_in_middle_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlAttributesInMiddle" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.payload with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "XmlAttributesInMiddlePayloadRequest"
            ~attrs:
              (List.concat [ (match v.attr with Some s -> [ ("test", s, None) ] | None -> []) ])
            (fun w -> xml_attributes_in_middle_payload_request_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributesInMiddle" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_foo = ref None in
                   let r_baz = ref None in
                   Structure.scanSequence i [ "foo"; "baz" ] (fun tag _ ->
                       match tag with
                       | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
                       | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
                       | _ -> Read.skip_element i);
                   ({
                      foo = ( ! ) r_foo;
                      attr =
                        Option.map
                          (fun s -> s)
                          (List.find_map
                             (fun ((_, n), v) -> if String.equal n "test" then Some v else None)
                             attrs);
                      baz = ( ! ) r_baz;
                    }
                     : xml_attributes_in_middle_payload_response))))
        in
        ({ payload = payload_val } : xml_attributes_in_middle_response))
      ~error_deserializer
end

module XmlAttributesOnPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_attributes_on_payload_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlAttributesOnPayload" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.payload with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "XmlAttributesPayloadRequest"
            ~attrs:
              (List.concat [ (match v.attr with Some s -> [ ("test", s, None) ] | None -> []) ])
            (fun w -> xml_attributes_payload_request_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlAttributesOnPayload" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_foo = ref None in
                   Structure.scanSequence i [ "foo" ] (fun tag _ ->
                       match tag with
                       | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
                       | _ -> Read.skip_element i);
                   ({
                      foo = ( ! ) r_foo;
                      attr =
                        Option.map
                          (fun s -> s)
                          (List.find_map
                             (fun ((_, n), v) -> if String.equal n "test" then Some v else None)
                             attrs);
                    }
                     : xml_attributes_payload_response))))
        in
        ({ payload = payload_val } : xml_attributes_on_payload_response))
      ~error_deserializer
end

module XmlBlobs = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_blobs_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlBlobs" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlBlobsRequest" (fun w -> xml_blobs_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlBlobs" ~service ~context ~method_:`POST ~uri
      ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_data = ref None in
            Structure.scanSequence i [ "data" ] (fun tag _ ->
                match tag with
                | "data" -> r_data := Some (Read.element_value i "data" Primitive.blob_of_string ())
                | _ -> Read.skip_element i);
            ({ data = ( ! ) r_data } : xml_blobs_response)))
      ~error_deserializer
end

module XmlEmptyBlobs = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_blobs_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyBlobs" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyBlobsRequest" (fun w ->
          xml_empty_blobs_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyBlobs" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_data = ref None in
            Structure.scanSequence i [ "data" ] (fun tag _ ->
                match tag with
                | "data" -> r_data := Some (Read.element_value i "data" Primitive.blob_of_string ())
                | _ -> Read.skip_element i);
            ({ data = ( ! ) r_data } : xml_empty_blobs_response)))
      ~error_deserializer
end

module XmlEmptyLists = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_lists_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyLists" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyListsRequest" (fun w ->
          xml_empty_lists_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyLists" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_string_list = ref None in
            let r_string_set = ref None in
            let r_integer_list = ref None in
            let r_boolean_list = ref None in
            let r_timestamp_list = ref None in
            let r_enum_list = ref None in
            let r_int_enum_list = ref None in
            let r_nested_string_list = ref None in
            let r_renamed_list_members = ref None in
            let r_flattened_list = ref None in
            let r_flattened_list2 = ref None in
            let r_flattened_list_with_member_namespace = ref None in
            let r_flattened_list_with_namespace = ref None in
            let r_structure_list = ref None in
            let r_flattened_structure_list = ref None in
            Structure.scanSequence i
              [
                "stringList";
                "stringSet";
                "integerList";
                "booleanList";
                "timestampList";
                "enumList";
                "intEnumList";
                "nestedStringList";
                "renamed";
                "flattenedList";
                "customName";
                "flattenedListWithMemberNamespace";
                "flattenedListWithNamespace";
                "myStructureList";
                "flattenedStructureList";
              ] (fun tag _ ->
                match tag with
                | "stringList" ->
                    r_string_list :=
                      Some
                        (Read.sequence i "stringList"
                           (fun i _ -> Read.elements_value i "member" Fun.id ())
                           ())
                | "stringSet" ->
                    r_string_set :=
                      Some
                        (Read.sequence i "stringSet"
                           (fun i _ -> Read.elements_value i "member" Fun.id ())
                           ())
                | "integerList" ->
                    r_integer_list :=
                      Some
                        (Read.sequence i "integerList"
                           (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                           ())
                | "booleanList" ->
                    r_boolean_list :=
                      Some
                        (Read.sequence i "booleanList"
                           (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                           ())
                | "timestampList" ->
                    r_timestamp_list :=
                      Some
                        (Read.sequence i "timestampList"
                           (fun i _ ->
                             Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                           ())
                | "enumList" ->
                    r_enum_list :=
                      Some
                        (Read.sequence i "enumList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                               ())
                           ())
                | "intEnumList" ->
                    r_int_enum_list :=
                      Some
                        (Read.sequence i "intEnumList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                               ())
                           ())
                | "nestedStringList" ->
                    r_nested_string_list :=
                      Some
                        (Read.sequence i "nestedStringList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                               ())
                           ())
                | "renamed" ->
                    r_renamed_list_members :=
                      Some
                        (Read.sequence i "renamed"
                           (fun i _ -> Read.elements_value i "item" Fun.id ())
                           ())
                | "flattenedList" ->
                    r_flattened_list := Some (Read.elements_value i "flattenedList" Fun.id ())
                | "customName" ->
                    r_flattened_list2 := Some (Read.elements_value i "customName" Fun.id ())
                | "flattenedListWithMemberNamespace" ->
                    r_flattened_list_with_member_namespace :=
                      Some (Read.elements_value i "flattenedListWithMemberNamespace" Fun.id ())
                | "flattenedListWithNamespace" ->
                    r_flattened_list_with_namespace :=
                      Some (Read.elements_value i "flattenedListWithNamespace" Fun.id ())
                | "myStructureList" ->
                    r_structure_list :=
                      Some
                        (Read.sequence i "myStructureList"
                           (fun i _ ->
                             Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ())
                           ())
                | "flattenedStructureList" ->
                    r_flattened_structure_list :=
                      Some
                        (Read.sequences i "flattenedStructureList"
                           (fun i _ -> structure_list_member_of_xml i)
                           ())
                | _ -> Read.skip_element i);
            ({
               string_list = ( ! ) r_string_list;
               string_set = ( ! ) r_string_set;
               integer_list = ( ! ) r_integer_list;
               boolean_list = ( ! ) r_boolean_list;
               timestamp_list = ( ! ) r_timestamp_list;
               enum_list = ( ! ) r_enum_list;
               int_enum_list = ( ! ) r_int_enum_list;
               nested_string_list = ( ! ) r_nested_string_list;
               renamed_list_members = ( ! ) r_renamed_list_members;
               flattened_list = ( ! ) r_flattened_list;
               flattened_list2 = ( ! ) r_flattened_list2;
               flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
               flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
               structure_list = ( ! ) r_structure_list;
               flattened_structure_list = ( ! ) r_flattened_structure_list;
             }
              : xml_empty_lists_response)))
      ~error_deserializer
end

module XmlEmptyMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_maps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyMaps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyMapsRequest" (fun w ->
          xml_empty_maps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyMaps" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_my_map = ref None in
            Structure.scanSequence i [ "myMap" ] (fun tag _ ->
                match tag with
                | "myMap" ->
                    r_my_map :=
                      Some
                        (Read.sequence i "myMap"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "key" Fun.id () in
                                 let v =
                                   Read.sequence i "value"
                                     (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                                     ()
                                 in
                                 (k, v))
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({ my_map = ( ! ) r_my_map } : xml_empty_maps_response)))
      ~error_deserializer
end

module XmlEmptyStrings = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_empty_strings_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEmptyStrings" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEmptyStringsRequest" (fun w ->
          xml_empty_strings_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEmptyStrings" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_empty_string = ref None in
            Structure.scanSequence i [ "emptyString" ] (fun tag _ ->
                match tag with
                | "emptyString" ->
                    r_empty_string := Some (Read.element_value i "emptyString" Fun.id ())
                | _ -> Read.skip_element i);
            ({ empty_string = ( ! ) r_empty_string } : xml_empty_strings_response)))
      ~error_deserializer
end

module XmlEnums = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_enums_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlEnums" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlEnumsRequest" (fun w -> xml_enums_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlEnums" ~service ~context ~method_:`PUT ~uri
      ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_foo_enum1 = ref None in
            let r_foo_enum2 = ref None in
            let r_foo_enum3 = ref None in
            let r_foo_enum_list = ref None in
            let r_foo_enum_set = ref None in
            let r_foo_enum_map = ref None in
            Structure.scanSequence i
              [ "fooEnum1"; "fooEnum2"; "fooEnum3"; "fooEnumList"; "fooEnumSet"; "fooEnumMap" ]
              (fun tag _ ->
                match tag with
                | "fooEnum1" ->
                    r_foo_enum1 :=
                      Some
                        (Read.sequence i "fooEnum1"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                           ())
                | "fooEnum2" ->
                    r_foo_enum2 :=
                      Some
                        (Read.sequence i "fooEnum2"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                           ())
                | "fooEnum3" ->
                    r_foo_enum3 :=
                      Some
                        (Read.sequence i "fooEnum3"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                           ())
                | "fooEnumList" ->
                    r_foo_enum_list :=
                      Some
                        (Read.sequence i "fooEnumList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                               ())
                           ())
                | "fooEnumSet" ->
                    r_foo_enum_set :=
                      Some
                        (Read.sequence i "fooEnumSet"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                               ())
                           ())
                | "fooEnumMap" ->
                    r_foo_enum_map :=
                      Some
                        (Read.sequence i "fooEnumMap"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "key" Fun.id () in
                                 let v =
                                   Read.sequence i "value"
                                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                                     ()
                                 in
                                 (k, v))
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({
               foo_enum1 = ( ! ) r_foo_enum1;
               foo_enum2 = ( ! ) r_foo_enum2;
               foo_enum3 = ( ! ) r_foo_enum3;
               foo_enum_list = ( ! ) r_foo_enum_list;
               foo_enum_set = ( ! ) r_foo_enum_set;
               foo_enum_map = ( ! ) r_foo_enum_map;
             }
              : xml_enums_response)))
      ~error_deserializer
end

module XmlIntEnums = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_int_enums_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlIntEnums" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlIntEnumsRequest" (fun w ->
          xml_int_enums_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlIntEnums" ~service ~context ~method_:`PUT
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_int_enum1 = ref None in
            let r_int_enum2 = ref None in
            let r_int_enum3 = ref None in
            let r_int_enum_list = ref None in
            let r_int_enum_set = ref None in
            let r_int_enum_map = ref None in
            Structure.scanSequence i
              [ "intEnum1"; "intEnum2"; "intEnum3"; "intEnumList"; "intEnumSet"; "intEnumMap" ]
              (fun tag _ ->
                match tag with
                | "intEnum1" ->
                    r_int_enum1 :=
                      Some
                        (Read.sequence i "intEnum1"
                           (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                           ())
                | "intEnum2" ->
                    r_int_enum2 :=
                      Some
                        (Read.sequence i "intEnum2"
                           (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                           ())
                | "intEnum3" ->
                    r_int_enum3 :=
                      Some
                        (Read.sequence i "intEnum3"
                           (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                           ())
                | "intEnumList" ->
                    r_int_enum_list :=
                      Some
                        (Read.sequence i "intEnumList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                               ())
                           ())
                | "intEnumSet" ->
                    r_int_enum_set :=
                      Some
                        (Read.sequence i "intEnumSet"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                               ())
                           ())
                | "intEnumMap" ->
                    r_int_enum_map :=
                      Some
                        (Read.sequence i "intEnumMap"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "key" Fun.id () in
                                 let v =
                                   Read.sequence i "value"
                                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                                     ()
                                 in
                                 (k, v))
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({
               int_enum1 = ( ! ) r_int_enum1;
               int_enum2 = ( ! ) r_int_enum2;
               int_enum3 = ( ! ) r_int_enum3;
               int_enum_list = ( ! ) r_int_enum_list;
               int_enum_set = ( ! ) r_int_enum_set;
               int_enum_map = ( ! ) r_int_enum_map;
             }
              : xml_int_enums_response)))
      ~error_deserializer
end

module XmlLists = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_lists_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlLists" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlListsRequest" (fun w -> xml_lists_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlLists" ~service ~context ~method_:`PUT ~uri
      ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_string_list = ref None in
            let r_string_set = ref None in
            let r_integer_list = ref None in
            let r_boolean_list = ref None in
            let r_timestamp_list = ref None in
            let r_enum_list = ref None in
            let r_int_enum_list = ref None in
            let r_nested_string_list = ref None in
            let r_renamed_list_members = ref None in
            let r_flattened_list = ref None in
            let r_flattened_list2 = ref None in
            let r_flattened_list_with_member_namespace = ref None in
            let r_flattened_list_with_namespace = ref None in
            let r_structure_list = ref None in
            let r_flattened_structure_list = ref None in
            Structure.scanSequence i
              [
                "stringList";
                "stringSet";
                "integerList";
                "booleanList";
                "timestampList";
                "enumList";
                "intEnumList";
                "nestedStringList";
                "renamed";
                "flattenedList";
                "customName";
                "flattenedListWithMemberNamespace";
                "flattenedListWithNamespace";
                "myStructureList";
                "flattenedStructureList";
              ] (fun tag _ ->
                match tag with
                | "stringList" ->
                    r_string_list :=
                      Some
                        (Read.sequence i "stringList"
                           (fun i _ -> Read.elements_value i "member" Fun.id ())
                           ())
                | "stringSet" ->
                    r_string_set :=
                      Some
                        (Read.sequence i "stringSet"
                           (fun i _ -> Read.elements_value i "member" Fun.id ())
                           ())
                | "integerList" ->
                    r_integer_list :=
                      Some
                        (Read.sequence i "integerList"
                           (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                           ())
                | "booleanList" ->
                    r_boolean_list :=
                      Some
                        (Read.sequence i "booleanList"
                           (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                           ())
                | "timestampList" ->
                    r_timestamp_list :=
                      Some
                        (Read.sequence i "timestampList"
                           (fun i _ ->
                             Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                           ())
                | "enumList" ->
                    r_enum_list :=
                      Some
                        (Read.sequence i "enumList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                               ())
                           ())
                | "intEnumList" ->
                    r_int_enum_list :=
                      Some
                        (Read.sequence i "intEnumList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                               ())
                           ())
                | "nestedStringList" ->
                    r_nested_string_list :=
                      Some
                        (Read.sequence i "nestedStringList"
                           (fun i _ ->
                             Read.sequences i "member"
                               (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                               ())
                           ())
                | "renamed" ->
                    r_renamed_list_members :=
                      Some
                        (Read.sequence i "renamed"
                           (fun i _ -> Read.elements_value i "item" Fun.id ())
                           ())
                | "flattenedList" ->
                    r_flattened_list := Some (Read.elements_value i "flattenedList" Fun.id ())
                | "customName" ->
                    r_flattened_list2 := Some (Read.elements_value i "customName" Fun.id ())
                | "flattenedListWithMemberNamespace" ->
                    r_flattened_list_with_member_namespace :=
                      Some (Read.elements_value i "flattenedListWithMemberNamespace" Fun.id ())
                | "flattenedListWithNamespace" ->
                    r_flattened_list_with_namespace :=
                      Some (Read.elements_value i "flattenedListWithNamespace" Fun.id ())
                | "myStructureList" ->
                    r_structure_list :=
                      Some
                        (Read.sequence i "myStructureList"
                           (fun i _ ->
                             Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ())
                           ())
                | "flattenedStructureList" ->
                    r_flattened_structure_list :=
                      Some
                        (Read.sequences i "flattenedStructureList"
                           (fun i _ -> structure_list_member_of_xml i)
                           ())
                | _ -> Read.skip_element i);
            ({
               string_list = ( ! ) r_string_list;
               string_set = ( ! ) r_string_set;
               integer_list = ( ! ) r_integer_list;
               boolean_list = ( ! ) r_boolean_list;
               timestamp_list = ( ! ) r_timestamp_list;
               enum_list = ( ! ) r_enum_list;
               int_enum_list = ( ! ) r_int_enum_list;
               nested_string_list = ( ! ) r_nested_string_list;
               renamed_list_members = ( ! ) r_renamed_list_members;
               flattened_list = ( ! ) r_flattened_list;
               flattened_list2 = ( ! ) r_flattened_list2;
               flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
               flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
               structure_list = ( ! ) r_structure_list;
               flattened_structure_list = ( ! ) r_flattened_structure_list;
             }
              : xml_lists_response)))
      ~error_deserializer
end

module XmlMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_maps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlMaps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlMapsRequest" (fun w -> xml_maps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMaps" ~service ~context ~method_:`POST ~uri
      ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_my_map = ref None in
            Structure.scanSequence i [ "myMap" ] (fun tag _ ->
                match tag with
                | "myMap" ->
                    r_my_map :=
                      Some
                        (Read.sequence i "myMap"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "key" Fun.id () in
                                 let v =
                                   Read.sequence i "value"
                                     (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                                     ()
                                 in
                                 (k, v))
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({ my_map = ( ! ) r_my_map } : xml_maps_response)))
      ~error_deserializer
end

module XmlMapsXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_maps_xml_name_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlMapsXmlName" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlMapsXmlNameRequest" (fun w ->
          xml_maps_xml_name_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMapsXmlName" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_my_map = ref None in
            Structure.scanSequence i [ "myMap" ] (fun tag _ ->
                match tag with
                | "myMap" ->
                    r_my_map :=
                      Some
                        (Read.sequence i "myMap"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "Attribute" Fun.id () in
                                 let v =
                                   Read.sequence i "Setting"
                                     (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                                     ()
                                 in
                                 (k, v))
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({ my_map = ( ! ) r_my_map } : xml_maps_xml_name_response)))
      ~error_deserializer
end

module XmlMapWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_map_with_xml_namespace_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlMapWithXmlNamespace" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlMapWithXmlNamespaceRequest" (fun w ->
          xml_map_with_xml_namespace_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlMapWithXmlNamespace" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_my_map = ref None in
            Structure.scanSequence i [ "KVP" ] (fun tag _ ->
                match tag with
                | "KVP" ->
                    r_my_map :=
                      Some
                        (Read.sequence i "KVP"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "K" Fun.id () in
                                 let v = Read.element_value i "V" Fun.id () in
                                 (k, v))
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({ my_map = ( ! ) r_my_map } : xml_map_with_xml_namespace_response)))
      ~error_deserializer
end

module XmlNamespaces = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_namespaces_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlNamespaces" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlNamespacesRequest" ~ns:"http://foo.com" (fun w ->
          xml_namespaces_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlNamespaces" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_nested = ref None in
            Structure.scanSequence i [ "nested" ] (fun tag _ ->
                match tag with
                | "nested" ->
                    r_nested :=
                      Some (Read.sequence i "nested" (fun i _ -> xml_namespace_nested_of_xml i) ())
                | _ -> Read.skip_element i);
            ({ nested = ( ! ) r_nested } : xml_namespaces_response)))
      ~error_deserializer
end

module XmlTimestamps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_timestamps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlTimestamps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlTimestampsRequest" (fun w ->
          xml_timestamps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlTimestamps" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_normal = ref None in
            let r_date_time = ref None in
            let r_date_time_on_target = ref None in
            let r_epoch_seconds = ref None in
            let r_epoch_seconds_on_target = ref None in
            let r_http_date = ref None in
            let r_http_date_on_target = ref None in
            Structure.scanSequence i
              [
                "normal";
                "dateTime";
                "dateTimeOnTarget";
                "epochSeconds";
                "epochSecondsOnTarget";
                "httpDate";
                "httpDateOnTarget";
              ] (fun tag _ ->
                match tag with
                | "normal" ->
                    r_normal :=
                      Some (Read.element_value i "normal" Primitive.timestamp_iso_of_string ())
                | "dateTime" ->
                    r_date_time :=
                      Some (Read.element_value i "dateTime" Primitive.timestamp_iso_of_string ())
                | "dateTimeOnTarget" ->
                    r_date_time_on_target :=
                      Some
                        (Read.sequence i "dateTimeOnTarget"
                           (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                           ())
                | "epochSeconds" ->
                    r_epoch_seconds :=
                      Some
                        (Read.element_value i "epochSeconds" Primitive.timestamp_epoch_of_string ())
                | "epochSecondsOnTarget" ->
                    r_epoch_seconds_on_target :=
                      Some
                        (Read.sequence i "epochSecondsOnTarget"
                           (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                           ())
                | "httpDate" ->
                    r_http_date :=
                      Some
                        (Read.element_value i "httpDate" Primitive.timestamp_httpdate_of_string ())
                | "httpDateOnTarget" ->
                    r_http_date_on_target :=
                      Some
                        (Read.sequence i "httpDateOnTarget"
                           (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                           ())
                | _ -> Read.skip_element i);
            ({
               normal = ( ! ) r_normal;
               date_time = ( ! ) r_date_time;
               date_time_on_target = ( ! ) r_date_time_on_target;
               epoch_seconds = ( ! ) r_epoch_seconds;
               epoch_seconds_on_target = ( ! ) r_epoch_seconds_on_target;
               http_date = ( ! ) r_http_date;
               http_date_on_target = ( ! ) r_http_date_on_target;
             }
              : xml_timestamps_response)))
      ~error_deserializer
end

module XmlUnions = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : xml_unions_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/XmlUnions" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "XmlUnionsRequest" (fun w ->
          xml_unions_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"XmlUnions" ~service ~context ~method_:`PUT ~uri
      ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_union_value = ref None in
            Structure.scanSequence i [ "unionValue" ] (fun tag _ ->
                match tag with
                | "unionValue" ->
                    r_union_value :=
                      Some (Read.sequence i "unionValue" (fun i _ -> xml_union_shape_of_xml i) ())
                | _ -> Read.skip_element i);
            ({ union_value = ( ! ) r_union_value } : xml_unions_response)))
      ~error_deserializer
end

module RecursiveShapes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : recursive_shapes_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/RecursiveShapes" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "RecursiveShapesRequest" (fun w ->
          recursive_shapes_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"RecursiveShapes" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_nested = ref None in
            Structure.scanSequence i [ "nested" ] (fun tag _ ->
                match tag with
                | "nested" ->
                    r_nested :=
                      Some
                        (Read.sequence i "nested"
                           (fun i _ -> recursive_shapes_input_output_nested1_of_xml i)
                           ())
                | _ -> Read.skip_element i);
            ({ nested = ( ! ) r_nested } : recursive_shapes_response)))
      ~error_deserializer
end

module QueryPrecedence = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_precedence_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/Precedence" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [ (match request.foo with Some v -> [ ("bar", [ (fun v -> v) v ]) ] | None -> []) ]
    in
    let map_params =
      List.concat
        [
          (match request.baz with
          | Some v -> List.map (fun (k, v) -> (k, [ (fun v -> v) v ])) v
          | None -> []);
        ]
    in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryPrecedence" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module QueryParamsAsStringListMap = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_params_as_string_list_map_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/StringListMap" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [ (match request.qux with Some v -> [ ("corge", [ (fun v -> v) v ]) ] | None -> []) ]
    in
    let map_params =
      List.concat
        [
          (match request.foo with
          | Some v -> List.map (fun (k, vs) -> (k, List.map (fun v -> v) vs)) v
          | None -> []);
        ]
    in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryParamsAsStringListMap" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module QueryIdempotencyTokenAutoFill = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : query_idempotency_token_auto_fill_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/QueryIdempotencyTokenAutoFill"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let request =
      {
        token =
          (match request.token with Some t -> Some t | None -> Some (Smaws_Lib.Uuid.generate ()));
      }
    in
    let named_params =
      List.concat
        [ (match request.token with Some v -> [ ("token", [ (fun v -> v) v ]) ] | None -> []) ]
    in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"QueryIdempotencyTokenAutoFill" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module PutWithContentEncoding = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : put_with_content_encoding_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/requestcompression/putcontentwithencoding" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.encoding with
          | Some v -> [ ("Content-Encoding", (fun v -> v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "PutWithContentEncodingInput" (fun w ->
          put_with_content_encoding_input_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"PutWithContentEncoding" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module OmitsNullSerializesEmptyString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : omits_null_serializes_empty_string_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/OmitsNullSerializesEmptyString"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [
          (match request.null_value with Some v -> [ ("Null", [ (fun v -> v) v ]) ] | None -> []);
          (match request.empty_string with
          | Some v -> [ ("Empty", [ (fun v -> v) v ]) ]
          | None -> []);
        ]
    in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"OmitsNullSerializesEmptyString" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module NullAndEmptyHeadersServer = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : null_and_empty_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NullAndEmptyHeadersServer" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.a with Some v -> [ ("X-A", (fun v -> v) v) ] | None -> []);
          (match request.b with Some v -> [ ("X-B", (fun v -> v) v) ] | None -> []);
          (match request.c with
          | Some v -> [ ("X-C", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NullAndEmptyHeadersServer" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           a = Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-A");
           b = Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-B");
           c =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim |> List.map (fun s -> s))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-C");
         }
          : null_and_empty_headers_i_o))
      ~error_deserializer
end

module NullAndEmptyHeadersClient = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : null_and_empty_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NullAndEmptyHeadersClient" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.a with Some v -> [ ("X-A", (fun v -> v) v) ] | None -> []);
          (match request.b with Some v -> [ ("X-B", (fun v -> v) v) ] | None -> []);
          (match request.c with
          | Some v -> [ ("X-C", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NullAndEmptyHeadersClient" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           a = Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-A");
           b = Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-B");
           c =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim |> List.map (fun s -> s))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-C");
         }
          : null_and_empty_headers_i_o))
      ~error_deserializer
end

module NoInputAndOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NoInputAndOutputOutput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NoInputAndOutput" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module NoInputAndNoOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NoInputAndNoOutput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NoInputAndNoOutput" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module NestedXmlMaps = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : nested_xml_maps_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/NestedXmlMaps" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "NestedXmlMapsRequest" (fun w ->
          nested_xml_maps_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NestedXmlMaps" ~service ~context ~method_:`POST
      ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_nested_map = ref None in
            let r_flat_nested_map = ref None in
            Structure.scanSequence i [ "nestedMap"; "flatNestedMap" ] (fun tag _ ->
                match tag with
                | "nestedMap" ->
                    r_nested_map :=
                      Some
                        (Read.sequence i "nestedMap"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "key" Fun.id () in
                                 let v =
                                   Read.sequence i "value"
                                     (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                                     ()
                                 in
                                 (k, v))
                               ())
                           ())
                | "flatNestedMap" ->
                    r_flat_nested_map :=
                      Some
                        (Read.sequences i "flatNestedMap"
                           (fun i _ ->
                             let k = Read.element_value i "key" Fun.id () in
                             let v =
                               Read.sequence i "value"
                                 (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                                 ()
                             in
                             (k, v))
                           ())
                | _ -> Read.skip_element i);
            ({ nested_map = ( ! ) r_nested_map; flat_nested_map = ( ! ) r_flat_nested_map }
              : nested_xml_maps_response)))
      ~error_deserializer
end

module NestedXmlMapWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : nested_xml_map_with_xml_name_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/NestedXmlMapWithXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "NestedXmlMapWithXmlNameRequest" (fun w ->
          nested_xml_map_with_xml_name_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"NestedXmlMapWithXmlName" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_nested_xml_map_with_xml_name_map = ref None in
            Structure.scanSequence i [ "nestedXmlMapWithXmlNameMap" ] (fun tag _ ->
                match tag with
                | "nestedXmlMapWithXmlNameMap" ->
                    r_nested_xml_map_with_xml_name_map :=
                      Some
                        (Read.sequence i "nestedXmlMapWithXmlNameMap"
                           (fun i _ ->
                             Read.sequences i "entry"
                               (fun i _ ->
                                 let k = Read.element_value i "OuterKey" Fun.id () in
                                 let v =
                                   Read.sequence i "value"
                                     (fun i _ -> nested_xml_map_with_xml_name_inner_map_of_xml i)
                                     ()
                                 in
                                 (k, v))
                               ())
                           ())
                | _ -> Read.skip_element i);
            ({ nested_xml_map_with_xml_name_map = ( ! ) r_nested_xml_map_with_xml_name_map }
              : nested_xml_map_with_xml_name_response)))
      ~error_deserializer
end

module InputAndOutputWithHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : input_and_output_with_headers_i_o) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/InputAndOutputWithHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.header_string with
          | Some v -> [ ("X-String", (fun v -> v) v) ]
          | None -> []);
          (match request.header_byte with
          | Some v -> [ ("X-Byte", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.header_short with
          | Some v -> [ ("X-Short", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.header_integer with
          | Some v -> [ ("X-Integer", (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.header_long with
          | Some v -> [ ("X-Long", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v) ]
          | None -> []);
          (match request.header_float with
          | Some v ->
              [
                ( "X-Float",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v );
              ]
          | None -> []);
          (match request.header_double with
          | Some v ->
              [
                ( "X-Double",
                  (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v );
              ]
          | None -> []);
          (match request.header_true_bool with
          | Some v -> [ ("X-Boolean1", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.header_false_bool with
          | Some v -> [ ("X-Boolean2", (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.header_string_list with
          | Some v -> [ ("X-StringList", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
          (match request.header_string_set with
          | Some v -> [ ("X-StringSet", String.concat ", " (List.map (fun v -> v) v)) ]
          | None -> []);
          (match request.header_integer_list with
          | Some v ->
              [ ("X-IntegerList", String.concat ", " (List.map (fun v -> string_of_int v) v)) ]
          | None -> []);
          (match request.header_boolean_list with
          | Some v ->
              [ ("X-BooleanList", String.concat ", " (List.map (fun v -> string_of_bool v) v)) ]
          | None -> []);
          (match request.header_timestamp_list with
          | Some v ->
              [
                ( "X-TimestampList",
                  String.concat ", "
                    (List.map
                       (fun v ->
                         Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                       v) );
              ]
          | None -> []);
          (match request.header_enum with
          | Some v ->
              [
                ( "X-Enum",
                  (fun v ->
                    match v with
                    | Shared.Types.FOO -> "Foo"
                    | Shared.Types.BAZ -> "Baz"
                    | Shared.Types.BAR -> "Bar"
                    | Shared.Types.ONE -> "1"
                    | Shared.Types.ZERO -> "0")
                    v );
              ]
          | None -> []);
          (match request.header_enum_list with
          | Some v ->
              [
                ( "X-EnumList",
                  String.concat ", "
                    (List.map
                       (fun v ->
                         match v with
                         | Shared.Types.FOO -> "Foo"
                         | Shared.Types.BAZ -> "Baz"
                         | Shared.Types.BAR -> "Bar"
                         | Shared.Types.ONE -> "1"
                         | Shared.Types.ZERO -> "0")
                       v) );
              ]
          | None -> []);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"InputAndOutputWithHeaders" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           header_string =
             Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-String");
           header_byte =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Byte");
           header_short =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Short");
           header_integer =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Integer");
           header_long =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.long_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Long");
           header_float =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.float_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Float");
           header_double =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.double_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Double");
           header_true_bool =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Boolean1");
           header_false_bool =
             Option.map
               (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s)
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Boolean2");
           header_string_list =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim |> List.map (fun s -> s))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-StringList");
           header_string_set =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim |> List.map (fun s -> s))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-StringSet");
           header_integer_list =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim
                 |> List.map (fun s -> Smaws_Lib.Xml.Parse.Primitive.int_of_string s))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-IntegerList");
           header_boolean_list =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim
                 |> List.map (fun s -> Smaws_Lib.Xml.Parse.Primitive.bool_of_string s))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-BooleanList");
           header_timestamp_list =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim
                 |> List.map (fun s -> Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string s))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-TimestampList");
           header_enum =
             Option.map
               (fun s ->
                 match s with
                 | "Foo" -> Shared.Types.FOO
                 | "Baz" -> Shared.Types.BAZ
                 | "Bar" -> Shared.Types.BAR
                 | "1" -> Shared.Types.ONE
                 | "0" -> Shared.Types.ZERO
                 | _ -> failwith "unknown enum value")
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-Enum");
           header_enum_list =
             Option.map
               (fun s ->
                 String.split_on_char ',' s |> List.map String.trim
                 |> List.map (fun s ->
                     match s with
                     | "Foo" -> Shared.Types.FOO
                     | "Baz" -> Shared.Types.BAZ
                     | "Bar" -> Shared.Types.BAR
                     | "1" -> Shared.Types.ONE
                     | "0" -> Shared.Types.ZERO
                     | _ -> failwith "unknown enum value"))
               (Smaws_Lib.Protocols.RestXml.header_value headers "X-EnumList");
         }
          : input_and_output_with_headers_i_o))
      ~error_deserializer
end

module IgnoreQueryParamsInResponse = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/IgnoreQueryParamsInResponse" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"IgnoreQueryParamsInResponse" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_baz = ref None in
            Structure.scanSequence i [ "baz" ] (fun tag _ ->
                match tag with
                | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
                | _ -> Read.skip_element i);
            ({ baz = ( ! ) r_baz } : ignore_query_params_in_response_output)))
      ~error_deserializer
end

module HttpStringPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : string_payload_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/StringPayload" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = match request.payload with Some v -> Some ("text/plain", v) | None -> None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpStringPayload" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({ payload = (if String.equal body "" then None else Some body) } : string_payload_input))
      ~error_deserializer
end

module HttpResponseCode = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpResponseCode" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpResponseCode" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({ status = Some status } : http_response_code_output))
      ~error_deserializer
end

module HttpRequestWithLabelsAndTimestampFormat = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_labels_and_timestamp_format_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:
          "/HttpRequestWithLabelsAndTimestampFormat/{memberEpochSeconds}/{memberHttpDate}/{memberDateTime}/{defaultFormat}/{targetEpochSeconds}/{targetHttpDate}/{targetDateTime}"
        ~labels:
          [
            ( "memberEpochSeconds",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v)
                request.member_epoch_seconds,
              false );
            ( "memberHttpDate",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                request.member_http_date,
              false );
            ( "memberDateTime",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.member_date_time,
              false );
            ( "defaultFormat",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.default_format,
              false );
            ( "targetEpochSeconds",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string v)
                request.target_epoch_seconds,
              false );
            ( "targetHttpDate",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string v)
                request.target_http_date,
              false );
            ( "targetDateTime",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.target_date_time,
              false );
          ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithLabelsAndTimestampFormat"
      ~service ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module HttpRequestWithLabels = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_labels_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:
          "/HttpRequestWithLabels/{string}/{short}/{integer}/{long}/{float}/{double}/{boolean}/{timestamp}"
        ~labels:
          [
            ("string", (fun v -> v) request.string_, false);
            ("short", (fun v -> string_of_int v) request.short, false);
            ("integer", (fun v -> string_of_int v) request.integer, false);
            ("long", (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) request.long, false);
            ( "float",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.float_,
              false );
            ( "double",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.double,
              false );
            ("boolean", (fun v -> string_of_bool v) request.boolean_, false);
            ( "timestamp",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                request.timestamp,
              false );
          ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithLabels" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module HttpRequestWithGreedyLabelInPath = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_greedy_label_in_path_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/HttpRequestWithGreedyLabelInPath/foo/{foo}/baz/{baz+}"
        ~labels:
          [ ("foo", (fun v -> v) request.foo, false); ("baz", (fun v -> v) request.baz, true) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithGreedyLabelInPath" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module HttpRequestWithFloatLabels = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_request_with_float_labels_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FloatHttpLabels/{float}/{double}"
        ~labels:
          [
            ( "float",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.float_,
              false );
            ( "double",
              (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                request.double,
              false );
          ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpRequestWithFloatLabels" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module HttpPrefixHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_prefix_headers_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPrefixHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("x-foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers =
      List.concat
        [
          (match request.foo_map with
          | Some v -> [ ("x-foo-", List.map (fun (k, v) -> (k, (fun v -> v) v)) v) ]
          | None -> []);
        ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPrefixHeaders" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           foo = Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "x-foo");
           foo_map =
             Some
               (Smaws_Lib.Protocols.RestXml.prefix_headers ~prefix:"x-foo-" headers
               |> List.map (fun (k, v) -> (k, (fun s -> s) v)));
         }
          : http_prefix_headers_input_output))
      ~error_deserializer
end

module HttpPayloadWithXmlNamespaceAndPrefix = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_namespace_and_prefix_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithXmlNamespaceAndPrefix"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "PayloadWithXmlNamespaceAndPrefix"
            ~attrs:[ ("xmlns:baz", "http://foo.com", None) ]
            (fun w -> payload_with_xml_namespace_and_prefix_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlNamespaceAndPrefix" ~service
      ~context ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_name = ref None in
                   Structure.scanSequence i [ "name" ] (fun tag _ ->
                       match tag with
                       | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
                       | _ -> Read.skip_element i);
                   ({ name = ( ! ) r_name } : payload_with_xml_namespace_and_prefix))))
        in
        ({ nested = payload_val } : http_payload_with_xml_namespace_and_prefix_input_output))
      ~error_deserializer
end

module HttpPayloadWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_namespace_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithXmlNamespace" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "PayloadWithXmlNamespace" ~ns:"http://foo.com" (fun w ->
              payload_with_xml_namespace_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlNamespace" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_name = ref None in
                   Structure.scanSequence i [ "name" ] (fun tag _ ->
                       match tag with
                       | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
                       | _ -> Read.skip_element i);
                   ({ name = ( ! ) r_name } : payload_with_xml_namespace))))
        in
        ({ nested = payload_val } : http_payload_with_xml_namespace_input_output))
      ~error_deserializer
end

module HttpPayloadWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_xml_name_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "Hello" (fun w -> payload_with_xml_name_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithXmlName" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_name = ref None in
                   Structure.scanSequence i [ "name" ] (fun tag _ ->
                       match tag with
                       | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
                       | _ -> Read.skip_element i);
                   ({ name = ( ! ) r_name } : payload_with_xml_name))))
        in
        ({ nested = payload_val } : http_payload_with_xml_name_input_output))
      ~error_deserializer
end

module HttpPayloadWithUnion = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_union_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithUnion" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "UnionPayload" (fun w -> union_payload_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithUnion" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i _ -> union_payload_of_xml i)))
        in
        ({ nested = payload_val } : http_payload_with_union_input_output))
      ~error_deserializer
end

module HttpPayloadWithStructure = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_structure_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithStructure" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "NestedPayload" (fun w -> nested_payload_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithStructure" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_greeting = ref None in
                   let r_name = ref None in
                   Structure.scanSequence i [ "greeting"; "name" ] (fun tag _ ->
                       match tag with
                       | "greeting" ->
                           r_greeting := Some (Read.element_value i "greeting" Fun.id ())
                       | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
                       | _ -> Read.skip_element i);
                   ({ greeting = ( ! ) r_greeting; name = ( ! ) r_name } : nested_payload))))
        in
        ({ nested = payload_val } : http_payload_with_structure_input_output))
      ~error_deserializer
end

module HttpPayloadWithMemberXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_with_member_xml_name_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadWithMemberXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.nested with
      | Some v ->
          let w = Smaws_Lib.Xml.Write.make () in
          Smaws_Lib.Xml.Write.element w "Hola" (fun w -> payload_with_xml_name_to_xml w v);
          Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadWithMemberXmlName" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let payload_val =
          if String.equal body "" then None
          else (
            let i =
              Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
            in
            Smaws_Lib.Xml.Parse.Read.dtd i;
            Some
              (Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
                   let r_name = ref None in
                   Structure.scanSequence i [ "name" ] (fun tag _ ->
                       match tag with
                       | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
                       | _ -> Read.skip_element i);
                   ({ name = ( ! ) r_name } : payload_with_xml_name))))
        in
        ({ nested = payload_val } : http_payload_with_member_xml_name_input_output))
      ~error_deserializer
end

module HttpPayloadTraitsWithMediaType = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_traits_with_media_type_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadTraitsWithMediaType"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("X-Foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.blob with Some v -> Some ("text/plain", Bytes.to_string v) | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadTraitsWithMediaType" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           blob =
             (if String.equal body "" then None else Some (Smaws_Lib.CoreTypes.Blob.of_string body));
           foo = Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-Foo");
         }
          : http_payload_traits_with_media_type_input_output))
      ~error_deserializer
end

module HttpPayloadTraits = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_payload_traits_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpPayloadTraits" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [ (match request.foo with Some v -> [ ("X-Foo", (fun v -> v) v) ] | None -> []) ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.blob with
      | Some v -> Some ("application/octet-stream", Bytes.to_string v)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpPayloadTraits" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           blob =
             (if String.equal body "" then None else Some (Smaws_Lib.CoreTypes.Blob.of_string body));
           foo = Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-Foo");
         }
          : http_payload_traits_input_output))
      ~error_deserializer
end

module HttpEnumPayload = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : enum_payload_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/EnumPayload" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      match request.payload with
      | Some v -> Some ("text/plain", (fun v -> match v with V -> "enumvalue") v)
      | None -> None
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpEnumPayload" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           payload =
             (if String.equal body "" then None
              else
                Some
                  ((fun s -> match s with "enumvalue" -> V | _ -> failwith "unknown enum value")
                     body));
         }
          : enum_payload_input))
      ~error_deserializer
end

module HttpEmptyPrefixHeaders = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : http_empty_prefix_headers_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/HttpEmptyPrefixHeaders" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (match request.specific_header with
          | Some v -> [ ("hello", (fun v -> v) v) ]
          | None -> []);
        ]
    in
    let prefix_headers =
      List.concat
        [
          (match request.prefix_headers with
          | Some v -> [ ("", List.map (fun (k, v) -> (k, (fun v -> v) v)) v) ]
          | None -> []);
        ]
    in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"HttpEmptyPrefixHeaders" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           prefix_headers =
             Some
               (Smaws_Lib.Protocols.RestXml.prefix_headers ~prefix:"" headers
               |> List.map (fun (k, v) -> (k, (fun s -> s) v)));
           specific_header =
             Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "hello");
         }
          : http_empty_prefix_headers_output))
      ~error_deserializer
end

module GreetingWithErrors = struct
  let error_to_string = function
    | `ComplexError _ -> "aws.protocoltests.restxml#ComplexError"
    | `InvalidGreeting _ -> "aws.protocoltests.restxml#InvalidGreeting"
    | #Smaws_Lib.Protocols.RestXml.error as e -> Smaws_Lib.Protocols.RestXml.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers =
    match error.Smaws_Lib.Protocols.RestXml.Error.code with
    | "ComplexError" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~structParser:(fun i ->
              let r_top_level = ref None in
              let r_nested = ref None in
              Structure.scanSequence i [ "TopLevel"; "Nested" ] (fun tag _ ->
                  match tag with
                  | "TopLevel" -> r_top_level := Some (Read.element_value i "TopLevel" Fun.id ())
                  | "Nested" ->
                      r_nested :=
                        Some
                          (Read.sequence i "Nested"
                             (fun i _ -> complex_nested_error_data_of_xml i)
                             ())
                  | _ -> Read.skip_element i);
              ({
                 header =
                   Option.map
                     (fun s -> s)
                     (Smaws_Lib.Protocols.RestXml.header_value headers "X-Header");
                 top_level = ( ! ) r_top_level;
                 nested = ( ! ) r_nested;
               }
                : complex_error))
        with
        | Ok s -> `ComplexError s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | "InvalidGreeting" -> (
        match
          Smaws_Lib.Protocols.RestXml.parse_error_struct ~body ~structParser:(fun i ->
              invalid_greeting_of_xml i)
        with
        | Ok s -> `InvalidGreeting s
        | Error (XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/GreetingWithErrors" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"GreetingWithErrors" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        ({
           greeting =
             Option.map (fun s -> s) (Smaws_Lib.Protocols.RestXml.header_value headers "X-Greeting");
         }
          : greeting_with_errors_output))
      ~error_deserializer
end

module FractionalSeconds = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FractionalSeconds" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FractionalSeconds" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_datetime = ref None in
            Structure.scanSequence i [ "datetime" ] (fun tag _ ->
                match tag with
                | "datetime" ->
                    r_datetime :=
                      Some
                        (Read.sequence i "datetime"
                           (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                           ())
                | _ -> Read.skip_element i);
            ({ datetime = ( ! ) r_datetime } : fractional_seconds_output)))
      ~error_deserializer
end

module FlattenedXmlMapWithXmlNamespace = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FlattenedXmlMapWithXmlNamespace"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMapWithXmlNamespace" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_my_map = ref None in
            Structure.scanSequence i [ "KVP" ] (fun tag _ ->
                match tag with
                | "KVP" ->
                    r_my_map :=
                      Some
                        (Read.sequences i "KVP"
                           (fun i _ ->
                             let k = Read.element_value i "K" Fun.id () in
                             let v = Read.element_value i "V" Fun.id () in
                             (k, v))
                           ())
                | _ -> Read.skip_element i);
            ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_namespace_output)))
      ~error_deserializer
end

module FlattenedXmlMapWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : flattened_xml_map_with_xml_name_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/FlattenedXmlMapWithXmlName" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "FlattenedXmlMapWithXmlNameRequest" (fun w ->
          flattened_xml_map_with_xml_name_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMapWithXmlName" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_my_map = ref None in
            Structure.scanSequence i [ "KVP" ] (fun tag _ ->
                match tag with
                | "KVP" ->
                    r_my_map :=
                      Some
                        (Read.sequences i "KVP"
                           (fun i _ ->
                             let k = Read.element_value i "K" Fun.id () in
                             let v = Read.element_value i "V" Fun.id () in
                             (k, v))
                           ())
                | _ -> Read.skip_element i);
            ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_name_response)))
      ~error_deserializer
end

module FlattenedXmlMap = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : flattened_xml_map_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/FlattenedXmlMap" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "FlattenedXmlMapRequest" (fun w ->
          flattened_xml_map_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"FlattenedXmlMap" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_my_map = ref None in
            Structure.scanSequence i [ "myMap" ] (fun tag _ ->
                match tag with
                | "myMap" ->
                    r_my_map :=
                      Some
                        (Read.sequences i "myMap"
                           (fun i _ ->
                             let k = Read.element_value i "key" Fun.id () in
                             let v =
                               Read.sequence i "value"
                                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                                 ()
                             in
                             (k, v))
                           ())
                | _ -> Read.skip_element i);
            ({ my_map = ( ! ) r_my_map } : flattened_xml_map_response)))
      ~error_deserializer
end

module EndpointWithHostLabelOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : endpoint_with_host_label_operation_request) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EndpointWithHostLabelOperation"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri =
      Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:"foo.{label}."
        ~labels:[ ("label", (fun v -> v) request.label) ]
        uri
    in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "EndpointWithHostLabelOperationRequest" (fun w ->
          endpoint_with_host_label_operation_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointWithHostLabelOperation" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module EndpointWithHostLabelHeaderOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : host_label_header_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EndpointWithHostLabelHeaderOperation"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri =
      Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:"{accountId}."
        ~labels:[ ("accountId", (fun v -> v) request.account_id) ]
        uri
    in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers =
      List.concat
        [
          (let v = request.account_id in
           [ ("X-Amz-Account-Id", (fun v -> v) v) ]);
        ]
    in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointWithHostLabelHeaderOperation" ~service
      ~context ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module EndpointOperation = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EndpointOperation" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:"foo." ~labels:[] uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EndpointOperation" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module EmptyInputAndEmptyOutput = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : empty_input_and_empty_output_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/EmptyInputAndEmptyOutput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"EmptyInputAndEmptyOutput" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module DatetimeOffsets = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/DatetimeOffsets" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"DatetimeOffsets" ~service ~context
      ~method_:`POST ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_datetime = ref None in
            Structure.scanSequence i [ "datetime" ] (fun tag _ ->
                match tag with
                | "datetime" ->
                    r_datetime :=
                      Some
                        (Read.sequence i "datetime"
                           (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                           ())
                | _ -> Read.skip_element i);
            ({ datetime = ( ! ) r_datetime } : datetime_offsets_output)))
      ~error_deserializer
end

module ContentTypeParameters = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : content_type_parameters_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/ContentTypeParameters" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "ContentTypeParametersInput" (fun w ->
          content_type_parameters_input_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ContentTypeParameters" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module ConstantQueryString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : constant_query_string_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels
        ~template:"/ConstantQueryString/{hello}?foo=bar&hello"
        ~labels:[ ("hello", (fun v -> v) request.hello, false) ]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ConstantQueryString" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module ConstantAndVariableQueryString = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : constant_and_variable_query_string_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/ConstantAndVariableQueryString?foo=bar"
        ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [
          (match request.baz with Some v -> [ ("baz", [ (fun v -> v) v ]) ] | None -> []);
          (match request.maybe_set with
          | Some v -> [ ("maybeSet", [ (fun v -> v) v ]) ]
          | None -> []);
        ]
    in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"ConstantAndVariableQueryString" ~service
      ~context ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end

module BodyWithXmlName = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : body_with_xml_name_input_output) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path = Smaws_Lib.Http_bindings.substitute_labels ~template:"/BodyWithXmlName" ~labels:[] in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params = List.concat [] in
    let map_params = List.concat [] in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body =
      let w = Smaws_Lib.Xml.Write.make () in
      Smaws_Lib.Xml.Write.element w "Ahoy" (fun w ->
          body_with_xml_name_input_output_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"BodyWithXmlName" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status ->
        let i = Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None in
        Smaws_Lib.Xml.Parse.Read.dtd i;
        Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs ->
            let r_nested = ref None in
            Structure.scanSequence i [ "nested" ] (fun tag _ ->
                match tag with
                | "nested" ->
                    r_nested :=
                      Some (Read.sequence i "nested" (fun i _ -> payload_with_xml_name_of_xml i) ())
                | _ -> Read.skip_element i);
            ({ nested = ( ! ) r_nested } : body_with_xml_name_input_output)))
      ~error_deserializer
end

module AllQueryStringTypes = struct
  let error_to_string = Smaws_Lib.Protocols.RestXml.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ =
    Smaws_Lib.Protocols.RestXml.Errors.default_handler error

  let request context (request : all_query_string_types_input) =
    let base = Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service in
    let path =
      Smaws_Lib.Http_bindings.substitute_labels ~template:"/AllQueryStringTypesInput" ~labels:[]
    in
    let uri = Smaws_Lib.Http_bindings.apply_path ~base ~path in
    let uri = uri in
    let named_params =
      List.concat
        [
          (match request.query_string with
          | Some v -> [ ("String", [ (fun v -> v) v ]) ]
          | None -> []);
          (match request.query_string_list with
          | Some v -> [ ("StringList", List.map (fun v -> v) v) ]
          | None -> []);
          (match request.query_string_set with
          | Some v -> [ ("StringSet", List.map (fun v -> v) v) ]
          | None -> []);
          (match request.query_byte with
          | Some v -> [ ("Byte", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.query_short with
          | Some v -> [ ("Short", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.query_integer with
          | Some v -> [ ("Integer", [ (fun v -> string_of_int v) v ]) ]
          | None -> []);
          (match request.query_integer_list with
          | Some v -> [ ("IntegerList", List.map (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.query_integer_set with
          | Some v -> [ ("IntegerSet", List.map (fun v -> string_of_int v) v) ]
          | None -> []);
          (match request.query_long with
          | Some v -> [ ("Long", [ (fun v -> Smaws_Lib.CoreTypes.Int64.to_string v) v ]) ]
          | None -> []);
          (match request.query_float with
          | Some v ->
              [
                ( "Float",
                  [ (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v ] );
              ]
          | None -> []);
          (match request.query_double with
          | Some v ->
              [
                ( "Double",
                  [ (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v) v ] );
              ]
          | None -> []);
          (match request.query_double_list with
          | Some v ->
              [
                ( "DoubleList",
                  List.map
                    (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)
                    v );
              ]
          | None -> []);
          (match request.query_boolean with
          | Some v -> [ ("Boolean", [ (fun v -> string_of_bool v) v ]) ]
          | None -> []);
          (match request.query_boolean_list with
          | Some v -> [ ("BooleanList", List.map (fun v -> string_of_bool v) v) ]
          | None -> []);
          (match request.query_timestamp with
          | Some v ->
              [
                ( "Timestamp",
                  [ (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v) v ]
                );
              ]
          | None -> []);
          (match request.query_timestamp_list with
          | Some v ->
              [
                ( "TimestampList",
                  List.map
                    (fun v -> Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string v)
                    v );
              ]
          | None -> []);
          (match request.query_enum with
          | Some v ->
              [
                ( "Enum",
                  [
                    (fun v ->
                      match v with
                      | Shared.Types.FOO -> "Foo"
                      | Shared.Types.BAZ -> "Baz"
                      | Shared.Types.BAR -> "Bar"
                      | Shared.Types.ONE -> "1"
                      | Shared.Types.ZERO -> "0")
                      v;
                  ] );
              ]
          | None -> []);
          (match request.query_enum_list with
          | Some v ->
              [
                ( "EnumList",
                  List.map
                    (fun v ->
                      match v with
                      | Shared.Types.FOO -> "Foo"
                      | Shared.Types.BAZ -> "Baz"
                      | Shared.Types.BAR -> "Bar"
                      | Shared.Types.ONE -> "1"
                      | Shared.Types.ZERO -> "0")
                    v );
              ]
          | None -> []);
          (match request.query_integer_enum with
          | Some v ->
              [
                ( "IntegerEnum",
                  [
                    (fun v ->
                      match v with
                      | Shared.Types.A -> string_of_int 1
                      | Shared.Types.B -> string_of_int 2
                      | Shared.Types.C -> string_of_int 3)
                      v;
                  ] );
              ]
          | None -> []);
          (match request.query_integer_enum_list with
          | Some v ->
              [
                ( "IntegerEnumList",
                  List.map
                    (fun v ->
                      match v with
                      | Shared.Types.A -> string_of_int 1
                      | Shared.Types.B -> string_of_int 2
                      | Shared.Types.C -> string_of_int 3)
                    v );
              ]
          | None -> []);
        ]
    in
    let map_params =
      List.concat
        [
          (match request.query_params_map_of_strings with
          | Some v -> List.map (fun (k, v) -> (k, [ (fun v -> v) v ])) v
          | None -> []);
        ]
    in
    let query = Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params in
    let named_headers = List.concat [] in
    let prefix_headers = List.concat [] in
    let headers = Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers in
    let body = None in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"AllQueryStringTypes" ~service ~context
      ~method_:`GET ~uri ~query ~headers ~body
      ~output_deserializer:(fun ~body ~headers ~status -> ())
      ~error_deserializer
end
