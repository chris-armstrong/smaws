open Smaws_Lib
type nonrec string_map = (string * string) list[@@ocaml.doc ""]
type nonrec applies_to =
  | SERVER [@ocaml.doc "The test only applies to server implementations."]
  | CLIENT [@ocaml.doc "The test only applies to client implementations."]
[@@ocaml.doc ""]
type nonrec http_response_test_case =
  {
  applies_to: applies_to option
    [@ocaml.doc
      "Indicates that the test case is only to be implemented by \"client\" or \"server\" implementations. This property is useful for identifying and testing edge cases of clients and servers that are impossible or undesirable to test in *both* client and server implementations."];
  tags: string list option [@ocaml.doc "Applies a list of tags to the test."];
  documentation: string option
    [@ocaml.doc "A description of the test and what is being asserted."];
  vendor_params_shape: string option
    [@ocaml.doc
      "A shape to be used to validate the `vendorParams` member contents. If set, the parameters in `vendorParams` MUST be compatible with this shape's definition."];
  vendor_params: CoreTypes.Document.t option
    [@ocaml.doc
      "Defines vendor-specific parameters that are used to influence the response. For example, some vendors might utilize environment variables, configuration files on disk, or other means to influence the serialization formats used by clients or servers. If a `vendorParamsShape` is set, these parameters MUST be compatible with that shape's definition."];
  params: CoreTypes.Document.t option
    [@ocaml.doc
      "Defines the output parameters deserialized from the HTTP response. These parameters MUST be compatible with the output of the operation."];
  body_media_type: string option
    [@ocaml.doc
      "The media type of the `body`. This is used to help test runners to parse and validate the expected data against generated data. Binary media type formats require that the contents of `body` are base64 encoded."];
  body: string option
    [@ocaml.doc
      "Defines the HTTP message body. If no response body is defined, then no assertions are made about the body of the message."];
  require_headers: string list option
    [@ocaml.doc
      "A list of header field names that must appear in the serialized HTTP message, but no assertion is made on the value. Headers listed in `headers` map do not need to appear in this list."];
  forbid_headers: string list option
    [@ocaml.doc "A list of header field names that must not appear."];
  headers: string_map option
    [@ocaml.doc
      "A map of expected HTTP headers. Each key represents a header field name and each value represents the expected header value. An HTTP response is not in compliance with the protocol if any listed header is missing from the serialized response or if the expected header value differs from the serialized response value. `headers` applies no constraints on additional headers."];
  auth_scheme: string option
    [@ocaml.doc
      "The optional authentication scheme shape ID to assume. It's possible that specific authentication schemes might influence the serialization logic of an HTTP response."];
  code: int [@ocaml.doc "Defines the HTTP response code."];
  protocol: string [@ocaml.doc "The shape ID of the protocol to test."];
  id: string
    [@ocaml.doc
      "The identifier of the test case. This identifier can be used by protocol test implementations to filter out unsupported test cases by ID, to generate test case names, etc. The provided `id` MUST match Smithy's `identifier` ABNF. No two `httpResponseTests` test cases can share the same ID."]}
[@@ocaml.doc ""]
type nonrec http_request_test_case =
  {
  applies_to: applies_to option
    [@ocaml.doc
      "Indicates that the test case is only to be implemented by \"client\" or \"server\" implementations. This property is useful for identifying and testing edge cases of clients and servers that are impossible or undesirable to test in *both* client and server implementations."];
  tags: string list option [@ocaml.doc "Applies a list of tags to the test."];
  documentation: string option
    [@ocaml.doc "A description of the test and what is being asserted."];
  vendor_params_shape: string option
    [@ocaml.doc
      "A shape to be used to validate the `vendorParams` member contents. If set, the parameters in `vendorParams` MUST be compatible with this shape's definition."];
  vendor_params: CoreTypes.Document.t option
    [@ocaml.doc
      "Defines vendor-specific parameters that are used to influence the request. For example, some vendors might utilize environment variables, configuration files on disk, or other means to influence the serialization formats used by clients or servers. If a `vendorParamsShape` is set, these parameters MUST be compatible with that shape's definition."];
  params: CoreTypes.Document.t option
    [@ocaml.doc
      "Defines the input parameters used to generated the HTTP request. These parameters MUST be compatible with the input of the operation."];
  body_media_type: string option
    [@ocaml.doc
      "The media type of the `body`. This is used to help test runners to parse and validate the expected data against generated data."];
  body: string option
    [@ocaml.doc
      "The expected HTTP message body. If no request body is defined, then no assertions are made about the body of the message."];
  require_headers: string list option
    [@ocaml.doc
      "A list of header field names that must appear in the serialized HTTP message, but no assertion is made on the value. Headers listed in `headers` do not need to appear in this list."];
  forbid_headers: string list option
    [@ocaml.doc
      "A list of header field names that must not appear in the serialized HTTP request."];
  headers: string_map option
    [@ocaml.doc
      "Defines a map of expected HTTP headers. Headers that are not listed in this map are ignored unless they are explicitly forbidden through `forbidHeaders`."];
  require_query_params: string list option
    [@ocaml.doc
      "A list of query string parameter names that MUST appear in the serialized request URI, but no assertion is made on the value. Each value MUST appear in the format in which it is sent over the wire; if a key needs to be percent-encoded, then it MUST appear percent-encoded in this list."];
  forbid_query_params: string list option
    [@ocaml.doc
      "A list of query string parameter names that must not appear in the serialized HTTP request. Each value MUST appear in the format in which it is sent over the wire; if a key needs to be percent-encoded, then it MUST appear percent-encoded in this list."];
  query_params: string list option
    [@ocaml.doc
      "A list of the expected serialized query string parameters. Each element in the list is a query string key value pair that starts with the query string parameter name optionally followed by \"=\", optionally followed by the query string parameter value. For example, \"foo=bar\", \"foo=\", and \"foo\" are all valid values. The query string parameter name and the value MUST appear in the format in which it is expected to be sent over the wire; if a key or value needs to be percent-encoded, then it MUST appear percent-encoded in this list. A serialized HTTP request is not in compliance with the protocol if any query string parameter defined in `queryParams` is not defined in the request or if the value of a query string parameter in the request differs from the expected value. `queryParams` applies no constraints on additional query parameters."];
  auth_scheme: string option
    [@ocaml.doc
      "The optional authentication scheme shape ID to assume. It's possible that specific authentication schemes might influence the serialization logic of an HTTP request."];
  resolved_host: string option
    [@ocaml.doc
      "The host / endpoint that the client should send to, not including the path or scheme (for example, \"prefix.example.com\"). This can differ from the host provided to the client if the `hostPrefix` member of the `endpoint` trait is set, for instance."];
  host: string option
    [@ocaml.doc
      "The host / endpoint provided to the client, not including the path or scheme (for example, \"example.com\")."];
  uri: string
    [@ocaml.doc
      "The request-target of the HTTP request, not including the query string (for example, \"/foo/bar\")."];
  method_: string [@ocaml.doc "The expected serialized HTTP request method."];
  protocol: string [@ocaml.doc "The name of the protocol to test."];
  id: string
    [@ocaml.doc
      "The identifier of the test case. This identifier can be used by protocol test implementations to filter out unsupported test cases by ID, to generate test case names, etc. The provided `id` MUST match Smithy's `identifier` ABNF. No two `httpRequestTests` test cases can share the same ID."]}
[@@ocaml.doc ""]
type nonrec http_malformed_request_definition =
  {
  body_media_type: string option
    [@ocaml.doc
      "The media type of the `body`. This is used to help test runners to parse and validate the expected data against generated data."];
  body: string option
    [@ocaml.doc "The HTTP message body to include in the request"];
  headers: string_map option
    [@ocaml.doc "Defines a map of HTTP headers to include in the request"];
  query_params: string list option
    [@ocaml.doc
      "A list of the serialized query string parameters to include in the request. Each element in the list is a query string key value pair that starts with the query string parameter name optionally followed by \"=\", optionally followed by the query string parameter value. For example, \"foo=bar\", \"foo=\", and \"foo\" are all valid values. The query string parameter name and the value MUST appear in the format in which it is expected to be sent over the wire; if a key or value needs to be percent-encoded, then it MUST appear percent-encoded in this list."];
  host: string option
    [@ocaml.doc
      "The host / endpoint provided to the client, not including the path or scheme (for example, \"example.com\")."];
  uri: string
    [@ocaml.doc
      "The request-target of the HTTP request, not including the query string (for example, \"/foo/bar\")."];
  method_: string [@ocaml.doc "The HTTP request method."]}[@@ocaml.doc ""]
type nonrec http_malformed_response_body_assertion =
  | MessageRegex of string
  [@ocaml.doc
    "A regex to evaluate against the `message` field in the body. For responses that may have some variance from platform to platform, such as those that include messages from a parser."]
  | Contents of string
  [@ocaml.doc
    "Defines the expected serialized response body, which will be matched exactly."]
[@@ocaml.doc ""]
type nonrec http_malformed_response_body_definition =
  {
  media_type: string
    [@ocaml.doc
      "The media type of the response body. This is used to help test runners to parse and evaluate `contents' and `messageRegex` in the assertion"];
  assertion: http_malformed_response_body_assertion
    [@ocaml.doc "The assertion to execute against the response body."]}
[@@ocaml.doc ""]
type nonrec http_malformed_response_definition =
  {
  body: http_malformed_response_body_definition option
    [@ocaml.doc "The expected response body."];
  code: int [@ocaml.doc "Defines the HTTP response code."];
  headers: string_map option
    [@ocaml.doc
      "Defines a map of expected HTTP headers. Headers that are not listed in this map are ignored."]}
[@@ocaml.doc ""]
type nonrec http_malformed_request_test_parameters_definition =
  (string * string list) list[@@ocaml.doc ""]
type nonrec http_malformed_request_test_case =
  {
  test_parameters: http_malformed_request_test_parameters_definition option
    [@ocaml.doc
      "An optional set of test parameters for parameterized testing."];
  tags: string list option [@ocaml.doc "Applies a list of tags to the test."];
  documentation: string option
    [@ocaml.doc "A description of the test and what is being asserted."];
  response: http_malformed_response_definition
    [@ocaml.doc "The expected response."];
  request: http_malformed_request_definition
    [@ocaml.doc "The malformed request to send."];
  protocol: string [@ocaml.doc "The name of the protocol to test."];
  id: string
    [@ocaml.doc
      "The identifier of the test case. This identifier can be used by protocol test implementations to filter out unsupported test cases by ID, to generate test case names, etc. The provided `id` MUST match Smithy's `identifier` ABNF. No two `httpMalformedRequestTests` test cases can share the same ID."]}
[@@ocaml.doc ""]
type nonrec rpcv2_cbor =
  {
  event_stream_http: string list option
    [@ocaml.doc
      "Priority ordered list of supported HTTP protocol versions that are required when using event streams."];
  http: string list option
    [@ocaml.doc "Priority ordered list of supported HTTP protocol versions."]}
[@@ocaml.doc "An RPC-based protocol that serializes CBOR payloads."]
type nonrec validation_exception_field =
  {
  message: string
    [@ocaml.doc "A detailed description of the validation failure."];
  path: string
    [@ocaml.doc
      "A JSONPointer expression to the structure member whose value failed to satisfy the modeled constraints."]}
[@@ocaml.doc
  "Describes one specific validation failure for an input member."]
type nonrec validation_exception =
  {
  field_list: validation_exception_field list option
    [@ocaml.doc
      "A list of specific failures encountered while validating the input. A member can appear in this list more than once if it failed to satisfy multiple constraints."];
  message: string [@ocaml.doc "A summary of the validation failure."]}
[@@ocaml.doc
  "A standard error for input validation failures. This should be thrown by services when a member of the input structure falls outside of the modeled or documented constraints."]
type nonrec request_payer =
  | Requester [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec owner =
  {
  i_d: string option [@ocaml.doc ""];
  display_name: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec object_storage_class =
  | OUTPOSTS [@ocaml.doc ""]
  | DEEP_ARCHIVE [@ocaml.doc ""]
  | INTELLIGENT_TIERING [@ocaml.doc ""]
  | ONEZONE_IA [@ocaml.doc ""]
  | STANDARD_IA [@ocaml.doc ""]
  | GLACIER [@ocaml.doc ""]
  | REDUCED_REDUNDANCY [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec object_ =
  {
  owner: owner option [@ocaml.doc ""];
  storage_class: object_storage_class option [@ocaml.doc ""];
  size: int option [@ocaml.doc ""];
  e_tag: string option [@ocaml.doc ""];
  last_modified: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  key: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec encoding_type =
  | Url [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_objects_v2_request =
  {
  expected_bucket_owner: string option [@ocaml.doc ""];
  request_payer: request_payer option [@ocaml.doc ""];
  start_after: string option [@ocaml.doc ""];
  fetch_owner: bool option [@ocaml.doc ""];
  continuation_token: string option [@ocaml.doc ""];
  prefix: string option [@ocaml.doc ""];
  max_keys: int option [@ocaml.doc ""];
  encoding_type: encoding_type option [@ocaml.doc ""];
  delimiter: string option [@ocaml.doc ""];
  bucket: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec common_prefix = {
  prefix: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec list_objects_v2_output =
  {
  start_after: string option [@ocaml.doc ""];
  next_continuation_token: string option [@ocaml.doc ""];
  continuation_token: string option [@ocaml.doc ""];
  key_count: int option [@ocaml.doc ""];
  encoding_type: encoding_type option [@ocaml.doc ""];
  common_prefixes: common_prefix list option [@ocaml.doc ""];
  max_keys: int option [@ocaml.doc ""];
  delimiter: string option [@ocaml.doc ""];
  prefix: string option [@ocaml.doc ""];
  name: string option [@ocaml.doc ""];
  contents: object_ list option [@ocaml.doc ""];
  is_truncated: bool option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec get_object_request =
  {
  key: string [@ocaml.doc ""];
  bucket: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec get_bucket_location_request = {
  bucket: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec bucket_location_constraint =
  | Us_west_2 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_bucket_location_output =
  {
  location_constraint: bucket_location_constraint option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec delete_object_tagging_request =
  {
  expected_bucket_owner: string option [@ocaml.doc ""];
  version_id: string option [@ocaml.doc ""];
  key: string [@ocaml.doc ""];
  bucket: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec delete_object_tagging_output =
  {
  version_id: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec score_value_per_label_map = (string * float) list[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  code: int option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec record = (string * string) list[@@ocaml.doc ""]
type nonrec predictor_not_mounted_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec details_attributes =
  | ALGORITHM [@ocaml.doc ""]
  | PREDICTIVE_MODEL_TYPE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec details_map = (details_attributes * string) list[@@ocaml.doc ""]
type nonrec prediction =
  {
  details: details_map option [@ocaml.doc ""];
  predicted_scores: score_value_per_label_map option [@ocaml.doc ""];
  predicted_value: float option [@ocaml.doc ""];
  predicted_label: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec predict_output = {
  prediction: prediction option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec predict_input =
  {
  predict_endpoint: string [@ocaml.doc ""];
  record: record [@ocaml.doc ""];
  ml_model_id: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec limit_exceeded_exception =
  {
  code: int option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_input_exception =
  {
  code: int option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec internal_server_exception =
  {
  code: int option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec upload_multipart_part_output =
  {
  checksum: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec upload_multipart_part_input =
  {
  body: bytes option [@ocaml.doc ""];
  range: string option [@ocaml.doc ""];
  checksum: string option [@ocaml.doc ""];
  upload_id: string [@ocaml.doc ""];
  vault_name: string [@ocaml.doc ""];
  account_id: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec service_unavailable_exception =
  {
  message: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""];
  type_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""];
  type_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec request_timeout_exception =
  {
  message: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""];
  type_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec missing_parameter_value_exception =
  {
  message: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""];
  type_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_parameter_value_exception =
  {
  message: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""];
  type_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec upload_archive_input =
  {
  body: bytes option [@ocaml.doc ""];
  checksum: string option [@ocaml.doc ""];
  archive_description: string option [@ocaml.doc ""];
  account_id: string [@ocaml.doc ""];
  vault_name: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec archive_creation_output =
  {
  archive_id: string option [@ocaml.doc ""];
  checksum: string option [@ocaml.doc ""];
  location: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec unauthorized_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec too_many_requests_exception =
  {
  message: string option [@ocaml.doc ""];
  retry_after_seconds: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec api_key_source_type =
  | AUTHORIZER [@ocaml.doc ""]
  | HEADER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec endpoint_type =
  | PRIVATE [@ocaml.doc ""]
  | EDGE [@ocaml.doc ""]
  | REGIONAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec endpoint_configuration =
  {
  vpc_endpoint_ids: string list option [@ocaml.doc ""];
  types: endpoint_type list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec map_of_string_to_string = (string * string) list[@@ocaml.doc ""]
type nonrec rest_api =
  {
  disable_execute_api_endpoint: bool option [@ocaml.doc ""];
  tags: map_of_string_to_string option [@ocaml.doc ""];
  policy: string option [@ocaml.doc ""];
  endpoint_configuration: endpoint_configuration option [@ocaml.doc ""];
  api_key_source: api_key_source_type option [@ocaml.doc ""];
  minimum_compression_size: int option [@ocaml.doc ""];
  binary_media_types: string list option [@ocaml.doc ""];
  warnings: string list option [@ocaml.doc ""];
  version: string option [@ocaml.doc ""];
  created_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  description: string option [@ocaml.doc ""];
  name: string option [@ocaml.doc ""];
  id: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec rest_apis =
  {
  position: string option [@ocaml.doc ""];
  items: rest_api list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec get_rest_apis_request =
  {
  limit: int option [@ocaml.doc ""];
  position: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec bad_request_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec foo_union =
  | Integer of int [@ocaml.doc ""]
  | String of string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec greeting_struct = {
  hi: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec string_map = (string * string) list[@@ocaml.doc ""]
type nonrec string_list_map = (string * string list) list[@@ocaml.doc ""]
type nonrec sparse_string_map = (string * string) list[@@ocaml.doc ""]
type nonrec integer_enum =
  | C [@ocaml.doc ""]
  | B [@ocaml.doc ""]
  | A [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec integer_enum_map = (string * integer_enum) list[@@ocaml.doc ""]
type nonrec foo_enum =
  | ZERO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | BAZ [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec foo_enum_map = (string * foo_enum) list[@@ocaml.doc ""]
type nonrec no_custom_code_error = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec custom_code_error = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_with_namespace =
  {
  attr_field: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_scalar_properties_input_output =
  {
  double_value: double option [@ocaml.doc ""];
  nested: nested_with_namespace option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  long_value: int option [@ocaml.doc ""];
  integer_value: int option [@ocaml.doc ""];
  short_value: short option [@ocaml.doc ""];
  byte_value: byte option [@ocaml.doc ""];
  false_boolean_value: bool option [@ocaml.doc ""];
  true_boolean_value: bool option [@ocaml.doc ""];
  string_value: string option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_nested_union_struct =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  long_value: int option [@ocaml.doc ""];
  integer_value: int option [@ocaml.doc ""];
  short_value: short option [@ocaml.doc ""];
  byte_value: byte option [@ocaml.doc ""];
  boolean_value: bool option [@ocaml.doc ""];
  string_value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_union_shape =
  | StructValue of xml_nested_union_struct [@ocaml.doc ""]
  | UnionValue of xml_union_shape [@ocaml.doc ""]
  | DoubleValue of double [@ocaml.doc ""]
  | FloatValue of float_ [@ocaml.doc ""]
  | LongValue of int [@ocaml.doc ""]
  | IntegerValue of int [@ocaml.doc ""]
  | ShortValue of short [@ocaml.doc ""]
  | ByteValue of byte [@ocaml.doc ""]
  | BooleanValue of bool [@ocaml.doc ""]
  | StringValue of string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec xml_unions_response =
  {
  union_value: xml_union_shape option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_unions_request =
  {
  union_value: xml_union_shape option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_timestamps_input_output =
  {
  http_date_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  normal: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_namespace_nested =
  {
  values: string list option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_namespaces_input_output =
  {
  nested: xml_namespace_nested option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_maps_xml_name_input_output_map =
  (string * greeting_struct) list[@@ocaml.doc ""]
type nonrec xml_maps_xml_name_response =
  {
  my_map: xml_maps_xml_name_input_output_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
type nonrec xml_maps_xml_name_request =
  {
  my_map: xml_maps_xml_name_input_output_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
type nonrec xml_maps_input_output_map = (string * greeting_struct) list
[@@ocaml.doc ""]
type nonrec xml_maps_response =
  {
  my_map: xml_maps_input_output_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_maps_request =
  {
  my_map: xml_maps_input_output_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_map_with_xml_namespace_input_output_map =
  (string * string) list[@@ocaml.doc ""]
type nonrec xml_map_with_xml_namespace_input_output =
  {
  my_map: xml_map_with_xml_namespace_input_output_map option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec structure_list_member =
  {
  b: string option [@ocaml.doc ""];
  a: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_lists_input_output =
  {
  flattened_structure_list: structure_list_member list option [@ocaml.doc ""];
  structure_list: structure_list_member list option [@ocaml.doc ""];
  flattened_list_with_namespace: string list option [@ocaml.doc ""];
  flattened_list_with_member_namespace: string list option [@ocaml.doc ""];
  flattened_list2: string list option [@ocaml.doc ""];
  flattened_list: string list option [@ocaml.doc ""];
  renamed_list_members: string list option [@ocaml.doc ""];
  nested_string_list: string list list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  enum_list: foo_enum list option [@ocaml.doc ""];
  timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  boolean_list: bool list option [@ocaml.doc ""];
  integer_list: int list option [@ocaml.doc ""];
  string_set: string list option [@ocaml.doc ""];
  string_list: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_int_enums_input_output =
  {
  int_enum_map: integer_enum_map option [@ocaml.doc ""];
  int_enum_set: integer_enum list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  int_enum3: integer_enum option [@ocaml.doc ""];
  int_enum2: integer_enum option [@ocaml.doc ""];
  int_enum1: integer_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_enums_input_output =
  {
  foo_enum_map: foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: foo_enum list option [@ocaml.doc ""];
  foo_enum_list: foo_enum list option [@ocaml.doc ""];
  foo_enum3: foo_enum option [@ocaml.doc ""];
  foo_enum2: foo_enum option [@ocaml.doc ""];
  foo_enum1: foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_empty_strings_response =
  {
  empty_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_empty_strings_request =
  {
  empty_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_empty_maps_response =
  {
  my_map: xml_maps_input_output_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_empty_maps_request =
  {
  my_map: xml_maps_input_output_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_empty_blobs_response = {
  data: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_empty_blobs_request = {
  data: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_blobs_response = {
  data: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_blobs_request = {
  data: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_attributes_on_payload_response =
  {
  payload: unit option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_attributes_on_payload_request =
  {
  payload: unit option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_attributes_input_output =
  {
  attr: string option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec union_payload =
  | Greeting of string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec timestamp_format_headers_i_o =
  {
  target_date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  target_http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  target_epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  default_format: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  member_date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  member_http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  member_epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec string_payload_input = {
  payload: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec string_enum =
  | V [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec simple_scalar_properties_input_output =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  long_value: int option [@ocaml.doc ""];
  integer_value: int option [@ocaml.doc ""];
  short_value: short option [@ocaml.doc ""];
  byte_value: byte option [@ocaml.doc ""];
  false_boolean_value: bool option [@ocaml.doc ""];
  true_boolean_value: bool option [@ocaml.doc ""];
  string_value: string option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type recursive_shapes_input_output_nested1 =
  {
  nested: recursive_shapes_input_output_nested2 option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
and recursive_shapes_input_output_nested2 =
  {
  recursive_member: recursive_shapes_input_output_nested1 option
    [@ocaml.doc ""];
  bar: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec recursive_shapes_response =
  {
  nested: recursive_shapes_input_output_nested1 option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec recursive_shapes_request =
  {
  nested: recursive_shapes_input_output_nested1 option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec query_precedence_input =
  {
  baz: string_map option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_params_as_string_list_map_input =
  {
  foo: string_list_map option [@ocaml.doc ""];
  qux: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_idempotency_token_auto_fill_input =
  {
  token: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec put_with_content_encoding_input =
  {
  data: string option [@ocaml.doc ""];
  encoding: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec omits_null_serializes_empty_string_input =
  {
  empty_string: string option [@ocaml.doc ""];
  null_value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec null_and_empty_headers_i_o =
  {
  c: string list option [@ocaml.doc ""];
  b: string option [@ocaml.doc ""];
  a: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec input_and_output_with_headers_i_o =
  {
  header_enum_list: foo_enum list option [@ocaml.doc ""];
  header_enum: foo_enum option [@ocaml.doc ""];
  header_timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  header_boolean_list: bool list option [@ocaml.doc ""];
  header_integer_list: int list option [@ocaml.doc ""];
  header_string_set: string list option [@ocaml.doc ""];
  header_string_list: string list option [@ocaml.doc ""];
  header_false_bool: bool option [@ocaml.doc ""];
  header_true_bool: bool option [@ocaml.doc ""];
  header_double: double option [@ocaml.doc ""];
  header_float: float_ option [@ocaml.doc ""];
  header_long: int option [@ocaml.doc ""];
  header_integer: int option [@ocaml.doc ""];
  header_short: short option [@ocaml.doc ""];
  header_byte: byte option [@ocaml.doc ""];
  header_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec ignore_query_params_in_response_output =
  {
  baz: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_response_code_output = {
  status: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_request_with_labels_and_timestamp_format_input =
  {
  target_date_time: CoreTypes.Timestamp.t [@ocaml.doc ""];
  target_http_date: CoreTypes.Timestamp.t [@ocaml.doc ""];
  target_epoch_seconds: CoreTypes.Timestamp.t [@ocaml.doc ""];
  default_format: CoreTypes.Timestamp.t [@ocaml.doc ""];
  member_date_time: CoreTypes.Timestamp.t [@ocaml.doc ""];
  member_http_date: CoreTypes.Timestamp.t [@ocaml.doc ""];
  member_epoch_seconds: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""]
type nonrec http_request_with_labels_input =
  {
  timestamp_: CoreTypes.Timestamp.t
    [@ocaml.doc
      "Note that this member has no format, so it's serialized as an RFC 3399 date-time."];
  boolean_: bool [@ocaml.doc "Serialized in the path as true or false."];
  double: double [@ocaml.doc ""];
  float_: float_ [@ocaml.doc ""];
  long: int [@ocaml.doc ""];
  integer_: int [@ocaml.doc ""];
  short: short [@ocaml.doc ""];
  string_: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_request_with_greedy_label_in_path_input =
  {
  baz: string [@ocaml.doc ""];
  foo: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_request_with_float_labels_input =
  {
  double: double [@ocaml.doc ""];
  float_: float_ [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec foo_prefix_headers = (string * string) list[@@ocaml.doc ""]
type nonrec http_prefix_headers_input_output =
  {
  foo_map: foo_prefix_headers option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec payload_with_xml_namespace_and_prefix =
  {
  name: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_xml_namespace_and_prefix_input_output =
  {
  nested: payload_with_xml_namespace_and_prefix option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec payload_with_xml_namespace =
  {
  name: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_xml_namespace_input_output =
  {
  nested: payload_with_xml_namespace option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec payload_with_xml_name = {
  name: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_xml_name_input_output =
  {
  nested: payload_with_xml_name option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_union_input_output =
  {
  nested: union_payload option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_payload =
  {
  name: string option [@ocaml.doc ""];
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_structure_input_output =
  {
  nested: nested_payload option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_member_xml_name_input_output =
  {
  nested: payload_with_xml_name option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_traits_with_media_type_input_output =
  {
  blob: bytes option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_traits_input_output =
  {
  blob: blob option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec enum_payload_input =
  {
  payload: string_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_empty_prefix_headers_output =
  {
  specific_header: string option [@ocaml.doc ""];
  prefix_headers: string_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_empty_prefix_headers_input =
  {
  specific_header: string option [@ocaml.doc ""];
  prefix_headers: string_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_greeting = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This error is thrown when an invalid greeting value is provided."]
type nonrec complex_nested_error_data = {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: string option [@ocaml.doc ""];
  header: string option [@ocaml.doc ""]}[@@ocaml.doc
                                          "This error is thrown when a request is invalid."]
type nonrec greeting_with_errors_output =
  {
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec fractional_seconds_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_namespace_output_map =
  (string * string) list[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_namespace_output =
  {
  my_map: flattened_xml_map_with_xml_namespace_output_map option
    [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_name_input_output_map =
  (string * string) list[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_name_response =
  {
  my_map: flattened_xml_map_with_xml_name_input_output_map option
    [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_name_request =
  {
  my_map: flattened_xml_map_with_xml_name_input_output_map option
    [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec flattened_xml_map_response =
  {
  my_map: foo_enum_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec flattened_xml_map_request =
  {
  my_map: foo_enum_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec endpoint_with_host_label_operation_request =
  {
  label: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec host_label_header_input = {
  account_id: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec datetime_offsets_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec content_type_parameters_input =
  {
  value: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec constant_query_string_input = {
  hello: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec constant_and_variable_query_string_input =
  {
  maybe_set: string option [@ocaml.doc ""];
  baz: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec body_with_xml_name_input_output =
  {
  nested: payload_with_xml_name option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec all_query_string_types_input =
  {
  query_params_map_of_strings: string_map option [@ocaml.doc ""];
  query_integer_enum_list: integer_enum list option [@ocaml.doc ""];
  query_integer_enum: integer_enum option [@ocaml.doc ""];
  query_enum_list: foo_enum list option [@ocaml.doc ""];
  query_enum: foo_enum option [@ocaml.doc ""];
  query_timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  query_timestamp: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  query_boolean_list: bool list option [@ocaml.doc ""];
  query_boolean: bool option [@ocaml.doc ""];
  query_double_list: double list option [@ocaml.doc ""];
  query_double: double option [@ocaml.doc ""];
  query_float: float_ option [@ocaml.doc ""];
  query_long: int option [@ocaml.doc ""];
  query_integer_set: int list option [@ocaml.doc ""];
  query_integer_list: int list option [@ocaml.doc ""];
  query_integer: int option [@ocaml.doc ""];
  query_short: short option [@ocaml.doc ""];
  query_byte: byte option [@ocaml.doc ""];
  query_string_set: string list option [@ocaml.doc ""];
  query_string_list: string list option [@ocaml.doc ""];
  query_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_map = (string * foo_enum_map) list[@@ocaml.doc ""]
type nonrec nested_xml_maps_input_output =
  {
  flat_nested_map: nested_map option [@ocaml.doc ""];
  nested_map: nested_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_xml_map_with_xml_name_inner_map = (string * string) list
[@@ocaml.doc ""]
type nonrec nested_xml_map_with_xml_name_map =
  (string * nested_xml_map_with_xml_name_inner_map) list[@@ocaml.doc ""]
type nonrec nested_xml_map_with_xml_name_input_output =
  {
  nested_xml_map_with_xml_name_map: nested_xml_map_with_xml_name_map option
    [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec missing_key_structure = {
  hi: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec sensitive_validation_input =
  {
  string_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec recursive_enum_string =
  | DEF [@ocaml.doc ""]
  | ABC [@ocaml.doc ""][@@ocaml.doc ""]
type recursive_union_one =
  | Union of recursive_union_two [@ocaml.doc ""]
  | String of recursive_enum_string [@ocaml.doc ""][@@ocaml.doc ""]
and recursive_union_two =
  | Union of recursive_union_one [@ocaml.doc ""]
  | String of recursive_enum_string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec recursive_structures_input =
  {
  union: recursive_union_one option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_unique_items_input =
  {
  union_list: foo_union list option [@ocaml.doc ""];
  structure_list_with_no_key: missing_key_structure list option
    [@ocaml.doc ""];
  structure_list: greeting_struct list option [@ocaml.doc ""];
  list_list: string list list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  enum_list: foo_enum list option [@ocaml.doc ""];
  http_date_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  date_time_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  long_list: int list option [@ocaml.doc ""];
  integer_list: int list option [@ocaml.doc ""];
  short_list: short list option [@ocaml.doc ""];
  byte_list: byte list option [@ocaml.doc ""];
  string_list: string list option [@ocaml.doc ""];
  boolean_list: bool list option [@ocaml.doc ""];
  blob_list: blob list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_required_input =
  {
  string_in_header: string [@ocaml.doc ""];
  string_in_query: string [@ocaml.doc ""];
  string_: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_range_override_input =
  {
  max_float: float option [@ocaml.doc ""];
  min_float: float option [@ocaml.doc ""];
  float_: float option [@ocaml.doc ""];
  max_long: int option [@ocaml.doc ""];
  min_long: int option [@ocaml.doc ""];
  long: int option [@ocaml.doc ""];
  max_integer: int option [@ocaml.doc ""];
  min_integer: int option [@ocaml.doc ""];
  integer_: int option [@ocaml.doc ""];
  max_short: int option [@ocaml.doc ""];
  min_short: int option [@ocaml.doc ""];
  short: int option [@ocaml.doc ""];
  max_byte: int option [@ocaml.doc ""];
  min_byte: int option [@ocaml.doc ""];
  byte: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_range_input =
  {
  max_float: float option [@ocaml.doc ""];
  min_float: float option [@ocaml.doc ""];
  float_: float option [@ocaml.doc ""];
  max_long: int option [@ocaml.doc ""];
  min_long: int option [@ocaml.doc ""];
  long: int option [@ocaml.doc ""];
  max_integer: int option [@ocaml.doc ""];
  min_integer: int option [@ocaml.doc ""];
  integer_: int option [@ocaml.doc ""];
  max_short: int option [@ocaml.doc ""];
  min_short: int option [@ocaml.doc ""];
  short: int option [@ocaml.doc ""];
  max_byte: int option [@ocaml.doc ""];
  min_byte: int option [@ocaml.doc ""];
  byte: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec pattern_map_override = (string * string) list[@@ocaml.doc ""]
type nonrec pattern_union_override =
  | Second of string [@ocaml.doc ""]
  | First of string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec malformed_pattern_override_input =
  {
  union: pattern_union_override option [@ocaml.doc ""];
  map: pattern_map_override option [@ocaml.doc ""];
  list: string list option [@ocaml.doc ""];
  string_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec pattern_map = (string * string) list[@@ocaml.doc ""]
type nonrec pattern_union =
  | Second of string [@ocaml.doc ""]
  | First of string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec malformed_pattern_input =
  {
  union: pattern_union option [@ocaml.doc ""];
  map: pattern_map option [@ocaml.doc ""];
  list: string list option [@ocaml.doc ""];
  evil_string: string option [@ocaml.doc ""];
  string_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_length_query_string_input =
  {
  string_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec length_map = (string * string list) list[@@ocaml.doc ""]
type nonrec malformed_length_override_input =
  {
  map: length_map option [@ocaml.doc ""];
  list: string list option [@ocaml.doc ""];
  max_string: string option [@ocaml.doc ""];
  min_string: string option [@ocaml.doc ""];
  string_: string option [@ocaml.doc ""];
  blob: bytes option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_length_input =
  {
  map: length_map option [@ocaml.doc ""];
  list: string list option [@ocaml.doc ""];
  max_string: string option [@ocaml.doc ""];
  min_string: string option [@ocaml.doc ""];
  string_: string option [@ocaml.doc ""];
  blob: bytes option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec enum_string =
  | JKL [@ocaml.doc ""]
  | GHI [@ocaml.doc ""]
  | DEF [@ocaml.doc ""]
  | ABC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec enum_trait_string =
  | ABC [@ocaml.doc ""]
  | DEF [@ocaml.doc ""]
  | GHI [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec enum_map = (enum_string * enum_string) list[@@ocaml.doc ""]
type nonrec enum_union =
  | Second of enum_string [@ocaml.doc ""]
  | First of enum_string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec malformed_enum_input =
  {
  union: enum_union option [@ocaml.doc ""];
  map: enum_map option [@ocaml.doc ""];
  list: enum_string list option [@ocaml.doc ""];
  string_with_enum_trait: enum_trait_string option [@ocaml.doc ""];
  string_: enum_string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec greeting_struct = {
  salutation: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec union_with_json_name =
  | Baz of string [@ocaml.doc ""]
  | Bar of string [@ocaml.doc ""]
  | Foo of string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec union_payload =
  | Greeting of string [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec my_union =
  | RenamedStructureValue of greeting_struct [@ocaml.doc ""]
  | StructureValue of greeting_struct [@ocaml.doc ""]
  | MapValue of string_map [@ocaml.doc ""]
  | ListValue of string list [@ocaml.doc ""]
  | EnumValue of foo_enum [@ocaml.doc ""]
  | TimestampValue of CoreTypes.Timestamp.t [@ocaml.doc ""]
  | BlobValue of blob [@ocaml.doc ""]
  | NumberValue of int [@ocaml.doc ""]
  | BooleanValue of bool [@ocaml.doc ""]
  | StringValue of string [@ocaml.doc ""][@@ocaml.doc
                                           "A union with a representative set of types for members."]
type nonrec union_input_output = {
  contents: my_union option [@ocaml.doc ""]}[@@ocaml.doc
                                              "A shared structure that contains a single union member."]
type nonrec timestamp_format_headers_i_o =
  {
  target_date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  target_http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  target_epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  default_format: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  member_date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  member_http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  member_epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec test_string_map = (string * string) list[@@ocaml.doc ""]
type nonrec test_no_payload_input_output =
  {
  test_id: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec payload_config = {
  data: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec test_payload_structure_input_output =
  {
  payload_config: payload_config option [@ocaml.doc ""];
  test_id: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec test_payload_blob_input_output =
  {
  data: blob option [@ocaml.doc ""];
  content_type: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec test_int_enum =
  | TWO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec test_enum =
  | BAZ [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec test_config = {
  timeout: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec test_body_structure_input_output =
  {
  test_config: test_config option [@ocaml.doc ""];
  test_id: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec structure_list_member =
  {
  b: string option [@ocaml.doc ""];
  a: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec string_payload_input = {
  payload: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec string_enum =
  | V [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec streaming_traits_with_media_type_input_output =
  {
  blob: bytes option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec streaming_traits_require_length_input =
  {
  blob: bytes option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec streaming_traits_input_output =
  {
  blob: bytes option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec sparse_struct_map = (string * greeting_struct) list[@@ocaml.doc
                                                                 ""]
type nonrec sparse_set_map = (string * string list) list[@@ocaml.doc ""]
type nonrec sparse_number_map = (string * int) list[@@ocaml.doc ""]
type nonrec sparse_boolean_map = (string * bool) list[@@ocaml.doc ""]
type nonrec sparse_json_maps_input_output =
  {
  sparse_set_map: sparse_set_map option [@ocaml.doc ""];
  sparse_string_map: sparse_string_map option [@ocaml.doc ""];
  sparse_boolean_map: sparse_boolean_map option [@ocaml.doc ""];
  sparse_number_map: sparse_number_map option [@ocaml.doc ""];
  sparse_struct_map: sparse_struct_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""]
type nonrec sparse_json_lists_input_output =
  {
  sparse_short_list: short option list option [@ocaml.doc ""];
  sparse_string_list: string option list option [@ocaml.doc ""]}[@@ocaml.doc
                                                                  ""]
type nonrec simple_union =
  | String of string [@ocaml.doc ""]
  | Int of int [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec simple_scalar_properties_input_output =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  long_value: int option [@ocaml.doc ""];
  integer_value: int option [@ocaml.doc ""];
  short_value: short option [@ocaml.doc ""];
  byte_value: byte option [@ocaml.doc ""];
  false_boolean_value: bool option [@ocaml.doc ""];
  true_boolean_value: bool option [@ocaml.doc ""];
  string_value: string option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_map = (string * string) list[@@ocaml.doc ""]
type nonrec response_code_required_output =
  {
  response_code: int [@ocaml.doc ""]}[@@ocaml.doc ""]
type recursive_shapes_input_output_nested1 =
  {
  nested: recursive_shapes_input_output_nested2 option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
and recursive_shapes_input_output_nested2 =
  {
  recursive_member: recursive_shapes_input_output_nested1 option
    [@ocaml.doc ""];
  bar: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec recursive_shapes_input_output =
  {
  nested: recursive_shapes_input_output_nested1 option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec query_precedence_input =
  {
  baz: string_map option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_params_as_string_list_map_input =
  {
  foo: string_list_map option [@ocaml.doc ""];
  qux: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_idempotency_token_auto_fill_input =
  {
  token: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec put_with_content_encoding_input =
  {
  data: string option [@ocaml.doc ""];
  encoding: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec post_union_with_json_name_output =
  {
  value: union_with_json_name [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec post_union_with_json_name_input =
  {
  value: union_with_json_name option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec player_action =
  | Quit of unit [@ocaml.doc "Quit the game."][@@ocaml.doc ""]
type nonrec post_player_action_output =
  {
  action: player_action [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec post_player_action_input =
  {
  action: player_action option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec operation_with_nested_structure_input =
  {
  top_level: unit [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec client_optional_defaults = {
  member: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec operation_with_defaults_input =
  {
  other_top_level_default: int option [@ocaml.doc ""];
  top_level_default: string option [@ocaml.doc ""];
  client_optional_defaults: client_optional_defaults option [@ocaml.doc ""];
  defaults: unit option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec omits_serializing_empty_lists_input =
  {
  query_integer_enum_list: integer_enum list option [@ocaml.doc ""];
  query_enum_list: foo_enum list option [@ocaml.doc ""];
  query_timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  query_boolean_list: bool list option [@ocaml.doc ""];
  query_double_list: double list option [@ocaml.doc ""];
  query_integer_list: int list option [@ocaml.doc ""];
  query_string_list: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec omits_null_serializes_empty_string_input =
  {
  empty_string: string option [@ocaml.doc ""];
  null_value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec null_and_empty_headers_i_o =
  {
  c: string list option [@ocaml.doc ""];
  b: string option [@ocaml.doc ""];
  a: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec media_type_header_output = {
  json: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec media_type_header_input = {
  json: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_union_input =
  {
  union: simple_union option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_query_http_date_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_query_epoch_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_query_default_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_path_http_date_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_path_epoch_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_path_default_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_header_epoch_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_header_default_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_header_date_time_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_body_http_date_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_body_default_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_timestamp_body_date_time_input =
  {
  timestamp_: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_string_input = {
  blob: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_short_input =
  {
  short_in_header: short option [@ocaml.doc ""];
  short_in_query: short option [@ocaml.doc ""];
  short_in_path: short [@ocaml.doc ""];
  short_in_body: short option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_request_body_input =
  {
  float_: float_ option [@ocaml.doc ""];
  int_: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_map_input =
  {
  body_map: simple_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_long_input =
  {
  long_in_header: int option [@ocaml.doc ""];
  long_in_query: int option [@ocaml.doc ""];
  long_in_path: int [@ocaml.doc ""];
  long_in_body: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_list_input =
  {
  body_list: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_integer_input =
  {
  integer_in_header: int option [@ocaml.doc ""];
  integer_in_query: int option [@ocaml.doc ""];
  integer_in_path: int [@ocaml.doc ""];
  integer_in_body: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_float_input =
  {
  float_in_header: float_ option [@ocaml.doc ""];
  float_in_query: float_ option [@ocaml.doc ""];
  float_in_path: float_ [@ocaml.doc ""];
  float_in_body: float_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_double_input =
  {
  double_in_header: double option [@ocaml.doc ""];
  double_in_query: double option [@ocaml.doc ""];
  double_in_path: double [@ocaml.doc ""];
  double_in_body: double option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_content_type_with_payload_input =
  {
  payload: bytes option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_content_type_without_body_empty_input_input =
  {
  header: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_content_type_with_generic_string_input =
  {
  payload: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_byte_input =
  {
  byte_in_header: byte option [@ocaml.doc ""];
  byte_in_query: byte option [@ocaml.doc ""];
  byte_in_path: byte [@ocaml.doc ""];
  byte_in_body: byte option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_boolean_input =
  {
  boolean_in_header: bool option [@ocaml.doc ""];
  boolean_in_query: bool option [@ocaml.doc ""];
  boolean_in_path: bool [@ocaml.doc ""];
  boolean_in_body: bool option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_blob_input = {
  blob: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_accept_with_payload_output =
  {
  payload: bytes option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec malformed_accept_with_generic_string_output =
  {
  payload: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_timestamps_input_output =
  {
  http_date_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  normal: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec dense_struct_map = (string * greeting_struct) list[@@ocaml.doc
                                                                ""]
type nonrec dense_number_map = (string * int) list[@@ocaml.doc ""]
type nonrec dense_boolean_map = (string * bool) list[@@ocaml.doc ""]
type nonrec dense_string_map = (string * string) list[@@ocaml.doc ""]
type nonrec dense_set_map = (string * string list) list[@@ocaml.doc ""]
type nonrec json_maps_input_output =
  {
  dense_set_map: dense_set_map option [@ocaml.doc ""];
  dense_string_map: dense_string_map option [@ocaml.doc ""];
  dense_boolean_map: dense_boolean_map option [@ocaml.doc ""];
  dense_number_map: dense_number_map option [@ocaml.doc ""];
  dense_struct_map: dense_struct_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_lists_input_output =
  {
  structure_list: structure_list_member list option [@ocaml.doc ""];
  nested_string_list: string list list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  enum_list: foo_enum list option [@ocaml.doc ""];
  timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  boolean_list: bool list option [@ocaml.doc ""];
  integer_list: int list option [@ocaml.doc ""];
  string_set: string list option [@ocaml.doc ""];
  string_list: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_int_enums_input_output =
  {
  integer_enum_map: integer_enum_map option [@ocaml.doc ""];
  integer_enum_set: integer_enum list option [@ocaml.doc ""];
  integer_enum_list: integer_enum list option [@ocaml.doc ""];
  integer_enum3: integer_enum option [@ocaml.doc ""];
  integer_enum2: integer_enum option [@ocaml.doc ""];
  integer_enum1: integer_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_enums_input_output =
  {
  foo_enum_map: foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: foo_enum list option [@ocaml.doc ""];
  foo_enum_list: foo_enum list option [@ocaml.doc ""];
  foo_enum3: foo_enum option [@ocaml.doc ""];
  foo_enum2: foo_enum option [@ocaml.doc ""];
  foo_enum1: foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_blobs_input_output = {
  data: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec input_and_output_with_headers_i_o =
  {
  header_integer_enum_list: integer_enum list option [@ocaml.doc ""];
  header_integer_enum: integer_enum option [@ocaml.doc ""];
  header_enum_list: foo_enum list option [@ocaml.doc ""];
  header_enum: foo_enum option [@ocaml.doc ""];
  header_timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  header_boolean_list: bool list option [@ocaml.doc ""];
  header_integer_list: int list option [@ocaml.doc ""];
  header_string_set: string list option [@ocaml.doc ""];
  header_string_list: string list option [@ocaml.doc ""];
  header_false_bool: bool option [@ocaml.doc ""];
  header_true_bool: bool option [@ocaml.doc ""];
  header_double: double option [@ocaml.doc ""];
  header_float: float_ option [@ocaml.doc ""];
  header_long: int option [@ocaml.doc ""];
  header_integer: int option [@ocaml.doc ""];
  header_short: short option [@ocaml.doc ""];
  header_byte: byte option [@ocaml.doc ""];
  header_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec ignore_query_params_in_response_output =
  {
  baz: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_response_code_output = {
  status: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_request_with_regex_literal_input =
  {
  str: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_request_with_labels_and_timestamp_format_input =
  {
  target_date_time: CoreTypes.Timestamp.t [@ocaml.doc ""];
  target_http_date: CoreTypes.Timestamp.t [@ocaml.doc ""];
  target_epoch_seconds: CoreTypes.Timestamp.t [@ocaml.doc ""];
  default_format: CoreTypes.Timestamp.t [@ocaml.doc ""];
  member_date_time: CoreTypes.Timestamp.t [@ocaml.doc ""];
  member_http_date: CoreTypes.Timestamp.t [@ocaml.doc ""];
  member_epoch_seconds: CoreTypes.Timestamp.t [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""]
type nonrec http_request_with_labels_input =
  {
  timestamp_: CoreTypes.Timestamp.t
    [@ocaml.doc
      "Note that this member has no format, so it's serialized as an RFC 3399 date-time."];
  boolean_: bool [@ocaml.doc "Serialized in the path as true or false."];
  double: double [@ocaml.doc ""];
  float_: float_ [@ocaml.doc ""];
  long: int [@ocaml.doc ""];
  integer_: int [@ocaml.doc ""];
  short: short [@ocaml.doc ""];
  string_: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_request_with_greedy_label_in_path_input =
  {
  baz: string [@ocaml.doc ""];
  foo: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_request_with_float_labels_input =
  {
  double: double [@ocaml.doc ""];
  float_: float_ [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_prefix_headers_in_response_output =
  {
  prefix_headers: string_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_prefix_headers_output =
  {
  foo_map: string_map option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_prefix_headers_input =
  {
  foo_map: string_map option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_union_input_output =
  {
  nested: union_payload option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_payload =
  {
  name: string option [@ocaml.doc ""];
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_with_structure_input_output =
  {
  nested: nested_payload option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_traits_with_media_type_input_output =
  {
  blob: bytes option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_payload_traits_input_output =
  {
  blob: blob option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec enum_payload_input =
  {
  payload: string_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_empty_prefix_headers_output =
  {
  specific_header: string option [@ocaml.doc ""];
  prefix_headers: string_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_empty_prefix_headers_input =
  {
  specific_header: string option [@ocaml.doc ""];
  prefix_headers: string_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec http_checksum_required_input_output =
  {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_greeting = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This error is thrown when an invalid greeting value is provided."]
type nonrec complex_nested_error_data = {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: string option [@ocaml.doc ""];
  header: string option [@ocaml.doc ""]}[@@ocaml.doc
                                          "This error is thrown when a request is invalid."]
type nonrec greeting_with_errors_output =
  {
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec fractional_seconds_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec host_label_input = {
  label: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec document_type_as_payload_input_output =
  {
  document_value: CoreTypes.Document.t option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""]
type nonrec document_valued_map = (string * CoreTypes.Document.t) list
[@@ocaml.doc ""]
type nonrec document_type_as_map_value_input_output =
  {
  doc_valued_map: document_valued_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec document_type_input_output =
  {
  document_value: CoreTypes.Document.t option [@ocaml.doc ""];
  string_value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec datetime_offsets_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec content_type_parameters_input =
  {
  value: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec constant_query_string_input = {
  hello: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec constant_and_variable_query_string_input =
  {
  maybe_set: string option [@ocaml.doc ""];
  baz: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec all_query_string_types_input =
  {
  query_params_map_of_string_list: string_list_map option [@ocaml.doc ""];
  query_integer_enum_list: integer_enum list option [@ocaml.doc ""];
  query_integer_enum: integer_enum option [@ocaml.doc ""];
  query_enum_list: foo_enum list option [@ocaml.doc ""];
  query_enum: foo_enum option [@ocaml.doc ""];
  query_timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  query_timestamp: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  query_boolean_list: bool list option [@ocaml.doc ""];
  query_boolean: bool option [@ocaml.doc ""];
  query_double_list: double list option [@ocaml.doc ""];
  query_double: double option [@ocaml.doc ""];
  query_float: float_ option [@ocaml.doc ""];
  query_long: int option [@ocaml.doc ""];
  query_integer_set: int list option [@ocaml.doc ""];
  query_integer_list: int list option [@ocaml.doc ""];
  query_integer: int option [@ocaml.doc ""];
  query_short: short option [@ocaml.doc ""];
  query_byte: byte option [@ocaml.doc ""];
  query_string_set: string list option [@ocaml.doc ""];
  query_string_list: string list option [@ocaml.doc ""];
  query_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec farewell = {
  phrase: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec dialog =
  {
  farewell: farewell option [@ocaml.doc ""];
  greeting: string option [@ocaml.doc ""];
  language: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec dialog_map = (string * dialog) list[@@ocaml.doc ""]
type nonrec nested_defaults_mixin =
  {
  dialog_map: dialog_map option [@ocaml.doc ""];
  dialog_list: dialog list option [@ocaml.doc ""];
  dialog: dialog [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec defaults_mixin =
  {
  zero_double: double option [@ocaml.doc ""];
  zero_float: float_ option [@ocaml.doc ""];
  zero_long: int option [@ocaml.doc ""];
  zero_integer: int option [@ocaml.doc ""];
  zero_short: short option [@ocaml.doc ""];
  zero_byte: byte option [@ocaml.doc ""];
  empty_blob: blob option [@ocaml.doc ""];
  false_boolean: bool option [@ocaml.doc ""];
  empty_string: string option [@ocaml.doc ""];
  default_int_enum: test_int_enum option [@ocaml.doc ""];
  default_enum: test_enum option [@ocaml.doc ""];
  default_map: test_string_map option [@ocaml.doc ""];
  default_double: double option [@ocaml.doc ""];
  default_float: float_ option [@ocaml.doc ""];
  default_long: int option [@ocaml.doc ""];
  default_integer: int option [@ocaml.doc ""];
  default_short: short option [@ocaml.doc ""];
  default_byte: byte option [@ocaml.doc ""];
  default_blob: blob option [@ocaml.doc ""];
  default_timestamp: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  default_null_document: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_list: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_boolean: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_string: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_map: CoreTypes.Document.t option [@ocaml.doc ""];
  default_list: string list option [@ocaml.doc ""];
  default_boolean: bool option [@ocaml.doc ""];
  default_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_timestamps_output =
  {
  http_date_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  normal: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_namespace_nested =
  {
  values: string list option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_namespaces_output =
  {
  nested: xml_namespace_nested option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_maps_xml_name_output_map = (string * greeting_struct) list
[@@ocaml.doc ""]
type nonrec xml_maps_xml_name_output =
  {
  my_map: xml_maps_xml_name_output_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""]
type nonrec xml_maps_output_map = (string * greeting_struct) list[@@ocaml.doc
                                                                   ""]
type nonrec xml_maps_output =
  {
  my_map: xml_maps_output_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec structure_list_member =
  {
  b: string option [@ocaml.doc ""];
  a: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_lists_output =
  {
  structure_list: structure_list_member list option [@ocaml.doc ""];
  flattened_list_with_namespace: string list option [@ocaml.doc ""];
  flattened_list_with_member_namespace: string list option [@ocaml.doc ""];
  flattened_list2: string list option [@ocaml.doc ""];
  flattened_list: string list option [@ocaml.doc ""];
  renamed_list_members: string list option [@ocaml.doc ""];
  nested_string_list: string list list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  enum_list: foo_enum list option [@ocaml.doc ""];
  timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  boolean_list: bool list option [@ocaml.doc ""];
  integer_list: int list option [@ocaml.doc ""];
  string_set: string list option [@ocaml.doc ""];
  string_list: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_int_enums_output =
  {
  int_enum_map: integer_enum_map option [@ocaml.doc ""];
  int_enum_set: integer_enum list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  int_enum3: integer_enum option [@ocaml.doc ""];
  int_enum2: integer_enum option [@ocaml.doc ""];
  int_enum1: integer_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_enums_output =
  {
  foo_enum_map: foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: foo_enum list option [@ocaml.doc ""];
  foo_enum_list: foo_enum list option [@ocaml.doc ""];
  foo_enum3: foo_enum option [@ocaml.doc ""];
  foo_enum2: foo_enum option [@ocaml.doc ""];
  foo_enum1: foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_blobs_output = {
  data: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec struct_arg =
  {
  recursive_arg: struct_arg option [@ocaml.doc ""];
  other_arg: bool option [@ocaml.doc ""];
  string_arg: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_scalar_xml_properties_output =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  long_value: int option [@ocaml.doc ""];
  integer_value: int option [@ocaml.doc ""];
  short_value: short option [@ocaml.doc ""];
  byte_value: byte option [@ocaml.doc ""];
  false_boolean_value: bool option [@ocaml.doc ""];
  true_boolean_value: bool option [@ocaml.doc ""];
  empty_string_value: string option [@ocaml.doc ""];
  string_value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_input_params_input =
  {
  integer_enum: integer_enum option [@ocaml.doc ""];
  foo_enum: foo_enum option [@ocaml.doc ""];
  qux: blob option [@ocaml.doc ""];
  boo: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  bam: int option [@ocaml.doc ""];
  baz: bool option [@ocaml.doc ""];
  bar: string option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type recursive_xml_shapes_output_nested1 =
  {
  nested: recursive_xml_shapes_output_nested2 option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
and recursive_xml_shapes_output_nested2 =
  {
  recursive_member: recursive_xml_shapes_output_nested1 option
    [@ocaml.doc ""];
  bar: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec recursive_xml_shapes_output =
  {
  nested: recursive_xml_shapes_output_nested1 option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec query_timestamps_input =
  {
  epoch_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_member: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  normal_format: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""]
type nonrec complex_map = (string * greeting_struct) list[@@ocaml.doc ""]
type nonrec map_with_xml_name = (string * string) list[@@ocaml.doc ""]
type nonrec map_of_lists = (string * string list) list[@@ocaml.doc ""]
type nonrec nested_struct_with_map =
  {
  map_arg: string_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_maps_input =
  {
  nested_struct_with_map: nested_struct_with_map option [@ocaml.doc ""];
  map_of_lists: map_of_lists option [@ocaml.doc ""];
  flattened_map_with_xml_name: map_with_xml_name option [@ocaml.doc ""];
  flattened_map: string_map option [@ocaml.doc ""];
  map_with_xml_member_name: map_with_xml_name option [@ocaml.doc ""];
  complex_map_arg: complex_map option [@ocaml.doc ""];
  renamed_map_arg: string_map option [@ocaml.doc ""];
  map_arg: string_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_struct_with_list =
  {
  list_arg: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_lists_input =
  {
  nested_with_list: nested_struct_with_list option [@ocaml.doc ""];
  flattened_list_arg_with_xml_name: string list option [@ocaml.doc ""];
  list_arg_with_xml_name_member: string list option [@ocaml.doc ""];
  flattened_list_arg: string list option [@ocaml.doc ""];
  complex_list_arg: greeting_struct list option [@ocaml.doc ""];
  list_arg: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_idempotency_token_auto_fill_input =
  {
  token: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec put_with_content_encoding_input =
  {
  data: string option [@ocaml.doc ""];
  encoding: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_structures_input =
  {
  nested: struct_arg option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_greeting = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This error is thrown when an invalid greeting value is provided."]
type nonrec ignores_wrapping_xml_name_output =
  {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec host_label_input = {
  label: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec greeting_with_errors_output =
  {
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec custom_code_error = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_nested_error_data = {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: string option [@ocaml.doc ""]}[@@ocaml.doc
                                             "This error is thrown when a request is invalid."]
type nonrec fractional_seconds_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_namespace_output_map =
  (string * string) list[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_namespace_output =
  {
  my_map: flattened_xml_map_with_xml_namespace_output_map option
    [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_name_output_map =
  (string * string) list[@@ocaml.doc ""]
type nonrec flattened_xml_map_with_xml_name_output =
  {
  my_map: flattened_xml_map_with_xml_name_output_map option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec flattened_xml_map_output =
  {
  my_map: foo_enum_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec datetime_offsets_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec test_string_map = (string * string) list[@@ocaml.doc ""]
type nonrec test_int_enum =
  | TWO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec test_enum =
  | BAZ [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec simple_scalar_properties_output =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_scalar_properties_input =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec required_string_map = (string * string) list[@@ocaml.doc ""]
type nonrec required_enum =
  | BAZ [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec required_int_enum =
  | TWO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec required_members_with_defaults_mixin =
  {
  required_int_enum: required_int_enum [@ocaml.doc ""];
  required_enum: required_enum [@ocaml.doc ""];
  required_map: required_string_map [@ocaml.doc ""];
  required_double: double [@ocaml.doc ""];
  required_float: float_ [@ocaml.doc ""];
  required_long: int [@ocaml.doc ""];
  required_integer: int [@ocaml.doc ""];
  required_short: short [@ocaml.doc ""];
  required_byte: byte [@ocaml.doc ""];
  required_blob: blob [@ocaml.doc ""];
  required_timestamp: CoreTypes.Timestamp.t [@ocaml.doc ""];
  required_list: string list [@ocaml.doc ""];
  required_boolean: bool [@ocaml.doc ""];
  required_string: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec required_members_mixin =
  {
  required_map: required_string_map [@ocaml.doc ""];
  required_double: double [@ocaml.doc ""];
  required_float: float_ [@ocaml.doc ""];
  required_long: int [@ocaml.doc ""];
  required_integer: int [@ocaml.doc ""];
  required_short: short [@ocaml.doc ""];
  required_byte: byte [@ocaml.doc ""];
  required_blob: blob [@ocaml.doc ""];
  required_timestamp: CoreTypes.Timestamp.t [@ocaml.doc ""];
  required_list: string list [@ocaml.doc ""];
  required_boolean: bool [@ocaml.doc ""];
  required_string: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec no_custom_code_error = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec custom_code_error = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec put_with_content_encoding_input =
  {
  data: string option [@ocaml.doc ""];
  encoding: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec operation_with_nested_structure_input =
  {
  top_level: unit [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec client_optional_defaults = {
  member: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec operation_with_defaults_input =
  {
  other_top_level_default: int option [@ocaml.doc ""];
  top_level_default: string option [@ocaml.doc ""];
  client_optional_defaults: client_optional_defaults option [@ocaml.doc ""];
  defaults: unit option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec farewell = {
  phrase: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec dialog =
  {
  farewell: farewell option [@ocaml.doc ""];
  greeting: string option [@ocaml.doc ""];
  language: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec dialog_map = (string * dialog) list[@@ocaml.doc ""]
type nonrec nested_defaults_mixin =
  {
  dialog_map: dialog_map option [@ocaml.doc ""];
  dialog_list: dialog list option [@ocaml.doc ""];
  dialog: dialog [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec my_union =
  | StructureValue of greeting_struct [@ocaml.doc ""]
  | MapValue of string_map [@ocaml.doc ""]
  | ListValue of string list [@ocaml.doc ""]
  | IntEnumValue of integer_enum [@ocaml.doc ""]
  | EnumValue of foo_enum [@ocaml.doc ""]
  | TimestampValue of CoreTypes.Timestamp.t [@ocaml.doc ""]
  | BlobValue of blob [@ocaml.doc ""]
  | NumberValue of int [@ocaml.doc ""]
  | BooleanValue of bool [@ocaml.doc ""]
  | StringValue of string [@ocaml.doc ""][@@ocaml.doc
                                           "A union with a representative set of types for members."]
type nonrec json_unions_output = {
  contents: my_union option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_unions_input = {
  contents: my_union option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_greeting = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This error is thrown when an invalid greeting value is provided."]
type nonrec complex_nested_error_data = {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: string option [@ocaml.doc ""]}[@@ocaml.doc
                                             "This error is thrown when a request is invalid."]
type nonrec greeting_with_errors_output =
  {
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec greeting_with_errors_input =
  {
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec endpoint_with_host_label_operation_input =
  {
  label: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec content_type_parameters_input =
  {
  value: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec defaults_mixin =
  {
  zero_double: double option [@ocaml.doc ""];
  zero_float: float_ option [@ocaml.doc ""];
  zero_long: int option [@ocaml.doc ""];
  zero_integer: int option [@ocaml.doc ""];
  zero_short: short option [@ocaml.doc ""];
  zero_byte: byte option [@ocaml.doc ""];
  empty_blob: blob option [@ocaml.doc ""];
  false_boolean: bool option [@ocaml.doc ""];
  empty_string: string option [@ocaml.doc ""];
  default_int_enum: test_int_enum option [@ocaml.doc ""];
  default_enum: test_enum option [@ocaml.doc ""];
  default_map: test_string_map option [@ocaml.doc ""];
  default_double: double option [@ocaml.doc ""];
  default_float: float_ option [@ocaml.doc ""];
  default_long: int option [@ocaml.doc ""];
  default_integer: int option [@ocaml.doc ""];
  default_short: short option [@ocaml.doc ""];
  default_byte: byte option [@ocaml.doc ""];
  default_blob: blob option [@ocaml.doc ""];
  default_timestamp: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  default_null_document: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_list: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_boolean: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_string: CoreTypes.Document.t option [@ocaml.doc ""];
  default_document_map: CoreTypes.Document.t option [@ocaml.doc ""];
  default_list: string list option [@ocaml.doc ""];
  default_boolean: bool option [@ocaml.doc ""];
  default_string: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec my_union =
  | StructureValue of greeting_struct [@ocaml.doc ""]
  | MapValue of string_map [@ocaml.doc ""]
  | ListValue of string list [@ocaml.doc ""]
  | EnumValue of foo_enum [@ocaml.doc ""]
  | TimestampValue of CoreTypes.Timestamp.t [@ocaml.doc ""]
  | BlobValue of blob [@ocaml.doc ""]
  | NumberValue of int [@ocaml.doc ""]
  | BooleanValue of bool [@ocaml.doc ""]
  | StringValue of string [@ocaml.doc ""][@@ocaml.doc
                                           "A union with a representative set of types for members."]
type nonrec union_input_output = {
  contents: my_union option [@ocaml.doc ""]}[@@ocaml.doc
                                              "A shared structure that contains a single union member."]
type nonrec struct_with_json_name = {
  value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec sparse_nulls_operation_input_output =
  {
  sparse_string_map: sparse_string_map option [@ocaml.doc ""];
  sparse_string_list: string option list option [@ocaml.doc ""]}[@@ocaml.doc
                                                                  ""]
type nonrec simple_struct = {
  value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_scalar_properties_input_output =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec put_with_content_encoding_input =
  {
  data: string option [@ocaml.doc ""];
  encoding: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec put_and_get_inline_documents_input_output =
  {
  inline_document: CoreTypes.Document.t option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""]
type nonrec operation_with_optional_input_output_output =
  {
  value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec operation_with_optional_input_output_input =
  {
  value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec null_operation_input_output =
  {
  string_: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec map_of_structs = (string * simple_struct) list[@@ocaml.doc ""]
type nonrec map_of_strings = (string * string) list[@@ocaml.doc ""]
type nonrec map_of_map_of_strings = (string * map_of_strings) list[@@ocaml.doc
                                                                    ""]
type nonrec map_of_lists_of_strings = (string * string list) list[@@ocaml.doc
                                                                   ""]
type kitchen_sink =
  {
  unix_timestamp: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  timestamp_: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  struct_with_json_name: struct_with_json_name option [@ocaml.doc ""];
  string_: string option [@ocaml.doc ""];
  simple_struct: simple_struct option [@ocaml.doc ""];
  recursive_struct: kitchen_sink option [@ocaml.doc ""];
  recursive_map: map_of_kitchen_sinks option [@ocaml.doc ""];
  recursive_list: kitchen_sink list option [@ocaml.doc ""];
  map_of_structs: map_of_structs option [@ocaml.doc ""];
  map_of_strings: map_of_strings option [@ocaml.doc ""];
  map_of_maps: map_of_map_of_strings option [@ocaml.doc ""];
  map_of_lists_of_strings: map_of_lists_of_strings option [@ocaml.doc ""];
  long: int option [@ocaml.doc ""];
  list_of_structs: simple_struct list option [@ocaml.doc ""];
  list_of_strings: string list option [@ocaml.doc ""];
  list_of_maps_of_strings: map_of_strings list option [@ocaml.doc ""];
  list_of_lists: string list list option [@ocaml.doc ""];
  json_value: string option [@ocaml.doc ""];
  iso8601_timestamp: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  integer_: int option [@ocaml.doc ""];
  httpdate_timestamp: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  float_: float_ option [@ocaml.doc ""];
  empty_struct: unit option [@ocaml.doc ""];
  double: double option [@ocaml.doc ""];
  boolean_: bool option [@ocaml.doc ""];
  blob: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
and map_of_kitchen_sinks = (string * kitchen_sink) list[@@ocaml.doc ""]
type nonrec error_with_members =
  {
  string_field: string option [@ocaml.doc "abc"];
  message: string option [@ocaml.doc ""];
  map_field: map_of_strings option [@ocaml.doc ""];
  list_field: string list option [@ocaml.doc ""];
  integer_field: int option [@ocaml.doc ""];
  complex_data: kitchen_sink option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_int_enums_input_output =
  {
  int_enum_map: integer_enum_map option [@ocaml.doc ""];
  int_enum_set: integer_enum list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  int_enum3: integer_enum option [@ocaml.doc ""];
  int_enum2: integer_enum option [@ocaml.doc ""];
  int_enum1: integer_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec json_enums_input_output =
  {
  foo_enum_map: foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: foo_enum list option [@ocaml.doc ""];
  foo_enum_list: foo_enum list option [@ocaml.doc ""];
  foo_enum3: foo_enum option [@ocaml.doc ""];
  foo_enum2: foo_enum option [@ocaml.doc ""];
  foo_enum1: foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_greeting = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This error is thrown when an invalid greeting value is provided."]
type nonrec complex_nested_error_data = {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: string option [@ocaml.doc ""]}[@@ocaml.doc
                                             "This error is thrown when a request is invalid."]
type nonrec greeting_with_errors_output =
  {
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec fractional_seconds_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec host_label_input = {
  label: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec datetime_offsets_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec content_type_parameters_input =
  {
  value: int option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_timestamps_output =
  {
  http_date_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  http_date: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_seconds: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time_on_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  date_time: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  normal: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_namespace_nested =
  {
  values: string list option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_namespaces_output =
  {
  nested: xml_namespace_nested option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec structure_list_member =
  {
  b: string option [@ocaml.doc ""];
  a: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_lists_output =
  {
  structure_list: structure_list_member list option [@ocaml.doc ""];
  flattened_list_with_namespace: string list option [@ocaml.doc ""];
  flattened_list_with_member_namespace: string list option [@ocaml.doc ""];
  flattened_list2: string list option [@ocaml.doc ""];
  flattened_list: string list option [@ocaml.doc ""];
  renamed_list_members: string list option [@ocaml.doc ""];
  nested_string_list: string list list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  enum_list: foo_enum list option [@ocaml.doc ""];
  timestamp_list: CoreTypes.Timestamp.t list option [@ocaml.doc ""];
  boolean_list: bool list option [@ocaml.doc ""];
  integer_list: int list option [@ocaml.doc ""];
  string_set: string list option [@ocaml.doc ""];
  string_list: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_int_enums_output =
  {
  int_enum_map: integer_enum_map option [@ocaml.doc ""];
  int_enum_set: integer_enum list option [@ocaml.doc ""];
  int_enum_list: integer_enum list option [@ocaml.doc ""];
  int_enum3: integer_enum option [@ocaml.doc ""];
  int_enum2: integer_enum option [@ocaml.doc ""];
  int_enum1: integer_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_enums_output =
  {
  foo_enum_map: foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: foo_enum list option [@ocaml.doc ""];
  foo_enum_list: foo_enum list option [@ocaml.doc ""];
  foo_enum3: foo_enum option [@ocaml.doc ""];
  foo_enum2: foo_enum option [@ocaml.doc ""];
  foo_enum1: foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec xml_blobs_output = {
  data: blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec struct_arg =
  {
  recursive_arg: struct_arg option [@ocaml.doc ""];
  other_arg: bool option [@ocaml.doc ""];
  string_arg: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_scalar_xml_properties_output =
  {
  double_value: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  long_value: int option [@ocaml.doc ""];
  integer_value: int option [@ocaml.doc ""];
  short_value: short option [@ocaml.doc ""];
  byte_value: byte option [@ocaml.doc ""];
  false_boolean_value: bool option [@ocaml.doc ""];
  true_boolean_value: bool option [@ocaml.doc ""];
  empty_string_value: string option [@ocaml.doc ""];
  string_value: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec simple_input_params_input =
  {
  uses_xml_name: string option [@ocaml.doc ""];
  has_query_and_xml_name: string option [@ocaml.doc ""];
  has_query_name: string option [@ocaml.doc ""];
  foo_enum: foo_enum option [@ocaml.doc ""];
  qux: blob option [@ocaml.doc ""];
  boo: double option [@ocaml.doc ""];
  float_value: float_ option [@ocaml.doc ""];
  bam: int option [@ocaml.doc ""];
  baz: bool option [@ocaml.doc ""];
  bar: string option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type recursive_xml_shapes_output_nested1 =
  {
  nested: recursive_xml_shapes_output_nested2 option [@ocaml.doc ""];
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
and recursive_xml_shapes_output_nested2 =
  {
  recursive_member: recursive_xml_shapes_output_nested1 option
    [@ocaml.doc ""];
  bar: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec recursive_xml_shapes_output =
  {
  nested: recursive_xml_shapes_output_nested1 option [@ocaml.doc ""]}
[@@ocaml.doc ""]
type nonrec query_timestamps_input =
  {
  epoch_target: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  epoch_member: CoreTypes.Timestamp.t option [@ocaml.doc ""];
  normal_format: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""]
type nonrec nested_struct_with_list =
  {
  list_arg: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_lists_input =
  {
  nested_with_list: nested_struct_with_list option [@ocaml.doc ""];
  list_arg_with_xml_name: string list option [@ocaml.doc ""];
  list_arg_with_xml_name_member: string list option [@ocaml.doc ""];
  complex_list_arg: greeting_struct list option [@ocaml.doc ""];
  list_arg: string list option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec query_idempotency_token_auto_fill_input =
  {
  token: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec put_with_content_encoding_input =
  {
  data: string option [@ocaml.doc ""];
  encoding: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec nested_structures_input =
  {
  nested: struct_arg option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec invalid_greeting = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This error is thrown when an invalid greeting value is provided."]
type nonrec ignores_wrapping_xml_name_output =
  {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec host_label_input = {
  label: string [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec greeting_with_errors_output =
  {
  greeting: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_nested_error_data = {
  foo: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: string option [@ocaml.doc ""]}[@@ocaml.doc
                                             "This error is thrown when a request is invalid."]
type nonrec fractional_seconds_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec datetime_offsets_output =
  {
  datetime: CoreTypes.Timestamp.t option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec retry_mode =
  | ADAPTIVE [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""]
  | LEGACY [@ocaml.doc ""][@@ocaml.doc
                            "Controls the strategy used for retries."]
type nonrec environment_config =
  {
  aw_s__profil_e: string option [@ocaml.doc ""];
  aw_s__sessio_n__toke_n: string option [@ocaml.doc ""];
  aw_s__retr_y__mod_e: retry_mode option [@ocaml.doc ""];
  aw_s__defaul_t__regio_n: string option [@ocaml.doc ""];
  aw_s__secre_t__acces_s__ke_y: string option [@ocaml.doc ""];
  aw_s__acces_s__ke_y__i_d: string option [@ocaml.doc ""]}[@@ocaml.doc
                                                            "Config settings that can be set as environment variables."]
type nonrec s3_addressing_style =
  | VIRTUAL [@ocaml.doc ""]
  | PATH [@ocaml.doc ""]
  | AUTO [@ocaml.doc ""][@@ocaml.doc
                          "Controls the S3 addressing bucket style."]
type nonrec s3_config =
  {
  use_dualstack_endpoint: bool option [@ocaml.doc ""];
  use_accelerate_endpoint: bool option [@ocaml.doc ""];
  addressing_style: s3_addressing_style option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 "Configuration specific to S3."]
type nonrec file_config_settings =
  {
  max_attempts: short option [@ocaml.doc ""];
  retry_mode: retry_mode option [@ocaml.doc ""];
  s3: s3_config option [@ocaml.doc ""];
  region: string option [@ocaml.doc ""];
  aws_session_token: string option [@ocaml.doc ""];
  aws_secret_access_key: string option [@ocaml.doc ""];
  aws_access_key_id: string option [@ocaml.doc ""]}[@@ocaml.doc
                                                     "Config settings that can be set in the AWS config / credentials file as part of a profile."]
type nonrec config_file = (string * file_config_settings) list[@@ocaml.doc
                                                                "A shape representing a parsed config file, which is a map of profile names to configuration sets."]
type nonrec retry_config =
  {
  max_attempts: short option [@ocaml.doc ""];
  mode: retry_mode option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Configuration specific to retries."]
type nonrec client_config =
  {
  aws_profile: string option [@ocaml.doc ""];
  retry_config: retry_config option [@ocaml.doc ""];
  s3: s3_config option [@ocaml.doc ""];
  region: string option [@ocaml.doc ""];
  aws_session_token: string option [@ocaml.doc ""];
  aws_secret_access_key: string option [@ocaml.doc ""];
  aws_access_key_id: string option [@ocaml.doc ""]}[@@ocaml.doc
                                                     "Configuration that is set on the constructed client."]
type nonrec operation_config = {
  s3: s3_config option [@ocaml.doc ""]}[@@ocaml.doc
                                         "Configuration that is set for the scope of a single operation."]
type nonrec scoped_config =
  {
  operation: operation_config option [@ocaml.doc ""];
  client: client_config option [@ocaml.doc ""];
  credentials_file: config_file option [@ocaml.doc ""];
  config_file: config_file option [@ocaml.doc ""];
  environment: environment_config option [@ocaml.doc ""]}[@@ocaml.doc
                                                           "Config settings that are scoped to different sources, such as environment variables or the AWS config file."]
type nonrec error_code_params =
  {
  type_: string option
    [@ocaml.doc
      "The query error type exposed to the customer. If the SDK exposes the query error type to customers, this value MUST be asserted to match the exposed query error type. This is modifiable by the awsQueryError trait. For services with awsQueryCompatible, it will be exposed in the `x-amzn-query-error` header which takes the form `Code;Fault`. This value represents the `Fault` portion."];
  code: string
    [@ocaml.doc
      "The error code exposed to the customer. If the SDK exposes the error code to customers, this value MUST be asserted to match the exposed error code. This is modifiable by the awsQueryError trait. For services with awsQueryCompatible, it will be exposed in the `x-amzn-query-error` header which takes the form `Code;Fault`. This value represents the `Code` portion."]}
[@@ocaml.doc
  "Vendor params to use when making assertions about error code or query error type."]
type nonrec aws_config =
  {
  scoped_config: scoped_config option [@ocaml.doc ""];
  clock_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "This is the time that should be set during the course of the test. This is important for things like signing where the clock time impacts the result."]}
[@@ocaml.doc ""]
type nonrec rest_xml =
  {
  no_error_wrapping: bool option
    [@ocaml.doc
      "Disables the serialization wrapping of error properties in an 'Error' XML element."]}
[@@ocaml.doc "A RESTful protocol that sends XML in structured payloads."]
type nonrec checksum_algorithm =
  | SHA256 [@ocaml.doc "SHA256"]
  | SHA1 [@ocaml.doc "SHA1"]
  | CRC32 [@ocaml.doc "CRC32"]
  | CRC32C [@ocaml.doc "CRC32C"]
  | CRC64NVME [@ocaml.doc "CRC64NVME"][@@ocaml.doc ""]
type nonrec http_checksum =
  {
  response_algorithms: checksum_algorithm list option
    [@ocaml.doc
      "Defines the checksum algorithms clients should look for when performing HTTP response checksum validation."];
  request_validation_mode_member: string option
    [@ocaml.doc
      "Defines a top-level operation input member used to opt-in to response checksum validation."];
  request_checksum_required: bool option
    [@ocaml.doc
      "Indicates an operation requires a checksum in its HTTP request."];
  request_algorithm_member: string option
    [@ocaml.doc
      "Defines a top-level operation input member that is used to configure request checksum behavior."]}
[@@ocaml.doc "Indicates that an operation supports checksum validation."]
type nonrec aws_query_error =
  {
  http_response_code: int
    [@ocaml.doc
      "The HTTP response code used on a response containing this error shape."];
  code: string
    [@ocaml.doc
      "The value used to distinguish this error shape during serialization."]}
[@@ocaml.doc
  "Provides the value in the 'Code' distinguishing field and HTTP response code for an operation error."]
type nonrec http_configuration =
  {
  event_stream_http: string list option
    [@ocaml.doc
      "The priority ordered list of supported HTTP protocol versions that are required when using event streams with the service. If not set, this value defaults to the value of the `http` member. Any entry in `eventStreamHttp` MUST also appear in `http`."];
  http: string list option
    [@ocaml.doc
      "The priority ordered list of supported HTTP protocol versions."]}
[@@ocaml.doc
  "Contains HTTP protocol configuration for HTTP-based protocols."]
type nonrec sigv4a = {
  name: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec sigv4 = {
  name: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec cognito_user_pools =
  {
  provider_arns: string list
    [@ocaml.doc
      "A list of the Amazon Cognito user pool ARNs. Each element is of this format: `arn:aws:cognito-idp:\\{region\\}:\\{account_id\\}:userpool/\\{user_pool_id\\}`."]}
[@@ocaml.doc "Configures an Amazon Cognito User Pools auth scheme."]
type nonrec taggable_api_config =
  {
  list_tags_api: string
    [@ocaml.doc
      "The `listTagsApi` property is a string value that references a non- instance operation which gets the current tags on the resource."];
  untag_api: string
    [@ocaml.doc
      "The `untagApi` property is a string value that references a non-instance operation that removes tags on the resource."];
  tag_api: string
    [@ocaml.doc
      "The `tagApi` property is a string value that references a non-instance or create operation that creates or updates tags on the resource."]}
[@@ocaml.doc
  "Structure representing the configuration of resource specific tagging APIs"]
type nonrec taggable =
  {
  disable_system_tags: bool option
    [@ocaml.doc
      "Flag indicating if the resource is not able to carry AWS system level. Used by service principals. Default value is `false`"];
  api_config: taggable_api_config option
    [@ocaml.doc
      "Specifies configuration for resource specific tagging APIs if the resource has them."];
  property: string option
    [@ocaml.doc
      "The `property` property is a string value that identifies which resource property represents tags for the resource."]}
[@@ocaml.doc
  "Indicates a resource supports CRUD operations for tags. Either through resource lifecycle or instance operations or tagging operations on the service."]
type nonrec tag_enabled =
  {
  disable_default_operations: bool option
    [@ocaml.doc
      "The `disableDefaultOperations` property is a boolean value that specifies if the service does not have the standard tag operations supporting all resources on the service. Default value is `false`"]}
[@@ocaml.doc
  "Annotates a service as having tagging on 1 or more resources and associated APIs to perform CRUD operations on those tags"]
type nonrec service =
  {
  endpoint_prefix: string option
    [@ocaml.doc
      "The `endpointPrefix` property is a string value that identifies which endpoint in a given region should be used to connect to the service. For example, most services in the AWS standard partition have endpoints which follow the format: `\\{endpointPrefix\\}.\\{region\\}.amazonaws.com`. A service with the endpoint prefix example in the region us-west-2 might have the endpoint example.us-west-2.amazonaws.com. This value is not unique across services and is subject to change. Therefore, it MUST NOT be used for client naming or for any other purpose that requires a static, unique identifier. sdkId should be used for those purposes. Additionally, this value can be used to attempt to resolve endpoints."];
  doc_id: string option
    [@ocaml.doc
      "The `docId` property is a string value that defines the identifier used to implemention linking between service and SDK documentation for AWS services. If not specified, this value defaults to the `sdkId` in lower case plus the service `version` property, separated by dashes."];
  cloud_trail_event_source: string option
    [@ocaml.doc
      "The `cloudTrailEventSource` property is a string value that defines the AWS customer-facing eventSource property contained in CloudTrail event records emitted by the service. If not specified, this value defaults to the `arnNamespace` plus `.amazonaws.com`."];
  cloud_formation_name: string option
    [@ocaml.doc
      "The `cloudFormationName` property is a string value that specifies the AWS CloudFormation service name (e.g., `ApiGateway`). When not set, this value defaults to the name of the service shape. This value is part of the CloudFormation resource type name that is automatically assigned to resources in the service (e.g., `AWS::::resourceName`)."];
  arn_namespace: string option
    [@ocaml.doc
      "The `arnNamespace` property is a string value that defines the ARN service namespace of the service (e.g., \"apigateway\"). This value is used in ARNs assigned to resources in the service. If not set, this value defaults to the lowercase name of the service shape."];
  sdk_id: string
    [@ocaml.doc
      "The `sdkId` property is a required string value that specifies the AWS SDK service ID (e.g., \"API Gateway\"). This value is used for generating client names in SDKs and for linking between services."]}
[@@ocaml.doc
  "An AWS service is defined using the `aws.api#service` trait. This trait provides information about the service like the name used to generate AWS SDK client classes and the namespace used in ARNs."]
type nonrec data =
  | PERMISSIONS_DATA
  [@ocaml.doc
    "Designates security and access roles, rules, usage policies, and permissions."]
  | TAG_DATA
  [@ocaml.doc "Designates metadata tags applied to AWS resources."]
  | SERVICE_ATTRIBUTES
  [@ocaml.doc
    "Service Attributes means service usage data related to a customer\226\128\153s account, such as resource identifiers, metadata tags, security and access roles, rules, usage policies, permissions, usage statistics, logging data, and analytics."]
  | CUSTOMER_ACCOUNT_INFORMATION
  [@ocaml.doc
    "Account information means information about customers that customers provide to AWS in connection with the creation or administration of customers\226\128\153 accounts."]
  | CUSTOMER_CONTENT
  [@ocaml.doc
    "Customer content means any software (including machine images), data, text, audio, video or images that customers or any customer end user transfers to AWS for processing, storage or hosting by AWS services in connection with the customer\226\128\153s accounts and any computational results that customers or any customer end user derive from the foregoing through their use of AWS services."]
[@@ocaml.doc
  "Designates the target as containing data of a known classification level."]
type nonrec client_endpoint_discovery =
  {
  error: string option
    [@ocaml.doc
      "Indicates the error that tells clients that the endpoint they are using is no longer valid. This error MUST be bound to any operation bound to the service which is marked with the aws.api#clientDiscoveredEndpoint trait."];
  operation: string
    [@ocaml.doc
      "Indicates the operation that clients should use to discover endpoints for the service."]}
[@@ocaml.doc "Configures endpoint discovery for the service."]
type nonrec client_discovered_endpoint =
  {
  required: bool
    [@ocaml.doc
      "This field denotes whether or not this operation requires the use of a specific endpoint. If this field is false, the standard regional endpoint for a service can handle this request. The client will start sending requests to the standard regional endpoint while working to discover a more specific endpoint."]}
[@@ocaml.doc
  "Indicates that the target operation should use the client's endpoint discovery logic."]
type nonrec arn_reference =
  {
  service: string option
    [@ocaml.doc
      "The Smithy service absolute shape ID that is referenced by the ARN. The targeted service is not required to be found in the model, allowing for external shapes to be referenced without needing to take on an additional dependency."];
  resource: string option
    [@ocaml.doc
      "An absolute shape ID that references the Smithy resource type contained in the ARN (e.g., `com.foo#SomeResource`). The targeted resource is not required to be found in the model, allowing for external shapes to be referenced without needing to take on an additional dependency. If the shape is found in the model, it MUST target a resource shape, and the resource MUST be found within the closure of the referenced service shape."];
  type_: string option
    [@ocaml.doc "The AWS CloudFormation resource type contained in the ARN."]}
[@@ocaml.doc "Marks a string as containing an ARN."]
type nonrec resource_delimiter =
  | COLON [@ocaml.doc "The `:` character."]
  | FORWARD_SLASH [@ocaml.doc "The `/` character."][@@ocaml.doc
                                                     "The possible delimiters for an ARN resource segment."]
type nonrec arn =
  {
  reusable: bool option
    [@ocaml.doc
      "Set to true to indicate that an ARN may be reused for different instances of a resource."];
  resource_delimiter: resource_delimiter option
    [@ocaml.doc
      "Defines which character is used to delimit sections of the resource segment of an ARN. This can only be set if absolute is set to true."];
  no_account: bool option
    [@ocaml.doc
      "Set to true to specify that the ARN does not contain an account ID. If not set, or if set to false, the resolved ARN will contain a placeholder for the customer account ID. This can only be set to true if absolute is not set or is false."];
  no_region: bool option
    [@ocaml.doc
      "Set to true to specify that the ARN does not contain a region. If not set, or if set to false, the resolved ARN will contain a placeholder for the region. This can only be set to true if `absolute` is not set or is false."];
  absolute: bool option
    [@ocaml.doc
      "Set to true to indicate that the ARN template contains a fully-formed ARN that does not need to be merged with the service. This type of ARN MUST be used when the identifier of a resource is an ARN or is based on the ARN identifier of a parent resource."];
  template: string
    [@ocaml.doc
      "Defines the ARN template. The provided string contains URI-template style label placeholders that contain the name of one of the identifiers defined in the `identifiers` property of the resource. These labels can be substituted at runtime with the actual identifiers of the resource. Every identifier name of the resource MUST have corresponding label of the same name. Note that percent-encoding **is not** performed on these placeholder values; they are to be replaced literally. For relative ARN templates that have not set `absolute` to `true`, the template string contains only the resource part of the ARN (for example, `foo/\\{MyResourceId\\}`). Relative ARNs MUST NOT start with \"/\"."]}
[@@ocaml.doc ""]