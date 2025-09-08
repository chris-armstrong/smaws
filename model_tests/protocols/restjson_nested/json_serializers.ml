open Smaws_Lib.Json.SerializeHelpers
open Types
let greeting_struct_to_yojson (x : greeting_struct) =
  assoc_to_yojson
    [("salutation",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.salutation))]