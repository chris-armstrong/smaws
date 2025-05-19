open Types
module CreateAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_policy_request ->
        (create_access_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a data access policy for OpenSearch Serverless. Access policies limit access to collections and the resources within them, and allow a user to access that data irrespective of the access mechanism or network source. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module CreateCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_collection_request ->
        (create_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `OcuLimitExceededException of ocu_limit_exceeded_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a new OpenSearch Serverless collection. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n"]
module CreateSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_config_request ->
        (create_security_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Specifies a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}. \n"]
module CreateVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_endpoint_request ->
        (create_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an OpenSearch Serverless-managed interface VPC endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module DeleteAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_policy_request ->
        (delete_access_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module DeleteCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_collection_request ->
        (delete_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless collection. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n"]
module DeleteLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_lifecycle_policy_request ->
        (delete_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless lifecycle policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-delete}Deleting data lifecycle policies}.\n"]
module DeleteSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_config_request ->
        (delete_security_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module DeleteSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_policy_request ->
        (delete_security_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Deletes an OpenSearch Serverless security policy.\n"]
module DeleteVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_endpoint_request ->
        (delete_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module GetAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_policy_request ->
        (get_access_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module GetSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_config_request ->
        (get_security_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about an OpenSearch Serverless security configuration. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module GetSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_policy_request ->
        (get_security_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about a configured OpenSearch Serverless security policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.\n"]
module ListAccessPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_policies_request ->
        (list_access_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about a list of OpenSearch Serverless access policies.\n"]
module ListCollections :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_collections_request ->
        (list_collections_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists all OpenSearch Serverless collections. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n\n  Make sure to include an empty request body \\{\\} if you don't include any collection filters in the request.\n  \n   "]
module ListLifecyclePolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_lifecycle_policies_request ->
        (list_lifecycle_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of OpenSearch Serverless lifecycle policies. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.\n"]
module ListSecurityConfigs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_configs_request ->
        (list_security_configs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about configured OpenSearch Serverless security configurations. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module ListSecurityPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_policies_request ->
        (list_security_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns information about configured OpenSearch Serverless security policies.\n"]
module ListVpcEndpoints :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_endpoints_request ->
        (list_vpc_endpoints_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the OpenSearch Serverless-managed interface VPC endpoints associated with the current account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module BatchGetCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_collection_request ->
        (batch_get_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns attributes for one or more collections, including the collection endpoint and the OpenSearch Dashboards endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-manage.html}Creating and managing Amazon OpenSearch Serverless collections}.\n"]
module BatchGetEffectiveLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_effective_lifecycle_policy_request ->
        (batch_get_effective_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a list of successful and failed retrievals for the OpenSearch Serverless indexes. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.\n"]
module BatchGetLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_lifecycle_policy_request ->
        (batch_get_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns one or more configured OpenSearch Serverless lifecycle policies. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-list}Viewing data lifecycle policies}.\n"]
module BatchGetVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_vpc_endpoint_request ->
        (batch_get_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns attributes for one or more VPC endpoints associated with the current account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
module CreateLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_lifecycle_policy_request ->
        (create_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a lifecyle policy to be applied to OpenSearch Serverless indexes. Lifecycle policies define the number of days or hours to retain the data on an OpenSearch Serverless index. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-create}Creating data lifecycle policies}.\n"]
module CreateSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_policy_request ->
        (create_security_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a security policy to be used by one or more OpenSearch Serverless collections. Security policies provide access to a collection and its OpenSearch Dashboards endpoint from public networks or specific VPC endpoints. They also allow you to secure a collection with a KMS encryption key. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.\n"]
module GetAccountSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_account_settings_request ->
        (get_account_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns account-level settings related to OpenSearch Serverless.\n"]
module GetPoliciesStats :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_policies_stats_request ->
        (get_policies_stats_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception ]) result
end[@@ocaml.doc
     "Returns statistical information about your OpenSearch Serverless access policies, security configurations, and security policies.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the tags for an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Associates tags with an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes a tag or set of tags from an OpenSearch Serverless resource. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/tag-collection.html}Tagging Amazon OpenSearch Serverless collections}.\n"]
module UpdateAccessPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_policy_request ->
        (update_access_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html}Data access control for Amazon OpenSearch Serverless}.\n"]
module UpdateAccountSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_account_settings_request ->
        (update_account_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Update the OpenSearch Serverless settings for the current Amazon Web Services account. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing capacity limits for Amazon OpenSearch Serverless}.\n"]
module UpdateCollection :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_collection_request ->
        (update_collection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates an OpenSearch Serverless collection.\n"]
module UpdateLifecyclePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_lifecycle_policy_request ->
        (update_lifecycle_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless access policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html#serverless-lifecycle-update}Updating data lifecycle policies}.\n"]
module UpdateSecurityConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_config_request ->
        (update_security_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates a security configuration for OpenSearch Serverless. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-saml.html}SAML authentication for Amazon OpenSearch Serverless}.\n"]
module UpdateSecurityPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_policy_request ->
        (update_security_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless security policy. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html}Network access for Amazon OpenSearch Serverless} and {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html}Encryption at rest for Amazon OpenSearch Serverless}.\n"]
module UpdateVpcEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_endpoint_request ->
        (update_vpc_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]