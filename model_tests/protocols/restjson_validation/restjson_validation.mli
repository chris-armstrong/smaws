(** 
    Rest Json Validation Protocol client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_missing_key_structure :
  hi:my_string_key -> unit -> missing_key_structure
val make_sensitive_validation_input :
  ?string_:sensitive_pattern_string -> unit -> sensitive_validation_input
val make_recursive_structures_input :
  ?union:recursive_union_one -> unit -> recursive_structures_input
val make_malformed_unique_items_input :
  ?union_list:Shared.Types.union_set ->
    ?structure_list_with_no_key:structure_set_with_no_key ->
      ?structure_list:Shared.Types.structure_set ->
        ?list_list:Shared.Types.list_set ->
          ?int_enum_list:Shared.Types.integer_enum_set ->
            ?enum_list:Shared.Types.foo_enum_set ->
              ?http_date_list:Shared.Types.http_date_set ->
                ?date_time_list:Shared.Types.date_time_set ->
                  ?timestamp_list:Shared.Types.timestamp_set ->
                    ?long_list:Shared.Types.long_set ->
                      ?integer_list:Shared.Types.integer_set ->
                        ?short_list:Shared.Types.short_set ->
                          ?byte_list:Shared.Types.byte_set ->
                            ?string_list:Shared.Types.string_set ->
                              ?boolean_list:Shared.Types.boolean_set ->
                                ?blob_list:Shared.Types.blob_set ->
                                  unit -> malformed_unique_items_input
val make_malformed_required_input :
  string_in_header:Smaws_Lib.Smithy_api.Types.string_ ->
    string_in_query:Smaws_Lib.Smithy_api.Types.string_ ->
      string_:Smaws_Lib.Smithy_api.Types.string_ ->
        unit -> malformed_required_input
val make_malformed_range_override_input :
  ?max_float:max_float ->
    ?min_float:min_float ->
      ?float_:range_float ->
        ?max_long:max_long ->
          ?min_long:min_long ->
            ?long:range_long ->
              ?max_integer:max_integer ->
                ?min_integer:min_integer ->
                  ?integer:range_integer ->
                    ?max_short:max_short ->
                      ?min_short:min_short ->
                        ?short:range_short ->
                          ?max_byte:max_byte ->
                            ?min_byte:min_byte ->
                              ?byte:range_byte ->
                                unit -> malformed_range_override_input
val make_malformed_range_input :
  ?max_float:max_float ->
    ?min_float:min_float ->
      ?float_:range_float ->
        ?max_long:max_long ->
          ?min_long:min_long ->
            ?long:range_long ->
              ?max_integer:max_integer ->
                ?min_integer:min_integer ->
                  ?integer:range_integer ->
                    ?max_short:max_short ->
                      ?min_short:min_short ->
                        ?short:range_short ->
                          ?max_byte:max_byte ->
                            ?min_byte:min_byte ->
                              ?byte:range_byte ->
                                unit -> malformed_range_input
val make_malformed_pattern_override_input :
  ?union:pattern_union_override ->
    ?map:pattern_map_override ->
      ?list:pattern_list_override ->
        ?string_:pattern_string -> unit -> malformed_pattern_override_input
val make_malformed_pattern_input :
  ?union:pattern_union ->
    ?map:pattern_map ->
      ?list:pattern_list ->
        ?evil_string:evil_string ->
          ?string_:pattern_string -> unit -> malformed_pattern_input
val make_malformed_length_query_string_input :
  ?string_:length_string -> unit -> malformed_length_query_string_input
val make_malformed_length_override_input :
  ?map:length_map ->
    ?list:length_list ->
      ?max_string:max_length_string ->
        ?min_string:min_length_string ->
          ?string_:length_string ->
            ?blob:length_blob -> unit -> malformed_length_override_input
val make_malformed_length_input :
  ?map:length_map ->
    ?list:length_list ->
      ?max_string:max_length_string ->
        ?min_string:min_length_string ->
          ?string_:length_string ->
            ?blob:length_blob -> unit -> malformed_length_input
val make_malformed_enum_input :
  ?union:enum_union ->
    ?map:enum_map ->
      ?list:enum_list ->
        ?string_with_enum_trait:enum_trait_string ->
          ?string_:enum_string -> unit -> malformed_enum_input
(** {1:operations Operations} *)

(** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
