open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AssociateDatasetKmsKey = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatch#ConflictException"
    | `KmsAccessDeniedException _ -> "com.amazonaws.cloudwatch#KmsAccessDeniedException"
    | `KmsKeyDisabledException _ -> "com.amazonaws.cloudwatch#KmsKeyDisabledException"
    | `KmsKeyNotFoundException _ -> "com.amazonaws.cloudwatch#KmsKeyNotFoundException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConflictException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:conflict_exception_of_xml
        with
        | Ok s -> `ConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KmsAccessDeniedException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_access_denied_exception_of_xml
        with
        | Ok s -> `KmsAccessDeniedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KmsKeyDisabledException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_disabled_exception_of_xml
        with
        | Ok s -> `KmsKeyDisabledException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "KmsKeyNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:kms_key_not_found_exception_of_xml
        with
        | Ok s -> `KmsKeyNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : associate_dataset_kms_key_input) =
    let fields = associate_dataset_kms_key_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AssociateDatasetKmsKey"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:associate_dataset_kms_key_output_of_xml ~error_deserializer

  let request_with_metadata context (request : associate_dataset_kms_key_input) =
    let fields = associate_dataset_kms_key_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AssociateDatasetKmsKey"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:associate_dataset_kms_key_output_of_xml ~error_deserializer
end

module DeleteAlarmMuteRule = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_alarm_mute_rule_input) =
    let fields = delete_alarm_mute_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAlarmMuteRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_alarm_mute_rule_input) =
    let fields = delete_alarm_mute_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAlarmMuteRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteAlarms = struct
  let error_to_string = function
    | `ResourceConflict _ -> "com.amazonaws.cloudwatch#ResourceConflict"
    | `ResourceNotFound _ -> "com.amazonaws.cloudwatch#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_conflict_of_xml
        with
        | Ok s -> `ResourceConflict s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_of_xml
        with
        | Ok s -> `ResourceNotFound s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_alarms_input) =
    let fields = delete_alarms_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAlarms"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : delete_alarms_input) =
    let fields = delete_alarms_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAlarms"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DeleteAnomalyDetector = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudwatch#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_anomaly_detector_input) =
    let fields = delete_anomaly_detector_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteAnomalyDetector"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_anomaly_detector_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_anomaly_detector_input) =
    let fields = delete_anomaly_detector_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteAnomalyDetector"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_anomaly_detector_output_of_xml ~error_deserializer
end

module DeleteDashboards = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatch#ConflictException"
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConflictException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:conflict_exception_of_xml
        with
        | Ok s -> `ConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_dashboards_input) =
    let fields = delete_dashboards_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteDashboards"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_dashboards_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_dashboards_input) =
    let fields = delete_dashboards_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteDashboards"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_dashboards_output_of_xml ~error_deserializer
end

module DeleteInsightRules = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_insight_rules_input) =
    let fields = delete_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_insight_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_insight_rules_input) =
    let fields = delete_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_insight_rules_output_of_xml ~error_deserializer
end

module DeleteMetricStream = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_metric_stream_input) =
    let fields = delete_metric_stream_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteMetricStream"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_metric_stream_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_metric_stream_input) =
    let fields = delete_metric_stream_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteMetricStream"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:delete_metric_stream_output_of_xml ~error_deserializer
end

module DescribeAlarmContributors = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_alarm_contributors_input) =
    let fields = describe_alarm_contributors_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAlarmContributors"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarm_contributors_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_alarm_contributors_input) =
    let fields = describe_alarm_contributors_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAlarmContributors"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarm_contributors_output_of_xml ~error_deserializer
end

module DescribeAlarmHistory = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_alarm_history_input) =
    let fields = describe_alarm_history_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAlarmHistory"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarm_history_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_alarm_history_input) =
    let fields = describe_alarm_history_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAlarmHistory"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarm_history_output_of_xml ~error_deserializer
end

module DescribeAlarms = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_alarms_input) =
    let fields = describe_alarms_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAlarms"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarms_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_alarms_input) =
    let fields = describe_alarms_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAlarms"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarms_output_of_xml ~error_deserializer
end

module DescribeAlarmsForMetric = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_alarms_for_metric_input) =
    let fields = describe_alarms_for_metric_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAlarmsForMetric"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarms_for_metric_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_alarms_for_metric_input) =
    let fields = describe_alarms_for_metric_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAlarmsForMetric"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_alarms_for_metric_output_of_xml ~error_deserializer
end

module DescribeAnomalyDetectors = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudwatch#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_anomaly_detectors_input) =
    let fields = describe_anomaly_detectors_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAnomalyDetectors"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_anomaly_detectors_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_anomaly_detectors_input) =
    let fields = describe_anomaly_detectors_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAnomalyDetectors"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_anomaly_detectors_output_of_xml ~error_deserializer
end

module DescribeInsightRules = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_insight_rules_input) =
    let fields = describe_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_insight_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_insight_rules_input) =
    let fields = describe_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:describe_insight_rules_output_of_xml ~error_deserializer
end

module DisableAlarmActions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_alarm_actions_input) =
    let fields = disable_alarm_actions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableAlarmActions"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : disable_alarm_actions_input) =
    let fields = disable_alarm_actions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisableAlarmActions"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module DisableInsightRules = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disable_insight_rules_input) =
    let fields = disable_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:disable_insight_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : disable_insight_rules_input) =
    let fields = disable_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisableInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:disable_insight_rules_output_of_xml ~error_deserializer
end

module DisassociateDatasetKmsKey = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatch#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConflictException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:conflict_exception_of_xml
        with
        | Ok s -> `ConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : disassociate_dataset_kms_key_input) =
    let fields = disassociate_dataset_kms_key_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisassociateDatasetKmsKey"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:disassociate_dataset_kms_key_output_of_xml ~error_deserializer

  let request_with_metadata context (request : disassociate_dataset_kms_key_input) =
    let fields = disassociate_dataset_kms_key_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DisassociateDatasetKmsKey"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:disassociate_dataset_kms_key_output_of_xml ~error_deserializer
end

module EnableAlarmActions = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_alarm_actions_input) =
    let fields = enable_alarm_actions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableAlarmActions"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : enable_alarm_actions_input) =
    let fields = enable_alarm_actions_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableAlarmActions"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module EnableInsightRules = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatch#LimitExceededException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : enable_insight_rules_input) =
    let fields = enable_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:enable_insight_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : enable_insight_rules_input) =
    let fields = enable_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"EnableInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:enable_insight_rules_output_of_xml ~error_deserializer
end

module GetAlarmMuteRule = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_alarm_mute_rule_input) =
    let fields = get_alarm_mute_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetAlarmMuteRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_alarm_mute_rule_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_alarm_mute_rule_input) =
    let fields = get_alarm_mute_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetAlarmMuteRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_alarm_mute_rule_output_of_xml ~error_deserializer
end

module GetDashboard = struct
  let error_to_string = function
    | `DashboardNotFoundError _ -> "com.amazonaws.cloudwatch#DashboardNotFoundError"
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dashboard_not_found_error_of_xml
        with
        | Ok s -> `DashboardNotFoundError s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_dashboard_input) =
    let fields = get_dashboard_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetDashboard"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_dashboard_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_dashboard_input) =
    let fields = get_dashboard_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetDashboard"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_dashboard_output_of_xml ~error_deserializer
end

module GetDataset = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_dataset_input) =
    let fields = get_dataset_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetDataset"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_dataset_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_dataset_input) =
    let fields = get_dataset_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetDataset"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_dataset_output_of_xml ~error_deserializer
end

module GetInsightRuleReport = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_insight_rule_report_input) =
    let fields = get_insight_rule_report_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetInsightRuleReport"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_insight_rule_report_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_insight_rule_report_input) =
    let fields = get_insight_rule_report_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetInsightRuleReport"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_insight_rule_report_output_of_xml ~error_deserializer
end

module GetMetricData = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_metric_data_input) =
    let fields = get_metric_data_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetMetricData"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_data_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_metric_data_input) =
    let fields = get_metric_data_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetMetricData"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_data_output_of_xml ~error_deserializer
end

module GetMetricStatistics = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudwatch#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_metric_statistics_input) =
    let fields = get_metric_statistics_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetMetricStatistics"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_statistics_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_metric_statistics_input) =
    let fields = get_metric_statistics_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetMetricStatistics"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_statistics_output_of_xml ~error_deserializer
end

module GetMetricStream = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudwatch#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_metric_stream_input) =
    let fields = get_metric_stream_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetMetricStream"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_stream_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_metric_stream_input) =
    let fields = get_metric_stream_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetMetricStream"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_stream_output_of_xml ~error_deserializer
end

module GetMetricWidgetImage = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_metric_widget_image_input) =
    let fields = get_metric_widget_image_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetMetricWidgetImage"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_widget_image_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_metric_widget_image_input) =
    let fields = get_metric_widget_image_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetMetricWidgetImage"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_metric_widget_image_output_of_xml ~error_deserializer
end

module GetOTelEnrichment = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_o_tel_enrichment_input) =
    let fields = get_o_tel_enrichment_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetOTelEnrichment"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_o_tel_enrichment_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_o_tel_enrichment_input) =
    let fields = get_o_tel_enrichment_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetOTelEnrichment"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:get_o_tel_enrichment_output_of_xml ~error_deserializer
end

module ListAlarmMuteRules = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_alarm_mute_rules_input) =
    let fields = list_alarm_mute_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListAlarmMuteRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_alarm_mute_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_alarm_mute_rules_input) =
    let fields = list_alarm_mute_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListAlarmMuteRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_alarm_mute_rules_output_of_xml ~error_deserializer
end

module ListDashboards = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_dashboards_input) =
    let fields = list_dashboards_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListDashboards"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_dashboards_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_dashboards_input) =
    let fields = list_dashboards_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListDashboards"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_dashboards_output_of_xml ~error_deserializer
end

module ListManagedInsightRules = struct
  let error_to_string = function
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_managed_insight_rules_input) =
    let fields = list_managed_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListManagedInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_managed_insight_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_managed_insight_rules_input) =
    let fields = list_managed_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListManagedInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_managed_insight_rules_output_of_xml ~error_deserializer
end

module ListMetricStreams = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidNextToken _ -> "com.amazonaws.cloudwatch#InvalidNextToken"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidNextToken" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_next_token_of_xml
        with
        | Ok s -> `InvalidNextToken s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_metric_streams_input) =
    let fields = list_metric_streams_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListMetricStreams"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_metric_streams_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_metric_streams_input) =
    let fields = list_metric_streams_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListMetricStreams"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_metric_streams_output_of_xml ~error_deserializer
end

module ListMetrics = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_metrics_input) =
    let fields = list_metrics_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListMetrics"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_metrics_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_metrics_input) =
    let fields = list_metrics_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListMetrics"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_metrics_output_of_xml ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : list_tags_for_resource_input) =
    let fields = list_tags_for_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ListTagsForResource"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_tags_for_resource_output_of_xml ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let fields = list_tags_for_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ListTagsForResource"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:list_tags_for_resource_output_of_xml ~error_deserializer
end

module PutAlarmMuteRule = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.cloudwatch#LimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_alarm_mute_rule_input) =
    let fields = put_alarm_mute_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutAlarmMuteRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_alarm_mute_rule_input) =
    let fields = put_alarm_mute_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutAlarmMuteRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutAnomalyDetector = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudwatch#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatch#LimitExceededException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_anomaly_detector_input) =
    let fields = put_anomaly_detector_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutAnomalyDetector"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_anomaly_detector_output_of_xml ~error_deserializer

  let request_with_metadata context (request : put_anomaly_detector_input) =
    let fields = put_anomaly_detector_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutAnomalyDetector"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_anomaly_detector_output_of_xml ~error_deserializer
end

module PutCompositeAlarm = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.cloudwatch#LimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_composite_alarm_input) =
    let fields = put_composite_alarm_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutCompositeAlarm"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_composite_alarm_input) =
    let fields = put_composite_alarm_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutCompositeAlarm"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutDashboard = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatch#ConflictException"
    | `DashboardInvalidInputError _ -> "com.amazonaws.cloudwatch#DashboardInvalidInputError"
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConflictException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:conflict_exception_of_xml
        with
        | Ok s -> `ConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterInput" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dashboard_invalid_input_error_of_xml
        with
        | Ok s -> `DashboardInvalidInputError s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_dashboard_input) =
    let fields = put_dashboard_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutDashboard"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_dashboard_output_of_xml ~error_deserializer

  let request_with_metadata context (request : put_dashboard_input) =
    let fields = put_dashboard_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutDashboard"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_dashboard_output_of_xml ~error_deserializer
end

module PutInsightRule = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatch#LimitExceededException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LimitExceededException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_exception_of_xml
        with
        | Ok s -> `LimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_insight_rule_input) =
    let fields = put_insight_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutInsightRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_insight_rule_output_of_xml ~error_deserializer

  let request_with_metadata context (request : put_insight_rule_input) =
    let fields = put_insight_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutInsightRule"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_insight_rule_output_of_xml ~error_deserializer
end

module PutLogAlarm = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.cloudwatch#LimitExceededFault"
    | `ResourceConflict _ -> "com.amazonaws.cloudwatch#ResourceConflict"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceConflict" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_conflict_of_xml
        with
        | Ok s -> `ResourceConflict s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_log_alarm_input) =
    let fields = put_log_alarm_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutLogAlarm"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_log_alarm_input) =
    let fields = put_log_alarm_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutLogAlarm"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutManagedInsightRules = struct
  let error_to_string = function
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_managed_insight_rules_input) =
    let fields = put_managed_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutManagedInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_managed_insight_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : put_managed_insight_rules_input) =
    let fields = put_managed_insight_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutManagedInsightRules"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_managed_insight_rules_output_of_xml ~error_deserializer
end

module PutMetricAlarm = struct
  let error_to_string = function
    | `LimitExceededFault _ -> "com.amazonaws.cloudwatch#LimitExceededFault"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:limit_exceeded_fault_of_xml
        with
        | Ok s -> `LimitExceededFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_metric_alarm_input) =
    let fields = put_metric_alarm_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutMetricAlarm"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_metric_alarm_input) =
    let fields = put_metric_alarm_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutMetricAlarm"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutMetricData = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudwatch#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_metric_data_input) =
    let fields = put_metric_data_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutMetricData"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : put_metric_data_input) =
    let fields = put_metric_data_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutMetricData"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module PutMetricStream = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cloudwatch#ConcurrentModificationException"
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.cloudwatch#InvalidParameterCombinationException"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModificationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterCombination" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_combination_exception_of_xml
        with
        | Ok s -> `InvalidParameterCombinationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : put_metric_stream_input) =
    let fields = put_metric_stream_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"PutMetricStream"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_metric_stream_output_of_xml ~error_deserializer

  let request_with_metadata context (request : put_metric_stream_input) =
    let fields = put_metric_stream_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"PutMetricStream"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:put_metric_stream_output_of_xml ~error_deserializer
end

module SetAlarmState = struct
  let error_to_string = function
    | `InvalidFormatFault _ -> "com.amazonaws.cloudwatch#InvalidFormatFault"
    | `ResourceNotFound _ -> "com.amazonaws.cloudwatch#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidFormat" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_format_fault_of_xml
        with
        | Ok s -> `InvalidFormatFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_of_xml
        with
        | Ok s -> `ResourceNotFound s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_alarm_state_input) =
    let fields = set_alarm_state_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetAlarmState"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer

  let request_with_metadata context (request : set_alarm_state_input) =
    let fields = set_alarm_state_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetAlarmState"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:Smaws_Lib.Smithy_api.Query_deserializers.unit__of_xml ~error_deserializer
end

module StartMetricStreams = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_metric_streams_input) =
    let fields = start_metric_streams_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartMetricStreams"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:start_metric_streams_output_of_xml ~error_deserializer

  let request_with_metadata context (request : start_metric_streams_input) =
    let fields = start_metric_streams_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartMetricStreams"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:start_metric_streams_output_of_xml ~error_deserializer
end

module StartOTelEnrichment = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : start_o_tel_enrichment_input) =
    let fields = start_o_tel_enrichment_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StartOTelEnrichment"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:start_o_tel_enrichment_output_of_xml ~error_deserializer

  let request_with_metadata context (request : start_o_tel_enrichment_input) =
    let fields = start_o_tel_enrichment_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StartOTelEnrichment"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:start_o_tel_enrichment_output_of_xml ~error_deserializer
end

module StopMetricStreams = struct
  let error_to_string = function
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `MissingRequiredParameterException _ ->
        "com.amazonaws.cloudwatch#MissingRequiredParameterException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "MissingParameter" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:missing_required_parameter_exception_of_xml
        with
        | Ok s -> `MissingRequiredParameterException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : stop_metric_streams_input) =
    let fields = stop_metric_streams_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StopMetricStreams"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:stop_metric_streams_output_of_xml ~error_deserializer

  let request_with_metadata context (request : stop_metric_streams_input) =
    let fields = stop_metric_streams_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StopMetricStreams"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:stop_metric_streams_output_of_xml ~error_deserializer
end

module StopOTelEnrichment = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : stop_o_tel_enrichment_input) =
    let fields = stop_o_tel_enrichment_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"StopOTelEnrichment"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:stop_o_tel_enrichment_output_of_xml ~error_deserializer

  let request_with_metadata context (request : stop_o_tel_enrichment_input) =
    let fields = stop_o_tel_enrichment_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"StopOTelEnrichment"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:stop_o_tel_enrichment_output_of_xml ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cloudwatch#ConcurrentModificationException"
    | `ConflictException _ -> "com.amazonaws.cloudwatch#ConflictException"
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModificationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConflictException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:conflict_exception_of_xml
        with
        | Ok s -> `ConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : tag_resource_input) =
    let fields = tag_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"TagResource"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:tag_resource_output_of_xml ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let fields = tag_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"TagResource"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:tag_resource_output_of_xml ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cloudwatch#ConcurrentModificationException"
    | `ConflictException _ -> "com.amazonaws.cloudwatch#ConflictException"
    | `InternalServiceFault _ -> "com.amazonaws.cloudwatch#InternalServiceFault"
    | `InvalidParameterValueException _ -> "com.amazonaws.cloudwatch#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatch#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ConcurrentModificationException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:concurrent_modification_exception_of_xml
        with
        | Ok s -> `ConcurrentModificationException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ConflictException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:conflict_exception_of_xml
        with
        | Ok s -> `ConflictException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InternalServiceError" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:internal_service_fault_of_xml
        with
        | Ok s -> `InternalServiceFault s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidParameterValue" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_parameter_value_exception_of_xml
        with
        | Ok s -> `InvalidParameterValueException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceNotFoundException" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : untag_resource_input) =
    let fields = untag_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"UntagResource"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:untag_resource_output_of_xml ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let fields = untag_resource_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"UntagResource"
      ~xmlNamespace:"http://monitoring.amazonaws.com/doc/2010-08-01/" ~service ~context ~fields
      ~output_deserializer:untag_resource_output_of_xml ~error_deserializer
end
