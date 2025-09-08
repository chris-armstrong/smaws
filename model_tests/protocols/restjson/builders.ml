open Types
let make_union_input_output ?contents:(contents_ : my_union option) () =
  ({ contents = contents_ } : union_input_output)
let make_top_level () = (() : unit)
let make_timestamp_format_headers_i_o
  ?target_date_time:(target_date_time_ : Shared.Types.date_time option)
  ?target_http_date:(target_http_date_ : Shared.Types.http_date option)
  ?target_epoch_seconds:(target_epoch_seconds_ :
                          Shared.Types.epoch_seconds option)
  ?default_format:(default_format_ :
                    Smaws_Lib.Smithy_api.Types.timestamp option)
  ?member_date_time:(member_date_time_ :
                      Smaws_Lib.Smithy_api.Types.timestamp option)
  ?member_http_date:(member_http_date_ :
                      Smaws_Lib.Smithy_api.Types.timestamp option)
  ?member_epoch_seconds:(member_epoch_seconds_ :
                          Smaws_Lib.Smithy_api.Types.timestamp option)
  () =
  ({
     target_date_time = target_date_time_;
     target_http_date = target_http_date_;
     target_epoch_seconds = target_epoch_seconds_;
     default_format = default_format_;
     member_date_time = member_date_time_;
     member_http_date = member_http_date_;
     member_epoch_seconds = member_epoch_seconds_
   } : timestamp_format_headers_i_o)
let make_test_no_payload_input_output
  ?test_id:(test_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ test_id = test_id_ } : test_no_payload_input_output)
let make_payload_config
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ data = data_ } : payload_config)
let make_test_payload_structure_input_output
  ?payload_config:(payload_config_ : payload_config option)
  ?test_id:(test_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ payload_config = payload_config_; test_id = test_id_ } : test_payload_structure_input_output)
let make_test_payload_blob_input_output
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option)
  ?content_type:(content_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({ data = data_; content_type = content_type_ } : test_payload_blob_input_output)
let make_test_config
  ?timeout:(timeout_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ timeout = timeout_ } : test_config)
let make_test_body_structure_input_output
  ?test_config:(test_config_ : test_config option)
  ?test_id:(test_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ test_config = test_config_; test_id = test_id_ } : test_body_structure_input_output)
let make_structure_list_member
  ?b:(b_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?a:(a_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ b = b_; a = a_ } : structure_list_member)
let make_string_payload_input
  ?payload:(payload_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ payload = payload_ } : string_payload_input)
let make_streaming_traits_with_media_type_input_output
  ?blob:(blob_ : streaming_text_plain_blob option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ blob = blob_; foo = foo_ } : streaming_traits_with_media_type_input_output)
let make_streaming_traits_require_length_input
  ?blob:(blob_ : finite_streaming_blob option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ blob = blob_; foo = foo_ } : streaming_traits_require_length_input)
let make_streaming_traits_input_output ?blob:(blob_ : streaming_blob option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ blob = blob_; foo = foo_ } : streaming_traits_input_output)
let make_sparse_json_maps_input_output
  ?sparse_set_map:(sparse_set_map_ : sparse_set_map option)
  ?sparse_string_map:(sparse_string_map_ :
                       Shared.Types.sparse_string_map option)
  ?sparse_boolean_map:(sparse_boolean_map_ : sparse_boolean_map option)
  ?sparse_number_map:(sparse_number_map_ : sparse_number_map option)
  ?sparse_struct_map:(sparse_struct_map_ : sparse_struct_map option) () =
  ({
     sparse_set_map = sparse_set_map_;
     sparse_string_map = sparse_string_map_;
     sparse_boolean_map = sparse_boolean_map_;
     sparse_number_map = sparse_number_map_;
     sparse_struct_map = sparse_struct_map_
   } : sparse_json_maps_input_output)
let make_sparse_json_lists_input_output
  ?sparse_short_list:(sparse_short_list_ :
                       Shared.Types.sparse_short_list option)
  ?sparse_string_list:(sparse_string_list_ :
                        Shared.Types.sparse_string_list option)
  () =
  ({
     sparse_short_list = sparse_short_list_;
     sparse_string_list = sparse_string_list_
   } : sparse_json_lists_input_output)
let make_simple_scalar_properties_input_output
  ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option)
  ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
  ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
  ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?false_boolean_value:(false_boolean_value_ :
                         Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?true_boolean_value:(true_boolean_value_ :
                        Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     double_value = double_value_;
     float_value = float_value_;
     long_value = long_value_;
     integer_value = integer_value_;
     short_value = short_value_;
     byte_value = byte_value_;
     false_boolean_value = false_boolean_value_;
     true_boolean_value = true_boolean_value_;
     string_value = string_value_;
     foo = foo_
   } : simple_scalar_properties_input_output)
let make_response_code_required_output
  ~response_code:(response_code_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ response_code = response_code_ } : response_code_required_output)
let make_response_code_http_fallback_input_output () = (() : unit)
let make_recursive_shapes_input_output_nested1
  ?nested:(nested_ : recursive_shapes_input_output_nested2 option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ nested = nested_; foo = foo_ } : recursive_shapes_input_output_nested1)
let make_recursive_shapes_input_output_nested2
  ?recursive_member:(recursive_member_ :
                      recursive_shapes_input_output_nested1 option)
  ?bar:(bar_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ recursive_member = recursive_member_; bar = bar_ } : recursive_shapes_input_output_nested2)
let make_recursive_shapes_input_output
  ?nested:(nested_ : recursive_shapes_input_output_nested1 option) () =
  ({ nested = nested_ } : recursive_shapes_input_output)
let make_query_precedence_input ?baz:(baz_ : Shared.Types.string_map option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ baz = baz_; foo = foo_ } : query_precedence_input)
let make_query_params_as_string_list_map_input
  ?foo:(foo_ : Shared.Types.string_list_map option)
  ?qux:(qux_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; qux = qux_ } : query_params_as_string_list_map_input)
let make_query_idempotency_token_auto_fill_input
  ?token:(token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ token = token_ } : query_idempotency_token_auto_fill_input)
let make_put_with_content_encoding_input
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?encoding:(encoding_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ data = data_; encoding = encoding_ } : put_with_content_encoding_input)
let make_post_union_with_json_name_output
  ~value:(value_ : union_with_json_name) () =
  ({ value = value_ } : post_union_with_json_name_output)
let make_post_union_with_json_name_input
  ?value:(value_ : union_with_json_name option) () =
  ({ value = value_ } : post_union_with_json_name_input)
let make_post_player_action_output ~action:(action_ : player_action) () =
  ({ action = action_ } : post_player_action_output)
let make_post_player_action_input ?action:(action_ : player_action option) ()
  = ({ action = action_ } : post_player_action_input)
let make_operation_with_nested_structure_output () = (() : unit)
let make_operation_with_nested_structure_input
  ~top_level:(top_level_ : top_level) () =
  ({ top_level = top_level_ } : operation_with_nested_structure_input)
let make_operation_with_defaults_output () = (() : unit)
let make_defaults () = (() : unit)
let make_client_optional_defaults
  ?member:(member_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ member = member_ } : client_optional_defaults)
let make_operation_with_defaults_input
  ?other_top_level_default:(other_top_level_default_ :
                             Smaws_Lib.Smithy_api.Types.integer option)
  ?top_level_default:(top_level_default_ :
                       Smaws_Lib.Smithy_api.Types.string_ option)
  ?client_optional_defaults:(client_optional_defaults_ :
                              client_optional_defaults option)
  ?defaults:(defaults_ : defaults option) () =
  ({
     other_top_level_default = other_top_level_default_;
     top_level_default = top_level_default_;
     client_optional_defaults = client_optional_defaults_;
     defaults = defaults_
   } : operation_with_defaults_input)
let make_omits_serializing_empty_lists_input
  ?query_integer_enum_list:(query_integer_enum_list_ :
                             Shared.Types.integer_enum_list option)
  ?query_enum_list:(query_enum_list_ : Shared.Types.foo_enum_list option)
  ?query_timestamp_list:(query_timestamp_list_ :
                          Shared.Types.timestamp_list option)
  ?query_boolean_list:(query_boolean_list_ :
                        Shared.Types.boolean_list option)
  ?query_double_list:(query_double_list_ : Shared.Types.double_list option)
  ?query_integer_list:(query_integer_list_ :
                        Shared.Types.integer_list option)
  ?query_string_list:(query_string_list_ : Shared.Types.string_list option)
  () =
  ({
     query_integer_enum_list = query_integer_enum_list_;
     query_enum_list = query_enum_list_;
     query_timestamp_list = query_timestamp_list_;
     query_boolean_list = query_boolean_list_;
     query_double_list = query_double_list_;
     query_integer_list = query_integer_list_;
     query_string_list = query_string_list_
   } : omits_serializing_empty_lists_input)
let make_omits_null_serializes_empty_string_input
  ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?null_value:(null_value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ empty_string = empty_string_; null_value = null_value_ } : omits_null_serializes_empty_string_input)
let make_null_and_empty_headers_i_o ?c:(c_ : Shared.Types.string_list option)
  ?b:(b_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?a:(a_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ c = c_; b = b_; a = a_ } : null_and_empty_headers_i_o)
let make_no_input_and_output_output () = (() : unit)
let make_media_type_header_output ?json:(json_ : json_value option) () =
  ({ json = json_ } : media_type_header_output)
let make_media_type_header_input ?json:(json_ : json_value option) () =
  ({ json = json_ } : media_type_header_input)
let make_malformed_union_input ?union:(union_ : simple_union option) () =
  ({ union = union_ } : malformed_union_input)
let make_malformed_timestamp_query_http_date_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_query_http_date_input)
let make_malformed_timestamp_query_epoch_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_query_epoch_input)
let make_malformed_timestamp_query_default_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_query_default_input)
let make_malformed_timestamp_path_http_date_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_path_http_date_input)
let make_malformed_timestamp_path_epoch_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_path_epoch_input)
let make_malformed_timestamp_path_default_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_path_default_input)
let make_malformed_timestamp_header_epoch_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_header_epoch_input)
let make_malformed_timestamp_header_default_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_header_default_input)
let make_malformed_timestamp_header_date_time_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_header_date_time_input)
let make_malformed_timestamp_body_http_date_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_body_http_date_input)
let make_malformed_timestamp_body_default_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_body_default_input)
let make_malformed_timestamp_body_date_time_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ timestamp = timestamp_ } : malformed_timestamp_body_date_time_input)
let make_malformed_string_input ?blob:(blob_ : json_header_string option) ()
  = ({ blob = blob_ } : malformed_string_input)
let make_malformed_short_input
  ?short_in_header:(short_in_header_ :
                     Smaws_Lib.Smithy_api.Types.short option)
  ?short_in_query:(short_in_query_ : Smaws_Lib.Smithy_api.Types.short option)
  ?short_in_body:(short_in_body_ : Smaws_Lib.Smithy_api.Types.short option)
  ~short_in_path:(short_in_path_ : Smaws_Lib.Smithy_api.Types.short) () =
  ({
     short_in_header = short_in_header_;
     short_in_query = short_in_query_;
     short_in_path = short_in_path_;
     short_in_body = short_in_body_
   } : malformed_short_input)
let make_malformed_request_body_input
  ?float_:(float__ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?int_:(int__ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ float_ = float__; int_ = int__ } : malformed_request_body_input)
let make_malformed_map_input ?body_map:(body_map_ : simple_map option) () =
  ({ body_map = body_map_ } : malformed_map_input)
let make_malformed_long_input
  ?long_in_header:(long_in_header_ : Smaws_Lib.Smithy_api.Types.long option)
  ?long_in_query:(long_in_query_ : Smaws_Lib.Smithy_api.Types.long option)
  ?long_in_body:(long_in_body_ : Smaws_Lib.Smithy_api.Types.long option)
  ~long_in_path:(long_in_path_ : Smaws_Lib.Smithy_api.Types.long) () =
  ({
     long_in_header = long_in_header_;
     long_in_query = long_in_query_;
     long_in_path = long_in_path_;
     long_in_body = long_in_body_
   } : malformed_long_input)
let make_malformed_list_input ?body_list:(body_list_ : simple_list option) ()
  = ({ body_list = body_list_ } : malformed_list_input)
let make_malformed_integer_input
  ?integer_in_header:(integer_in_header_ :
                       Smaws_Lib.Smithy_api.Types.integer option)
  ?integer_in_query:(integer_in_query_ :
                      Smaws_Lib.Smithy_api.Types.integer option)
  ?integer_in_body:(integer_in_body_ :
                     Smaws_Lib.Smithy_api.Types.integer option)
  ~integer_in_path:(integer_in_path_ : Smaws_Lib.Smithy_api.Types.integer) ()
  =
  ({
     integer_in_header = integer_in_header_;
     integer_in_query = integer_in_query_;
     integer_in_path = integer_in_path_;
     integer_in_body = integer_in_body_
   } : malformed_integer_input)
let make_malformed_float_input
  ?float_in_header:(float_in_header_ :
                     Smaws_Lib.Smithy_api.Types.float_ option)
  ?float_in_query:(float_in_query_ :
                    Smaws_Lib.Smithy_api.Types.float_ option)
  ?float_in_body:(float_in_body_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ~float_in_path:(float_in_path_ : Smaws_Lib.Smithy_api.Types.float_) () =
  ({
     float_in_header = float_in_header_;
     float_in_query = float_in_query_;
     float_in_path = float_in_path_;
     float_in_body = float_in_body_
   } : malformed_float_input)
let make_malformed_double_input
  ?double_in_header:(double_in_header_ :
                      Smaws_Lib.Smithy_api.Types.double option)
  ?double_in_query:(double_in_query_ :
                     Smaws_Lib.Smithy_api.Types.double option)
  ?double_in_body:(double_in_body_ :
                    Smaws_Lib.Smithy_api.Types.double option)
  ~double_in_path:(double_in_path_ : Smaws_Lib.Smithy_api.Types.double) () =
  ({
     double_in_header = double_in_header_;
     double_in_query = double_in_query_;
     double_in_path = double_in_path_;
     double_in_body = double_in_body_
   } : malformed_double_input)
let make_malformed_content_type_with_payload_input
  ?payload:(payload_ : Shared.Types.jpeg_blob option) () =
  ({ payload = payload_ } : malformed_content_type_with_payload_input)
let make_malformed_content_type_without_body_empty_input_input
  ?header:(header_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ header = header_ } : malformed_content_type_without_body_empty_input_input)
let make_malformed_content_type_with_generic_string_input
  ?payload:(payload_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ payload = payload_ } : malformed_content_type_with_generic_string_input)
let make_malformed_byte_input
  ?byte_in_header:(byte_in_header_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?byte_in_query:(byte_in_query_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?byte_in_body:(byte_in_body_ : Smaws_Lib.Smithy_api.Types.byte option)
  ~byte_in_path:(byte_in_path_ : Smaws_Lib.Smithy_api.Types.byte) () =
  ({
     byte_in_header = byte_in_header_;
     byte_in_query = byte_in_query_;
     byte_in_path = byte_in_path_;
     byte_in_body = byte_in_body_
   } : malformed_byte_input)
let make_malformed_boolean_input
  ?boolean_in_header:(boolean_in_header_ :
                       Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?boolean_in_query:(boolean_in_query_ :
                      Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?boolean_in_body:(boolean_in_body_ :
                     Smaws_Lib.Smithy_api.Types.boolean_ option)
  ~boolean_in_path:(boolean_in_path_ : Smaws_Lib.Smithy_api.Types.boolean_)
  () =
  ({
     boolean_in_header = boolean_in_header_;
     boolean_in_query = boolean_in_query_;
     boolean_in_path = boolean_in_path_;
     boolean_in_body = boolean_in_body_
   } : malformed_boolean_input)
let make_malformed_blob_input
  ?blob:(blob_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ blob = blob_ } : malformed_blob_input)
let make_malformed_accept_with_payload_output
  ?payload:(payload_ : Shared.Types.jpeg_blob option) () =
  ({ payload = payload_ } : malformed_accept_with_payload_output)
let make_malformed_accept_with_generic_string_output
  ?payload:(payload_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ payload = payload_ } : malformed_accept_with_generic_string_output)
let make_json_timestamps_input_output
  ?http_date_on_target:(http_date_on_target_ : Shared.Types.http_date option)
  ?http_date:(http_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
  ?epoch_seconds_on_target:(epoch_seconds_on_target_ :
                             Shared.Types.epoch_seconds option)
  ?epoch_seconds:(epoch_seconds_ :
                   Smaws_Lib.Smithy_api.Types.timestamp option)
  ?date_time_on_target:(date_time_on_target_ : Shared.Types.date_time option)
  ?date_time:(date_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
  ?normal:(normal_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     http_date_on_target = http_date_on_target_;
     http_date = http_date_;
     epoch_seconds_on_target = epoch_seconds_on_target_;
     epoch_seconds = epoch_seconds_;
     date_time_on_target = date_time_on_target_;
     date_time = date_time_;
     normal = normal_
   } : json_timestamps_input_output)
let make_json_maps_input_output
  ?dense_set_map:(dense_set_map_ : dense_set_map option)
  ?dense_string_map:(dense_string_map_ : dense_string_map option)
  ?dense_boolean_map:(dense_boolean_map_ : dense_boolean_map option)
  ?dense_number_map:(dense_number_map_ : dense_number_map option)
  ?dense_struct_map:(dense_struct_map_ : dense_struct_map option) () =
  ({
     dense_set_map = dense_set_map_;
     dense_string_map = dense_string_map_;
     dense_boolean_map = dense_boolean_map_;
     dense_number_map = dense_number_map_;
     dense_struct_map = dense_struct_map_
   } : json_maps_input_output)
let make_json_lists_input_output
  ?structure_list:(structure_list_ : structure_list option)
  ?nested_string_list:(nested_string_list_ :
                        Shared.Types.nested_string_list option)
  ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
  ?enum_list:(enum_list_ : Shared.Types.foo_enum_list option)
  ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_list option)
  ?boolean_list:(boolean_list_ : Shared.Types.boolean_list option)
  ?integer_list:(integer_list_ : Shared.Types.integer_list option)
  ?string_set:(string_set_ : Shared.Types.string_set option)
  ?string_list:(string_list_ : Shared.Types.string_list option) () =
  ({
     structure_list = structure_list_;
     nested_string_list = nested_string_list_;
     int_enum_list = int_enum_list_;
     enum_list = enum_list_;
     timestamp_list = timestamp_list_;
     boolean_list = boolean_list_;
     integer_list = integer_list_;
     string_set = string_set_;
     string_list = string_list_
   } : json_lists_input_output)
let make_json_int_enums_input_output
  ?integer_enum_map:(integer_enum_map_ :
                      Shared.Types.integer_enum_map option)
  ?integer_enum_set:(integer_enum_set_ :
                      Shared.Types.integer_enum_set option)
  ?integer_enum_list:(integer_enum_list_ :
                       Shared.Types.integer_enum_list option)
  ?integer_enum3:(integer_enum3_ : Shared.Types.integer_enum option)
  ?integer_enum2:(integer_enum2_ : Shared.Types.integer_enum option)
  ?integer_enum1:(integer_enum1_ : Shared.Types.integer_enum option) () =
  ({
     integer_enum_map = integer_enum_map_;
     integer_enum_set = integer_enum_set_;
     integer_enum_list = integer_enum_list_;
     integer_enum3 = integer_enum3_;
     integer_enum2 = integer_enum2_;
     integer_enum1 = integer_enum1_
   } : json_int_enums_input_output)
let make_json_enums_input_output
  ?foo_enum_map:(foo_enum_map_ : Shared.Types.foo_enum_map option)
  ?foo_enum_set:(foo_enum_set_ : Shared.Types.foo_enum_set option)
  ?foo_enum_list:(foo_enum_list_ : Shared.Types.foo_enum_list option)
  ?foo_enum3:(foo_enum3_ : Shared.Types.foo_enum option)
  ?foo_enum2:(foo_enum2_ : Shared.Types.foo_enum option)
  ?foo_enum1:(foo_enum1_ : Shared.Types.foo_enum option) () =
  ({
     foo_enum_map = foo_enum_map_;
     foo_enum_set = foo_enum_set_;
     foo_enum_list = foo_enum_list_;
     foo_enum3 = foo_enum3_;
     foo_enum2 = foo_enum2_;
     foo_enum1 = foo_enum1_
   } : json_enums_input_output)
let make_json_blobs_input_output
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : json_blobs_input_output)
let make_input_and_output_with_headers_i_o
  ?header_integer_enum_list:(header_integer_enum_list_ :
                              Shared.Types.integer_enum_list option)
  ?header_integer_enum:(header_integer_enum_ :
                         Shared.Types.integer_enum option)
  ?header_enum_list:(header_enum_list_ : Shared.Types.foo_enum_list option)
  ?header_enum:(header_enum_ : Shared.Types.foo_enum option)
  ?header_timestamp_list:(header_timestamp_list_ :
                           Shared.Types.timestamp_list option)
  ?header_boolean_list:(header_boolean_list_ :
                         Shared.Types.boolean_list option)
  ?header_integer_list:(header_integer_list_ :
                         Shared.Types.integer_list option)
  ?header_string_set:(header_string_set_ : Shared.Types.string_set option)
  ?header_string_list:(header_string_list_ : Shared.Types.string_list option)
  ?header_false_bool:(header_false_bool_ :
                       Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?header_true_bool:(header_true_bool_ :
                      Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?header_double:(header_double_ : Smaws_Lib.Smithy_api.Types.double option)
  ?header_float:(header_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?header_long:(header_long_ : Smaws_Lib.Smithy_api.Types.long option)
  ?header_integer:(header_integer_ :
                    Smaws_Lib.Smithy_api.Types.integer option)
  ?header_short:(header_short_ : Smaws_Lib.Smithy_api.Types.short option)
  ?header_byte:(header_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?header_string:(header_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({
     header_integer_enum_list = header_integer_enum_list_;
     header_integer_enum = header_integer_enum_;
     header_enum_list = header_enum_list_;
     header_enum = header_enum_;
     header_timestamp_list = header_timestamp_list_;
     header_boolean_list = header_boolean_list_;
     header_integer_list = header_integer_list_;
     header_string_set = header_string_set_;
     header_string_list = header_string_list_;
     header_false_bool = header_false_bool_;
     header_true_bool = header_true_bool_;
     header_double = header_double_;
     header_float = header_float_;
     header_long = header_long_;
     header_integer = header_integer_;
     header_short = header_short_;
     header_byte = header_byte_;
     header_string = header_string_
   } : input_and_output_with_headers_i_o)
let make_ignore_query_params_in_response_output
  ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ baz = baz_ } : ignore_query_params_in_response_output)
let make_http_response_code_output
  ?status:(status_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ status = status_ } : http_response_code_output)
let make_http_request_with_regex_literal_input
  ~str:(str_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ str = str_ } : http_request_with_regex_literal_input)
let make_http_request_with_labels_and_timestamp_format_input
  ~target_date_time:(target_date_time_ : Shared.Types.date_time)
  ~target_http_date:(target_http_date_ : Shared.Types.http_date)
  ~target_epoch_seconds:(target_epoch_seconds_ : Shared.Types.epoch_seconds)
  ~default_format:(default_format_ : Smaws_Lib.Smithy_api.Types.timestamp)
  ~member_date_time:(member_date_time_ :
                      Smaws_Lib.Smithy_api.Types.timestamp)
  ~member_http_date:(member_http_date_ :
                      Smaws_Lib.Smithy_api.Types.timestamp)
  ~member_epoch_seconds:(member_epoch_seconds_ :
                          Smaws_Lib.Smithy_api.Types.timestamp)
  () =
  ({
     target_date_time = target_date_time_;
     target_http_date = target_http_date_;
     target_epoch_seconds = target_epoch_seconds_;
     default_format = default_format_;
     member_date_time = member_date_time_;
     member_http_date = member_http_date_;
     member_epoch_seconds = member_epoch_seconds_
   } : http_request_with_labels_and_timestamp_format_input)
let make_http_request_with_labels_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
  ~boolean_:(boolean__ : Smaws_Lib.Smithy_api.Types.boolean_)
  ~double:(double_ : Smaws_Lib.Smithy_api.Types.double)
  ~float_:(float__ : Smaws_Lib.Smithy_api.Types.float_)
  ~long:(long_ : Smaws_Lib.Smithy_api.Types.long)
  ~integer:(integer_ : Smaws_Lib.Smithy_api.Types.integer)
  ~short:(short_ : Smaws_Lib.Smithy_api.Types.short)
  ~string_:(string__ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     timestamp = timestamp_;
     boolean_ = boolean__;
     double = double_;
     float_ = float__;
     long = long_;
     integer = integer_;
     short = short_;
     string_ = string__
   } : http_request_with_labels_input)
let make_http_request_with_greedy_label_in_path_input
  ~baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_)
  ~foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ baz = baz_; foo = foo_ } : http_request_with_greedy_label_in_path_input)
let make_http_request_with_float_labels_input
  ~double:(double_ : Smaws_Lib.Smithy_api.Types.double)
  ~float_:(float__ : Smaws_Lib.Smithy_api.Types.float_) () =
  ({ double = double_; float_ = float__ } : http_request_with_float_labels_input)
let make_http_prefix_headers_in_response_output
  ?prefix_headers:(prefix_headers_ : Shared.Types.string_map option) () =
  ({ prefix_headers = prefix_headers_ } : http_prefix_headers_in_response_output)
let make_http_prefix_headers_in_response_input () = (() : unit)
let make_http_prefix_headers_output
  ?foo_map:(foo_map_ : Shared.Types.string_map option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo_map = foo_map_; foo = foo_ } : http_prefix_headers_output)
let make_http_prefix_headers_input
  ?foo_map:(foo_map_ : Shared.Types.string_map option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo_map = foo_map_; foo = foo_ } : http_prefix_headers_input)
let make_http_payload_with_union_input_output
  ?nested:(nested_ : union_payload option) () =
  ({ nested = nested_ } : http_payload_with_union_input_output)
let make_nested_payload
  ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_; greeting = greeting_ } : nested_payload)
let make_http_payload_with_structure_input_output
  ?nested:(nested_ : nested_payload option) () =
  ({ nested = nested_ } : http_payload_with_structure_input_output)
let make_http_payload_traits_with_media_type_input_output
  ?blob:(blob_ : Shared.Types.text_plain_blob option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ blob = blob_; foo = foo_ } : http_payload_traits_with_media_type_input_output)
let make_http_payload_traits_input_output
  ?blob:(blob_ : Smaws_Lib.Smithy_api.Types.blob option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ blob = blob_; foo = foo_ } : http_payload_traits_input_output)
let make_enum_payload_input ?payload:(payload_ : string_enum option) () =
  ({ payload = payload_ } : enum_payload_input)
let make_http_empty_prefix_headers_output
  ?specific_header:(specific_header_ :
                     Smaws_Lib.Smithy_api.Types.string_ option)
  ?prefix_headers:(prefix_headers_ : Shared.Types.string_map option) () =
  ({ specific_header = specific_header_; prefix_headers = prefix_headers_ } : 
  http_empty_prefix_headers_output)
let make_http_empty_prefix_headers_input
  ?specific_header:(specific_header_ :
                     Smaws_Lib.Smithy_api.Types.string_ option)
  ?prefix_headers:(prefix_headers_ : Shared.Types.string_map option) () =
  ({ specific_header = specific_header_; prefix_headers = prefix_headers_ } : 
  http_empty_prefix_headers_input)
let make_http_checksum_required_input_output
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_ } : http_checksum_required_input_output)
let make_complex_nested_error_data
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_ } : complex_nested_error_data)
let make_greeting_with_errors_output
  ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ greeting = greeting_ } : greeting_with_errors_output)
let make_fractional_seconds_output
  ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : fractional_seconds_output)
let make_host_label_input
  ~label:(label_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ label = label_ } : host_label_input)
let make_empty_input_and_empty_output_output () = (() : unit)
let make_empty_input_and_empty_output_input () = (() : unit)
let make_document_type_as_payload_input_output
  ?document_value:(document_value_ : document option) () =
  ({ document_value = document_value_ } : document_type_as_payload_input_output)
let make_document_type_as_map_value_input_output
  ?doc_valued_map:(doc_valued_map_ : document_valued_map option) () =
  ({ doc_valued_map = doc_valued_map_ } : document_type_as_map_value_input_output)
let make_document_type_input_output
  ?document_value:(document_value_ : document option)
  ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({ document_value = document_value_; string_value = string_value_ } : 
  document_type_input_output)
let make_datetime_offsets_output
  ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : datetime_offsets_output)
let make_content_type_parameters_output () = (() : unit)
let make_content_type_parameters_input
  ?value:(value_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ value = value_ } : content_type_parameters_input)
let make_constant_query_string_input
  ~hello:(hello_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ hello = hello_ } : constant_query_string_input)
let make_constant_and_variable_query_string_input
  ?maybe_set:(maybe_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ maybe_set = maybe_set_; baz = baz_ } : constant_and_variable_query_string_input)
let make_all_query_string_types_input
  ?query_params_map_of_string_list:(query_params_map_of_string_list_ :
                                     Shared.Types.string_list_map option)
  ?query_integer_enum_list:(query_integer_enum_list_ :
                             Shared.Types.integer_enum_list option)
  ?query_integer_enum:(query_integer_enum_ :
                        Shared.Types.integer_enum option)
  ?query_enum_list:(query_enum_list_ : Shared.Types.foo_enum_list option)
  ?query_enum:(query_enum_ : Shared.Types.foo_enum option)
  ?query_timestamp_list:(query_timestamp_list_ :
                          Shared.Types.timestamp_list option)
  ?query_timestamp:(query_timestamp_ :
                     Smaws_Lib.Smithy_api.Types.timestamp option)
  ?query_boolean_list:(query_boolean_list_ :
                        Shared.Types.boolean_list option)
  ?query_boolean:(query_boolean_ :
                   Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?query_double_list:(query_double_list_ : Shared.Types.double_list option)
  ?query_double:(query_double_ : Smaws_Lib.Smithy_api.Types.double option)
  ?query_float:(query_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?query_long:(query_long_ : Smaws_Lib.Smithy_api.Types.long option)
  ?query_integer_set:(query_integer_set_ : Shared.Types.integer_set option)
  ?query_integer_list:(query_integer_list_ :
                        Shared.Types.integer_list option)
  ?query_integer:(query_integer_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?query_short:(query_short_ : Smaws_Lib.Smithy_api.Types.short option)
  ?query_byte:(query_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?query_string_set:(query_string_set_ : Shared.Types.string_set option)
  ?query_string_list:(query_string_list_ : Shared.Types.string_list option)
  ?query_string:(query_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({
     query_params_map_of_string_list = query_params_map_of_string_list_;
     query_integer_enum_list = query_integer_enum_list_;
     query_integer_enum = query_integer_enum_;
     query_enum_list = query_enum_list_;
     query_enum = query_enum_;
     query_timestamp_list = query_timestamp_list_;
     query_timestamp = query_timestamp_;
     query_boolean_list = query_boolean_list_;
     query_boolean = query_boolean_;
     query_double_list = query_double_list_;
     query_double = query_double_;
     query_float = query_float_;
     query_long = query_long_;
     query_integer_set = query_integer_set_;
     query_integer_list = query_integer_list_;
     query_integer = query_integer_;
     query_short = query_short_;
     query_byte = query_byte_;
     query_string_set = query_string_set_;
     query_string_list = query_string_list_;
     query_string = query_string_
   } : all_query_string_types_input)
let make_farewell
  ?phrase:(phrase_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ phrase = phrase_ } : farewell)
let make_dialog ?farewell:(farewell_ : farewell option)
  ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?language:(language_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ farewell = farewell_; greeting = greeting_; language = language_ } : 
  dialog)
let make_nested_defaults_mixin ?dialog_map:(dialog_map_ : dialog_map option)
  ?dialog_list:(dialog_list_ : dialog_list option) ~dialog:(dialog_ : dialog)
  () =
  ({ dialog_map = dialog_map_; dialog_list = dialog_list_; dialog = dialog_ } : 
  nested_defaults_mixin)
let make_defaults_mixin
  ?zero_double:(zero_double_ : Smaws_Lib.Smithy_api.Types.double option)
  ?zero_float:(zero_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?zero_long:(zero_long_ : Smaws_Lib.Smithy_api.Types.long option)
  ?zero_integer:(zero_integer_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?zero_short:(zero_short_ : Smaws_Lib.Smithy_api.Types.short option)
  ?zero_byte:(zero_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?empty_blob:(empty_blob_ : Smaws_Lib.Smithy_api.Types.blob option)
  ?false_boolean:(false_boolean_ :
                   Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?default_int_enum:(default_int_enum_ : test_int_enum option)
  ?default_enum:(default_enum_ : test_enum option)
  ?default_map:(default_map_ : test_string_map option)
  ?default_double:(default_double_ :
                    Smaws_Lib.Smithy_api.Types.double option)
  ?default_float:(default_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?default_long:(default_long_ : Smaws_Lib.Smithy_api.Types.long option)
  ?default_integer:(default_integer_ :
                     Smaws_Lib.Smithy_api.Types.integer option)
  ?default_short:(default_short_ : Smaws_Lib.Smithy_api.Types.short option)
  ?default_byte:(default_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?default_blob:(default_blob_ : Smaws_Lib.Smithy_api.Types.blob option)
  ?default_timestamp:(default_timestamp_ :
                       Smaws_Lib.Smithy_api.Types.timestamp option)
  ?default_null_document:(default_null_document_ : document option)
  ?default_document_list:(default_document_list_ : document option)
  ?default_document_boolean:(default_document_boolean_ : document option)
  ?default_document_string:(default_document_string_ : document option)
  ?default_document_map:(default_document_map_ : document option)
  ?default_list:(default_list_ : test_string_list option)
  ?default_boolean:(default_boolean_ :
                     Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?default_string:(default_string_ :
                    Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({
     zero_double = zero_double_;
     zero_float = zero_float_;
     zero_long = zero_long_;
     zero_integer = zero_integer_;
     zero_short = zero_short_;
     zero_byte = zero_byte_;
     empty_blob = empty_blob_;
     false_boolean = false_boolean_;
     empty_string = empty_string_;
     default_int_enum = default_int_enum_;
     default_enum = default_enum_;
     default_map = default_map_;
     default_double = default_double_;
     default_float = default_float_;
     default_long = default_long_;
     default_integer = default_integer_;
     default_short = default_short_;
     default_byte = default_byte_;
     default_blob = default_blob_;
     default_timestamp = default_timestamp_;
     default_null_document = default_null_document_;
     default_document_list = default_document_list_;
     default_document_boolean = default_document_boolean_;
     default_document_string = default_document_string_;
     default_document_map = default_document_map_;
     default_list = default_list_;
     default_boolean = default_boolean_;
     default_string = default_string_
   } : defaults_mixin)