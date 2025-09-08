open Types
let make_greeting_struct
  ?salutation:(salutation_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ salutation = salutation_ } : greeting_struct)