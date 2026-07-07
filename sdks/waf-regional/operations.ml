open Types
open Service_metadata

module AssociateWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafregional#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_web_acl_request) =
    let input = Json_serializers.associate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.AssociateWebACL"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_web_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_web_acl_request) =
    let input = Json_serializers.associate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.AssociateWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_web_acl_response_of_yojson
      ~error_deserializer
end

module CreateByteMatchSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_byte_match_set_request) =
    let input = Json_serializers.create_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateByteMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_byte_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_byte_match_set_request) =
    let input = Json_serializers.create_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateByteMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_byte_match_set_response_of_yojson
      ~error_deserializer
end

module CreateGeoMatchSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_geo_match_set_request) =
    let input = Json_serializers.create_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateGeoMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_geo_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_geo_match_set_request) =
    let input = Json_serializers.create_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateGeoMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_geo_match_set_response_of_yojson
      ~error_deserializer
end

module CreateIPSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ip_set_request) =
    let input = Json_serializers.create_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateIPSet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_ip_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ip_set_request) =
    let input = Json_serializers.create_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateIPSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ip_set_response_of_yojson ~error_deserializer
end

module CreateRateBasedRule = struct
  let error_to_string = function
    | `WAFBadRequestException _ -> "com.amazonaws.wafregional#WAFBadRequestException"
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFBadRequestException" ->
          `WAFBadRequestException (Json_deserializers.waf_bad_request_exception_of_yojson tree path)
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_rate_based_rule_request) =
    let input = Json_serializers.create_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateRateBasedRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rate_based_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rate_based_rule_request) =
    let input = Json_serializers.create_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateRateBasedRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rate_based_rule_response_of_yojson
      ~error_deserializer
end

module CreateRegexMatchSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_regex_match_set_request) =
    let input = Json_serializers.create_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateRegexMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_regex_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_regex_match_set_request) =
    let input = Json_serializers.create_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateRegexMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_regex_match_set_response_of_yojson
      ~error_deserializer
end

module CreateRegexPatternSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_regex_pattern_set_request) =
    let input = Json_serializers.create_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateRegexPatternSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_regex_pattern_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_regex_pattern_set_request) =
    let input = Json_serializers.create_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateRegexPatternSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module CreateRule = struct
  let error_to_string = function
    | `WAFBadRequestException _ -> "com.amazonaws.wafregional#WAFBadRequestException"
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFBadRequestException" ->
          `WAFBadRequestException (Json_deserializers.waf_bad_request_exception_of_yojson tree path)
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_rule_request) =
    let input = Json_serializers.create_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateRule" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rule_request) =
    let input = Json_serializers.create_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rule_response_of_yojson ~error_deserializer
end

module CreateRuleGroup = struct
  let error_to_string = function
    | `WAFBadRequestException _ -> "com.amazonaws.wafregional#WAFBadRequestException"
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFBadRequestException" ->
          `WAFBadRequestException (Json_deserializers.waf_bad_request_exception_of_yojson tree path)
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_rule_group_request) =
    let input = Json_serializers.create_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rule_group_request) =
    let input = Json_serializers.create_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rule_group_response_of_yojson
      ~error_deserializer
end

module CreateSizeConstraintSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_size_constraint_set_request) =
    let input = Json_serializers.create_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.CreateSizeConstraintSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_size_constraint_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_size_constraint_set_request) =
    let input = Json_serializers.create_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateSizeConstraintSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_size_constraint_set_response_of_yojson
      ~error_deserializer
end

module CreateSqlInjectionMatchSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_sql_injection_match_set_request) =
    let input = Json_serializers.create_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.CreateSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_sql_injection_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_sql_injection_match_set_request) =
    let input = Json_serializers.create_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_sql_injection_match_set_response_of_yojson
      ~error_deserializer
end

module CreateWebACL = struct
  let error_to_string = function
    | `WAFBadRequestException _ -> "com.amazonaws.wafregional#WAFBadRequestException"
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFBadRequestException" ->
          `WAFBadRequestException (Json_deserializers.waf_bad_request_exception_of_yojson tree path)
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_web_acl_request) =
    let input = Json_serializers.create_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateWebACL" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_web_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_web_acl_request) =
    let input = Json_serializers.create_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_web_acl_response_of_yojson ~error_deserializer
end

module CreateWebACLMigrationStack = struct
  let error_to_string = function
    | `WAFEntityMigrationException _ -> "com.amazonaws.wafregional#WAFEntityMigrationException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFEntityMigrationException" ->
          `WAFEntityMigrationException
            (Json_deserializers.waf_entity_migration_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_web_acl_migration_stack_request) =
    let input = Json_serializers.create_web_acl_migration_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.CreateWebACLMigrationStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_web_acl_migration_stack_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_web_acl_migration_stack_request) =
    let input = Json_serializers.create_web_acl_migration_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateWebACLMigrationStack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_web_acl_migration_stack_response_of_yojson
      ~error_deserializer
end

module CreateXssMatchSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_xss_match_set_request) =
    let input = Json_serializers.create_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.CreateXssMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_xss_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_xss_match_set_request) =
    let input = Json_serializers.create_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.CreateXssMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_xss_match_set_response_of_yojson
      ~error_deserializer
end

module DeleteByteMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_byte_match_set_request) =
    let input = Json_serializers.delete_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteByteMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_byte_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_byte_match_set_request) =
    let input = Json_serializers.delete_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteByteMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_byte_match_set_response_of_yojson
      ~error_deserializer
end

module DeleteGeoMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_geo_match_set_request) =
    let input = Json_serializers.delete_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteGeoMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_geo_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_geo_match_set_request) =
    let input = Json_serializers.delete_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteGeoMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_geo_match_set_response_of_yojson
      ~error_deserializer
end

module DeleteIPSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ip_set_request) =
    let input = Json_serializers.delete_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteIPSet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_ip_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ip_set_request) =
    let input = Json_serializers.delete_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteIPSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ip_set_response_of_yojson ~error_deserializer
end

module DeleteLoggingConfiguration = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_logging_configuration_request) =
    let input = Json_serializers.delete_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.DeleteLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_logging_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_logging_configuration_request) =
    let input = Json_serializers.delete_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_logging_configuration_response_of_yojson
      ~error_deserializer
end

module DeletePermissionPolicy = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_permission_policy_request) =
    let input = Json_serializers.delete_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.DeletePermissionPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_permission_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_permission_policy_request) =
    let input = Json_serializers.delete_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeletePermissionPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_permission_policy_response_of_yojson
      ~error_deserializer
end

module DeleteRateBasedRule = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rate_based_rule_request) =
    let input = Json_serializers.delete_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteRateBasedRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rate_based_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rate_based_rule_request) =
    let input = Json_serializers.delete_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteRateBasedRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rate_based_rule_response_of_yojson
      ~error_deserializer
end

module DeleteRegexMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_regex_match_set_request) =
    let input = Json_serializers.delete_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteRegexMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_regex_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_regex_match_set_request) =
    let input = Json_serializers.delete_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteRegexMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_regex_match_set_response_of_yojson
      ~error_deserializer
end

module DeleteRegexPatternSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_regex_pattern_set_request) =
    let input = Json_serializers.delete_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteRegexPatternSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_regex_pattern_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_regex_pattern_set_request) =
    let input = Json_serializers.delete_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteRegexPatternSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module DeleteRule = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rule_request) =
    let input = Json_serializers.delete_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteRule" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rule_request) =
    let input = Json_serializers.delete_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rule_response_of_yojson ~error_deserializer
end

module DeleteRuleGroup = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rule_group_request) =
    let input = Json_serializers.delete_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rule_group_request) =
    let input = Json_serializers.delete_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rule_group_response_of_yojson
      ~error_deserializer
end

module DeleteSizeConstraintSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_size_constraint_set_request) =
    let input = Json_serializers.delete_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.DeleteSizeConstraintSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_size_constraint_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_size_constraint_set_request) =
    let input = Json_serializers.delete_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteSizeConstraintSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_size_constraint_set_response_of_yojson
      ~error_deserializer
end

module DeleteSqlInjectionMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_sql_injection_match_set_request) =
    let input = Json_serializers.delete_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.DeleteSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_sql_injection_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_sql_injection_match_set_request) =
    let input = Json_serializers.delete_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_sql_injection_match_set_response_of_yojson
      ~error_deserializer
end

module DeleteWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_web_acl_request) =
    let input = Json_serializers.delete_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteWebACL" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_web_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_web_acl_request) =
    let input = Json_serializers.delete_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_web_acl_response_of_yojson ~error_deserializer
end

module DeleteXssMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonEmptyEntityException _ -> "com.amazonaws.wafregional#WAFNonEmptyEntityException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonEmptyEntityException" ->
          `WAFNonEmptyEntityException
            (Json_deserializers.waf_non_empty_entity_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_xss_match_set_request) =
    let input = Json_serializers.delete_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DeleteXssMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_xss_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_xss_match_set_request) =
    let input = Json_serializers.delete_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DeleteXssMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_xss_match_set_response_of_yojson
      ~error_deserializer
end

module DisassociateWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_web_acl_request) =
    let input = Json_serializers.disassociate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.DisassociateWebACL"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_web_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_web_acl_request) =
    let input = Json_serializers.disassociate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.DisassociateWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_web_acl_response_of_yojson
      ~error_deserializer
end

module GetByteMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_byte_match_set_request) =
    let input = Json_serializers.get_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetByteMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_byte_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_byte_match_set_request) =
    let input = Json_serializers.get_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetByteMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_byte_match_set_response_of_yojson
      ~error_deserializer
end

module GetChangeToken = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_change_token_request) =
    let input = Json_serializers.get_change_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetChangeToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_change_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_change_token_request) =
    let input = Json_serializers.get_change_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetChangeToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_change_token_response_of_yojson
      ~error_deserializer
end

module GetChangeTokenStatus = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_change_token_status_request) =
    let input = Json_serializers.get_change_token_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetChangeTokenStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_change_token_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_change_token_status_request) =
    let input = Json_serializers.get_change_token_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetChangeTokenStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_change_token_status_response_of_yojson
      ~error_deserializer
end

module GetGeoMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_geo_match_set_request) =
    let input = Json_serializers.get_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetGeoMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_geo_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_geo_match_set_request) =
    let input = Json_serializers.get_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetGeoMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_geo_match_set_response_of_yojson
      ~error_deserializer
end

module GetIPSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ip_set_request) =
    let input = Json_serializers.get_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetIPSet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_ip_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ip_set_request) =
    let input = Json_serializers.get_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetIPSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ip_set_response_of_yojson ~error_deserializer
end

module GetLoggingConfiguration = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_logging_configuration_request) =
    let input = Json_serializers.get_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.GetLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_logging_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_logging_configuration_request) =
    let input = Json_serializers.get_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_logging_configuration_response_of_yojson
      ~error_deserializer
end

module GetPermissionPolicy = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_permission_policy_request) =
    let input = Json_serializers.get_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetPermissionPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_permission_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_permission_policy_request) =
    let input = Json_serializers.get_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetPermissionPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_permission_policy_response_of_yojson
      ~error_deserializer
end

module GetRateBasedRule = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rate_based_rule_request) =
    let input = Json_serializers.get_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetRateBasedRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rate_based_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rate_based_rule_request) =
    let input = Json_serializers.get_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetRateBasedRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rate_based_rule_response_of_yojson
      ~error_deserializer
end

module GetRateBasedRuleManagedKeys = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rate_based_rule_managed_keys_request) =
    let input = Json_serializers.get_rate_based_rule_managed_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.GetRateBasedRuleManagedKeys" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rate_based_rule_managed_keys_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rate_based_rule_managed_keys_request) =
    let input = Json_serializers.get_rate_based_rule_managed_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetRateBasedRuleManagedKeys" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rate_based_rule_managed_keys_response_of_yojson
      ~error_deserializer
end

module GetRegexMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_regex_match_set_request) =
    let input = Json_serializers.get_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetRegexMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_regex_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_regex_match_set_request) =
    let input = Json_serializers.get_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetRegexMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_regex_match_set_response_of_yojson
      ~error_deserializer
end

module GetRegexPatternSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_regex_pattern_set_request) =
    let input = Json_serializers.get_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetRegexPatternSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_regex_pattern_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_regex_pattern_set_request) =
    let input = Json_serializers.get_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetRegexPatternSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module GetRule = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rule_request) =
    let input = Json_serializers.get_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetRule" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rule_request) =
    let input = Json_serializers.get_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSWAF_Regional_20161128.GetRule"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_rule_response_of_yojson
      ~error_deserializer
end

module GetRuleGroup = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rule_group_request) =
    let input = Json_serializers.get_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetRuleGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rule_group_request) =
    let input = Json_serializers.get_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rule_group_response_of_yojson ~error_deserializer
end

module GetSampledRequests = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_sampled_requests_request) =
    let input = Json_serializers.get_sampled_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetSampledRequests"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_sampled_requests_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_sampled_requests_request) =
    let input = Json_serializers.get_sampled_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetSampledRequests" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_sampled_requests_response_of_yojson
      ~error_deserializer
end

module GetSizeConstraintSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_size_constraint_set_request) =
    let input = Json_serializers.get_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetSizeConstraintSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_size_constraint_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_size_constraint_set_request) =
    let input = Json_serializers.get_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetSizeConstraintSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_size_constraint_set_response_of_yojson
      ~error_deserializer
end

module GetSqlInjectionMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_sql_injection_match_set_request) =
    let input = Json_serializers.get_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.GetSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_sql_injection_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_sql_injection_match_set_request) =
    let input = Json_serializers.get_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_sql_injection_match_set_response_of_yojson
      ~error_deserializer
end

module GetWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_web_acl_request) =
    let input = Json_serializers.get_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetWebACL" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_web_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_web_acl_request) =
    let input = Json_serializers.get_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_web_acl_response_of_yojson ~error_deserializer
end

module GetWebACLForResource = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafregional#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_web_acl_for_resource_request) =
    let input = Json_serializers.get_web_acl_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetWebACLForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_web_acl_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_web_acl_for_resource_request) =
    let input = Json_serializers.get_web_acl_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetWebACLForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_web_acl_for_resource_response_of_yojson
      ~error_deserializer
end

module GetXssMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_xss_match_set_request) =
    let input = Json_serializers.get_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.GetXssMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_xss_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_xss_match_set_request) =
    let input = Json_serializers.get_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.GetXssMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_xss_match_set_response_of_yojson
      ~error_deserializer
end

module ListActivatedRulesInRuleGroup = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_activated_rules_in_rule_group_request) =
    let input = Json_serializers.list_activated_rules_in_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.ListActivatedRulesInRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_activated_rules_in_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_activated_rules_in_rule_group_request) =
    let input = Json_serializers.list_activated_rules_in_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListActivatedRulesInRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_activated_rules_in_rule_group_response_of_yojson
      ~error_deserializer
end

module ListByteMatchSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_byte_match_sets_request) =
    let input = Json_serializers.list_byte_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListByteMatchSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_byte_match_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_byte_match_sets_request) =
    let input = Json_serializers.list_byte_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListByteMatchSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_byte_match_sets_response_of_yojson
      ~error_deserializer
end

module ListGeoMatchSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_geo_match_sets_request) =
    let input = Json_serializers.list_geo_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListGeoMatchSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_geo_match_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_geo_match_sets_request) =
    let input = Json_serializers.list_geo_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListGeoMatchSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_geo_match_sets_response_of_yojson
      ~error_deserializer
end

module ListIPSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ip_sets_request) =
    let input = Json_serializers.list_ip_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListIPSets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_ip_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_ip_sets_request) =
    let input = Json_serializers.list_ip_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListIPSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_ip_sets_response_of_yojson ~error_deserializer
end

module ListLoggingConfigurations = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_logging_configurations_request) =
    let input = Json_serializers.list_logging_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.ListLoggingConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_logging_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_logging_configurations_request) =
    let input = Json_serializers.list_logging_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListLoggingConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_logging_configurations_response_of_yojson
      ~error_deserializer
end

module ListRateBasedRules = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rate_based_rules_request) =
    let input = Json_serializers.list_rate_based_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListRateBasedRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rate_based_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rate_based_rules_request) =
    let input = Json_serializers.list_rate_based_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListRateBasedRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rate_based_rules_response_of_yojson
      ~error_deserializer
end

module ListRegexMatchSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_regex_match_sets_request) =
    let input = Json_serializers.list_regex_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListRegexMatchSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_regex_match_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_regex_match_sets_request) =
    let input = Json_serializers.list_regex_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListRegexMatchSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_regex_match_sets_response_of_yojson
      ~error_deserializer
end

module ListRegexPatternSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_regex_pattern_sets_request) =
    let input = Json_serializers.list_regex_pattern_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListRegexPatternSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_regex_pattern_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_regex_pattern_sets_request) =
    let input = Json_serializers.list_regex_pattern_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListRegexPatternSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_regex_pattern_sets_response_of_yojson
      ~error_deserializer
end

module ListResourcesForWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resources_for_web_acl_request) =
    let input = Json_serializers.list_resources_for_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.ListResourcesForWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resources_for_web_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resources_for_web_acl_request) =
    let input = Json_serializers.list_resources_for_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListResourcesForWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resources_for_web_acl_response_of_yojson
      ~error_deserializer
end

module ListRuleGroups = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rule_groups_request) =
    let input = Json_serializers.list_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListRuleGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rule_groups_request) =
    let input = Json_serializers.list_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListRuleGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_groups_response_of_yojson
      ~error_deserializer
end

module ListRules = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rules_request) =
    let input = Json_serializers.list_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListRules" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rules_request) =
    let input = Json_serializers.list_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rules_response_of_yojson ~error_deserializer
end

module ListSizeConstraintSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_size_constraint_sets_request) =
    let input = Json_serializers.list_size_constraint_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.ListSizeConstraintSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_size_constraint_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_size_constraint_sets_request) =
    let input = Json_serializers.list_size_constraint_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListSizeConstraintSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_size_constraint_sets_response_of_yojson
      ~error_deserializer
end

module ListSqlInjectionMatchSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sql_injection_match_sets_request) =
    let input = Json_serializers.list_sql_injection_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.ListSqlInjectionMatchSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sql_injection_match_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sql_injection_match_sets_request) =
    let input = Json_serializers.list_sql_injection_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListSqlInjectionMatchSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sql_injection_match_sets_response_of_yojson
      ~error_deserializer
end

module ListSubscribedRuleGroups = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_subscribed_rule_groups_request) =
    let input = Json_serializers.list_subscribed_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.ListSubscribedRuleGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_subscribed_rule_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_subscribed_rule_groups_request) =
    let input = Json_serializers.list_subscribed_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListSubscribedRuleGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_subscribed_rule_groups_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `WAFBadRequestException _ -> "com.amazonaws.wafregional#WAFBadRequestException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFBadRequestException" ->
          `WAFBadRequestException (Json_deserializers.waf_bad_request_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListWebACLs = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_web_ac_ls_request) =
    let input = Json_serializers.list_web_ac_ls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListWebACLs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_web_ac_ls_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_web_ac_ls_request) =
    let input = Json_serializers.list_web_ac_ls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListWebACLs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_web_ac_ls_response_of_yojson ~error_deserializer
end

module ListXssMatchSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_xss_match_sets_request) =
    let input = Json_serializers.list_xss_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.ListXssMatchSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_xss_match_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_xss_match_sets_request) =
    let input = Json_serializers.list_xss_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.ListXssMatchSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_xss_match_sets_response_of_yojson
      ~error_deserializer
end

module PutLoggingConfiguration = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFServiceLinkedRoleErrorException _ ->
        "com.amazonaws.wafregional#WAFServiceLinkedRoleErrorException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFServiceLinkedRoleErrorException" ->
          `WAFServiceLinkedRoleErrorException
            (Json_deserializers.waf_service_linked_role_error_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_logging_configuration_request) =
    let input = Json_serializers.put_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.PutLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_logging_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_logging_configuration_request) =
    let input = Json_serializers.put_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.PutLoggingConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_logging_configuration_response_of_yojson
      ~error_deserializer
end

module PutPermissionPolicy = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidPermissionPolicyException _ ->
        "com.amazonaws.wafregional#WAFInvalidPermissionPolicyException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidPermissionPolicyException" ->
          `WAFInvalidPermissionPolicyException
            (Json_deserializers.waf_invalid_permission_policy_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_permission_policy_request) =
    let input = Json_serializers.put_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.PutPermissionPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_permission_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_permission_policy_request) =
    let input = Json_serializers.put_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.PutPermissionPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_permission_policy_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `WAFBadRequestException _ -> "com.amazonaws.wafregional#WAFBadRequestException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFBadRequestException" ->
          `WAFBadRequestException (Json_deserializers.waf_bad_request_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `WAFBadRequestException _ -> "com.amazonaws.wafregional#WAFBadRequestException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafregional#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafregional#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFBadRequestException" ->
          `WAFBadRequestException (Json_deserializers.waf_bad_request_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateByteMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_byte_match_set_request) =
    let input = Json_serializers.update_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateByteMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_byte_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_byte_match_set_request) =
    let input = Json_serializers.update_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateByteMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_byte_match_set_response_of_yojson
      ~error_deserializer
end

module UpdateGeoMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_geo_match_set_request) =
    let input = Json_serializers.update_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateGeoMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_geo_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_geo_match_set_request) =
    let input = Json_serializers.update_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateGeoMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_geo_match_set_response_of_yojson
      ~error_deserializer
end

module UpdateIPSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_ip_set_request) =
    let input = Json_serializers.update_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateIPSet" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_ip_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_ip_set_request) =
    let input = Json_serializers.update_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateIPSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_ip_set_response_of_yojson ~error_deserializer
end

module UpdateRateBasedRule = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_rate_based_rule_request) =
    let input = Json_serializers.update_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateRateBasedRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rate_based_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rate_based_rule_request) =
    let input = Json_serializers.update_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateRateBasedRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rate_based_rule_response_of_yojson
      ~error_deserializer
end

module UpdateRegexMatchSet = struct
  let error_to_string = function
    | `WAFDisallowedNameException _ -> "com.amazonaws.wafregional#WAFDisallowedNameException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDisallowedNameException" ->
          `WAFDisallowedNameException
            (Json_deserializers.waf_disallowed_name_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_regex_match_set_request) =
    let input = Json_serializers.update_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateRegexMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_regex_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_regex_match_set_request) =
    let input = Json_serializers.update_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateRegexMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_regex_match_set_response_of_yojson
      ~error_deserializer
end

module UpdateRegexPatternSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidRegexPatternException _ ->
        "com.amazonaws.wafregional#WAFInvalidRegexPatternException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidRegexPatternException" ->
          `WAFInvalidRegexPatternException
            (Json_deserializers.waf_invalid_regex_pattern_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_regex_pattern_set_request) =
    let input = Json_serializers.update_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateRegexPatternSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_regex_pattern_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_regex_pattern_set_request) =
    let input = Json_serializers.update_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateRegexPatternSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module UpdateRule = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_rule_request) =
    let input = Json_serializers.update_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateRule" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rule_request) =
    let input = Json_serializers.update_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_response_of_yojson ~error_deserializer
end

module UpdateRuleGroup = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_rule_group_request) =
    let input = Json_serializers.update_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rule_group_request) =
    let input = Json_serializers.update_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_group_response_of_yojson
      ~error_deserializer
end

module UpdateSizeConstraintSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_size_constraint_set_request) =
    let input = Json_serializers.update_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.UpdateSizeConstraintSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_size_constraint_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_size_constraint_set_request) =
    let input = Json_serializers.update_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateSizeConstraintSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_size_constraint_set_response_of_yojson
      ~error_deserializer
end

module UpdateSqlInjectionMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_sql_injection_match_set_request) =
    let input = Json_serializers.update_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_Regional_20161128.UpdateSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_sql_injection_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_sql_injection_match_set_request) =
    let input = Json_serializers.update_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateSqlInjectionMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_sql_injection_match_set_response_of_yojson
      ~error_deserializer
end

module UpdateWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFReferencedItemException _ -> "com.amazonaws.wafregional#WAFReferencedItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | `WAFSubscriptionNotFoundException _ ->
        "com.amazonaws.wafregional#WAFSubscriptionNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFReferencedItemException" ->
          `WAFReferencedItemException
            (Json_deserializers.waf_referenced_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _, "WAFSubscriptionNotFoundException" ->
          `WAFSubscriptionNotFoundException
            (Json_deserializers.waf_subscription_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_web_acl_request) =
    let input = Json_serializers.update_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateWebACL" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_web_acl_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_web_acl_request) =
    let input = Json_serializers.update_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateWebACL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_web_acl_response_of_yojson ~error_deserializer
end

module UpdateXssMatchSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafregional#WAFInternalErrorException"
    | `WAFInvalidAccountException _ -> "com.amazonaws.wafregional#WAFInvalidAccountException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafregional#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafregional#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafregional#WAFLimitsExceededException"
    | `WAFNonexistentContainerException _ ->
        "com.amazonaws.wafregional#WAFNonexistentContainerException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafregional#WAFNonexistentItemException"
    | `WAFStaleDataException _ -> "com.amazonaws.wafregional#WAFStaleDataException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidAccountException" ->
          `WAFInvalidAccountException
            (Json_deserializers.waf_invalid_account_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentContainerException" ->
          `WAFNonexistentContainerException
            (Json_deserializers.waf_nonexistent_container_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFStaleDataException" ->
          `WAFStaleDataException (Json_deserializers.waf_stale_data_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_xss_match_set_request) =
    let input = Json_serializers.update_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_Regional_20161128.UpdateXssMatchSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_xss_match_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_xss_match_set_request) =
    let input = Json_serializers.update_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSWAF_Regional_20161128.UpdateXssMatchSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_xss_match_set_response_of_yojson
      ~error_deserializer
end
