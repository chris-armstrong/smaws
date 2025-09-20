open Smaws_Lib.Json.DeserializeHelpers
open Types

let saml_user_attribute_of_yojson = string_of_yojson
let saml_metadata_of_yojson = string_of_yojson
let saml_group_attribute_of_yojson = string_of_yojson
let open_search_serverless_entity_id_of_yojson = string_of_yojson
let vpc_id_of_yojson = string_of_yojson
let vpc_endpoint_id_of_yojson = string_of_yojson
let vpc_endpoint_name_of_yojson = string_of_yojson

let vpc_endpoint_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VpcEndpointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VpcEndpointStatus")
     : vpc_endpoint_status)
    : vpc_endpoint_status)

let vpc_endpoint_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key vpc_endpoint_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key vpc_endpoint_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "id") _list path;
   }
    : vpc_endpoint_summary)

let vpc_endpoint_summaries_of_yojson tree path =
  list_of_yojson vpc_endpoint_summary_of_yojson tree path

let vpc_endpoint_ids_of_yojson tree path = list_of_yojson vpc_endpoint_id_of_yojson tree path

let vpc_endpoint_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key vpc_endpoint_status_of_yojson "status") _list path }
    : vpc_endpoint_filters)

let vpc_endpoint_error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     id = option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "id") _list path;
   }
    : vpc_endpoint_error_detail)

let vpc_endpoint_error_details_of_yojson tree path =
  list_of_yojson vpc_endpoint_error_detail_of_yojson tree path

let subnet_id_of_yojson = string_of_yojson
let subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path
let security_group_id_of_yojson = string_of_yojson
let security_group_ids_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path

let vpc_endpoint_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     failure_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureCode")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     status = option_of_yojson (value_for_key vpc_endpoint_status_of_yojson "status") _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "securityGroupIds") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "subnetIds") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "vpcId") _list path;
     name = option_of_yojson (value_for_key vpc_endpoint_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "id") _list path;
   }
    : vpc_endpoint_detail)

let vpc_endpoint_details_of_yojson tree path =
  list_of_yojson vpc_endpoint_detail_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : validation_exception)

let update_vpc_endpoint_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "securityGroupIds") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "subnetIds") _list path;
     status = option_of_yojson (value_for_key vpc_endpoint_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key vpc_endpoint_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "id") _list path;
   }
    : update_vpc_endpoint_detail)

let update_vpc_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_vpc_endpoint_detail =
       option_of_yojson
         (value_for_key update_vpc_endpoint_detail_of_yojson "UpdateVpcEndpointDetail")
         _list path;
   }
    : update_vpc_endpoint_response)

let client_token_of_yojson = string_of_yojson

let update_vpc_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     remove_security_group_ids =
       option_of_yojson
         (value_for_key security_group_ids_of_yojson "removeSecurityGroupIds")
         _list path;
     add_security_group_ids =
       option_of_yojson
         (value_for_key security_group_ids_of_yojson "addSecurityGroupIds")
         _list path;
     remove_subnet_ids =
       option_of_yojson (value_for_key subnet_ids_of_yojson "removeSubnetIds") _list path;
     add_subnet_ids =
       option_of_yojson (value_for_key subnet_ids_of_yojson "addSubnetIds") _list path;
     id = value_for_key vpc_endpoint_id_of_yojson "id" _list path;
   }
    : update_vpc_endpoint_request)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : conflict_exception)

let security_policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "encryption" -> Encryption
    | `String "network" -> Network
    | `String value -> raise (deserialize_unknown_enum_value_error path "SecurityPolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityPolicyType")
     : security_policy_type)
    : security_policy_type)

let policy_name_of_yojson = string_of_yojson
let policy_version_of_yojson = string_of_yojson
let policy_description_of_yojson = string_of_yojson

let security_policy_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     policy =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson "policy")
         _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version =
       option_of_yojson (value_for_key policy_version_of_yojson "policyVersion") _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key security_policy_type_of_yojson "type") _list path;
   }
    : security_policy_detail)

let update_security_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_policy_detail =
       option_of_yojson
         (value_for_key security_policy_detail_of_yojson "securityPolicyDetail")
         _list path;
   }
    : update_security_policy_response)

let policy_document_of_yojson = string_of_yojson

let update_security_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     policy = option_of_yojson (value_for_key policy_document_of_yojson "policy") _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version = value_for_key policy_version_of_yojson "policyVersion" _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key security_policy_type_of_yojson "type" _list path;
   }
    : update_security_policy_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode")
         _list path;
     service_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode" _list
         path;
     resource_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType")
         _list path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : resource_not_found_exception)

let security_config_id_of_yojson = string_of_yojson

let security_config_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "saml" -> Saml
    | `String "iamidentitycenter" -> Iamidentitycenter
    | `String value -> raise (deserialize_unknown_enum_value_error path "SecurityConfigType" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityConfigType")
     : security_config_type)
    : security_config_type)

let config_description_of_yojson = string_of_yojson

let saml_config_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_timeout =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "sessionTimeout")
         _list path;
     open_search_serverless_entity_id =
       option_of_yojson
         (value_for_key open_search_serverless_entity_id_of_yojson "openSearchServerlessEntityId")
         _list path;
     group_attribute =
       option_of_yojson (value_for_key saml_group_attribute_of_yojson "groupAttribute") _list path;
     user_attribute =
       option_of_yojson (value_for_key saml_user_attribute_of_yojson "userAttribute") _list path;
     metadata = value_for_key saml_metadata_of_yojson "metadata" _list path;
   }
    : saml_config_options)

let iam_identity_center_instance_arn_of_yojson = string_of_yojson
let iam_identity_center_application_arn_of_yojson = string_of_yojson

let iam_identity_center_user_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "UserId" -> UserId
    | `String "UserName" -> UserName
    | `String "Email" -> Email
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IamIdentityCenterUserAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IamIdentityCenterUserAttribute")
     : iam_identity_center_user_attribute)
    : iam_identity_center_user_attribute)

let iam_identity_center_group_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "GroupId" -> GroupId
    | `String "GroupName" -> GroupName
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IamIdentityCenterGroupAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "IamIdentityCenterGroupAttribute")
     : iam_identity_center_group_attribute)
    : iam_identity_center_group_attribute)

let iam_identity_center_config_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_attribute =
       option_of_yojson
         (value_for_key iam_identity_center_group_attribute_of_yojson "groupAttribute")
         _list path;
     user_attribute =
       option_of_yojson
         (value_for_key iam_identity_center_user_attribute_of_yojson "userAttribute")
         _list path;
     application_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "applicationDescription")
         _list path;
     application_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "applicationName")
         _list path;
     application_arn =
       option_of_yojson
         (value_for_key iam_identity_center_application_arn_of_yojson "applicationArn")
         _list path;
     instance_arn =
       option_of_yojson
         (value_for_key iam_identity_center_instance_arn_of_yojson "instanceArn")
         _list path;
   }
    : iam_identity_center_config_options)

let security_config_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     iam_identity_center_options =
       option_of_yojson
         (value_for_key iam_identity_center_config_options_of_yojson "iamIdentityCenterOptions")
         _list path;
     saml_options =
       option_of_yojson (value_for_key saml_config_options_of_yojson "samlOptions") _list path;
     description =
       option_of_yojson (value_for_key config_description_of_yojson "description") _list path;
     config_version =
       option_of_yojson (value_for_key policy_version_of_yojson "configVersion") _list path;
     type_ = option_of_yojson (value_for_key security_config_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key security_config_id_of_yojson "id") _list path;
   }
    : security_config_detail)

let update_security_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_config_detail =
       option_of_yojson
         (value_for_key security_config_detail_of_yojson "securityConfigDetail")
         _list path;
   }
    : update_security_config_response)

let update_iam_identity_center_config_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_attribute =
       option_of_yojson
         (value_for_key iam_identity_center_group_attribute_of_yojson "groupAttribute")
         _list path;
     user_attribute =
       option_of_yojson
         (value_for_key iam_identity_center_user_attribute_of_yojson "userAttribute")
         _list path;
   }
    : update_iam_identity_center_config_options)

let update_security_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     iam_identity_center_options_updates =
       option_of_yojson
         (value_for_key update_iam_identity_center_config_options_of_yojson
            "iamIdentityCenterOptionsUpdates")
         _list path;
     saml_options =
       option_of_yojson (value_for_key saml_config_options_of_yojson "samlOptions") _list path;
     description =
       option_of_yojson (value_for_key config_description_of_yojson "description") _list path;
     config_version = value_for_key policy_version_of_yojson "configVersion" _list path;
     id = value_for_key security_config_id_of_yojson "id" _list path;
   }
    : update_security_config_request)

let lifecycle_policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "retention" -> Retention
    | `String value -> raise (deserialize_unknown_enum_value_error path "LifecyclePolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "LifecyclePolicyType")
     : lifecycle_policy_type)
    : lifecycle_policy_type)

let lifecycle_policy_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     policy =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson "policy")
         _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version =
       option_of_yojson (value_for_key policy_version_of_yojson "policyVersion") _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key lifecycle_policy_type_of_yojson "type") _list path;
   }
    : lifecycle_policy_detail)

let update_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle_policy_detail =
       option_of_yojson
         (value_for_key lifecycle_policy_detail_of_yojson "lifecyclePolicyDetail")
         _list path;
   }
    : update_lifecycle_policy_response)

let update_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     policy = option_of_yojson (value_for_key policy_document_of_yojson "policy") _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version = value_for_key policy_version_of_yojson "policyVersion" _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key lifecycle_policy_type_of_yojson "type" _list path;
   }
    : update_lifecycle_policy_request)

let collection_id_of_yojson = string_of_yojson
let collection_name_of_yojson = string_of_yojson

let collection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CollectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CollectionStatus")
     : collection_status)
    : collection_status)

let collection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SEARCH" -> SEARCH
    | `String "TIMESERIES" -> TIMESERIES
    | `String "VECTORSEARCH" -> VECTORSEARCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "CollectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "CollectionType")
     : collection_type)
    : collection_type)

let update_collection_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     type_ = option_of_yojson (value_for_key collection_type_of_yojson "type") _list path;
     status = option_of_yojson (value_for_key collection_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key collection_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key collection_id_of_yojson "id") _list path;
   }
    : update_collection_detail)

let update_collection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_collection_detail =
       option_of_yojson
         (value_for_key update_collection_detail_of_yojson "updateCollectionDetail")
         _list path;
   }
    : update_collection_response)

let update_collection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     id = value_for_key collection_id_of_yojson "id" _list path;
   }
    : update_collection_request)

let indexing_capacity_value_of_yojson = int_of_yojson
let search_capacity_value_of_yojson = int_of_yojson

let capacity_limits_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_search_capacity_in_oc_u =
       option_of_yojson
         (value_for_key search_capacity_value_of_yojson "maxSearchCapacityInOCU")
         _list path;
     max_indexing_capacity_in_oc_u =
       option_of_yojson
         (value_for_key indexing_capacity_value_of_yojson "maxIndexingCapacityInOCU")
         _list path;
   }
    : capacity_limits)

let account_settings_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_limits =
       option_of_yojson (value_for_key capacity_limits_of_yojson "capacityLimits") _list path;
   }
    : account_settings_detail)

let update_account_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_settings_detail =
       option_of_yojson
         (value_for_key account_settings_detail_of_yojson "accountSettingsDetail")
         _list path;
   }
    : update_account_settings_response)

let update_account_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_limits =
       option_of_yojson (value_for_key capacity_limits_of_yojson "capacityLimits") _list path;
   }
    : update_account_settings_request)

let access_policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "data" -> Data
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessPolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessPolicyType")
     : access_policy_type)
    : access_policy_type)

let access_policy_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     policy =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson "policy")
         _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version =
       option_of_yojson (value_for_key policy_version_of_yojson "policyVersion") _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key access_policy_type_of_yojson "type") _list path;
   }
    : access_policy_detail)

let update_access_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_policy_detail =
       option_of_yojson
         (value_for_key access_policy_detail_of_yojson "accessPolicyDetail")
         _list path;
   }
    : update_access_policy_response)

let update_access_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     policy = option_of_yojson (value_for_key policy_document_of_yojson "policy") _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version = value_for_key policy_version_of_yojson "policyVersion" _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key access_policy_type_of_yojson "type" _list path;
   }
    : update_access_policy_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_keys_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "value" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "tags" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let standby_replicas_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StandbyReplicas" value)
    | _ -> raise (deserialize_wrong_type_error path "StandbyReplicas")
     : standby_replicas)
    : standby_replicas)

let security_policy_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version =
       option_of_yojson (value_for_key policy_version_of_yojson "policyVersion") _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key security_policy_type_of_yojson "type") _list path;
   }
    : security_policy_summary)

let security_policy_summaries_of_yojson tree path =
  list_of_yojson security_policy_summary_of_yojson tree path

let security_policy_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_policy_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "NetworkPolicyCount")
         _list path;
     encryption_policy_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "EncryptionPolicyCount")
         _list path;
   }
    : security_policy_stats)

let security_config_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     description =
       option_of_yojson (value_for_key config_description_of_yojson "description") _list path;
     config_version =
       option_of_yojson (value_for_key policy_version_of_yojson "configVersion") _list path;
     type_ = option_of_yojson (value_for_key security_config_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key security_config_id_of_yojson "id") _list path;
   }
    : security_config_summary)

let security_config_summaries_of_yojson tree path =
  list_of_yojson security_config_summary_of_yojson tree path

let security_config_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     saml_config_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "SamlConfigCount")
         _list path;
   }
    : security_config_stats)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "index" -> Index
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_name_of_yojson = string_of_yojson
let resource_of_yojson = string_of_yojson
let resource_filter_of_yojson tree path = list_of_yojson resource_of_yojson tree path

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let access_policy_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_policy_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "DataPolicyCount")
         _list path;
   }
    : access_policy_stats)

let lifecycle_policy_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_policy_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "RetentionPolicyCount")
         _list path;
   }
    : lifecycle_policy_stats)

let get_policies_stats_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_policy_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "TotalPolicyCount")
         _list path;
     lifecycle_policy_stats =
       option_of_yojson
         (value_for_key lifecycle_policy_stats_of_yojson "LifecyclePolicyStats")
         _list path;
     security_config_stats =
       option_of_yojson
         (value_for_key security_config_stats_of_yojson "SecurityConfigStats")
         _list path;
     security_policy_stats =
       option_of_yojson
         (value_for_key security_policy_stats_of_yojson "SecurityPolicyStats")
         _list path;
     access_policy_stats =
       option_of_yojson (value_for_key access_policy_stats_of_yojson "AccessPolicyStats") _list path;
   }
    : get_policies_stats_response)

let get_policies_stats_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_account_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_settings_detail =
       option_of_yojson
         (value_for_key account_settings_detail_of_yojson "accountSettingsDetail")
         _list path;
   }
    : get_account_settings_response)

let get_account_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_security_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_policy_detail =
       option_of_yojson
         (value_for_key security_policy_detail_of_yojson "securityPolicyDetail")
         _list path;
   }
    : create_security_policy_response)

let create_security_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     policy = value_for_key policy_document_of_yojson "policy" _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key security_policy_type_of_yojson "type" _list path;
   }
    : create_security_policy_request)

let create_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle_policy_detail =
       option_of_yojson
         (value_for_key lifecycle_policy_detail_of_yojson "lifecyclePolicyDetail")
         _list path;
   }
    : create_lifecycle_policy_response)

let create_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     policy = value_for_key policy_document_of_yojson "policy" _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key lifecycle_policy_type_of_yojson "type" _list path;
   }
    : create_lifecycle_policy_request)

let batch_get_vpc_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_error_details =
       option_of_yojson
         (value_for_key vpc_endpoint_error_details_of_yojson "vpcEndpointErrorDetails")
         _list path;
     vpc_endpoint_details =
       option_of_yojson
         (value_for_key vpc_endpoint_details_of_yojson "vpcEndpointDetails")
         _list path;
   }
    : batch_get_vpc_endpoint_response)

let batch_get_vpc_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ids = value_for_key vpc_endpoint_ids_of_yojson "ids" _list path }
    : batch_get_vpc_endpoint_request)

let lifecycle_policy_details_of_yojson tree path =
  list_of_yojson lifecycle_policy_detail_of_yojson tree path

let lifecycle_policy_error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key lifecycle_policy_type_of_yojson "type") _list path;
   }
    : lifecycle_policy_error_detail)

let lifecycle_policy_error_details_of_yojson tree path =
  list_of_yojson lifecycle_policy_error_detail_of_yojson tree path

let batch_get_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle_policy_error_details =
       option_of_yojson
         (value_for_key lifecycle_policy_error_details_of_yojson "lifecyclePolicyErrorDetails")
         _list path;
     lifecycle_policy_details =
       option_of_yojson
         (value_for_key lifecycle_policy_details_of_yojson "lifecyclePolicyDetails")
         _list path;
   }
    : batch_get_lifecycle_policy_response)

let lifecycle_policy_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key lifecycle_policy_type_of_yojson "type" _list path;
   }
    : lifecycle_policy_identifier)

let lifecycle_policy_identifiers_of_yojson tree path =
  list_of_yojson lifecycle_policy_identifier_of_yojson tree path

let batch_get_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifiers = value_for_key lifecycle_policy_identifiers_of_yojson "identifiers" _list path }
    : batch_get_lifecycle_policy_request)

let effective_lifecycle_policy_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     no_min_retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "noMinRetentionPeriod")
         _list path;
     retention_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "retentionPeriod")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     policy_name = option_of_yojson (value_for_key policy_name_of_yojson "policyName") _list path;
     resource = option_of_yojson (value_for_key resource_of_yojson "resource") _list path;
     type_ = option_of_yojson (value_for_key lifecycle_policy_type_of_yojson "type") _list path;
   }
    : effective_lifecycle_policy_detail)

let effective_lifecycle_policy_details_of_yojson tree path =
  list_of_yojson effective_lifecycle_policy_detail_of_yojson tree path

let effective_lifecycle_policy_error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     resource = option_of_yojson (value_for_key resource_of_yojson "resource") _list path;
     type_ = option_of_yojson (value_for_key lifecycle_policy_type_of_yojson "type") _list path;
   }
    : effective_lifecycle_policy_error_detail)

let effective_lifecycle_policy_error_details_of_yojson tree path =
  list_of_yojson effective_lifecycle_policy_error_detail_of_yojson tree path

let batch_get_effective_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     effective_lifecycle_policy_error_details =
       option_of_yojson
         (value_for_key effective_lifecycle_policy_error_details_of_yojson
            "effectiveLifecyclePolicyErrorDetails")
         _list path;
     effective_lifecycle_policy_details =
       option_of_yojson
         (value_for_key effective_lifecycle_policy_details_of_yojson
            "effectiveLifecyclePolicyDetails")
         _list path;
   }
    : batch_get_effective_lifecycle_policy_response)

let lifecycle_policy_resource_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource = value_for_key resource_name_of_yojson "resource" _list path;
     type_ = value_for_key lifecycle_policy_type_of_yojson "type" _list path;
   }
    : lifecycle_policy_resource_identifier)

let lifecycle_policy_resource_identifiers_of_yojson tree path =
  list_of_yojson lifecycle_policy_resource_identifier_of_yojson tree path

let batch_get_effective_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifiers =
       value_for_key lifecycle_policy_resource_identifiers_of_yojson "resourceIdentifiers" _list
         path;
   }
    : batch_get_effective_lifecycle_policy_request)

let collection_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     failure_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureCode")
         _list path;
     dashboard_endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "dashboardEndpoint")
         _list path;
     collection_endpoint =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "collectionEndpoint")
         _list path;
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     standby_replicas =
       option_of_yojson (value_for_key standby_replicas_of_yojson "standbyReplicas") _list path;
     kms_key_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyArn")
         _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     type_ = option_of_yojson (value_for_key collection_type_of_yojson "type") _list path;
     status = option_of_yojson (value_for_key collection_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key collection_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key collection_id_of_yojson "id") _list path;
   }
    : collection_detail)

let collection_details_of_yojson tree path = list_of_yojson collection_detail_of_yojson tree path

let collection_error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     name = option_of_yojson (value_for_key collection_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key collection_id_of_yojson "id") _list path;
   }
    : collection_error_detail)

let collection_error_details_of_yojson tree path =
  list_of_yojson collection_error_detail_of_yojson tree path

let batch_get_collection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     collection_error_details =
       option_of_yojson
         (value_for_key collection_error_details_of_yojson "collectionErrorDetails")
         _list path;
     collection_details =
       option_of_yojson (value_for_key collection_details_of_yojson "collectionDetails") _list path;
   }
    : batch_get_collection_response)

let collection_ids_of_yojson tree path = list_of_yojson collection_id_of_yojson tree path
let collection_names_of_yojson tree path = list_of_yojson collection_name_of_yojson tree path

let batch_get_collection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     names = option_of_yojson (value_for_key collection_names_of_yojson "names") _list path;
     ids = option_of_yojson (value_for_key collection_ids_of_yojson "ids") _list path;
   }
    : batch_get_collection_request)

let ocu_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : ocu_limit_exceeded_exception)

let list_vpc_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     vpc_endpoint_summaries =
       option_of_yojson
         (value_for_key vpc_endpoint_summaries_of_yojson "vpcEndpointSummaries")
         _list path;
   }
    : list_vpc_endpoints_response)

let list_vpc_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     vpc_endpoint_filters =
       option_of_yojson
         (value_for_key vpc_endpoint_filters_of_yojson "vpcEndpointFilters")
         _list path;
   }
    : list_vpc_endpoints_request)

let list_security_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     security_policy_summaries =
       option_of_yojson
         (value_for_key security_policy_summaries_of_yojson "securityPolicySummaries")
         _list path;
   }
    : list_security_policies_response)

let list_security_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     resource = option_of_yojson (value_for_key resource_filter_of_yojson "resource") _list path;
     type_ = value_for_key security_policy_type_of_yojson "type" _list path;
   }
    : list_security_policies_request)

let list_security_configs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     security_config_summaries =
       option_of_yojson
         (value_for_key security_config_summaries_of_yojson "securityConfigSummaries")
         _list path;
   }
    : list_security_configs_response)

let list_security_configs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     type_ = value_for_key security_config_type_of_yojson "type" _list path;
   }
    : list_security_configs_request)

let lifecycle_policy_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version =
       option_of_yojson (value_for_key policy_version_of_yojson "policyVersion") _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key lifecycle_policy_type_of_yojson "type") _list path;
   }
    : lifecycle_policy_summary)

let lifecycle_policy_summaries_of_yojson tree path =
  list_of_yojson lifecycle_policy_summary_of_yojson tree path

let list_lifecycle_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     lifecycle_policy_summaries =
       option_of_yojson
         (value_for_key lifecycle_policy_summaries_of_yojson "lifecyclePolicySummaries")
         _list path;
   }
    : list_lifecycle_policies_response)

let lifecycle_resource_of_yojson = string_of_yojson

let lifecycle_resource_filter_of_yojson tree path =
  list_of_yojson lifecycle_resource_of_yojson tree path

let list_lifecycle_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     resources =
       option_of_yojson (value_for_key lifecycle_resource_filter_of_yojson "resources") _list path;
     type_ = value_for_key lifecycle_policy_type_of_yojson "type" _list path;
   }
    : list_lifecycle_policies_request)

let collection_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn")
         _list path;
     status = option_of_yojson (value_for_key collection_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key collection_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key collection_id_of_yojson "id") _list path;
   }
    : collection_summary)

let collection_summaries_of_yojson tree path = list_of_yojson collection_summary_of_yojson tree path

let list_collections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     collection_summaries =
       option_of_yojson
         (value_for_key collection_summaries_of_yojson "collectionSummaries")
         _list path;
   }
    : list_collections_response)

let collection_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key collection_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key collection_name_of_yojson "name") _list path;
   }
    : collection_filters)

let list_collections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     collection_filters =
       option_of_yojson (value_for_key collection_filters_of_yojson "collectionFilters") _list path;
   }
    : list_collections_request)

let access_policy_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     policy_version =
       option_of_yojson (value_for_key policy_version_of_yojson "policyVersion") _list path;
     name = option_of_yojson (value_for_key policy_name_of_yojson "name") _list path;
     type_ = option_of_yojson (value_for_key access_policy_type_of_yojson "type") _list path;
   }
    : access_policy_summary)

let access_policy_summaries_of_yojson tree path =
  list_of_yojson access_policy_summary_of_yojson tree path

let list_access_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     access_policy_summaries =
       option_of_yojson
         (value_for_key access_policy_summaries_of_yojson "accessPolicySummaries")
         _list path;
   }
    : list_access_policies_response)

let list_access_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     resource = option_of_yojson (value_for_key resource_filter_of_yojson "resource") _list path;
     type_ = value_for_key access_policy_type_of_yojson "type" _list path;
   }
    : list_access_policies_request)

let get_security_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_policy_detail =
       option_of_yojson
         (value_for_key security_policy_detail_of_yojson "securityPolicyDetail")
         _list path;
   }
    : get_security_policy_response)

let get_security_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key security_policy_type_of_yojson "type" _list path;
   }
    : get_security_policy_request)

let get_security_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_config_detail =
       option_of_yojson
         (value_for_key security_config_detail_of_yojson "securityConfigDetail")
         _list path;
   }
    : get_security_config_response)

let get_security_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key security_config_id_of_yojson "id" _list path }
    : get_security_config_request)

let get_access_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_policy_detail =
       option_of_yojson
         (value_for_key access_policy_detail_of_yojson "accessPolicyDetail")
         _list path;
   }
    : get_access_policy_response)

let get_access_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key access_policy_type_of_yojson "type" _list path;
   }
    : get_access_policy_request)

let delete_vpc_endpoint_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key vpc_endpoint_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key vpc_endpoint_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "id") _list path;
   }
    : delete_vpc_endpoint_detail)

let delete_vpc_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_vpc_endpoint_detail =
       option_of_yojson
         (value_for_key delete_vpc_endpoint_detail_of_yojson "deleteVpcEndpointDetail")
         _list path;
   }
    : delete_vpc_endpoint_response)

let delete_vpc_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     id = value_for_key vpc_endpoint_id_of_yojson "id" _list path;
   }
    : delete_vpc_endpoint_request)

let delete_security_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_security_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key security_policy_type_of_yojson "type" _list path;
   }
    : delete_security_policy_request)

let delete_security_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_security_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     id = value_for_key security_config_id_of_yojson "id" _list path;
   }
    : delete_security_config_request)

let delete_lifecycle_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_lifecycle_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key lifecycle_policy_type_of_yojson "type" _list path;
   }
    : delete_lifecycle_policy_request)

let delete_collection_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key collection_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key collection_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key collection_id_of_yojson "id") _list path;
   }
    : delete_collection_detail)

let delete_collection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_collection_detail =
       option_of_yojson
         (value_for_key delete_collection_detail_of_yojson "deleteCollectionDetail")
         _list path;
   }
    : delete_collection_response)

let delete_collection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     id = value_for_key collection_id_of_yojson "id" _list path;
   }
    : delete_collection_request)

let delete_access_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_access_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key access_policy_type_of_yojson "type" _list path;
   }
    : delete_access_policy_request)

let create_vpc_endpoint_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key vpc_endpoint_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key vpc_endpoint_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "id") _list path;
   }
    : create_vpc_endpoint_detail)

let create_vpc_endpoint_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_vpc_endpoint_detail =
       option_of_yojson
         (value_for_key create_vpc_endpoint_detail_of_yojson "createVpcEndpointDetail")
         _list path;
   }
    : create_vpc_endpoint_response)

let create_vpc_endpoint_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "securityGroupIds") _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "subnetIds" _list path;
     vpc_id = value_for_key vpc_id_of_yojson "vpcId" _list path;
     name = value_for_key vpc_endpoint_name_of_yojson "name" _list path;
   }
    : create_vpc_endpoint_request)

let create_security_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_config_detail =
       option_of_yojson
         (value_for_key security_config_detail_of_yojson "securityConfigDetail")
         _list path;
   }
    : create_security_config_response)

let config_name_of_yojson = string_of_yojson

let create_iam_identity_center_config_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_attribute =
       option_of_yojson
         (value_for_key iam_identity_center_group_attribute_of_yojson "groupAttribute")
         _list path;
     user_attribute =
       option_of_yojson
         (value_for_key iam_identity_center_user_attribute_of_yojson "userAttribute")
         _list path;
     instance_arn =
       value_for_key iam_identity_center_instance_arn_of_yojson "instanceArn" _list path;
   }
    : create_iam_identity_center_config_options)

let create_security_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     iam_identity_center_options =
       option_of_yojson
         (value_for_key create_iam_identity_center_config_options_of_yojson
            "iamIdentityCenterOptions")
         _list path;
     saml_options =
       option_of_yojson (value_for_key saml_config_options_of_yojson "samlOptions") _list path;
     description =
       option_of_yojson (value_for_key config_description_of_yojson "description") _list path;
     name = value_for_key config_name_of_yojson "name" _list path;
     type_ = value_for_key security_config_type_of_yojson "type" _list path;
   }
    : create_security_config_request)

let create_collection_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "lastModifiedDate")
         _list path;
     created_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "createdDate")
         _list path;
     standby_replicas =
       option_of_yojson (value_for_key standby_replicas_of_yojson "standbyReplicas") _list path;
     kms_key_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "kmsKeyArn")
         _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "arn")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     type_ = option_of_yojson (value_for_key collection_type_of_yojson "type") _list path;
     status = option_of_yojson (value_for_key collection_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key collection_name_of_yojson "name") _list path;
     id = option_of_yojson (value_for_key collection_id_of_yojson "id") _list path;
   }
    : create_collection_detail)

let create_collection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_collection_detail =
       option_of_yojson
         (value_for_key create_collection_detail_of_yojson "createCollectionDetail")
         _list path;
   }
    : create_collection_response)

let create_collection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     standby_replicas =
       option_of_yojson (value_for_key standby_replicas_of_yojson "standbyReplicas") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     type_ = option_of_yojson (value_for_key collection_type_of_yojson "type") _list path;
     name = value_for_key collection_name_of_yojson "name" _list path;
   }
    : create_collection_request)

let create_access_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_policy_detail =
       option_of_yojson
         (value_for_key access_policy_detail_of_yojson "accessPolicyDetail")
         _list path;
   }
    : create_access_policy_response)

let create_access_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     policy = value_for_key policy_document_of_yojson "policy" _list path;
     description =
       option_of_yojson (value_for_key policy_description_of_yojson "description") _list path;
     name = value_for_key policy_name_of_yojson "name" _list path;
     type_ = value_for_key access_policy_type_of_yojson "type" _list path;
   }
    : create_access_policy_request)
