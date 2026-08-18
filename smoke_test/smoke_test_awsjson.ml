let () =
  let () = ignore (module Smaws_Client_SQS : sig end)
  let () = ignore (module Smaws_Client_DynamoDB : sig end)
  let () = ignore (module Smaws_Client_KMS : sig end)
  print_endline "AwsJson 1.0/1.1 SDK smoke test: OK"
