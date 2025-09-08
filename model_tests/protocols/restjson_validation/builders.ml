open Types
let make_missing_key_structure ~hi:(hi_ : my_string_key) () =
  ({ hi = hi_ } : missing_key_structure)
let make_sensitive_validation_input
  ?string_:(string__ : sensitive_pattern_string option) () =
  ({ string_ = string__ } : sensitive_validation_input)
let make_recursive_structures_input
  ?union:(union_ : recursive_union_one option) () =
  ({ union = union_ } : recursive_structures_input)
let make_malformed_unique_items_input
  ?union_list:(union_list_ : Shared.Types.union_set option)
  ?structure_list_with_no_key:(structure_list_with_no_key_ :
                                structure_set_with_no_key option)
  ?structure_list:(structure_list_ : Shared.Types.structure_set option)
  ?list_list:(list_list_ : Shared.Types.list_set option)
  ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_set option)
  ?enum_list:(enum_list_ : Shared.Types.foo_enum_set option)
  ?http_date_list:(http_date_list_ : Shared.Types.http_date_set option)
  ?date_time_list:(date_time_list_ : Shared.Types.date_time_set option)
  ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_set option)
  ?long_list:(long_list_ : Shared.Types.long_set option)
  ?integer_list:(integer_list_ : Shared.Types.integer_set option)
  ?short_list:(short_list_ : Shared.Types.short_set option)
  ?byte_list:(byte_list_ : Shared.Types.byte_set option)
  ?string_list:(string_list_ : Shared.Types.string_set option)
  ?boolean_list:(boolean_list_ : Shared.Types.boolean_set option)
  ?blob_list:(blob_list_ : Shared.Types.blob_set option) () =
  ({
     union_list = union_list_;
     structure_list_with_no_key = structure_list_with_no_key_;
     structure_list = structure_list_;
     list_list = list_list_;
     int_enum_list = int_enum_list_;
     enum_list = enum_list_;
     http_date_list = http_date_list_;
     date_time_list = date_time_list_;
     timestamp_list = timestamp_list_;
     long_list = long_list_;
     integer_list = integer_list_;
     short_list = short_list_;
     byte_list = byte_list_;
     string_list = string_list_;
     boolean_list = boolean_list_;
     blob_list = blob_list_
   } : malformed_unique_items_input)
let make_malformed_required_input
  ~string_in_header:(string_in_header_ : Smaws_Lib.Smithy_api.Types.string_)
  ~string_in_query:(string_in_query_ : Smaws_Lib.Smithy_api.Types.string_)
  ~string_:(string__ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     string_in_header = string_in_header_;
     string_in_query = string_in_query_;
     string_ = string__
   } : malformed_required_input)
let make_malformed_range_override_input
  ?max_float:(max_float_ : max_float option)
  ?min_float:(min_float_ : min_float option)
  ?float_:(float__ : range_float option)
  ?max_long:(max_long_ : max_long option)
  ?min_long:(min_long_ : min_long option) ?long:(long_ : range_long option)
  ?max_integer:(max_integer_ : max_integer option)
  ?min_integer:(min_integer_ : min_integer option)
  ?integer:(integer_ : range_integer option)
  ?max_short:(max_short_ : max_short option)
  ?min_short:(min_short_ : min_short option)
  ?short:(short_ : range_short option)
  ?max_byte:(max_byte_ : max_byte option)
  ?min_byte:(min_byte_ : min_byte option) ?byte:(byte_ : range_byte option)
  () =
  ({
     max_float = max_float_;
     min_float = min_float_;
     float_ = float__;
     max_long = max_long_;
     min_long = min_long_;
     long = long_;
     max_integer = max_integer_;
     min_integer = min_integer_;
     integer = integer_;
     max_short = max_short_;
     min_short = min_short_;
     short = short_;
     max_byte = max_byte_;
     min_byte = min_byte_;
     byte = byte_
   } : malformed_range_override_input)
let make_malformed_range_input ?max_float:(max_float_ : max_float option)
  ?min_float:(min_float_ : min_float option)
  ?float_:(float__ : range_float option)
  ?max_long:(max_long_ : max_long option)
  ?min_long:(min_long_ : min_long option) ?long:(long_ : range_long option)
  ?max_integer:(max_integer_ : max_integer option)
  ?min_integer:(min_integer_ : min_integer option)
  ?integer:(integer_ : range_integer option)
  ?max_short:(max_short_ : max_short option)
  ?min_short:(min_short_ : min_short option)
  ?short:(short_ : range_short option)
  ?max_byte:(max_byte_ : max_byte option)
  ?min_byte:(min_byte_ : min_byte option) ?byte:(byte_ : range_byte option)
  () =
  ({
     max_float = max_float_;
     min_float = min_float_;
     float_ = float__;
     max_long = max_long_;
     min_long = min_long_;
     long = long_;
     max_integer = max_integer_;
     min_integer = min_integer_;
     integer = integer_;
     max_short = max_short_;
     min_short = min_short_;
     short = short_;
     max_byte = max_byte_;
     min_byte = min_byte_;
     byte = byte_
   } : malformed_range_input)
let make_malformed_pattern_override_input
  ?union:(union_ : pattern_union_override option)
  ?map:(map_ : pattern_map_override option)
  ?list:(list_ : pattern_list_override option)
  ?string_:(string__ : pattern_string option) () =
  ({ union = union_; map = map_; list = list_; string_ = string__ } : 
  malformed_pattern_override_input)
let make_malformed_pattern_input ?union:(union_ : pattern_union option)
  ?map:(map_ : pattern_map option) ?list:(list_ : pattern_list option)
  ?evil_string:(evil_string_ : evil_string option)
  ?string_:(string__ : pattern_string option) () =
  ({
     union = union_;
     map = map_;
     list = list_;
     evil_string = evil_string_;
     string_ = string__
   } : malformed_pattern_input)
let make_malformed_length_query_string_input
  ?string_:(string__ : length_string option) () =
  ({ string_ = string__ } : malformed_length_query_string_input)
let make_malformed_length_override_input ?map:(map_ : length_map option)
  ?list:(list_ : length_list option)
  ?max_string:(max_string_ : max_length_string option)
  ?min_string:(min_string_ : min_length_string option)
  ?string_:(string__ : length_string option)
  ?blob:(blob_ : length_blob option) () =
  ({
     map = map_;
     list = list_;
     max_string = max_string_;
     min_string = min_string_;
     string_ = string__;
     blob = blob_
   } : malformed_length_override_input)
let make_malformed_length_input ?map:(map_ : length_map option)
  ?list:(list_ : length_list option)
  ?max_string:(max_string_ : max_length_string option)
  ?min_string:(min_string_ : min_length_string option)
  ?string_:(string__ : length_string option)
  ?blob:(blob_ : length_blob option) () =
  ({
     map = map_;
     list = list_;
     max_string = max_string_;
     min_string = min_string_;
     string_ = string__;
     blob = blob_
   } : malformed_length_input)
let make_malformed_enum_input ?union:(union_ : enum_union option)
  ?map:(map_ : enum_map option) ?list:(list_ : enum_list option)
  ?string_with_enum_trait:(string_with_enum_trait_ :
                            enum_trait_string option)
  ?string_:(string__ : enum_string option) () =
  ({
     union = union_;
     map = map_;
     list = list_;
     string_with_enum_trait = string_with_enum_trait_;
     string_ = string__
   } : malformed_enum_input)