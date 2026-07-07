open Types
open Service_metadata

module BatchCreateBillScenarioCommitmentModification = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_create_bill_scenario_commitment_modification_request) =
    let input =
      Json_serializers.batch_create_bill_scenario_commitment_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchCreateBillScenarioCommitmentModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_create_bill_scenario_commitment_modification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_create_bill_scenario_commitment_modification_request) =
    let input =
      Json_serializers.batch_create_bill_scenario_commitment_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchCreateBillScenarioCommitmentModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_create_bill_scenario_commitment_modification_response_of_yojson
      ~error_deserializer
end

module BatchCreateBillScenarioUsageModification = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_create_bill_scenario_usage_modification_request) =
    let input =
      Json_serializers.batch_create_bill_scenario_usage_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchCreateBillScenarioUsageModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_create_bill_scenario_usage_modification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_create_bill_scenario_usage_modification_request) =
    let input =
      Json_serializers.batch_create_bill_scenario_usage_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchCreateBillScenarioUsageModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_create_bill_scenario_usage_modification_response_of_yojson
      ~error_deserializer
end

module BatchCreateWorkloadEstimateUsage = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_create_workload_estimate_usage_request) =
    let input = Json_serializers.batch_create_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchCreateWorkloadEstimateUsage" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.batch_create_workload_estimate_usage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_create_workload_estimate_usage_request) =
    let input = Json_serializers.batch_create_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchCreateWorkloadEstimateUsage" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.batch_create_workload_estimate_usage_response_of_yojson
      ~error_deserializer
end

module BatchDeleteBillScenarioCommitmentModification = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_bill_scenario_commitment_modification_request) =
    let input =
      Json_serializers.batch_delete_bill_scenario_commitment_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchDeleteBillScenarioCommitmentModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_delete_bill_scenario_commitment_modification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_delete_bill_scenario_commitment_modification_request) =
    let input =
      Json_serializers.batch_delete_bill_scenario_commitment_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchDeleteBillScenarioCommitmentModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_delete_bill_scenario_commitment_modification_response_of_yojson
      ~error_deserializer
end

module BatchDeleteBillScenarioUsageModification = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_bill_scenario_usage_modification_request) =
    let input =
      Json_serializers.batch_delete_bill_scenario_usage_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchDeleteBillScenarioUsageModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_delete_bill_scenario_usage_modification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_delete_bill_scenario_usage_modification_request) =
    let input =
      Json_serializers.batch_delete_bill_scenario_usage_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchDeleteBillScenarioUsageModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_delete_bill_scenario_usage_modification_response_of_yojson
      ~error_deserializer
end

module BatchDeleteWorkloadEstimateUsage = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_workload_estimate_usage_request) =
    let input = Json_serializers.batch_delete_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchDeleteWorkloadEstimateUsage" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.batch_delete_workload_estimate_usage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_workload_estimate_usage_request) =
    let input = Json_serializers.batch_delete_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchDeleteWorkloadEstimateUsage" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.batch_delete_workload_estimate_usage_response_of_yojson
      ~error_deserializer
end

module BatchUpdateBillScenarioCommitmentModification = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_update_bill_scenario_commitment_modification_request) =
    let input =
      Json_serializers.batch_update_bill_scenario_commitment_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchUpdateBillScenarioCommitmentModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_update_bill_scenario_commitment_modification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_update_bill_scenario_commitment_modification_request) =
    let input =
      Json_serializers.batch_update_bill_scenario_commitment_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchUpdateBillScenarioCommitmentModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_update_bill_scenario_commitment_modification_response_of_yojson
      ~error_deserializer
end

module BatchUpdateBillScenarioUsageModification = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_update_bill_scenario_usage_modification_request) =
    let input =
      Json_serializers.batch_update_bill_scenario_usage_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchUpdateBillScenarioUsageModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_update_bill_scenario_usage_modification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : batch_update_bill_scenario_usage_modification_request) =
    let input =
      Json_serializers.batch_update_bill_scenario_usage_modification_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchUpdateBillScenarioUsageModification" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_update_bill_scenario_usage_modification_response_of_yojson
      ~error_deserializer
end

module BatchUpdateWorkloadEstimateUsage = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_update_workload_estimate_usage_request) =
    let input = Json_serializers.batch_update_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.BatchUpdateWorkloadEstimateUsage" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.batch_update_workload_estimate_usage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_update_workload_estimate_usage_request) =
    let input = Json_serializers.batch_update_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.BatchUpdateWorkloadEstimateUsage" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.batch_update_workload_estimate_usage_response_of_yojson
      ~error_deserializer
end

module CreateBillEstimate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_bill_estimate_request) =
    let input = Json_serializers.create_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.CreateBillEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_bill_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_bill_estimate_request) =
    let input = Json_serializers.create_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.CreateBillEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_bill_estimate_response_of_yojson
      ~error_deserializer
end

module CreateBillScenario = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_bill_scenario_request) =
    let input = Json_serializers.create_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.CreateBillScenario"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_bill_scenario_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_bill_scenario_request) =
    let input = Json_serializers.create_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.CreateBillScenario" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_bill_scenario_response_of_yojson
      ~error_deserializer
end

module CreateWorkloadEstimate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workload_estimate_request) =
    let input = Json_serializers.create_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.CreateWorkloadEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workload_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workload_estimate_request) =
    let input = Json_serializers.create_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.CreateWorkloadEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workload_estimate_response_of_yojson
      ~error_deserializer
end

module DeleteBillEstimate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_bill_estimate_request) =
    let input = Json_serializers.delete_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.DeleteBillEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bill_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_bill_estimate_request) =
    let input = Json_serializers.delete_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.DeleteBillEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bill_estimate_response_of_yojson
      ~error_deserializer
end

module DeleteBillScenario = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_bill_scenario_request) =
    let input = Json_serializers.delete_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.DeleteBillScenario"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bill_scenario_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_bill_scenario_request) =
    let input = Json_serializers.delete_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.DeleteBillScenario" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_bill_scenario_response_of_yojson
      ~error_deserializer
end

module DeleteWorkloadEstimate = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workload_estimate_request) =
    let input = Json_serializers.delete_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.DeleteWorkloadEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workload_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workload_estimate_request) =
    let input = Json_serializers.delete_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.DeleteWorkloadEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workload_estimate_response_of_yojson
      ~error_deserializer
end

module GetBillEstimate = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_bill_estimate_request) =
    let input = Json_serializers.get_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.GetBillEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_bill_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_bill_estimate_request) =
    let input = Json_serializers.get_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.GetBillEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_bill_estimate_response_of_yojson
      ~error_deserializer
end

module GetBillScenario = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_bill_scenario_request) =
    let input = Json_serializers.get_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.GetBillScenario"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_bill_scenario_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_bill_scenario_request) =
    let input = Json_serializers.get_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.GetBillScenario" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_bill_scenario_response_of_yojson
      ~error_deserializer
end

module GetPreferences = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_preferences_request) =
    let input = Json_serializers.get_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.GetPreferences"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_preferences_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_preferences_request) =
    let input = Json_serializers.get_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.GetPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_preferences_response_of_yojson ~error_deserializer
end

module GetWorkloadEstimate = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_workload_estimate_request) =
    let input = Json_serializers.get_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.GetWorkloadEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workload_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workload_estimate_request) =
    let input = Json_serializers.get_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.GetWorkloadEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workload_estimate_response_of_yojson
      ~error_deserializer
end

module ListBillEstimateCommitments = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_estimate_commitments_request) =
    let input = Json_serializers.list_bill_estimate_commitments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateCommitments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_estimate_commitments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bill_estimate_commitments_request) =
    let input = Json_serializers.list_bill_estimate_commitments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateCommitments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_estimate_commitments_response_of_yojson
      ~error_deserializer
end

module ListBillEstimateInputCommitmentModifications = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_estimate_input_commitment_modifications_request) =
    let input =
      Json_serializers.list_bill_estimate_input_commitment_modifications_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateInputCommitmentModifications" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_bill_estimate_input_commitment_modifications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_bill_estimate_input_commitment_modifications_request) =
    let input =
      Json_serializers.list_bill_estimate_input_commitment_modifications_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateInputCommitmentModifications" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_bill_estimate_input_commitment_modifications_response_of_yojson
      ~error_deserializer
end

module ListBillEstimateInputUsageModifications = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_estimate_input_usage_modifications_request) =
    let input =
      Json_serializers.list_bill_estimate_input_usage_modifications_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateInputUsageModifications" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_bill_estimate_input_usage_modifications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bill_estimate_input_usage_modifications_request)
      =
    let input =
      Json_serializers.list_bill_estimate_input_usage_modifications_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateInputUsageModifications" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_bill_estimate_input_usage_modifications_response_of_yojson
      ~error_deserializer
end

module ListBillEstimateLineItems = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_estimate_line_items_request) =
    let input = Json_serializers.list_bill_estimate_line_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateLineItems" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_estimate_line_items_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bill_estimate_line_items_request) =
    let input = Json_serializers.list_bill_estimate_line_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimateLineItems" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_estimate_line_items_response_of_yojson
      ~error_deserializer
end

module ListBillEstimates = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_estimates_request) =
    let input = Json_serializers.list_bill_estimates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.ListBillEstimates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_estimates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bill_estimates_request) =
    let input = Json_serializers.list_bill_estimates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillEstimates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_estimates_response_of_yojson
      ~error_deserializer
end

module ListBillScenarioCommitmentModifications = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_scenario_commitment_modifications_request) =
    let input =
      Json_serializers.list_bill_scenario_commitment_modifications_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.ListBillScenarioCommitmentModifications" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_bill_scenario_commitment_modifications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bill_scenario_commitment_modifications_request)
      =
    let input =
      Json_serializers.list_bill_scenario_commitment_modifications_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillScenarioCommitmentModifications" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_bill_scenario_commitment_modifications_response_of_yojson
      ~error_deserializer
end

module ListBillScenarioUsageModifications = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_scenario_usage_modifications_request) =
    let input = Json_serializers.list_bill_scenario_usage_modifications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.ListBillScenarioUsageModifications" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_bill_scenario_usage_modifications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bill_scenario_usage_modifications_request) =
    let input = Json_serializers.list_bill_scenario_usage_modifications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillScenarioUsageModifications" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_bill_scenario_usage_modifications_response_of_yojson
      ~error_deserializer
end

module ListBillScenarios = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bill_scenarios_request) =
    let input = Json_serializers.list_bill_scenarios_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.ListBillScenarios"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_scenarios_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bill_scenarios_request) =
    let input = Json_serializers.list_bill_scenarios_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListBillScenarios" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bill_scenarios_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListWorkloadEstimateUsage = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workload_estimate_usage_request) =
    let input = Json_serializers.list_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBCMPricingCalculator.ListWorkloadEstimateUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workload_estimate_usage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workload_estimate_usage_request) =
    let input = Json_serializers.list_workload_estimate_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListWorkloadEstimateUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workload_estimate_usage_response_of_yojson
      ~error_deserializer
end

module ListWorkloadEstimates = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workload_estimates_request) =
    let input = Json_serializers.list_workload_estimates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.ListWorkloadEstimates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workload_estimates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workload_estimates_request) =
    let input = Json_serializers.list_workload_estimates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.ListWorkloadEstimates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workload_estimates_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateBillEstimate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_bill_estimate_request) =
    let input = Json_serializers.update_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.UpdateBillEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_bill_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_bill_estimate_request) =
    let input = Json_serializers.update_bill_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.UpdateBillEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_bill_estimate_response_of_yojson
      ~error_deserializer
end

module UpdateBillScenario = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_bill_scenario_request) =
    let input = Json_serializers.update_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.UpdateBillScenario"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_bill_scenario_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_bill_scenario_request) =
    let input = Json_serializers.update_bill_scenario_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.UpdateBillScenario" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_bill_scenario_response_of_yojson
      ~error_deserializer
end

module UpdatePreferences = struct
  let error_to_string = function
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bcmpricingcalculator#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_preferences_request) =
    let input = Json_serializers.update_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.UpdatePreferences"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_preferences_request) =
    let input = Json_serializers.update_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.UpdatePreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_preferences_response_of_yojson
      ~error_deserializer
end

module UpdateWorkloadEstimate = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.bcmpricingcalculator#ConflictException"
    | `DataUnavailableException _ -> "com.amazonaws.bcmpricingcalculator#DataUnavailableException"
    | `ResourceNotFoundException _ -> "com.amazonaws.bcmpricingcalculator#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataUnavailableException" ->
          `DataUnavailableException
            (Json_deserializers.data_unavailable_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workload_estimate_request) =
    let input = Json_serializers.update_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBCMPricingCalculator.UpdateWorkloadEstimate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workload_estimate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workload_estimate_request) =
    let input = Json_serializers.update_workload_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBCMPricingCalculator.UpdateWorkloadEstimate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workload_estimate_response_of_yojson
      ~error_deserializer
end
