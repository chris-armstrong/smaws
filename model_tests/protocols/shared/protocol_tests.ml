open Alcotest
open Smaws_Test_Support_Lib
open Shared
let () =
  Eio_main.run @@ (fun env -> Alcotest.run "aws.protocoltests.shared" [])