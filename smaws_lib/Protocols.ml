(** This module provides the underlying Smithy protocol implementations that are used by the AWS
    Service SDKs *)

type http_error = [ `HttpError of Http.http_failure ]
type aws_service_error = [ `AWSServiceError of AwsErrors.aws_service_error ]

module AwsJson = Protocols_impl.AwsJson
(** AwsJson_1.0 and AwsJson_1.1 protocol support (over eio-based httpun client) *)

module AwsQuery = Protocols_impl.AwsQuery
(** AwsQuery protocol support (over eio-based httpun client) *)
