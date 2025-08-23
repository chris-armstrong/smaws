open Types
open Service_metadata
module DescribeReportCreation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConstraintViolationException") ->
              `ConstraintViolationException
                (constraint_violation_exception_of_yojson tree path)
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_report_creation_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126DescribeReportCreation"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_report_creation_output_of_yojson
            ~error_deserializer
  end
module GetComplianceSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConstraintViolationException") ->
              `ConstraintViolationException
                (constraint_violation_exception_of_yojson tree path)
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_compliance_summary_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_compliance_summary_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126GetComplianceSummary"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_compliance_summary_output_of_yojson
            ~error_deserializer
  end
module GetResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "PaginationTokenExpiredException") ->
              `PaginationTokenExpiredException
                (pagination_token_expired_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resources_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_resources_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126GetResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resources_output_of_yojson
            ~error_deserializer
  end
module GetTagKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "PaginationTokenExpiredException") ->
              `PaginationTokenExpiredException
                (pagination_token_expired_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_tag_keys_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_tag_keys_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126GetTagKeys"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_tag_keys_output_of_yojson
            ~error_deserializer
  end
module GetTagValues =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "PaginationTokenExpiredException") ->
              `PaginationTokenExpiredException
                (pagination_token_expired_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_tag_values_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_tag_values_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126GetTagValues"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_tag_values_output_of_yojson
            ~error_deserializer
  end
module StartReportCreation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "ConstraintViolationException") ->
              `ConstraintViolationException
                (constraint_violation_exception_of_yojson tree path)
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_report_creation_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_report_creation_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126StartReportCreation"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_report_creation_output_of_yojson
            ~error_deserializer
  end
module TagResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resources_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resources_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126TagResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resources_output_of_yojson
            ~error_deserializer
  end
module UntagResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServiceException") ->
              `InternalServiceException
                (internal_service_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "ThrottledException") ->
              `ThrottledException (throttled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resources_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resources_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ResourceGroupsTaggingAPI_20170126UntagResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resources_output_of_yojson
            ~error_deserializer
  end