open Types

module DeleteRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_recommendation_preferences_request ->
    ( delete_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_recommendation_preferences_request ->
    ( delete_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a recommendation preference, such as enhanced infrastructure metrics.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
   enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module DescribeRecommendationExportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendation_export_jobs_request ->
    ( describe_recommendation_export_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recommendation_export_jobs_request ->
    ( describe_recommendation_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes recommendation export jobs created in the last seven days.\n\n\
  \ Use the [ExportAutoScalingGroupRecommendations] or [ExportEC2InstanceRecommendations] actions \
   to request an export of your recommendations. Then use the [DescribeRecommendationExportJobs] \
   action to view your export jobs.\n\
  \ "]

module ExportAutoScalingGroupRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_auto_scaling_group_recommendations_request ->
    ( export_auto_scaling_group_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_auto_scaling_group_recommendations_request ->
    ( export_auto_scaling_group_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Auto Scaling groups.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Auto Scaling group export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportEBSVolumeRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_ebs_volume_recommendations_request ->
    ( export_ebs_volume_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_ebs_volume_recommendations_request ->
    ( export_ebs_volume_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Amazon EBS volumes.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Amazon EBS volume export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportEC2InstanceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_ec2_instance_recommendations_request ->
    ( export_ec2_instance_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_ec2_instance_recommendations_request ->
    ( export_ec2_instance_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Amazon EC2 instances.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Amazon EC2 instance export job in progress per Amazon Web Services \
   Region.\n\
  \  "]

module ExportECSServiceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_ecs_service_recommendations_request ->
    ( export_ecs_service_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_ecs_service_recommendations_request ->
    ( export_ecs_service_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Exports optimization recommendations for Amazon ECS services on Fargate. \n\n\
  \ Recommendations are exported in a CSV file, and its metadata in a JSON file, to an existing \
   Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can only have one Amazon ECS service export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportIdleRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_idle_recommendations_request ->
    ( export_idle_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_idle_recommendations_request ->
    ( export_idle_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Export optimization recommendations for your idle resources. \n\n\
  \ Recommendations are exported in a comma-separated values (CSV) file, and its metadata in a \
   JavaScript Object Notation (JSON) file, to an existing Amazon Simple Storage Service (Amazon \
   S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one idle resource export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportLambdaFunctionRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_lambda_function_recommendations_request ->
    ( export_lambda_function_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_lambda_function_recommendations_request ->
    ( export_lambda_function_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports optimization recommendations for Lambda functions.\n\n\
  \ Recommendations are exported in a comma-separated values (.csv) file, and its metadata in a \
   JavaScript Object Notation (JSON) (.json) file, to an existing Amazon Simple Storage Service \
   (Amazon S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Lambda function export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportLicenseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_license_recommendations_request ->
    ( export_license_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_license_recommendations_request ->
    ( export_license_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Export optimization recommendations for your licenses. \n\n\
  \ Recommendations are exported in a comma-separated values (CSV) file, and its metadata in a \
   JavaScript Object Notation (JSON) file, to an existing Amazon Simple Storage Service (Amazon \
   S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one license export job in progress per Amazon Web Services Region.\n\
  \  "]

module ExportRDSDatabaseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    export_rds_database_recommendations_request ->
    ( export_rds_database_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    export_rds_database_recommendations_request ->
    ( export_rds_database_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Export optimization recommendations for your Amazon Aurora and Amazon Relational Database \
   Service (Amazon RDS) databases. \n\n\
  \ Recommendations are exported in a comma-separated values (CSV) file, and its metadata in a \
   JavaScript Object Notation (JSON) file, to an existing Amazon Simple Storage Service (Amazon \
   S3) bucket that you specify. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html}Exporting \
   Recommendations} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \  You can have only one Amazon Aurora or RDS export job in progress per Amazon Web Services \
   Region.\n\
  \  "]

module GetAutoScalingGroupRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_auto_scaling_group_recommendations_request ->
    ( get_auto_scaling_group_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_auto_scaling_group_recommendations_request ->
    ( get_auto_scaling_group_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Auto Scaling group recommendations.\n\n\
  \ Compute Optimizer generates recommendations for Amazon EC2 Auto Scaling groups that meet a \
   specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetEBSVolumeRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ebs_volume_recommendations_request ->
    ( get_ebs_volume_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ebs_volume_recommendations_request ->
    ( get_ebs_volume_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Amazon Elastic Block Store (Amazon EBS) volume recommendations.\n\n\
  \ Compute Optimizer generates recommendations for Amazon EBS volumes that meet a specific set of \
   requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetEC2InstanceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_instance_recommendations_request ->
    ( get_ec2_instance_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_instance_recommendations_request ->
    ( get_ec2_instance_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Amazon EC2 instance recommendations.\n\n\
  \ Compute Optimizer generates recommendations for Amazon Elastic Compute Cloud (Amazon EC2) \
   instances that meet a specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetEC2RecommendationProjectedMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_recommendation_projected_metrics_request ->
    ( get_ec2_recommendation_projected_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ec2_recommendation_projected_metrics_request ->
    ( get_ec2_recommendation_projected_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the projected utilization metrics of Amazon EC2 instance recommendations.\n\n\
  \  The [Cpu] and [Memory] metrics are the only projected utilization metrics returned when you \
   run this action. Additionally, the [Memory] metric is returned only for resources that have the \
   unified CloudWatch agent installed on them. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
   Memory Utilization with the CloudWatch Agent}.\n\
  \  \n\
  \   "]

module GetECSServiceRecommendationProjectedMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendation_projected_metrics_request ->
    ( get_ecs_service_recommendation_projected_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendation_projected_metrics_request ->
    ( get_ecs_service_recommendation_projected_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns the projected metrics of Amazon ECS service recommendations. \n"]

module GetECSServiceRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendations_request ->
    ( get_ecs_service_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ecs_service_recommendations_request ->
    ( get_ecs_service_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns Amazon ECS service recommendations. \n\n\
  \  Compute Optimizer generates recommendations for Amazon ECS services on Fargate that meet a \
   specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}. \n\
  \ "]

module GetEffectiveRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_effective_recommendation_preferences_request ->
    ( get_effective_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_effective_recommendation_preferences_request ->
    ( get_effective_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the recommendation preferences that are in effect for a given resource, such as \
   enhanced infrastructure metrics. Considers all applicable preferences that you might have set \
   at the resource, account, and organization level.\n\n\
  \ When you create a recommendation preference, you can set its status to [Active] or [Inactive]. \
   Use this action to view the recommendation preferences that are in effect, or [Active].\n\
  \ "]

module GetEnrollmentStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_status_request ->
    ( get_enrollment_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_status_request ->
    ( get_enrollment_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the enrollment (opt in) status of an account to the Compute Optimizer service.\n\n\
  \ If the account is the management account of an organization, this action also confirms the \
   enrollment status of member accounts of the organization. Use the \
   [GetEnrollmentStatusesForOrganization] action to get detailed information about the enrollment \
   status of member accounts of an organization.\n\
  \ "]

module GetEnrollmentStatusesForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_statuses_for_organization_request ->
    ( get_enrollment_statuses_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_statuses_for_organization_request ->
    ( get_enrollment_statuses_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Compute Optimizer enrollment (opt-in) status of organization member accounts, if \
   your account is an organization management account.\n\n\
  \ To get the enrollment status of standalone accounts, use the [GetEnrollmentStatus] action.\n\
  \ "]

module GetIdleRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_idle_recommendations_request ->
    ( get_idle_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_idle_recommendations_request ->
    ( get_idle_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns idle resource recommendations. Compute Optimizer generates recommendations for idle \
   resources that meet a specific set of requirements. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Resource \
   requirements} in the {i Compute Optimizer User Guide} \n"]

module GetLambdaFunctionRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lambda_function_recommendations_request ->
    ( get_lambda_function_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lambda_function_recommendations_request ->
    ( get_lambda_function_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Lambda function recommendations.\n\n\
  \ Compute Optimizer generates recommendations for functions that meet a specific set of \
   requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetLicenseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_recommendations_request ->
    ( get_license_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_recommendations_request ->
    ( get_license_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns license recommendations for Amazon EC2 instances that run on a specific license.\n\n\
  \ Compute Optimizer generates recommendations for licenses that meet a specific set of \
   requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetRDSDatabaseRecommendationProjectedMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendation_projected_metrics_request ->
    ( get_rds_database_recommendation_projected_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendation_projected_metrics_request ->
    ( get_rds_database_recommendation_projected_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Returns the projected metrics of Aurora and RDS database recommendations. \n"]

module GetRDSDatabaseRecommendations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendations_request ->
    ( get_rds_database_recommendations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_rds_database_recommendations_request ->
    ( get_rds_database_recommendations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns Amazon Aurora and RDS database recommendations. \n\n\
  \ Compute Optimizer generates recommendations for Amazon Aurora and RDS databases that meet a \
   specific set of requirements. For more information, see the \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
   resources and requirements} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module GetRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_preferences_request ->
    ( get_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_preferences_request ->
    ( get_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns existing recommendation preferences, such as enhanced infrastructure metrics.\n\n\
  \ Use the [scope] parameter to specify which preferences to return. You can specify to return \
   preferences for an organization, a specific account ID, or a specific EC2 instance or Auto \
   Scaling group Amazon Resource Name (ARN).\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
   enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
  \  "]

module GetRecommendationSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_summaries_request ->
    ( get_recommendation_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_recommendation_summaries_request ->
    ( get_recommendation_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the optimization findings for an account.\n\n\
  \ It returns the number of:\n\
  \ \n\
  \  {ul\n\
  \        {-  Amazon EC2 instances in an account that are [Underprovisioned], [Overprovisioned], \
   or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  EC2Auto Scaling groups in an account that are [NotOptimized], or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Amazon EBS volumes in an account that are [NotOptimized], or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Lambda functions in an account that are [NotOptimized], or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Amazon ECS services in an account that are [Underprovisioned], [Overprovisioned], \
   or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Commercial software licenses in an account that are [InsufficientMetrics], \
   [NotOptimized] or [Optimized].\n\
  \            \n\
  \             }\n\
  \        {-  Amazon Aurora and Amazon RDS databases in an account that are [Underprovisioned], \
   [Overprovisioned], [Optimized], or [NotOptimized].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module PutRecommendationPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_recommendation_preferences_request ->
    ( put_recommendation_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_recommendation_preferences_request ->
    ( put_recommendation_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new recommendation preference or updates an existing recommendation preference, such \
   as enhanced infrastructure metrics.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
   enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
  \ "]

module UpdateEnrollmentStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `MissingAuthenticationToken of missing_authentication_token
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_status_request ->
    ( update_enrollment_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_status_request ->
    ( update_enrollment_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MissingAuthenticationToken of missing_authentication_token
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the enrollment (opt in and opt out) status of an account to the Compute Optimizer \
   service.\n\n\
  \ If the account is a management account of an organization, this action can also be used to \
   enroll member accounts of the organization.\n\
  \ \n\
  \  You must have the appropriate permissions to opt in to Compute Optimizer, to view its \
   recommendations, and to opt out. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html}Controlling access \
   with Amazon Web Services Identity and Access Management} in the {i Compute Optimizer User \
   Guide}.\n\
  \  \n\
  \   When you opt in, Compute Optimizer automatically creates a service-linked role in your \
   account to access its data. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/using-service-linked-roles.html}Using \
   Service-Linked Roles for Compute Optimizer} in the {i Compute Optimizer User Guide}.\n\
  \   "]
