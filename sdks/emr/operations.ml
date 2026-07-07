open Types
open Service_metadata

module AddInstanceFleet = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_instance_fleet_input) =
    let input = Json_serializers.add_instance_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.AddInstanceFleet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.add_instance_fleet_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_instance_fleet_input) =
    let input = Json_serializers.add_instance_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.AddInstanceFleet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_instance_fleet_output_of_yojson
      ~error_deserializer
end

module AddInstanceGroups = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_instance_groups_input) =
    let input = Json_serializers.add_instance_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.AddInstanceGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.add_instance_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_instance_groups_input) =
    let input = Json_serializers.add_instance_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.AddInstanceGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_instance_groups_output_of_yojson
      ~error_deserializer
end

module AddJobFlowSteps = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_job_flow_steps_input) =
    let input = Json_serializers.add_job_flow_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.AddJobFlowSteps" ~service
      ~context ~input ~output_deserializer:Json_deserializers.add_job_flow_steps_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_job_flow_steps_input) =
    let input = Json_serializers.add_job_flow_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.AddJobFlowSteps"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_job_flow_steps_output_of_yojson
      ~error_deserializer
end

module AddTags = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.AddTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_tags_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.AddTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.add_tags_output_of_yojson
      ~error_deserializer
end

module CancelSteps = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_steps_input) =
    let input = Json_serializers.cancel_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.CancelSteps" ~service ~context
      ~input ~output_deserializer:Json_deserializers.cancel_steps_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_steps_input) =
    let input = Json_serializers.cancel_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.CancelSteps"
      ~service ~context ~input ~output_deserializer:Json_deserializers.cancel_steps_output_of_yojson
      ~error_deserializer
end

module CreatePersistentAppUI = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_persistent_app_ui_input) =
    let input = Json_serializers.create_persistent_app_ui_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.CreatePersistentAppUI"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_persistent_app_ui_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_persistent_app_ui_input) =
    let input = Json_serializers.create_persistent_app_ui_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.CreatePersistentAppUI" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_persistent_app_ui_output_of_yojson
      ~error_deserializer
end

module CreateSecurityConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_security_configuration_input) =
    let input = Json_serializers.create_security_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.CreateSecurityConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_security_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_security_configuration_input) =
    let input = Json_serializers.create_security_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.CreateSecurityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_security_configuration_output_of_yojson
      ~error_deserializer
end

module CreateStudio = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_studio_input) =
    let input = Json_serializers.create_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.CreateStudio" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_studio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_studio_input) =
    let input = Json_serializers.create_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.CreateStudio"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_studio_output_of_yojson ~error_deserializer
end

module CreateStudioSessionMapping = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_studio_session_mapping_input) =
    let input = Json_serializers.create_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.CreateStudioSessionMapping"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_studio_session_mapping_input) =
    let input = Json_serializers.create_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.CreateStudioSessionMapping" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSecurityConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_security_configuration_input) =
    let input = Json_serializers.delete_security_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DeleteSecurityConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_security_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_security_configuration_input) =
    let input = Json_serializers.delete_security_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.DeleteSecurityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_security_configuration_output_of_yojson
      ~error_deserializer
end

module DeleteStudio = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_studio_input) =
    let input = Json_serializers.delete_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DeleteStudio" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_studio_input) =
    let input = Json_serializers.delete_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.DeleteStudio"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteStudioSessionMapping = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_studio_session_mapping_input) =
    let input = Json_serializers.delete_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DeleteStudioSessionMapping"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_studio_session_mapping_input) =
    let input = Json_serializers.delete_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.DeleteStudioSessionMapping" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeCluster = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cluster_input) =
    let input = Json_serializers.describe_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribeCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cluster_input) =
    let input = Json_serializers.describe_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.DescribeCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_cluster_output_of_yojson ~error_deserializer
end

module DescribeJobFlows = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_job_flows_input) =
    let input = Json_serializers.describe_job_flows_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribeJobFlows" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_job_flows_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_job_flows_input) =
    let input = Json_serializers.describe_job_flows_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.DescribeJobFlows" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_job_flows_output_of_yojson
      ~error_deserializer
end

module DescribeNotebookExecution = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_notebook_execution_input) =
    let input = Json_serializers.describe_notebook_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribeNotebookExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notebook_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_notebook_execution_input) =
    let input = Json_serializers.describe_notebook_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.DescribeNotebookExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notebook_execution_output_of_yojson
      ~error_deserializer
end

module DescribePersistentAppUI = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_persistent_app_ui_input) =
    let input = Json_serializers.describe_persistent_app_ui_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribePersistentAppUI"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_persistent_app_ui_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_persistent_app_ui_input) =
    let input = Json_serializers.describe_persistent_app_ui_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.DescribePersistentAppUI" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_persistent_app_ui_output_of_yojson
      ~error_deserializer
end

module DescribeReleaseLabel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_release_label_input) =
    let input = Json_serializers.describe_release_label_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribeReleaseLabel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_release_label_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_release_label_input) =
    let input = Json_serializers.describe_release_label_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.DescribeReleaseLabel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_release_label_output_of_yojson
      ~error_deserializer
end

module DescribeSecurityConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_security_configuration_input) =
    let input = Json_serializers.describe_security_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribeSecurityConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_security_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_security_configuration_input) =
    let input = Json_serializers.describe_security_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.DescribeSecurityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_security_configuration_output_of_yojson
      ~error_deserializer
end

module DescribeStep = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_step_input) =
    let input = Json_serializers.describe_step_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribeStep" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_step_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_step_input) =
    let input = Json_serializers.describe_step_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.DescribeStep"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_step_output_of_yojson ~error_deserializer
end

module DescribeStudio = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_studio_input) =
    let input = Json_serializers.describe_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.DescribeStudio" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_studio_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_studio_input) =
    let input = Json_serializers.describe_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.DescribeStudio"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_studio_output_of_yojson ~error_deserializer
end

module GetAutoTerminationPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_auto_termination_policy_input) =
    let input = Json_serializers.get_auto_termination_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.GetAutoTerminationPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_auto_termination_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_auto_termination_policy_input) =
    let input = Json_serializers.get_auto_termination_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetAutoTerminationPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_auto_termination_policy_output_of_yojson
      ~error_deserializer
end

module GetBlockPublicAccessConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_block_public_access_configuration_input) =
    let input = Json_serializers.get_block_public_access_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ElasticMapReduce.GetBlockPublicAccessConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_block_public_access_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_block_public_access_configuration_input) =
    let input = Json_serializers.get_block_public_access_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetBlockPublicAccessConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_block_public_access_configuration_output_of_yojson
      ~error_deserializer
end

module GetClusterSessionCredentials = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_cluster_session_credentials_input) =
    let input = Json_serializers.get_cluster_session_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.GetClusterSessionCredentials"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cluster_session_credentials_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_cluster_session_credentials_input) =
    let input = Json_serializers.get_cluster_session_credentials_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetClusterSessionCredentials" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cluster_session_credentials_output_of_yojson
      ~error_deserializer
end

module GetManagedScalingPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_managed_scaling_policy_input) =
    let input = Json_serializers.get_managed_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.GetManagedScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_managed_scaling_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_managed_scaling_policy_input) =
    let input = Json_serializers.get_managed_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetManagedScalingPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_managed_scaling_policy_output_of_yojson
      ~error_deserializer
end

module GetOnClusterAppUIPresignedURL = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_on_cluster_app_ui_presigned_url_input) =
    let input = Json_serializers.get_on_cluster_app_ui_presigned_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.GetOnClusterAppUIPresignedURL"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_on_cluster_app_ui_presigned_url_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_on_cluster_app_ui_presigned_url_input) =
    let input = Json_serializers.get_on_cluster_app_ui_presigned_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetOnClusterAppUIPresignedURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_on_cluster_app_ui_presigned_url_output_of_yojson
      ~error_deserializer
end

module GetPersistentAppUIPresignedURL = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_persistent_app_ui_presigned_url_input) =
    let input = Json_serializers.get_persistent_app_ui_presigned_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ElasticMapReduce.GetPersistentAppUIPresignedURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_persistent_app_ui_presigned_url_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_persistent_app_ui_presigned_url_input) =
    let input = Json_serializers.get_persistent_app_ui_presigned_url_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetPersistentAppUIPresignedURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_persistent_app_ui_presigned_url_output_of_yojson
      ~error_deserializer
end

module GetSession = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_session_input) =
    let input = Json_serializers.get_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.GetSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_session_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_session_input) =
    let input = Json_serializers.get_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.GetSession"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_session_output_of_yojson
      ~error_deserializer
end

module GetSessionEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_session_endpoint_input) =
    let input = Json_serializers.get_session_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.GetSessionEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_session_endpoint_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_session_endpoint_input) =
    let input = Json_serializers.get_session_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetSessionEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_session_endpoint_output_of_yojson
      ~error_deserializer
end

module GetStudioSessionMapping = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_studio_session_mapping_input) =
    let input = Json_serializers.get_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.GetStudioSessionMapping"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_studio_session_mapping_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_studio_session_mapping_input) =
    let input = Json_serializers.get_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.GetStudioSessionMapping" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_studio_session_mapping_output_of_yojson
      ~error_deserializer
end

module ListBootstrapActions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bootstrap_actions_input) =
    let input = Json_serializers.list_bootstrap_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListBootstrapActions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_bootstrap_actions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bootstrap_actions_input) =
    let input = Json_serializers.list_bootstrap_actions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListBootstrapActions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bootstrap_actions_output_of_yojson
      ~error_deserializer
end

module ListClusters = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_clusters_input) =
    let input = Json_serializers.list_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListClusters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_clusters_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_clusters_input) =
    let input = Json_serializers.list_clusters_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.ListClusters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_clusters_output_of_yojson ~error_deserializer
end

module ListInstanceFleets = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_instance_fleets_input) =
    let input = Json_serializers.list_instance_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListInstanceFleets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_instance_fleets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_instance_fleets_input) =
    let input = Json_serializers.list_instance_fleets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListInstanceFleets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instance_fleets_output_of_yojson
      ~error_deserializer
end

module ListInstanceGroups = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_instance_groups_input) =
    let input = Json_serializers.list_instance_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListInstanceGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_instance_groups_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_instance_groups_input) =
    let input = Json_serializers.list_instance_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListInstanceGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instance_groups_output_of_yojson
      ~error_deserializer
end

module ListInstances = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_instances_input) =
    let input = Json_serializers.list_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListInstances" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_instances_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_instances_input) =
    let input = Json_serializers.list_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.ListInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instances_output_of_yojson ~error_deserializer
end

module ListNotebookExecutions = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_notebook_executions_input) =
    let input = Json_serializers.list_notebook_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListNotebookExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_executions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_notebook_executions_input) =
    let input = Json_serializers.list_notebook_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListNotebookExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_notebook_executions_output_of_yojson
      ~error_deserializer
end

module ListReleaseLabels = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_release_labels_input) =
    let input = Json_serializers.list_release_labels_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListReleaseLabels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_release_labels_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_release_labels_input) =
    let input = Json_serializers.list_release_labels_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListReleaseLabels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_release_labels_output_of_yojson
      ~error_deserializer
end

module ListSecurityConfigurations = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_security_configurations_input) =
    let input = Json_serializers.list_security_configurations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListSecurityConfigurations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_security_configurations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_security_configurations_input) =
    let input = Json_serializers.list_security_configurations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListSecurityConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_security_configurations_output_of_yojson
      ~error_deserializer
end

module ListSessions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sessions_input) =
    let input = Json_serializers.list_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListSessions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_sessions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sessions_input) =
    let input = Json_serializers.list_sessions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.ListSessions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sessions_output_of_yojson ~error_deserializer
end

module ListSteps = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_steps_input) =
    let input = Json_serializers.list_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListSteps" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_steps_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_steps_input) =
    let input = Json_serializers.list_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.ListSteps"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_steps_output_of_yojson
      ~error_deserializer
end

module ListStudioSessionMappings = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_studio_session_mappings_input) =
    let input = Json_serializers.list_studio_session_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListStudioSessionMappings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_studio_session_mappings_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_studio_session_mappings_input) =
    let input = Json_serializers.list_studio_session_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListStudioSessionMappings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_studio_session_mappings_output_of_yojson
      ~error_deserializer
end

module ListStudios = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_studios_input) =
    let input = Json_serializers.list_studios_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListStudios" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_studios_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_studios_input) =
    let input = Json_serializers.list_studios_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.ListStudios"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_studios_output_of_yojson
      ~error_deserializer
end

module ListSupportedInstanceTypes = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_supported_instance_types_input) =
    let input = Json_serializers.list_supported_instance_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ListSupportedInstanceTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_supported_instance_types_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_supported_instance_types_input) =
    let input = Json_serializers.list_supported_instance_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ListSupportedInstanceTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_supported_instance_types_output_of_yojson
      ~error_deserializer
end

module ModifyCluster = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_cluster_input) =
    let input = Json_serializers.modify_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ModifyCluster" ~service
      ~context ~input ~output_deserializer:Json_deserializers.modify_cluster_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_cluster_input) =
    let input = Json_serializers.modify_cluster_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.ModifyCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_cluster_output_of_yojson ~error_deserializer
end

module ModifyInstanceFleet = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_instance_fleet_input) =
    let input = Json_serializers.modify_instance_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ModifyInstanceFleet" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_instance_fleet_input) =
    let input = Json_serializers.modify_instance_fleet_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ModifyInstanceFleet" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ModifyInstanceGroups = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_instance_groups_input) =
    let input = Json_serializers.modify_instance_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.ModifyInstanceGroups" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_instance_groups_input) =
    let input = Json_serializers.modify_instance_groups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.ModifyInstanceGroups" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutAutoScalingPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_auto_scaling_policy_input) =
    let input = Json_serializers.put_auto_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.PutAutoScalingPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_auto_scaling_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_auto_scaling_policy_input) =
    let input = Json_serializers.put_auto_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.PutAutoScalingPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_auto_scaling_policy_output_of_yojson
      ~error_deserializer
end

module PutAutoTerminationPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_auto_termination_policy_input) =
    let input = Json_serializers.put_auto_termination_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.PutAutoTerminationPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_auto_termination_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_auto_termination_policy_input) =
    let input = Json_serializers.put_auto_termination_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.PutAutoTerminationPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_auto_termination_policy_output_of_yojson
      ~error_deserializer
end

module PutBlockPublicAccessConfiguration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_block_public_access_configuration_input) =
    let input = Json_serializers.put_block_public_access_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ElasticMapReduce.PutBlockPublicAccessConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_block_public_access_configuration_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_block_public_access_configuration_input) =
    let input = Json_serializers.put_block_public_access_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.PutBlockPublicAccessConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_block_public_access_configuration_output_of_yojson
      ~error_deserializer
end

module PutManagedScalingPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_managed_scaling_policy_input) =
    let input = Json_serializers.put_managed_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.PutManagedScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_managed_scaling_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_managed_scaling_policy_input) =
    let input = Json_serializers.put_managed_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.PutManagedScalingPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_managed_scaling_policy_output_of_yojson
      ~error_deserializer
end

module RemoveAutoScalingPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_auto_scaling_policy_input) =
    let input = Json_serializers.remove_auto_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.RemoveAutoScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_auto_scaling_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_auto_scaling_policy_input) =
    let input = Json_serializers.remove_auto_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.RemoveAutoScalingPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_auto_scaling_policy_output_of_yojson
      ~error_deserializer
end

module RemoveAutoTerminationPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_auto_termination_policy_input) =
    let input = Json_serializers.remove_auto_termination_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.RemoveAutoTerminationPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_auto_termination_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_auto_termination_policy_input) =
    let input = Json_serializers.remove_auto_termination_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.RemoveAutoTerminationPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_auto_termination_policy_output_of_yojson
      ~error_deserializer
end

module RemoveManagedScalingPolicy = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_managed_scaling_policy_input) =
    let input = Json_serializers.remove_managed_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.RemoveManagedScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_managed_scaling_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_managed_scaling_policy_input) =
    let input = Json_serializers.remove_managed_scaling_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.RemoveManagedScalingPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_managed_scaling_policy_output_of_yojson
      ~error_deserializer
end

module RemoveTags = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_input) =
    let input = Json_serializers.remove_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.RemoveTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.remove_tags_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_tags_input) =
    let input = Json_serializers.remove_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.RemoveTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.remove_tags_output_of_yojson
      ~error_deserializer
end

module RunJobFlow = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : run_job_flow_input) =
    let input = Json_serializers.run_job_flow_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.RunJobFlow" ~service ~context
      ~input ~output_deserializer:Json_deserializers.run_job_flow_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : run_job_flow_input) =
    let input = Json_serializers.run_job_flow_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.RunJobFlow"
      ~service ~context ~input ~output_deserializer:Json_deserializers.run_job_flow_output_of_yojson
      ~error_deserializer
end

module SetKeepJobFlowAliveWhenNoSteps = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_keep_job_flow_alive_when_no_steps_input) =
    let input = Json_serializers.set_keep_job_flow_alive_when_no_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ElasticMapReduce.SetKeepJobFlowAliveWhenNoSteps" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_keep_job_flow_alive_when_no_steps_input) =
    let input = Json_serializers.set_keep_job_flow_alive_when_no_steps_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.SetKeepJobFlowAliveWhenNoSteps" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SetTerminationProtection = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_termination_protection_input) =
    let input = Json_serializers.set_termination_protection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.SetTerminationProtection"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_termination_protection_input) =
    let input = Json_serializers.set_termination_protection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.SetTerminationProtection" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SetUnhealthyNodeReplacement = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_unhealthy_node_replacement_input) =
    let input = Json_serializers.set_unhealthy_node_replacement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.SetUnhealthyNodeReplacement"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_unhealthy_node_replacement_input) =
    let input = Json_serializers.set_unhealthy_node_replacement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.SetUnhealthyNodeReplacement" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SetVisibleToAllUsers = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_visible_to_all_users_input) =
    let input = Json_serializers.set_visible_to_all_users_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.SetVisibleToAllUsers" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_visible_to_all_users_input) =
    let input = Json_serializers.set_visible_to_all_users_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.SetVisibleToAllUsers" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartNotebookExecution = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_notebook_execution_input) =
    let input = Json_serializers.start_notebook_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.StartNotebookExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_notebook_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_notebook_execution_input) =
    let input = Json_serializers.start_notebook_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.StartNotebookExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_notebook_execution_output_of_yojson
      ~error_deserializer
end

module StartSession = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_session_input) =
    let input = Json_serializers.start_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.StartSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_session_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_session_input) =
    let input = Json_serializers.start_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.StartSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_session_output_of_yojson ~error_deserializer
end

module StopNotebookExecution = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_notebook_execution_input) =
    let input = Json_serializers.stop_notebook_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.StopNotebookExecution"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_notebook_execution_input) =
    let input = Json_serializers.stop_notebook_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.StopNotebookExecution" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TerminateJobFlows = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_job_flows_input) =
    let input = Json_serializers.terminate_job_flows_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.TerminateJobFlows" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_job_flows_input) =
    let input = Json_serializers.terminate_job_flows_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.TerminateJobFlows" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TerminateSession = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_session_input) =
    let input = Json_serializers.terminate_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.TerminateSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.terminate_session_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_session_input) =
    let input = Json_serializers.terminate_session_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.TerminateSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_session_output_of_yojson ~error_deserializer
end

module UpdateStudio = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.emr#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_studio_input) =
    let input = Json_serializers.update_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.UpdateStudio" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_studio_input) =
    let input = Json_serializers.update_studio_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"ElasticMapReduce.UpdateStudio"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateStudioSessionMapping = struct
  let error_to_string = function
    | `InternalServerError _ -> "com.amazonaws.emr#InternalServerError"
    | `InvalidRequestException _ -> "com.amazonaws.emr#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_studio_session_mapping_input) =
    let input = Json_serializers.update_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ElasticMapReduce.UpdateStudioSessionMapping"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_studio_session_mapping_input) =
    let input = Json_serializers.update_studio_session_mapping_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ElasticMapReduce.UpdateStudioSessionMapping" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
