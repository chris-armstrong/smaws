open Types
open Service_metadata

module DescribeAffectedAccountsForOrganization = struct
  let error_to_string = function
    | `InvalidPaginationToken _ -> "com.amazonaws.health#InvalidPaginationToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationToken" ->
          `InvalidPaginationToken (Json_deserializers.invalid_pagination_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_affected_accounts_for_organization_request) =
    let input =
      Json_serializers.describe_affected_accounts_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.DescribeAffectedAccountsForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_affected_accounts_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_affected_accounts_for_organization_request)
      =
    let input =
      Json_serializers.describe_affected_accounts_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeAffectedAccountsForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_affected_accounts_for_organization_response_of_yojson
      ~error_deserializer
end

module DescribeAffectedEntities = struct
  let error_to_string = function
    | `InvalidPaginationToken _ -> "com.amazonaws.health#InvalidPaginationToken"
    | `UnsupportedLocale _ -> "com.amazonaws.health#UnsupportedLocale"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationToken" ->
          `InvalidPaginationToken (Json_deserializers.invalid_pagination_token_of_yojson tree path)
      | _, "UnsupportedLocale" ->
          `UnsupportedLocale (Json_deserializers.unsupported_locale_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_affected_entities_request) =
    let input = Json_serializers.describe_affected_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHealth_20160804.DescribeAffectedEntities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_affected_entities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_affected_entities_request) =
    let input = Json_serializers.describe_affected_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeAffectedEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_affected_entities_response_of_yojson
      ~error_deserializer
end

module DescribeAffectedEntitiesForOrganization = struct
  let error_to_string = function
    | `InvalidPaginationToken _ -> "com.amazonaws.health#InvalidPaginationToken"
    | `UnsupportedLocale _ -> "com.amazonaws.health#UnsupportedLocale"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationToken" ->
          `InvalidPaginationToken (Json_deserializers.invalid_pagination_token_of_yojson tree path)
      | _, "UnsupportedLocale" ->
          `UnsupportedLocale (Json_deserializers.unsupported_locale_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_affected_entities_for_organization_request) =
    let input =
      Json_serializers.describe_affected_entities_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.DescribeAffectedEntitiesForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_affected_entities_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_affected_entities_for_organization_request)
      =
    let input =
      Json_serializers.describe_affected_entities_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeAffectedEntitiesForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_affected_entities_for_organization_response_of_yojson
      ~error_deserializer
end

module DescribeEntityAggregates = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_entity_aggregates_request) =
    let input = Json_serializers.describe_entity_aggregates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHealth_20160804.DescribeEntityAggregates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entity_aggregates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_entity_aggregates_request) =
    let input = Json_serializers.describe_entity_aggregates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEntityAggregates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entity_aggregates_response_of_yojson
      ~error_deserializer
end

module DescribeEntityAggregatesForOrganization = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_entity_aggregates_for_organization_request) =
    let input =
      Json_serializers.describe_entity_aggregates_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.DescribeEntityAggregatesForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_entity_aggregates_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_entity_aggregates_for_organization_request)
      =
    let input =
      Json_serializers.describe_entity_aggregates_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEntityAggregatesForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_entity_aggregates_for_organization_response_of_yojson
      ~error_deserializer
end

module DescribeEventAggregates = struct
  let error_to_string = function
    | `InvalidPaginationToken _ -> "com.amazonaws.health#InvalidPaginationToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationToken" ->
          `InvalidPaginationToken (Json_deserializers.invalid_pagination_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_aggregates_request) =
    let input = Json_serializers.describe_event_aggregates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHealth_20160804.DescribeEventAggregates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_aggregates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_event_aggregates_request) =
    let input = Json_serializers.describe_event_aggregates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEventAggregates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_aggregates_response_of_yojson
      ~error_deserializer
end

module DescribeEventDetails = struct
  let error_to_string = function
    | `UnsupportedLocale _ -> "com.amazonaws.health#UnsupportedLocale"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "UnsupportedLocale" ->
          `UnsupportedLocale (Json_deserializers.unsupported_locale_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_details_request) =
    let input = Json_serializers.describe_event_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHealth_20160804.DescribeEventDetails"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_details_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_event_details_request) =
    let input = Json_serializers.describe_event_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEventDetails" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_details_response_of_yojson
      ~error_deserializer
end

module DescribeEventDetailsForOrganization = struct
  let error_to_string = function
    | `UnsupportedLocale _ -> "com.amazonaws.health#UnsupportedLocale"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "UnsupportedLocale" ->
          `UnsupportedLocale (Json_deserializers.unsupported_locale_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_details_for_organization_request) =
    let input =
      Json_serializers.describe_event_details_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.DescribeEventDetailsForOrganization" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_event_details_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_event_details_for_organization_request) =
    let input =
      Json_serializers.describe_event_details_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEventDetailsForOrganization" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_event_details_for_organization_response_of_yojson
      ~error_deserializer
end

module DescribeEventTypes = struct
  let error_to_string = function
    | `InvalidPaginationToken _ -> "com.amazonaws.health#InvalidPaginationToken"
    | `UnsupportedLocale _ -> "com.amazonaws.health#UnsupportedLocale"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationToken" ->
          `InvalidPaginationToken (Json_deserializers.invalid_pagination_token_of_yojson tree path)
      | _, "UnsupportedLocale" ->
          `UnsupportedLocale (Json_deserializers.unsupported_locale_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_types_request) =
    let input = Json_serializers.describe_event_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHealth_20160804.DescribeEventTypes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_event_types_request) =
    let input = Json_serializers.describe_event_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEventTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_types_response_of_yojson
      ~error_deserializer
end

module DescribeEvents = struct
  let error_to_string = function
    | `InvalidPaginationToken _ -> "com.amazonaws.health#InvalidPaginationToken"
    | `UnsupportedLocale _ -> "com.amazonaws.health#UnsupportedLocale"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationToken" ->
          `InvalidPaginationToken (Json_deserializers.invalid_pagination_token_of_yojson tree path)
      | _, "UnsupportedLocale" ->
          `UnsupportedLocale (Json_deserializers.unsupported_locale_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_events_request) =
    let input = Json_serializers.describe_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHealth_20160804.DescribeEvents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_events_request) =
    let input = Json_serializers.describe_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_events_response_of_yojson ~error_deserializer
end

module DescribeEventsForOrganization = struct
  let error_to_string = function
    | `InvalidPaginationToken _ -> "com.amazonaws.health#InvalidPaginationToken"
    | `UnsupportedLocale _ -> "com.amazonaws.health#UnsupportedLocale"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidPaginationToken" ->
          `InvalidPaginationToken (Json_deserializers.invalid_pagination_token_of_yojson tree path)
      | _, "UnsupportedLocale" ->
          `UnsupportedLocale (Json_deserializers.unsupported_locale_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_events_for_organization_request) =
    let input = Json_serializers.describe_events_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.DescribeEventsForOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_events_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_events_for_organization_request) =
    let input = Json_serializers.describe_events_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeEventsForOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_events_for_organization_response_of_yojson
      ~error_deserializer
end

module DescribeHealthServiceStatusForOrganization = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.DescribeHealthServiceStatusForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_health_service_status_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DescribeHealthServiceStatusForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_health_service_status_for_organization_response_of_yojson
      ~error_deserializer
end

module DisableHealthServiceAccessForOrganization = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.health#ConcurrentModificationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.DisableHealthServiceAccessForOrganization" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.DisableHealthServiceAccessForOrganization" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module EnableHealthServiceAccessForOrganization = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.health#ConcurrentModificationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHealth_20160804.EnableHealthServiceAccessForOrganization" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHealth_20160804.EnableHealthServiceAccessForOrganization" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
