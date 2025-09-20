open Types

let make_greeting_struct ?hi:(hi_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ hi = hi_ } : greeting_struct)
