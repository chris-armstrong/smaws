open Smaws_Lib.Json.DeserializeHelpers
open Types
let greeting_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     salutation =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "salutation") _list path)
   } : greeting_struct)