open Smaws_Lib.Json.SerializeHelpers
open Types

let policy_description_to_yojson = string_to_yojson
let policy_version_to_yojson = string_to_yojson
let policy_name_to_yojson = string_to_yojson
let access_policy_type_to_yojson (x : access_policy_type) = match x with Data -> `String "data"

let access_policy_detail_to_yojson (x : access_policy_detail) =
  assoc_to_yojson
    [
      ("type", option_to_yojson access_policy_type_to_yojson x.type_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("policyVersion", option_to_yojson policy_version_to_yojson x.policy_version);
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson x.policy);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let access_policy_stats_to_yojson (x : access_policy_stats) =
  assoc_to_yojson
    [
      ( "DataPolicyCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.data_policy_count );
    ]

let access_policy_summary_to_yojson (x : access_policy_summary) =
  assoc_to_yojson
    [
      ("type", option_to_yojson access_policy_type_to_yojson x.type_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("policyVersion", option_to_yojson policy_version_to_yojson x.policy_version);
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let access_policy_summaries_to_yojson tree = list_to_yojson access_policy_summary_to_yojson tree
let search_capacity_value_to_yojson = int_to_yojson
let indexing_capacity_value_to_yojson = int_to_yojson

let capacity_limits_to_yojson (x : capacity_limits) =
  assoc_to_yojson
    [
      ( "maxIndexingCapacityInOCU",
        option_to_yojson indexing_capacity_value_to_yojson x.max_indexing_capacity_in_oc_u );
      ( "maxSearchCapacityInOCU",
        option_to_yojson search_capacity_value_to_yojson x.max_search_capacity_in_oc_u );
    ]

let account_settings_detail_to_yojson (x : account_settings_detail) =
  assoc_to_yojson
    [ ("capacityLimits", option_to_yojson capacity_limits_to_yojson x.capacity_limits) ]

let arn_to_yojson = string_to_yojson

let autoscaling_status_to_yojson (x : autoscaling_status) =
  match x with
  | ACTION_SCALING_UP -> `String "ACTION_SCALING_UP"
  | ACTION_SCALING_DOWN -> `String "ACTION_SCALING_DOWN"
  | NO_ACTION -> `String "NO_ACTION"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let collection_name_to_yojson = string_to_yojson
let collection_id_to_yojson = string_to_yojson

let collection_error_detail_to_yojson (x : collection_error_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_id_to_yojson x.id);
      ("name", option_to_yojson collection_name_to_yojson x.name);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code );
    ]

let collection_error_details_to_yojson tree = list_to_yojson collection_error_detail_to_yojson tree
let collection_group_name_to_yojson = string_to_yojson

let fips_endpoints_to_yojson (x : fips_endpoints) =
  assoc_to_yojson
    [
      ( "collectionEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.collection_endpoint );
      ( "dashboardEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.dashboard_endpoint );
    ]

let serverless_vector_acceleration_status_to_yojson (x : serverless_vector_acceleration_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | ALLOWED -> `String "ALLOWED"

let vector_options_to_yojson (x : vector_options) =
  assoc_to_yojson
    [
      ( "ServerlessVectorAcceleration",
        Some (serverless_vector_acceleration_status_to_yojson x.serverless_vector_acceleration) );
    ]

let deletion_protection_to_yojson (x : deletion_protection) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let standby_replicas_to_yojson (x : standby_replicas) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let collection_type_to_yojson (x : collection_type) =
  match x with
  | SEARCH -> `String "SEARCH"
  | TIMESERIES -> `String "TIMESERIES"
  | VECTORSEARCH -> `String "VECTORSEARCH"

let collection_status_to_yojson (x : collection_status) =
  match x with
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | FAILED -> `String "FAILED"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let collection_detail_to_yojson (x : collection_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_id_to_yojson x.id);
      ("name", option_to_yojson collection_name_to_yojson x.name);
      ("status", option_to_yojson collection_status_to_yojson x.status);
      ("type", option_to_yojson collection_type_to_yojson x.type_);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "kmsKeyArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_arn );
      ("standbyReplicas", option_to_yojson standby_replicas_to_yojson x.standby_replicas);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("vectorOptions", option_to_yojson vector_options_to_yojson x.vector_options);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
      ( "collectionEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.collection_endpoint );
      ( "dashboardEndpoint",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.dashboard_endpoint );
      ("fipsEndpoints", option_to_yojson fips_endpoints_to_yojson x.fips_endpoints);
      ( "failureCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_code );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "collectionGroupName",
        option_to_yojson collection_group_name_to_yojson x.collection_group_name );
    ]

let collection_details_to_yojson tree = list_to_yojson collection_detail_to_yojson tree

let batch_get_collection_response_to_yojson (x : batch_get_collection_response) =
  assoc_to_yojson
    [
      ("collectionDetails", option_to_yojson collection_details_to_yojson x.collection_details);
      ( "collectionErrorDetails",
        option_to_yojson collection_error_details_to_yojson x.collection_error_details );
    ]

let collection_names_to_yojson tree = list_to_yojson collection_name_to_yojson tree
let collection_ids_to_yojson tree = list_to_yojson collection_id_to_yojson tree

let batch_get_collection_request_to_yojson (x : batch_get_collection_request) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson collection_ids_to_yojson x.ids);
      ("names", option_to_yojson collection_names_to_yojson x.names);
    ]

let collection_group_id_to_yojson = string_to_yojson

let collection_group_error_detail_to_yojson (x : collection_group_error_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_group_id_to_yojson x.id);
      ("name", option_to_yojson collection_group_name_to_yojson x.name);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code );
    ]

let collection_group_error_details_to_yojson tree =
  list_to_yojson collection_group_error_detail_to_yojson tree

let serverless_generation_to_yojson (x : serverless_generation) =
  match x with CLASSIC -> `String "CLASSIC" | NEXTGEN -> `String "NEXTGEN"

let capacity_details_to_yojson (x : capacity_details) =
  assoc_to_yojson
    [
      ( "capacityInOcu",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.capacity_in_ocu );
      ("autoscalingStatus", option_to_yojson autoscaling_status_to_yojson x.autoscaling_status);
    ]

let current_capacity_to_yojson (x : current_capacity) =
  assoc_to_yojson
    [
      ("search", option_to_yojson capacity_details_to_yojson x.search);
      ("indexing", option_to_yojson capacity_details_to_yojson x.indexing);
    ]

let collection_group_min_search_capacity_value_to_yojson = float_to_yojson
let collection_group_min_indexing_capacity_value_to_yojson = float_to_yojson
let collection_group_max_search_capacity_value_to_yojson = float_to_yojson
let collection_group_max_indexing_capacity_value_to_yojson = float_to_yojson

let collection_group_capacity_limits_to_yojson (x : collection_group_capacity_limits) =
  assoc_to_yojson
    [
      ( "maxIndexingCapacityInOCU",
        option_to_yojson collection_group_max_indexing_capacity_value_to_yojson
          x.max_indexing_capacity_in_oc_u );
      ( "maxSearchCapacityInOCU",
        option_to_yojson collection_group_max_search_capacity_value_to_yojson
          x.max_search_capacity_in_oc_u );
      ( "minIndexingCapacityInOCU",
        option_to_yojson collection_group_min_indexing_capacity_value_to_yojson
          x.min_indexing_capacity_in_oc_u );
      ( "minSearchCapacityInOCU",
        option_to_yojson collection_group_min_search_capacity_value_to_yojson
          x.min_search_capacity_in_oc_u );
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let collection_group_detail_to_yojson (x : collection_group_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_group_id_to_yojson x.id);
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("name", option_to_yojson collection_group_name_to_yojson x.name);
      ("standbyReplicas", option_to_yojson standby_replicas_to_yojson x.standby_replicas);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "capacityLimits",
        option_to_yojson collection_group_capacity_limits_to_yojson x.capacity_limits );
      ("currentCapacity", option_to_yojson current_capacity_to_yojson x.current_capacity);
      ( "numberOfCollections",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.number_of_collections );
      ("generation", option_to_yojson serverless_generation_to_yojson x.generation);
    ]

let collection_group_details_to_yojson tree = list_to_yojson collection_group_detail_to_yojson tree

let batch_get_collection_group_response_to_yojson (x : batch_get_collection_group_response) =
  assoc_to_yojson
    [
      ( "collectionGroupDetails",
        option_to_yojson collection_group_details_to_yojson x.collection_group_details );
      ( "collectionGroupErrorDetails",
        option_to_yojson collection_group_error_details_to_yojson x.collection_group_error_details
      );
    ]

let collection_group_names_to_yojson tree = list_to_yojson collection_group_name_to_yojson tree
let collection_group_ids_to_yojson tree = list_to_yojson collection_group_id_to_yojson tree

let batch_get_collection_group_request_to_yojson (x : batch_get_collection_group_request) =
  assoc_to_yojson
    [
      ("ids", option_to_yojson collection_group_ids_to_yojson x.ids);
      ("names", option_to_yojson collection_group_names_to_yojson x.names);
    ]

let resource_to_yojson = string_to_yojson

let lifecycle_policy_type_to_yojson (x : lifecycle_policy_type) =
  match x with Retention -> `String "retention"

let effective_lifecycle_policy_error_detail_to_yojson (x : effective_lifecycle_policy_error_detail)
    =
  assoc_to_yojson
    [
      ("type", option_to_yojson lifecycle_policy_type_to_yojson x.type_);
      ("resource", option_to_yojson resource_to_yojson x.resource);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code );
    ]

let effective_lifecycle_policy_error_details_to_yojson tree =
  list_to_yojson effective_lifecycle_policy_error_detail_to_yojson tree

let resource_type_to_yojson (x : resource_type) = match x with Index -> `String "index"

let effective_lifecycle_policy_detail_to_yojson (x : effective_lifecycle_policy_detail) =
  assoc_to_yojson
    [
      ("type", option_to_yojson lifecycle_policy_type_to_yojson x.type_);
      ("resource", option_to_yojson resource_to_yojson x.resource);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "retentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.retention_period
      );
      ( "noMinRetentionPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.no_min_retention_period );
    ]

let effective_lifecycle_policy_details_to_yojson tree =
  list_to_yojson effective_lifecycle_policy_detail_to_yojson tree

let batch_get_effective_lifecycle_policy_response_to_yojson
    (x : batch_get_effective_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ( "effectiveLifecyclePolicyDetails",
        option_to_yojson effective_lifecycle_policy_details_to_yojson
          x.effective_lifecycle_policy_details );
      ( "effectiveLifecyclePolicyErrorDetails",
        option_to_yojson effective_lifecycle_policy_error_details_to_yojson
          x.effective_lifecycle_policy_error_details );
    ]

let resource_name_to_yojson = string_to_yojson

let lifecycle_policy_resource_identifier_to_yojson (x : lifecycle_policy_resource_identifier) =
  assoc_to_yojson
    [
      ("type", Some (lifecycle_policy_type_to_yojson x.type_));
      ("resource", Some (resource_name_to_yojson x.resource));
    ]

let lifecycle_policy_resource_identifiers_to_yojson tree =
  list_to_yojson lifecycle_policy_resource_identifier_to_yojson tree

let batch_get_effective_lifecycle_policy_request_to_yojson
    (x : batch_get_effective_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ( "resourceIdentifiers",
        Some (lifecycle_policy_resource_identifiers_to_yojson x.resource_identifiers) );
    ]

let lifecycle_policy_error_detail_to_yojson (x : lifecycle_policy_error_detail) =
  assoc_to_yojson
    [
      ("type", option_to_yojson lifecycle_policy_type_to_yojson x.type_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code );
    ]

let lifecycle_policy_error_details_to_yojson tree =
  list_to_yojson lifecycle_policy_error_detail_to_yojson tree

let lifecycle_policy_detail_to_yojson (x : lifecycle_policy_detail) =
  assoc_to_yojson
    [
      ("type", option_to_yojson lifecycle_policy_type_to_yojson x.type_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("policyVersion", option_to_yojson policy_version_to_yojson x.policy_version);
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson x.policy);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let lifecycle_policy_details_to_yojson tree = list_to_yojson lifecycle_policy_detail_to_yojson tree

let batch_get_lifecycle_policy_response_to_yojson (x : batch_get_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ( "lifecyclePolicyDetails",
        option_to_yojson lifecycle_policy_details_to_yojson x.lifecycle_policy_details );
      ( "lifecyclePolicyErrorDetails",
        option_to_yojson lifecycle_policy_error_details_to_yojson x.lifecycle_policy_error_details
      );
    ]

let lifecycle_policy_identifier_to_yojson (x : lifecycle_policy_identifier) =
  assoc_to_yojson
    [
      ("type", Some (lifecycle_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
    ]

let lifecycle_policy_identifiers_to_yojson tree =
  list_to_yojson lifecycle_policy_identifier_to_yojson tree

let batch_get_lifecycle_policy_request_to_yojson (x : batch_get_lifecycle_policy_request) =
  assoc_to_yojson [ ("identifiers", Some (lifecycle_policy_identifiers_to_yojson x.identifiers)) ]

let vpc_endpoint_id_to_yojson = string_to_yojson

let vpc_endpoint_error_detail_to_yojson (x : vpc_endpoint_error_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson vpc_endpoint_id_to_yojson x.id);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code );
    ]

let vpc_endpoint_error_details_to_yojson tree =
  list_to_yojson vpc_endpoint_error_detail_to_yojson tree

let vpc_endpoint_status_to_yojson (x : vpc_endpoint_status) =
  match x with
  | PENDING -> `String "PENDING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | FAILED -> `String "FAILED"

let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let vpc_id_to_yojson = string_to_yojson
let vpc_endpoint_name_to_yojson = string_to_yojson

let vpc_endpoint_detail_to_yojson (x : vpc_endpoint_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson vpc_endpoint_id_to_yojson x.id);
      ("name", option_to_yojson vpc_endpoint_name_to_yojson x.name);
      ("vpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("subnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("status", option_to_yojson vpc_endpoint_status_to_yojson x.status);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "failureCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_code );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let vpc_endpoint_details_to_yojson tree = list_to_yojson vpc_endpoint_detail_to_yojson tree

let batch_get_vpc_endpoint_response_to_yojson (x : batch_get_vpc_endpoint_response) =
  assoc_to_yojson
    [
      ("vpcEndpointDetails", option_to_yojson vpc_endpoint_details_to_yojson x.vpc_endpoint_details);
      ( "vpcEndpointErrorDetails",
        option_to_yojson vpc_endpoint_error_details_to_yojson x.vpc_endpoint_error_details );
    ]

let vpc_endpoint_ids_to_yojson tree = list_to_yojson vpc_endpoint_id_to_yojson tree

let batch_get_vpc_endpoint_request_to_yojson (x : batch_get_vpc_endpoint_request) =
  assoc_to_yojson [ ("ids", Some (vpc_endpoint_ids_to_yojson x.ids)) ]

let client_token_to_yojson = string_to_yojson

let collection_filters_to_yojson (x : collection_filters) =
  assoc_to_yojson
    [
      ("name", option_to_yojson collection_name_to_yojson x.name);
      ("status", option_to_yojson collection_status_to_yojson x.status);
      ( "collectionGroupName",
        option_to_yojson collection_group_name_to_yojson x.collection_group_name );
    ]

let collection_group_summary_to_yojson (x : collection_group_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_group_id_to_yojson x.id);
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("name", option_to_yojson collection_group_name_to_yojson x.name);
      ( "numberOfCollections",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.number_of_collections );
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "capacityLimits",
        option_to_yojson collection_group_capacity_limits_to_yojson x.capacity_limits );
      ("generation", option_to_yojson serverless_generation_to_yojson x.generation);
    ]

let collection_group_summaries_to_yojson tree =
  list_to_yojson collection_group_summary_to_yojson tree

let collection_summary_to_yojson (x : collection_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_id_to_yojson x.id);
      ("name", option_to_yojson collection_name_to_yojson x.name);
      ("status", option_to_yojson collection_status_to_yojson x.status);
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "kmsKeyArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_arn );
      ( "collectionGroupName",
        option_to_yojson collection_group_name_to_yojson x.collection_group_name );
    ]

let collection_summaries_to_yojson tree = list_to_yojson collection_summary_to_yojson tree
let config_description_to_yojson = string_to_yojson
let config_name_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ( "resourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type );
      ("serviceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
    ]

let create_access_policy_response_to_yojson (x : create_access_policy_response) =
  assoc_to_yojson
    [
      ("accessPolicyDetail", option_to_yojson access_policy_detail_to_yojson x.access_policy_detail);
    ]

let policy_document_to_yojson = string_to_yojson

let create_access_policy_request_to_yojson (x : create_access_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (access_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", Some (policy_document_to_yojson x.policy));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let ocu_limit_exceeded_exception_to_yojson (x : ocu_limit_exceeded_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let create_collection_detail_to_yojson (x : create_collection_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_id_to_yojson x.id);
      ("name", option_to_yojson collection_name_to_yojson x.name);
      ("status", option_to_yojson collection_status_to_yojson x.status);
      ("type", option_to_yojson collection_type_to_yojson x.type_);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "kmsKeyArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_arn );
      ("standbyReplicas", option_to_yojson standby_replicas_to_yojson x.standby_replicas);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ("vectorOptions", option_to_yojson vector_options_to_yojson x.vector_options);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
      ( "collectionGroupName",
        option_to_yojson collection_group_name_to_yojson x.collection_group_name );
    ]

let create_collection_response_to_yojson (x : create_collection_response) =
  assoc_to_yojson
    [
      ( "createCollectionDetail",
        option_to_yojson create_collection_detail_to_yojson x.create_collection_detail );
    ]

let encryption_config_to_yojson (x : encryption_config) =
  assoc_to_yojson
    [
      ( "aWSOwnedKey",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.a_ws_owned_key
      );
      ( "kmsKeyArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.kms_key_arn );
    ]

let create_collection_request_to_yojson (x : create_collection_request) =
  assoc_to_yojson
    [
      ("name", Some (collection_name_to_yojson x.name));
      ("type", option_to_yojson collection_type_to_yojson x.type_);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("standbyReplicas", option_to_yojson standby_replicas_to_yojson x.standby_replicas);
      ("vectorOptions", option_to_yojson vector_options_to_yojson x.vector_options);
      ( "collectionGroupName",
        option_to_yojson collection_group_name_to_yojson x.collection_group_name );
      ("encryptionConfig", option_to_yojson encryption_config_to_yojson x.encryption_config);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_collection_group_detail_to_yojson (x : create_collection_group_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_group_id_to_yojson x.id);
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("name", option_to_yojson collection_group_name_to_yojson x.name);
      ("standbyReplicas", option_to_yojson standby_replicas_to_yojson x.standby_replicas);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "capacityLimits",
        option_to_yojson collection_group_capacity_limits_to_yojson x.capacity_limits );
      ("generation", option_to_yojson serverless_generation_to_yojson x.generation);
    ]

let create_collection_group_response_to_yojson (x : create_collection_group_response) =
  assoc_to_yojson
    [
      ( "createCollectionGroupDetail",
        option_to_yojson create_collection_group_detail_to_yojson x.create_collection_group_detail
      );
    ]

let create_collection_group_request_to_yojson (x : create_collection_group_request) =
  assoc_to_yojson
    [
      ("name", Some (collection_group_name_to_yojson x.name));
      ("standbyReplicas", Some (standby_replicas_to_yojson x.standby_replicas));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "capacityLimits",
        option_to_yojson collection_group_capacity_limits_to_yojson x.capacity_limits );
      ("generation", option_to_yojson serverless_generation_to_yojson x.generation);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let iam_identity_center_group_attribute_to_yojson (x : iam_identity_center_group_attribute) =
  match x with GroupId -> `String "GroupId" | GroupName -> `String "GroupName"

let iam_identity_center_user_attribute_to_yojson (x : iam_identity_center_user_attribute) =
  match x with
  | UserId -> `String "UserId"
  | UserName -> `String "UserName"
  | Email -> `String "Email"

let iam_identity_center_instance_arn_to_yojson = string_to_yojson

let create_iam_identity_center_config_options_to_yojson
    (x : create_iam_identity_center_config_options) =
  assoc_to_yojson
    [
      ("instanceArn", Some (iam_identity_center_instance_arn_to_yojson x.instance_arn));
      ( "userAttribute",
        option_to_yojson iam_identity_center_user_attribute_to_yojson x.user_attribute );
      ( "groupAttribute",
        option_to_yojson iam_identity_center_group_attribute_to_yojson x.group_attribute );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let create_index_response_to_yojson = unit_to_yojson
let index_schema_to_yojson = json_to_yojson
let index_name_to_yojson = string_to_yojson

let create_index_request_to_yojson (x : create_index_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_id_to_yojson x.id));
      ("indexName", Some (index_name_to_yojson x.index_name));
      ("indexSchema", option_to_yojson index_schema_to_yojson x.index_schema);
    ]

let create_lifecycle_policy_response_to_yojson (x : create_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ( "lifecyclePolicyDetail",
        option_to_yojson lifecycle_policy_detail_to_yojson x.lifecycle_policy_detail );
    ]

let create_lifecycle_policy_request_to_yojson (x : create_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (lifecycle_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", Some (policy_document_to_yojson x.policy));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let iam_federation_user_attribute_to_yojson = string_to_yojson
let iam_federation_group_attribute_to_yojson = string_to_yojson

let iam_federation_config_options_to_yojson (x : iam_federation_config_options) =
  assoc_to_yojson
    [
      ("groupAttribute", option_to_yojson iam_federation_group_attribute_to_yojson x.group_attribute);
      ("userAttribute", option_to_yojson iam_federation_user_attribute_to_yojson x.user_attribute);
    ]

let iam_identity_center_application_arn_to_yojson = string_to_yojson

let iam_identity_center_config_options_to_yojson (x : iam_identity_center_config_options) =
  assoc_to_yojson
    [
      ("instanceArn", option_to_yojson iam_identity_center_instance_arn_to_yojson x.instance_arn);
      ( "applicationArn",
        option_to_yojson iam_identity_center_application_arn_to_yojson x.application_arn );
      ( "applicationName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.application_name
      );
      ( "applicationDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.application_description );
      ( "userAttribute",
        option_to_yojson iam_identity_center_user_attribute_to_yojson x.user_attribute );
      ( "groupAttribute",
        option_to_yojson iam_identity_center_group_attribute_to_yojson x.group_attribute );
    ]

let open_search_serverless_entity_id_to_yojson = string_to_yojson
let saml_group_attribute_to_yojson = string_to_yojson
let saml_user_attribute_to_yojson = string_to_yojson
let saml_metadata_to_yojson = string_to_yojson

let saml_config_options_to_yojson (x : saml_config_options) =
  assoc_to_yojson
    [
      ("metadata", Some (saml_metadata_to_yojson x.metadata));
      ("userAttribute", option_to_yojson saml_user_attribute_to_yojson x.user_attribute);
      ("groupAttribute", option_to_yojson saml_group_attribute_to_yojson x.group_attribute);
      ( "openSearchServerlessEntityId",
        option_to_yojson open_search_serverless_entity_id_to_yojson
          x.open_search_serverless_entity_id );
      ( "sessionTimeout",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.session_timeout
      );
    ]

let security_config_type_to_yojson (x : security_config_type) =
  match x with
  | Saml -> `String "saml"
  | Iamidentitycenter -> `String "iamidentitycenter"
  | Iamfederation -> `String "iamfederation"

let security_config_id_to_yojson = string_to_yojson

let security_config_detail_to_yojson (x : security_config_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson security_config_id_to_yojson x.id);
      ("type", option_to_yojson security_config_type_to_yojson x.type_);
      ("configVersion", option_to_yojson policy_version_to_yojson x.config_version);
      ("description", option_to_yojson config_description_to_yojson x.description);
      ("samlOptions", option_to_yojson saml_config_options_to_yojson x.saml_options);
      ( "iamIdentityCenterOptions",
        option_to_yojson iam_identity_center_config_options_to_yojson x.iam_identity_center_options
      );
      ( "iamFederationOptions",
        option_to_yojson iam_federation_config_options_to_yojson x.iam_federation_options );
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let create_security_config_response_to_yojson (x : create_security_config_response) =
  assoc_to_yojson
    [
      ( "securityConfigDetail",
        option_to_yojson security_config_detail_to_yojson x.security_config_detail );
    ]

let create_security_config_request_to_yojson (x : create_security_config_request) =
  assoc_to_yojson
    [
      ("type", Some (security_config_type_to_yojson x.type_));
      ("name", Some (config_name_to_yojson x.name));
      ("description", option_to_yojson config_description_to_yojson x.description);
      ("samlOptions", option_to_yojson saml_config_options_to_yojson x.saml_options);
      ( "iamIdentityCenterOptions",
        option_to_yojson create_iam_identity_center_config_options_to_yojson
          x.iam_identity_center_options );
      ( "iamFederationOptions",
        option_to_yojson iam_federation_config_options_to_yojson x.iam_federation_options );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let security_policy_type_to_yojson (x : security_policy_type) =
  match x with Encryption -> `String "encryption" | Network -> `String "network"

let security_policy_detail_to_yojson (x : security_policy_detail) =
  assoc_to_yojson
    [
      ("type", option_to_yojson security_policy_type_to_yojson x.type_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("policyVersion", option_to_yojson policy_version_to_yojson x.policy_version);
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson x.policy);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let create_security_policy_response_to_yojson (x : create_security_policy_response) =
  assoc_to_yojson
    [
      ( "securityPolicyDetail",
        option_to_yojson security_policy_detail_to_yojson x.security_policy_detail );
    ]

let create_security_policy_request_to_yojson (x : create_security_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (security_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", Some (policy_document_to_yojson x.policy));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_vpc_endpoint_detail_to_yojson (x : create_vpc_endpoint_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson vpc_endpoint_id_to_yojson x.id);
      ("name", option_to_yojson vpc_endpoint_name_to_yojson x.name);
      ("status", option_to_yojson vpc_endpoint_status_to_yojson x.status);
    ]

let create_vpc_endpoint_response_to_yojson (x : create_vpc_endpoint_response) =
  assoc_to_yojson
    [
      ( "createVpcEndpointDetail",
        option_to_yojson create_vpc_endpoint_detail_to_yojson x.create_vpc_endpoint_detail );
    ]

let create_vpc_endpoint_request_to_yojson (x : create_vpc_endpoint_request) =
  assoc_to_yojson
    [
      ("name", Some (vpc_endpoint_name_to_yojson x.name));
      ("vpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("subnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("securityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_access_policy_response_to_yojson = unit_to_yojson

let delete_access_policy_request_to_yojson (x : delete_access_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (access_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_collection_detail_to_yojson (x : delete_collection_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_id_to_yojson x.id);
      ("name", option_to_yojson collection_name_to_yojson x.name);
      ("status", option_to_yojson collection_status_to_yojson x.status);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
    ]

let delete_collection_response_to_yojson (x : delete_collection_response) =
  assoc_to_yojson
    [
      ( "deleteCollectionDetail",
        option_to_yojson delete_collection_detail_to_yojson x.delete_collection_detail );
    ]

let delete_collection_request_to_yojson (x : delete_collection_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_id_to_yojson x.id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_collection_group_response_to_yojson = unit_to_yojson

let delete_collection_group_request_to_yojson (x : delete_collection_group_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_group_id_to_yojson x.id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_index_response_to_yojson = unit_to_yojson

let delete_index_request_to_yojson (x : delete_index_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_id_to_yojson x.id));
      ("indexName", Some (index_name_to_yojson x.index_name));
    ]

let delete_lifecycle_policy_response_to_yojson = unit_to_yojson

let delete_lifecycle_policy_request_to_yojson (x : delete_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (lifecycle_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_security_config_response_to_yojson = unit_to_yojson

let delete_security_config_request_to_yojson (x : delete_security_config_request) =
  assoc_to_yojson
    [
      ("id", Some (security_config_id_to_yojson x.id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_security_policy_response_to_yojson = unit_to_yojson

let delete_security_policy_request_to_yojson (x : delete_security_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (security_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_vpc_endpoint_detail_to_yojson (x : delete_vpc_endpoint_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson vpc_endpoint_id_to_yojson x.id);
      ("name", option_to_yojson vpc_endpoint_name_to_yojson x.name);
      ("status", option_to_yojson vpc_endpoint_status_to_yojson x.status);
    ]

let delete_vpc_endpoint_response_to_yojson (x : delete_vpc_endpoint_response) =
  assoc_to_yojson
    [
      ( "deleteVpcEndpointDetail",
        option_to_yojson delete_vpc_endpoint_detail_to_yojson x.delete_vpc_endpoint_detail );
    ]

let delete_vpc_endpoint_request_to_yojson (x : delete_vpc_endpoint_request) =
  assoc_to_yojson
    [
      ("id", Some (vpc_endpoint_id_to_yojson x.id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let get_access_policy_response_to_yojson (x : get_access_policy_response) =
  assoc_to_yojson
    [
      ("accessPolicyDetail", option_to_yojson access_policy_detail_to_yojson x.access_policy_detail);
    ]

let get_access_policy_request_to_yojson (x : get_access_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (access_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
    ]

let get_account_settings_response_to_yojson (x : get_account_settings_response) =
  assoc_to_yojson
    [
      ( "accountSettingsDetail",
        option_to_yojson account_settings_detail_to_yojson x.account_settings_detail );
    ]

let get_account_settings_request_to_yojson = unit_to_yojson

let get_index_response_to_yojson (x : get_index_response) =
  assoc_to_yojson [ ("indexSchema", option_to_yojson index_schema_to_yojson x.index_schema) ]

let get_index_request_to_yojson (x : get_index_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_id_to_yojson x.id));
      ("indexName", Some (index_name_to_yojson x.index_name));
    ]

let lifecycle_policy_stats_to_yojson (x : lifecycle_policy_stats) =
  assoc_to_yojson
    [
      ( "RetentionPolicyCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.retention_policy_count );
    ]

let security_config_stats_to_yojson (x : security_config_stats) =
  assoc_to_yojson
    [
      ( "SamlConfigCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.saml_config_count );
    ]

let security_policy_stats_to_yojson (x : security_policy_stats) =
  assoc_to_yojson
    [
      ( "EncryptionPolicyCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.encryption_policy_count );
      ( "NetworkPolicyCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.network_policy_count
      );
    ]

let get_policies_stats_response_to_yojson (x : get_policies_stats_response) =
  assoc_to_yojson
    [
      ("AccessPolicyStats", option_to_yojson access_policy_stats_to_yojson x.access_policy_stats);
      ( "SecurityPolicyStats",
        option_to_yojson security_policy_stats_to_yojson x.security_policy_stats );
      ( "SecurityConfigStats",
        option_to_yojson security_config_stats_to_yojson x.security_config_stats );
      ( "LifecyclePolicyStats",
        option_to_yojson lifecycle_policy_stats_to_yojson x.lifecycle_policy_stats );
      ( "TotalPolicyCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.total_policy_count
      );
    ]

let get_policies_stats_request_to_yojson = unit_to_yojson

let get_security_config_response_to_yojson (x : get_security_config_response) =
  assoc_to_yojson
    [
      ( "securityConfigDetail",
        option_to_yojson security_config_detail_to_yojson x.security_config_detail );
    ]

let get_security_config_request_to_yojson (x : get_security_config_request) =
  assoc_to_yojson [ ("id", Some (security_config_id_to_yojson x.id)) ]

let get_security_policy_response_to_yojson (x : get_security_policy_response) =
  assoc_to_yojson
    [
      ( "securityPolicyDetail",
        option_to_yojson security_policy_detail_to_yojson x.security_policy_detail );
    ]

let get_security_policy_request_to_yojson (x : get_security_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (security_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
    ]

let lifecycle_policy_summary_to_yojson (x : lifecycle_policy_summary) =
  assoc_to_yojson
    [
      ("type", option_to_yojson lifecycle_policy_type_to_yojson x.type_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("policyVersion", option_to_yojson policy_version_to_yojson x.policy_version);
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let lifecycle_policy_summaries_to_yojson tree =
  list_to_yojson lifecycle_policy_summary_to_yojson tree

let lifecycle_resource_to_yojson = string_to_yojson
let lifecycle_resource_filter_to_yojson tree = list_to_yojson lifecycle_resource_to_yojson tree

let list_access_policies_response_to_yojson (x : list_access_policies_response) =
  assoc_to_yojson
    [
      ( "accessPolicySummaries",
        option_to_yojson access_policy_summaries_to_yojson x.access_policy_summaries );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let resource_filter_to_yojson tree = list_to_yojson resource_to_yojson tree

let list_access_policies_request_to_yojson (x : list_access_policies_request) =
  assoc_to_yojson
    [
      ("type", Some (access_policy_type_to_yojson x.type_));
      ("resource", option_to_yojson resource_filter_to_yojson x.resource);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_collection_groups_response_to_yojson (x : list_collection_groups_response) =
  assoc_to_yojson
    [
      ( "collectionGroupSummaries",
        option_to_yojson collection_group_summaries_to_yojson x.collection_group_summaries );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_collection_groups_request_to_yojson (x : list_collection_groups_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_collections_response_to_yojson (x : list_collections_response) =
  assoc_to_yojson
    [
      ("collectionSummaries", option_to_yojson collection_summaries_to_yojson x.collection_summaries);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_collections_request_to_yojson (x : list_collections_request) =
  assoc_to_yojson
    [
      ("collectionFilters", option_to_yojson collection_filters_to_yojson x.collection_filters);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_lifecycle_policies_response_to_yojson (x : list_lifecycle_policies_response) =
  assoc_to_yojson
    [
      ( "lifecyclePolicySummaries",
        option_to_yojson lifecycle_policy_summaries_to_yojson x.lifecycle_policy_summaries );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_lifecycle_policies_request_to_yojson (x : list_lifecycle_policies_request) =
  assoc_to_yojson
    [
      ("type", Some (lifecycle_policy_type_to_yojson x.type_));
      ("resources", option_to_yojson lifecycle_resource_filter_to_yojson x.resources);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let security_config_summary_to_yojson (x : security_config_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson security_config_id_to_yojson x.id);
      ("type", option_to_yojson security_config_type_to_yojson x.type_);
      ("configVersion", option_to_yojson policy_version_to_yojson x.config_version);
      ("description", option_to_yojson config_description_to_yojson x.description);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let security_config_summaries_to_yojson tree = list_to_yojson security_config_summary_to_yojson tree

let list_security_configs_response_to_yojson (x : list_security_configs_response) =
  assoc_to_yojson
    [
      ( "securityConfigSummaries",
        option_to_yojson security_config_summaries_to_yojson x.security_config_summaries );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_security_configs_request_to_yojson (x : list_security_configs_request) =
  assoc_to_yojson
    [
      ("type", Some (security_config_type_to_yojson x.type_));
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let security_policy_summary_to_yojson (x : security_policy_summary) =
  assoc_to_yojson
    [
      ("type", option_to_yojson security_policy_type_to_yojson x.type_);
      ("name", option_to_yojson policy_name_to_yojson x.name);
      ("policyVersion", option_to_yojson policy_version_to_yojson x.policy_version);
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let security_policy_summaries_to_yojson tree = list_to_yojson security_policy_summary_to_yojson tree

let list_security_policies_response_to_yojson (x : list_security_policies_response) =
  assoc_to_yojson
    [
      ( "securityPolicySummaries",
        option_to_yojson security_policy_summaries_to_yojson x.security_policy_summaries );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_security_policies_request_to_yojson (x : list_security_policies_request) =
  assoc_to_yojson
    [
      ("type", Some (security_policy_type_to_yojson x.type_));
      ("resource", option_to_yojson resource_filter_to_yojson x.resource);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let vpc_endpoint_summary_to_yojson (x : vpc_endpoint_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson vpc_endpoint_id_to_yojson x.id);
      ("name", option_to_yojson vpc_endpoint_name_to_yojson x.name);
      ("status", option_to_yojson vpc_endpoint_status_to_yojson x.status);
    ]

let vpc_endpoint_summaries_to_yojson tree = list_to_yojson vpc_endpoint_summary_to_yojson tree

let list_vpc_endpoints_response_to_yojson (x : list_vpc_endpoints_response) =
  assoc_to_yojson
    [
      ( "vpcEndpointSummaries",
        option_to_yojson vpc_endpoint_summaries_to_yojson x.vpc_endpoint_summaries );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let vpc_endpoint_filters_to_yojson (x : vpc_endpoint_filters) =
  assoc_to_yojson [ ("status", option_to_yojson vpc_endpoint_status_to_yojson x.status) ]

let list_vpc_endpoints_request_to_yojson (x : list_vpc_endpoints_request) =
  assoc_to_yojson
    [
      ("vpcEndpointFilters", option_to_yojson vpc_endpoint_filters_to_yojson x.vpc_endpoint_filters);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let update_vpc_endpoint_detail_to_yojson (x : update_vpc_endpoint_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson vpc_endpoint_id_to_yojson x.id);
      ("name", option_to_yojson vpc_endpoint_name_to_yojson x.name);
      ("status", option_to_yojson vpc_endpoint_status_to_yojson x.status);
      ("subnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("securityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
    ]

let update_vpc_endpoint_response_to_yojson (x : update_vpc_endpoint_response) =
  assoc_to_yojson
    [
      ( "UpdateVpcEndpointDetail",
        option_to_yojson update_vpc_endpoint_detail_to_yojson x.update_vpc_endpoint_detail );
    ]

let update_vpc_endpoint_request_to_yojson (x : update_vpc_endpoint_request) =
  assoc_to_yojson
    [
      ("id", Some (vpc_endpoint_id_to_yojson x.id));
      ("addSubnetIds", option_to_yojson subnet_ids_to_yojson x.add_subnet_ids);
      ("removeSubnetIds", option_to_yojson subnet_ids_to_yojson x.remove_subnet_ids);
      ("addSecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.add_security_group_ids);
      ( "removeSecurityGroupIds",
        option_to_yojson security_group_ids_to_yojson x.remove_security_group_ids );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_account_settings_response_to_yojson (x : update_account_settings_response) =
  assoc_to_yojson
    [
      ( "accountSettingsDetail",
        option_to_yojson account_settings_detail_to_yojson x.account_settings_detail );
    ]

let update_account_settings_request_to_yojson (x : update_account_settings_request) =
  assoc_to_yojson
    [ ("capacityLimits", option_to_yojson capacity_limits_to_yojson x.capacity_limits) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("resourceArn", Some (arn_to_yojson x.resource_arn)); ("tags", Some (tags_to_yojson x.tags)) ]

let update_access_policy_response_to_yojson (x : update_access_policy_response) =
  assoc_to_yojson
    [
      ("accessPolicyDetail", option_to_yojson access_policy_detail_to_yojson x.access_policy_detail);
    ]

let update_access_policy_request_to_yojson (x : update_access_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (access_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ("policyVersion", Some (policy_version_to_yojson x.policy_version));
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", option_to_yojson policy_document_to_yojson x.policy);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_collection_detail_to_yojson (x : update_collection_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_id_to_yojson x.id);
      ("name", option_to_yojson collection_name_to_yojson x.name);
      ("status", option_to_yojson collection_status_to_yojson x.status);
      ("type", option_to_yojson collection_type_to_yojson x.type_);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("vectorOptions", option_to_yojson vector_options_to_yojson x.vector_options);
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
    ]

let update_collection_response_to_yojson (x : update_collection_response) =
  assoc_to_yojson
    [
      ( "updateCollectionDetail",
        option_to_yojson update_collection_detail_to_yojson x.update_collection_detail );
    ]

let update_collection_request_to_yojson (x : update_collection_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_id_to_yojson x.id));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("vectorOptions", option_to_yojson vector_options_to_yojson x.vector_options);
      ("deletionProtection", option_to_yojson deletion_protection_to_yojson x.deletion_protection);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_collection_group_detail_to_yojson (x : update_collection_group_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson collection_group_id_to_yojson x.id);
      ("arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("name", option_to_yojson collection_group_name_to_yojson x.name);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "capacityLimits",
        option_to_yojson collection_group_capacity_limits_to_yojson x.capacity_limits );
      ( "createdDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.created_date );
      ( "lastModifiedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.last_modified_date
      );
      ("generation", option_to_yojson serverless_generation_to_yojson x.generation);
    ]

let update_collection_group_response_to_yojson (x : update_collection_group_response) =
  assoc_to_yojson
    [
      ( "updateCollectionGroupDetail",
        option_to_yojson update_collection_group_detail_to_yojson x.update_collection_group_detail
      );
    ]

let update_collection_group_request_to_yojson (x : update_collection_group_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_group_id_to_yojson x.id));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "capacityLimits",
        option_to_yojson collection_group_capacity_limits_to_yojson x.capacity_limits );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_iam_identity_center_config_options_to_yojson
    (x : update_iam_identity_center_config_options) =
  assoc_to_yojson
    [
      ( "userAttribute",
        option_to_yojson iam_identity_center_user_attribute_to_yojson x.user_attribute );
      ( "groupAttribute",
        option_to_yojson iam_identity_center_group_attribute_to_yojson x.group_attribute );
    ]

let update_index_response_to_yojson = unit_to_yojson

let update_index_request_to_yojson (x : update_index_request) =
  assoc_to_yojson
    [
      ("id", Some (collection_id_to_yojson x.id));
      ("indexName", Some (index_name_to_yojson x.index_name));
      ("indexSchema", option_to_yojson index_schema_to_yojson x.index_schema);
    ]

let update_lifecycle_policy_response_to_yojson (x : update_lifecycle_policy_response) =
  assoc_to_yojson
    [
      ( "lifecyclePolicyDetail",
        option_to_yojson lifecycle_policy_detail_to_yojson x.lifecycle_policy_detail );
    ]

let update_lifecycle_policy_request_to_yojson (x : update_lifecycle_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (lifecycle_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ("policyVersion", Some (policy_version_to_yojson x.policy_version));
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", option_to_yojson policy_document_to_yojson x.policy);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_security_config_response_to_yojson (x : update_security_config_response) =
  assoc_to_yojson
    [
      ( "securityConfigDetail",
        option_to_yojson security_config_detail_to_yojson x.security_config_detail );
    ]

let update_security_config_request_to_yojson (x : update_security_config_request) =
  assoc_to_yojson
    [
      ("id", Some (security_config_id_to_yojson x.id));
      ("configVersion", Some (policy_version_to_yojson x.config_version));
      ("description", option_to_yojson config_description_to_yojson x.description);
      ("samlOptions", option_to_yojson saml_config_options_to_yojson x.saml_options);
      ( "iamIdentityCenterOptionsUpdates",
        option_to_yojson update_iam_identity_center_config_options_to_yojson
          x.iam_identity_center_options_updates );
      ( "iamFederationOptions",
        option_to_yojson iam_federation_config_options_to_yojson x.iam_federation_options );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_security_policy_response_to_yojson (x : update_security_policy_response) =
  assoc_to_yojson
    [
      ( "securityPolicyDetail",
        option_to_yojson security_policy_detail_to_yojson x.security_policy_detail );
    ]

let update_security_policy_request_to_yojson (x : update_security_policy_request) =
  assoc_to_yojson
    [
      ("type", Some (security_policy_type_to_yojson x.type_));
      ("name", Some (policy_name_to_yojson x.name));
      ("policyVersion", Some (policy_version_to_yojson x.policy_version));
      ("description", option_to_yojson policy_description_to_yojson x.description);
      ("policy", option_to_yojson policy_document_to_yojson x.policy);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
