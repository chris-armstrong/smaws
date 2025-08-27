include Protocols_gen.AwsJson.Make (Http.Client)

(* Expose the first-class module interface for testing *)
let request_with_http_module = Protocols_gen.AwsJson.request_with_http_module
