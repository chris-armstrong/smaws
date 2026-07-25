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
      Smaws_Lib.Xml.Write.element w "SimpleScalarPropertiesRequest" ~ns:"https://example.com"
        (fun w -> simple_scalar_properties_request_to_xml w request);
      Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
    in
    Smaws_Lib.Protocols.RestXml.request ~shape_name:"SimpleScalarProperties" ~service ~context
      ~method_:`PUT ~uri ~query ~headers ~body ~noErrorWrapping:false
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
            let r_nested = ref None in
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
                "Nested";
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
                | "Nested" ->
                    r_nested :=
                      Some
                        (Read.sequence i "Nested"
                           (fun i attrs -> nested_with_namespace_of_xml i attrs)
                           ())
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
               nested = ( ! ) r_nested;
               double_value = ( ! ) r_double_value;
             }
              : simple_scalar_properties_response)))
      ~error_deserializer
end
