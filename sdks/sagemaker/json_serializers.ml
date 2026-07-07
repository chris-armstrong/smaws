open Smaws_Lib.Json.SerializeHelpers
open Types

let workteam_name_to_yojson = string_to_yojson
let cognito_user_pool_to_yojson = string_to_yojson
let cognito_user_group_to_yojson = string_to_yojson
let client_id_to_yojson = string_to_yojson

let cognito_member_definition_to_yojson (x : cognito_member_definition) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_to_yojson x.client_id));
      ("UserGroup", Some (cognito_user_group_to_yojson x.user_group));
      ("UserPool", Some (cognito_user_pool_to_yojson x.user_pool));
    ]

let group_to_yojson = string_to_yojson
let groups_to_yojson tree = list_to_yojson group_to_yojson tree

let oidc_member_definition_to_yojson (x : oidc_member_definition) =
  assoc_to_yojson [ ("Groups", option_to_yojson groups_to_yojson x.groups) ]

let member_definition_to_yojson (x : member_definition) =
  assoc_to_yojson
    [
      ( "OidcMemberDefinition",
        option_to_yojson oidc_member_definition_to_yojson x.oidc_member_definition );
      ( "CognitoMemberDefinition",
        option_to_yojson cognito_member_definition_to_yojson x.cognito_member_definition );
    ]

let member_definitions_to_yojson tree = list_to_yojson member_definition_to_yojson tree
let workteam_arn_to_yojson = string_to_yojson
let workforce_arn_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let product_listings_to_yojson tree = list_to_yojson string__to_yojson tree
let string200_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let notification_topic_arn_to_yojson = string_to_yojson

let notification_configuration_to_yojson (x : notification_configuration) =
  assoc_to_yojson
    [
      ( "NotificationTopicArn",
        option_to_yojson notification_topic_arn_to_yojson x.notification_topic_arn );
    ]

let enabled_or_disabled_to_yojson (x : enabled_or_disabled) =
  match x with Disabled -> `String "Disabled" | Enabled -> `String "Enabled"

let iam_policy_constraints_to_yojson (x : iam_policy_constraints) =
  assoc_to_yojson
    [
      ("VpcSourceIp", option_to_yojson enabled_or_disabled_to_yojson x.vpc_source_ip);
      ("SourceIp", option_to_yojson enabled_or_disabled_to_yojson x.source_ip);
    ]

let s3_presign_to_yojson (x : s3_presign) =
  assoc_to_yojson
    [
      ( "IamPolicyConstraints",
        option_to_yojson iam_policy_constraints_to_yojson x.iam_policy_constraints );
    ]

let worker_access_configuration_to_yojson (x : worker_access_configuration) =
  assoc_to_yojson [ ("S3Presign", option_to_yojson s3_presign_to_yojson x.s3_presign) ]

let workteam_to_yojson (x : workteam) =
  assoc_to_yojson
    [
      ( "WorkerAccessConfiguration",
        option_to_yojson worker_access_configuration_to_yojson x.worker_access_configuration );
      ( "NotificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ("SubDomain", option_to_yojson string__to_yojson x.sub_domain);
      ("Description", Some (string200_to_yojson x.description));
      ("ProductListingIds", option_to_yojson product_listings_to_yojson x.product_listing_ids);
      ("WorkforceArn", option_to_yojson workforce_arn_to_yojson x.workforce_arn);
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ("MemberDefinitions", Some (member_definitions_to_yojson x.member_definitions));
      ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name));
    ]

let workteams_to_yojson tree = list_to_yojson workteam_to_yojson tree
let s3_uri_to_yojson = string_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let workspace_settings_to_yojson (x : workspace_settings) =
  assoc_to_yojson
    [
      ("S3KmsKeyId", option_to_yojson kms_key_id_to_yojson x.s3_kms_key_id);
      ("S3ArtifactPath", option_to_yojson s3_uri_to_yojson x.s3_artifact_path);
    ]

let workload_spec_to_yojson (x : workload_spec) =
  match x with Inline arg -> assoc_to_yojson [ ("Inline", Some (string__to_yojson arg)) ]

let workforce_name_to_yojson = string_to_yojson
let cidr_to_yojson = string_to_yojson
let cidrs_to_yojson tree = list_to_yojson cidr_to_yojson tree

let source_ip_config_to_yojson (x : source_ip_config) =
  assoc_to_yojson [ ("Cidrs", Some (cidrs_to_yojson x.cidrs)) ]

let cognito_config_to_yojson (x : cognito_config) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_to_yojson x.client_id));
      ("UserPool", Some (cognito_user_pool_to_yojson x.user_pool));
    ]

let oidc_endpoint_to_yojson = string_to_yojson
let scope_to_yojson = string_to_yojson
let authentication_request_extra_params_value_to_yojson = string_to_yojson
let authentication_request_extra_params_key_to_yojson = string_to_yojson

let authentication_request_extra_params_to_yojson tree =
  map_to_yojson authentication_request_extra_params_key_to_yojson
    authentication_request_extra_params_value_to_yojson tree

let oidc_config_for_response_to_yojson (x : oidc_config_for_response) =
  assoc_to_yojson
    [
      ( "AuthenticationRequestExtraParams",
        option_to_yojson authentication_request_extra_params_to_yojson
          x.authentication_request_extra_params );
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ("JwksUri", option_to_yojson oidc_endpoint_to_yojson x.jwks_uri);
      ("LogoutEndpoint", option_to_yojson oidc_endpoint_to_yojson x.logout_endpoint);
      ("UserInfoEndpoint", option_to_yojson oidc_endpoint_to_yojson x.user_info_endpoint);
      ("TokenEndpoint", option_to_yojson oidc_endpoint_to_yojson x.token_endpoint);
      ("AuthorizationEndpoint", option_to_yojson oidc_endpoint_to_yojson x.authorization_endpoint);
      ("Issuer", option_to_yojson oidc_endpoint_to_yojson x.issuer);
      ("ClientId", option_to_yojson client_id_to_yojson x.client_id);
    ]

let workforce_vpc_id_to_yojson = string_to_yojson
let workforce_security_group_id_to_yojson = string_to_yojson

let workforce_security_group_ids_to_yojson tree =
  list_to_yojson workforce_security_group_id_to_yojson tree

let workforce_subnet_id_to_yojson = string_to_yojson
let workforce_subnets_to_yojson tree = list_to_yojson workforce_subnet_id_to_yojson tree
let workforce_vpc_endpoint_id_to_yojson = string_to_yojson

let workforce_vpc_config_response_to_yojson (x : workforce_vpc_config_response) =
  assoc_to_yojson
    [
      ("VpcEndpointId", option_to_yojson workforce_vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("Subnets", Some (workforce_subnets_to_yojson x.subnets));
      ("SecurityGroupIds", Some (workforce_security_group_ids_to_yojson x.security_group_ids));
      ("VpcId", Some (workforce_vpc_id_to_yojson x.vpc_id));
    ]

let workforce_status_to_yojson (x : workforce_status) =
  match x with
  | ACTIVE -> `String "Active"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"
  | UPDATING -> `String "Updating"
  | INITIALIZING -> `String "Initializing"

let workforce_failure_reason_to_yojson = string_to_yojson

let workforce_ip_address_type_to_yojson (x : workforce_ip_address_type) =
  match x with Dualstack -> `String "dualstack" | Ipv4 -> `String "ipv4"

let workforce_to_yojson (x : workforce) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson workforce_ip_address_type_to_yojson x.ip_address_type);
      ("FailureReason", option_to_yojson workforce_failure_reason_to_yojson x.failure_reason);
      ("Status", option_to_yojson workforce_status_to_yojson x.status);
      ( "WorkforceVpcConfig",
        option_to_yojson workforce_vpc_config_response_to_yojson x.workforce_vpc_config );
      ("CreateDate", option_to_yojson timestamp_to_yojson x.create_date);
      ("OidcConfig", option_to_yojson oidc_config_for_response_to_yojson x.oidc_config);
      ("CognitoConfig", option_to_yojson cognito_config_to_yojson x.cognito_config);
      ("SubDomain", option_to_yojson string__to_yojson x.sub_domain);
      ("SourceIpConfig", option_to_yojson source_ip_config_to_yojson x.source_ip_config);
      ("LastUpdatedDate", option_to_yojson timestamp_to_yojson x.last_updated_date);
      ("WorkforceArn", Some (workforce_arn_to_yojson x.workforce_arn));
      ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name));
    ]

let workforces_to_yojson tree = list_to_yojson workforce_to_yojson tree

let workforce_vpc_config_request_to_yojson (x : workforce_vpc_config_request) =
  assoc_to_yojson
    [
      ("Subnets", option_to_yojson workforce_subnets_to_yojson x.subnets);
      ( "SecurityGroupIds",
        option_to_yojson workforce_security_group_ids_to_yojson x.security_group_ids );
      ("VpcId", option_to_yojson workforce_vpc_id_to_yojson x.vpc_id);
    ]

let weekly_schedule_time_format_to_yojson = string_to_yojson
let weekly_maintenance_window_start_to_yojson = string_to_yojson

let warm_pool_resource_status_to_yojson (x : warm_pool_resource_status) =
  match x with
  | INUSE -> `String "InUse"
  | REUSED -> `String "Reused"
  | TERMINATED -> `String "Terminated"
  | AVAILABLE -> `String "Available"

let resource_retained_billable_time_in_seconds_to_yojson = int_to_yojson
let training_job_name_to_yojson = string_to_yojson

let warm_pool_status_to_yojson (x : warm_pool_status) =
  assoc_to_yojson
    [
      ("ReusedByJob", option_to_yojson training_job_name_to_yojson x.reused_by_job);
      ( "ResourceRetainedBillableTimeInSeconds",
        option_to_yojson resource_retained_billable_time_in_seconds_to_yojson
          x.resource_retained_billable_time_in_seconds );
      ("Status", Some (warm_pool_resource_status_to_yojson x.status));
    ]

let wait_time_interval_in_seconds_to_yojson = int_to_yojson
let wait_interval_in_seconds_to_yojson = int_to_yojson
let security_group_id_to_yojson = string_to_yojson
let vpc_security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let account_id_to_yojson = string_to_yojson
let vpc_only_trusted_accounts_to_yojson tree = list_to_yojson account_id_to_yojson tree
let vpc_id_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let subnets_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("Subnets", Some (subnets_to_yojson x.subnets));
      ("SecurityGroupIds", Some (vpc_security_group_ids_to_yojson x.security_group_ids));
    ]

let volume_size_in_g_b_to_yojson = int_to_yojson
let volume_id_to_yojson = string_to_yojson
let volume_device_name_to_yojson = string_to_yojson

let volume_attachment_status_to_yojson (x : volume_attachment_status) =
  match x with
  | BUSY -> `String "busy"
  | DETACHED -> `String "detached"
  | DETACHING -> `String "detaching"
  | ATTACHED -> `String "attached"
  | ATTACHING -> `String "attaching"

let visibility_conditions_value_to_yojson = string_to_yojson
let visibility_conditions_key_to_yojson = string_to_yojson

let visibility_conditions_to_yojson (x : visibility_conditions) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson visibility_conditions_value_to_yojson x.value);
      ("Key", option_to_yojson visibility_conditions_key_to_yojson x.key);
    ]

let visibility_conditions_list_to_yojson tree = list_to_yojson visibility_conditions_to_yojson tree
let association_entity_arn_to_yojson = string_to_yojson
let string40_to_yojson = string_to_yojson

let lineage_type_to_yojson (x : lineage_type) =
  match x with
  | ACTION -> `String "Action"
  | CONTEXT -> `String "Context"
  | ARTIFACT -> `String "Artifact"
  | TRIAL_COMPONENT -> `String "TrialComponent"

let vertex_to_yojson (x : vertex) =
  assoc_to_yojson
    [
      ("LineageType", option_to_yojson lineage_type_to_yojson x.lineage_type);
      ("Type", option_to_yojson string40_to_yojson x.type_);
      ("Arn", option_to_yojson association_entity_arn_to_yojson x.arn);
    ]

let vertices_to_yojson tree = list_to_yojson vertex_to_yojson tree
let versioned_arn_or_name_to_yojson = string_to_yojson
let version_id_to_yojson = string_to_yojson
let image_version_alias_pattern_to_yojson = string_to_yojson
let version_aliases_list_to_yojson tree = list_to_yojson image_version_alias_pattern_to_yojson tree

let vendor_guidance_to_yojson (x : vendor_guidance) =
  match x with
  | ARCHIVED -> `String "ARCHIVED"
  | TO_BE_ARCHIVED -> `String "TO_BE_ARCHIVED"
  | STABLE -> `String "STABLE"
  | NOT_PROVIDED -> `String "NOT_PROVIDED"

let dimension_to_yojson = int_to_yojson

let vector_config_to_yojson (x : vector_config) =
  assoc_to_yojson [ ("Dimension", Some (dimension_to_yojson x.dimension)) ]

let variant_weight_to_yojson = float_to_yojson
let variant_status_message_to_yojson = string_to_yojson

let variant_status_to_yojson (x : variant_status) =
  match x with
  | BAKING -> `String "Baking"
  | ACTIVATING_TRAFFIC -> `String "ActivatingTraffic"
  | DELETING -> `String "Deleting"
  | UPDATING -> `String "Updating"
  | CREATING -> `String "Creating"

let variant_property_type_to_yojson (x : variant_property_type) =
  match x with
  | DataCaptureConfig -> `String "DataCaptureConfig"
  | DesiredWeight -> `String "DesiredWeight"
  | DesiredInstanceCount -> `String "DesiredInstanceCount"

let variant_property_to_yojson (x : variant_property) =
  assoc_to_yojson
    [ ("VariantPropertyType", Some (variant_property_type_to_yojson x.variant_property_type)) ]

let variant_property_list_to_yojson tree = list_to_yojson variant_property_to_yojson tree
let variant_name_to_yojson = string_to_yojson
let variant_instance_provision_timeout_in_seconds_to_yojson = int_to_yojson
let validation_fraction_to_yojson = float_to_yojson
let v_cpu_amount_to_yojson = float_to_yojson
let utilization_percentage_per_core_to_yojson = int_to_yojson
let utilization_metric_to_yojson = float_to_yojson
let users_per_step_to_yojson = int_to_yojson
let role_arn_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let notebook_output_option_to_yojson (x : notebook_output_option) =
  match x with Disabled -> `String "Disabled" | Allowed -> `String "Allowed"

let sharing_settings_to_yojson (x : sharing_settings) =
  assoc_to_yojson
    [
      ("S3KmsKeyId", option_to_yojson kms_key_id_to_yojson x.s3_kms_key_id);
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ( "NotebookOutputOption",
        option_to_yojson notebook_output_option_to_yojson x.notebook_output_option );
    ]

let image_arn_to_yojson = string_to_yojson
let image_version_arn_to_yojson = string_to_yojson
let image_version_alias_to_yojson = string_to_yojson

let app_instance_type_to_yojson (x : app_instance_type) =
  match x with
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_R6ID_32XLARGE -> `String "ml.r6id.32xlarge"
  | ML_R6ID_24XLARGE -> `String "ml.r6id.24xlarge"
  | ML_R6ID_16XLARGE -> `String "ml.r6id.16xlarge"
  | ML_R6ID_12XLARGE -> `String "ml.r6id.12xlarge"
  | ML_R6ID_8XLARGE -> `String "ml.r6id.8xlarge"
  | ML_R6ID_4XLARGE -> `String "ml.r6id.4xlarge"
  | ML_R6ID_2XLARGE -> `String "ml.r6id.2xlarge"
  | ML_R6ID_XLARGE -> `String "ml.r6id.xlarge"
  | ML_R6ID_LARGE -> `String "ml.r6id.large"
  | ML_C6ID_32XLARGE -> `String "ml.c6id.32xlarge"
  | ML_C6ID_24XLARGE -> `String "ml.c6id.24xlarge"
  | ML_C6ID_16XLARGE -> `String "ml.c6id.16xlarge"
  | ML_C6ID_12XLARGE -> `String "ml.c6id.12xlarge"
  | ML_C6ID_8XLARGE -> `String "ml.c6id.8xlarge"
  | ML_C6ID_4XLARGE -> `String "ml.c6id.4xlarge"
  | ML_C6ID_2XLARGE -> `String "ml.c6id.2xlarge"
  | ML_C6ID_XLARGE -> `String "ml.c6id.xlarge"
  | ML_C6ID_LARGE -> `String "ml.c6id.large"
  | ML_M6ID_32XLARGE -> `String "ml.m6id.32xlarge"
  | ML_M6ID_24XLARGE -> `String "ml.m6id.24xlarge"
  | ML_M6ID_16XLARGE -> `String "ml.m6id.16xlarge"
  | ML_M6ID_12XLARGE -> `String "ml.m6id.12xlarge"
  | ML_M6ID_8XLARGE -> `String "ml.m6id.8xlarge"
  | ML_M6ID_4XLARGE -> `String "ml.m6id.4xlarge"
  | ML_M6ID_2XLARGE -> `String "ml.m6id.2xlarge"
  | ML_M6ID_XLARGE -> `String "ml.m6id.xlarge"
  | ML_M6ID_LARGE -> `String "ml.m6id.large"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_GEOSPATIAL_INTERACTIVE -> `String "ml.geospatial.interactive"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_P3DN_24XLARGE -> `String "ml.p3dn.24xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_C5_24XLARGE -> `String "ml.c5.24xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_12XLARGE -> `String "ml.c5.12xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_LARGE -> `String "ml.c5.large"
  | ML_M5D_24XLARGE -> `String "ml.m5d.24xlarge"
  | ML_M5D_16XLARGE -> `String "ml.m5d.16xlarge"
  | ML_M5D_12XLARGE -> `String "ml.m5d.12xlarge"
  | ML_M5D_8XLARGE -> `String "ml.m5d.8xlarge"
  | ML_M5D_4XLARGE -> `String "ml.m5d.4xlarge"
  | ML_M5D_2XLARGE -> `String "ml.m5d.2xlarge"
  | ML_M5D_XLARGE -> `String "ml.m5d.xlarge"
  | ML_M5D_LARGE -> `String "ml.m5d.large"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5_16XLARGE -> `String "ml.m5.16xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_8XLARGE -> `String "ml.m5.8xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_T3_SMALL -> `String "ml.t3.small"
  | ML_T3_MICRO -> `String "ml.t3.micro"
  | SYSTEM -> `String "system"

let studio_lifecycle_config_arn_to_yojson = string_to_yojson
let studio_resource_spec_training_plan_arn_to_yojson = string_to_yojson

let resource_spec_to_yojson (x : resource_spec) =
  assoc_to_yojson
    [
      ( "TrainingPlanArn",
        option_to_yojson studio_resource_spec_training_plan_arn_to_yojson x.training_plan_arn );
      ( "LifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.lifecycle_config_arn );
      ("InstanceType", option_to_yojson app_instance_type_to_yojson x.instance_type);
      ( "SageMakerImageVersionAlias",
        option_to_yojson image_version_alias_to_yojson x.sage_maker_image_version_alias );
      ( "SageMakerImageVersionArn",
        option_to_yojson image_version_arn_to_yojson x.sage_maker_image_version_arn );
      ("SageMakerImageArn", option_to_yojson image_arn_to_yojson x.sage_maker_image_arn);
    ]

let lifecycle_config_arns_to_yojson tree = list_to_yojson studio_lifecycle_config_arn_to_yojson tree
let repository_url_to_yojson = string_to_yojson

let code_repository_to_yojson (x : code_repository) =
  assoc_to_yojson [ ("RepositoryUrl", Some (repository_url_to_yojson x.repository_url)) ]

let code_repositories_to_yojson tree = list_to_yojson code_repository_to_yojson tree

let jupyter_server_app_settings_to_yojson (x : jupyter_server_app_settings) =
  assoc_to_yojson
    [
      ("CodeRepositories", option_to_yojson code_repositories_to_yojson x.code_repositories);
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let image_name_to_yojson = string_to_yojson
let image_version_number_to_yojson = int_to_yojson
let app_image_config_name_to_yojson = string_to_yojson

let custom_image_to_yojson (x : custom_image) =
  assoc_to_yojson
    [
      ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name));
      ("ImageVersionNumber", option_to_yojson image_version_number_to_yojson x.image_version_number);
      ("ImageName", Some (image_name_to_yojson x.image_name));
    ]

let custom_images_to_yojson tree = list_to_yojson custom_image_to_yojson tree

let kernel_gateway_app_settings_to_yojson (x : kernel_gateway_app_settings) =
  assoc_to_yojson
    [
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let tensor_board_app_settings_to_yojson (x : tensor_board_app_settings) =
  assoc_to_yojson
    [ ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec) ]

let r_studio_server_pro_access_status_to_yojson (x : r_studio_server_pro_access_status) =
  match x with Disabled -> `String "DISABLED" | Enabled -> `String "ENABLED"

let r_studio_server_pro_user_group_to_yojson (x : r_studio_server_pro_user_group) =
  match x with User -> `String "R_STUDIO_USER" | Admin -> `String "R_STUDIO_ADMIN"

let r_studio_server_pro_app_settings_to_yojson (x : r_studio_server_pro_app_settings) =
  assoc_to_yojson
    [
      ("UserGroup", option_to_yojson r_studio_server_pro_user_group_to_yojson x.user_group);
      ("AccessStatus", option_to_yojson r_studio_server_pro_access_status_to_yojson x.access_status);
    ]

let r_session_app_settings_to_yojson (x : r_session_app_settings) =
  assoc_to_yojson
    [
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let feature_status_to_yojson (x : feature_status) =
  match x with Disabled -> `String "DISABLED" | Enabled -> `String "ENABLED"

let time_series_forecasting_settings_to_yojson (x : time_series_forecasting_settings) =
  assoc_to_yojson
    [
      ("AmazonForecastRoleArn", option_to_yojson role_arn_to_yojson x.amazon_forecast_role_arn);
      ("Status", option_to_yojson feature_status_to_yojson x.status);
    ]

let model_register_settings_to_yojson (x : model_register_settings) =
  assoc_to_yojson
    [
      ( "CrossAccountModelRegisterRoleArn",
        option_to_yojson role_arn_to_yojson x.cross_account_model_register_role_arn );
      ("Status", option_to_yojson feature_status_to_yojson x.status);
    ]

let data_source_name_to_yojson (x : data_source_name) =
  match x with Snowflake -> `String "Snowflake" | SalesforceGenie -> `String "SalesforceGenie"

let secret_arn_to_yojson = string_to_yojson

let identity_provider_o_auth_setting_to_yojson (x : identity_provider_o_auth_setting) =
  assoc_to_yojson
    [
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("Status", option_to_yojson feature_status_to_yojson x.status);
      ("DataSourceName", option_to_yojson data_source_name_to_yojson x.data_source_name);
    ]

let identity_provider_o_auth_settings_to_yojson tree =
  list_to_yojson identity_provider_o_auth_setting_to_yojson tree

let direct_deploy_settings_to_yojson (x : direct_deploy_settings) =
  assoc_to_yojson [ ("Status", option_to_yojson feature_status_to_yojson x.status) ]

let kendra_settings_to_yojson (x : kendra_settings) =
  assoc_to_yojson [ ("Status", option_to_yojson feature_status_to_yojson x.status) ]

let generative_ai_settings_to_yojson (x : generative_ai_settings) =
  assoc_to_yojson
    [ ("AmazonBedrockRoleArn", option_to_yojson role_arn_to_yojson x.amazon_bedrock_role_arn) ]

let emr_serverless_settings_to_yojson (x : emr_serverless_settings) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson feature_status_to_yojson x.status);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
    ]

let canvas_app_settings_to_yojson (x : canvas_app_settings) =
  assoc_to_yojson
    [
      ( "EmrServerlessSettings",
        option_to_yojson emr_serverless_settings_to_yojson x.emr_serverless_settings );
      ( "GenerativeAiSettings",
        option_to_yojson generative_ai_settings_to_yojson x.generative_ai_settings );
      ("KendraSettings", option_to_yojson kendra_settings_to_yojson x.kendra_settings);
      ( "DirectDeploySettings",
        option_to_yojson direct_deploy_settings_to_yojson x.direct_deploy_settings );
      ( "IdentityProviderOAuthSettings",
        option_to_yojson identity_provider_o_auth_settings_to_yojson
          x.identity_provider_o_auth_settings );
      ("WorkspaceSettings", option_to_yojson workspace_settings_to_yojson x.workspace_settings);
      ( "ModelRegisterSettings",
        option_to_yojson model_register_settings_to_yojson x.model_register_settings );
      ( "TimeSeriesForecastingSettings",
        option_to_yojson time_series_forecasting_settings_to_yojson
          x.time_series_forecasting_settings );
    ]

let lifecycle_management_to_yojson (x : lifecycle_management) =
  match x with Disabled -> `String "DISABLED" | Enabled -> `String "ENABLED"

let idle_timeout_in_minutes_to_yojson = int_to_yojson

let idle_settings_to_yojson (x : idle_settings) =
  assoc_to_yojson
    [
      ( "MaxIdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.max_idle_timeout_in_minutes );
      ( "MinIdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.min_idle_timeout_in_minutes );
      ( "IdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.idle_timeout_in_minutes );
      ("LifecycleManagement", option_to_yojson lifecycle_management_to_yojson x.lifecycle_management);
    ]

let app_lifecycle_management_to_yojson (x : app_lifecycle_management) =
  assoc_to_yojson [ ("IdleSettings", option_to_yojson idle_settings_to_yojson x.idle_settings) ]

let code_editor_app_settings_to_yojson (x : code_editor_app_settings) =
  assoc_to_yojson
    [
      ( "BuiltInLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.built_in_lifecycle_config_arn );
      ( "AppLifecycleManagement",
        option_to_yojson app_lifecycle_management_to_yojson x.app_lifecycle_management );
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let assumable_role_arns_to_yojson tree = list_to_yojson role_arn_to_yojson tree
let execution_role_arns_to_yojson tree = list_to_yojson role_arn_to_yojson tree

let emr_settings_to_yojson (x : emr_settings) =
  assoc_to_yojson
    [
      ("ExecutionRoleArns", option_to_yojson execution_role_arns_to_yojson x.execution_role_arns);
      ("AssumableRoleArns", option_to_yojson assumable_role_arns_to_yojson x.assumable_role_arns);
    ]

let jupyter_lab_app_settings_to_yojson (x : jupyter_lab_app_settings) =
  assoc_to_yojson
    [
      ( "BuiltInLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.built_in_lifecycle_config_arn );
      ("EmrSettings", option_to_yojson emr_settings_to_yojson x.emr_settings);
      ( "AppLifecycleManagement",
        option_to_yojson app_lifecycle_management_to_yojson x.app_lifecycle_management );
      ("CodeRepositories", option_to_yojson code_repositories_to_yojson x.code_repositories);
      ( "LifecycleConfigArns",
        option_to_yojson lifecycle_config_arns_to_yojson x.lifecycle_config_arns );
      ("CustomImages", option_to_yojson custom_images_to_yojson x.custom_images);
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let space_ebs_volume_size_in_gb_to_yojson = int_to_yojson

let default_ebs_storage_settings_to_yojson (x : default_ebs_storage_settings) =
  assoc_to_yojson
    [
      ( "MaximumEbsVolumeSizeInGb",
        Some (space_ebs_volume_size_in_gb_to_yojson x.maximum_ebs_volume_size_in_gb) );
      ( "DefaultEbsVolumeSizeInGb",
        Some (space_ebs_volume_size_in_gb_to_yojson x.default_ebs_volume_size_in_gb) );
    ]

let default_space_storage_settings_to_yojson (x : default_space_storage_settings) =
  assoc_to_yojson
    [
      ( "DefaultEbsStorageSettings",
        option_to_yojson default_ebs_storage_settings_to_yojson x.default_ebs_storage_settings );
    ]

let landing_uri_to_yojson = string_to_yojson

let studio_web_portal_to_yojson (x : studio_web_portal) =
  match x with Disabled -> `String "DISABLED" | Enabled -> `String "ENABLED"

let uid_to_yojson = long_to_yojson
let gid_to_yojson = long_to_yojson

let custom_posix_user_config_to_yojson (x : custom_posix_user_config) =
  assoc_to_yojson [ ("Gid", Some (gid_to_yojson x.gid)); ("Uid", Some (uid_to_yojson x.uid)) ]

let file_system_id_to_yojson = string_to_yojson
let file_system_path_to_yojson = string_to_yojson

let efs_file_system_config_to_yojson (x : efs_file_system_config) =
  assoc_to_yojson
    [
      ("FileSystemPath", option_to_yojson file_system_path_to_yojson x.file_system_path);
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
    ]

let f_sx_lustre_file_system_config_to_yojson (x : f_sx_lustre_file_system_config) =
  assoc_to_yojson
    [
      ("FileSystemPath", option_to_yojson file_system_path_to_yojson x.file_system_path);
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
    ]

let string1024_to_yojson = string_to_yojson
let s3_schema_uri_to_yojson = string_to_yojson

let s3_file_system_config_to_yojson (x : s3_file_system_config) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_schema_uri_to_yojson x.s3_uri));
      ("MountPath", option_to_yojson string1024_to_yojson x.mount_path);
    ]

let custom_file_system_config_to_yojson (x : custom_file_system_config) =
  match x with
  | S3FileSystemConfig arg ->
      assoc_to_yojson [ ("S3FileSystemConfig", Some (s3_file_system_config_to_yojson arg)) ]
  | FSxLustreFileSystemConfig arg ->
      assoc_to_yojson
        [ ("FSxLustreFileSystemConfig", Some (f_sx_lustre_file_system_config_to_yojson arg)) ]
  | EFSFileSystemConfig arg ->
      assoc_to_yojson [ ("EFSFileSystemConfig", Some (efs_file_system_config_to_yojson arg)) ]

let custom_file_system_configs_to_yojson tree =
  list_to_yojson custom_file_system_config_to_yojson tree

let ml_tools_to_yojson (x : ml_tools) =
  match x with
  | EVALUATORS -> `String "Evaluators"
  | DATASETS -> `String "Datasets"
  | RUNNING_INSTANCES -> `String "RunningInstances"
  | HYPER_POD_CLUSTERS -> `String "HyperPodClusters"
  | FIDDLER -> `String "Fiddler"
  | DEEPCHECKS_LLM_EVALUATION -> `String "DeepchecksLLMEvaluation"
  | COMET -> `String "Comet"
  | LAKERA_GUARD -> `String "LakeraGuard"
  | PERFORMANCE_EVALUATION -> `String "PerformanceEvaluation"
  | INFERENCE_OPTIMIZATION -> `String "InferenceOptimization"
  | PROJECTS -> `String "Projects"
  | ENDPOINTS -> `String "Endpoints"
  | INFERENCE_RECOMMENDER -> `String "InferenceRecommender"
  | JUMP_START -> `String "JumpStart"
  | MODELS -> `String "Models"
  | PIPELINES -> `String "Pipelines"
  | MODEL_EVALUATION -> `String "ModelEvaluation"
  | TRAINING -> `String "Training"
  | EXPERIMENTS -> `String "Experiments"
  | AUTO_ML -> `String "AutoMl"
  | EMR_CLUSTERS -> `String "EmrClusters"
  | FEATURE_STORE -> `String "FeatureStore"
  | DATA_WRANGLER -> `String "DataWrangler"

let hidden_ml_tools_list_to_yojson tree = list_to_yojson ml_tools_to_yojson tree

let app_type_to_yojson (x : app_type) =
  match x with
  | Canvas -> `String "Canvas"
  | RSessionGateway -> `String "RSessionGateway"
  | RStudioServerPro -> `String "RStudioServerPro"
  | JupyterLab -> `String "JupyterLab"
  | CodeEditor -> `String "CodeEditor"
  | TensorBoard -> `String "TensorBoard"
  | DetailedProfiler -> `String "DetailedProfiler"
  | KernelGateway -> `String "KernelGateway"
  | JupyterServer -> `String "JupyterServer"

let hidden_app_types_list_to_yojson tree = list_to_yojson app_type_to_yojson tree
let hidden_instance_types_list_to_yojson tree = list_to_yojson app_instance_type_to_yojson tree

let sage_maker_image_name_to_yojson (x : sage_maker_image_name) =
  match x with Sagemaker_distribution -> `String "sagemaker_distribution"

let hidden_sage_maker_image_to_yojson (x : hidden_sage_maker_image) =
  assoc_to_yojson
    [
      ("VersionAliases", option_to_yojson version_aliases_list_to_yojson x.version_aliases);
      ( "SageMakerImageName",
        option_to_yojson sage_maker_image_name_to_yojson x.sage_maker_image_name );
    ]

let hidden_sage_maker_image_version_aliases_list_to_yojson tree =
  list_to_yojson hidden_sage_maker_image_to_yojson tree

let execution_role_session_name_mode_to_yojson (x : execution_role_session_name_mode) =
  match x with UserIdentity -> `String "USER_IDENTITY" | Static -> `String "STATIC"

let studio_web_portal_settings_to_yojson (x : studio_web_portal_settings) =
  assoc_to_yojson
    [
      ( "ExecutionRoleSessionNameMode",
        option_to_yojson execution_role_session_name_mode_to_yojson
          x.execution_role_session_name_mode );
      ( "HiddenSageMakerImageVersionAliases",
        option_to_yojson hidden_sage_maker_image_version_aliases_list_to_yojson
          x.hidden_sage_maker_image_version_aliases );
      ( "HiddenInstanceTypes",
        option_to_yojson hidden_instance_types_list_to_yojson x.hidden_instance_types );
      ("HiddenAppTypes", option_to_yojson hidden_app_types_list_to_yojson x.hidden_app_types);
      ("HiddenMlTools", option_to_yojson hidden_ml_tools_list_to_yojson x.hidden_ml_tools);
    ]

let auto_mount_home_ef_s_to_yojson (x : auto_mount_home_ef_s) =
  match x with
  | DEFAULT_AS_DOMAIN -> `String "DefaultAsDomain"
  | DISABLED -> `String "Disabled"
  | ENABLED -> `String "Enabled"

let user_settings_to_yojson (x : user_settings) =
  assoc_to_yojson
    [
      ("AutoMountHomeEFS", option_to_yojson auto_mount_home_ef_s_to_yojson x.auto_mount_home_ef_s);
      ( "StudioWebPortalSettings",
        option_to_yojson studio_web_portal_settings_to_yojson x.studio_web_portal_settings );
      ( "CustomFileSystemConfigs",
        option_to_yojson custom_file_system_configs_to_yojson x.custom_file_system_configs );
      ( "CustomPosixUserConfig",
        option_to_yojson custom_posix_user_config_to_yojson x.custom_posix_user_config );
      ("StudioWebPortal", option_to_yojson studio_web_portal_to_yojson x.studio_web_portal);
      ("DefaultLandingUri", option_to_yojson landing_uri_to_yojson x.default_landing_uri);
      ( "SpaceStorageSettings",
        option_to_yojson default_space_storage_settings_to_yojson x.space_storage_settings );
      ( "JupyterLabAppSettings",
        option_to_yojson jupyter_lab_app_settings_to_yojson x.jupyter_lab_app_settings );
      ( "CodeEditorAppSettings",
        option_to_yojson code_editor_app_settings_to_yojson x.code_editor_app_settings );
      ("CanvasAppSettings", option_to_yojson canvas_app_settings_to_yojson x.canvas_app_settings);
      ( "RSessionAppSettings",
        option_to_yojson r_session_app_settings_to_yojson x.r_session_app_settings );
      ( "RStudioServerProAppSettings",
        option_to_yojson r_studio_server_pro_app_settings_to_yojson
          x.r_studio_server_pro_app_settings );
      ( "TensorBoardAppSettings",
        option_to_yojson tensor_board_app_settings_to_yojson x.tensor_board_app_settings );
      ( "KernelGatewayAppSettings",
        option_to_yojson kernel_gateway_app_settings_to_yojson x.kernel_gateway_app_settings );
      ( "JupyterServerAppSettings",
        option_to_yojson jupyter_server_app_settings_to_yojson x.jupyter_server_app_settings );
      ("SharingSettings", option_to_yojson sharing_settings_to_yojson x.sharing_settings);
      ("SecurityGroups", option_to_yojson security_group_ids_to_yojson x.security_groups);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
    ]

let user_profile_status_to_yojson (x : user_profile_status) =
  match x with
  | Delete_Failed -> `String "Delete_Failed"
  | Update_Failed -> `String "Update_Failed"
  | Updating -> `String "Updating"
  | Pending -> `String "Pending"
  | InService -> `String "InService"
  | Failed -> `String "Failed"
  | Deleting -> `String "Deleting"

let user_profile_sort_key_to_yojson (x : user_profile_sort_key) =
  match x with
  | LastModifiedTime -> `String "LastModifiedTime"
  | CreationTime -> `String "CreationTime"

let user_profile_name_to_yojson = string_to_yojson
let domain_id_to_yojson = string_to_yojson
let creation_time_to_yojson = timestamp_epoch_seconds_to_yojson
let last_modified_time_to_yojson = timestamp_epoch_seconds_to_yojson

let user_profile_details_to_yojson (x : user_profile_details) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("Status", option_to_yojson user_profile_status_to_yojson x.status);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let user_profile_list_to_yojson tree = list_to_yojson user_profile_details_to_yojson tree
let user_profile_arn_to_yojson = string_to_yojson

let iam_identity_to_yojson (x : iam_identity) =
  assoc_to_yojson
    [
      ("SourceIdentity", option_to_yojson string__to_yojson x.source_identity);
      ("PrincipalId", option_to_yojson string__to_yojson x.principal_id);
      ("Arn", option_to_yojson string__to_yojson x.arn);
    ]

let user_context_to_yojson (x : user_context) =
  assoc_to_yojson
    [
      ("IamIdentity", option_to_yojson iam_identity_to_yojson x.iam_identity);
      ("DomainId", option_to_yojson string__to_yojson x.domain_id);
      ("UserProfileName", option_to_yojson string__to_yojson x.user_profile_name);
      ("UserProfileArn", option_to_yojson string__to_yojson x.user_profile_arn);
    ]

let url_to_yojson = string_to_yojson

let update_workteam_response_to_yojson (x : update_workteam_response) =
  assoc_to_yojson [ ("Workteam", Some (workteam_to_yojson x.workteam)) ]

let update_workteam_request_to_yojson (x : update_workteam_request) =
  assoc_to_yojson
    [
      ( "WorkerAccessConfiguration",
        option_to_yojson worker_access_configuration_to_yojson x.worker_access_configuration );
      ( "NotificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ("Description", option_to_yojson string200_to_yojson x.description);
      ("MemberDefinitions", option_to_yojson member_definitions_to_yojson x.member_definitions);
      ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name));
    ]

let failure_reason_to_yojson = string_to_yojson

let resource_limit_exceeded_to_yojson (x : resource_limit_exceeded) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let update_workforce_response_to_yojson (x : update_workforce_response) =
  assoc_to_yojson [ ("Workforce", Some (workforce_to_yojson x.workforce)) ]

let client_secret_to_yojson = string_to_yojson

let oidc_config_to_yojson (x : oidc_config) =
  assoc_to_yojson
    [
      ( "AuthenticationRequestExtraParams",
        option_to_yojson authentication_request_extra_params_to_yojson
          x.authentication_request_extra_params );
      ("Scope", option_to_yojson scope_to_yojson x.scope);
      ("JwksUri", Some (oidc_endpoint_to_yojson x.jwks_uri));
      ("LogoutEndpoint", Some (oidc_endpoint_to_yojson x.logout_endpoint));
      ("UserInfoEndpoint", Some (oidc_endpoint_to_yojson x.user_info_endpoint));
      ("TokenEndpoint", Some (oidc_endpoint_to_yojson x.token_endpoint));
      ("AuthorizationEndpoint", Some (oidc_endpoint_to_yojson x.authorization_endpoint));
      ("Issuer", Some (oidc_endpoint_to_yojson x.issuer));
      ("ClientSecret", Some (client_secret_to_yojson x.client_secret));
      ("ClientId", Some (client_id_to_yojson x.client_id));
    ]

let update_workforce_request_to_yojson (x : update_workforce_request) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson workforce_ip_address_type_to_yojson x.ip_address_type);
      ( "WorkforceVpcConfig",
        option_to_yojson workforce_vpc_config_request_to_yojson x.workforce_vpc_config );
      ("OidcConfig", option_to_yojson oidc_config_to_yojson x.oidc_config);
      ("SourceIpConfig", option_to_yojson source_ip_config_to_yojson x.source_ip_config);
      ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name));
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let update_user_profile_response_to_yojson (x : update_user_profile_response) =
  assoc_to_yojson
    [ ("UserProfileArn", option_to_yojson user_profile_arn_to_yojson x.user_profile_arn) ]

let update_user_profile_request_to_yojson (x : update_user_profile_request) =
  assoc_to_yojson
    [
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let resource_not_found_to_yojson (x : resource_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let resource_in_use_to_yojson (x : resource_in_use) =
  assoc_to_yojson [ ("Message", option_to_yojson failure_reason_to_yojson x.message) ]

let trial_arn_to_yojson = string_to_yojson

let update_trial_response_to_yojson (x : update_trial_response) =
  assoc_to_yojson [ ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn) ]

let experiment_entity_name_to_yojson = string_to_yojson

let update_trial_request_to_yojson (x : update_trial_request) =
  assoc_to_yojson
    [
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
    ]

let trial_component_arn_to_yojson = string_to_yojson

let update_trial_component_response_to_yojson (x : update_trial_component_response) =
  assoc_to_yojson
    [ ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn) ]

let trial_component_primary_status_to_yojson (x : trial_component_primary_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let trial_component_status_message_to_yojson = string_to_yojson

let trial_component_status_to_yojson (x : trial_component_status) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson trial_component_status_message_to_yojson x.message);
      ("PrimaryStatus", option_to_yojson trial_component_primary_status_to_yojson x.primary_status);
    ]

let string_parameter_value_to_yojson = string_to_yojson
let double_parameter_value_to_yojson = double_to_yojson

let trial_component_parameter_value_to_yojson (x : trial_component_parameter_value) =
  match x with
  | NumberValue arg ->
      assoc_to_yojson [ ("NumberValue", Some (double_parameter_value_to_yojson arg)) ]
  | StringValue arg ->
      assoc_to_yojson [ ("StringValue", Some (string_parameter_value_to_yojson arg)) ]

let trial_component_key320_to_yojson = string_to_yojson

let trial_component_parameters_to_yojson tree =
  map_to_yojson trial_component_key320_to_yojson trial_component_parameter_value_to_yojson tree

let trial_component_key256_to_yojson = string_to_yojson

let list_trial_component_key256_to_yojson tree =
  list_to_yojson trial_component_key256_to_yojson tree

let media_type_to_yojson = string_to_yojson
let trial_component_artifact_value_to_yojson = string_to_yojson

let trial_component_artifact_to_yojson (x : trial_component_artifact) =
  assoc_to_yojson
    [
      ("Value", Some (trial_component_artifact_value_to_yojson x.value));
      ("MediaType", option_to_yojson media_type_to_yojson x.media_type);
    ]

let trial_component_key128_to_yojson = string_to_yojson

let trial_component_artifacts_to_yojson tree =
  map_to_yojson trial_component_key128_to_yojson trial_component_artifact_to_yojson tree

let update_trial_component_request_to_yojson (x : update_trial_component_request) =
  assoc_to_yojson
    [
      ( "OutputArtifactsToRemove",
        option_to_yojson list_trial_component_key256_to_yojson x.output_artifacts_to_remove );
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ( "InputArtifactsToRemove",
        option_to_yojson list_trial_component_key256_to_yojson x.input_artifacts_to_remove );
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ( "ParametersToRemove",
        option_to_yojson list_trial_component_key256_to_yojson x.parameters_to_remove );
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
    ]

let training_job_arn_to_yojson = string_to_yojson

let update_training_job_response_to_yojson (x : update_training_job_response) =
  assoc_to_yojson [ ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn)) ]

let profiling_interval_in_milliseconds_to_yojson = long_to_yojson
let config_value_to_yojson = string_to_yojson
let config_key_to_yojson = string_to_yojson

let profiling_parameters_to_yojson tree =
  map_to_yojson config_key_to_yojson config_value_to_yojson tree

let disable_profiler_to_yojson = bool_to_yojson

let profiler_config_for_update_to_yojson (x : profiler_config_for_update) =
  assoc_to_yojson
    [
      ("DisableProfiler", option_to_yojson disable_profiler_to_yojson x.disable_profiler);
      ("ProfilingParameters", option_to_yojson profiling_parameters_to_yojson x.profiling_parameters);
      ( "ProfilingIntervalInMilliseconds",
        option_to_yojson profiling_interval_in_milliseconds_to_yojson
          x.profiling_interval_in_milliseconds );
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
    ]

let rule_configuration_name_to_yojson = string_to_yojson
let directory_path_to_yojson = string_to_yojson
let algorithm_image_to_yojson = string_to_yojson

let processing_instance_type_to_yojson (x : processing_instance_type) =
  match x with
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_R5D_24XLARGE -> `String "ml.r5d.24xlarge"
  | ML_R5D_16XLARGE -> `String "ml.r5d.16xlarge"
  | ML_R5D_12XLARGE -> `String "ml.r5d.12xlarge"
  | ML_R5D_8XLARGE -> `String "ml.r5d.8xlarge"
  | ML_R5D_4XLARGE -> `String "ml.r5d.4xlarge"
  | ML_R5D_2XLARGE -> `String "ml.r5d.2xlarge"
  | ML_R5D_XLARGE -> `String "ml.r5d.xlarge"
  | ML_R5D_LARGE -> `String "ml.r5d.large"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"

let optional_volume_size_in_g_b_to_yojson = int_to_yojson
let rule_parameters_to_yojson tree = map_to_yojson config_key_to_yojson config_value_to_yojson tree

let profiler_rule_configuration_to_yojson (x : profiler_rule_configuration) =
  assoc_to_yojson
    [
      ("RuleParameters", option_to_yojson rule_parameters_to_yojson x.rule_parameters);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("InstanceType", option_to_yojson processing_instance_type_to_yojson x.instance_type);
      ("RuleEvaluatorImage", Some (algorithm_image_to_yojson x.rule_evaluator_image));
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
      ("RuleConfigurationName", Some (rule_configuration_name_to_yojson x.rule_configuration_name));
    ]

let profiler_rule_configurations_to_yojson tree =
  list_to_yojson profiler_rule_configuration_to_yojson tree

let keep_alive_period_in_seconds_to_yojson = int_to_yojson

let resource_config_for_update_to_yojson (x : resource_config_for_update) =
  assoc_to_yojson
    [
      ( "KeepAlivePeriodInSeconds",
        Some (keep_alive_period_in_seconds_to_yojson x.keep_alive_period_in_seconds) );
    ]

let enable_remote_debug_to_yojson = bool_to_yojson

let remote_debug_config_for_update_to_yojson (x : remote_debug_config_for_update) =
  assoc_to_yojson
    [ ("EnableRemoteDebug", option_to_yojson enable_remote_debug_to_yojson x.enable_remote_debug) ]

let update_training_job_request_to_yojson (x : update_training_job_request) =
  assoc_to_yojson
    [
      ( "RemoteDebugConfig",
        option_to_yojson remote_debug_config_for_update_to_yojson x.remote_debug_config );
      ("ResourceConfig", option_to_yojson resource_config_for_update_to_yojson x.resource_config);
      ( "ProfilerRuleConfigurations",
        option_to_yojson profiler_rule_configurations_to_yojson x.profiler_rule_configurations );
      ("ProfilerConfig", option_to_yojson profiler_config_for_update_to_yojson x.profiler_config);
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
    ]

let cfn_template_name_to_yojson = string_to_yojson
let cfn_template_ur_l_to_yojson = string_to_yojson
let cfn_stack_parameter_key_to_yojson = string_to_yojson
let cfn_stack_parameter_value_to_yojson = string_to_yojson

let cfn_stack_update_parameter_to_yojson (x : cfn_stack_update_parameter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson cfn_stack_parameter_value_to_yojson x.value);
      ("Key", Some (cfn_stack_parameter_key_to_yojson x.key));
    ]

let cfn_stack_update_parameters_to_yojson tree =
  list_to_yojson cfn_stack_update_parameter_to_yojson tree

let cfn_update_template_provider_to_yojson (x : cfn_update_template_provider) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson cfn_stack_update_parameters_to_yojson x.parameters);
      ("TemplateURL", Some (cfn_template_ur_l_to_yojson x.template_ur_l));
      ("TemplateName", Some (cfn_template_name_to_yojson x.template_name));
    ]

let update_template_provider_to_yojson (x : update_template_provider) =
  assoc_to_yojson
    [
      ( "CfnTemplateProvider",
        option_to_yojson cfn_update_template_provider_to_yojson x.cfn_template_provider );
    ]

let update_template_provider_list_to_yojson tree =
  list_to_yojson update_template_provider_to_yojson tree

let space_arn_to_yojson = string_to_yojson

let update_space_response_to_yojson (x : update_space_response) =
  assoc_to_yojson [ ("SpaceArn", option_to_yojson space_arn_to_yojson x.space_arn) ]

let space_name_to_yojson = string_to_yojson

let space_idle_settings_to_yojson (x : space_idle_settings) =
  assoc_to_yojson
    [
      ( "IdleTimeoutInMinutes",
        option_to_yojson idle_timeout_in_minutes_to_yojson x.idle_timeout_in_minutes );
    ]

let space_app_lifecycle_management_to_yojson (x : space_app_lifecycle_management) =
  assoc_to_yojson
    [ ("IdleSettings", option_to_yojson space_idle_settings_to_yojson x.idle_settings) ]

let space_code_editor_app_settings_to_yojson (x : space_code_editor_app_settings) =
  assoc_to_yojson
    [
      ( "AppLifecycleManagement",
        option_to_yojson space_app_lifecycle_management_to_yojson x.app_lifecycle_management );
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let space_jupyter_lab_app_settings_to_yojson (x : space_jupyter_lab_app_settings) =
  assoc_to_yojson
    [
      ( "AppLifecycleManagement",
        option_to_yojson space_app_lifecycle_management_to_yojson x.app_lifecycle_management );
      ("CodeRepositories", option_to_yojson code_repositories_to_yojson x.code_repositories);
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
    ]

let ebs_storage_settings_to_yojson (x : ebs_storage_settings) =
  assoc_to_yojson
    [ ("EbsVolumeSizeInGb", Some (space_ebs_volume_size_in_gb_to_yojson x.ebs_volume_size_in_gb)) ]

let space_storage_settings_to_yojson (x : space_storage_settings) =
  assoc_to_yojson
    [
      ("EbsStorageSettings", option_to_yojson ebs_storage_settings_to_yojson x.ebs_storage_settings);
    ]

let efs_file_system_to_yojson (x : efs_file_system) =
  assoc_to_yojson [ ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id)) ]

let f_sx_lustre_file_system_to_yojson (x : f_sx_lustre_file_system) =
  assoc_to_yojson [ ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id)) ]

let s3_file_system_to_yojson (x : s3_file_system) =
  assoc_to_yojson [ ("S3Uri", Some (s3_schema_uri_to_yojson x.s3_uri)) ]

let custom_file_system_to_yojson (x : custom_file_system) =
  match x with
  | S3FileSystem arg -> assoc_to_yojson [ ("S3FileSystem", Some (s3_file_system_to_yojson arg)) ]
  | FSxLustreFileSystem arg ->
      assoc_to_yojson [ ("FSxLustreFileSystem", Some (f_sx_lustre_file_system_to_yojson arg)) ]
  | EFSFileSystem arg -> assoc_to_yojson [ ("EFSFileSystem", Some (efs_file_system_to_yojson arg)) ]

let custom_file_systems_to_yojson tree = list_to_yojson custom_file_system_to_yojson tree

let space_settings_to_yojson (x : space_settings) =
  assoc_to_yojson
    [
      ("RemoteAccess", option_to_yojson feature_status_to_yojson x.remote_access);
      ("CustomFileSystems", option_to_yojson custom_file_systems_to_yojson x.custom_file_systems);
      ("SpaceManagedResources", option_to_yojson feature_status_to_yojson x.space_managed_resources);
      ( "SpaceStorageSettings",
        option_to_yojson space_storage_settings_to_yojson x.space_storage_settings );
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
      ( "JupyterLabAppSettings",
        option_to_yojson space_jupyter_lab_app_settings_to_yojson x.jupyter_lab_app_settings );
      ( "CodeEditorAppSettings",
        option_to_yojson space_code_editor_app_settings_to_yojson x.code_editor_app_settings );
      ( "KernelGatewayAppSettings",
        option_to_yojson kernel_gateway_app_settings_to_yojson x.kernel_gateway_app_settings );
      ( "JupyterServerAppSettings",
        option_to_yojson jupyter_server_app_settings_to_yojson x.jupyter_server_app_settings );
    ]

let non_empty_string64_to_yojson = string_to_yojson

let update_space_request_to_yojson (x : update_space_request) =
  assoc_to_yojson
    [
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
      ("SpaceSettings", option_to_yojson space_settings_to_yojson x.space_settings);
      ("SpaceName", Some (space_name_to_yojson x.space_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let project_arn_to_yojson = string_to_yojson

let update_project_output_to_yojson (x : update_project_output) =
  assoc_to_yojson [ ("ProjectArn", Some (project_arn_to_yojson x.project_arn)) ]

let project_entity_name_to_yojson = string_to_yojson
let entity_description_to_yojson = string_to_yojson
let service_catalog_entity_id_to_yojson = string_to_yojson
let provisioning_parameter_key_to_yojson = string_to_yojson
let provisioning_parameter_value_to_yojson = string_to_yojson

let provisioning_parameter_to_yojson (x : provisioning_parameter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson provisioning_parameter_value_to_yojson x.value);
      ("Key", option_to_yojson provisioning_parameter_key_to_yojson x.key);
    ]

let provisioning_parameters_to_yojson tree = list_to_yojson provisioning_parameter_to_yojson tree

let service_catalog_provisioning_update_details_to_yojson
    (x : service_catalog_provisioning_update_details) =
  assoc_to_yojson
    [
      ( "ProvisioningParameters",
        option_to_yojson provisioning_parameters_to_yojson x.provisioning_parameters );
      ( "ProvisioningArtifactId",
        option_to_yojson service_catalog_entity_id_to_yojson x.provisioning_artifact_id );
    ]

let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let update_project_input_to_yojson (x : update_project_input) =
  assoc_to_yojson
    [
      ( "TemplateProvidersToUpdate",
        option_to_yojson update_template_provider_list_to_yojson x.template_providers_to_update );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ServiceCatalogProvisioningUpdateDetails",
        option_to_yojson service_catalog_provisioning_update_details_to_yojson
          x.service_catalog_provisioning_update_details );
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
    ]

let pipeline_arn_to_yojson = string_to_yojson
let pipeline_version_id_to_yojson = long_to_yojson

let update_pipeline_version_response_to_yojson (x : update_pipeline_version_response) =
  assoc_to_yojson
    [
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let pipeline_version_name_to_yojson = string_to_yojson
let pipeline_version_description_to_yojson = string_to_yojson

let update_pipeline_version_request_to_yojson (x : update_pipeline_version_request) =
  assoc_to_yojson
    [
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ("PipelineVersionId", Some (pipeline_version_id_to_yojson x.pipeline_version_id));
      ("PipelineArn", Some (pipeline_arn_to_yojson x.pipeline_arn));
    ]

let update_pipeline_response_to_yojson (x : update_pipeline_response) =
  assoc_to_yojson
    [
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let pipeline_name_to_yojson = string_to_yojson
let pipeline_definition_to_yojson = string_to_yojson
let bucket_name_to_yojson = string_to_yojson
let key_to_yojson = string_to_yojson

let pipeline_definition_s3_location_to_yojson (x : pipeline_definition_s3_location) =
  assoc_to_yojson
    [
      ("VersionId", option_to_yojson version_id_to_yojson x.version_id);
      ("ObjectKey", Some (key_to_yojson x.object_key));
      ("Bucket", Some (bucket_name_to_yojson x.bucket));
    ]

let pipeline_description_to_yojson = string_to_yojson
let max_parallel_execution_steps_to_yojson = int_to_yojson

let parallelism_configuration_to_yojson (x : parallelism_configuration) =
  assoc_to_yojson
    [
      ( "MaxParallelExecutionSteps",
        Some (max_parallel_execution_steps_to_yojson x.max_parallel_execution_steps) );
    ]

let update_pipeline_request_to_yojson (x : update_pipeline_request) =
  assoc_to_yojson
    [
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ( "PipelineDefinitionS3Location",
        option_to_yojson pipeline_definition_s3_location_to_yojson x.pipeline_definition_s3_location
      );
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let pipeline_execution_arn_to_yojson = string_to_yojson

let update_pipeline_execution_response_to_yojson (x : update_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let pipeline_execution_description_to_yojson = string_to_yojson
let pipeline_execution_name_to_yojson = string_to_yojson

let update_pipeline_execution_request_to_yojson (x : update_pipeline_execution_request) =
  assoc_to_yojson
    [
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
    ]

let partner_app_arn_to_yojson = string_to_yojson

let update_partner_app_response_to_yojson (x : update_partner_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn) ]

let partner_app_maintenance_config_to_yojson (x : partner_app_maintenance_config) =
  assoc_to_yojson
    [
      ( "MaintenanceWindowStart",
        option_to_yojson weekly_schedule_time_format_to_yojson x.maintenance_window_start );
    ]

let non_empty_string256_to_yojson = string_to_yojson
let partner_app_admin_user_list_to_yojson tree = list_to_yojson non_empty_string256_to_yojson tree

let partner_app_arguments_to_yojson tree =
  map_to_yojson non_empty_string256_to_yojson string1024_to_yojson tree

let group_name_pattern_to_yojson = string_to_yojson
let assigned_group_patterns_list_to_yojson tree = list_to_yojson group_name_pattern_to_yojson tree
let group_patterns_list_to_yojson tree = list_to_yojson group_name_pattern_to_yojson tree

let role_group_assignment_to_yojson (x : role_group_assignment) =
  assoc_to_yojson
    [
      ("GroupPatterns", Some (group_patterns_list_to_yojson x.group_patterns));
      ("RoleName", Some (non_empty_string256_to_yojson x.role_name));
    ]

let role_group_assignments_list_to_yojson tree = list_to_yojson role_group_assignment_to_yojson tree

let partner_app_config_to_yojson (x : partner_app_config) =
  assoc_to_yojson
    [
      ( "RoleGroupAssignments",
        option_to_yojson role_group_assignments_list_to_yojson x.role_group_assignments );
      ( "AssignedGroupPatterns",
        option_to_yojson assigned_group_patterns_list_to_yojson x.assigned_group_patterns );
      ("Arguments", option_to_yojson partner_app_arguments_to_yojson x.arguments);
      ("AdminUsers", option_to_yojson partner_app_admin_user_list_to_yojson x.admin_users);
    ]

let boolean__to_yojson = bool_to_yojson
let major_minor_version_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson

let update_partner_app_request_to_yojson (x : update_partner_app_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AppVersion", option_to_yojson major_minor_version_to_yojson x.app_version);
      ( "EnableAutoMinorVersionUpgrade",
        option_to_yojson boolean__to_yojson x.enable_auto_minor_version_upgrade );
      ( "EnableIamSessionBasedIdentity",
        option_to_yojson boolean__to_yojson x.enable_iam_session_based_identity );
      ("ApplicationConfig", option_to_yojson partner_app_config_to_yojson x.application_config);
      ("Tier", option_to_yojson non_empty_string64_to_yojson x.tier);
      ( "MaintenanceConfig",
        option_to_yojson partner_app_maintenance_config_to_yojson x.maintenance_config );
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
    ]

let update_notebook_instance_output_to_yojson = unit_to_yojson
let update_notebook_instance_lifecycle_config_output_to_yojson = unit_to_yojson
let notebook_instance_lifecycle_config_name_to_yojson = string_to_yojson
let notebook_instance_lifecycle_config_content_to_yojson = string_to_yojson

let notebook_instance_lifecycle_hook_to_yojson (x : notebook_instance_lifecycle_hook) =
  assoc_to_yojson
    [ ("Content", option_to_yojson notebook_instance_lifecycle_config_content_to_yojson x.content) ]

let notebook_instance_lifecycle_config_list_to_yojson tree =
  list_to_yojson notebook_instance_lifecycle_hook_to_yojson tree

let update_notebook_instance_lifecycle_config_input_to_yojson
    (x : update_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ("OnStart", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_start);
      ("OnCreate", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_create);
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
    ]

let notebook_instance_name_to_yojson = string_to_yojson

let instance_type_to_yojson (x : instance_type) =
  match x with
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_R6ID_32XLARGE -> `String "ml.r6id.32xlarge"
  | ML_R6ID_24XLARGE -> `String "ml.r6id.24xlarge"
  | ML_R6ID_16XLARGE -> `String "ml.r6id.16xlarge"
  | ML_R6ID_12XLARGE -> `String "ml.r6id.12xlarge"
  | ML_R6ID_8XLARGE -> `String "ml.r6id.8xlarge"
  | ML_R6ID_4XLARGE -> `String "ml.r6id.4xlarge"
  | ML_R6ID_2XLARGE -> `String "ml.r6id.2xlarge"
  | ML_R6ID_XLARGE -> `String "ml.r6id.xlarge"
  | ML_R6ID_LARGE -> `String "ml.r6id.large"
  | ML_C6ID_32XLARGE -> `String "ml.c6id.32xlarge"
  | ML_C6ID_24XLARGE -> `String "ml.c6id.24xlarge"
  | ML_C6ID_16XLARGE -> `String "ml.c6id.16xlarge"
  | ML_C6ID_12XLARGE -> `String "ml.c6id.12xlarge"
  | ML_C6ID_8XLARGE -> `String "ml.c6id.8xlarge"
  | ML_C6ID_4XLARGE -> `String "ml.c6id.4xlarge"
  | ML_C6ID_2XLARGE -> `String "ml.c6id.2xlarge"
  | ML_C6ID_XLARGE -> `String "ml.c6id.xlarge"
  | ML_C6ID_LARGE -> `String "ml.c6id.large"
  | ML_M6ID_32XLARGE -> `String "ml.m6id.32xlarge"
  | ML_M6ID_24XLARGE -> `String "ml.m6id.24xlarge"
  | ML_M6ID_16XLARGE -> `String "ml.m6id.16xlarge"
  | ML_M6ID_12XLARGE -> `String "ml.m6id.12xlarge"
  | ML_M6ID_8XLARGE -> `String "ml.m6id.8xlarge"
  | ML_M6ID_4XLARGE -> `String "ml.m6id.4xlarge"
  | ML_M6ID_2XLARGE -> `String "ml.m6id.2xlarge"
  | ML_M6ID_XLARGE -> `String "ml.m6id.xlarge"
  | ML_M6ID_LARGE -> `String "ml.m6id.large"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_INF1_24XLARGE -> `String "ml.inf1.24xlarge"
  | ML_INF1_6XLARGE -> `String "ml.inf1.6xlarge"
  | ML_INF1_2XLARGE -> `String "ml.inf1.2xlarge"
  | ML_INF1_XLARGE -> `String "ml.inf1.xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_P3DN_24XLARGE -> `String "ml.p3dn.24xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_C5D_18XLARGE -> `String "ml.c5d.18xlarge"
  | ML_C5D_9XLARGE -> `String "ml.c5d.9xlarge"
  | ML_C5D_4XLARGE -> `String "ml.c5d.4xlarge"
  | ML_C5D_2XLARGE -> `String "ml.c5d.2xlarge"
  | ML_C5D_XLARGE -> `String "ml.c5d.xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_M5D_24XLARGE -> `String "ml.m5d.24xlarge"
  | ML_M5D_16XLARGE -> `String "ml.m5d.16xlarge"
  | ML_M5D_12XLARGE -> `String "ml.m5d.12xlarge"
  | ML_M5D_8XLARGE -> `String "ml.m5d.8xlarge"
  | ML_M5D_4XLARGE -> `String "ml.m5d.4xlarge"
  | ML_M5D_2XLARGE -> `String "ml.m5d.2xlarge"
  | ML_M5D_XLARGE -> `String "ml.m5d.xlarge"
  | ML_M5D_LARGE -> `String "ml.m5d.large"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_T2_2XLARGE -> `String "ml.t2.2xlarge"
  | ML_T2_XLARGE -> `String "ml.t2.xlarge"
  | ML_T2_LARGE -> `String "ml.t2.large"
  | ML_T2_MEDIUM -> `String "ml.t2.medium"

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with DUALSTACK -> `String "dualstack" | IPV4 -> `String "ipv4"

let platform_identifier_to_yojson = string_to_yojson
let disassociate_notebook_instance_lifecycle_config_to_yojson = bool_to_yojson
let notebook_instance_volume_size_in_g_b_to_yojson = int_to_yojson
let code_repository_name_or_url_to_yojson = string_to_yojson

let additional_code_repository_names_or_urls_to_yojson tree =
  list_to_yojson code_repository_name_or_url_to_yojson tree

let notebook_instance_accelerator_type_to_yojson (x : notebook_instance_accelerator_type) =
  match x with
  | ML_EIA2_XLARGE -> `String "ml.eia2.xlarge"
  | ML_EIA2_LARGE -> `String "ml.eia2.large"
  | ML_EIA2_MEDIUM -> `String "ml.eia2.medium"
  | ML_EIA1_XLARGE -> `String "ml.eia1.xlarge"
  | ML_EIA1_LARGE -> `String "ml.eia1.large"
  | ML_EIA1_MEDIUM -> `String "ml.eia1.medium"

let notebook_instance_accelerator_types_to_yojson tree =
  list_to_yojson notebook_instance_accelerator_type_to_yojson tree

let disassociate_notebook_instance_accelerator_types_to_yojson = bool_to_yojson
let disassociate_default_code_repository_to_yojson = bool_to_yojson
let disassociate_additional_code_repositories_to_yojson = bool_to_yojson

let root_access_to_yojson (x : root_access) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let minimum_instance_metadata_service_version_to_yojson = string_to_yojson

let instance_metadata_service_configuration_to_yojson (x : instance_metadata_service_configuration)
    =
  assoc_to_yojson
    [
      ( "MinimumInstanceMetadataServiceVersion",
        Some
          (minimum_instance_metadata_service_version_to_yojson
             x.minimum_instance_metadata_service_version) );
    ]

let update_notebook_instance_input_to_yojson (x : update_notebook_instance_input) =
  assoc_to_yojson
    [
      ( "InstanceMetadataServiceConfiguration",
        option_to_yojson instance_metadata_service_configuration_to_yojson
          x.instance_metadata_service_configuration );
      ("RootAccess", option_to_yojson root_access_to_yojson x.root_access);
      ( "DisassociateAdditionalCodeRepositories",
        option_to_yojson disassociate_additional_code_repositories_to_yojson
          x.disassociate_additional_code_repositories );
      ( "DisassociateDefaultCodeRepository",
        option_to_yojson disassociate_default_code_repository_to_yojson
          x.disassociate_default_code_repository );
      ( "DisassociateAcceleratorTypes",
        option_to_yojson disassociate_notebook_instance_accelerator_types_to_yojson
          x.disassociate_accelerator_types );
      ( "AcceleratorTypes",
        option_to_yojson notebook_instance_accelerator_types_to_yojson x.accelerator_types );
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "VolumeSizeInGB",
        option_to_yojson notebook_instance_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "DisassociateLifecycleConfig",
        option_to_yojson disassociate_notebook_instance_lifecycle_config_to_yojson
          x.disassociate_lifecycle_config );
      ( "LifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson x.lifecycle_config_name
      );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("PlatformIdentifier", option_to_yojson platform_identifier_to_yojson x.platform_identifier);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
    ]

let monitoring_schedule_arn_to_yojson = string_to_yojson

let update_monitoring_schedule_response_to_yojson (x : update_monitoring_schedule_response) =
  assoc_to_yojson
    [
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
    ]

let monitoring_schedule_name_to_yojson = string_to_yojson
let schedule_expression_to_yojson = string_to_yojson

let schedule_config_to_yojson (x : schedule_config) =
  assoc_to_yojson
    [
      ("DataAnalysisEndTime", option_to_yojson string__to_yojson x.data_analysis_end_time);
      ("DataAnalysisStartTime", option_to_yojson string__to_yojson x.data_analysis_start_time);
      ("ScheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression));
    ]

let processing_job_name_to_yojson = string_to_yojson

let monitoring_constraints_resource_to_yojson (x : monitoring_constraints_resource) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri) ]

let monitoring_statistics_resource_to_yojson (x : monitoring_statistics_resource) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri) ]

let monitoring_baseline_config_to_yojson (x : monitoring_baseline_config) =
  assoc_to_yojson
    [
      ( "StatisticsResource",
        option_to_yojson monitoring_statistics_resource_to_yojson x.statistics_resource );
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
    ]

let endpoint_name_to_yojson = string_to_yojson
let processing_local_path_to_yojson = string_to_yojson

let processing_s3_input_mode_to_yojson (x : processing_s3_input_mode) =
  match x with FILE -> `String "File" | PIPE -> `String "Pipe"

let processing_s3_data_distribution_type_to_yojson (x : processing_s3_data_distribution_type) =
  match x with
  | SHARDEDBYS3KEY -> `String "ShardedByS3Key"
  | FULLYREPLICATED -> `String "FullyReplicated"

let probability_threshold_attribute_to_yojson = double_to_yojson
let monitoring_time_offset_string_to_yojson = string_to_yojson
let exclude_features_attribute_to_yojson = string_to_yojson

let endpoint_input_to_yojson (x : endpoint_input) =
  assoc_to_yojson
    [
      ( "ExcludeFeaturesAttribute",
        option_to_yojson exclude_features_attribute_to_yojson x.exclude_features_attribute );
      ("EndTimeOffset", option_to_yojson monitoring_time_offset_string_to_yojson x.end_time_offset);
      ( "StartTimeOffset",
        option_to_yojson monitoring_time_offset_string_to_yojson x.start_time_offset );
      ( "ProbabilityThresholdAttribute",
        option_to_yojson probability_threshold_attribute_to_yojson x.probability_threshold_attribute
      );
      ("ProbabilityAttribute", option_to_yojson string__to_yojson x.probability_attribute);
      ("InferenceAttribute", option_to_yojson string__to_yojson x.inference_attribute);
      ("FeaturesAttribute", option_to_yojson string__to_yojson x.features_attribute);
      ( "S3DataDistributionType",
        option_to_yojson processing_s3_data_distribution_type_to_yojson x.s3_data_distribution_type
      );
      ("S3InputMode", option_to_yojson processing_s3_input_mode_to_yojson x.s3_input_mode);
      ("LocalPath", Some (processing_local_path_to_yojson x.local_path));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let destination_s3_uri_to_yojson = string_to_yojson

let monitoring_csv_dataset_format_to_yojson (x : monitoring_csv_dataset_format) =
  assoc_to_yojson [ ("Header", option_to_yojson boolean__to_yojson x.header) ]

let monitoring_json_dataset_format_to_yojson (x : monitoring_json_dataset_format) =
  assoc_to_yojson [ ("Line", option_to_yojson boolean__to_yojson x.line) ]

let monitoring_parquet_dataset_format_to_yojson = unit_to_yojson

let monitoring_dataset_format_to_yojson (x : monitoring_dataset_format) =
  assoc_to_yojson
    [
      ("Parquet", option_to_yojson monitoring_parquet_dataset_format_to_yojson x.parquet);
      ("Json", option_to_yojson monitoring_json_dataset_format_to_yojson x.json);
      ("Csv", option_to_yojson monitoring_csv_dataset_format_to_yojson x.csv);
    ]

let batch_transform_input_to_yojson (x : batch_transform_input) =
  assoc_to_yojson
    [
      ( "ExcludeFeaturesAttribute",
        option_to_yojson exclude_features_attribute_to_yojson x.exclude_features_attribute );
      ("EndTimeOffset", option_to_yojson monitoring_time_offset_string_to_yojson x.end_time_offset);
      ( "StartTimeOffset",
        option_to_yojson monitoring_time_offset_string_to_yojson x.start_time_offset );
      ( "ProbabilityThresholdAttribute",
        option_to_yojson probability_threshold_attribute_to_yojson x.probability_threshold_attribute
      );
      ("ProbabilityAttribute", option_to_yojson string__to_yojson x.probability_attribute);
      ("InferenceAttribute", option_to_yojson string__to_yojson x.inference_attribute);
      ("FeaturesAttribute", option_to_yojson string__to_yojson x.features_attribute);
      ( "S3DataDistributionType",
        option_to_yojson processing_s3_data_distribution_type_to_yojson x.s3_data_distribution_type
      );
      ("S3InputMode", option_to_yojson processing_s3_input_mode_to_yojson x.s3_input_mode);
      ("LocalPath", Some (processing_local_path_to_yojson x.local_path));
      ("DatasetFormat", Some (monitoring_dataset_format_to_yojson x.dataset_format));
      ( "DataCapturedDestinationS3Uri",
        Some (destination_s3_uri_to_yojson x.data_captured_destination_s3_uri) );
    ]

let monitoring_input_to_yojson (x : monitoring_input) =
  assoc_to_yojson
    [
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
    ]

let monitoring_inputs_to_yojson tree = list_to_yojson monitoring_input_to_yojson tree
let monitoring_s3_uri_to_yojson = string_to_yojson

let processing_s3_upload_mode_to_yojson (x : processing_s3_upload_mode) =
  match x with END_OF_JOB -> `String "EndOfJob" | CONTINUOUS -> `String "Continuous"

let monitoring_s3_output_to_yojson (x : monitoring_s3_output) =
  assoc_to_yojson
    [
      ("S3UploadMode", option_to_yojson processing_s3_upload_mode_to_yojson x.s3_upload_mode);
      ("LocalPath", Some (processing_local_path_to_yojson x.local_path));
      ("S3Uri", Some (monitoring_s3_uri_to_yojson x.s3_uri));
    ]

let monitoring_output_to_yojson (x : monitoring_output) =
  assoc_to_yojson [ ("S3Output", Some (monitoring_s3_output_to_yojson x.s3_output)) ]

let monitoring_outputs_to_yojson tree = list_to_yojson monitoring_output_to_yojson tree

let monitoring_output_config_to_yojson (x : monitoring_output_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("MonitoringOutputs", Some (monitoring_outputs_to_yojson x.monitoring_outputs));
    ]

let processing_instance_count_to_yojson = int_to_yojson
let processing_volume_size_in_g_b_to_yojson = int_to_yojson

let monitoring_cluster_config_to_yojson (x : monitoring_cluster_config) =
  assoc_to_yojson
    [
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VolumeSizeInGB", Some (processing_volume_size_in_g_b_to_yojson x.volume_size_in_g_b));
      ("InstanceType", Some (processing_instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (processing_instance_count_to_yojson x.instance_count));
    ]

let monitoring_resources_to_yojson (x : monitoring_resources) =
  assoc_to_yojson [ ("ClusterConfig", Some (monitoring_cluster_config_to_yojson x.cluster_config)) ]

let image_uri_to_yojson = string_to_yojson
let container_entrypoint_string_to_yojson = string_to_yojson
let container_entrypoint_to_yojson tree = list_to_yojson container_entrypoint_string_to_yojson tree
let container_argument_to_yojson = string_to_yojson
let monitoring_container_arguments_to_yojson tree = list_to_yojson container_argument_to_yojson tree

let monitoring_app_specification_to_yojson (x : monitoring_app_specification) =
  assoc_to_yojson
    [
      ( "PostAnalyticsProcessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.post_analytics_processor_source_uri );
      ( "RecordPreprocessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.record_preprocessor_source_uri );
      ( "ContainerArguments",
        option_to_yojson monitoring_container_arguments_to_yojson x.container_arguments );
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
    ]

let monitoring_max_runtime_in_seconds_to_yojson = int_to_yojson

let monitoring_stopping_condition_to_yojson (x : monitoring_stopping_condition) =
  assoc_to_yojson
    [
      ( "MaxRuntimeInSeconds",
        Some (monitoring_max_runtime_in_seconds_to_yojson x.max_runtime_in_seconds) );
    ]

let processing_environment_value_to_yojson = string_to_yojson
let processing_environment_key_to_yojson = string_to_yojson

let monitoring_environment_map_to_yojson tree =
  map_to_yojson processing_environment_key_to_yojson processing_environment_value_to_yojson tree

let network_config_to_yojson (x : network_config) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
    ]

let monitoring_job_definition_to_yojson (x : monitoring_job_definition) =
  assoc_to_yojson
    [
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ( "MonitoringAppSpecification",
        Some (monitoring_app_specification_to_yojson x.monitoring_app_specification) );
      ("MonitoringResources", Some (monitoring_resources_to_yojson x.monitoring_resources));
      ( "MonitoringOutputConfig",
        Some (monitoring_output_config_to_yojson x.monitoring_output_config) );
      ("MonitoringInputs", Some (monitoring_inputs_to_yojson x.monitoring_inputs));
      ("BaselineConfig", option_to_yojson monitoring_baseline_config_to_yojson x.baseline_config);
    ]

let monitoring_job_definition_name_to_yojson = string_to_yojson

let monitoring_type_to_yojson (x : monitoring_type) =
  match x with
  | MODEL_EXPLAINABILITY -> `String "ModelExplainability"
  | MODEL_BIAS -> `String "ModelBias"
  | MODEL_QUALITY -> `String "ModelQuality"
  | DATA_QUALITY -> `String "DataQuality"

let monitoring_schedule_config_to_yojson (x : monitoring_schedule_config) =
  assoc_to_yojson
    [
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ( "MonitoringJobDefinition",
        option_to_yojson monitoring_job_definition_to_yojson x.monitoring_job_definition );
      ("ScheduleConfig", option_to_yojson schedule_config_to_yojson x.schedule_config);
    ]

let update_monitoring_schedule_request_to_yojson (x : update_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleConfig",
        Some (monitoring_schedule_config_to_yojson x.monitoring_schedule_config) );
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let monitoring_alert_name_to_yojson = string_to_yojson

let update_monitoring_alert_response_to_yojson (x : update_monitoring_alert_response) =
  assoc_to_yojson
    [
      ( "MonitoringAlertName",
        option_to_yojson monitoring_alert_name_to_yojson x.monitoring_alert_name );
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
    ]

let monitoring_datapoints_to_alert_to_yojson = int_to_yojson
let monitoring_evaluation_period_to_yojson = int_to_yojson

let update_monitoring_alert_request_to_yojson (x : update_monitoring_alert_request) =
  assoc_to_yojson
    [
      ("EvaluationPeriod", Some (monitoring_evaluation_period_to_yojson x.evaluation_period));
      ("DatapointsToAlert", Some (monitoring_datapoints_to_alert_to_yojson x.datapoints_to_alert));
      ("MonitoringAlertName", Some (monitoring_alert_name_to_yojson x.monitoring_alert_name));
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let model_package_arn_to_yojson = string_to_yojson

let update_model_package_output_to_yojson (x : update_model_package_output) =
  assoc_to_yojson [ ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn)) ]

let model_approval_status_to_yojson (x : model_approval_status) =
  match x with
  | PENDING_MANUAL_APPROVAL -> `String "PendingManualApproval"
  | REJECTED -> `String "Rejected"
  | APPROVED -> `String "Approved"

let model_package_registration_type_to_yojson (x : model_package_registration_type) =
  match x with REGISTERED -> `String "Registered" | LOGGED -> `String "Logged"

let approval_description_to_yojson = string_to_yojson
let customer_metadata_value_to_yojson = string_to_yojson
let customer_metadata_key_to_yojson = string_to_yojson

let customer_metadata_map_to_yojson tree =
  map_to_yojson customer_metadata_key_to_yojson customer_metadata_value_to_yojson tree

let customer_metadata_key_list_to_yojson tree = list_to_yojson customer_metadata_key_to_yojson tree
let entity_name_to_yojson = string_to_yojson
let container_hostname_to_yojson = string_to_yojson
let container_image_to_yojson = string_to_yojson
let image_digest_to_yojson = string_to_yojson
let s3_model_uri_to_yojson = string_to_yojson

let s3_model_data_type_to_yojson (x : s3_model_data_type) =
  match x with S3Object -> `String "S3Object" | S3Prefix -> `String "S3Prefix"

let model_compression_type_to_yojson (x : model_compression_type) =
  match x with Gzip -> `String "Gzip" | None_ -> `String "None"

let accept_eula_to_yojson = bool_to_yojson

let model_access_config_to_yojson (x : model_access_config) =
  assoc_to_yojson [ ("AcceptEula", Some (accept_eula_to_yojson x.accept_eula)) ]

let hub_content_arn_to_yojson = string_to_yojson

let inference_hub_access_config_to_yojson (x : inference_hub_access_config) =
  assoc_to_yojson [ ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn)) ]

let s3_model_data_source_to_yojson (x : s3_model_data_source) =
  assoc_to_yojson
    [
      ("ManifestEtag", option_to_yojson string__to_yojson x.manifest_etag);
      ("ETag", option_to_yojson string__to_yojson x.e_tag);
      ("ManifestS3Uri", option_to_yojson s3_model_uri_to_yojson x.manifest_s3_uri);
      ("HubAccessConfig", option_to_yojson inference_hub_access_config_to_yojson x.hub_access_config);
      ("ModelAccessConfig", option_to_yojson model_access_config_to_yojson x.model_access_config);
      ("CompressionType", Some (model_compression_type_to_yojson x.compression_type));
      ("S3DataType", Some (s3_model_data_type_to_yojson x.s3_data_type));
      ("S3Uri", Some (s3_model_uri_to_yojson x.s3_uri));
    ]

let model_data_source_to_yojson (x : model_data_source) =
  assoc_to_yojson
    [ ("S3DataSource", option_to_yojson s3_model_data_source_to_yojson x.s3_data_source) ]

let product_id_to_yojson = string_to_yojson
let environment_value_to_yojson = string_to_yojson
let environment_key_to_yojson = string_to_yojson

let environment_map_to_yojson tree =
  map_to_yojson environment_key_to_yojson environment_value_to_yojson tree

let data_input_config_to_yojson = string_to_yojson

let model_input_to_yojson (x : model_input) =
  assoc_to_yojson [ ("DataInputConfig", Some (data_input_config_to_yojson x.data_input_config)) ]

let model_package_framework_version_to_yojson = string_to_yojson
let additional_model_channel_name_to_yojson = string_to_yojson

let additional_model_data_source_to_yojson (x : additional_model_data_source) =
  assoc_to_yojson
    [
      ("S3DataSource", Some (s3_model_data_source_to_yojson x.s3_data_source));
      ("ChannelName", Some (additional_model_channel_name_to_yojson x.channel_name));
    ]

let additional_model_data_sources_to_yojson tree =
  list_to_yojson additional_model_data_source_to_yojson tree

let additional_s3_data_source_data_type_to_yojson (x : additional_s3_data_source_data_type) =
  match x with S3PREFIX -> `String "S3Prefix" | S3OBJECT -> `String "S3Object"

let compression_type_to_yojson (x : compression_type) =
  match x with GZIP -> `String "Gzip" | NONE -> `String "None"

let additional_s3_data_source_to_yojson (x : additional_s3_data_source) =
  assoc_to_yojson
    [
      ("ETag", option_to_yojson string__to_yojson x.e_tag);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("S3DataType", Some (additional_s3_data_source_data_type_to_yojson x.s3_data_type));
    ]

let hub_content_name_to_yojson = string_to_yojson
let hub_content_version_to_yojson = string_to_yojson
let recipe_name_to_yojson = string_to_yojson

let base_model_to_yojson (x : base_model) =
  assoc_to_yojson
    [
      ("RecipeName", option_to_yojson recipe_name_to_yojson x.recipe_name);
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
      ("HubContentName", option_to_yojson hub_content_name_to_yojson x.hub_content_name);
    ]

let model_package_container_definition_to_yojson (x : model_package_container_definition) =
  assoc_to_yojson
    [
      ("BaseModel", option_to_yojson base_model_to_yojson x.base_model);
      ("IsCheckpoint", option_to_yojson boolean__to_yojson x.is_checkpoint);
      ("ModelDataETag", option_to_yojson string__to_yojson x.model_data_e_tag);
      ( "AdditionalS3DataSource",
        option_to_yojson additional_s3_data_source_to_yojson x.additional_s3_data_source );
      ( "AdditionalModelDataSources",
        option_to_yojson additional_model_data_sources_to_yojson x.additional_model_data_sources );
      ("NearestModelName", option_to_yojson string__to_yojson x.nearest_model_name);
      ( "FrameworkVersion",
        option_to_yojson model_package_framework_version_to_yojson x.framework_version );
      ("Framework", option_to_yojson string__to_yojson x.framework);
      ("ModelInput", option_to_yojson model_input_to_yojson x.model_input);
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ("ModelDataSource", option_to_yojson model_data_source_to_yojson x.model_data_source);
      ("ModelDataUrl", option_to_yojson url_to_yojson x.model_data_url);
      ("ImageDigest", option_to_yojson image_digest_to_yojson x.image_digest);
      ("Image", option_to_yojson container_image_to_yojson x.image);
      ("ContainerHostname", option_to_yojson container_hostname_to_yojson x.container_hostname);
    ]

let model_package_container_definition_list_to_yojson tree =
  list_to_yojson model_package_container_definition_to_yojson tree

let transform_instance_type_to_yojson (x : transform_instance_type) =
  match x with
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"

let transform_instance_types_to_yojson tree = list_to_yojson transform_instance_type_to_yojson tree

let production_variant_instance_type_to_yojson (x : production_variant_instance_type) =
  match x with
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_C6IN_32XLARGE -> `String "ml.c6in.32xlarge"
  | ML_C6IN_24XLARGE -> `String "ml.c6in.24xlarge"
  | ML_C6IN_16XLARGE -> `String "ml.c6in.16xlarge"
  | ML_C6IN_12XLARGE -> `String "ml.c6in.12xlarge"
  | ML_C6IN_8XLARGE -> `String "ml.c6in.8xlarge"
  | ML_C6IN_4XLARGE -> `String "ml.c6in.4xlarge"
  | ML_C6IN_2XLARGE -> `String "ml.c6in.2xlarge"
  | ML_C6IN_XLARGE -> `String "ml.c6in.xlarge"
  | ML_C6IN_LARGE -> `String "ml.c6in.large"
  | ML_M8G_48XLARGE -> `String "ml.m8g.48xlarge"
  | ML_M8G_24XLARGE -> `String "ml.m8g.24xlarge"
  | ML_M8G_16XLARGE -> `String "ml.m8g.16xlarge"
  | ML_M8G_12XLARGE -> `String "ml.m8g.12xlarge"
  | ML_M8G_8XLARGE -> `String "ml.m8g.8xlarge"
  | ML_M8G_4XLARGE -> `String "ml.m8g.4xlarge"
  | ML_M8G_2XLARGE -> `String "ml.m8g.2xlarge"
  | ML_M8G_XLARGE -> `String "ml.m8g.xlarge"
  | ML_M8G_LARGE -> `String "ml.m8g.large"
  | ML_M8G_MEDIUM -> `String "ml.m8g.medium"
  | ML_R7GD_16XLARGE -> `String "ml.r7gd.16xlarge"
  | ML_R7GD_12XLARGE -> `String "ml.r7gd.12xlarge"
  | ML_R7GD_8XLARGE -> `String "ml.r7gd.8xlarge"
  | ML_R7GD_4XLARGE -> `String "ml.r7gd.4xlarge"
  | ML_R7GD_2XLARGE -> `String "ml.r7gd.2xlarge"
  | ML_R7GD_XLARGE -> `String "ml.r7gd.xlarge"
  | ML_R7GD_LARGE -> `String "ml.r7gd.large"
  | ML_R7GD_MEDIUM -> `String "ml.r7gd.medium"
  | ML_C8G_48XLARGE -> `String "ml.c8g.48xlarge"
  | ML_C8G_24XLARGE -> `String "ml.c8g.24xlarge"
  | ML_C8G_16XLARGE -> `String "ml.c8g.16xlarge"
  | ML_C8G_12XLARGE -> `String "ml.c8g.12xlarge"
  | ML_C8G_8XLARGE -> `String "ml.c8g.8xlarge"
  | ML_C8G_4XLARGE -> `String "ml.c8g.4xlarge"
  | ML_C8G_2XLARGE -> `String "ml.c8g.2xlarge"
  | ML_C8G_XLARGE -> `String "ml.c8g.xlarge"
  | ML_C8G_LARGE -> `String "ml.c8g.large"
  | ML_C8G_MEDIUM -> `String "ml.c8g.medium"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_R6GD_16XLARGE -> `String "ml.r6gd.16xlarge"
  | ML_R6GD_12XLARGE -> `String "ml.r6gd.12xlarge"
  | ML_R6GD_8XLARGE -> `String "ml.r6gd.8xlarge"
  | ML_R6GD_4XLARGE -> `String "ml.r6gd.4xlarge"
  | ML_R6GD_2XLARGE -> `String "ml.r6gd.2xlarge"
  | ML_R6GD_XLARGE -> `String "ml.r6gd.xlarge"
  | ML_R6GD_LARGE -> `String "ml.r6gd.large"
  | ML_R6G_16XLARGE -> `String "ml.r6g.16xlarge"
  | ML_R6G_12XLARGE -> `String "ml.r6g.12xlarge"
  | ML_R6G_8XLARGE -> `String "ml.r6g.8xlarge"
  | ML_R6G_4XLARGE -> `String "ml.r6g.4xlarge"
  | ML_R6G_2XLARGE -> `String "ml.r6g.2xlarge"
  | ML_R6G_XLARGE -> `String "ml.r6g.xlarge"
  | ML_R6G_LARGE -> `String "ml.r6g.large"
  | ML_C6GN_16XLARGE -> `String "ml.c6gn.16xlarge"
  | ML_C6GN_12XLARGE -> `String "ml.c6gn.12xlarge"
  | ML_C6GN_8XLARGE -> `String "ml.c6gn.8xlarge"
  | ML_C6GN_4XLARGE -> `String "ml.c6gn.4xlarge"
  | ML_C6GN_2XLARGE -> `String "ml.c6gn.2xlarge"
  | ML_C6GN_XLARGE -> `String "ml.c6gn.xlarge"
  | ML_C6GN_LARGE -> `String "ml.c6gn.large"
  | ML_C6GD_16XLARGE -> `String "ml.c6gd.16xlarge"
  | ML_C6GD_12XLARGE -> `String "ml.c6gd.12xlarge"
  | ML_C6GD_8XLARGE -> `String "ml.c6gd.8xlarge"
  | ML_C6GD_4XLARGE -> `String "ml.c6gd.4xlarge"
  | ML_C6GD_2XLARGE -> `String "ml.c6gd.2xlarge"
  | ML_C6GD_XLARGE -> `String "ml.c6gd.xlarge"
  | ML_C6GD_LARGE -> `String "ml.c6gd.large"
  | ML_C6G_16XLARGE -> `String "ml.c6g.16xlarge"
  | ML_C6G_12XLARGE -> `String "ml.c6g.12xlarge"
  | ML_C6G_8XLARGE -> `String "ml.c6g.8xlarge"
  | ML_C6G_4XLARGE -> `String "ml.c6g.4xlarge"
  | ML_C6G_2XLARGE -> `String "ml.c6g.2xlarge"
  | ML_C6G_XLARGE -> `String "ml.c6g.xlarge"
  | ML_C6G_LARGE -> `String "ml.c6g.large"
  | ML_M6GD_16XLARGE -> `String "ml.m6gd.16xlarge"
  | ML_M6GD_12XLARGE -> `String "ml.m6gd.12xlarge"
  | ML_M6GD_8XLARGE -> `String "ml.m6gd.8xlarge"
  | ML_M6GD_4XLARGE -> `String "ml.m6gd.4xlarge"
  | ML_M6GD_2XLARGE -> `String "ml.m6gd.2xlarge"
  | ML_M6GD_XLARGE -> `String "ml.m6gd.xlarge"
  | ML_M6GD_LARGE -> `String "ml.m6gd.large"
  | ML_M6G_16XLARGE -> `String "ml.m6g.16xlarge"
  | ML_M6G_12XLARGE -> `String "ml.m6g.12xlarge"
  | ML_M6G_8XLARGE -> `String "ml.m6g.8xlarge"
  | ML_M6G_4XLARGE -> `String "ml.m6g.4xlarge"
  | ML_M6G_2XLARGE -> `String "ml.m6g.2xlarge"
  | ML_M6G_XLARGE -> `String "ml.m6g.xlarge"
  | ML_M6G_LARGE -> `String "ml.m6g.large"
  | ML_C7G_16XLARGE -> `String "ml.c7g.16xlarge"
  | ML_C7G_12XLARGE -> `String "ml.c7g.12xlarge"
  | ML_C7G_8XLARGE -> `String "ml.c7g.8xlarge"
  | ML_C7G_4XLARGE -> `String "ml.c7g.4xlarge"
  | ML_C7G_2XLARGE -> `String "ml.c7g.2xlarge"
  | ML_C7G_XLARGE -> `String "ml.c7g.xlarge"
  | ML_C7G_LARGE -> `String "ml.c7g.large"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_R8G_48XLARGE -> `String "ml.r8g.48xlarge"
  | ML_R8G_24XLARGE -> `String "ml.r8g.24xlarge"
  | ML_R8G_16XLARGE -> `String "ml.r8g.16xlarge"
  | ML_R8G_12XLARGE -> `String "ml.r8g.12xlarge"
  | ML_R8G_8XLARGE -> `String "ml.r8g.8xlarge"
  | ML_R8G_4XLARGE -> `String "ml.r8g.4xlarge"
  | ML_R8G_2XLARGE -> `String "ml.r8g.2xlarge"
  | ML_R8G_XLARGE -> `String "ml.r8g.xlarge"
  | ML_R8G_LARGE -> `String "ml.r8g.large"
  | ML_R8G_MEDIUM -> `String "ml.r8g.medium"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_DL1_24XLARGE -> `String "ml.dl1.24xlarge"
  | ML_INF1_24XLARGE -> `String "ml.inf1.24xlarge"
  | ML_INF1_6XLARGE -> `String "ml.inf1.6xlarge"
  | ML_INF1_2XLARGE -> `String "ml.inf1.2xlarge"
  | ML_INF1_XLARGE -> `String "ml.inf1.xlarge"
  | ML_R5D_24XLARGE -> `String "ml.r5d.24xlarge"
  | ML_R5D_12XLARGE -> `String "ml.r5d.12xlarge"
  | ML_R5D_4XLARGE -> `String "ml.r5d.4xlarge"
  | ML_R5D_2XLARGE -> `String "ml.r5d.2xlarge"
  | ML_R5D_XLARGE -> `String "ml.r5d.xlarge"
  | ML_R5D_LARGE -> `String "ml.r5d.large"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_C5D_18XLARGE -> `String "ml.c5d.18xlarge"
  | ML_C5D_9XLARGE -> `String "ml.c5d.9xlarge"
  | ML_C5D_4XLARGE -> `String "ml.c5d.4xlarge"
  | ML_C5D_2XLARGE -> `String "ml.c5d.2xlarge"
  | ML_C5D_XLARGE -> `String "ml.c5d.xlarge"
  | ML_C5D_LARGE -> `String "ml.c5d.large"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_LARGE -> `String "ml.c5.large"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_C4_LARGE -> `String "ml.c4.large"
  | ML_M5D_24XLARGE -> `String "ml.m5d.24xlarge"
  | ML_M5D_12XLARGE -> `String "ml.m5d.12xlarge"
  | ML_M5D_4XLARGE -> `String "ml.m5d.4xlarge"
  | ML_M5D_2XLARGE -> `String "ml.m5d.2xlarge"
  | ML_M5D_XLARGE -> `String "ml.m5d.xlarge"
  | ML_M5D_LARGE -> `String "ml.m5d.large"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"
  | ML_T2_2XLARGE -> `String "ml.t2.2xlarge"
  | ML_T2_XLARGE -> `String "ml.t2.xlarge"
  | ML_T2_LARGE -> `String "ml.t2.large"
  | ML_T2_MEDIUM -> `String "ml.t2.medium"

let realtime_inference_instance_types_to_yojson tree =
  list_to_yojson production_variant_instance_type_to_yojson tree

let content_type_to_yojson = string_to_yojson
let content_types_to_yojson tree = list_to_yojson content_type_to_yojson tree
let response_mime_type_to_yojson = string_to_yojson
let response_mime_types_to_yojson tree = list_to_yojson response_mime_type_to_yojson tree

let additional_inference_specification_definition_to_yojson
    (x : additional_inference_specification_definition) =
  assoc_to_yojson
    [
      ( "SupportedResponseMIMETypes",
        option_to_yojson response_mime_types_to_yojson x.supported_response_mime_types );
      ("SupportedContentTypes", option_to_yojson content_types_to_yojson x.supported_content_types);
      ( "SupportedRealtimeInferenceInstanceTypes",
        option_to_yojson realtime_inference_instance_types_to_yojson
          x.supported_realtime_inference_instance_types );
      ( "SupportedTransformInstanceTypes",
        option_to_yojson transform_instance_types_to_yojson x.supported_transform_instance_types );
      ("Containers", Some (model_package_container_definition_list_to_yojson x.containers));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Name", Some (entity_name_to_yojson x.name));
    ]

let additional_inference_specifications_to_yojson tree =
  list_to_yojson additional_inference_specification_definition_to_yojson tree

let inference_specification_to_yojson (x : inference_specification) =
  assoc_to_yojson
    [
      ( "SupportedResponseMIMETypes",
        option_to_yojson response_mime_types_to_yojson x.supported_response_mime_types );
      ("SupportedContentTypes", option_to_yojson content_types_to_yojson x.supported_content_types);
      ( "SupportedRealtimeInferenceInstanceTypes",
        option_to_yojson realtime_inference_instance_types_to_yojson
          x.supported_realtime_inference_instance_types );
      ( "SupportedTransformInstanceTypes",
        option_to_yojson transform_instance_types_to_yojson x.supported_transform_instance_types );
      ("Containers", Some (model_package_container_definition_list_to_yojson x.containers));
    ]

let model_package_source_uri_to_yojson = string_to_yojson
let model_card_content_to_yojson = string_to_yojson

let model_card_status_to_yojson (x : model_card_status) =
  match x with
  | ARCHIVED -> `String "Archived"
  | APPROVED -> `String "Approved"
  | PENDINGREVIEW -> `String "PendingReview"
  | DRAFT -> `String "Draft"

let model_package_model_card_to_yojson (x : model_package_model_card) =
  assoc_to_yojson
    [
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("ModelCardContent", option_to_yojson model_card_content_to_yojson x.model_card_content);
    ]

let stage_description_to_yojson = string_to_yojson

let model_life_cycle_to_yojson (x : model_life_cycle) =
  assoc_to_yojson
    [
      ("StageDescription", option_to_yojson stage_description_to_yojson x.stage_description);
      ("StageStatus", Some (entity_name_to_yojson x.stage_status));
      ("Stage", Some (entity_name_to_yojson x.stage));
    ]

let update_model_package_input_to_yojson (x : update_model_package_input) =
  assoc_to_yojson
    [
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ( "AdditionalInferenceSpecificationsToAdd",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications_to_add );
      ( "CustomerMetadataPropertiesToRemove",
        option_to_yojson customer_metadata_key_list_to_yojson
          x.customer_metadata_properties_to_remove );
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ("ApprovalDescription", option_to_yojson approval_description_to_yojson x.approval_description);
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
    ]

let model_card_arn_to_yojson = string_to_yojson

let update_model_card_response_to_yojson (x : update_model_card_response) =
  assoc_to_yojson [ ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn)) ]

let model_card_name_or_arn_to_yojson = string_to_yojson

let update_model_card_request_to_yojson (x : update_model_card_request) =
  assoc_to_yojson
    [
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("Content", option_to_yojson model_card_content_to_yojson x.content);
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
    ]

let tracking_server_arn_to_yojson = string_to_yojson

let update_mlflow_tracking_server_response_to_yojson (x : update_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let tracking_server_name_to_yojson = string_to_yojson

let tracking_server_size_to_yojson (x : tracking_server_size) =
  match x with L -> `String "Large" | M -> `String "Medium" | S -> `String "Small"

let update_mlflow_tracking_server_request_to_yojson (x : update_mlflow_tracking_server_request) =
  assoc_to_yojson
    [
      ( "S3BucketOwnerVerification",
        option_to_yojson boolean__to_yojson x.s3_bucket_owner_verification );
      ("S3BucketOwnerAccountId", option_to_yojson account_id_to_yojson x.s3_bucket_owner_account_id);
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ( "AutomaticModelRegistration",
        option_to_yojson boolean__to_yojson x.automatic_model_registration );
      ("TrackingServerSize", option_to_yojson tracking_server_size_to_yojson x.tracking_server_size);
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name));
    ]

let mlflow_app_arn_to_yojson = string_to_yojson

let update_mlflow_app_response_to_yojson (x : update_mlflow_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn) ]

let mlflow_app_name_to_yojson = string_to_yojson

let model_registration_mode_to_yojson (x : model_registration_mode) =
  match x with
  | AUTO_MODEL_REGISTRATION_DISABLED -> `String "AutoModelRegistrationDisabled"
  | AUTO_MODEL_REGISTRATION_ENABLED -> `String "AutoModelRegistrationEnabled"

let default_domain_id_list_to_yojson tree = list_to_yojson domain_id_to_yojson tree

let account_default_status_to_yojson (x : account_default_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let update_mlflow_app_request_to_yojson (x : update_mlflow_app_request) =
  assoc_to_yojson
    [
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
      ( "DefaultDomainIdList",
        option_to_yojson default_domain_id_list_to_yojson x.default_domain_id_list );
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ( "ModelRegistrationMode",
        option_to_yojson model_registration_mode_to_yojson x.model_registration_mode );
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ("Name", option_to_yojson mlflow_app_name_to_yojson x.name);
      ("Arn", Some (mlflow_app_arn_to_yojson x.arn));
    ]

let inference_experiment_arn_to_yojson = string_to_yojson

let update_inference_experiment_response_to_yojson (x : update_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let inference_experiment_name_to_yojson = string_to_yojson

let inference_experiment_schedule_to_yojson (x : inference_experiment_schedule) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
    ]

let inference_experiment_description_to_yojson = string_to_yojson
let model_name_to_yojson = string_to_yojson
let model_variant_name_to_yojson = string_to_yojson

let model_infrastructure_type_to_yojson (x : model_infrastructure_type) =
  match x with REAL_TIME_INFERENCE -> `String "RealTimeInference"

let task_count_to_yojson = int_to_yojson

let real_time_inference_config_to_yojson (x : real_time_inference_config) =
  assoc_to_yojson
    [
      ("InstanceCount", Some (task_count_to_yojson x.instance_count));
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
    ]

let model_infrastructure_config_to_yojson (x : model_infrastructure_config) =
  assoc_to_yojson
    [
      ( "RealTimeInferenceConfig",
        Some (real_time_inference_config_to_yojson x.real_time_inference_config) );
      ("InfrastructureType", Some (model_infrastructure_type_to_yojson x.infrastructure_type));
    ]

let model_variant_config_to_yojson (x : model_variant_config) =
  assoc_to_yojson
    [
      ("InfrastructureConfig", Some (model_infrastructure_config_to_yojson x.infrastructure_config));
      ("VariantName", Some (model_variant_name_to_yojson x.variant_name));
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let model_variant_config_list_to_yojson tree = list_to_yojson model_variant_config_to_yojson tree
let csv_content_type_to_yojson = string_to_yojson
let csv_content_types_to_yojson tree = list_to_yojson csv_content_type_to_yojson tree
let json_content_type_to_yojson = string_to_yojson
let json_content_types_to_yojson tree = list_to_yojson json_content_type_to_yojson tree

let capture_content_type_header_to_yojson (x : capture_content_type_header) =
  assoc_to_yojson
    [
      ("JsonContentTypes", option_to_yojson json_content_types_to_yojson x.json_content_types);
      ("CsvContentTypes", option_to_yojson csv_content_types_to_yojson x.csv_content_types);
    ]

let inference_experiment_data_storage_config_to_yojson
    (x : inference_experiment_data_storage_config) =
  assoc_to_yojson
    [
      ("ContentType", option_to_yojson capture_content_type_header_to_yojson x.content_type);
      ("KmsKey", option_to_yojson kms_key_id_to_yojson x.kms_key);
      ("Destination", Some (destination_s3_uri_to_yojson x.destination));
    ]

let percentage_to_yojson = int_to_yojson

let shadow_model_variant_config_to_yojson (x : shadow_model_variant_config) =
  assoc_to_yojson
    [
      ("SamplingPercentage", Some (percentage_to_yojson x.sampling_percentage));
      ("ShadowModelVariantName", Some (model_variant_name_to_yojson x.shadow_model_variant_name));
    ]

let shadow_model_variant_config_list_to_yojson tree =
  list_to_yojson shadow_model_variant_config_to_yojson tree

let shadow_mode_config_to_yojson (x : shadow_mode_config) =
  assoc_to_yojson
    [
      ( "ShadowModelVariants",
        Some (shadow_model_variant_config_list_to_yojson x.shadow_model_variants) );
      ("SourceModelVariantName", Some (model_variant_name_to_yojson x.source_model_variant_name));
    ]

let update_inference_experiment_request_to_yojson (x : update_inference_experiment_request) =
  assoc_to_yojson
    [
      ("ShadowModeConfig", option_to_yojson shadow_mode_config_to_yojson x.shadow_mode_config);
      ( "DataStorageConfig",
        option_to_yojson inference_experiment_data_storage_config_to_yojson x.data_storage_config );
      ("ModelVariants", option_to_yojson model_variant_config_list_to_yojson x.model_variants);
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Name", Some (inference_experiment_name_to_yojson x.name));
    ]

let inference_component_arn_to_yojson = string_to_yojson

let update_inference_component_runtime_config_output_to_yojson
    (x : update_inference_component_runtime_config_output) =
  assoc_to_yojson
    [
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
    ]

let inference_component_name_to_yojson = string_to_yojson
let inference_component_copy_count_to_yojson = int_to_yojson

let inference_component_runtime_config_to_yojson (x : inference_component_runtime_config) =
  assoc_to_yojson [ ("CopyCount", Some (inference_component_copy_count_to_yojson x.copy_count)) ]

let update_inference_component_runtime_config_input_to_yojson
    (x : update_inference_component_runtime_config_input) =
  assoc_to_yojson
    [
      ( "DesiredRuntimeConfig",
        Some (inference_component_runtime_config_to_yojson x.desired_runtime_config) );
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let update_inference_component_output_to_yojson (x : update_inference_component_output) =
  assoc_to_yojson
    [
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
    ]

let metrics_endpoint_path_to_yojson = string_to_yojson

let metric_publish_frequency_in_seconds_to_yojson (x : metric_publish_frequency_in_seconds) =
  match x with
  | FREQ_300_S -> `Int 300
  | FREQ_240_S -> `Int 240
  | FREQ_180_S -> `Int 180
  | FREQ_120_S -> `Int 120
  | FREQ_60_S -> `Int 60
  | FREQ_30_S -> `Int 30
  | FREQ_10_S -> `Int 10

let metrics_endpoint_to_yojson (x : metrics_endpoint) =
  assoc_to_yojson
    [
      ( "MetricPublishFrequencyInSeconds",
        option_to_yojson metric_publish_frequency_in_seconds_to_yojson
          x.metric_publish_frequency_in_seconds );
      ("MetricsEndpointPath", Some (metrics_endpoint_path_to_yojson x.metrics_endpoint_path));
    ]

let metrics_endpoint_list_to_yojson tree = list_to_yojson metrics_endpoint_to_yojson tree

let container_metrics_config_to_yojson (x : container_metrics_config) =
  assoc_to_yojson
    [ ("MetricsEndpoints", option_to_yojson metrics_endpoint_list_to_yojson x.metrics_endpoints) ]

let inference_component_container_specification_to_yojson
    (x : inference_component_container_specification) =
  assoc_to_yojson
    [
      ( "ContainerMetricsConfig",
        option_to_yojson container_metrics_config_to_yojson x.container_metrics_config );
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ("ArtifactUrl", option_to_yojson url_to_yojson x.artifact_url);
      ("Image", option_to_yojson container_image_to_yojson x.image);
    ]

let production_variant_model_data_download_timeout_in_seconds_to_yojson = int_to_yojson
let production_variant_container_startup_health_check_timeout_in_seconds_to_yojson = int_to_yojson

let inference_component_startup_parameters_to_yojson (x : inference_component_startup_parameters) =
  assoc_to_yojson
    [
      ( "ContainerStartupHealthCheckTimeoutInSeconds",
        option_to_yojson
          production_variant_container_startup_health_check_timeout_in_seconds_to_yojson
          x.container_startup_health_check_timeout_in_seconds );
      ( "ModelDataDownloadTimeoutInSeconds",
        option_to_yojson production_variant_model_data_download_timeout_in_seconds_to_yojson
          x.model_data_download_timeout_in_seconds );
    ]

let number_of_cpu_cores_to_yojson = float_to_yojson
let number_of_accelerator_devices_to_yojson = float_to_yojson
let memory_in_mb_to_yojson = int_to_yojson

let inference_component_compute_resource_requirements_to_yojson
    (x : inference_component_compute_resource_requirements) =
  assoc_to_yojson
    [
      ("MaxMemoryRequiredInMb", option_to_yojson memory_in_mb_to_yojson x.max_memory_required_in_mb);
      ("MinMemoryRequiredInMb", Some (memory_in_mb_to_yojson x.min_memory_required_in_mb));
      ( "NumberOfAcceleratorDevicesRequired",
        option_to_yojson number_of_accelerator_devices_to_yojson
          x.number_of_accelerator_devices_required );
      ( "NumberOfCpuCoresRequired",
        option_to_yojson number_of_cpu_cores_to_yojson x.number_of_cpu_cores_required );
    ]

let enable_caching_to_yojson = bool_to_yojson

let inference_component_data_cache_config_to_yojson (x : inference_component_data_cache_config) =
  assoc_to_yojson [ ("EnableCaching", Some (enable_caching_to_yojson x.enable_caching)) ]

let inference_component_placement_strategy_to_yojson (x : inference_component_placement_strategy) =
  match x with BINPACK -> `String "BINPACK" | SPREAD -> `String "SPREAD"

let availability_zone_balance_enforcement_mode_to_yojson
    (x : availability_zone_balance_enforcement_mode) =
  match x with PERMISSIVE -> `String "PERMISSIVE"

let availability_zone_balance_max_imbalance_to_yojson = int_to_yojson

let inference_component_availability_zone_balance_to_yojson
    (x : inference_component_availability_zone_balance) =
  assoc_to_yojson
    [
      ( "MaxImbalance",
        option_to_yojson availability_zone_balance_max_imbalance_to_yojson x.max_imbalance );
      ( "EnforcementMode",
        Some (availability_zone_balance_enforcement_mode_to_yojson x.enforcement_mode) );
    ]

let inference_component_scheduling_config_to_yojson (x : inference_component_scheduling_config) =
  assoc_to_yojson
    [
      ( "AvailabilityZoneBalance",
        option_to_yojson inference_component_availability_zone_balance_to_yojson
          x.availability_zone_balance );
      ( "PlacementStrategy",
        Some (inference_component_placement_strategy_to_yojson x.placement_strategy) );
    ]

let inference_component_specification_to_yojson (x : inference_component_specification) =
  assoc_to_yojson
    [
      ( "SchedulingConfig",
        option_to_yojson inference_component_scheduling_config_to_yojson x.scheduling_config );
      ( "DataCacheConfig",
        option_to_yojson inference_component_data_cache_config_to_yojson x.data_cache_config );
      ( "BaseInferenceComponentName",
        option_to_yojson inference_component_name_to_yojson x.base_inference_component_name );
      ( "ComputeResourceRequirements",
        option_to_yojson inference_component_compute_resource_requirements_to_yojson
          x.compute_resource_requirements );
      ( "StartupParameters",
        option_to_yojson inference_component_startup_parameters_to_yojson x.startup_parameters );
      ( "Container",
        option_to_yojson inference_component_container_specification_to_yojson x.container );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
    ]

let inference_component_specification_list_to_yojson tree =
  list_to_yojson inference_component_specification_to_yojson tree

let inference_component_capacity_size_type_to_yojson (x : inference_component_capacity_size_type) =
  match x with CAPACITY_PERCENT -> `String "CAPACITY_PERCENT" | COPY_COUNT -> `String "COPY_COUNT"

let capacity_size_value_to_yojson = int_to_yojson

let inference_component_capacity_size_to_yojson (x : inference_component_capacity_size) =
  assoc_to_yojson
    [
      ("Value", Some (capacity_size_value_to_yojson x.value));
      ("Type", Some (inference_component_capacity_size_type_to_yojson x.type_));
    ]

let maximum_execution_timeout_in_seconds_to_yojson = int_to_yojson

let inference_component_rolling_update_policy_to_yojson
    (x : inference_component_rolling_update_policy) =
  assoc_to_yojson
    [
      ( "RollbackMaximumBatchSize",
        option_to_yojson inference_component_capacity_size_to_yojson x.rollback_maximum_batch_size
      );
      ( "MaximumExecutionTimeoutInSeconds",
        option_to_yojson maximum_execution_timeout_in_seconds_to_yojson
          x.maximum_execution_timeout_in_seconds );
      ("WaitIntervalInSeconds", Some (wait_interval_in_seconds_to_yojson x.wait_interval_in_seconds));
      ("MaximumBatchSize", Some (inference_component_capacity_size_to_yojson x.maximum_batch_size));
    ]

let alarm_name_to_yojson = string_to_yojson

let alarm_to_yojson (x : alarm) =
  assoc_to_yojson [ ("AlarmName", option_to_yojson alarm_name_to_yojson x.alarm_name) ]

let alarm_list_to_yojson tree = list_to_yojson alarm_to_yojson tree

let auto_rollback_config_to_yojson (x : auto_rollback_config) =
  assoc_to_yojson [ ("Alarms", option_to_yojson alarm_list_to_yojson x.alarms) ]

let inference_component_deployment_config_to_yojson (x : inference_component_deployment_config) =
  assoc_to_yojson
    [
      ( "AutoRollbackConfiguration",
        option_to_yojson auto_rollback_config_to_yojson x.auto_rollback_configuration );
      ( "RollingUpdatePolicy",
        Some (inference_component_rolling_update_policy_to_yojson x.rolling_update_policy) );
    ]

let update_inference_component_input_to_yojson (x : update_inference_component_input) =
  assoc_to_yojson
    [
      ( "DeploymentConfig",
        option_to_yojson inference_component_deployment_config_to_yojson x.deployment_config );
      ( "RuntimeConfig",
        option_to_yojson inference_component_runtime_config_to_yojson x.runtime_config );
      ( "Specifications",
        option_to_yojson inference_component_specification_list_to_yojson x.specifications );
      ("Specification", option_to_yojson inference_component_specification_to_yojson x.specification);
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let update_image_version_response_to_yojson (x : update_image_version_response) =
  assoc_to_yojson
    [ ("ImageVersionArn", option_to_yojson image_version_arn_to_yojson x.image_version_arn) ]

let sage_maker_image_version_alias_to_yojson = string_to_yojson

let sage_maker_image_version_aliases_to_yojson tree =
  list_to_yojson sage_maker_image_version_alias_to_yojson tree

let job_type_to_yojson (x : job_type) =
  match x with
  | NOTEBOOK_KERNEL -> `String "NOTEBOOK_KERNEL"
  | INFERENCE -> `String "INFERENCE"
  | TRAINING -> `String "TRAINING"

let ml_framework_to_yojson = string_to_yojson
let programming_lang_to_yojson = string_to_yojson
let processor_to_yojson (x : processor) = match x with GPU -> `String "GPU" | CPU -> `String "CPU"
let horovod_to_yojson = bool_to_yojson
let release_notes_to_yojson = string_to_yojson

let update_image_version_request_to_yojson (x : update_image_version_request) =
  assoc_to_yojson
    [
      ("ReleaseNotes", option_to_yojson release_notes_to_yojson x.release_notes);
      ("Horovod", option_to_yojson horovod_to_yojson x.horovod);
      ("Processor", option_to_yojson processor_to_yojson x.processor);
      ("ProgrammingLang", option_to_yojson programming_lang_to_yojson x.programming_lang);
      ("MLFramework", option_to_yojson ml_framework_to_yojson x.ml_framework);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("VendorGuidance", option_to_yojson vendor_guidance_to_yojson x.vendor_guidance);
      ( "AliasesToDelete",
        option_to_yojson sage_maker_image_version_aliases_to_yojson x.aliases_to_delete );
      ("AliasesToAdd", option_to_yojson sage_maker_image_version_aliases_to_yojson x.aliases_to_add);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
      ("ImageName", Some (image_name_to_yojson x.image_name));
    ]

let update_image_response_to_yojson (x : update_image_response) =
  assoc_to_yojson [ ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn) ]

let image_delete_property_to_yojson = string_to_yojson
let image_delete_property_list_to_yojson tree = list_to_yojson image_delete_property_to_yojson tree
let image_description_to_yojson = string_to_yojson
let image_display_name_to_yojson = string_to_yojson

let update_image_request_to_yojson (x : update_image_request) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson image_description_to_yojson x.description);
      ("DeleteProperties", option_to_yojson image_delete_property_list_to_yojson x.delete_properties);
    ]

let hub_arn_to_yojson = string_to_yojson

let update_hub_response_to_yojson (x : update_hub_response) =
  assoc_to_yojson [ ("HubArn", Some (hub_arn_to_yojson x.hub_arn)) ]

let hub_name_or_arn_to_yojson = string_to_yojson
let hub_description_to_yojson = string_to_yojson
let hub_display_name_to_yojson = string_to_yojson
let hub_search_keyword_to_yojson = string_to_yojson
let hub_search_keyword_list_to_yojson tree = list_to_yojson hub_search_keyword_to_yojson tree

let update_hub_request_to_yojson (x : update_hub_request) =
  assoc_to_yojson
    [
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubDescription", option_to_yojson hub_description_to_yojson x.hub_description);
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let update_hub_content_response_to_yojson (x : update_hub_content_response) =
  assoc_to_yojson
    [
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
    ]

let hub_content_type_to_yojson (x : hub_content_type) =
  match x with
  | JSON_DOC -> `String "JsonDoc"
  | DATA_SET -> `String "DataSet"
  | MODEL_REFERENCE -> `String "ModelReference"
  | NOTEBOOK -> `String "Notebook"
  | MODEL -> `String "Model"

let hub_content_display_name_to_yojson = string_to_yojson
let hub_content_description_to_yojson = string_to_yojson
let hub_content_markdown_to_yojson = string_to_yojson
let hub_content_search_keyword_to_yojson = string_to_yojson

let hub_content_search_keyword_list_to_yojson tree =
  list_to_yojson hub_content_search_keyword_to_yojson tree

let hub_content_support_status_to_yojson (x : hub_content_support_status) =
  match x with
  | RESTRICTED -> `String "Restricted"
  | DEPRECATED -> `String "Deprecated"
  | SUPPORTED -> `String "Supported"

let update_hub_content_request_to_yojson (x : update_hub_content_request) =
  assoc_to_yojson
    [
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ("HubContentMarkdown", option_to_yojson hub_content_markdown_to_yojson x.hub_content_markdown);
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let update_hub_content_reference_response_to_yojson (x : update_hub_content_reference_response) =
  assoc_to_yojson
    [
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
    ]

let update_hub_content_reference_request_to_yojson (x : update_hub_content_reference_request) =
  assoc_to_yojson
    [
      ("MinVersion", option_to_yojson hub_content_version_to_yojson x.min_version);
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let feature_group_name_or_arn_to_yojson = string_to_yojson
let feature_name_to_yojson = string_to_yojson
let feature_description_to_yojson = string_to_yojson
let feature_parameter_key_to_yojson = string_to_yojson
let feature_parameter_value_to_yojson = string_to_yojson

let feature_parameter_to_yojson (x : feature_parameter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson feature_parameter_value_to_yojson x.value);
      ("Key", option_to_yojson feature_parameter_key_to_yojson x.key);
    ]

let feature_parameter_additions_to_yojson tree = list_to_yojson feature_parameter_to_yojson tree
let feature_parameter_removals_to_yojson tree = list_to_yojson feature_parameter_key_to_yojson tree

let update_feature_metadata_request_to_yojson (x : update_feature_metadata_request) =
  assoc_to_yojson
    [
      ( "ParameterRemovals",
        option_to_yojson feature_parameter_removals_to_yojson x.parameter_removals );
      ( "ParameterAdditions",
        option_to_yojson feature_parameter_additions_to_yojson x.parameter_additions );
      ("Description", option_to_yojson feature_description_to_yojson x.description);
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
    ]

let feature_group_arn_to_yojson = string_to_yojson

let update_feature_group_response_to_yojson (x : update_feature_group_response) =
  assoc_to_yojson [ ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn)) ]

let feature_type_to_yojson (x : feature_type) =
  match x with
  | STRING -> `String "String"
  | FRACTIONAL -> `String "Fractional"
  | INTEGRAL -> `String "Integral"

let collection_type_to_yojson (x : collection_type) =
  match x with VECTOR -> `String "Vector" | SET -> `String "Set" | LIST -> `String "List"

let collection_config_to_yojson (x : collection_config) =
  match x with
  | VectorConfig arg -> assoc_to_yojson [ ("VectorConfig", Some (vector_config_to_yojson arg)) ]

let feature_definition_to_yojson (x : feature_definition) =
  assoc_to_yojson
    [
      ("CollectionConfig", option_to_yojson collection_config_to_yojson x.collection_config);
      ("CollectionType", option_to_yojson collection_type_to_yojson x.collection_type);
      ("FeatureType", Some (feature_type_to_yojson x.feature_type));
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
    ]

let feature_additions_to_yojson tree = list_to_yojson feature_definition_to_yojson tree

let ttl_duration_unit_to_yojson (x : ttl_duration_unit) =
  match x with
  | WEEKS -> `String "Weeks"
  | DAYS -> `String "Days"
  | HOURS -> `String "Hours"
  | MINUTES -> `String "Minutes"
  | SECONDS -> `String "Seconds"

let ttl_duration_value_to_yojson = int_to_yojson

let ttl_duration_to_yojson (x : ttl_duration) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson ttl_duration_value_to_yojson x.value);
      ("Unit", option_to_yojson ttl_duration_unit_to_yojson x.unit_);
    ]

let online_store_config_update_to_yojson (x : online_store_config_update) =
  assoc_to_yojson [ ("TtlDuration", option_to_yojson ttl_duration_to_yojson x.ttl_duration) ]

let throughput_mode_to_yojson (x : throughput_mode) =
  match x with PROVISIONED -> `String "Provisioned" | ON_DEMAND -> `String "OnDemand"

let capacity_unit_to_yojson = int_to_yojson

let throughput_config_update_to_yojson (x : throughput_config_update) =
  assoc_to_yojson
    [
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_write_capacity_units );
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_read_capacity_units );
      ("ThroughputMode", option_to_yojson throughput_mode_to_yojson x.throughput_mode);
    ]

let update_feature_group_request_to_yojson (x : update_feature_group_request) =
  assoc_to_yojson
    [
      ("ThroughputConfig", option_to_yojson throughput_config_update_to_yojson x.throughput_config);
      ( "OnlineStoreConfig",
        option_to_yojson online_store_config_update_to_yojson x.online_store_config );
      ("FeatureAdditions", option_to_yojson feature_additions_to_yojson x.feature_additions);
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
    ]

let experiment_arn_to_yojson = string_to_yojson

let update_experiment_response_to_yojson (x : update_experiment_response) =
  assoc_to_yojson [ ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn) ]

let experiment_description_to_yojson = string_to_yojson

let update_experiment_request_to_yojson (x : update_experiment_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name));
    ]

let endpoint_arn_to_yojson = string_to_yojson

let update_endpoint_weights_and_capacities_output_to_yojson
    (x : update_endpoint_weights_and_capacities_output) =
  assoc_to_yojson [ ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn)) ]

let serverless_max_concurrency_to_yojson = int_to_yojson
let serverless_provisioned_concurrency_to_yojson = int_to_yojson

let production_variant_serverless_update_config_to_yojson
    (x : production_variant_serverless_update_config) =
  assoc_to_yojson
    [
      ( "ProvisionedConcurrency",
        option_to_yojson serverless_provisioned_concurrency_to_yojson x.provisioned_concurrency );
      ("MaxConcurrency", option_to_yojson serverless_max_concurrency_to_yojson x.max_concurrency);
    ]

let desired_weight_and_capacity_to_yojson (x : desired_weight_and_capacity) =
  assoc_to_yojson
    [
      ( "ServerlessUpdateConfig",
        option_to_yojson production_variant_serverless_update_config_to_yojson
          x.serverless_update_config );
      ("DesiredInstanceCount", option_to_yojson task_count_to_yojson x.desired_instance_count);
      ("DesiredWeight", option_to_yojson variant_weight_to_yojson x.desired_weight);
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
    ]

let desired_weight_and_capacity_list_to_yojson tree =
  list_to_yojson desired_weight_and_capacity_to_yojson tree

let update_endpoint_weights_and_capacities_input_to_yojson
    (x : update_endpoint_weights_and_capacities_input) =
  assoc_to_yojson
    [
      ( "DesiredWeightsAndCapacities",
        Some (desired_weight_and_capacity_list_to_yojson x.desired_weights_and_capacities) );
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let update_endpoint_output_to_yojson (x : update_endpoint_output) =
  assoc_to_yojson [ ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn)) ]

let endpoint_config_name_to_yojson = string_to_yojson

let traffic_routing_config_type_to_yojson (x : traffic_routing_config_type) =
  match x with
  | LINEAR -> `String "LINEAR"
  | CANARY -> `String "CANARY"
  | ALL_AT_ONCE -> `String "ALL_AT_ONCE"

let capacity_size_type_to_yojson (x : capacity_size_type) =
  match x with
  | CAPACITY_PERCENT -> `String "CAPACITY_PERCENT"
  | INSTANCE_COUNT -> `String "INSTANCE_COUNT"

let capacity_size_to_yojson (x : capacity_size) =
  assoc_to_yojson
    [
      ("Value", Some (capacity_size_value_to_yojson x.value));
      ("Type", Some (capacity_size_type_to_yojson x.type_));
    ]

let traffic_routing_config_to_yojson (x : traffic_routing_config) =
  assoc_to_yojson
    [
      ("LinearStepSize", option_to_yojson capacity_size_to_yojson x.linear_step_size);
      ("CanarySize", option_to_yojson capacity_size_to_yojson x.canary_size);
      ("WaitIntervalInSeconds", Some (wait_interval_in_seconds_to_yojson x.wait_interval_in_seconds));
      ("Type", Some (traffic_routing_config_type_to_yojson x.type_));
    ]

let termination_wait_in_seconds_to_yojson = int_to_yojson

let blue_green_update_policy_to_yojson (x : blue_green_update_policy) =
  assoc_to_yojson
    [
      ( "MaximumExecutionTimeoutInSeconds",
        option_to_yojson maximum_execution_timeout_in_seconds_to_yojson
          x.maximum_execution_timeout_in_seconds );
      ( "TerminationWaitInSeconds",
        option_to_yojson termination_wait_in_seconds_to_yojson x.termination_wait_in_seconds );
      ( "TrafficRoutingConfiguration",
        Some (traffic_routing_config_to_yojson x.traffic_routing_configuration) );
    ]

let rolling_update_policy_to_yojson (x : rolling_update_policy) =
  assoc_to_yojson
    [
      ( "RollbackMaximumBatchSize",
        option_to_yojson capacity_size_to_yojson x.rollback_maximum_batch_size );
      ( "MaximumExecutionTimeoutInSeconds",
        option_to_yojson maximum_execution_timeout_in_seconds_to_yojson
          x.maximum_execution_timeout_in_seconds );
      ("WaitIntervalInSeconds", Some (wait_interval_in_seconds_to_yojson x.wait_interval_in_seconds));
      ("MaximumBatchSize", Some (capacity_size_to_yojson x.maximum_batch_size));
    ]

let deployment_config_to_yojson (x : deployment_config) =
  assoc_to_yojson
    [
      ( "AutoRollbackConfiguration",
        option_to_yojson auto_rollback_config_to_yojson x.auto_rollback_configuration );
      ( "RollingUpdatePolicy",
        option_to_yojson rolling_update_policy_to_yojson x.rolling_update_policy );
      ( "BlueGreenUpdatePolicy",
        option_to_yojson blue_green_update_policy_to_yojson x.blue_green_update_policy );
    ]

let update_endpoint_input_to_yojson (x : update_endpoint_input) =
  assoc_to_yojson
    [
      ("RetainDeploymentConfig", option_to_yojson boolean__to_yojson x.retain_deployment_config);
      ("DeploymentConfig", option_to_yojson deployment_config_to_yojson x.deployment_config);
      ( "ExcludeRetainedVariantProperties",
        option_to_yojson variant_property_list_to_yojson x.exclude_retained_variant_properties );
      ( "RetainAllVariantProperties",
        option_to_yojson boolean__to_yojson x.retain_all_variant_properties );
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let domain_arn_to_yojson = string_to_yojson

let update_domain_response_to_yojson (x : update_domain_response) =
  assoc_to_yojson [ ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn) ]

let r_studio_server_pro_domain_settings_for_update_to_yojson
    (x : r_studio_server_pro_domain_settings_for_update) =
  assoc_to_yojson
    [
      ("RStudioPackageManagerUrl", option_to_yojson string__to_yojson x.r_studio_package_manager_url);
      ("RStudioConnectUrl", option_to_yojson string__to_yojson x.r_studio_connect_url);
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("DomainExecutionRoleArn", Some (role_arn_to_yojson x.domain_execution_role_arn));
    ]

let execution_role_identity_config_to_yojson (x : execution_role_identity_config) =
  match x with DISABLED -> `String "DISABLED" | USER_PROFILE_NAME -> `String "USER_PROFILE_NAME"

let domain_security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let trusted_identity_propagation_settings_to_yojson (x : trusted_identity_propagation_settings) =
  assoc_to_yojson [ ("Status", Some (feature_status_to_yojson x.status)) ]

let docker_settings_to_yojson (x : docker_settings) =
  assoc_to_yojson
    [
      ("RootlessDocker", option_to_yojson feature_status_to_yojson x.rootless_docker);
      ( "VpcOnlyTrustedAccounts",
        option_to_yojson vpc_only_trusted_accounts_to_yojson x.vpc_only_trusted_accounts );
      ("EnableDockerAccess", option_to_yojson feature_status_to_yojson x.enable_docker_access);
    ]

let q_profile_arn_to_yojson = string_to_yojson

let amazon_q_settings_to_yojson (x : amazon_q_settings) =
  assoc_to_yojson
    [
      ("QProfileArn", option_to_yojson q_profile_arn_to_yojson x.q_profile_arn);
      ("Status", option_to_yojson feature_status_to_yojson x.status);
    ]

let region_name_to_yojson = string_to_yojson
let unified_studio_domain_id_to_yojson = string_to_yojson
let unified_studio_project_id_to_yojson = string_to_yojson
let unified_studio_environment_id_to_yojson = string_to_yojson
let single_sign_on_application_arn_to_yojson = string_to_yojson

let unified_studio_settings_to_yojson (x : unified_studio_settings) =
  assoc_to_yojson
    [
      ( "SingleSignOnApplicationArn",
        option_to_yojson single_sign_on_application_arn_to_yojson x.single_sign_on_application_arn
      );
      ("ProjectS3Path", option_to_yojson s3_uri_to_yojson x.project_s3_path);
      ("EnvironmentId", option_to_yojson unified_studio_environment_id_to_yojson x.environment_id);
      ("ProjectId", option_to_yojson unified_studio_project_id_to_yojson x.project_id);
      ("DomainId", option_to_yojson unified_studio_domain_id_to_yojson x.domain_id);
      ("DomainRegion", option_to_yojson region_name_to_yojson x.domain_region);
      ("DomainAccountId", option_to_yojson account_id_to_yojson x.domain_account_id);
      ("StudioWebPortalAccess", option_to_yojson feature_status_to_yojson x.studio_web_portal_access);
    ]

let domain_settings_for_update_to_yojson (x : domain_settings_for_update) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "UnifiedStudioSettings",
        option_to_yojson unified_studio_settings_to_yojson x.unified_studio_settings );
      ("AmazonQSettings", option_to_yojson amazon_q_settings_to_yojson x.amazon_q_settings);
      ("DockerSettings", option_to_yojson docker_settings_to_yojson x.docker_settings);
      ( "TrustedIdentityPropagationSettings",
        option_to_yojson trusted_identity_propagation_settings_to_yojson
          x.trusted_identity_propagation_settings );
      ("SecurityGroupIds", option_to_yojson domain_security_group_ids_to_yojson x.security_group_ids);
      ( "ExecutionRoleIdentityConfig",
        option_to_yojson execution_role_identity_config_to_yojson x.execution_role_identity_config
      );
      ( "RStudioServerProDomainSettingsForUpdate",
        option_to_yojson r_studio_server_pro_domain_settings_for_update_to_yojson
          x.r_studio_server_pro_domain_settings_for_update );
    ]

let app_security_group_management_to_yojson (x : app_security_group_management) =
  match x with Customer -> `String "Customer" | Service -> `String "Service"

let default_space_settings_to_yojson (x : default_space_settings) =
  assoc_to_yojson
    [
      ( "CustomFileSystemConfigs",
        option_to_yojson custom_file_system_configs_to_yojson x.custom_file_system_configs );
      ( "CustomPosixUserConfig",
        option_to_yojson custom_posix_user_config_to_yojson x.custom_posix_user_config );
      ( "SpaceStorageSettings",
        option_to_yojson default_space_storage_settings_to_yojson x.space_storage_settings );
      ( "JupyterLabAppSettings",
        option_to_yojson jupyter_lab_app_settings_to_yojson x.jupyter_lab_app_settings );
      ( "KernelGatewayAppSettings",
        option_to_yojson kernel_gateway_app_settings_to_yojson x.kernel_gateway_app_settings );
      ( "JupyterServerAppSettings",
        option_to_yojson jupyter_server_app_settings_to_yojson x.jupyter_server_app_settings );
      ("SecurityGroups", option_to_yojson security_group_ids_to_yojson x.security_groups);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
    ]

let app_network_access_type_to_yojson (x : app_network_access_type) =
  match x with VpcOnly -> `String "VpcOnly" | PublicInternetOnly -> `String "PublicInternetOnly"

let tag_propagation_to_yojson (x : tag_propagation) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let home_efs_file_system_creation_to_yojson (x : home_efs_file_system_creation) =
  match x with Disabled -> `String "Disabled" | Enabled -> `String "Enabled"

let update_domain_request_to_yojson (x : update_domain_request) =
  assoc_to_yojson
    [
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ( "HomeEfsFileSystemCreation",
        option_to_yojson home_efs_file_system_creation_to_yojson x.home_efs_file_system_creation );
      ("TagPropagation", option_to_yojson tag_propagation_to_yojson x.tag_propagation);
      ( "AppNetworkAccessType",
        option_to_yojson app_network_access_type_to_yojson x.app_network_access_type );
      ("SubnetIds", option_to_yojson subnets_to_yojson x.subnet_ids);
      ( "DefaultSpaceSettings",
        option_to_yojson default_space_settings_to_yojson x.default_space_settings );
      ( "AppSecurityGroupManagement",
        option_to_yojson app_security_group_management_to_yojson x.app_security_group_management );
      ( "DomainSettingsForUpdate",
        option_to_yojson domain_settings_for_update_to_yojson x.domain_settings_for_update );
      ("DefaultUserSettings", option_to_yojson user_settings_to_yojson x.default_user_settings);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let device_name_to_yojson = string_to_yojson
let device_description_to_yojson = string_to_yojson
let thing_name_to_yojson = string_to_yojson

let device_to_yojson (x : device) =
  assoc_to_yojson
    [
      ("IotThingName", option_to_yojson thing_name_to_yojson x.iot_thing_name);
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ("DeviceName", Some (device_name_to_yojson x.device_name));
    ]

let devices_to_yojson tree = list_to_yojson device_to_yojson tree

let update_devices_request_to_yojson (x : update_devices_request) =
  assoc_to_yojson
    [
      ("Devices", Some (devices_to_yojson x.devices));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
    ]

let device_fleet_description_to_yojson = string_to_yojson

let edge_preset_deployment_type_to_yojson (x : edge_preset_deployment_type) =
  match x with GreengrassV2Component -> `String "GreengrassV2Component"

let edge_output_config_to_yojson (x : edge_output_config) =
  assoc_to_yojson
    [
      ("PresetDeploymentConfig", option_to_yojson string__to_yojson x.preset_deployment_config);
      ( "PresetDeploymentType",
        option_to_yojson edge_preset_deployment_type_to_yojson x.preset_deployment_type );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
    ]

let enable_iot_role_alias_to_yojson = bool_to_yojson

let update_device_fleet_request_to_yojson (x : update_device_fleet_request) =
  assoc_to_yojson
    [
      ( "EnableIotRoleAlias",
        option_to_yojson enable_iot_role_alias_to_yojson x.enable_iot_role_alias );
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
    ]

let context_arn_to_yojson = string_to_yojson

let update_context_response_to_yojson (x : update_context_response) =
  assoc_to_yojson [ ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn) ]

let context_name_to_yojson = string_to_yojson

let lineage_entity_parameters_to_yojson tree =
  map_to_yojson string_parameter_value_to_yojson string_parameter_value_to_yojson tree

let list_lineage_entity_parameter_key_to_yojson tree =
  list_to_yojson string_parameter_value_to_yojson tree

let update_context_request_to_yojson (x : update_context_request) =
  assoc_to_yojson
    [
      ( "PropertiesToRemove",
        option_to_yojson list_lineage_entity_parameter_key_to_yojson x.properties_to_remove );
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("ContextName", Some (context_name_to_yojson x.context_name));
    ]

let compute_quota_arn_to_yojson = string_to_yojson
let integer_to_yojson = int_to_yojson

let update_compute_quota_response_to_yojson (x : update_compute_quota_response) =
  assoc_to_yojson
    [
      ("ComputeQuotaVersion", Some (integer_to_yojson x.compute_quota_version));
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
    ]

let compute_quota_id_to_yojson = string_to_yojson

let cluster_instance_type_to_yojson (x : cluster_instance_type) =
  match x with
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_R5D_16XLARGE -> `String "ml.r5d.16xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_I3EN_24XLARGE -> `String "ml.i3en.24xlarge"
  | ML_I3EN_12XLARGE -> `String "ml.i3en.12xlarge"
  | ML_I3EN_6XLARGE -> `String "ml.i3en.6xlarge"
  | ML_I3EN_3XLARGE -> `String "ml.i3en.3xlarge"
  | ML_I3EN_2XLARGE -> `String "ml.i3en.2xlarge"
  | ML_I3EN_XLARGE -> `String "ml.i3en.xlarge"
  | ML_I3EN_LARGE -> `String "ml.i3en.large"
  | ML_R6I_32XLARGE -> `String "ml.r6i.32xlarge"
  | ML_R6I_24XLARGE -> `String "ml.r6i.24xlarge"
  | ML_R6I_16XLARGE -> `String "ml.r6i.16xlarge"
  | ML_R6I_12XLARGE -> `String "ml.r6i.12xlarge"
  | ML_R6I_8XLARGE -> `String "ml.r6i.8xlarge"
  | ML_R6I_4XLARGE -> `String "ml.r6i.4xlarge"
  | ML_R6I_2XLARGE -> `String "ml.r6i.2xlarge"
  | ML_R6I_XLARGE -> `String "ml.r6i.xlarge"
  | ML_R6I_LARGE -> `String "ml.r6i.large"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_C6I_LARGE -> `String "ml.c6i.large"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_TRN2_3XLARGE -> `String "ml.trn2.3xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_GR6_8XLARGE -> `String "ml.gr6.8xlarge"
  | ML_GR6_4XLARGE -> `String "ml.gr6.4xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5_16XLARGE -> `String "ml.m5.16xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_8XLARGE -> `String "ml.m5.8xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_C5N_18XLARGE -> `String "ml.c5n.18xlarge"
  | ML_C5N_9XLARGE -> `String "ml.c5n.9xlarge"
  | ML_C5N_4XLARGE -> `String "ml.c5n.4xlarge"
  | ML_C5N_2XLARGE -> `String "ml.c5n.2xlarge"
  | ML_C5N_LARGE -> `String "ml.c5n.large"
  | ML_C5_24XLARGE -> `String "ml.c5.24xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_12XLARGE -> `String "ml.c5.12xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_C5_LARGE -> `String "ml.c5.large"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"

let instance_count_to_yojson = int_to_yojson
let accelerators_amount_to_yojson = int_to_yojson
let memory_in_gi_b_amount_to_yojson = float_to_yojson

let mig_profile_type_to_yojson (x : mig_profile_type) =
  match x with
  | MIG_7G_186GB -> `String "mig-7g.186gb"
  | MIG_7G_180GB -> `String "mig-7g.180gb"
  | MIG_7G_141GB -> `String "mig-7g.141gb"
  | MIG_7G_80GB -> `String "mig-7g.80gb"
  | MIG_7G_40GB -> `String "mig-7g.40gb"
  | MIG_4G_93GB -> `String "mig-4g.93gb"
  | MIG_4G_90GB -> `String "mig-4g.90gb"
  | MIG_4G_71GB -> `String "mig-4g.71gb"
  | MIG_4G_40GB -> `String "mig-4g.40gb"
  | MIG_4G_20GB -> `String "mig-4g.20gb"
  | MIG_3G_93GB -> `String "mig-3g.93gb"
  | MIG_3G_90GB -> `String "mig-3g.90gb"
  | MIG_3G_71GB -> `String "mig-3g.71gb"
  | MIG_3G_40GB -> `String "mig-3g.40gb"
  | MIG_3G_20GB -> `String "mig-3g.20gb"
  | MIG_2G_47GB -> `String "mig-2g.47gb"
  | MIG_2G_45GB -> `String "mig-2g.45gb"
  | MIG_2G_35GB -> `String "mig-2g.35gb"
  | MIG_2G_20GB -> `String "mig-2g.20gb"
  | MIG_2G_10GB -> `String "mig-2g.10gb"
  | MIG_1G_47GB -> `String "mig-1g.47gb"
  | MIG_1G_45GB -> `String "mig-1g.45gb"
  | MIG_1G_35GB -> `String "mig-1g.35gb"
  | MIG_1G_23GB -> `String "mig-1g.23gb"
  | MIG_1G_20GB -> `String "mig-1g.20gb"
  | MIG_1G_18GB -> `String "mig-1g.18gb"
  | MIG_1G_10GB -> `String "mig-1g.10gb"
  | MIG_1G_5GB -> `String "mig-1g.5gb"

let accelerator_partition_config_to_yojson (x : accelerator_partition_config) =
  assoc_to_yojson
    [
      ("Count", Some (integer_to_yojson x.count));
      ("Type", Some (mig_profile_type_to_yojson x.type_));
    ]

let compute_quota_resource_config_to_yojson (x : compute_quota_resource_config) =
  assoc_to_yojson
    [
      ( "AcceleratorPartition",
        option_to_yojson accelerator_partition_config_to_yojson x.accelerator_partition );
      ("MemoryInGiB", option_to_yojson memory_in_gi_b_amount_to_yojson x.memory_in_gi_b);
      ("VCpu", option_to_yojson v_cpu_amount_to_yojson x.v_cpu);
      ("Accelerators", option_to_yojson accelerators_amount_to_yojson x.accelerators);
      ("Count", option_to_yojson instance_count_to_yojson x.count);
      ("InstanceType", Some (cluster_instance_type_to_yojson x.instance_type));
    ]

let compute_quota_resource_config_list_to_yojson tree =
  list_to_yojson compute_quota_resource_config_to_yojson tree

let resource_sharing_strategy_to_yojson (x : resource_sharing_strategy) =
  match x with
  | LENDANDBORROW -> `String "LendAndBorrow"
  | DONTLEND -> `String "DontLend"
  | LEND -> `String "Lend"

let borrow_limit_to_yojson = int_to_yojson

let absolute_borrow_limit_resource_list_to_yojson tree =
  list_to_yojson compute_quota_resource_config_to_yojson tree

let resource_sharing_config_to_yojson (x : resource_sharing_config) =
  assoc_to_yojson
    [
      ( "AbsoluteBorrowLimits",
        option_to_yojson absolute_borrow_limit_resource_list_to_yojson x.absolute_borrow_limits );
      ("BorrowLimit", option_to_yojson borrow_limit_to_yojson x.borrow_limit);
      ("Strategy", Some (resource_sharing_strategy_to_yojson x.strategy));
    ]

let preempt_team_tasks_to_yojson (x : preempt_team_tasks) =
  match x with LOWERPRIORITY -> `String "LowerPriority" | NEVER -> `String "Never"

let compute_quota_config_to_yojson (x : compute_quota_config) =
  assoc_to_yojson
    [
      ("PreemptTeamTasks", option_to_yojson preempt_team_tasks_to_yojson x.preempt_team_tasks);
      ( "ResourceSharingConfig",
        option_to_yojson resource_sharing_config_to_yojson x.resource_sharing_config );
      ( "ComputeQuotaResources",
        option_to_yojson compute_quota_resource_config_list_to_yojson x.compute_quota_resources );
    ]

let compute_quota_target_team_name_to_yojson = string_to_yojson
let fair_share_weight_to_yojson = int_to_yojson

let compute_quota_target_to_yojson (x : compute_quota_target) =
  assoc_to_yojson
    [
      ("FairShareWeight", option_to_yojson fair_share_weight_to_yojson x.fair_share_weight);
      ("TeamName", Some (compute_quota_target_team_name_to_yojson x.team_name));
    ]

let activation_state_to_yojson (x : activation_state) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let update_compute_quota_request_to_yojson (x : update_compute_quota_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("ComputeQuotaTarget", option_to_yojson compute_quota_target_to_yojson x.compute_quota_target);
      ("ComputeQuotaConfig", option_to_yojson compute_quota_config_to_yojson x.compute_quota_config);
      ("TargetVersion", Some (integer_to_yojson x.target_version));
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
    ]

let code_repository_arn_to_yojson = string_to_yojson

let update_code_repository_output_to_yojson (x : update_code_repository_output) =
  assoc_to_yojson
    [ ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn)) ]

let git_config_for_update_to_yojson (x : git_config_for_update) =
  assoc_to_yojson [ ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn) ]

let update_code_repository_input_to_yojson (x : update_code_repository_input) =
  assoc_to_yojson
    [
      ("GitConfig", option_to_yojson git_config_for_update_to_yojson x.git_config);
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
    ]

let cluster_arn_to_yojson = string_to_yojson

let update_cluster_software_response_to_yojson (x : update_cluster_software_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let cluster_name_or_arn_to_yojson = string_to_yojson
let cluster_instance_group_name_to_yojson = string_to_yojson
let image_release_version_to_yojson = string_to_yojson

let update_cluster_software_instance_group_specification_to_yojson
    (x : update_cluster_software_instance_group_specification) =
  assoc_to_yojson
    [
      ( "ImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.image_release_version );
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
    ]

let update_cluster_software_instance_groups_to_yojson tree =
  list_to_yojson update_cluster_software_instance_group_specification_to_yojson tree

let node_unavailability_type_to_yojson (x : node_unavailability_type) =
  match x with
  | CAPACITY_PERCENTAGE -> `String "CAPACITY_PERCENTAGE"
  | INSTANCE_COUNT -> `String "INSTANCE_COUNT"

let node_unavailability_value_to_yojson = int_to_yojson

let capacity_size_config_to_yojson (x : capacity_size_config) =
  assoc_to_yojson
    [
      ("Value", Some (node_unavailability_value_to_yojson x.value));
      ("Type", Some (node_unavailability_type_to_yojson x.type_));
    ]

let rolling_deployment_policy_to_yojson (x : rolling_deployment_policy) =
  assoc_to_yojson
    [
      ( "RollbackMaximumBatchSize",
        option_to_yojson capacity_size_config_to_yojson x.rollback_maximum_batch_size );
      ("MaximumBatchSize", Some (capacity_size_config_to_yojson x.maximum_batch_size));
    ]

let alarm_details_to_yojson (x : alarm_details) =
  assoc_to_yojson [ ("AlarmName", Some (alarm_name_to_yojson x.alarm_name)) ]

let auto_rollback_alarms_to_yojson tree = list_to_yojson alarm_details_to_yojson tree

let deployment_configuration_to_yojson (x : deployment_configuration) =
  assoc_to_yojson
    [
      ( "AutoRollbackConfiguration",
        option_to_yojson auto_rollback_alarms_to_yojson x.auto_rollback_configuration );
      ( "WaitIntervalInSeconds",
        option_to_yojson wait_time_interval_in_seconds_to_yojson x.wait_interval_in_seconds );
      ( "RollingUpdatePolicy",
        option_to_yojson rolling_deployment_policy_to_yojson x.rolling_update_policy );
    ]

let image_id_to_yojson = string_to_yojson

let update_cluster_software_request_to_yojson (x : update_cluster_software_request) =
  assoc_to_yojson
    [
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
      ( "InstanceGroups",
        option_to_yojson update_cluster_software_instance_groups_to_yojson x.instance_groups );
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let cluster_scheduler_config_arn_to_yojson = string_to_yojson

let update_cluster_scheduler_config_response_to_yojson
    (x : update_cluster_scheduler_config_response) =
  assoc_to_yojson
    [
      ("ClusterSchedulerConfigVersion", Some (integer_to_yojson x.cluster_scheduler_config_version));
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
    ]

let cluster_scheduler_config_id_to_yojson = string_to_yojson
let cluster_scheduler_priority_class_name_to_yojson = string_to_yojson
let priority_weight_to_yojson = int_to_yojson

let priority_class_to_yojson (x : priority_class) =
  assoc_to_yojson
    [
      ("Weight", Some (priority_weight_to_yojson x.weight));
      ("Name", Some (cluster_scheduler_priority_class_name_to_yojson x.name));
    ]

let priority_class_list_to_yojson tree = list_to_yojson priority_class_to_yojson tree

let fair_share_to_yojson (x : fair_share) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let idle_resource_sharing_to_yojson (x : idle_resource_sharing) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let scheduler_config_to_yojson (x : scheduler_config) =
  assoc_to_yojson
    [
      ( "IdleResourceSharing",
        option_to_yojson idle_resource_sharing_to_yojson x.idle_resource_sharing );
      ("FairShare", option_to_yojson fair_share_to_yojson x.fair_share);
      ("PriorityClasses", option_to_yojson priority_class_list_to_yojson x.priority_classes);
    ]

let update_cluster_scheduler_config_request_to_yojson (x : update_cluster_scheduler_config_request)
    =
  assoc_to_yojson
    [
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("SchedulerConfig", option_to_yojson scheduler_config_to_yojson x.scheduler_config);
      ("TargetVersion", Some (integer_to_yojson x.target_version));
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
    ]

let update_cluster_response_to_yojson (x : update_cluster_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let cluster_instance_count_to_yojson = int_to_yojson
let cluster_instance_types_to_yojson tree = list_to_yojson cluster_instance_type_to_yojson tree

let cluster_instance_requirements_to_yojson (x : cluster_instance_requirements) =
  assoc_to_yojson [ ("InstanceTypes", Some (cluster_instance_types_to_yojson x.instance_types)) ]

let cluster_life_cycle_config_file_name_to_yojson = string_to_yojson

let cluster_life_cycle_config_to_yojson (x : cluster_life_cycle_config) =
  assoc_to_yojson
    [
      ( "OnInitComplete",
        option_to_yojson cluster_life_cycle_config_file_name_to_yojson x.on_init_complete );
      ("OnCreate", option_to_yojson cluster_life_cycle_config_file_name_to_yojson x.on_create);
      ("SourceS3Uri", option_to_yojson s3_uri_to_yojson x.source_s3_uri);
    ]

let cluster_threads_per_core_to_yojson = int_to_yojson
let cluster_ebs_volume_size_in_g_b_to_yojson = int_to_yojson

let cluster_ebs_volume_config_to_yojson (x : cluster_ebs_volume_config) =
  assoc_to_yojson
    [
      ("RootVolume", option_to_yojson boolean__to_yojson x.root_volume);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "VolumeSizeInGB",
        option_to_yojson cluster_ebs_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
    ]

let cluster_dns_name_to_yojson = string_to_yojson
let cluster_mount_name_to_yojson = string_to_yojson
let cluster_fsx_mount_path_to_yojson = string_to_yojson

let cluster_fsx_lustre_config_to_yojson (x : cluster_fsx_lustre_config) =
  assoc_to_yojson
    [
      ("MountPath", option_to_yojson cluster_fsx_mount_path_to_yojson x.mount_path);
      ("MountName", Some (cluster_mount_name_to_yojson x.mount_name));
      ("DnsName", Some (cluster_dns_name_to_yojson x.dns_name));
    ]

let cluster_fsx_open_zfs_config_to_yojson (x : cluster_fsx_open_zfs_config) =
  assoc_to_yojson
    [
      ("MountPath", option_to_yojson cluster_fsx_mount_path_to_yojson x.mount_path);
      ("DnsName", Some (cluster_dns_name_to_yojson x.dns_name));
    ]

let cluster_instance_storage_config_to_yojson (x : cluster_instance_storage_config) =
  match x with
  | FsxOpenZfsConfig arg ->
      assoc_to_yojson [ ("FsxOpenZfsConfig", Some (cluster_fsx_open_zfs_config_to_yojson arg)) ]
  | FsxLustreConfig arg ->
      assoc_to_yojson [ ("FsxLustreConfig", Some (cluster_fsx_lustre_config_to_yojson arg)) ]
  | EbsVolumeConfig arg ->
      assoc_to_yojson [ ("EbsVolumeConfig", Some (cluster_ebs_volume_config_to_yojson arg)) ]

let cluster_instance_storage_configs_to_yojson tree =
  list_to_yojson cluster_instance_storage_config_to_yojson tree

let deep_health_check_type_to_yojson (x : deep_health_check_type) =
  match x with
  | INSTANCE_CONNECTIVITY -> `String "InstanceConnectivity"
  | INSTANCE_STRESS -> `String "InstanceStress"

let on_start_deep_health_checks_to_yojson tree =
  list_to_yojson deep_health_check_type_to_yojson tree

let training_plan_arn_to_yojson = string_to_yojson
let cron_schedule_expression_to_yojson = string_to_yojson

let scheduled_update_config_to_yojson (x : scheduled_update_config) =
  assoc_to_yojson
    [
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
      ("ScheduleExpression", Some (cron_schedule_expression_to_yojson x.schedule_expression));
    ]

let cluster_patching_strategy_to_yojson (x : cluster_patching_strategy) =
  match x with WHEN_ALL_IDLE -> `String "WhenAllIdle" | WHEN_IDLE -> `String "WhenIdle"

let cluster_patch_schedule_to_yojson (x : cluster_patch_schedule) =
  assoc_to_yojson [ ("NextPatchDate", option_to_yojson timestamp_to_yojson x.next_patch_date) ]

let cluster_auto_patch_config_to_yojson (x : cluster_auto_patch_config) =
  assoc_to_yojson
    [
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
      ("PatchSchedule", option_to_yojson cluster_patch_schedule_to_yojson x.patch_schedule);
      ("PatchingStrategy", Some (cluster_patching_strategy_to_yojson x.patching_strategy));
    ]

let cluster_kubernetes_label_value_to_yojson = string_to_yojson
let cluster_kubernetes_label_key_to_yojson = string_to_yojson

let cluster_kubernetes_labels_to_yojson tree =
  map_to_yojson cluster_kubernetes_label_key_to_yojson cluster_kubernetes_label_value_to_yojson tree

let cluster_kubernetes_taint_key_to_yojson = string_to_yojson
let cluster_kubernetes_taint_value_to_yojson = string_to_yojson

let cluster_kubernetes_taint_effect_to_yojson (x : cluster_kubernetes_taint_effect) =
  match x with
  | NO_EXECUTE -> `String "NoExecute"
  | PREFER_NO_SCHEDULE -> `String "PreferNoSchedule"
  | NO_SCHEDULE -> `String "NoSchedule"

let cluster_kubernetes_taint_to_yojson (x : cluster_kubernetes_taint) =
  assoc_to_yojson
    [
      ("Effect", Some (cluster_kubernetes_taint_effect_to_yojson x.effect_));
      ("Value", option_to_yojson cluster_kubernetes_taint_value_to_yojson x.value);
      ("Key", Some (cluster_kubernetes_taint_key_to_yojson x.key));
    ]

let cluster_kubernetes_taints_to_yojson tree =
  list_to_yojson cluster_kubernetes_taint_to_yojson tree

let cluster_kubernetes_config_to_yojson (x : cluster_kubernetes_config) =
  assoc_to_yojson
    [
      ("Taints", option_to_yojson cluster_kubernetes_taints_to_yojson x.taints);
      ("Labels", option_to_yojson cluster_kubernetes_labels_to_yojson x.labels);
    ]

let cluster_slurm_node_type_to_yojson (x : cluster_slurm_node_type) =
  match x with
  | COMPUTE -> `String "Compute"
  | LOGIN -> `String "Login"
  | CONTROLLER -> `String "Controller"

let cluster_partition_name_to_yojson = string_to_yojson
let cluster_partition_names_to_yojson tree = list_to_yojson cluster_partition_name_to_yojson tree

let cluster_slurm_config_to_yojson (x : cluster_slurm_config) =
  assoc_to_yojson
    [
      ("PartitionNames", option_to_yojson cluster_partition_names_to_yojson x.partition_names);
      ("NodeType", Some (cluster_slurm_node_type_to_yojson x.node_type));
    ]

let cluster_spot_options_to_yojson = unit_to_yojson
let cluster_on_demand_options_to_yojson = unit_to_yojson

let cluster_capacity_requirements_to_yojson (x : cluster_capacity_requirements) =
  assoc_to_yojson
    [
      ("OnDemand", option_to_yojson cluster_on_demand_options_to_yojson x.on_demand);
      ("Spot", option_to_yojson cluster_spot_options_to_yojson x.spot);
    ]

let cluster_interface_type_to_yojson (x : cluster_interface_type) =
  match x with EFA_ONLY -> `String "efa-only" | EFA -> `String "efa"

let cluster_network_interface_to_yojson (x : cluster_network_interface) =
  assoc_to_yojson
    [ ("InterfaceType", option_to_yojson cluster_interface_type_to_yojson x.interface_type) ]

let cluster_instance_group_specification_to_yojson (x : cluster_instance_group_specification) =
  assoc_to_yojson
    [
      ("NetworkInterface", option_to_yojson cluster_network_interface_to_yojson x.network_interface);
      ( "CapacityRequirements",
        option_to_yojson cluster_capacity_requirements_to_yojson x.capacity_requirements );
      ("SlurmConfig", option_to_yojson cluster_slurm_config_to_yojson x.slurm_config);
      ("KubernetesConfig", option_to_yojson cluster_kubernetes_config_to_yojson x.kubernetes_config);
      ( "ImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.image_release_version );
      ("AutoPatchConfig", option_to_yojson cluster_auto_patch_config_to_yojson x.auto_patch_config);
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ("ExecutionRole", Some (role_arn_to_yojson x.execution_role));
      ("LifeCycleConfig", option_to_yojson cluster_life_cycle_config_to_yojson x.life_cycle_config);
      ( "InstanceRequirements",
        option_to_yojson cluster_instance_requirements_to_yojson x.instance_requirements );
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("MinInstanceCount", option_to_yojson cluster_instance_count_to_yojson x.min_instance_count);
      ("InstanceCount", Some (cluster_instance_count_to_yojson x.instance_count));
    ]

let cluster_instance_group_specifications_to_yojson tree =
  list_to_yojson cluster_instance_group_specification_to_yojson tree

let f_sx_lustre_size_in_gi_b_to_yojson = int_to_yojson
let f_sx_lustre_per_unit_storage_throughput_to_yojson = int_to_yojson

let f_sx_lustre_config_to_yojson (x : f_sx_lustre_config) =
  assoc_to_yojson
    [
      ( "PerUnitStorageThroughput",
        Some (f_sx_lustre_per_unit_storage_throughput_to_yojson x.per_unit_storage_throughput) );
      ("SizeInGiB", Some (f_sx_lustre_size_in_gi_b_to_yojson x.size_in_gi_b));
    ]

let environment_config_to_yojson (x : environment_config) =
  assoc_to_yojson
    [ ("FSxLustreConfig", option_to_yojson f_sx_lustre_config_to_yojson x.f_sx_lustre_config) ]

let cluster_restricted_instance_group_specification_to_yojson
    (x : cluster_restricted_instance_group_specification) =
  assoc_to_yojson
    [
      ("EnvironmentConfig", option_to_yojson environment_config_to_yojson x.environment_config);
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ("ExecutionRole", Some (role_arn_to_yojson x.execution_role));
      ("InstanceType", Some (cluster_instance_type_to_yojson x.instance_type));
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("InstanceCount", Some (cluster_instance_count_to_yojson x.instance_count));
    ]

let cluster_restricted_instance_group_specifications_to_yojson tree =
  list_to_yojson cluster_restricted_instance_group_specification_to_yojson tree

let cluster_f_sx_lustre_deletion_policy_to_yojson (x : cluster_f_sx_lustre_deletion_policy) =
  match x with KEEP -> `String "Keep" | DELETE_IF_NOT_USED -> `String "DeleteIfNotUsed"

let cluster_shared_environment_config_to_yojson (x : cluster_shared_environment_config) =
  assoc_to_yojson
    [
      ("FSxLustreConfig", Some (f_sx_lustre_config_to_yojson x.f_sx_lustre_config));
      ( "FSxLustreDeletionPolicy",
        Some (cluster_f_sx_lustre_deletion_policy_to_yojson x.f_sx_lustre_deletion_policy) );
    ]

let cluster_restricted_instance_groups_config_to_yojson
    (x : cluster_restricted_instance_groups_config) =
  assoc_to_yojson
    [
      ( "SharedEnvironmentConfig",
        Some (cluster_shared_environment_config_to_yojson x.shared_environment_config) );
    ]

let cluster_config_mode_to_yojson (x : cluster_config_mode) =
  match x with DISABLE -> `String "Disable" | ENABLE -> `String "Enable"

let cluster_instance_memory_allocation_percentage_to_yojson = int_to_yojson

let cluster_tiered_storage_config_to_yojson (x : cluster_tiered_storage_config) =
  assoc_to_yojson
    [
      ( "InstanceMemoryAllocationPercentage",
        option_to_yojson cluster_instance_memory_allocation_percentage_to_yojson
          x.instance_memory_allocation_percentage );
      ("Mode", Some (cluster_config_mode_to_yojson x.mode));
    ]

let cluster_node_recovery_to_yojson (x : cluster_node_recovery) =
  match x with NONE -> `String "None" | AUTOMATIC -> `String "Automatic"

let cluster_instance_groups_to_delete_to_yojson tree =
  list_to_yojson cluster_instance_group_name_to_yojson tree

let cluster_node_provisioning_mode_to_yojson (x : cluster_node_provisioning_mode) =
  match x with CONTINUOUS -> `String "Continuous"

let cluster_auto_scaling_mode_to_yojson (x : cluster_auto_scaling_mode) =
  match x with DISABLE -> `String "Disable" | ENABLE -> `String "Enable"

let cluster_auto_scaler_type_to_yojson (x : cluster_auto_scaler_type) =
  match x with KARPENTER -> `String "Karpenter"

let cluster_auto_scaling_config_to_yojson (x : cluster_auto_scaling_config) =
  assoc_to_yojson
    [
      ("AutoScalerType", option_to_yojson cluster_auto_scaler_type_to_yojson x.auto_scaler_type);
      ("Mode", Some (cluster_auto_scaling_mode_to_yojson x.mode));
    ]

let eks_cluster_arn_to_yojson = string_to_yojson

let cluster_orchestrator_eks_config_to_yojson (x : cluster_orchestrator_eks_config) =
  assoc_to_yojson [ ("ClusterArn", Some (eks_cluster_arn_to_yojson x.cluster_arn)) ]

let cluster_slurm_config_strategy_to_yojson (x : cluster_slurm_config_strategy) =
  match x with
  | MERGE -> `String "Merge"
  | MANAGED -> `String "Managed"
  | OVERWRITE -> `String "Overwrite"

let cluster_orchestrator_slurm_config_to_yojson (x : cluster_orchestrator_slurm_config) =
  assoc_to_yojson
    [
      ( "SlurmConfigStrategy",
        option_to_yojson cluster_slurm_config_strategy_to_yojson x.slurm_config_strategy );
    ]

let cluster_orchestrator_to_yojson (x : cluster_orchestrator) =
  assoc_to_yojson
    [
      ("Slurm", option_to_yojson cluster_orchestrator_slurm_config_to_yojson x.slurm);
      ("Eks", option_to_yojson cluster_orchestrator_eks_config_to_yojson x.eks);
    ]

let update_cluster_request_to_yojson (x : update_cluster_request) =
  assoc_to_yojson
    [
      ("Orchestrator", option_to_yojson cluster_orchestrator_to_yojson x.orchestrator);
      ("AutoScaling", option_to_yojson cluster_auto_scaling_config_to_yojson x.auto_scaling);
      ("ClusterRole", option_to_yojson role_arn_to_yojson x.cluster_role);
      ( "NodeProvisioningMode",
        option_to_yojson cluster_node_provisioning_mode_to_yojson x.node_provisioning_mode );
      ( "InstanceGroupsToDelete",
        option_to_yojson cluster_instance_groups_to_delete_to_yojson x.instance_groups_to_delete );
      ("NodeRecovery", option_to_yojson cluster_node_recovery_to_yojson x.node_recovery);
      ( "TieredStorageConfig",
        option_to_yojson cluster_tiered_storage_config_to_yojson x.tiered_storage_config );
      ( "RestrictedInstanceGroupsConfig",
        option_to_yojson cluster_restricted_instance_groups_config_to_yojson
          x.restricted_instance_groups_config );
      ( "RestrictedInstanceGroups",
        option_to_yojson cluster_restricted_instance_group_specifications_to_yojson
          x.restricted_instance_groups );
      ( "InstanceGroups",
        option_to_yojson cluster_instance_group_specifications_to_yojson x.instance_groups );
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let artifact_arn_to_yojson = string_to_yojson

let update_artifact_response_to_yojson (x : update_artifact_response) =
  assoc_to_yojson [ ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn) ]

let artifact_property_value_to_yojson = string_to_yojson

let artifact_properties_to_yojson tree =
  map_to_yojson string_parameter_value_to_yojson artifact_property_value_to_yojson tree

let update_artifact_request_to_yojson (x : update_artifact_request) =
  assoc_to_yojson
    [
      ( "PropertiesToRemove",
        option_to_yojson list_lineage_entity_parameter_key_to_yojson x.properties_to_remove );
      ("Properties", option_to_yojson artifact_properties_to_yojson x.properties);
      ("ArtifactName", option_to_yojson experiment_entity_name_to_yojson x.artifact_name);
      ("ArtifactArn", Some (artifact_arn_to_yojson x.artifact_arn));
    ]

let app_image_config_arn_to_yojson = string_to_yojson

let update_app_image_config_response_to_yojson (x : update_app_image_config_response) =
  assoc_to_yojson
    [
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
    ]

let kernel_name_to_yojson = string_to_yojson
let kernel_display_name_to_yojson = string_to_yojson

let kernel_spec_to_yojson (x : kernel_spec) =
  assoc_to_yojson
    [
      ("DisplayName", option_to_yojson kernel_display_name_to_yojson x.display_name);
      ("Name", Some (kernel_name_to_yojson x.name));
    ]

let kernel_specs_to_yojson tree = list_to_yojson kernel_spec_to_yojson tree
let mount_path_to_yojson = string_to_yojson
let default_uid_to_yojson = int_to_yojson
let default_gid_to_yojson = int_to_yojson

let file_system_config_to_yojson (x : file_system_config) =
  assoc_to_yojson
    [
      ("DefaultGid", option_to_yojson default_gid_to_yojson x.default_gid);
      ("DefaultUid", option_to_yojson default_uid_to_yojson x.default_uid);
      ("MountPath", option_to_yojson mount_path_to_yojson x.mount_path);
    ]

let kernel_gateway_image_config_to_yojson (x : kernel_gateway_image_config) =
  assoc_to_yojson
    [
      ("FileSystemConfig", option_to_yojson file_system_config_to_yojson x.file_system_config);
      ("KernelSpecs", Some (kernel_specs_to_yojson x.kernel_specs));
    ]

let custom_image_container_arguments_to_yojson tree =
  list_to_yojson non_empty_string64_to_yojson tree

let custom_image_container_entrypoint_to_yojson tree =
  list_to_yojson non_empty_string256_to_yojson tree

let string256_to_yojson = string_to_yojson

let custom_image_container_environment_variables_to_yojson tree =
  map_to_yojson non_empty_string256_to_yojson string256_to_yojson tree

let container_config_to_yojson (x : container_config) =
  assoc_to_yojson
    [
      ( "ContainerEnvironmentVariables",
        option_to_yojson custom_image_container_environment_variables_to_yojson
          x.container_environment_variables );
      ( "ContainerEntrypoint",
        option_to_yojson custom_image_container_entrypoint_to_yojson x.container_entrypoint );
      ( "ContainerArguments",
        option_to_yojson custom_image_container_arguments_to_yojson x.container_arguments );
    ]

let jupyter_lab_app_image_config_to_yojson (x : jupyter_lab_app_image_config) =
  assoc_to_yojson
    [
      ("ContainerConfig", option_to_yojson container_config_to_yojson x.container_config);
      ("FileSystemConfig", option_to_yojson file_system_config_to_yojson x.file_system_config);
    ]

let code_editor_app_image_config_to_yojson (x : code_editor_app_image_config) =
  assoc_to_yojson
    [
      ("ContainerConfig", option_to_yojson container_config_to_yojson x.container_config);
      ("FileSystemConfig", option_to_yojson file_system_config_to_yojson x.file_system_config);
    ]

let update_app_image_config_request_to_yojson (x : update_app_image_config_request) =
  assoc_to_yojson
    [
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name));
    ]

let action_arn_to_yojson = string_to_yojson

let update_action_response_to_yojson (x : update_action_response) =
  assoc_to_yojson [ ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn) ]

let action_status_to_yojson (x : action_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | UNKNOWN -> `String "Unknown"

let update_action_request_to_yojson (x : update_action_request) =
  assoc_to_yojson
    [
      ( "PropertiesToRemove",
        option_to_yojson list_lineage_entity_parameter_key_to_yojson x.properties_to_remove );
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("ActionName", Some (experiment_entity_name_to_yojson x.action_name));
    ]

let unhealthy_instance_count_to_yojson = int_to_yojson
let ultra_server_type_to_yojson = string_to_yojson
let availability_zone_to_yojson = string_to_yojson

let reserved_capacity_instance_type_to_yojson (x : reserved_capacity_instance_type) =
  match x with
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"

let total_instance_count_to_yojson = int_to_yojson
let configured_spare_instance_count_to_yojson = int_to_yojson
let available_instance_count_to_yojson = int_to_yojson
let in_use_instance_count_to_yojson = int_to_yojson
let available_spare_instance_count_to_yojson = int_to_yojson

let ultra_server_health_status_to_yojson (x : ultra_server_health_status) =
  match x with
  | INSUFFICIENT_DATA -> `String "Insufficient-Data"
  | IMPAIRED -> `String "Impaired"
  | OK -> `String "OK"

let ultra_server_to_yojson (x : ultra_server) =
  assoc_to_yojson
    [
      ("HealthStatus", option_to_yojson ultra_server_health_status_to_yojson x.health_status);
      ( "UnhealthyInstanceCount",
        option_to_yojson unhealthy_instance_count_to_yojson x.unhealthy_instance_count );
      ( "AvailableSpareInstanceCount",
        option_to_yojson available_spare_instance_count_to_yojson x.available_spare_instance_count
      );
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ( "ConfiguredSpareInstanceCount",
        option_to_yojson configured_spare_instance_count_to_yojson x.configured_spare_instance_count
      );
      ("TotalInstanceCount", Some (total_instance_count_to_yojson x.total_instance_count));
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("AvailabilityZone", Some (availability_zone_to_yojson x.availability_zone));
      ("UltraServerType", Some (ultra_server_type_to_yojson x.ultra_server_type));
      ("UltraServerId", Some (non_empty_string256_to_yojson x.ultra_server_id));
    ]

let ultra_servers_to_yojson tree = list_to_yojson ultra_server_to_yojson tree
let ultra_server_count_to_yojson = int_to_yojson

let ultra_server_summary_to_yojson (x : ultra_server_summary) =
  assoc_to_yojson
    [
      ( "UnhealthyInstanceCount",
        option_to_yojson unhealthy_instance_count_to_yojson x.unhealthy_instance_count );
      ( "AvailableSpareInstanceCount",
        option_to_yojson available_spare_instance_count_to_yojson x.available_spare_instance_count
      );
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("UltraServerType", Some (ultra_server_type_to_yojson x.ultra_server_type));
    ]

let ultra_server_info_to_yojson (x : ultra_server_info) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_);
      ("Id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
    ]

let template_url_to_yojson = string_to_yojson
let template_content_sha256_to_yojson = string_to_yojson

let ui_template_info_to_yojson (x : ui_template_info) =
  assoc_to_yojson
    [
      ("ContentSha256", option_to_yojson template_content_sha256_to_yojson x.content_sha256);
      ("Url", option_to_yojson template_url_to_yojson x.url);
    ]

let template_content_to_yojson = string_to_yojson

let ui_template_to_yojson (x : ui_template) =
  assoc_to_yojson [ ("Content", Some (template_content_to_yojson x.content)) ]

let human_task_ui_arn_to_yojson = string_to_yojson

let ui_config_to_yojson (x : ui_config) =
  assoc_to_yojson
    [
      ("HumanTaskUiArn", option_to_yojson human_task_ui_arn_to_yojson x.human_task_ui_arn);
      ("UiTemplateS3Uri", option_to_yojson s3_uri_to_yojson x.ui_template_s3_uri);
    ]

let dollars_to_yojson = int_to_yojson
let cents_to_yojson = int_to_yojson
let tenth_fractions_of_a_cent_to_yojson = int_to_yojson

let us_d_to_yojson (x : us_d) =
  assoc_to_yojson
    [
      ( "TenthFractionsOfACent",
        option_to_yojson tenth_fractions_of_a_cent_to_yojson x.tenth_fractions_of_a_cent );
      ("Cents", option_to_yojson cents_to_yojson x.cents);
      ("Dollars", option_to_yojson dollars_to_yojson x.dollars);
    ]

let hyper_parameter_tuning_job_arn_to_yojson = string_to_yojson

let tuning_job_step_meta_data_to_yojson (x : tuning_job_step_meta_data) =
  assoc_to_yojson [ ("Arn", option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.arn) ]

let target_objective_metric_value_to_yojson = float_to_yojson
let max_number_of_training_jobs_not_improving_to_yojson = int_to_yojson

let best_objective_not_improving_to_yojson (x : best_objective_not_improving) =
  assoc_to_yojson
    [
      ( "MaxNumberOfTrainingJobsNotImproving",
        option_to_yojson max_number_of_training_jobs_not_improving_to_yojson
          x.max_number_of_training_jobs_not_improving );
    ]

let complete_on_convergence_to_yojson (x : complete_on_convergence) =
  match x with ENABLED -> `String "Enabled" | DISABLED -> `String "Disabled"

let convergence_detected_to_yojson (x : convergence_detected) =
  assoc_to_yojson
    [
      ( "CompleteOnConvergence",
        option_to_yojson complete_on_convergence_to_yojson x.complete_on_convergence );
    ]

let tuning_job_completion_criteria_to_yojson (x : tuning_job_completion_criteria) =
  assoc_to_yojson
    [
      ("ConvergenceDetected", option_to_yojson convergence_detected_to_yojson x.convergence_detected);
      ( "BestObjectiveNotImproving",
        option_to_yojson best_objective_not_improving_to_yojson x.best_objective_not_improving );
      ( "TargetObjectiveMetricValue",
        option_to_yojson target_objective_metric_value_to_yojson x.target_objective_metric_value );
    ]

let trial_source_arn_to_yojson = string_to_yojson
let source_type_to_yojson = string_to_yojson

let trial_source_to_yojson (x : trial_source) =
  assoc_to_yojson
    [
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceArn", Some (trial_source_arn_to_yojson x.source_arn));
    ]

let trial_summary_to_yojson (x : trial_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TrialSource", option_to_yojson trial_source_to_yojson x.trial_source);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
    ]

let trial_summaries_to_yojson tree = list_to_yojson trial_summary_to_yojson tree
let trial_component_source_arn_to_yojson = string_to_yojson

let trial_component_source_to_yojson (x : trial_component_source) =
  assoc_to_yojson
    [
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceArn", Some (trial_component_source_arn_to_yojson x.source_arn));
    ]

let trial_component_summary_to_yojson (x : trial_component_summary) =
  assoc_to_yojson
    [
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ( "TrialComponentSource",
        option_to_yojson trial_component_source_to_yojson x.trial_component_source );
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
    ]

let trial_component_summaries_to_yojson tree = list_to_yojson trial_component_summary_to_yojson tree
let trial_component_sources_to_yojson tree = list_to_yojson trial_component_source_to_yojson tree
let labeling_job_arn_to_yojson = string_to_yojson
let auto_ml_job_arn_to_yojson = string_to_yojson

let model_artifacts_to_yojson (x : model_artifacts) =
  assoc_to_yojson [ ("S3ModelArtifacts", Some (s3_uri_to_yojson x.s3_model_artifacts)) ]

let training_job_status_to_yojson (x : training_job_status) =
  match x with
  | DELETING -> `String "Deleting"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let secondary_status_to_yojson (x : secondary_status) =
  match x with
  | PENDING -> `String "Pending"
  | RESTARTING -> `String "Restarting"
  | UPDATING -> `String "Updating"
  | MAX_WAIT_TIME_EXCEEDED -> `String "MaxWaitTimeExceeded"
  | INTERRUPTED -> `String "Interrupted"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | MAX_RUNTIME_EXCEEDED -> `String "MaxRuntimeExceeded"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | UPLOADING -> `String "Uploading"
  | TRAINING -> `String "Training"
  | DOWNLOADING_TRAINING_IMAGE -> `String "DownloadingTrainingImage"
  | DOWNLOADING -> `String "Downloading"
  | PREPARING_TRAINING_STACK -> `String "PreparingTrainingStack"
  | LAUNCHING_ML_INSTANCES -> `String "LaunchingMLInstances"
  | STARTING -> `String "Starting"

let hyper_parameter_value_to_yojson = string_to_yojson
let hyper_parameter_key_to_yojson = string_to_yojson

let hyper_parameters_to_yojson tree =
  map_to_yojson hyper_parameter_key_to_yojson hyper_parameter_value_to_yojson tree

let arn_or_name_to_yojson = string_to_yojson

let training_input_mode_to_yojson (x : training_input_mode) =
  match x with FASTFILE -> `String "FastFile" | FILE -> `String "File" | PIPE -> `String "Pipe"

let metric_name_to_yojson = string_to_yojson
let metric_regex_to_yojson = string_to_yojson

let metric_definition_to_yojson (x : metric_definition) =
  assoc_to_yojson
    [
      ("Regex", Some (metric_regex_to_yojson x.regex)); ("Name", Some (metric_name_to_yojson x.name));
    ]

let metric_definition_list_to_yojson tree = list_to_yojson metric_definition_to_yojson tree
let training_container_entrypoint_string_to_yojson = string_to_yojson

let training_container_entrypoint_to_yojson tree =
  list_to_yojson training_container_entrypoint_string_to_yojson tree

let training_container_argument_to_yojson = string_to_yojson

let training_container_arguments_to_yojson tree =
  list_to_yojson training_container_argument_to_yojson tree

let training_repository_access_mode_to_yojson (x : training_repository_access_mode) =
  match x with VPC -> `String "Vpc" | PLATFORM -> `String "Platform"

let training_repository_credentials_provider_arn_to_yojson = string_to_yojson

let training_repository_auth_config_to_yojson (x : training_repository_auth_config) =
  assoc_to_yojson
    [
      ( "TrainingRepositoryCredentialsProviderArn",
        Some
          (training_repository_credentials_provider_arn_to_yojson
             x.training_repository_credentials_provider_arn) );
    ]

let training_image_config_to_yojson (x : training_image_config) =
  assoc_to_yojson
    [
      ( "TrainingRepositoryAuthConfig",
        option_to_yojson training_repository_auth_config_to_yojson x.training_repository_auth_config
      );
      ( "TrainingRepositoryAccessMode",
        Some (training_repository_access_mode_to_yojson x.training_repository_access_mode) );
    ]

let algorithm_specification_to_yojson (x : algorithm_specification) =
  assoc_to_yojson
    [
      ( "TrainingImageConfig",
        option_to_yojson training_image_config_to_yojson x.training_image_config );
      ( "ContainerArguments",
        option_to_yojson training_container_arguments_to_yojson x.container_arguments );
      ( "ContainerEntrypoint",
        option_to_yojson training_container_entrypoint_to_yojson x.container_entrypoint );
      ( "EnableSageMakerMetricsTimeSeries",
        option_to_yojson boolean__to_yojson x.enable_sage_maker_metrics_time_series );
      ("MetricDefinitions", option_to_yojson metric_definition_list_to_yojson x.metric_definitions);
      ("TrainingInputMode", Some (training_input_mode_to_yojson x.training_input_mode));
      ("AlgorithmName", option_to_yojson arn_or_name_to_yojson x.algorithm_name);
      ("TrainingImage", option_to_yojson algorithm_image_to_yojson x.training_image);
    ]

let channel_name_to_yojson = string_to_yojson

let s3_data_type_to_yojson (x : s3_data_type) =
  match x with
  | CONVERSE -> `String "Converse"
  | AUGMENTED_MANIFEST_FILE -> `String "AugmentedManifestFile"
  | S3_PREFIX -> `String "S3Prefix"
  | MANIFEST_FILE -> `String "ManifestFile"

let s3_data_distribution_to_yojson (x : s3_data_distribution) =
  match x with
  | SHARDED_BY_S3_KEY -> `String "ShardedByS3Key"
  | FULLY_REPLICATED -> `String "FullyReplicated"

let attribute_name_to_yojson = string_to_yojson
let attribute_names_to_yojson tree = list_to_yojson attribute_name_to_yojson tree
let instance_group_name_to_yojson = string_to_yojson
let instance_group_names_to_yojson tree = list_to_yojson instance_group_name_to_yojson tree

let hub_access_config_to_yojson (x : hub_access_config) =
  assoc_to_yojson [ ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn)) ]

let s3_data_source_to_yojson (x : s3_data_source) =
  assoc_to_yojson
    [
      ("HubAccessConfig", option_to_yojson hub_access_config_to_yojson x.hub_access_config);
      ("ModelAccessConfig", option_to_yojson model_access_config_to_yojson x.model_access_config);
      ("InstanceGroupNames", option_to_yojson instance_group_names_to_yojson x.instance_group_names);
      ("AttributeNames", option_to_yojson attribute_names_to_yojson x.attribute_names);
      ( "S3DataDistributionType",
        option_to_yojson s3_data_distribution_to_yojson x.s3_data_distribution_type );
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("S3DataType", Some (s3_data_type_to_yojson x.s3_data_type));
    ]

let file_system_access_mode_to_yojson (x : file_system_access_mode) =
  match x with RO -> `String "ro" | RW -> `String "rw"

let file_system_type_to_yojson (x : file_system_type) =
  match x with FSXLUSTRE -> `String "FSxLustre" | EFS -> `String "EFS"

let file_system_data_source_to_yojson (x : file_system_data_source) =
  assoc_to_yojson
    [
      ("DirectoryPath", Some (directory_path_to_yojson x.directory_path));
      ("FileSystemType", Some (file_system_type_to_yojson x.file_system_type));
      ("FileSystemAccessMode", Some (file_system_access_mode_to_yojson x.file_system_access_mode));
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
    ]

let hub_data_set_arn_to_yojson = string_to_yojson

let dataset_source_to_yojson (x : dataset_source) =
  assoc_to_yojson [ ("DatasetArn", Some (hub_data_set_arn_to_yojson x.dataset_arn)) ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ("DatasetSource", option_to_yojson dataset_source_to_yojson x.dataset_source);
      ( "FileSystemDataSource",
        option_to_yojson file_system_data_source_to_yojson x.file_system_data_source );
      ("S3DataSource", option_to_yojson s3_data_source_to_yojson x.s3_data_source);
    ]

let record_wrapper_to_yojson (x : record_wrapper) =
  match x with RECORDIO -> `String "RecordIO" | NONE -> `String "None"

let seed_to_yojson = long_to_yojson

let shuffle_config_to_yojson (x : shuffle_config) =
  assoc_to_yojson [ ("Seed", Some (seed_to_yojson x.seed)) ]

let channel_to_yojson (x : channel) =
  assoc_to_yojson
    [
      ("ShuffleConfig", option_to_yojson shuffle_config_to_yojson x.shuffle_config);
      ("InputMode", option_to_yojson training_input_mode_to_yojson x.input_mode);
      ("RecordWrapperType", option_to_yojson record_wrapper_to_yojson x.record_wrapper_type);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("DataSource", Some (data_source_to_yojson x.data_source));
      ("ChannelName", Some (channel_name_to_yojson x.channel_name));
    ]

let input_data_config_to_yojson tree = list_to_yojson channel_to_yojson tree

let output_compression_type_to_yojson (x : output_compression_type) =
  match x with NONE -> `String "NONE" | GZIP -> `String "GZIP"

let output_data_config_to_yojson (x : output_data_config) =
  assoc_to_yojson
    [
      ("CompressionType", option_to_yojson output_compression_type_to_yojson x.compression_type);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let training_instance_type_to_yojson (x : training_instance_type) =
  match x with
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_P6_B300_48XLARGE -> `String "ml.p6-b300.48xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P6E_GB200_36XLARGE -> `String "ml.p6e-gb200.36xlarge"
  | ML_R7I_48XLARGE -> `String "ml.r7i.48xlarge"
  | ML_R7I_24XLARGE -> `String "ml.r7i.24xlarge"
  | ML_R7I_16XLARGE -> `String "ml.r7i.16xlarge"
  | ML_R7I_12XLARGE -> `String "ml.r7i.12xlarge"
  | ML_R7I_8XLARGE -> `String "ml.r7i.8xlarge"
  | ML_R7I_4XLARGE -> `String "ml.r7i.4xlarge"
  | ML_R7I_2XLARGE -> `String "ml.r7i.2xlarge"
  | ML_R7I_XLARGE -> `String "ml.r7i.xlarge"
  | ML_R7I_LARGE -> `String "ml.r7i.large"
  | ML_C7I_48XLARGE -> `String "ml.c7i.48xlarge"
  | ML_C7I_24XLARGE -> `String "ml.c7i.24xlarge"
  | ML_C7I_16XLARGE -> `String "ml.c7i.16xlarge"
  | ML_C7I_12XLARGE -> `String "ml.c7i.12xlarge"
  | ML_C7I_8XLARGE -> `String "ml.c7i.8xlarge"
  | ML_C7I_4XLARGE -> `String "ml.c7i.4xlarge"
  | ML_C7I_2XLARGE -> `String "ml.c7i.2xlarge"
  | ML_C7I_XLARGE -> `String "ml.c7i.xlarge"
  | ML_C7I_LARGE -> `String "ml.c7i.large"
  | ML_M7I_48XLARGE -> `String "ml.m7i.48xlarge"
  | ML_M7I_24XLARGE -> `String "ml.m7i.24xlarge"
  | ML_M7I_16XLARGE -> `String "ml.m7i.16xlarge"
  | ML_M7I_12XLARGE -> `String "ml.m7i.12xlarge"
  | ML_M7I_8XLARGE -> `String "ml.m7i.8xlarge"
  | ML_M7I_4XLARGE -> `String "ml.m7i.4xlarge"
  | ML_M7I_2XLARGE -> `String "ml.m7i.2xlarge"
  | ML_M7I_XLARGE -> `String "ml.m7i.xlarge"
  | ML_M7I_LARGE -> `String "ml.m7i.large"
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_R5_24XLARGE -> `String "ml.r5.24xlarge"
  | ML_R5_16XLARGE -> `String "ml.r5.16xlarge"
  | ML_R5_12XLARGE -> `String "ml.r5.12xlarge"
  | ML_R5_8XLARGE -> `String "ml.r5.8xlarge"
  | ML_R5_4XLARGE -> `String "ml.r5.4xlarge"
  | ML_R5_2XLARGE -> `String "ml.r5.2xlarge"
  | ML_R5_XLARGE -> `String "ml.r5.xlarge"
  | ML_R5_LARGE -> `String "ml.r5.large"
  | ML_T3_2XLARGE -> `String "ml.t3.2xlarge"
  | ML_T3_XLARGE -> `String "ml.t3.xlarge"
  | ML_T3_LARGE -> `String "ml.t3.large"
  | ML_T3_MEDIUM -> `String "ml.t3.medium"
  | ML_R5D_24XLARGE -> `String "ml.r5d.24xlarge"
  | ML_R5D_16XLARGE -> `String "ml.r5d.16xlarge"
  | ML_R5D_12XLARGE -> `String "ml.r5d.12xlarge"
  | ML_R5D_8XLARGE -> `String "ml.r5d.8xlarge"
  | ML_R5D_4XLARGE -> `String "ml.r5d.4xlarge"
  | ML_R5D_2XLARGE -> `String "ml.r5d.2xlarge"
  | ML_R5D_XLARGE -> `String "ml.r5d.xlarge"
  | ML_R5D_LARGE -> `String "ml.r5d.large"
  | ML_C6I_32XLARGE -> `String "ml.c6i.32xlarge"
  | ML_C6I_24XLARGE -> `String "ml.c6i.24xlarge"
  | ML_C6I_16XLARGE -> `String "ml.c6i.16xlarge"
  | ML_C6I_12XLARGE -> `String "ml.c6i.12xlarge"
  | ML_C6I_4XLARGE -> `String "ml.c6i.4xlarge"
  | ML_C6I_8XLARGE -> `String "ml.c6i.8xlarge"
  | ML_C6I_2XLARGE -> `String "ml.c6i.2xlarge"
  | ML_C6I_XLARGE -> `String "ml.c6i.xlarge"
  | ML_M6I_32XLARGE -> `String "ml.m6i.32xlarge"
  | ML_M6I_24XLARGE -> `String "ml.m6i.24xlarge"
  | ML_M6I_16XLARGE -> `String "ml.m6i.16xlarge"
  | ML_M6I_12XLARGE -> `String "ml.m6i.12xlarge"
  | ML_M6I_8XLARGE -> `String "ml.m6i.8xlarge"
  | ML_M6I_4XLARGE -> `String "ml.m6i.4xlarge"
  | ML_M6I_2XLARGE -> `String "ml.m6i.2xlarge"
  | ML_M6I_XLARGE -> `String "ml.m6i.xlarge"
  | ML_M6I_LARGE -> `String "ml.m6i.large"
  | ML_TRN2_48XLARGE -> `String "ml.trn2.48xlarge"
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_C5N_18XLARGE -> `String "ml.c5n.18xlarge"
  | ML_C5N_9XLARGE -> `String "ml.c5n.9xlarge"
  | ML_C5N_4XLARGE -> `String "ml.c5n.4xlarge"
  | ML_C5N_2XLARGE -> `String "ml.c5n.2xlarge"
  | ML_C5N_XLARGE -> `String "ml.c5n.xlarge"
  | ML_C5_18XLARGE -> `String "ml.c5.18xlarge"
  | ML_C5_9XLARGE -> `String "ml.c5.9xlarge"
  | ML_C5_4XLARGE -> `String "ml.c5.4xlarge"
  | ML_C5_2XLARGE -> `String "ml.c5.2xlarge"
  | ML_C5_XLARGE -> `String "ml.c5.xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P3DN_24XLARGE -> `String "ml.p3dn.24xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_P2_16XLARGE -> `String "ml.p2.16xlarge"
  | ML_P2_8XLARGE -> `String "ml.p2.8xlarge"
  | ML_P2_XLARGE -> `String "ml.p2.xlarge"
  | ML_C4_8XLARGE -> `String "ml.c4.8xlarge"
  | ML_C4_4XLARGE -> `String "ml.c4.4xlarge"
  | ML_C4_2XLARGE -> `String "ml.c4.2xlarge"
  | ML_C4_XLARGE -> `String "ml.c4.xlarge"
  | ML_M5_24XLARGE -> `String "ml.m5.24xlarge"
  | ML_M5_12XLARGE -> `String "ml.m5.12xlarge"
  | ML_M5_4XLARGE -> `String "ml.m5.4xlarge"
  | ML_M5_2XLARGE -> `String "ml.m5.2xlarge"
  | ML_M5_XLARGE -> `String "ml.m5.xlarge"
  | ML_M5_LARGE -> `String "ml.m5.large"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_M4_16XLARGE -> `String "ml.m4.16xlarge"
  | ML_M4_10XLARGE -> `String "ml.m4.10xlarge"
  | ML_M4_4XLARGE -> `String "ml.m4.4xlarge"
  | ML_M4_2XLARGE -> `String "ml.m4.2xlarge"
  | ML_M4_XLARGE -> `String "ml.m4.xlarge"

let training_instance_count_to_yojson = int_to_yojson

let instance_group_to_yojson (x : instance_group) =
  assoc_to_yojson
    [
      ("InstanceGroupName", Some (instance_group_name_to_yojson x.instance_group_name));
      ("InstanceCount", Some (training_instance_count_to_yojson x.instance_count));
      ("InstanceType", Some (training_instance_type_to_yojson x.instance_type));
    ]

let instance_groups_to_yojson tree = list_to_yojson instance_group_to_yojson tree

let placement_specification_to_yojson (x : placement_specification) =
  assoc_to_yojson
    [
      ("InstanceCount", Some (training_instance_count_to_yojson x.instance_count));
      ("UltraServerId", option_to_yojson string256_to_yojson x.ultra_server_id);
    ]

let placement_specifications_to_yojson tree = list_to_yojson placement_specification_to_yojson tree

let instance_placement_config_to_yojson (x : instance_placement_config) =
  assoc_to_yojson
    [
      ( "PlacementSpecifications",
        option_to_yojson placement_specifications_to_yojson x.placement_specifications );
      ("EnableMultipleJobs", option_to_yojson boolean__to_yojson x.enable_multiple_jobs);
    ]

let resource_config_to_yojson (x : resource_config) =
  assoc_to_yojson
    [
      ( "InstancePlacementConfig",
        option_to_yojson instance_placement_config_to_yojson x.instance_placement_config );
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ("InstanceGroups", option_to_yojson instance_groups_to_yojson x.instance_groups);
      ( "KeepAlivePeriodInSeconds",
        option_to_yojson keep_alive_period_in_seconds_to_yojson x.keep_alive_period_in_seconds );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("InstanceCount", option_to_yojson training_instance_count_to_yojson x.instance_count);
      ("InstanceType", option_to_yojson training_instance_type_to_yojson x.instance_type);
    ]

let max_runtime_in_seconds_to_yojson = int_to_yojson
let max_wait_time_in_seconds_to_yojson = int_to_yojson
let max_pending_time_in_seconds_to_yojson = int_to_yojson

let stopping_condition_to_yojson (x : stopping_condition) =
  assoc_to_yojson
    [
      ( "MaxPendingTimeInSeconds",
        option_to_yojson max_pending_time_in_seconds_to_yojson x.max_pending_time_in_seconds );
      ( "MaxWaitTimeInSeconds",
        option_to_yojson max_wait_time_in_seconds_to_yojson x.max_wait_time_in_seconds );
      ( "MaxRuntimeInSeconds",
        option_to_yojson max_runtime_in_seconds_to_yojson x.max_runtime_in_seconds );
    ]

let status_message_to_yojson = string_to_yojson

let secondary_status_transition_to_yojson (x : secondary_status_transition) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson status_message_to_yojson x.status_message);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("Status", Some (secondary_status_to_yojson x.status));
    ]

let secondary_status_transitions_to_yojson tree =
  list_to_yojson secondary_status_transition_to_yojson tree

let float__to_yojson = float_to_yojson

let metric_data_to_yojson (x : metric_data) =
  assoc_to_yojson
    [
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("Value", option_to_yojson float__to_yojson x.value);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
    ]

let final_metric_data_list_to_yojson tree = list_to_yojson metric_data_to_yojson tree

let checkpoint_config_to_yojson (x : checkpoint_config) =
  assoc_to_yojson
    [
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let training_time_in_seconds_to_yojson = int_to_yojson
let billable_time_in_seconds_to_yojson = int_to_yojson
let hook_parameters_to_yojson tree = map_to_yojson config_key_to_yojson config_value_to_yojson tree
let collection_name_to_yojson = string_to_yojson

let collection_parameters_to_yojson tree =
  map_to_yojson config_key_to_yojson config_value_to_yojson tree

let collection_configuration_to_yojson (x : collection_configuration) =
  assoc_to_yojson
    [
      ( "CollectionParameters",
        option_to_yojson collection_parameters_to_yojson x.collection_parameters );
      ("CollectionName", option_to_yojson collection_name_to_yojson x.collection_name);
    ]

let collection_configurations_to_yojson tree =
  list_to_yojson collection_configuration_to_yojson tree

let debug_hook_config_to_yojson (x : debug_hook_config) =
  assoc_to_yojson
    [
      ( "CollectionConfigurations",
        option_to_yojson collection_configurations_to_yojson x.collection_configurations );
      ("HookParameters", option_to_yojson hook_parameters_to_yojson x.hook_parameters);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
    ]

let experiment_config_to_yojson (x : experiment_config) =
  assoc_to_yojson
    [
      ("RunName", option_to_yojson experiment_entity_name_to_yojson x.run_name);
      ( "TrialComponentDisplayName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_display_name );
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
    ]

let debug_rule_configuration_to_yojson (x : debug_rule_configuration) =
  assoc_to_yojson
    [
      ("RuleParameters", option_to_yojson rule_parameters_to_yojson x.rule_parameters);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("InstanceType", option_to_yojson processing_instance_type_to_yojson x.instance_type);
      ("RuleEvaluatorImage", Some (algorithm_image_to_yojson x.rule_evaluator_image));
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
      ("RuleConfigurationName", Some (rule_configuration_name_to_yojson x.rule_configuration_name));
    ]

let debug_rule_configurations_to_yojson tree =
  list_to_yojson debug_rule_configuration_to_yojson tree

let tensor_board_output_config_to_yojson (x : tensor_board_output_config) =
  assoc_to_yojson
    [
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("LocalPath", option_to_yojson directory_path_to_yojson x.local_path);
    ]

let processing_job_arn_to_yojson = string_to_yojson

let rule_evaluation_status_to_yojson (x : rule_evaluation_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | ERROR -> `String "Error"
  | ISSUES_FOUND -> `String "IssuesFound"
  | NO_ISSUES_FOUND -> `String "NoIssuesFound"
  | IN_PROGRESS -> `String "InProgress"

let status_details_to_yojson = string_to_yojson

let debug_rule_evaluation_status_to_yojson (x : debug_rule_evaluation_status) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ( "RuleEvaluationStatus",
        option_to_yojson rule_evaluation_status_to_yojson x.rule_evaluation_status );
      ( "RuleEvaluationJobArn",
        option_to_yojson processing_job_arn_to_yojson x.rule_evaluation_job_arn );
      ( "RuleConfigurationName",
        option_to_yojson rule_configuration_name_to_yojson x.rule_configuration_name );
    ]

let debug_rule_evaluation_statuses_to_yojson tree =
  list_to_yojson debug_rule_evaluation_status_to_yojson tree

let model_package_group_arn_to_yojson = string_to_yojson

let model_package_config_to_yojson (x : model_package_config) =
  assoc_to_yojson
    [
      ( "SourceModelPackageArn",
        option_to_yojson model_package_arn_to_yojson x.source_model_package_arn );
      ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn));
    ]

let profiler_config_to_yojson (x : profiler_config) =
  assoc_to_yojson
    [
      ("DisableProfiler", option_to_yojson disable_profiler_to_yojson x.disable_profiler);
      ("ProfilingParameters", option_to_yojson profiling_parameters_to_yojson x.profiling_parameters);
      ( "ProfilingIntervalInMilliseconds",
        option_to_yojson profiling_interval_in_milliseconds_to_yojson
          x.profiling_interval_in_milliseconds );
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
    ]

let training_environment_value_to_yojson = string_to_yojson
let training_environment_key_to_yojson = string_to_yojson

let training_environment_map_to_yojson tree =
  map_to_yojson training_environment_key_to_yojson training_environment_value_to_yojson tree

let maximum_retry_attempts_to_yojson = int_to_yojson

let retry_strategy_to_yojson (x : retry_strategy) =
  assoc_to_yojson
    [ ("MaximumRetryAttempts", Some (maximum_retry_attempts_to_yojson x.maximum_retry_attempts)) ]

let training_job_to_yojson (x : training_job) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ("Environment", option_to_yojson training_environment_map_to_yojson x.environment);
      ("ProfilerConfig", option_to_yojson profiler_config_to_yojson x.profiler_config);
      ("ModelPackageConfig", option_to_yojson model_package_config_to_yojson x.model_package_config);
      ( "OutputModelPackageArn",
        option_to_yojson model_package_arn_to_yojson x.output_model_package_arn );
      ( "DebugRuleEvaluationStatuses",
        option_to_yojson debug_rule_evaluation_statuses_to_yojson x.debug_rule_evaluation_statuses
      );
      ( "TensorBoardOutputConfig",
        option_to_yojson tensor_board_output_config_to_yojson x.tensor_board_output_config );
      ( "DebugRuleConfigurations",
        option_to_yojson debug_rule_configurations_to_yojson x.debug_rule_configurations );
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("DebugHookConfig", option_to_yojson debug_hook_config_to_yojson x.debug_hook_config);
      ( "BillableTimeInSeconds",
        option_to_yojson billable_time_in_seconds_to_yojson x.billable_time_in_seconds );
      ( "TrainingTimeInSeconds",
        option_to_yojson training_time_in_seconds_to_yojson x.training_time_in_seconds );
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "FinalMetricDataList",
        option_to_yojson final_metric_data_list_to_yojson x.final_metric_data_list );
      ( "SecondaryStatusTransitions",
        option_to_yojson secondary_status_transitions_to_yojson x.secondary_status_transitions );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("StoppingCondition", option_to_yojson stopping_condition_to_yojson x.stopping_condition);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("WarmPoolStatus", option_to_yojson warm_pool_status_to_yojson x.warm_pool_status);
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "AlgorithmSpecification",
        option_to_yojson algorithm_specification_to_yojson x.algorithm_specification );
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("SecondaryStatus", option_to_yojson secondary_status_to_yojson x.secondary_status);
      ("TrainingJobStatus", option_to_yojson training_job_status_to_yojson x.training_job_status);
      ("ModelArtifacts", option_to_yojson model_artifacts_to_yojson x.model_artifacts);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("TuningJobArn", option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.tuning_job_arn);
      ("TrainingJobArn", option_to_yojson training_job_arn_to_yojson x.training_job_arn);
      ("TrainingJobName", option_to_yojson training_job_name_to_yojson x.training_job_name);
    ]

let app_managed_to_yojson = bool_to_yojson

let processing_s3_data_type_to_yojson (x : processing_s3_data_type) =
  match x with S3_PREFIX -> `String "S3Prefix" | MANIFEST_FILE -> `String "ManifestFile"

let processing_s3_compression_type_to_yojson (x : processing_s3_compression_type) =
  match x with GZIP -> `String "Gzip" | NONE -> `String "None"

let processing_s3_input_to_yojson (x : processing_s3_input) =
  assoc_to_yojson
    [
      ( "S3CompressionType",
        option_to_yojson processing_s3_compression_type_to_yojson x.s3_compression_type );
      ( "S3DataDistributionType",
        option_to_yojson processing_s3_data_distribution_type_to_yojson x.s3_data_distribution_type
      );
      ("S3InputMode", option_to_yojson processing_s3_input_mode_to_yojson x.s3_input_mode);
      ("S3DataType", Some (processing_s3_data_type_to_yojson x.s3_data_type));
      ("LocalPath", option_to_yojson processing_local_path_to_yojson x.local_path);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let athena_catalog_to_yojson = string_to_yojson
let athena_database_to_yojson = string_to_yojson
let athena_query_string_to_yojson = string_to_yojson
let athena_work_group_to_yojson = string_to_yojson

let athena_result_format_to_yojson (x : athena_result_format) =
  match x with
  | TEXTFILE -> `String "TEXTFILE"
  | JSON -> `String "JSON"
  | AVRO -> `String "AVRO"
  | ORC -> `String "ORC"
  | PARQUET -> `String "PARQUET"

let athena_result_compression_type_to_yojson (x : athena_result_compression_type) =
  match x with ZLIB -> `String "ZLIB" | SNAPPY -> `String "SNAPPY" | GZIP -> `String "GZIP"

let athena_dataset_definition_to_yojson (x : athena_dataset_definition) =
  assoc_to_yojson
    [
      ( "OutputCompression",
        option_to_yojson athena_result_compression_type_to_yojson x.output_compression );
      ("OutputFormat", Some (athena_result_format_to_yojson x.output_format));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputS3Uri", Some (s3_uri_to_yojson x.output_s3_uri));
      ("WorkGroup", option_to_yojson athena_work_group_to_yojson x.work_group);
      ("QueryString", Some (athena_query_string_to_yojson x.query_string));
      ("Database", Some (athena_database_to_yojson x.database));
      ("Catalog", Some (athena_catalog_to_yojson x.catalog));
    ]

let redshift_cluster_id_to_yojson = string_to_yojson
let redshift_database_to_yojson = string_to_yojson
let redshift_user_name_to_yojson = string_to_yojson
let redshift_query_string_to_yojson = string_to_yojson

let redshift_result_format_to_yojson (x : redshift_result_format) =
  match x with CSV -> `String "CSV" | PARQUET -> `String "PARQUET"

let redshift_result_compression_type_to_yojson (x : redshift_result_compression_type) =
  match x with
  | SNAPPY -> `String "SNAPPY"
  | ZSTD -> `String "ZSTD"
  | BZIP2 -> `String "BZIP2"
  | GZIP -> `String "GZIP"
  | NONE -> `String "None"

let redshift_dataset_definition_to_yojson (x : redshift_dataset_definition) =
  assoc_to_yojson
    [
      ( "OutputCompression",
        option_to_yojson redshift_result_compression_type_to_yojson x.output_compression );
      ("OutputFormat", Some (redshift_result_format_to_yojson x.output_format));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("OutputS3Uri", Some (s3_uri_to_yojson x.output_s3_uri));
      ("ClusterRoleArn", Some (role_arn_to_yojson x.cluster_role_arn));
      ("QueryString", Some (redshift_query_string_to_yojson x.query_string));
      ("DbUser", Some (redshift_user_name_to_yojson x.db_user));
      ("Database", Some (redshift_database_to_yojson x.database));
      ("ClusterId", Some (redshift_cluster_id_to_yojson x.cluster_id));
    ]

let data_distribution_type_to_yojson (x : data_distribution_type) =
  match x with
  | SHARDEDBYS3KEY -> `String "ShardedByS3Key"
  | FULLYREPLICATED -> `String "FullyReplicated"

let input_mode_to_yojson (x : input_mode) =
  match x with FILE -> `String "File" | PIPE -> `String "Pipe"

let dataset_definition_to_yojson (x : dataset_definition) =
  assoc_to_yojson
    [
      ("InputMode", option_to_yojson input_mode_to_yojson x.input_mode);
      ( "DataDistributionType",
        option_to_yojson data_distribution_type_to_yojson x.data_distribution_type );
      ("LocalPath", option_to_yojson processing_local_path_to_yojson x.local_path);
      ( "RedshiftDatasetDefinition",
        option_to_yojson redshift_dataset_definition_to_yojson x.redshift_dataset_definition );
      ( "AthenaDatasetDefinition",
        option_to_yojson athena_dataset_definition_to_yojson x.athena_dataset_definition );
    ]

let processing_input_to_yojson (x : processing_input) =
  assoc_to_yojson
    [
      ("DatasetDefinition", option_to_yojson dataset_definition_to_yojson x.dataset_definition);
      ("S3Input", option_to_yojson processing_s3_input_to_yojson x.s3_input);
      ("AppManaged", option_to_yojson app_managed_to_yojson x.app_managed);
      ("InputName", Some (string__to_yojson x.input_name));
    ]

let processing_inputs_to_yojson tree = list_to_yojson processing_input_to_yojson tree

let processing_s3_output_to_yojson (x : processing_s3_output) =
  assoc_to_yojson
    [
      ("S3UploadMode", Some (processing_s3_upload_mode_to_yojson x.s3_upload_mode));
      ("LocalPath", option_to_yojson processing_local_path_to_yojson x.local_path);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let feature_group_name_to_yojson = string_to_yojson

let processing_feature_store_output_to_yojson (x : processing_feature_store_output) =
  assoc_to_yojson [ ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name)) ]

let processing_output_to_yojson (x : processing_output) =
  assoc_to_yojson
    [
      ("AppManaged", option_to_yojson app_managed_to_yojson x.app_managed);
      ( "FeatureStoreOutput",
        option_to_yojson processing_feature_store_output_to_yojson x.feature_store_output );
      ("S3Output", option_to_yojson processing_s3_output_to_yojson x.s3_output);
      ("OutputName", Some (string__to_yojson x.output_name));
    ]

let processing_outputs_to_yojson tree = list_to_yojson processing_output_to_yojson tree

let processing_output_config_to_yojson (x : processing_output_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Outputs", Some (processing_outputs_to_yojson x.outputs));
    ]

let processing_cluster_config_to_yojson (x : processing_cluster_config) =
  assoc_to_yojson
    [
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VolumeSizeInGB", Some (processing_volume_size_in_g_b_to_yojson x.volume_size_in_g_b));
      ("InstanceType", Some (processing_instance_type_to_yojson x.instance_type));
      ("InstanceCount", Some (processing_instance_count_to_yojson x.instance_count));
    ]

let processing_resources_to_yojson (x : processing_resources) =
  assoc_to_yojson [ ("ClusterConfig", Some (processing_cluster_config_to_yojson x.cluster_config)) ]

let processing_max_runtime_in_seconds_to_yojson = int_to_yojson

let processing_stopping_condition_to_yojson (x : processing_stopping_condition) =
  assoc_to_yojson
    [
      ( "MaxRuntimeInSeconds",
        Some (processing_max_runtime_in_seconds_to_yojson x.max_runtime_in_seconds) );
    ]

let container_arguments_to_yojson tree = list_to_yojson container_argument_to_yojson tree

let app_specification_to_yojson (x : app_specification) =
  assoc_to_yojson
    [
      ("ContainerArguments", option_to_yojson container_arguments_to_yojson x.container_arguments);
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
    ]

let processing_environment_map_to_yojson tree =
  map_to_yojson processing_environment_key_to_yojson processing_environment_value_to_yojson tree

let processing_job_status_to_yojson (x : processing_job_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let exit_message_to_yojson = string_to_yojson

let processing_job_to_yojson (x : processing_job) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("TrainingJobArn", option_to_yojson training_job_arn_to_yojson x.training_job_arn);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ProcessingStartTime", option_to_yojson timestamp_to_yojson x.processing_start_time);
      ("ProcessingEndTime", option_to_yojson timestamp_to_yojson x.processing_end_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ExitMessage", option_to_yojson exit_message_to_yojson x.exit_message);
      ( "ProcessingJobStatus",
        option_to_yojson processing_job_status_to_yojson x.processing_job_status );
      ("ProcessingJobArn", option_to_yojson processing_job_arn_to_yojson x.processing_job_arn);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("Environment", option_to_yojson processing_environment_map_to_yojson x.environment);
      ("AppSpecification", option_to_yojson app_specification_to_yojson x.app_specification);
      ( "StoppingCondition",
        option_to_yojson processing_stopping_condition_to_yojson x.stopping_condition );
      ("ProcessingResources", option_to_yojson processing_resources_to_yojson x.processing_resources);
      ("ProcessingJobName", option_to_yojson processing_job_name_to_yojson x.processing_job_name);
      ( "ProcessingOutputConfig",
        option_to_yojson processing_output_config_to_yojson x.processing_output_config );
      ("ProcessingInputs", option_to_yojson processing_inputs_to_yojson x.processing_inputs);
    ]

let transform_job_name_to_yojson = string_to_yojson
let transform_job_arn_to_yojson = string_to_yojson

let transform_job_status_to_yojson (x : transform_job_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let max_concurrent_transforms_to_yojson = int_to_yojson
let invocations_timeout_in_seconds_to_yojson = int_to_yojson
let invocations_max_retries_to_yojson = int_to_yojson

let model_client_config_to_yojson (x : model_client_config) =
  assoc_to_yojson
    [
      ( "InvocationsMaxRetries",
        option_to_yojson invocations_max_retries_to_yojson x.invocations_max_retries );
      ( "InvocationsTimeoutInSeconds",
        option_to_yojson invocations_timeout_in_seconds_to_yojson x.invocations_timeout_in_seconds
      );
    ]

let max_payload_in_m_b_to_yojson = int_to_yojson

let batch_strategy_to_yojson (x : batch_strategy) =
  match x with SINGLE_RECORD -> `String "SingleRecord" | MULTI_RECORD -> `String "MultiRecord"

let transform_environment_value_to_yojson = string_to_yojson
let transform_environment_key_to_yojson = string_to_yojson

let transform_environment_map_to_yojson tree =
  map_to_yojson transform_environment_key_to_yojson transform_environment_value_to_yojson tree

let transform_s3_data_source_to_yojson (x : transform_s3_data_source) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("S3DataType", Some (s3_data_type_to_yojson x.s3_data_type));
    ]

let transform_data_source_to_yojson (x : transform_data_source) =
  assoc_to_yojson [ ("S3DataSource", Some (transform_s3_data_source_to_yojson x.s3_data_source)) ]

let split_type_to_yojson (x : split_type) =
  match x with
  | TFRECORD -> `String "TFRecord"
  | RECORDIO -> `String "RecordIO"
  | LINE -> `String "Line"
  | NONE -> `String "None"

let transform_input_to_yojson (x : transform_input) =
  assoc_to_yojson
    [
      ("SplitType", option_to_yojson split_type_to_yojson x.split_type);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("DataSource", Some (transform_data_source_to_yojson x.data_source));
    ]

let accept_to_yojson = string_to_yojson

let assembly_type_to_yojson (x : assembly_type) =
  match x with LINE -> `String "Line" | NONE -> `String "None"

let transform_output_to_yojson (x : transform_output) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("AssembleWith", option_to_yojson assembly_type_to_yojson x.assemble_with);
      ("Accept", option_to_yojson accept_to_yojson x.accept);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
    ]

let batch_data_capture_config_to_yojson (x : batch_data_capture_config) =
  assoc_to_yojson
    [
      ("GenerateInferenceId", option_to_yojson boolean__to_yojson x.generate_inference_id);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DestinationS3Uri", Some (s3_uri_to_yojson x.destination_s3_uri));
    ]

let transform_instance_count_to_yojson = int_to_yojson
let transform_ami_version_to_yojson = string_to_yojson

let transform_resources_to_yojson (x : transform_resources) =
  assoc_to_yojson
    [
      ( "TransformAmiVersion",
        option_to_yojson transform_ami_version_to_yojson x.transform_ami_version );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("InstanceCount", Some (transform_instance_count_to_yojson x.instance_count));
      ("InstanceType", Some (transform_instance_type_to_yojson x.instance_type));
    ]

let json_path_to_yojson = string_to_yojson

let join_source_to_yojson (x : join_source) =
  match x with NONE -> `String "None" | INPUT -> `String "Input"

let data_processing_to_yojson (x : data_processing) =
  assoc_to_yojson
    [
      ("JoinSource", option_to_yojson join_source_to_yojson x.join_source);
      ("OutputFilter", option_to_yojson json_path_to_yojson x.output_filter);
      ("InputFilter", option_to_yojson json_path_to_yojson x.input_filter);
    ]

let transform_job_to_yojson (x : transform_job) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("DataProcessing", option_to_yojson data_processing_to_yojson x.data_processing);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("TransformEndTime", option_to_yojson timestamp_to_yojson x.transform_end_time);
      ("TransformStartTime", option_to_yojson timestamp_to_yojson x.transform_start_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TransformResources", option_to_yojson transform_resources_to_yojson x.transform_resources);
      ( "DataCaptureConfig",
        option_to_yojson batch_data_capture_config_to_yojson x.data_capture_config );
      ("TransformOutput", option_to_yojson transform_output_to_yojson x.transform_output);
      ("TransformInput", option_to_yojson transform_input_to_yojson x.transform_input);
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("ModelClientConfig", option_to_yojson model_client_config_to_yojson x.model_client_config);
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("TransformJobStatus", option_to_yojson transform_job_status_to_yojson x.transform_job_status);
      ("TransformJobArn", option_to_yojson transform_job_arn_to_yojson x.transform_job_arn);
      ("TransformJobName", option_to_yojson transform_job_name_to_yojson x.transform_job_name);
    ]

let trial_component_source_detail_to_yojson (x : trial_component_source_detail) =
  assoc_to_yojson
    [
      ("TransformJob", option_to_yojson transform_job_to_yojson x.transform_job);
      ("ProcessingJob", option_to_yojson processing_job_to_yojson x.processing_job);
      ("TrainingJob", option_to_yojson training_job_to_yojson x.training_job);
      ("SourceArn", option_to_yojson trial_component_source_arn_to_yojson x.source_arn);
    ]

let trial_component_simple_summary_to_yojson (x : trial_component_simple_summary) =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "TrialComponentSource",
        option_to_yojson trial_component_source_to_yojson x.trial_component_source );
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
    ]

let trial_component_simple_summaries_to_yojson tree =
  list_to_yojson trial_component_simple_summary_to_yojson tree

let optional_double_to_yojson = double_to_yojson
let optional_integer_to_yojson = int_to_yojson

let trial_component_metric_summary_to_yojson (x : trial_component_metric_summary) =
  assoc_to_yojson
    [
      ("StdDev", option_to_yojson optional_double_to_yojson x.std_dev);
      ("Avg", option_to_yojson optional_double_to_yojson x.avg);
      ("Count", option_to_yojson optional_integer_to_yojson x.count);
      ("Last", option_to_yojson optional_double_to_yojson x.last);
      ("Min", option_to_yojson optional_double_to_yojson x.min);
      ("Max", option_to_yojson optional_double_to_yojson x.max);
      ("TimeStamp", option_to_yojson timestamp_to_yojson x.time_stamp);
      ("SourceArn", option_to_yojson trial_component_source_arn_to_yojson x.source_arn);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
    ]

let trial_component_metric_summaries_to_yojson tree =
  list_to_yojson trial_component_metric_summary_to_yojson tree

let metadata_property_value_to_yojson = string_to_yojson

let metadata_properties_to_yojson (x : metadata_properties) =
  assoc_to_yojson
    [
      ("ProjectId", option_to_yojson metadata_property_value_to_yojson x.project_id);
      ("GeneratedBy", option_to_yojson metadata_property_value_to_yojson x.generated_by);
      ("Repository", option_to_yojson metadata_property_value_to_yojson x.repository);
      ("CommitId", option_to_yojson metadata_property_value_to_yojson x.commit_id);
    ]

let lineage_group_arn_to_yojson = string_to_yojson

let parent_to_yojson (x : parent) =
  assoc_to_yojson
    [
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
    ]

let parents_to_yojson tree = list_to_yojson parent_to_yojson tree

let trial_component_to_yojson (x : trial_component) =
  assoc_to_yojson
    [
      ("RunName", option_to_yojson experiment_entity_name_to_yojson x.run_name);
      ("Parents", option_to_yojson parents_to_yojson x.parents);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("SourceDetail", option_to_yojson trial_component_source_detail_to_yojson x.source_detail);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Metrics", option_to_yojson trial_component_metric_summaries_to_yojson x.metrics);
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("Source", option_to_yojson trial_component_source_to_yojson x.source);
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
    ]

let trial_to_yojson (x : trial) =
  assoc_to_yojson
    [
      ( "TrialComponentSummaries",
        option_to_yojson trial_component_simple_summaries_to_yojson x.trial_component_summaries );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Source", option_to_yojson trial_source_to_yojson x.source);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
    ]

let transformation_attribute_name_to_yojson = string_to_yojson

let transform_job_summary_to_yojson (x : transform_job_summary) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("TransformJobStatus", Some (transform_job_status_to_yojson x.transform_job_status));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("TransformEndTime", option_to_yojson timestamp_to_yojson x.transform_end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TransformJobArn", Some (transform_job_arn_to_yojson x.transform_job_arn));
      ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name));
    ]

let transform_job_summaries_to_yojson tree = list_to_yojson transform_job_summary_to_yojson tree

let transform_job_step_metadata_to_yojson (x : transform_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson transform_job_arn_to_yojson x.arn) ]

let transform_job_definition_to_yojson (x : transform_job_definition) =
  assoc_to_yojson
    [
      ("TransformResources", Some (transform_resources_to_yojson x.transform_resources));
      ("TransformOutput", Some (transform_output_to_yojson x.transform_output));
      ("TransformInput", Some (transform_input_to_yojson x.transform_input));
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
    ]

let training_step_index_to_yojson = long_to_yojson
let parameter_name_to_yojson = string_to_yojson

let parameter_type_to_yojson (x : parameter_type) =
  match x with
  | FREE_TEXT -> `String "FreeText"
  | CATEGORICAL -> `String "Categorical"
  | CONTINUOUS -> `String "Continuous"
  | INTEGER -> `String "Integer"

let parameter_value_to_yojson = string_to_yojson

let integer_parameter_range_specification_to_yojson (x : integer_parameter_range_specification) =
  assoc_to_yojson
    [
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
    ]

let continuous_parameter_range_specification_to_yojson
    (x : continuous_parameter_range_specification) =
  assoc_to_yojson
    [
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
    ]

let parameter_values_to_yojson tree = list_to_yojson parameter_value_to_yojson tree

let categorical_parameter_range_specification_to_yojson
    (x : categorical_parameter_range_specification) =
  assoc_to_yojson [ ("Values", Some (parameter_values_to_yojson x.values)) ]

let parameter_range_to_yojson (x : parameter_range) =
  assoc_to_yojson
    [
      ( "CategoricalParameterRangeSpecification",
        option_to_yojson categorical_parameter_range_specification_to_yojson
          x.categorical_parameter_range_specification );
      ( "ContinuousParameterRangeSpecification",
        option_to_yojson continuous_parameter_range_specification_to_yojson
          x.continuous_parameter_range_specification );
      ( "IntegerParameterRangeSpecification",
        option_to_yojson integer_parameter_range_specification_to_yojson
          x.integer_parameter_range_specification );
    ]

let hyper_parameter_specification_to_yojson (x : hyper_parameter_specification) =
  assoc_to_yojson
    [
      ("DefaultValue", option_to_yojson hyper_parameter_value_to_yojson x.default_value);
      ("IsRequired", option_to_yojson boolean__to_yojson x.is_required);
      ("IsTunable", option_to_yojson boolean__to_yojson x.is_tunable);
      ("Range", option_to_yojson parameter_range_to_yojson x.range);
      ("Type", Some (parameter_type_to_yojson x.type_));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Name", Some (parameter_name_to_yojson x.name));
    ]

let hyper_parameter_specifications_to_yojson tree =
  list_to_yojson hyper_parameter_specification_to_yojson tree

let training_instance_types_to_yojson tree = list_to_yojson training_instance_type_to_yojson tree
let compression_types_to_yojson tree = list_to_yojson compression_type_to_yojson tree
let input_modes_to_yojson tree = list_to_yojson training_input_mode_to_yojson tree

let channel_specification_to_yojson (x : channel_specification) =
  assoc_to_yojson
    [
      ("SupportedInputModes", Some (input_modes_to_yojson x.supported_input_modes));
      ( "SupportedCompressionTypes",
        option_to_yojson compression_types_to_yojson x.supported_compression_types );
      ("SupportedContentTypes", Some (content_types_to_yojson x.supported_content_types));
      ("IsRequired", option_to_yojson boolean__to_yojson x.is_required);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Name", Some (channel_name_to_yojson x.name));
    ]

let channel_specifications_to_yojson tree = list_to_yojson channel_specification_to_yojson tree

let hyper_parameter_tuning_job_objective_type_to_yojson
    (x : hyper_parameter_tuning_job_objective_type) =
  match x with MINIMIZE -> `String "Minimize" | MAXIMIZE -> `String "Maximize"

let hyper_parameter_tuning_job_objective_to_yojson (x : hyper_parameter_tuning_job_objective) =
  assoc_to_yojson
    [
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("Type", Some (hyper_parameter_tuning_job_objective_type_to_yojson x.type_));
    ]

let hyper_parameter_tuning_job_objectives_to_yojson tree =
  list_to_yojson hyper_parameter_tuning_job_objective_to_yojson tree

let training_specification_to_yojson (x : training_specification) =
  assoc_to_yojson
    [
      ( "AdditionalS3DataSource",
        option_to_yojson additional_s3_data_source_to_yojson x.additional_s3_data_source );
      ( "SupportedTuningJobObjectiveMetrics",
        option_to_yojson hyper_parameter_tuning_job_objectives_to_yojson
          x.supported_tuning_job_objective_metrics );
      ("TrainingChannels", Some (channel_specifications_to_yojson x.training_channels));
      ("MetricDefinitions", option_to_yojson metric_definition_list_to_yojson x.metric_definitions);
      ( "SupportsDistributedTraining",
        option_to_yojson boolean__to_yojson x.supports_distributed_training );
      ( "SupportedTrainingInstanceTypes",
        Some (training_instance_types_to_yojson x.supported_training_instance_types) );
      ( "SupportedHyperParameters",
        option_to_yojson hyper_parameter_specifications_to_yojson x.supported_hyper_parameters );
      ("TrainingImageDigest", option_to_yojson image_digest_to_yojson x.training_image_digest);
      ("TrainingImage", Some (container_image_to_yojson x.training_image));
    ]

let total_step_count_per_epoch_to_yojson = long_to_yojson
let training_epoch_index_to_yojson = long_to_yojson
let training_epoch_count_to_yojson = long_to_yojson

let training_progress_info_to_yojson (x : training_progress_info) =
  assoc_to_yojson
    [
      ("MaxEpoch", option_to_yojson training_epoch_count_to_yojson x.max_epoch);
      ("CurrentEpoch", option_to_yojson training_epoch_index_to_yojson x.current_epoch);
      ("CurrentStep", option_to_yojson training_step_index_to_yojson x.current_step);
      ( "TotalStepCountPerEpoch",
        option_to_yojson total_step_count_per_epoch_to_yojson x.total_step_count_per_epoch );
    ]

let training_plan_name_to_yojson = string_to_yojson

let training_plan_status_to_yojson (x : training_plan_status) =
  match x with
  | FAILED -> `String "Failed"
  | EXPIRED -> `String "Expired"
  | SCHEDULED -> `String "Scheduled"
  | ACTIVE -> `String "Active"
  | PENDING -> `String "Pending"

let training_plan_status_message_to_yojson = string_to_yojson
let training_plan_duration_hours_to_yojson = long_to_yojson
let training_plan_duration_minutes_to_yojson = long_to_yojson
let currency_code_to_yojson = string_to_yojson

let sage_maker_resource_name_to_yojson (x : sage_maker_resource_name) =
  match x with
  | STUDIO_APPS -> `String "studio-apps"
  | ENDPOINT -> `String "endpoint"
  | HYPERPOD_CLUSTER -> `String "hyperpod-cluster"
  | TRAINING_JOB -> `String "training-job"

let sage_maker_resource_names_to_yojson tree =
  list_to_yojson sage_maker_resource_name_to_yojson tree

let reserved_capacity_arn_to_yojson = string_to_yojson

let reserved_capacity_type_to_yojson (x : reserved_capacity_type) =
  match x with INSTANCE -> `String "Instance" | ULTRASERVER -> `String "UltraServer"

let reserved_capacity_status_to_yojson (x : reserved_capacity_status) =
  match x with
  | FAILED -> `String "Failed"
  | EXPIRED -> `String "Expired"
  | SCHEDULED -> `String "Scheduled"
  | ACTIVE -> `String "Active"
  | PENDING -> `String "Pending"

let availability_zone_id_to_yojson = string_to_yojson
let reserved_capacity_duration_hours_to_yojson = long_to_yojson
let reserved_capacity_duration_minutes_to_yojson = long_to_yojson

let reserved_capacity_summary_to_yojson (x : reserved_capacity_summary) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "DurationMinutes",
        option_to_yojson reserved_capacity_duration_minutes_to_yojson x.duration_minutes );
      ("DurationHours", option_to_yojson reserved_capacity_duration_hours_to_yojson x.duration_hours);
      ("AvailabilityZoneId", option_to_yojson availability_zone_id_to_yojson x.availability_zone_id);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("Status", Some (reserved_capacity_status_to_yojson x.status));
      ("TotalInstanceCount", Some (total_instance_count_to_yojson x.total_instance_count));
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ("UltraServerType", option_to_yojson ultra_server_type_to_yojson x.ultra_server_type);
      ( "ReservedCapacityType",
        option_to_yojson reserved_capacity_type_to_yojson x.reserved_capacity_type );
      ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn));
    ]

let reserved_capacity_summaries_to_yojson tree =
  list_to_yojson reserved_capacity_summary_to_yojson tree

let training_plan_summary_to_yojson (x : training_plan_summary) =
  assoc_to_yojson
    [
      ( "ReservedCapacitySummaries",
        option_to_yojson reserved_capacity_summaries_to_yojson x.reserved_capacity_summaries );
      ("TargetResources", option_to_yojson sage_maker_resource_names_to_yojson x.target_resources);
      ( "TotalUltraServerCount",
        option_to_yojson ultra_server_count_to_yojson x.total_ultra_server_count );
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ("TotalInstanceCount", option_to_yojson total_instance_count_to_yojson x.total_instance_count);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "DurationMinutes",
        option_to_yojson training_plan_duration_minutes_to_yojson x.duration_minutes );
      ("DurationHours", option_to_yojson training_plan_duration_hours_to_yojson x.duration_hours);
      ("StatusMessage", option_to_yojson training_plan_status_message_to_yojson x.status_message);
      ("Status", Some (training_plan_status_to_yojson x.status));
      ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name));
      ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn));
    ]

let training_plan_summaries_to_yojson tree = list_to_yojson training_plan_summary_to_yojson tree

let training_plan_sort_order_to_yojson (x : training_plan_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let training_plan_sort_by_to_yojson (x : training_plan_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | START_TIME -> `String "StartTime"
  | NAME -> `String "TrainingPlanName"

let training_plan_offering_id_to_yojson = string_to_yojson
let reserved_capacity_instance_count_to_yojson = int_to_yojson

let reserved_capacity_offering_to_yojson (x : reserved_capacity_offering) =
  assoc_to_yojson
    [
      ("ExtensionEndTime", option_to_yojson timestamp_to_yojson x.extension_end_time);
      ("ExtensionStartTime", option_to_yojson timestamp_to_yojson x.extension_start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "DurationMinutes",
        option_to_yojson reserved_capacity_duration_minutes_to_yojson x.duration_minutes );
      ("DurationHours", option_to_yojson reserved_capacity_duration_hours_to_yojson x.duration_hours);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("InstanceCount", Some (reserved_capacity_instance_count_to_yojson x.instance_count));
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ("UltraServerType", option_to_yojson ultra_server_type_to_yojson x.ultra_server_type);
      ( "ReservedCapacityType",
        option_to_yojson reserved_capacity_type_to_yojson x.reserved_capacity_type );
    ]

let reserved_capacity_offerings_to_yojson tree =
  list_to_yojson reserved_capacity_offering_to_yojson tree

let training_plan_offering_to_yojson (x : training_plan_offering) =
  assoc_to_yojson
    [
      ( "ReservedCapacityOfferings",
        option_to_yojson reserved_capacity_offerings_to_yojson x.reserved_capacity_offerings );
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ( "DurationMinutes",
        option_to_yojson training_plan_duration_minutes_to_yojson x.duration_minutes );
      ("DurationHours", option_to_yojson training_plan_duration_hours_to_yojson x.duration_hours);
      ("RequestedEndTimeBefore", option_to_yojson timestamp_to_yojson x.requested_end_time_before);
      ("RequestedStartTimeAfter", option_to_yojson timestamp_to_yojson x.requested_start_time_after);
      ("TargetResources", Some (sage_maker_resource_names_to_yojson x.target_resources));
      ( "TrainingPlanOfferingId",
        Some (training_plan_offering_id_to_yojson x.training_plan_offering_id) );
    ]

let training_plan_offerings_to_yojson tree = list_to_yojson training_plan_offering_to_yojson tree

let training_plan_filter_name_to_yojson (x : training_plan_filter_name) =
  match x with STATUS -> `String "Status"

let string64_to_yojson = string_to_yojson

let training_plan_filter_to_yojson (x : training_plan_filter) =
  assoc_to_yojson
    [
      ("Value", Some (string64_to_yojson x.value));
      ("Name", Some (training_plan_filter_name_to_yojson x.name));
    ]

let training_plan_filters_to_yojson tree = list_to_yojson training_plan_filter_to_yojson tree
let training_plan_extension_offering_id_to_yojson = string_to_yojson
let training_plan_extension_duration_hours_to_yojson = int_to_yojson

let training_plan_extension_to_yojson (x : training_plan_extension) =
  assoc_to_yojson
    [
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ( "DurationHours",
        option_to_yojson training_plan_extension_duration_hours_to_yojson x.duration_hours );
      ("AvailabilityZoneId", option_to_yojson availability_zone_id_to_yojson x.availability_zone_id);
      ("AvailabilityZone", option_to_yojson string256_to_yojson x.availability_zone);
      ("PaymentStatus", option_to_yojson string256_to_yojson x.payment_status);
      ("Status", option_to_yojson string256_to_yojson x.status);
      ("EndDate", option_to_yojson timestamp_to_yojson x.end_date);
      ("StartDate", option_to_yojson timestamp_to_yojson x.start_date);
      ("ExtendedAt", option_to_yojson timestamp_to_yojson x.extended_at);
      ( "TrainingPlanExtensionOfferingId",
        Some (training_plan_extension_offering_id_to_yojson x.training_plan_extension_offering_id)
      );
    ]

let training_plan_extensions_to_yojson tree = list_to_yojson training_plan_extension_to_yojson tree

let training_plan_extension_offering_to_yojson (x : training_plan_extension_offering) =
  assoc_to_yojson
    [
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ( "DurationHours",
        option_to_yojson training_plan_extension_duration_hours_to_yojson x.duration_hours );
      ("EndDate", option_to_yojson timestamp_to_yojson x.end_date);
      ("StartDate", option_to_yojson timestamp_to_yojson x.start_date);
      ("AvailabilityZone", option_to_yojson string256_to_yojson x.availability_zone);
      ( "TrainingPlanExtensionOfferingId",
        Some (training_plan_extension_offering_id_to_yojson x.training_plan_extension_offering_id)
      );
    ]

let training_plan_extension_offerings_to_yojson tree =
  list_to_yojson training_plan_extension_offering_to_yojson tree

let training_plan_duration_hours_input_to_yojson = long_to_yojson
let training_plan_arns_to_yojson tree = list_to_yojson training_plan_arn_to_yojson tree

let training_job_summary_to_yojson (x : training_job_summary) =
  assoc_to_yojson
    [
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ("WarmPoolStatus", option_to_yojson warm_pool_status_to_yojson x.warm_pool_status);
      ("SecondaryStatus", option_to_yojson secondary_status_to_yojson x.secondary_status);
      ("TrainingJobStatus", Some (training_job_status_to_yojson x.training_job_status));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn));
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
    ]

let training_job_summaries_to_yojson tree = list_to_yojson training_job_summary_to_yojson tree

let training_job_step_metadata_to_yojson (x : training_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson training_job_arn_to_yojson x.arn) ]

let training_job_status_counter_to_yojson = int_to_yojson

let training_job_status_counters_to_yojson (x : training_job_status_counters) =
  assoc_to_yojson
    [
      ("Stopped", option_to_yojson training_job_status_counter_to_yojson x.stopped);
      ( "NonRetryableError",
        option_to_yojson training_job_status_counter_to_yojson x.non_retryable_error );
      ("RetryableError", option_to_yojson training_job_status_counter_to_yojson x.retryable_error);
      ("InProgress", option_to_yojson training_job_status_counter_to_yojson x.in_progress);
      ("Completed", option_to_yojson training_job_status_counter_to_yojson x.completed);
    ]

let training_job_sort_by_options_to_yojson (x : training_job_sort_by_options) =
  match x with
  | FinalObjectiveMetricValue -> `String "FinalObjectiveMetricValue"
  | Status -> `String "Status"
  | CreationTime -> `String "CreationTime"
  | Name -> `String "Name"

let training_job_early_stopping_type_to_yojson (x : training_job_early_stopping_type) =
  match x with AUTO -> `String "Auto" | OFF -> `String "Off"

let training_job_definition_to_yojson (x : training_job_definition) =
  assoc_to_yojson
    [
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("ResourceConfig", Some (resource_config_to_yojson x.resource_config));
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ("TrainingInputMode", Some (training_input_mode_to_yojson x.training_input_mode));
    ]

let traffic_type_to_yojson (x : traffic_type) =
  match x with STAIRS -> `String "STAIRS" | PHASES -> `String "PHASES"

let initial_number_of_users_to_yojson = int_to_yojson
let spawn_rate_to_yojson = int_to_yojson
let traffic_duration_in_seconds_to_yojson = int_to_yojson

let phase_to_yojson (x : phase) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson traffic_duration_in_seconds_to_yojson x.duration_in_seconds );
      ("SpawnRate", option_to_yojson spawn_rate_to_yojson x.spawn_rate);
      ( "InitialNumberOfUsers",
        option_to_yojson initial_number_of_users_to_yojson x.initial_number_of_users );
    ]

let phases_to_yojson tree = list_to_yojson phase_to_yojson tree
let number_of_steps_to_yojson = int_to_yojson

let stairs_to_yojson (x : stairs) =
  assoc_to_yojson
    [
      ("UsersPerStep", option_to_yojson users_per_step_to_yojson x.users_per_step);
      ("NumberOfSteps", option_to_yojson number_of_steps_to_yojson x.number_of_steps);
      ( "DurationInSeconds",
        option_to_yojson traffic_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let traffic_pattern_to_yojson (x : traffic_pattern) =
  assoc_to_yojson
    [
      ("Stairs", option_to_yojson stairs_to_yojson x.stairs);
      ("Phases", option_to_yojson phases_to_yojson x.phases);
      ("TrafficType", option_to_yojson traffic_type_to_yojson x.traffic_type);
    ]

let tracking_server_url_to_yojson = string_to_yojson

let tracking_server_status_to_yojson (x : tracking_server_status) =
  match x with
  | MAINTENANCE_FAILED -> `String "MaintenanceFailed"
  | MAINTENANCE_COMPLETE -> `String "MaintenanceComplete"
  | MAINTENANCE_IN_PROGRESS -> `String "MaintenanceInProgress"
  | START_FAILED -> `String "StartFailed"
  | STARTED -> `String "Started"
  | STARTING -> `String "Starting"
  | STOP_FAILED -> `String "StopFailed"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATED -> `String "Updated"
  | UPDATING -> `String "Updating"
  | CREATE_FAILED -> `String "CreateFailed"
  | CREATED -> `String "Created"
  | CREATING -> `String "Creating"

let is_tracking_server_active_to_yojson (x : is_tracking_server_active) =
  match x with INACTIVE -> `String "Inactive" | ACTIVE -> `String "Active"

let mlflow_version_to_yojson = string_to_yojson

let tracking_server_summary_to_yojson (x : tracking_server_summary) =
  assoc_to_yojson
    [
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("IsActive", option_to_yojson is_tracking_server_active_to_yojson x.is_active);
      ( "TrackingServerStatus",
        option_to_yojson tracking_server_status_to_yojson x.tracking_server_status );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("TrackingServerName", option_to_yojson tracking_server_name_to_yojson x.tracking_server_name);
      ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn);
    ]

let tracking_server_summary_list_to_yojson tree =
  list_to_yojson tracking_server_summary_to_yojson tree

let tracking_server_maintenance_status_to_yojson (x : tracking_server_maintenance_status) =
  match x with
  | MAINTENANCE_FAILED -> `String "MaintenanceFailed"
  | MAINTENANCE_COMPLETE -> `String "MaintenanceComplete"
  | MAINTENANCE_IN_PROGRESS -> `String "MaintenanceInProgress"

let long_to_yojson = long_to_yojson

let relation_to_yojson (x : relation) =
  match x with
  | GREATER_THAN_OR_EQUAL_TO -> `String "GreaterThanOrEqualTo"
  | EQUAL_TO -> `String "EqualTo"

let total_hits_to_yojson (x : total_hits) =
  assoc_to_yojson
    [
      ("Relation", option_to_yojson relation_to_yojson x.relation);
      ("Value", option_to_yojson long_to_yojson x.value);
    ]

let token_value_to_yojson = string_to_yojson
let timestamp_attribute_name_to_yojson = string_to_yojson
let filling_transformation_value_to_yojson = string_to_yojson

let filling_type_to_yojson (x : filling_type) =
  match x with
  | FuturefillValue -> `String "futurefill_value"
  | BackfillValue -> `String "backfill_value"
  | MiddlefillValue -> `String "middlefill_value"
  | FrontfillValue -> `String "frontfill_value"
  | Futurefill -> `String "futurefill"
  | Backfill -> `String "backfill"
  | Middlefill -> `String "middlefill"
  | Frontfill -> `String "frontfill"

let filling_transformation_map_to_yojson tree =
  map_to_yojson filling_type_to_yojson filling_transformation_value_to_yojson tree

let filling_transformations_to_yojson tree =
  map_to_yojson transformation_attribute_name_to_yojson filling_transformation_map_to_yojson tree

let aggregation_transformation_value_to_yojson (x : aggregation_transformation_value) =
  match x with
  | Max -> `String "max"
  | Min -> `String "min"
  | First -> `String "first"
  | Avg -> `String "avg"
  | Sum -> `String "sum"

let aggregation_transformations_to_yojson tree =
  map_to_yojson transformation_attribute_name_to_yojson aggregation_transformation_value_to_yojson
    tree

let time_series_transformations_to_yojson (x : time_series_transformations) =
  assoc_to_yojson
    [
      ("Aggregation", option_to_yojson aggregation_transformations_to_yojson x.aggregation);
      ("Filling", option_to_yojson filling_transformations_to_yojson x.filling);
    ]

let max_candidates_to_yojson = int_to_yojson
let max_runtime_per_training_job_in_seconds_to_yojson = int_to_yojson
let max_auto_ml_job_runtime_in_seconds_to_yojson = int_to_yojson

let auto_ml_job_completion_criteria_to_yojson (x : auto_ml_job_completion_criteria) =
  assoc_to_yojson
    [
      ( "MaxAutoMLJobRuntimeInSeconds",
        option_to_yojson max_auto_ml_job_runtime_in_seconds_to_yojson
          x.max_auto_ml_job_runtime_in_seconds );
      ( "MaxRuntimePerTrainingJobInSeconds",
        option_to_yojson max_runtime_per_training_job_in_seconds_to_yojson
          x.max_runtime_per_training_job_in_seconds );
      ("MaxCandidates", option_to_yojson max_candidates_to_yojson x.max_candidates);
    ]

let forecast_frequency_to_yojson = string_to_yojson
let forecast_horizon_to_yojson = int_to_yojson
let forecast_quantile_to_yojson = string_to_yojson
let forecast_quantiles_to_yojson tree = list_to_yojson forecast_quantile_to_yojson tree
let target_attribute_name_to_yojson = string_to_yojson
let item_identifier_attribute_name_to_yojson = string_to_yojson
let grouping_attribute_name_to_yojson = string_to_yojson
let grouping_attribute_names_to_yojson tree = list_to_yojson grouping_attribute_name_to_yojson tree

let time_series_config_to_yojson (x : time_series_config) =
  assoc_to_yojson
    [
      ( "GroupingAttributeNames",
        option_to_yojson grouping_attribute_names_to_yojson x.grouping_attribute_names );
      ( "ItemIdentifierAttributeName",
        Some (item_identifier_attribute_name_to_yojson x.item_identifier_attribute_name) );
      ( "TimestampAttributeName",
        Some (timestamp_attribute_name_to_yojson x.timestamp_attribute_name) );
      ("TargetAttributeName", Some (target_attribute_name_to_yojson x.target_attribute_name));
    ]

let country_code_to_yojson = string_to_yojson

let holiday_config_attributes_to_yojson (x : holiday_config_attributes) =
  assoc_to_yojson [ ("CountryCode", option_to_yojson country_code_to_yojson x.country_code) ]

let holiday_config_to_yojson tree = list_to_yojson holiday_config_attributes_to_yojson tree

let auto_ml_algorithm_to_yojson (x : auto_ml_algorithm) =
  match x with
  | ETS -> `String "ets"
  | ARIMA -> `String "arima"
  | NPTS -> `String "npts"
  | PROPHET -> `String "prophet"
  | DEEPAR -> `String "deepar"
  | CNN_QR -> `String "cnn-qr"
  | FASTAI -> `String "fastai"
  | NN_TORCH -> `String "nn-torch"
  | EXTRA_TREES -> `String "extra-trees"
  | RANDOMFOREST -> `String "randomforest"
  | CATBOOST -> `String "catboost"
  | LIGHTGBM -> `String "lightgbm"
  | MLP -> `String "mlp"
  | LINEAR_LEARNER -> `String "linear-learner"
  | XGBOOST -> `String "xgboost"

let auto_ml_algorithms_to_yojson tree = list_to_yojson auto_ml_algorithm_to_yojson tree

let auto_ml_algorithm_config_to_yojson (x : auto_ml_algorithm_config) =
  assoc_to_yojson [ ("AutoMLAlgorithms", Some (auto_ml_algorithms_to_yojson x.auto_ml_algorithms)) ]

let auto_ml_algorithms_config_to_yojson tree =
  list_to_yojson auto_ml_algorithm_config_to_yojson tree

let candidate_generation_config_to_yojson (x : candidate_generation_config) =
  assoc_to_yojson
    [
      ("AlgorithmsConfig", option_to_yojson auto_ml_algorithms_config_to_yojson x.algorithms_config);
    ]

let time_series_forecasting_job_config_to_yojson (x : time_series_forecasting_job_config) =
  assoc_to_yojson
    [
      ( "CandidateGenerationConfig",
        option_to_yojson candidate_generation_config_to_yojson x.candidate_generation_config );
      ("HolidayConfig", option_to_yojson holiday_config_to_yojson x.holiday_config);
      ("TimeSeriesConfig", Some (time_series_config_to_yojson x.time_series_config));
      ("Transformations", option_to_yojson time_series_transformations_to_yojson x.transformations);
      ("ForecastQuantiles", option_to_yojson forecast_quantiles_to_yojson x.forecast_quantiles);
      ("ForecastHorizon", Some (forecast_horizon_to_yojson x.forecast_horizon));
      ("ForecastFrequency", Some (forecast_frequency_to_yojson x.forecast_frequency));
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ("FeatureSpecificationS3Uri", option_to_yojson s3_uri_to_yojson x.feature_specification_s3_uri);
    ]

let throughput_config_description_to_yojson (x : throughput_config_description) =
  assoc_to_yojson
    [
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_write_capacity_units );
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_read_capacity_units );
      ("ThroughputMode", Some (throughput_mode_to_yojson x.throughput_mode));
    ]

let throughput_config_to_yojson (x : throughput_config) =
  assoc_to_yojson
    [
      ( "ProvisionedWriteCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_write_capacity_units );
      ( "ProvisionedReadCapacityUnits",
        option_to_yojson capacity_unit_to_yojson x.provisioned_read_capacity_units );
      ("ThroughputMode", Some (throughput_mode_to_yojson x.throughput_mode));
    ]

let base_model_name_to_yojson = string_to_yojson

let text_generation_resolved_attributes_to_yojson (x : text_generation_resolved_attributes) =
  assoc_to_yojson
    [ ("BaseModelName", option_to_yojson base_model_name_to_yojson x.base_model_name) ]

let text_generation_hyper_parameter_value_to_yojson = string_to_yojson
let text_generation_hyper_parameter_key_to_yojson = string_to_yojson

let text_generation_hyper_parameters_to_yojson tree =
  map_to_yojson text_generation_hyper_parameter_key_to_yojson
    text_generation_hyper_parameter_value_to_yojson tree

let text_generation_job_config_to_yojson (x : text_generation_job_config) =
  assoc_to_yojson
    [
      ("ModelAccessConfig", option_to_yojson model_access_config_to_yojson x.model_access_config);
      ( "TextGenerationHyperParameters",
        option_to_yojson text_generation_hyper_parameters_to_yojson
          x.text_generation_hyper_parameters );
      ("BaseModelName", option_to_yojson base_model_name_to_yojson x.base_model_name);
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
    ]

let content_column_to_yojson = string_to_yojson
let target_label_column_to_yojson = string_to_yojson

let text_classification_job_config_to_yojson (x : text_classification_job_config) =
  assoc_to_yojson
    [
      ("TargetLabelColumn", Some (target_label_column_to_yojson x.target_label_column));
      ("ContentColumn", Some (content_column_to_yojson x.content_column));
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
    ]

let cfn_stack_parameter_to_yojson (x : cfn_stack_parameter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson cfn_stack_parameter_value_to_yojson x.value);
      ("Key", Some (cfn_stack_parameter_key_to_yojson x.key));
    ]

let cfn_stack_parameters_to_yojson tree = list_to_yojson cfn_stack_parameter_to_yojson tree
let cfn_stack_name_to_yojson = string_to_yojson
let cfn_stack_id_to_yojson = string_to_yojson
let cfn_stack_status_message_to_yojson = string_to_yojson

let cfn_stack_detail_to_yojson (x : cfn_stack_detail) =
  assoc_to_yojson
    [
      ("StatusMessage", Some (cfn_stack_status_message_to_yojson x.status_message));
      ("Id", option_to_yojson cfn_stack_id_to_yojson x.id);
      ("Name", option_to_yojson cfn_stack_name_to_yojson x.name);
    ]

let cfn_template_provider_detail_to_yojson (x : cfn_template_provider_detail) =
  assoc_to_yojson
    [
      ("StackDetail", option_to_yojson cfn_stack_detail_to_yojson x.stack_detail);
      ("Parameters", option_to_yojson cfn_stack_parameters_to_yojson x.parameters);
      ("RoleARN", option_to_yojson role_arn_to_yojson x.role_ar_n);
      ("TemplateURL", Some (cfn_template_ur_l_to_yojson x.template_ur_l));
      ("TemplateName", Some (cfn_template_name_to_yojson x.template_name));
    ]

let template_provider_detail_to_yojson (x : template_provider_detail) =
  assoc_to_yojson
    [
      ( "CfnTemplateProviderDetail",
        option_to_yojson cfn_template_provider_detail_to_yojson x.cfn_template_provider_detail );
    ]

let template_provider_detail_list_to_yojson tree =
  list_to_yojson template_provider_detail_to_yojson tree

let task_title_to_yojson = string_to_yojson
let task_time_limit_in_seconds_to_yojson = int_to_yojson
let task_keyword_to_yojson = string_to_yojson
let task_keywords_to_yojson tree = list_to_yojson task_keyword_to_yojson tree
let task_input_to_yojson = string_to_yojson
let task_description_to_yojson = string_to_yojson
let task_availability_lifetime_in_seconds_to_yojson = int_to_yojson

let predefined_metric_specification_to_yojson (x : predefined_metric_specification) =
  assoc_to_yojson
    [ ("PredefinedMetricType", option_to_yojson string__to_yojson x.predefined_metric_type) ]

let statistic_to_yojson (x : statistic) =
  match x with
  | SUM -> `String "Sum"
  | SAMPLE_COUNT -> `String "SampleCount"
  | MAXIMUM -> `String "Maximum"
  | MINIMUM -> `String "Minimum"
  | AVERAGE -> `String "Average"

let customized_metric_specification_to_yojson (x : customized_metric_specification) =
  assoc_to_yojson
    [
      ("Statistic", option_to_yojson statistic_to_yojson x.statistic);
      ("Namespace", option_to_yojson string__to_yojson x.namespace);
      ("MetricName", option_to_yojson string__to_yojson x.metric_name);
    ]

let metric_specification_to_yojson (x : metric_specification) =
  match x with
  | Customized arg ->
      assoc_to_yojson [ ("Customized", Some (customized_metric_specification_to_yojson arg)) ]
  | Predefined arg ->
      assoc_to_yojson [ ("Predefined", Some (predefined_metric_specification_to_yojson arg)) ]

let double_to_yojson = double_to_yojson

let target_tracking_scaling_policy_configuration_to_yojson
    (x : target_tracking_scaling_policy_configuration) =
  assoc_to_yojson
    [
      ("TargetValue", option_to_yojson double_to_yojson x.target_value);
      ("MetricSpecification", option_to_yojson metric_specification_to_yojson x.metric_specification);
    ]

let target_platform_os_to_yojson (x : target_platform_os) =
  match x with LINUX -> `String "LINUX" | ANDROID -> `String "ANDROID"

let target_platform_arch_to_yojson (x : target_platform_arch) =
  match x with
  | ARM_EABIHF -> `String "ARM_EABIHF"
  | ARM_EABI -> `String "ARM_EABI"
  | ARM64 -> `String "ARM64"
  | X86 -> `String "X86"
  | X86_64 -> `String "X86_64"

let target_platform_accelerator_to_yojson (x : target_platform_accelerator) =
  match x with
  | NNA -> `String "NNA"
  | NVIDIA -> `String "NVIDIA"
  | MALI -> `String "MALI"
  | INTEL_GRAPHICS -> `String "INTEL_GRAPHICS"

let target_platform_to_yojson (x : target_platform) =
  assoc_to_yojson
    [
      ("Accelerator", option_to_yojson target_platform_accelerator_to_yojson x.accelerator);
      ("Arch", Some (target_platform_arch_to_yojson x.arch));
      ("Os", Some (target_platform_os_to_yojson x.os));
    ]

let target_device_to_yojson (x : target_device) =
  match x with
  | IMX8MPLUS -> `String "imx8mplus"
  | JACINTO_TDA4VM -> `String "jacinto_tda4vm"
  | COREML -> `String "coreml"
  | X86_WIN64 -> `String "x86_win64"
  | X86_WIN32 -> `String "x86_win32"
  | AMBA_CV25 -> `String "amba_cv25"
  | AMBA_CV22 -> `String "amba_cv22"
  | AMBA_CV2 -> `String "amba_cv2"
  | SITARA_AM57X -> `String "sitara_am57x"
  | QCS603 -> `String "qcs603"
  | QCS605 -> `String "qcs605"
  | SBE_C -> `String "sbe_c"
  | AISAGE -> `String "aisage"
  | RK3288 -> `String "rk3288"
  | RK3399 -> `String "rk3399"
  | DEEPLENS -> `String "deeplens"
  | IMX8QM -> `String "imx8qm"
  | RASP4B -> `String "rasp4b"
  | RASP3B -> `String "rasp3b"
  | JETSON_XAVIER -> `String "jetson_xavier"
  | JETSON_NANO -> `String "jetson_nano"
  | JETSON_TX2 -> `String "jetson_tx2"
  | JETSON_TX1 -> `String "jetson_tx1"
  | ML_EIA2 -> `String "ml_eia2"
  | ML_TRN1 -> `String "ml_trn1"
  | ML_INF2 -> `String "ml_inf2"
  | ML_INF1 -> `String "ml_inf1"
  | ML_G4DN -> `String "ml_g4dn"
  | ML_P3 -> `String "ml_p3"
  | ML_P2 -> `String "ml_p2"
  | ML_C6G -> `String "ml_c6g"
  | ML_C5 -> `String "ml_c5"
  | ML_C4 -> `String "ml_c4"
  | ML_M6G -> `String "ml_m6g"
  | ML_M5 -> `String "ml_m5"
  | ML_M4 -> `String "ml_m4"
  | LAMBDA -> `String "lambda"

let target_count_to_yojson = int_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let problem_type_to_yojson (x : problem_type) =
  match x with
  | REGRESSION -> `String "Regression"
  | MULTICLASS_CLASSIFICATION -> `String "MulticlassClassification"
  | BINARY_CLASSIFICATION -> `String "BinaryClassification"

let tabular_resolved_attributes_to_yojson (x : tabular_resolved_attributes) =
  assoc_to_yojson [ ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type) ]

let auto_ml_mode_to_yojson (x : auto_ml_mode) =
  match x with
  | HYPERPARAMETER_TUNING -> `String "HYPERPARAMETER_TUNING"
  | ENSEMBLING -> `String "ENSEMBLING"
  | AUTO -> `String "AUTO"

let generate_candidate_definitions_only_to_yojson = bool_to_yojson
let sample_weight_attribute_name_to_yojson = string_to_yojson

let tabular_job_config_to_yojson (x : tabular_job_config) =
  assoc_to_yojson
    [
      ( "SampleWeightAttributeName",
        option_to_yojson sample_weight_attribute_name_to_yojson x.sample_weight_attribute_name );
      ("TargetAttributeName", Some (target_attribute_name_to_yojson x.target_attribute_name));
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ( "GenerateCandidateDefinitionsOnly",
        option_to_yojson generate_candidate_definitions_only_to_yojson
          x.generate_candidate_definitions_only );
      ("Mode", option_to_yojson auto_ml_mode_to_yojson x.mode);
      ("FeatureSpecificationS3Uri", option_to_yojson s3_uri_to_yojson x.feature_specification_s3_uri);
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ( "CandidateGenerationConfig",
        option_to_yojson candidate_generation_config_to_yojson x.candidate_generation_config );
    ]

let table_name_to_yojson = string_to_yojson

let table_format_to_yojson (x : table_format) =
  match x with
  | ICEBERG -> `String "Iceberg"
  | GLUE -> `String "Glue"
  | DEFAULT -> `String "Default"

let property_name_hint_to_yojson = string_to_yojson

let property_name_query_to_yojson (x : property_name_query) =
  assoc_to_yojson [ ("PropertyNameHint", Some (property_name_hint_to_yojson x.property_name_hint)) ]

let suggestion_query_to_yojson (x : suggestion_query) =
  assoc_to_yojson
    [ ("PropertyNameQuery", option_to_yojson property_name_query_to_yojson x.property_name_query) ]

let success_to_yojson = bool_to_yojson

let subscribed_workteam_to_yojson (x : subscribed_workteam) =
  assoc_to_yojson
    [
      ("ListingId", option_to_yojson string__to_yojson x.listing_id);
      ("MarketplaceDescription", option_to_yojson string200_to_yojson x.marketplace_description);
      ("SellerName", option_to_yojson string__to_yojson x.seller_name);
      ("MarketplaceTitle", option_to_yojson string200_to_yojson x.marketplace_title);
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
    ]

let subscribed_workteams_to_yojson tree = list_to_yojson subscribed_workteam_to_yojson tree
let studio_lifecycle_config_name_to_yojson = string_to_yojson

let studio_lifecycle_config_app_type_to_yojson (x : studio_lifecycle_config_app_type) =
  match x with
  | JupyterLab -> `String "JupyterLab"
  | CodeEditor -> `String "CodeEditor"
  | KernelGateway -> `String "KernelGateway"
  | JupyterServer -> `String "JupyterServer"

let studio_lifecycle_config_details_to_yojson (x : studio_lifecycle_config_details) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigAppType",
        option_to_yojson studio_lifecycle_config_app_type_to_yojson
          x.studio_lifecycle_config_app_type );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "StudioLifecycleConfigName",
        option_to_yojson studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name );
      ( "StudioLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.studio_lifecycle_config_arn );
    ]

let studio_lifecycle_configs_list_to_yojson tree =
  list_to_yojson studio_lifecycle_config_details_to_yojson tree

let studio_lifecycle_config_sort_key_to_yojson (x : studio_lifecycle_config_sort_key) =
  match x with
  | Name -> `String "Name"
  | LastModifiedTime -> `String "LastModifiedTime"
  | CreationTime -> `String "CreationTime"

let studio_lifecycle_config_content_to_yojson = string_to_yojson
let string8192_to_yojson = string_to_yojson
let string3072_to_yojson = string_to_yojson
let string2048_to_yojson = string_to_yojson
let string128_to_yojson = string_to_yojson
let stream_url_to_yojson = string_to_yojson

let storage_type_to_yojson (x : storage_type) =
  match x with IN_MEMORY -> `String "InMemory" | STANDARD -> `String "Standard"

let stop_transform_job_request_to_yojson (x : stop_transform_job_request) =
  assoc_to_yojson [ ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name)) ]

let stop_training_job_request_to_yojson (x : stop_training_job_request) =
  assoc_to_yojson [ ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name)) ]

let stop_processing_job_request_to_yojson (x : stop_processing_job_request) =
  assoc_to_yojson
    [ ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name)) ]

let stop_pipeline_execution_response_to_yojson (x : stop_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let idempotency_token_to_yojson = string_to_yojson

let stop_pipeline_execution_request_to_yojson (x : stop_pipeline_execution_request) =
  assoc_to_yojson
    [
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
    ]

let stop_optimization_job_request_to_yojson (x : stop_optimization_job_request) =
  assoc_to_yojson [ ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name)) ]

let stop_notebook_instance_input_to_yojson (x : stop_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let stop_monitoring_schedule_request_to_yojson (x : stop_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let stop_mlflow_tracking_server_response_to_yojson (x : stop_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let stop_mlflow_tracking_server_request_to_yojson (x : stop_mlflow_tracking_server_request) =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let labeling_job_name_to_yojson = string_to_yojson

let stop_labeling_job_request_to_yojson (x : stop_labeling_job_request) =
  assoc_to_yojson [ ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name)) ]

let stop_job_response_to_yojson = unit_to_yojson
let job_name_to_yojson = string_to_yojson

let job_category_to_yojson (x : job_category) =
  match x with
  | AGENT_RFT_EVALUATION -> `String "AgentRFTEvaluation"
  | AGENT_RFT -> `String "AgentRFT"

let stop_job_request_to_yojson (x : stop_job_request) =
  assoc_to_yojson
    [
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobName", Some (job_name_to_yojson x.job_name));
    ]

let recommendation_job_name_to_yojson = string_to_yojson

let stop_inference_recommendations_job_request_to_yojson
    (x : stop_inference_recommendations_job_request) =
  assoc_to_yojson [ ("JobName", Some (recommendation_job_name_to_yojson x.job_name)) ]

let stop_inference_experiment_response_to_yojson (x : stop_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let model_variant_action_to_yojson (x : model_variant_action) =
  match x with
  | PROMOTE -> `String "Promote"
  | REMOVE -> `String "Remove"
  | RETAIN -> `String "Retain"

let model_variant_action_map_to_yojson tree =
  map_to_yojson model_variant_name_to_yojson model_variant_action_to_yojson tree

let inference_experiment_stop_desired_state_to_yojson (x : inference_experiment_stop_desired_state)
    =
  match x with CANCELLED -> `String "Cancelled" | COMPLETED -> `String "Completed"

let inference_experiment_status_reason_to_yojson = string_to_yojson

let stop_inference_experiment_request_to_yojson (x : stop_inference_experiment_request) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson inference_experiment_status_reason_to_yojson x.reason);
      ( "DesiredState",
        option_to_yojson inference_experiment_stop_desired_state_to_yojson x.desired_state );
      ( "DesiredModelVariants",
        option_to_yojson model_variant_config_list_to_yojson x.desired_model_variants );
      ("ModelVariantActions", Some (model_variant_action_map_to_yojson x.model_variant_actions));
      ("Name", Some (inference_experiment_name_to_yojson x.name));
    ]

let hyper_parameter_tuning_job_name_to_yojson = string_to_yojson

let stop_hyper_parameter_tuning_job_request_to_yojson (x : stop_hyper_parameter_tuning_job_request)
    =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let stop_edge_packaging_job_request_to_yojson (x : stop_edge_packaging_job_request) =
  assoc_to_yojson
    [ ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name)) ]

let stop_edge_deployment_stage_request_to_yojson (x : stop_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
    ]

let stop_compilation_job_request_to_yojson (x : stop_compilation_job_request) =
  assoc_to_yojson [ ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name)) ]

let auto_ml_job_name_to_yojson = string_to_yojson

let stop_auto_ml_job_request_to_yojson (x : stop_auto_ml_job_request) =
  assoc_to_yojson [ ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name)) ]

let ai_recommendation_job_arn_to_yojson = string_to_yojson

let stop_ai_recommendation_job_response_to_yojson (x : stop_ai_recommendation_job_response) =
  assoc_to_yojson
    [
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
    ]

let ai_entity_name_to_yojson = string_to_yojson

let stop_ai_recommendation_job_request_to_yojson (x : stop_ai_recommendation_job_request) =
  assoc_to_yojson
    [ ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name)) ]

let ai_benchmark_job_arn_to_yojson = string_to_yojson

let stop_ai_benchmark_job_response_to_yojson (x : stop_ai_benchmark_job_response) =
  assoc_to_yojson
    [ ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn)) ]

let stop_ai_benchmark_job_request_to_yojson (x : stop_ai_benchmark_job_request) =
  assoc_to_yojson
    [ ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name)) ]

let step_status_to_yojson (x : step_status) =
  match x with
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | EXECUTING -> `String "Executing"
  | STARTING -> `String "Starting"

let step_name_to_yojson = string_to_yojson
let step_display_name_to_yojson = string_to_yojson
let step_description_to_yojson = string_to_yojson

let scheduler_resource_status_to_yojson (x : scheduler_resource_status) =
  match x with
  | DELETED -> `String "Deleted"
  | DELETE_ROLLBACK_FAILED -> `String "DeleteRollbackFailed"
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | UPDATED -> `String "Updated"
  | UPDATE_ROLLBACK_FAILED -> `String "UpdateRollbackFailed"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATING -> `String "Updating"
  | CREATED -> `String "Created"
  | CREATE_ROLLBACK_FAILED -> `String "CreateRollbackFailed"
  | CREATE_FAILED -> `String "CreateFailed"
  | CREATING -> `String "Creating"

let scheduler_config_component_to_yojson (x : scheduler_config_component) =
  match x with
  | IDLE_RESOURCE_SHARING -> `String "IdleResourceSharing"
  | FAIR_SHARE -> `String "FairShare"
  | PRIORITY_CLASSES -> `String "PriorityClasses"

let status_details_map_to_yojson tree =
  map_to_yojson scheduler_config_component_to_yojson scheduler_resource_status_to_yojson tree

let session_id_to_yojson = string_to_yojson

let start_session_response_to_yojson (x : start_session_response) =
  assoc_to_yojson
    [
      ("TokenValue", option_to_yojson token_value_to_yojson x.token_value);
      ("StreamUrl", option_to_yojson stream_url_to_yojson x.stream_url);
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
    ]

let resource_identifier_to_yojson = string_to_yojson

let start_session_request_to_yojson (x : start_session_request) =
  assoc_to_yojson
    [ ("ResourceIdentifier", Some (resource_identifier_to_yojson x.resource_identifier)) ]

let start_pipeline_execution_response_to_yojson (x : start_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let pipeline_name_or_arn_to_yojson = string_to_yojson
let pipeline_parameter_name_to_yojson = string_to_yojson

let parameter_to_yojson (x : parameter) =
  assoc_to_yojson
    [
      ("Value", Some (string1024_to_yojson x.value));
      ("Name", Some (pipeline_parameter_name_to_yojson x.name));
    ]

let parameter_list_to_yojson tree = list_to_yojson parameter_to_yojson tree

let selected_step_to_yojson (x : selected_step) =
  assoc_to_yojson [ ("StepName", Some (string256_to_yojson x.step_name)) ]

let selected_step_list_to_yojson tree = list_to_yojson selected_step_to_yojson tree

let selective_execution_config_to_yojson (x : selective_execution_config) =
  assoc_to_yojson
    [
      ("SelectedSteps", Some (selected_step_list_to_yojson x.selected_steps));
      ( "SourcePipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.source_pipeline_execution_arn );
    ]

let mlflow_experiment_entity_name_to_yojson = string_to_yojson

let start_pipeline_execution_request_to_yojson (x : start_pipeline_execution_request) =
  assoc_to_yojson
    [
      ( "MlflowExperimentName",
        option_to_yojson mlflow_experiment_entity_name_to_yojson x.mlflow_experiment_name );
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ( "SelectiveExecutionConfig",
        option_to_yojson selective_execution_config_to_yojson x.selective_execution_config );
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ("PipelineParameters", option_to_yojson parameter_list_to_yojson x.pipeline_parameters);
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
    ]

let start_notebook_instance_input_to_yojson (x : start_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let start_monitoring_schedule_request_to_yojson (x : start_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let start_mlflow_tracking_server_response_to_yojson (x : start_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let start_mlflow_tracking_server_request_to_yojson (x : start_mlflow_tracking_server_request) =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let start_inference_experiment_response_to_yojson (x : start_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let start_inference_experiment_request_to_yojson (x : start_inference_experiment_request) =
  assoc_to_yojson [ ("Name", Some (inference_experiment_name_to_yojson x.name)) ]

let start_edge_deployment_stage_request_to_yojson (x : start_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
    ]

let start_cluster_health_check_response_to_yojson (x : start_cluster_health_check_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let cluster_node_id_to_yojson = string_to_yojson
let instance_ids_to_yojson tree = list_to_yojson cluster_node_id_to_yojson tree
let deep_health_checks_to_yojson tree = list_to_yojson deep_health_check_type_to_yojson tree

let instance_group_health_check_configuration_to_yojson
    (x : instance_group_health_check_configuration) =
  assoc_to_yojson
    [
      ("DeepHealthChecks", Some (deep_health_checks_to_yojson x.deep_health_checks));
      ("InstanceIds", option_to_yojson instance_ids_to_yojson x.instance_ids);
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
    ]

let deep_health_check_configurations_to_yojson tree =
  list_to_yojson instance_group_health_check_configuration_to_yojson tree

let start_cluster_health_check_request_to_yojson (x : start_cluster_health_check_request) =
  assoc_to_yojson
    [
      ( "DeepHealthCheckConfigurations",
        Some (deep_health_check_configurations_to_yojson x.deep_health_check_configurations) );
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let stage_status_to_yojson (x : stage_status) =
  match x with
  | Stopped -> `String "STOPPED"
  | Stopping -> `String "STOPPING"
  | Failed -> `String "FAILED"
  | Deployed -> `String "DEPLOYED"
  | InProgress -> `String "INPROGRESS"
  | Starting -> `String "STARTING"
  | ReadyToDeploy -> `String "READYTODEPLOY"
  | Creating -> `String "CREATING"

let spare_instance_count_per_ultra_server_to_yojson = int_to_yojson

let space_status_to_yojson (x : space_status) =
  match x with
  | Delete_Failed -> `String "Delete_Failed"
  | Update_Failed -> `String "Update_Failed"
  | Updating -> `String "Updating"
  | Pending -> `String "Pending"
  | InService -> `String "InService"
  | Failed -> `String "Failed"
  | Deleting -> `String "Deleting"

let space_sort_key_to_yojson (x : space_sort_key) =
  match x with
  | LastModifiedTime -> `String "LastModifiedTime"
  | CreationTime -> `String "CreationTime"

let sharing_type_to_yojson (x : sharing_type) =
  match x with Shared -> `String "Shared" | Private -> `String "Private"

let space_sharing_settings_summary_to_yojson (x : space_sharing_settings_summary) =
  assoc_to_yojson [ ("SharingType", option_to_yojson sharing_type_to_yojson x.sharing_type) ]

let space_sharing_settings_to_yojson (x : space_sharing_settings) =
  assoc_to_yojson [ ("SharingType", Some (sharing_type_to_yojson x.sharing_type)) ]

let space_settings_summary_to_yojson (x : space_settings_summary) =
  assoc_to_yojson
    [
      ( "SpaceStorageSettings",
        option_to_yojson space_storage_settings_to_yojson x.space_storage_settings );
      ("RemoteAccess", option_to_yojson feature_status_to_yojson x.remote_access);
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
    ]

let ownership_settings_summary_to_yojson (x : ownership_settings_summary) =
  assoc_to_yojson
    [
      ( "OwnerUserProfileName",
        option_to_yojson user_profile_name_to_yojson x.owner_user_profile_name );
    ]

let space_details_to_yojson (x : space_details) =
  assoc_to_yojson
    [
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
      ( "OwnershipSettingsSummary",
        option_to_yojson ownership_settings_summary_to_yojson x.ownership_settings_summary );
      ( "SpaceSharingSettingsSummary",
        option_to_yojson space_sharing_settings_summary_to_yojson x.space_sharing_settings_summary
      );
      ( "SpaceSettingsSummary",
        option_to_yojson space_settings_summary_to_yojson x.space_settings_summary );
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("Status", option_to_yojson space_status_to_yojson x.status);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let space_list_to_yojson tree = list_to_yojson space_details_to_yojson tree
let source_uri_to_yojson = string_to_yojson

let source_algorithm_to_yojson (x : source_algorithm) =
  assoc_to_yojson
    [
      ("AlgorithmName", Some (arn_or_name_to_yojson x.algorithm_name));
      ("ModelDataETag", option_to_yojson string__to_yojson x.model_data_e_tag);
      ("ModelDataSource", option_to_yojson model_data_source_to_yojson x.model_data_source);
      ("ModelDataUrl", option_to_yojson url_to_yojson x.model_data_url);
    ]

let source_algorithm_list_to_yojson tree = list_to_yojson source_algorithm_to_yojson tree

let source_algorithm_specification_to_yojson (x : source_algorithm_specification) =
  assoc_to_yojson
    [ ("SourceAlgorithms", Some (source_algorithm_list_to_yojson x.source_algorithms)) ]

let sort_trials_by_to_yojson (x : sort_trials_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let sort_trial_components_by_to_yojson (x : sort_trial_components_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let sort_tracking_server_by_to_yojson (x : sort_tracking_server_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let sort_quota_by_to_yojson (x : sort_quota_by) =
  match x with
  | CLUSTER_ARN -> `String "ClusterArn"
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let sort_pipelines_by_to_yojson (x : sort_pipelines_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let sort_pipeline_executions_by_to_yojson (x : sort_pipeline_executions_by) =
  match x with
  | PIPELINE_EXECUTION_ARN -> `String "PipelineExecutionArn"
  | CREATION_TIME -> `String "CreationTime"

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let sort_mlflow_app_by_to_yojson (x : sort_mlflow_app_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let sort_lineage_groups_by_to_yojson (x : sort_lineage_groups_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let sort_inference_experiments_by_to_yojson (x : sort_inference_experiments_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let sort_experiments_by_to_yojson (x : sort_experiments_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let sort_contexts_by_to_yojson (x : sort_contexts_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let sort_cluster_scheduler_config_by_to_yojson (x : sort_cluster_scheduler_config_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let sort_by_to_yojson (x : sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let sort_associations_by_to_yojson (x : sort_associations_by) =
  match x with
  | CREATION_TIME -> `String "CreationTime"
  | DESTINATION_TYPE -> `String "DestinationType"
  | SOURCE_TYPE -> `String "SourceType"
  | DESTINATION_ARN -> `String "DestinationArn"
  | SOURCE_ARN -> `String "SourceArn"

let sort_artifacts_by_to_yojson (x : sort_artifacts_by) =
  match x with CREATION_TIME -> `String "CreationTime"

let sort_actions_by_to_yojson (x : sort_actions_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let software_update_status_to_yojson (x : software_update_status) =
  match x with
  | ROLLBACK_COMPLETE -> `String "RollbackComplete"
  | ROLLBACK_IN_PROGRESS -> `String "RollbackInProgress"
  | FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"

let sns_topic_arn_to_yojson = string_to_yojson

let skip_model_validation_to_yojson (x : skip_model_validation) =
  match x with NONE -> `String "None" | ALL -> `String "All"

let single_sign_on_user_identifier_to_yojson = string_to_yojson
let session_expiration_duration_in_seconds_to_yojson = int_to_yojson
let enable_session_tag_chaining_to_yojson = bool_to_yojson

let session_chaining_config_to_yojson (x : session_chaining_config) =
  assoc_to_yojson
    [
      ( "EnableSessionTagChaining",
        option_to_yojson enable_session_tag_chaining_to_yojson x.enable_session_tag_chaining );
    ]

let service_catalog_provisioning_details_to_yojson (x : service_catalog_provisioning_details) =
  assoc_to_yojson
    [
      ( "ProvisioningParameters",
        option_to_yojson provisioning_parameters_to_yojson x.provisioning_parameters );
      ("PathId", option_to_yojson service_catalog_entity_id_to_yojson x.path_id);
      ( "ProvisioningArtifactId",
        option_to_yojson service_catalog_entity_id_to_yojson x.provisioning_artifact_id );
      ("ProductId", Some (service_catalog_entity_id_to_yojson x.product_id));
    ]

let provisioned_product_status_message_to_yojson = string_to_yojson

let service_catalog_provisioned_product_details_to_yojson
    (x : service_catalog_provisioned_product_details) =
  assoc_to_yojson
    [
      ( "ProvisionedProductStatusMessage",
        option_to_yojson provisioned_product_status_message_to_yojson
          x.provisioned_product_status_message );
      ( "ProvisionedProductId",
        option_to_yojson service_catalog_entity_id_to_yojson x.provisioned_product_id );
    ]

let serverless_memory_size_in_m_b_to_yojson = int_to_yojson

let serverless_job_type_to_yojson (x : serverless_job_type) =
  match x with EVALUATION -> `String "Evaluation" | FINE_TUNING -> `String "FineTuning"

let serverless_job_base_model_arn_to_yojson = string_to_yojson

let customization_technique_to_yojson (x : customization_technique) =
  match x with
  | RLAIF -> `String "RLAIF"
  | RLVR -> `String "RLVR"
  | DPO -> `String "DPO"
  | SFT -> `String "SFT"

let peft_to_yojson (x : peft) = match x with LORA -> `String "LORA"

let evaluation_type_to_yojson (x : evaluation_type) =
  match x with
  | BENCHMARK_EVALUATION -> `String "BenchmarkEvaluation"
  | CUSTOM_SCORER_EVALUATION -> `String "CustomScorerEvaluation"
  | LLMAJ_EVALUATION -> `String "LLMAJEvaluation"

let evaluator_arn_to_yojson = string_to_yojson

let serverless_job_config_to_yojson (x : serverless_job_config) =
  assoc_to_yojson
    [
      ("EvaluatorArn", option_to_yojson evaluator_arn_to_yojson x.evaluator_arn);
      ("EvaluationType", option_to_yojson evaluation_type_to_yojson x.evaluation_type);
      ("Peft", option_to_yojson peft_to_yojson x.peft);
      ( "CustomizationTechnique",
        option_to_yojson customization_technique_to_yojson x.customization_technique );
      ("JobType", Some (serverless_job_type_to_yojson x.job_type));
      ("AcceptEula", option_to_yojson accept_eula_to_yojson x.accept_eula);
      ("BaseModelArn", Some (serverless_job_base_model_arn_to_yojson x.base_model_arn));
    ]

let send_pipeline_execution_step_success_response_to_yojson
    (x : send_pipeline_execution_step_success_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let callback_token_to_yojson = string_to_yojson

let output_parameter_to_yojson (x : output_parameter) =
  assoc_to_yojson
    [ ("Value", Some (string1024_to_yojson x.value)); ("Name", Some (string256_to_yojson x.name)) ]

let output_parameter_list_to_yojson tree = list_to_yojson output_parameter_to_yojson tree

let send_pipeline_execution_step_success_request_to_yojson
    (x : send_pipeline_execution_step_success_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("OutputParameters", option_to_yojson output_parameter_list_to_yojson x.output_parameters);
      ("CallbackToken", Some (callback_token_to_yojson x.callback_token));
    ]

let send_pipeline_execution_step_failure_response_to_yojson
    (x : send_pipeline_execution_step_failure_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let send_pipeline_execution_step_failure_request_to_yojson
    (x : send_pipeline_execution_step_failure_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FailureReason", option_to_yojson string256_to_yojson x.failure_reason);
      ("CallbackToken", Some (callback_token_to_yojson x.callback_token));
    ]

let selective_execution_result_to_yojson (x : selective_execution_result) =
  assoc_to_yojson
    [
      ( "SourcePipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.source_pipeline_execution_arn );
    ]

let search_training_plan_offerings_response_to_yojson (x : search_training_plan_offerings_response)
    =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensionOfferings",
        option_to_yojson training_plan_extension_offerings_to_yojson
          x.training_plan_extension_offerings );
      ("TrainingPlanOfferings", Some (training_plan_offerings_to_yojson x.training_plan_offerings));
    ]

let search_training_plan_offerings_request_to_yojson (x : search_training_plan_offerings_request) =
  assoc_to_yojson
    [
      ("TrainingPlanArn", option_to_yojson string__to_yojson x.training_plan_arn);
      ("TargetResources", option_to_yojson sage_maker_resource_names_to_yojson x.target_resources);
      ( "DurationHours",
        option_to_yojson training_plan_duration_hours_input_to_yojson x.duration_hours );
      ("EndTimeBefore", option_to_yojson timestamp_to_yojson x.end_time_before);
      ("StartTimeAfter", option_to_yojson timestamp_to_yojson x.start_time_after);
      ("UltraServerCount", option_to_yojson ultra_server_count_to_yojson x.ultra_server_count);
      ("UltraServerType", option_to_yojson ultra_server_type_to_yojson x.ultra_server_type);
      ("InstanceCount", option_to_yojson reserved_capacity_instance_count_to_yojson x.instance_count);
      ("InstanceType", option_to_yojson reserved_capacity_instance_type_to_yojson x.instance_type);
    ]

let search_sort_order_to_yojson (x : search_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let experiment_source_arn_to_yojson = string_to_yojson

let experiment_source_to_yojson (x : experiment_source) =
  assoc_to_yojson
    [
      ("SourceType", option_to_yojson source_type_to_yojson x.source_type);
      ("SourceArn", Some (experiment_source_arn_to_yojson x.source_arn));
    ]

let experiment_to_yojson (x : experiment) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Source", option_to_yojson experiment_source_to_yojson x.source);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
    ]

let deployed_image_to_yojson (x : deployed_image) =
  assoc_to_yojson
    [
      ("ResolutionTime", option_to_yojson timestamp_to_yojson x.resolution_time);
      ("ResolvedImage", option_to_yojson container_image_to_yojson x.resolved_image);
      ("SpecifiedImage", option_to_yojson container_image_to_yojson x.specified_image);
    ]

let deployed_images_to_yojson tree = list_to_yojson deployed_image_to_yojson tree

let instance_pool_summary_to_yojson (x : instance_pool_summary) =
  assoc_to_yojson
    [
      ("CurrentInstanceCount", Some (task_count_to_yojson x.current_instance_count));
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
    ]

let instance_pool_summary_list_to_yojson tree = list_to_yojson instance_pool_summary_to_yojson tree

let production_variant_status_to_yojson (x : production_variant_status) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("StatusMessage", option_to_yojson variant_status_message_to_yojson x.status_message);
      ("Status", Some (variant_status_to_yojson x.status));
    ]

let production_variant_status_list_to_yojson tree =
  list_to_yojson production_variant_status_to_yojson tree

let production_variant_serverless_config_to_yojson (x : production_variant_serverless_config) =
  assoc_to_yojson
    [
      ( "ProvisionedConcurrency",
        option_to_yojson serverless_provisioned_concurrency_to_yojson x.provisioned_concurrency );
      ("MaxConcurrency", Some (serverless_max_concurrency_to_yojson x.max_concurrency));
      ("MemorySizeInMB", Some (serverless_memory_size_in_m_b_to_yojson x.memory_size_in_m_b));
    ]

let managed_instance_scaling_status_to_yojson (x : managed_instance_scaling_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let managed_instance_scaling_min_instance_count_to_yojson = int_to_yojson
let managed_instance_scaling_max_instance_count_to_yojson = int_to_yojson

let managed_instance_scaling_scale_in_strategy_to_yojson
    (x : managed_instance_scaling_scale_in_strategy) =
  match x with CONSOLIDATION -> `String "CONSOLIDATION" | IDLE_RELEASE -> `String "IDLE_RELEASE"

let managed_instance_scaling_maximum_step_size_to_yojson = int_to_yojson
let managed_instance_scaling_cooldown_in_minutes_to_yojson = int_to_yojson

let production_variant_managed_instance_scaling_scale_in_policy_to_yojson
    (x : production_variant_managed_instance_scaling_scale_in_policy) =
  assoc_to_yojson
    [
      ( "CooldownInMinutes",
        option_to_yojson managed_instance_scaling_cooldown_in_minutes_to_yojson
          x.cooldown_in_minutes );
      ( "MaximumStepSize",
        option_to_yojson managed_instance_scaling_maximum_step_size_to_yojson x.maximum_step_size );
      ("Strategy", Some (managed_instance_scaling_scale_in_strategy_to_yojson x.strategy));
    ]

let production_variant_managed_instance_scaling_to_yojson
    (x : production_variant_managed_instance_scaling) =
  assoc_to_yojson
    [
      ( "ScaleInPolicy",
        option_to_yojson production_variant_managed_instance_scaling_scale_in_policy_to_yojson
          x.scale_in_policy );
      ( "MaxInstanceCount",
        option_to_yojson managed_instance_scaling_max_instance_count_to_yojson x.max_instance_count
      );
      ( "MinInstanceCount",
        option_to_yojson managed_instance_scaling_min_instance_count_to_yojson x.min_instance_count
      );
      ("Status", option_to_yojson managed_instance_scaling_status_to_yojson x.status);
    ]

let routing_strategy_to_yojson (x : routing_strategy) =
  match x with
  | RANDOM -> `String "RANDOM"
  | LEAST_OUTSTANDING_REQUESTS -> `String "LEAST_OUTSTANDING_REQUESTS"

let production_variant_routing_config_to_yojson (x : production_variant_routing_config) =
  assoc_to_yojson [ ("RoutingStrategy", Some (routing_strategy_to_yojson x.routing_strategy)) ]

let ml_reservation_arn_to_yojson = string_to_yojson

let capacity_reservation_preference_to_yojson (x : capacity_reservation_preference) =
  match x with CAPACITY_RESERVATIONS_ONLY -> `String "capacity-reservations-only"

let ec2_capacity_reservation_id_to_yojson = string_to_yojson

let ec2_capacity_reservation_to_yojson (x : ec2_capacity_reservation) =
  assoc_to_yojson
    [
      ("UsedByCurrentEndpoint", option_to_yojson task_count_to_yojson x.used_by_current_endpoint);
      ("AvailableInstanceCount", option_to_yojson task_count_to_yojson x.available_instance_count);
      ("TotalInstanceCount", option_to_yojson task_count_to_yojson x.total_instance_count);
      ( "Ec2CapacityReservationId",
        option_to_yojson ec2_capacity_reservation_id_to_yojson x.ec2_capacity_reservation_id );
    ]

let ec2_capacity_reservations_list_to_yojson tree =
  list_to_yojson ec2_capacity_reservation_to_yojson tree

let production_variant_capacity_reservation_summary_to_yojson
    (x : production_variant_capacity_reservation_summary) =
  assoc_to_yojson
    [
      ( "Ec2CapacityReservations",
        option_to_yojson ec2_capacity_reservations_list_to_yojson x.ec2_capacity_reservations );
      ("UsedByCurrentEndpoint", option_to_yojson task_count_to_yojson x.used_by_current_endpoint);
      ("AvailableInstanceCount", option_to_yojson task_count_to_yojson x.available_instance_count);
      ("TotalInstanceCount", option_to_yojson task_count_to_yojson x.total_instance_count);
      ( "CapacityReservationPreference",
        option_to_yojson capacity_reservation_preference_to_yojson x.capacity_reservation_preference
      );
      ("MlReservationArn", option_to_yojson ml_reservation_arn_to_yojson x.ml_reservation_arn);
    ]

let production_variant_summary_to_yojson (x : production_variant_summary) =
  assoc_to_yojson
    [
      ( "CapacityReservationConfig",
        option_to_yojson production_variant_capacity_reservation_summary_to_yojson
          x.capacity_reservation_config );
      ( "RoutingConfig",
        option_to_yojson production_variant_routing_config_to_yojson x.routing_config );
      ( "ManagedInstanceScaling",
        option_to_yojson production_variant_managed_instance_scaling_to_yojson
          x.managed_instance_scaling );
      ( "DesiredServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.desired_serverless_config
      );
      ( "CurrentServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.current_serverless_config
      );
      ("VariantStatus", option_to_yojson production_variant_status_list_to_yojson x.variant_status);
      ("InstancePools", option_to_yojson instance_pool_summary_list_to_yojson x.instance_pools);
      ("DesiredInstanceCount", option_to_yojson task_count_to_yojson x.desired_instance_count);
      ("CurrentInstanceCount", option_to_yojson task_count_to_yojson x.current_instance_count);
      ("DesiredWeight", option_to_yojson variant_weight_to_yojson x.desired_weight);
      ("CurrentWeight", option_to_yojson variant_weight_to_yojson x.current_weight);
      ("DeployedImages", option_to_yojson deployed_images_to_yojson x.deployed_images);
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
    ]

let production_variant_summary_list_to_yojson tree =
  list_to_yojson production_variant_summary_to_yojson tree

let enable_capture_to_yojson = bool_to_yojson

let capture_status_to_yojson (x : capture_status) =
  match x with STOPPED -> `String "Stopped" | STARTED -> `String "Started"

let sampling_percentage_to_yojson = int_to_yojson

let data_capture_config_summary_to_yojson (x : data_capture_config_summary) =
  assoc_to_yojson
    [
      ("KmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id));
      ("DestinationS3Uri", Some (destination_s3_uri_to_yojson x.destination_s3_uri));
      ( "CurrentSamplingPercentage",
        Some (sampling_percentage_to_yojson x.current_sampling_percentage) );
      ("CaptureStatus", Some (capture_status_to_yojson x.capture_status));
      ("EnableCapture", Some (enable_capture_to_yojson x.enable_capture));
    ]

let endpoint_status_to_yojson (x : endpoint_status) =
  match x with
  | UPDATE_ROLLBACK_FAILED -> `String "UpdateRollbackFailed"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"
  | IN_SERVICE -> `String "InService"
  | ROLLING_BACK -> `String "RollingBack"
  | SYSTEM_UPDATING -> `String "SystemUpdating"
  | UPDATING -> `String "Updating"
  | CREATING -> `String "Creating"
  | OUT_OF_SERVICE -> `String "OutOfService"

let schedule_status_to_yojson (x : schedule_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | SCHEDULED -> `String "Scheduled"
  | FAILED -> `String "Failed"
  | PENDING -> `String "Pending"

let execution_status_to_yojson (x : execution_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED_WITH_VIOLATIONS -> `String "CompletedWithViolations"
  | COMPLETED -> `String "Completed"
  | PENDING -> `String "Pending"

let monitoring_execution_summary_to_yojson (x : monitoring_execution_summary) =
  assoc_to_yojson
    [
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("ProcessingJobArn", option_to_yojson processing_job_arn_to_yojson x.processing_job_arn);
      ("MonitoringExecutionStatus", Some (execution_status_to_yojson x.monitoring_execution_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ScheduledTime", Some (timestamp_to_yojson x.scheduled_time));
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let monitoring_schedule_to_yojson (x : monitoring_schedule) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "LastMonitoringExecutionSummary",
        option_to_yojson monitoring_execution_summary_to_yojson x.last_monitoring_execution_summary
      );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "MonitoringScheduleConfig",
        option_to_yojson monitoring_schedule_config_to_yojson x.monitoring_schedule_config );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ( "MonitoringScheduleStatus",
        option_to_yojson schedule_status_to_yojson x.monitoring_schedule_status );
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
    ]

let monitoring_schedule_list_to_yojson tree = list_to_yojson monitoring_schedule_to_yojson tree

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.shadow_production_variants );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "MonitoringSchedules",
        option_to_yojson monitoring_schedule_list_to_yojson x.monitoring_schedules );
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
      ( "DataCaptureConfig",
        option_to_yojson data_capture_config_summary_to_yojson x.data_capture_config );
      ( "ProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.production_variants );
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let model_package_version_to_yojson = int_to_yojson

let model_package_validation_profile_to_yojson (x : model_package_validation_profile) =
  assoc_to_yojson
    [
      ( "TransformJobDefinition",
        Some (transform_job_definition_to_yojson x.transform_job_definition) );
      ("ProfileName", Some (entity_name_to_yojson x.profile_name));
    ]

let model_package_validation_profiles_to_yojson tree =
  list_to_yojson model_package_validation_profile_to_yojson tree

let model_package_validation_specification_to_yojson (x : model_package_validation_specification) =
  assoc_to_yojson
    [
      ( "ValidationProfiles",
        Some (model_package_validation_profiles_to_yojson x.validation_profiles) );
      ("ValidationRole", Some (role_arn_to_yojson x.validation_role));
    ]

let model_package_status_to_yojson (x : model_package_status) =
  match x with
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"

let detailed_model_package_status_to_yojson (x : detailed_model_package_status) =
  match x with
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | NOT_STARTED -> `String "NotStarted"

let model_package_status_item_to_yojson (x : model_package_status_item) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("Status", Some (detailed_model_package_status_to_yojson x.status));
      ("Name", Some (entity_name_to_yojson x.name));
    ]

let model_package_status_item_list_to_yojson tree =
  list_to_yojson model_package_status_item_to_yojson tree

let model_package_status_details_to_yojson (x : model_package_status_details) =
  assoc_to_yojson
    [
      ( "ImageScanStatuses",
        option_to_yojson model_package_status_item_list_to_yojson x.image_scan_statuses );
      ("ValidationStatuses", Some (model_package_status_item_list_to_yojson x.validation_statuses));
    ]

let certify_for_marketplace_to_yojson = bool_to_yojson
let content_digest_to_yojson = string_to_yojson

let metrics_source_to_yojson (x : metrics_source) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("ContentDigest", option_to_yojson content_digest_to_yojson x.content_digest);
      ("ContentType", Some (content_type_to_yojson x.content_type));
    ]

let model_quality_to_yojson (x : model_quality) =
  assoc_to_yojson
    [
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
    ]

let model_data_quality_to_yojson (x : model_data_quality) =
  assoc_to_yojson
    [
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
    ]

let bias_to_yojson (x : bias) =
  assoc_to_yojson
    [
      ("PostTrainingReport", option_to_yojson metrics_source_to_yojson x.post_training_report);
      ("PreTrainingReport", option_to_yojson metrics_source_to_yojson x.pre_training_report);
      ("Report", option_to_yojson metrics_source_to_yojson x.report);
    ]

let explainability_to_yojson (x : explainability) =
  assoc_to_yojson [ ("Report", option_to_yojson metrics_source_to_yojson x.report) ]

let model_metrics_to_yojson (x : model_metrics) =
  assoc_to_yojson
    [
      ("Explainability", option_to_yojson explainability_to_yojson x.explainability);
      ("Bias", option_to_yojson bias_to_yojson x.bias);
      ("ModelDataQuality", option_to_yojson model_data_quality_to_yojson x.model_data_quality);
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
    ]

let model_package_security_config_to_yojson (x : model_package_security_config) =
  assoc_to_yojson [ ("KmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id)) ]

let file_source_to_yojson (x : file_source) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("ContentDigest", option_to_yojson content_digest_to_yojson x.content_digest);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
    ]

let drift_check_bias_to_yojson (x : drift_check_bias) =
  assoc_to_yojson
    [
      ( "PostTrainingConstraints",
        option_to_yojson metrics_source_to_yojson x.post_training_constraints );
      ( "PreTrainingConstraints",
        option_to_yojson metrics_source_to_yojson x.pre_training_constraints );
      ("ConfigFile", option_to_yojson file_source_to_yojson x.config_file);
    ]

let drift_check_explainability_to_yojson (x : drift_check_explainability) =
  assoc_to_yojson
    [
      ("ConfigFile", option_to_yojson file_source_to_yojson x.config_file);
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
    ]

let drift_check_model_quality_to_yojson (x : drift_check_model_quality) =
  assoc_to_yojson
    [
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
    ]

let drift_check_model_data_quality_to_yojson (x : drift_check_model_data_quality) =
  assoc_to_yojson
    [
      ("Constraints", option_to_yojson metrics_source_to_yojson x.constraints);
      ("Statistics", option_to_yojson metrics_source_to_yojson x.statistics);
    ]

let drift_check_baselines_to_yojson (x : drift_check_baselines) =
  assoc_to_yojson
    [
      ( "ModelDataQuality",
        option_to_yojson drift_check_model_data_quality_to_yojson x.model_data_quality );
      ("ModelQuality", option_to_yojson drift_check_model_quality_to_yojson x.model_quality);
      ("Explainability", option_to_yojson drift_check_explainability_to_yojson x.explainability);
      ("Bias", option_to_yojson drift_check_bias_to_yojson x.bias);
    ]

let model_package_to_yojson (x : model_package) =
  assoc_to_yojson
    [
      ( "SkipModelValidation",
        option_to_yojson skip_model_validation_to_yojson x.skip_model_validation );
      ( "DriftCheckBaselines",
        option_to_yojson drift_check_baselines_to_yojson x.drift_check_baselines );
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("SecurityConfig", option_to_yojson model_package_security_config_to_yojson x.security_config);
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ( "AdditionalInferenceSpecifications",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications );
      ("SamplePayloadUrl", option_to_yojson string__to_yojson x.sample_payload_url);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("Domain", option_to_yojson string__to_yojson x.domain);
      ("ApprovalDescription", option_to_yojson approval_description_to_yojson x.approval_description);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ( "ModelPackageStatusDetails",
        option_to_yojson model_package_status_details_to_yojson x.model_package_status_details );
      ("ModelPackageStatus", option_to_yojson model_package_status_to_yojson x.model_package_status);
      ( "ValidationSpecification",
        option_to_yojson model_package_validation_specification_to_yojson x.validation_specification
      );
      ( "SourceAlgorithmSpecification",
        option_to_yojson source_algorithm_specification_to_yojson x.source_algorithm_specification
      );
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("ModelPackageArn", option_to_yojson model_package_arn_to_yojson x.model_package_arn);
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
      ("ModelPackageName", option_to_yojson entity_name_to_yojson x.model_package_name);
    ]

let model_package_group_status_to_yojson (x : model_package_group_status) =
  match x with
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"

let model_package_group_to_yojson (x : model_package_group) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ModelPackageGroupStatus",
        option_to_yojson model_package_group_status_to_yojson x.model_package_group_status );
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ( "ModelPackageGroupArn",
        option_to_yojson model_package_group_arn_to_yojson x.model_package_group_arn );
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
    ]

let pipeline_status_to_yojson (x : pipeline_status) =
  match x with DELETING -> `String "Deleting" | ACTIVE -> `String "Active"

let pipeline_to_yojson (x : pipeline) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastRunTime", option_to_yojson timestamp_to_yojson x.last_run_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("PipelineStatus", option_to_yojson pipeline_status_to_yojson x.pipeline_status);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let pipeline_execution_status_to_yojson (x : pipeline_execution_status) =
  match x with
  | SUCCEEDED -> `String "Succeeded"
  | FAILED -> `String "Failed"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | EXECUTING -> `String "Executing"

let pipeline_experiment_config_to_yojson (x : pipeline_experiment_config) =
  assoc_to_yojson
    [
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
    ]

let pipeline_execution_failure_reason_to_yojson = string_to_yojson

let pipeline_execution_to_yojson (x : pipeline_execution) =
  assoc_to_yojson
    [
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("PipelineParameters", option_to_yojson parameter_list_to_yojson x.pipeline_parameters);
      ( "SelectiveExecutionConfig",
        option_to_yojson selective_execution_config_to_yojson x.selective_execution_config );
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "FailureReason",
        option_to_yojson pipeline_execution_failure_reason_to_yojson x.failure_reason );
      ( "PipelineExperimentConfig",
        option_to_yojson pipeline_experiment_config_to_yojson x.pipeline_experiment_config );
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ( "PipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson x.pipeline_execution_status );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let pipeline_version_to_yojson (x : pipeline_version) =
  assoc_to_yojson
    [
      ( "LastExecutedPipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson
          x.last_executed_pipeline_execution_status );
      ( "LastExecutedPipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson
          x.last_executed_pipeline_execution_display_name );
      ( "LastExecutedPipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.last_executed_pipeline_execution_arn );
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let feature_definitions_to_yojson tree = list_to_yojson feature_definition_to_yojson tree

let online_store_security_config_to_yojson (x : online_store_security_config) =
  assoc_to_yojson [ ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id) ]

let online_store_config_to_yojson (x : online_store_config) =
  assoc_to_yojson
    [
      ("StorageType", option_to_yojson storage_type_to_yojson x.storage_type);
      ("TtlDuration", option_to_yojson ttl_duration_to_yojson x.ttl_duration);
      ("EnableOnlineStore", option_to_yojson boolean__to_yojson x.enable_online_store);
      ("SecurityConfig", option_to_yojson online_store_security_config_to_yojson x.security_config);
    ]

let s3_storage_config_to_yojson (x : s3_storage_config) =
  assoc_to_yojson
    [
      ("ResolvedOutputS3Uri", option_to_yojson s3_uri_to_yojson x.resolved_output_s3_uri);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let catalog_to_yojson = string_to_yojson
let database_to_yojson = string_to_yojson

let data_catalog_config_to_yojson (x : data_catalog_config) =
  assoc_to_yojson
    [
      ("Database", Some (database_to_yojson x.database));
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("TableName", Some (table_name_to_yojson x.table_name));
    ]

let offline_store_config_to_yojson (x : offline_store_config) =
  assoc_to_yojson
    [
      ("TableFormat", option_to_yojson table_format_to_yojson x.table_format);
      ("DataCatalogConfig", option_to_yojson data_catalog_config_to_yojson x.data_catalog_config);
      ("DisableGlueTableCreation", option_to_yojson boolean__to_yojson x.disable_glue_table_creation);
      ("S3StorageConfig", Some (s3_storage_config_to_yojson x.s3_storage_config));
    ]

let feature_group_status_to_yojson (x : feature_group_status) =
  match x with
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | CREATE_FAILED -> `String "CreateFailed"
  | CREATED -> `String "Created"
  | CREATING -> `String "Creating"

let offline_store_status_value_to_yojson (x : offline_store_status_value) =
  match x with
  | DISABLED -> `String "Disabled"
  | BLOCKED -> `String "Blocked"
  | ACTIVE -> `String "Active"

let blocked_reason_to_yojson = string_to_yojson

let offline_store_status_to_yojson (x : offline_store_status) =
  assoc_to_yojson
    [
      ("BlockedReason", option_to_yojson blocked_reason_to_yojson x.blocked_reason);
      ("Status", Some (offline_store_status_value_to_yojson x.status));
    ]

let last_update_status_value_to_yojson (x : last_update_status_value) =
  match x with
  | IN_PROGRESS -> `String "InProgress"
  | FAILED -> `String "Failed"
  | SUCCESSFUL -> `String "Successful"

let last_update_status_to_yojson (x : last_update_status) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Status", Some (last_update_status_value_to_yojson x.status));
    ]

let description_to_yojson = string_to_yojson

let feature_group_to_yojson (x : feature_group) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LastUpdateStatus", option_to_yojson last_update_status_to_yojson x.last_update_status);
      ("OfflineStoreStatus", option_to_yojson offline_store_status_to_yojson x.offline_store_status);
      ("FeatureGroupStatus", option_to_yojson feature_group_status_to_yojson x.feature_group_status);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("OfflineStoreConfig", option_to_yojson offline_store_config_to_yojson x.offline_store_config);
      ("OnlineStoreConfig", option_to_yojson online_store_config_to_yojson x.online_store_config);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("FeatureDefinitions", option_to_yojson feature_definitions_to_yojson x.feature_definitions);
      ("EventTimeFeatureName", option_to_yojson feature_name_to_yojson x.event_time_feature_name);
      ( "RecordIdentifierFeatureName",
        option_to_yojson feature_name_to_yojson x.record_identifier_feature_name );
      ("FeatureGroupName", option_to_yojson feature_group_name_to_yojson x.feature_group_name);
      ("FeatureGroupArn", option_to_yojson feature_group_arn_to_yojson x.feature_group_arn);
    ]

let feature_parameters_to_yojson tree = list_to_yojson feature_parameter_to_yojson tree

let feature_metadata_to_yojson (x : feature_metadata) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson feature_parameters_to_yojson x.parameters);
      ("Description", option_to_yojson feature_description_to_yojson x.description);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("FeatureType", option_to_yojson feature_type_to_yojson x.feature_type);
      ("FeatureName", option_to_yojson feature_name_to_yojson x.feature_name);
      ("FeatureGroupName", option_to_yojson feature_group_name_to_yojson x.feature_group_name);
      ("FeatureGroupArn", option_to_yojson feature_group_arn_to_yojson x.feature_group_arn);
    ]

let project_id_to_yojson = string_to_yojson

let project_status_to_yojson (x : project_status) =
  match x with
  | UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATE_COMPLETED -> `String "UpdateCompleted"
  | UPDATE_IN_PROGRESS -> `String "UpdateInProgress"
  | DELETE_COMPLETED -> `String "DeleteCompleted"
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETE_IN_PROGRESS -> `String "DeleteInProgress"
  | CREATE_FAILED -> `String "CreateFailed"
  | CREATE_COMPLETED -> `String "CreateCompleted"
  | CREATE_IN_PROGRESS -> `String "CreateInProgress"
  | PENDING -> `String "Pending"

let project_to_yojson (x : project) =
  assoc_to_yojson
    [
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TemplateProviderDetails",
        option_to_yojson template_provider_detail_list_to_yojson x.template_provider_details );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("ProjectStatus", option_to_yojson project_status_to_yojson x.project_status);
      ( "ServiceCatalogProvisionedProductDetails",
        option_to_yojson service_catalog_provisioned_product_details_to_yojson
          x.service_catalog_provisioned_product_details );
      ( "ServiceCatalogProvisioningDetails",
        option_to_yojson service_catalog_provisioning_details_to_yojson
          x.service_catalog_provisioning_details );
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ("ProjectId", option_to_yojson project_id_to_yojson x.project_id);
      ("ProjectName", option_to_yojson project_entity_name_to_yojson x.project_name);
      ("ProjectArn", option_to_yojson project_arn_to_yojson x.project_arn);
    ]

let hyper_parameter_tuning_job_strategy_type_to_yojson
    (x : hyper_parameter_tuning_job_strategy_type) =
  match x with
  | GRID -> `String "Grid"
  | HYPERBAND -> `String "Hyperband"
  | RANDOM -> `String "Random"
  | BAYESIAN -> `String "Bayesian"

let hyperband_strategy_min_resource_to_yojson = int_to_yojson
let hyperband_strategy_max_resource_to_yojson = int_to_yojson

let hyperband_strategy_config_to_yojson (x : hyperband_strategy_config) =
  assoc_to_yojson
    [
      ("MaxResource", option_to_yojson hyperband_strategy_max_resource_to_yojson x.max_resource);
      ("MinResource", option_to_yojson hyperband_strategy_min_resource_to_yojson x.min_resource);
    ]

let hyper_parameter_tuning_job_strategy_config_to_yojson
    (x : hyper_parameter_tuning_job_strategy_config) =
  assoc_to_yojson
    [
      ( "HyperbandStrategyConfig",
        option_to_yojson hyperband_strategy_config_to_yojson x.hyperband_strategy_config );
    ]

let max_number_of_training_jobs_to_yojson = int_to_yojson
let max_parallel_training_jobs_to_yojson = int_to_yojson
let hyper_parameter_tuning_max_runtime_in_seconds_to_yojson = int_to_yojson

let resource_limits_to_yojson (x : resource_limits) =
  assoc_to_yojson
    [
      ( "MaxRuntimeInSeconds",
        option_to_yojson hyper_parameter_tuning_max_runtime_in_seconds_to_yojson
          x.max_runtime_in_seconds );
      ( "MaxParallelTrainingJobs",
        Some (max_parallel_training_jobs_to_yojson x.max_parallel_training_jobs) );
      ( "MaxNumberOfTrainingJobs",
        option_to_yojson max_number_of_training_jobs_to_yojson x.max_number_of_training_jobs );
    ]

let parameter_key_to_yojson = string_to_yojson

let hyper_parameter_scaling_type_to_yojson (x : hyper_parameter_scaling_type) =
  match x with
  | REVERSE_LOGARITHMIC -> `String "ReverseLogarithmic"
  | LOGARITHMIC -> `String "Logarithmic"
  | LINEAR -> `String "Linear"
  | AUTO -> `String "Auto"

let integer_parameter_range_to_yojson (x : integer_parameter_range) =
  assoc_to_yojson
    [
      ("ScalingType", option_to_yojson hyper_parameter_scaling_type_to_yojson x.scaling_type);
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
      ("Name", Some (parameter_key_to_yojson x.name));
    ]

let integer_parameter_ranges_to_yojson tree = list_to_yojson integer_parameter_range_to_yojson tree

let continuous_parameter_range_to_yojson (x : continuous_parameter_range) =
  assoc_to_yojson
    [
      ("ScalingType", option_to_yojson hyper_parameter_scaling_type_to_yojson x.scaling_type);
      ("MaxValue", Some (parameter_value_to_yojson x.max_value));
      ("MinValue", Some (parameter_value_to_yojson x.min_value));
      ("Name", Some (parameter_key_to_yojson x.name));
    ]

let continuous_parameter_ranges_to_yojson tree =
  list_to_yojson continuous_parameter_range_to_yojson tree

let categorical_parameter_range_to_yojson (x : categorical_parameter_range) =
  assoc_to_yojson
    [
      ("Values", Some (parameter_values_to_yojson x.values));
      ("Name", Some (parameter_key_to_yojson x.name));
    ]

let categorical_parameter_ranges_to_yojson tree =
  list_to_yojson categorical_parameter_range_to_yojson tree

let auto_parameter_to_yojson (x : auto_parameter) =
  assoc_to_yojson
    [
      ("ValueHint", Some (parameter_value_to_yojson x.value_hint));
      ("Name", Some (parameter_key_to_yojson x.name));
    ]

let auto_parameters_to_yojson tree = list_to_yojson auto_parameter_to_yojson tree

let parameter_ranges_to_yojson (x : parameter_ranges) =
  assoc_to_yojson
    [
      ("AutoParameters", option_to_yojson auto_parameters_to_yojson x.auto_parameters);
      ( "CategoricalParameterRanges",
        option_to_yojson categorical_parameter_ranges_to_yojson x.categorical_parameter_ranges );
      ( "ContinuousParameterRanges",
        option_to_yojson continuous_parameter_ranges_to_yojson x.continuous_parameter_ranges );
      ( "IntegerParameterRanges",
        option_to_yojson integer_parameter_ranges_to_yojson x.integer_parameter_ranges );
    ]

let random_seed_to_yojson = int_to_yojson

let hyper_parameter_tuning_job_config_to_yojson (x : hyper_parameter_tuning_job_config) =
  assoc_to_yojson
    [
      ("RandomSeed", option_to_yojson random_seed_to_yojson x.random_seed);
      ( "TuningJobCompletionCriteria",
        option_to_yojson tuning_job_completion_criteria_to_yojson x.tuning_job_completion_criteria
      );
      ( "TrainingJobEarlyStoppingType",
        option_to_yojson training_job_early_stopping_type_to_yojson
          x.training_job_early_stopping_type );
      ("ParameterRanges", option_to_yojson parameter_ranges_to_yojson x.parameter_ranges);
      ("ResourceLimits", Some (resource_limits_to_yojson x.resource_limits));
      ( "HyperParameterTuningJobObjective",
        option_to_yojson hyper_parameter_tuning_job_objective_to_yojson
          x.hyper_parameter_tuning_job_objective );
      ( "StrategyConfig",
        option_to_yojson hyper_parameter_tuning_job_strategy_config_to_yojson x.strategy_config );
      ("Strategy", Some (hyper_parameter_tuning_job_strategy_type_to_yojson x.strategy));
    ]

let hyper_parameter_training_job_definition_name_to_yojson = string_to_yojson

let hyper_parameter_algorithm_specification_to_yojson (x : hyper_parameter_algorithm_specification)
    =
  assoc_to_yojson
    [
      ("MetricDefinitions", option_to_yojson metric_definition_list_to_yojson x.metric_definitions);
      ("AlgorithmName", option_to_yojson arn_or_name_to_yojson x.algorithm_name);
      ("TrainingInputMode", Some (training_input_mode_to_yojson x.training_input_mode));
      ("TrainingImage", option_to_yojson algorithm_image_to_yojson x.training_image);
    ]

let hyper_parameter_tuning_allocation_strategy_to_yojson
    (x : hyper_parameter_tuning_allocation_strategy) =
  match x with PRIORITIZED -> `String "Prioritized"

let hyper_parameter_tuning_instance_config_to_yojson (x : hyper_parameter_tuning_instance_config) =
  assoc_to_yojson
    [
      ("VolumeSizeInGB", Some (volume_size_in_g_b_to_yojson x.volume_size_in_g_b));
      ("InstanceCount", Some (training_instance_count_to_yojson x.instance_count));
      ("InstanceType", Some (training_instance_type_to_yojson x.instance_type));
    ]

let hyper_parameter_tuning_instance_configs_to_yojson tree =
  list_to_yojson hyper_parameter_tuning_instance_config_to_yojson tree

let hyper_parameter_tuning_resource_config_to_yojson (x : hyper_parameter_tuning_resource_config) =
  assoc_to_yojson
    [
      ( "InstanceConfigs",
        option_to_yojson hyper_parameter_tuning_instance_configs_to_yojson x.instance_configs );
      ( "AllocationStrategy",
        option_to_yojson hyper_parameter_tuning_allocation_strategy_to_yojson x.allocation_strategy
      );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ("VolumeSizeInGB", option_to_yojson optional_volume_size_in_g_b_to_yojson x.volume_size_in_g_b);
      ("InstanceCount", option_to_yojson training_instance_count_to_yojson x.instance_count);
      ("InstanceType", option_to_yojson training_instance_type_to_yojson x.instance_type);
    ]

let hyper_parameter_training_job_environment_value_to_yojson = string_to_yojson
let hyper_parameter_training_job_environment_key_to_yojson = string_to_yojson

let hyper_parameter_training_job_environment_map_to_yojson tree =
  map_to_yojson hyper_parameter_training_job_environment_key_to_yojson
    hyper_parameter_training_job_environment_value_to_yojson tree

let hyper_parameter_training_job_definition_to_yojson (x : hyper_parameter_training_job_definition)
    =
  assoc_to_yojson
    [
      ( "Environment",
        option_to_yojson hyper_parameter_training_job_environment_map_to_yojson x.environment );
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ( "HyperParameterTuningResourceConfig",
        option_to_yojson hyper_parameter_tuning_resource_config_to_yojson
          x.hyper_parameter_tuning_resource_config );
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AlgorithmSpecification",
        Some (hyper_parameter_algorithm_specification_to_yojson x.algorithm_specification) );
      ( "StaticHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.static_hyper_parameters );
      ("HyperParameterRanges", option_to_yojson parameter_ranges_to_yojson x.hyper_parameter_ranges);
      ( "TuningObjective",
        option_to_yojson hyper_parameter_tuning_job_objective_to_yojson x.tuning_objective );
      ( "DefinitionName",
        option_to_yojson hyper_parameter_training_job_definition_name_to_yojson x.definition_name );
    ]

let hyper_parameter_training_job_definitions_to_yojson tree =
  list_to_yojson hyper_parameter_training_job_definition_to_yojson tree

let hyper_parameter_tuning_job_status_to_yojson (x : hyper_parameter_tuning_job_status) =
  match x with
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | FAILED -> `String "Failed"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"

let objective_status_counter_to_yojson = int_to_yojson

let objective_status_counters_to_yojson (x : objective_status_counters) =
  assoc_to_yojson
    [
      ("Failed", option_to_yojson objective_status_counter_to_yojson x.failed);
      ("Pending", option_to_yojson objective_status_counter_to_yojson x.pending);
      ("Succeeded", option_to_yojson objective_status_counter_to_yojson x.succeeded);
    ]

let metric_value_to_yojson = float_to_yojson

let final_hyper_parameter_tuning_job_objective_metric_to_yojson
    (x : final_hyper_parameter_tuning_job_objective_metric) =
  assoc_to_yojson
    [
      ("Value", Some (metric_value_to_yojson x.value));
      ("MetricName", Some (metric_name_to_yojson x.metric_name));
      ("Type", option_to_yojson hyper_parameter_tuning_job_objective_type_to_yojson x.type_);
    ]

let objective_status_to_yojson (x : objective_status) =
  match x with
  | Failed -> `String "Failed"
  | Pending -> `String "Pending"
  | Succeeded -> `String "Succeeded"

let hyper_parameter_training_job_summary_to_yojson (x : hyper_parameter_training_job_summary) =
  assoc_to_yojson
    [
      ("ObjectiveStatus", option_to_yojson objective_status_to_yojson x.objective_status);
      ( "FinalHyperParameterTuningJobObjectiveMetric",
        option_to_yojson final_hyper_parameter_tuning_job_objective_metric_to_yojson
          x.final_hyper_parameter_tuning_job_objective_metric );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("TunedHyperParameters", Some (hyper_parameters_to_yojson x.tuned_hyper_parameters));
      ("TrainingJobStatus", Some (training_job_status_to_yojson x.training_job_status));
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TuningJobName", option_to_yojson hyper_parameter_tuning_job_name_to_yojson x.tuning_job_name);
      ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn));
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
      ( "TrainingJobDefinitionName",
        option_to_yojson hyper_parameter_training_job_definition_name_to_yojson
          x.training_job_definition_name );
    ]

let parent_hyper_parameter_tuning_job_to_yojson (x : parent_hyper_parameter_tuning_job) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        option_to_yojson hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name
      );
    ]

let parent_hyper_parameter_tuning_jobs_to_yojson tree =
  list_to_yojson parent_hyper_parameter_tuning_job_to_yojson tree

let hyper_parameter_tuning_job_warm_start_type_to_yojson
    (x : hyper_parameter_tuning_job_warm_start_type) =
  match x with
  | TRANSFER_LEARNING -> `String "TransferLearning"
  | IDENTICAL_DATA_AND_ALGORITHM -> `String "IdenticalDataAndAlgorithm"

let hyper_parameter_tuning_job_warm_start_config_to_yojson
    (x : hyper_parameter_tuning_job_warm_start_config) =
  assoc_to_yojson
    [
      ( "WarmStartType",
        Some (hyper_parameter_tuning_job_warm_start_type_to_yojson x.warm_start_type) );
      ( "ParentHyperParameterTuningJobs",
        Some (parent_hyper_parameter_tuning_jobs_to_yojson x.parent_hyper_parameter_tuning_jobs) );
    ]

let hyper_parameter_tuning_job_completion_details_to_yojson
    (x : hyper_parameter_tuning_job_completion_details) =
  assoc_to_yojson
    [
      ("ConvergenceDetectedTime", option_to_yojson timestamp_to_yojson x.convergence_detected_time);
      ( "NumberOfTrainingJobsObjectiveNotImproving",
        option_to_yojson integer_to_yojson x.number_of_training_jobs_objective_not_improving );
    ]

let hyper_parameter_tuning_job_consumed_resources_to_yojson
    (x : hyper_parameter_tuning_job_consumed_resources) =
  assoc_to_yojson [ ("RuntimeInSeconds", option_to_yojson integer_to_yojson x.runtime_in_seconds) ]

let hyper_parameter_tuning_job_search_entity_to_yojson
    (x : hyper_parameter_tuning_job_search_entity) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ConsumedResources",
        option_to_yojson hyper_parameter_tuning_job_consumed_resources_to_yojson
          x.consumed_resources );
      ( "TuningJobCompletionDetails",
        option_to_yojson hyper_parameter_tuning_job_completion_details_to_yojson
          x.tuning_job_completion_details );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "WarmStartConfig",
        option_to_yojson hyper_parameter_tuning_job_warm_start_config_to_yojson x.warm_start_config
      );
      ( "OverallBestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.overall_best_training_job
      );
      ( "BestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.best_training_job );
      ( "ObjectiveStatusCounters",
        option_to_yojson objective_status_counters_to_yojson x.objective_status_counters );
      ( "TrainingJobStatusCounters",
        option_to_yojson training_job_status_counters_to_yojson x.training_job_status_counters );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "HyperParameterTuningEndTime",
        option_to_yojson timestamp_to_yojson x.hyper_parameter_tuning_end_time );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "HyperParameterTuningJobStatus",
        option_to_yojson hyper_parameter_tuning_job_status_to_yojson
          x.hyper_parameter_tuning_job_status );
      ( "TrainingJobDefinitions",
        option_to_yojson hyper_parameter_training_job_definitions_to_yojson
          x.training_job_definitions );
      ( "TrainingJobDefinition",
        option_to_yojson hyper_parameter_training_job_definition_to_yojson x.training_job_definition
      );
      ( "HyperParameterTuningJobConfig",
        option_to_yojson hyper_parameter_tuning_job_config_to_yojson
          x.hyper_parameter_tuning_job_config );
      ( "HyperParameterTuningJobArn",
        option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn
      );
      ( "HyperParameterTuningJobName",
        option_to_yojson hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name
      );
    ]

let model_card_security_config_to_yojson (x : model_card_security_config) =
  assoc_to_yojson [ ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id) ]

let model_card_to_yojson (x : model_card) =
  assoc_to_yojson
    [
      ("ModelPackageGroupName", option_to_yojson string__to_yojson x.model_package_group_name);
      ("RiskRating", option_to_yojson string__to_yojson x.risk_rating);
      ("ModelId", option_to_yojson string__to_yojson x.model_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("Content", option_to_yojson model_card_content_to_yojson x.content);
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("ModelCardName", option_to_yojson entity_name_to_yojson x.model_card_name);
      ("ModelCardArn", option_to_yojson model_card_arn_to_yojson x.model_card_arn);
    ]

let repository_access_mode_to_yojson (x : repository_access_mode) =
  match x with VPC -> `String "Vpc" | PLATFORM -> `String "Platform"

let repository_credentials_provider_arn_to_yojson = string_to_yojson

let repository_auth_config_to_yojson (x : repository_auth_config) =
  assoc_to_yojson
    [
      ( "RepositoryCredentialsProviderArn",
        Some (repository_credentials_provider_arn_to_yojson x.repository_credentials_provider_arn)
      );
    ]

let image_config_to_yojson (x : image_config) =
  assoc_to_yojson
    [
      ( "RepositoryAuthConfig",
        option_to_yojson repository_auth_config_to_yojson x.repository_auth_config );
      ("RepositoryAccessMode", Some (repository_access_mode_to_yojson x.repository_access_mode));
    ]

let container_mode_to_yojson (x : container_mode) =
  match x with MULTI_MODEL -> `String "MultiModel" | SINGLE_MODEL -> `String "SingleModel"

let inference_specification_name_to_yojson = string_to_yojson

let model_cache_setting_to_yojson (x : model_cache_setting) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let multi_model_config_to_yojson (x : multi_model_config) =
  assoc_to_yojson
    [ ("ModelCacheSetting", option_to_yojson model_cache_setting_to_yojson x.model_cache_setting) ]

let container_definition_to_yojson (x : container_definition) =
  assoc_to_yojson
    [
      ( "ContainerMetricsConfig",
        option_to_yojson container_metrics_config_to_yojson x.container_metrics_config );
      ("MultiModelConfig", option_to_yojson multi_model_config_to_yojson x.multi_model_config);
      ( "InferenceSpecificationName",
        option_to_yojson inference_specification_name_to_yojson x.inference_specification_name );
      ("ModelPackageName", option_to_yojson versioned_arn_or_name_to_yojson x.model_package_name);
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ( "AdditionalModelDataSources",
        option_to_yojson additional_model_data_sources_to_yojson x.additional_model_data_sources );
      ("ModelDataSource", option_to_yojson model_data_source_to_yojson x.model_data_source);
      ("ModelDataUrl", option_to_yojson url_to_yojson x.model_data_url);
      ("Mode", option_to_yojson container_mode_to_yojson x.mode);
      ("ImageConfig", option_to_yojson image_config_to_yojson x.image_config);
      ("Image", option_to_yojson container_image_to_yojson x.image);
      ("ContainerHostname", option_to_yojson container_hostname_to_yojson x.container_hostname);
    ]

let container_definition_list_to_yojson tree = list_to_yojson container_definition_to_yojson tree

let inference_execution_mode_to_yojson (x : inference_execution_mode) =
  match x with DIRECT -> `String "Direct" | SERIAL -> `String "Serial"

let inference_execution_config_to_yojson (x : inference_execution_config) =
  assoc_to_yojson [ ("Mode", Some (inference_execution_mode_to_yojson x.mode)) ]

let model_arn_to_yojson = string_to_yojson

let recommendation_status_to_yojson (x : recommendation_status) =
  match x with
  | NOT_APPLICABLE -> `String "NOT_APPLICABLE"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let real_time_inference_recommendation_to_yojson (x : real_time_inference_recommendation) =
  assoc_to_yojson
    [
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
      ("RecommendationId", Some (string__to_yojson x.recommendation_id));
    ]

let real_time_inference_recommendations_to_yojson tree =
  list_to_yojson real_time_inference_recommendation_to_yojson tree

let deployment_recommendation_to_yojson (x : deployment_recommendation) =
  assoc_to_yojson
    [
      ( "RealTimeInferenceRecommendations",
        option_to_yojson real_time_inference_recommendations_to_yojson
          x.real_time_inference_recommendations );
      ("RecommendationStatus", Some (recommendation_status_to_yojson x.recommendation_status));
    ]

let model_to_yojson (x : model) =
  assoc_to_yojson
    [
      ( "DeploymentRecommendation",
        option_to_yojson deployment_recommendation_to_yojson x.deployment_recommendation );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ( "InferenceExecutionConfig",
        option_to_yojson inference_execution_config_to_yojson x.inference_execution_config );
      ("Containers", option_to_yojson container_definition_list_to_yojson x.containers);
      ("PrimaryContainer", option_to_yojson container_definition_to_yojson x.primary_container);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let model_dashboard_endpoint_to_yojson (x : model_dashboard_endpoint) =
  assoc_to_yojson
    [
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let model_dashboard_endpoints_to_yojson tree =
  list_to_yojson model_dashboard_endpoint_to_yojson tree

let monitoring_alert_status_to_yojson (x : monitoring_alert_status) =
  match x with OK -> `String "OK" | IN_ALERT -> `String "InAlert"

let model_dashboard_indicator_action_to_yojson (x : model_dashboard_indicator_action) =
  assoc_to_yojson [ ("Enabled", option_to_yojson boolean__to_yojson x.enabled) ]

let monitoring_alert_actions_to_yojson (x : monitoring_alert_actions) =
  assoc_to_yojson
    [
      ( "ModelDashboardIndicator",
        option_to_yojson model_dashboard_indicator_action_to_yojson x.model_dashboard_indicator );
    ]

let monitoring_alert_summary_to_yojson (x : monitoring_alert_summary) =
  assoc_to_yojson
    [
      ("Actions", Some (monitoring_alert_actions_to_yojson x.actions));
      ("EvaluationPeriod", Some (monitoring_evaluation_period_to_yojson x.evaluation_period));
      ("DatapointsToAlert", Some (monitoring_datapoints_to_alert_to_yojson x.datapoints_to_alert));
      ("AlertStatus", Some (monitoring_alert_status_to_yojson x.alert_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("MonitoringAlertName", Some (monitoring_alert_name_to_yojson x.monitoring_alert_name));
    ]

let monitoring_alert_summary_list_to_yojson tree =
  list_to_yojson monitoring_alert_summary_to_yojson tree

let model_dashboard_monitoring_schedule_to_yojson (x : model_dashboard_monitoring_schedule) =
  assoc_to_yojson
    [
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ( "LastMonitoringExecutionSummary",
        option_to_yojson monitoring_execution_summary_to_yojson x.last_monitoring_execution_summary
      );
      ( "MonitoringAlertSummaries",
        option_to_yojson monitoring_alert_summary_list_to_yojson x.monitoring_alert_summaries );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "MonitoringScheduleConfig",
        option_to_yojson monitoring_schedule_config_to_yojson x.monitoring_schedule_config );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ( "MonitoringScheduleStatus",
        option_to_yojson schedule_status_to_yojson x.monitoring_schedule_status );
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
    ]

let model_dashboard_monitoring_schedules_to_yojson tree =
  list_to_yojson model_dashboard_monitoring_schedule_to_yojson tree

let model_dashboard_model_card_to_yojson (x : model_dashboard_model_card) =
  assoc_to_yojson
    [
      ("RiskRating", option_to_yojson string__to_yojson x.risk_rating);
      ("ModelId", option_to_yojson string__to_yojson x.model_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("ModelCardName", option_to_yojson entity_name_to_yojson x.model_card_name);
      ("ModelCardArn", option_to_yojson model_card_arn_to_yojson x.model_card_arn);
    ]

let model_dashboard_model_to_yojson (x : model_dashboard_model) =
  assoc_to_yojson
    [
      ("ModelCard", option_to_yojson model_dashboard_model_card_to_yojson x.model_card);
      ( "MonitoringSchedules",
        option_to_yojson model_dashboard_monitoring_schedules_to_yojson x.monitoring_schedules );
      ("LastBatchTransformJob", option_to_yojson transform_job_to_yojson x.last_batch_transform_job);
      ("Endpoints", option_to_yojson model_dashboard_endpoints_to_yojson x.endpoints);
      ("Model", option_to_yojson model_to_yojson x.model);
    ]

let job_arn_to_yojson = string_to_yojson
let job_schema_version_to_yojson = string_to_yojson
let job_config_document_to_yojson = string_to_yojson

let job_status_to_yojson (x : job_status) =
  match x with
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let job_secondary_status_to_yojson (x : job_secondary_status) =
  match x with
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | EVALUATING -> `String "Evaluating"
  | PENDING -> `String "Pending"
  | RESTARTING -> `String "Restarting"
  | COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | INTERRUPTED -> `String "Interrupted"
  | MAX_RUNTIME_EXCEEDED -> `String "MaxRuntimeExceeded"
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | UPLOADING -> `String "Uploading"
  | TRAINING -> `String "Training"
  | DOWNLOADING -> `String "Downloading"
  | STARTING -> `String "Starting"

let job_secondary_status_transition_to_yojson (x : job_secondary_status_transition) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("Status", Some (job_secondary_status_to_yojson x.status));
    ]

let job_secondary_status_transitions_to_yojson tree =
  list_to_yojson job_secondary_status_transition_to_yojson tree

let job_to_yojson (x : job) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "SecondaryStatusTransitions",
        option_to_yojson job_secondary_status_transitions_to_yojson x.secondary_status_transitions
      );
      ("SecondaryStatus", option_to_yojson job_secondary_status_to_yojson x.secondary_status);
      ("JobStatus", option_to_yojson job_status_to_yojson x.job_status);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("JobConfigDocument", option_to_yojson job_config_document_to_yojson x.job_config_document);
      ( "JobConfigSchemaVersion",
        option_to_yojson job_schema_version_to_yojson x.job_config_schema_version );
      ("JobCategory", option_to_yojson job_category_to_yojson x.job_category);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("JobArn", option_to_yojson job_arn_to_yojson x.job_arn);
      ("JobName", option_to_yojson job_name_to_yojson x.job_name);
    ]

let search_record_to_yojson (x : search_record) =
  assoc_to_yojson
    [
      ("Job", option_to_yojson job_to_yojson x.job);
      ("Model", option_to_yojson model_dashboard_model_to_yojson x.model);
      ("ModelCard", option_to_yojson model_card_to_yojson x.model_card);
      ( "HyperParameterTuningJob",
        option_to_yojson hyper_parameter_tuning_job_search_entity_to_yojson
          x.hyper_parameter_tuning_job );
      ("Project", option_to_yojson project_to_yojson x.project);
      ("FeatureMetadata", option_to_yojson feature_metadata_to_yojson x.feature_metadata);
      ("FeatureGroup", option_to_yojson feature_group_to_yojson x.feature_group);
      ("PipelineVersion", option_to_yojson pipeline_version_to_yojson x.pipeline_version);
      ("PipelineExecution", option_to_yojson pipeline_execution_to_yojson x.pipeline_execution);
      ("Pipeline", option_to_yojson pipeline_to_yojson x.pipeline);
      ("ModelPackageGroup", option_to_yojson model_package_group_to_yojson x.model_package_group);
      ("ModelPackage", option_to_yojson model_package_to_yojson x.model_package);
      ("Endpoint", option_to_yojson endpoint_to_yojson x.endpoint);
      ("TrialComponent", option_to_yojson trial_component_to_yojson x.trial_component);
      ("Trial", option_to_yojson trial_to_yojson x.trial);
      ("Experiment", option_to_yojson experiment_to_yojson x.experiment);
      ("TrainingJob", option_to_yojson training_job_to_yojson x.training_job);
    ]

let search_results_list_to_yojson tree = list_to_yojson search_record_to_yojson tree
let next_token_to_yojson = string_to_yojson

let search_response_to_yojson (x : search_response) =
  assoc_to_yojson
    [
      ("TotalHits", option_to_yojson total_hits_to_yojson x.total_hits);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Results", option_to_yojson search_results_list_to_yojson x.results);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | JOB -> `String "Job"
  | PIPELINE_VERSION -> `String "PipelineVersion"
  | MODEL_CARD -> `String "ModelCard"
  | HYPER_PARAMETER_TUNING_JOB -> `String "HyperParameterTuningJob"
  | PROJECT -> `String "Project"
  | IMAGE_VERSION -> `String "ImageVersion"
  | IMAGE -> `String "Image"
  | FEATURE_METADATA -> `String "FeatureMetadata"
  | FEATURE_GROUP -> `String "FeatureGroup"
  | PIPELINE_EXECUTION -> `String "PipelineExecution"
  | PIPELINE -> `String "Pipeline"
  | MODEL_PACKAGE_GROUP -> `String "ModelPackageGroup"
  | MODEL_PACKAGE -> `String "ModelPackage"
  | MODEL -> `String "Model"
  | ENDPOINT -> `String "Endpoint"
  | EXPERIMENT_TRIAL_COMPONENT -> `String "ExperimentTrialComponent"
  | EXPERIMENT_TRIAL -> `String "ExperimentTrial"
  | EXPERIMENT -> `String "Experiment"
  | TRAINING_JOB -> `String "TrainingJob"

let resource_property_name_to_yojson = string_to_yojson

let operator_to_yojson (x : operator) =
  match x with
  | IN -> `String "In"
  | NOT_EXISTS -> `String "NotExists"
  | EXISTS -> `String "Exists"
  | CONTAINS -> `String "Contains"
  | LESS_THAN_OR_EQUAL_TO -> `String "LessThanOrEqualTo"
  | LESS_THAN -> `String "LessThan"
  | GREATER_THAN_OR_EQUAL_TO -> `String "GreaterThanOrEqualTo"
  | GREATER_THAN -> `String "GreaterThan"
  | NOT_EQUALS -> `String "NotEquals"
  | EQUALS -> `String "Equals"

let filter_value_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson filter_value_to_yojson x.value);
      ("Operator", option_to_yojson operator_to_yojson x.operator);
      ("Name", Some (resource_property_name_to_yojson x.name));
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let nested_filters_to_yojson (x : nested_filters) =
  assoc_to_yojson
    [
      ("Filters", Some (filter_list_to_yojson x.filters));
      ("NestedPropertyName", Some (resource_property_name_to_yojson x.nested_property_name));
    ]

let nested_filters_list_to_yojson tree = list_to_yojson nested_filters_to_yojson tree

let boolean_operator_to_yojson (x : boolean_operator) =
  match x with OR -> `String "Or" | AND -> `String "And"

let rec search_expression_to_yojson (x : search_expression) =
  assoc_to_yojson
    [
      ("Operator", option_to_yojson boolean_operator_to_yojson x.operator);
      ("SubExpressions", option_to_yojson search_expression_list_to_yojson x.sub_expressions);
      ("NestedFilters", option_to_yojson nested_filters_list_to_yojson x.nested_filters);
      ("Filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

and search_expression_list_to_yojson tree = list_to_yojson search_expression_to_yojson tree

let max_results_to_yojson = int_to_yojson

let cross_account_filter_option_to_yojson (x : cross_account_filter_option) =
  match x with CROSS_ACCOUNT -> `String "CrossAccount" | SAME_ACCOUNT -> `String "SameAccount"

let search_request_to_yojson (x : search_request) =
  assoc_to_yojson
    [
      ( "VisibilityConditions",
        option_to_yojson visibility_conditions_list_to_yojson x.visibility_conditions );
      ( "CrossAccountFilterOption",
        option_to_yojson cross_account_filter_option_to_yojson x.cross_account_filter_option );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson search_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson resource_property_name_to_yojson x.sort_by);
      ("SearchExpression", option_to_yojson search_expression_to_yojson x.search_expression);
      ("Resource", Some (resource_type_to_yojson x.resource));
    ]

let scaling_policy_objective_to_yojson (x : scaling_policy_objective) =
  assoc_to_yojson
    [
      ("MaxInvocationsPerMinute", option_to_yojson integer_to_yojson x.max_invocations_per_minute);
      ("MinInvocationsPerMinute", option_to_yojson integer_to_yojson x.min_invocations_per_minute);
    ]

let scaling_policy_metric_to_yojson (x : scaling_policy_metric) =
  assoc_to_yojson
    [
      ("ModelLatency", option_to_yojson integer_to_yojson x.model_latency);
      ("InvocationsPerInstance", option_to_yojson integer_to_yojson x.invocations_per_instance);
    ]

let scaling_policy_to_yojson (x : scaling_policy) =
  match x with
  | TargetTracking arg ->
      assoc_to_yojson
        [ ("TargetTracking", Some (target_tracking_scaling_policy_configuration_to_yojson arg)) ]

let scaling_policies_to_yojson tree = list_to_yojson scaling_policy_to_yojson tree

let sagemaker_servicecatalog_status_to_yojson (x : sagemaker_servicecatalog_status) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let sage_maker_public_hub_content_arn_to_yojson = string_to_yojson

let retry_pipeline_execution_response_to_yojson (x : retry_pipeline_execution_response) =
  assoc_to_yojson
    [
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let retry_pipeline_execution_request_to_yojson (x : retry_pipeline_execution_request) =
  assoc_to_yojson
    [
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
    ]

let rendering_error_to_yojson (x : rendering_error) =
  assoc_to_yojson
    [ ("Message", Some (string__to_yojson x.message)); ("Code", Some (string__to_yojson x.code)) ]

let rendering_error_list_to_yojson tree = list_to_yojson rendering_error_to_yojson tree

let render_ui_template_response_to_yojson (x : render_ui_template_response) =
  assoc_to_yojson
    [
      ("Errors", Some (rendering_error_list_to_yojson x.errors));
      ("RenderedContent", Some (string__to_yojson x.rendered_content));
    ]

let renderable_task_to_yojson (x : renderable_task) =
  assoc_to_yojson [ ("Input", Some (task_input_to_yojson x.input)) ]

let render_ui_template_request_to_yojson (x : render_ui_template_request) =
  assoc_to_yojson
    [
      ("HumanTaskUiArn", option_to_yojson human_task_ui_arn_to_yojson x.human_task_ui_arn);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Task", Some (renderable_task_to_yojson x.task));
      ("UiTemplate", option_to_yojson ui_template_to_yojson x.ui_template);
    ]

let register_devices_request_to_yojson (x : register_devices_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Devices", Some (devices_to_yojson x.devices));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
    ]

let association_edge_type_to_yojson (x : association_edge_type) =
  match x with
  | SAME_AS -> `String "SameAs"
  | PRODUCED -> `String "Produced"
  | DERIVED_FROM -> `String "DerivedFrom"
  | ASSOCIATED_WITH -> `String "AssociatedWith"
  | CONTRIBUTED_TO -> `String "ContributedTo"

let edge_to_yojson (x : edge) =
  assoc_to_yojson
    [
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
    ]

let edges_to_yojson tree = list_to_yojson edge_to_yojson tree

let query_lineage_response_to_yojson (x : query_lineage_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string8192_to_yojson x.next_token);
      ("Edges", option_to_yojson edges_to_yojson x.edges);
      ("Vertices", option_to_yojson vertices_to_yojson x.vertices);
    ]

let query_lineage_start_arns_to_yojson tree = list_to_yojson association_entity_arn_to_yojson tree

let direction_to_yojson (x : direction) =
  match x with
  | DESCENDANTS -> `String "Descendants"
  | ASCENDANTS -> `String "Ascendants"
  | BOTH -> `String "Both"

let query_types_to_yojson tree = list_to_yojson string40_to_yojson tree
let query_lineage_types_to_yojson tree = list_to_yojson lineage_type_to_yojson tree
let query_properties_to_yojson tree = map_to_yojson string256_to_yojson string256_to_yojson tree

let query_filters_to_yojson (x : query_filters) =
  assoc_to_yojson
    [
      ("Properties", option_to_yojson query_properties_to_yojson x.properties);
      ("ModifiedAfter", option_to_yojson timestamp_to_yojson x.modified_after);
      ("ModifiedBefore", option_to_yojson timestamp_to_yojson x.modified_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("LineageTypes", option_to_yojson query_lineage_types_to_yojson x.lineage_types);
      ("Types", option_to_yojson query_types_to_yojson x.types);
    ]

let query_lineage_max_depth_to_yojson = int_to_yojson
let query_lineage_max_results_to_yojson = int_to_yojson

let query_lineage_request_to_yojson (x : query_lineage_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string8192_to_yojson x.next_token);
      ("MaxResults", option_to_yojson query_lineage_max_results_to_yojson x.max_results);
      ("MaxDepth", option_to_yojson query_lineage_max_depth_to_yojson x.max_depth);
      ("Filters", option_to_yojson query_filters_to_yojson x.filters);
      ("IncludeEdges", option_to_yojson boolean__to_yojson x.include_edges);
      ("Direction", option_to_yojson direction_to_yojson x.direction);
      ("StartArns", option_to_yojson query_lineage_start_arns_to_yojson x.start_arns);
    ]

let put_model_package_group_policy_output_to_yojson (x : put_model_package_group_policy_output) =
  assoc_to_yojson
    [ ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn)) ]

let policy_string_to_yojson = string_to_yojson

let put_model_package_group_policy_input_to_yojson (x : put_model_package_group_policy_input) =
  assoc_to_yojson
    [
      ("ResourcePolicy", Some (policy_string_to_yojson x.resource_policy));
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
    ]

let list_workteams_response_to_yojson (x : list_workteams_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Workteams", Some (workteams_to_yojson x.workteams));
    ]

let list_workteams_sort_by_options_to_yojson (x : list_workteams_sort_by_options) =
  match x with CreateDate -> `String "CreateDate" | Name -> `String "Name"

let list_workteams_request_to_yojson (x : list_workteams_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson workteam_name_to_yojson x.name_contains);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_workteams_sort_by_options_to_yojson x.sort_by);
    ]

let list_workforces_response_to_yojson (x : list_workforces_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Workforces", Some (workforces_to_yojson x.workforces));
    ]

let list_workforces_sort_by_options_to_yojson (x : list_workforces_sort_by_options) =
  match x with CreateDate -> `String "CreateDate" | Name -> `String "Name"

let list_workforces_request_to_yojson (x : list_workforces_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson workforce_name_to_yojson x.name_contains);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_workforces_sort_by_options_to_yojson x.sort_by);
    ]

let list_user_profiles_response_to_yojson (x : list_user_profiles_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("UserProfiles", option_to_yojson user_profile_list_to_yojson x.user_profiles);
    ]

let list_user_profiles_request_to_yojson (x : list_user_profiles_request) =
  assoc_to_yojson
    [
      ( "UserProfileNameContains",
        option_to_yojson user_profile_name_to_yojson x.user_profile_name_contains );
      ("DomainIdEquals", option_to_yojson domain_id_to_yojson x.domain_id_equals);
      ("SortBy", option_to_yojson user_profile_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_ultra_servers_by_reserved_capacity_response_to_yojson
    (x : list_ultra_servers_by_reserved_capacity_response) =
  assoc_to_yojson
    [
      ("UltraServers", Some (ultra_servers_to_yojson x.ultra_servers));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_ultra_servers_by_reserved_capacity_request_to_yojson
    (x : list_ultra_servers_by_reserved_capacity_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn));
    ]

let list_trials_response_to_yojson (x : list_trials_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TrialSummaries", option_to_yojson trial_summaries_to_yojson x.trial_summaries);
    ]

let list_trials_request_to_yojson (x : list_trials_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_trials_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
    ]

let list_trial_components_response_to_yojson (x : list_trial_components_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "TrialComponentSummaries",
        option_to_yojson trial_component_summaries_to_yojson x.trial_component_summaries );
    ]

let list_trial_components_request_to_yojson (x : list_trial_components_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_trial_components_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("SourceArn", option_to_yojson string256_to_yojson x.source_arn);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
    ]

let list_transform_jobs_response_to_yojson (x : list_transform_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TransformJobSummaries", Some (transform_job_summaries_to_yojson x.transform_job_summaries));
    ]

let name_contains_to_yojson = string_to_yojson

let list_transform_jobs_request_to_yojson (x : list_transform_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson transform_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let list_training_plans_response_to_yojson (x : list_training_plans_response) =
  assoc_to_yojson
    [
      ("TrainingPlanSummaries", Some (training_plan_summaries_to_yojson x.training_plan_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_training_plans_request_to_yojson (x : list_training_plans_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson training_plan_filters_to_yojson x.filters);
      ("SortOrder", option_to_yojson training_plan_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson training_plan_sort_by_to_yojson x.sort_by);
      ("StartTimeBefore", option_to_yojson timestamp_to_yojson x.start_time_before);
      ("StartTimeAfter", option_to_yojson timestamp_to_yojson x.start_time_after);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let hyper_parameter_training_job_summaries_to_yojson tree =
  list_to_yojson hyper_parameter_training_job_summary_to_yojson tree

let list_training_jobs_for_hyper_parameter_tuning_job_response_to_yojson
    (x : list_training_jobs_for_hyper_parameter_tuning_job_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "TrainingJobSummaries",
        Some (hyper_parameter_training_job_summaries_to_yojson x.training_job_summaries) );
    ]

let list_training_jobs_for_hyper_parameter_tuning_job_request_to_yojson
    (x : list_training_jobs_for_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson training_job_sort_by_options_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson training_job_status_to_yojson x.status_equals);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let list_training_jobs_response_to_yojson (x : list_training_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TrainingJobSummaries", Some (training_job_summaries_to_yojson x.training_job_summaries));
    ]

let list_training_jobs_request_to_yojson (x : list_training_jobs_request) =
  assoc_to_yojson
    [
      ( "TrainingPlanArnEquals",
        option_to_yojson training_plan_arn_to_yojson x.training_plan_arn_equals );
      ( "WarmPoolStatusEquals",
        option_to_yojson warm_pool_resource_status_to_yojson x.warm_pool_status_equals );
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson training_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_output_to_yojson (x : list_tags_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let resource_arn_to_yojson = string_to_yojson
let list_tags_max_results_to_yojson = int_to_yojson

let list_tags_input_to_yojson (x : list_tags_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_tags_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let list_subscribed_workteams_response_to_yojson (x : list_subscribed_workteams_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SubscribedWorkteams", Some (subscribed_workteams_to_yojson x.subscribed_workteams));
    ]

let list_subscribed_workteams_request_to_yojson (x : list_subscribed_workteams_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson workteam_name_to_yojson x.name_contains);
    ]

let list_studio_lifecycle_configs_response_to_yojson (x : list_studio_lifecycle_configs_response) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigs",
        option_to_yojson studio_lifecycle_configs_list_to_yojson x.studio_lifecycle_configs );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_studio_lifecycle_configs_request_to_yojson (x : list_studio_lifecycle_configs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson studio_lifecycle_config_sort_key_to_yojson x.sort_by);
      ("ModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.modified_time_after);
      ("ModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.modified_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ( "AppTypeEquals",
        option_to_yojson studio_lifecycle_config_app_type_to_yojson x.app_type_equals );
      ("NameContains", option_to_yojson studio_lifecycle_config_name_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let edge_deployment_plan_arn_to_yojson = string_to_yojson
let device_arn_to_yojson = string_to_yojson

let device_deployment_status_to_yojson (x : device_deployment_status) =
  match x with
  | Stopped -> `String "STOPPED"
  | Stopping -> `String "STOPPING"
  | Failed -> `String "FAILED"
  | Deployed -> `String "DEPLOYED"
  | InProgress -> `String "INPROGRESS"
  | ReadyToDeploy -> `String "READYTODEPLOY"

let device_deployment_summary_to_yojson (x : device_deployment_summary) =
  assoc_to_yojson
    [
      ("DeploymentStartTime", option_to_yojson timestamp_to_yojson x.deployment_start_time);
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ( "DeviceDeploymentStatusMessage",
        option_to_yojson string__to_yojson x.device_deployment_status_message );
      ( "DeviceDeploymentStatus",
        option_to_yojson device_deployment_status_to_yojson x.device_deployment_status );
      ("DeviceArn", Some (device_arn_to_yojson x.device_arn));
      ("DeviceName", Some (device_name_to_yojson x.device_name));
      ("DeviceFleetName", option_to_yojson entity_name_to_yojson x.device_fleet_name);
      ("DeployedStageName", option_to_yojson entity_name_to_yojson x.deployed_stage_name);
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
    ]

let device_deployment_summaries_to_yojson tree =
  list_to_yojson device_deployment_summary_to_yojson tree

let list_stage_devices_response_to_yojson (x : list_stage_devices_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DeviceDeploymentSummaries",
        Some (device_deployment_summaries_to_yojson x.device_deployment_summaries) );
    ]

let list_max_results_to_yojson = int_to_yojson

let list_stage_devices_request_to_yojson (x : list_stage_devices_request) =
  assoc_to_yojson
    [
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ( "ExcludeDevicesDeployedInOtherStage",
        option_to_yojson boolean__to_yojson x.exclude_devices_deployed_in_other_stage );
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_spaces_response_to_yojson (x : list_spaces_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Spaces", option_to_yojson space_list_to_yojson x.spaces);
    ]

let list_spaces_request_to_yojson (x : list_spaces_request) =
  assoc_to_yojson
    [
      ("SpaceNameContains", option_to_yojson space_name_to_yojson x.space_name_contains);
      ("DomainIdEquals", option_to_yojson domain_id_to_yojson x.domain_id_equals);
      ("SortBy", option_to_yojson space_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let resource_catalog_arn_to_yojson = string_to_yojson
let resource_catalog_name_to_yojson = string_to_yojson
let resource_catalog_description_to_yojson = string_to_yojson

let resource_catalog_to_yojson (x : resource_catalog) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Description", Some (resource_catalog_description_to_yojson x.description));
      ("ResourceCatalogName", Some (resource_catalog_name_to_yojson x.resource_catalog_name));
      ("ResourceCatalogArn", Some (resource_catalog_arn_to_yojson x.resource_catalog_arn));
    ]

let resource_catalog_list_to_yojson tree = list_to_yojson resource_catalog_to_yojson tree

let list_resource_catalogs_response_to_yojson (x : list_resource_catalogs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ResourceCatalogs", option_to_yojson resource_catalog_list_to_yojson x.resource_catalogs);
    ]

let resource_catalog_sort_order_to_yojson (x : resource_catalog_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let resource_catalog_sort_by_to_yojson (x : resource_catalog_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime"

let list_resource_catalogs_request_to_yojson (x : list_resource_catalogs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson resource_catalog_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson resource_catalog_sort_order_to_yojson x.sort_order);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("NameContains", option_to_yojson resource_catalog_name_to_yojson x.name_contains);
    ]

let project_summary_to_yojson (x : project_summary) =
  assoc_to_yojson
    [
      ("ProjectStatus", Some (project_status_to_yojson x.project_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ProjectId", Some (project_id_to_yojson x.project_id));
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
    ]

let project_summary_list_to_yojson tree = list_to_yojson project_summary_to_yojson tree

let list_projects_output_to_yojson (x : list_projects_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ProjectSummaryList", Some (project_summary_list_to_yojson x.project_summary_list));
    ]

let project_sort_by_to_yojson (x : project_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let project_sort_order_to_yojson (x : project_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let list_projects_input_to_yojson (x : list_projects_input) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson project_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson project_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson project_entity_name_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let processing_job_summary_to_yojson (x : processing_job_summary) =
  assoc_to_yojson
    [
      ("ExitMessage", option_to_yojson exit_message_to_yojson x.exit_message);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ProcessingJobStatus", Some (processing_job_status_to_yojson x.processing_job_status));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ProcessingEndTime", option_to_yojson timestamp_to_yojson x.processing_end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ProcessingJobArn", Some (processing_job_arn_to_yojson x.processing_job_arn));
      ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name));
    ]

let processing_job_summaries_to_yojson tree = list_to_yojson processing_job_summary_to_yojson tree

let list_processing_jobs_response_to_yojson (x : list_processing_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ProcessingJobSummaries",
        Some (processing_job_summaries_to_yojson x.processing_job_summaries) );
    ]

let list_processing_jobs_request_to_yojson (x : list_processing_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson processing_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson string__to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let pipeline_version_summary_to_yojson (x : pipeline_version_summary) =
  assoc_to_yojson
    [
      ( "LastExecutionPipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.last_execution_pipeline_execution_arn );
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let pipeline_version_summary_list_to_yojson tree =
  list_to_yojson pipeline_version_summary_to_yojson tree

let list_pipeline_versions_response_to_yojson (x : list_pipeline_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "PipelineVersionSummaries",
        option_to_yojson pipeline_version_summary_list_to_yojson x.pipeline_version_summaries );
    ]

let list_pipeline_versions_request_to_yojson (x : list_pipeline_versions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
    ]

let pipeline_summary_to_yojson (x : pipeline_summary) =
  assoc_to_yojson
    [
      ("LastExecutionTime", option_to_yojson timestamp_to_yojson x.last_execution_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let pipeline_summary_list_to_yojson tree = list_to_yojson pipeline_summary_to_yojson tree

let list_pipelines_response_to_yojson (x : list_pipelines_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PipelineSummaries", option_to_yojson pipeline_summary_list_to_yojson x.pipeline_summaries);
    ]

let list_pipelines_request_to_yojson (x : list_pipelines_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_pipelines_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("PipelineNamePrefix", option_to_yojson pipeline_name_to_yojson x.pipeline_name_prefix);
    ]

let list_pipeline_parameters_for_execution_response_to_yojson
    (x : list_pipeline_parameters_for_execution_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PipelineParameters", option_to_yojson parameter_list_to_yojson x.pipeline_parameters);
    ]

let list_pipeline_parameters_for_execution_request_to_yojson
    (x : list_pipeline_parameters_for_execution_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn));
    ]

let cache_hit_result_to_yojson (x : cache_hit_result) =
  assoc_to_yojson
    [
      ( "SourcePipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.source_pipeline_execution_arn );
    ]

let processing_job_step_metadata_to_yojson (x : processing_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson processing_job_arn_to_yojson x.arn) ]

let model_step_metadata_to_yojson (x : model_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string256_to_yojson x.arn) ]

let register_model_step_metadata_to_yojson (x : register_model_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string256_to_yojson x.arn) ]

let condition_outcome_to_yojson (x : condition_outcome) =
  match x with FALSE -> `String "False" | TRUE -> `String "True"

let condition_step_metadata_to_yojson (x : condition_step_metadata) =
  assoc_to_yojson [ ("Outcome", option_to_yojson condition_outcome_to_yojson x.outcome) ]

let callback_step_metadata_to_yojson (x : callback_step_metadata) =
  assoc_to_yojson
    [
      ("OutputParameters", option_to_yojson output_parameter_list_to_yojson x.output_parameters);
      ("SqsQueueUrl", option_to_yojson string256_to_yojson x.sqs_queue_url);
      ("CallbackToken", option_to_yojson callback_token_to_yojson x.callback_token);
    ]

let lambda_step_metadata_to_yojson (x : lambda_step_metadata) =
  assoc_to_yojson
    [
      ("OutputParameters", option_to_yojson output_parameter_list_to_yojson x.output_parameters);
      ("Arn", option_to_yojson string256_to_yojson x.arn);
    ]

let emr_step_metadata_to_yojson (x : emr_step_metadata) =
  assoc_to_yojson
    [
      ("LogFilePath", option_to_yojson string1024_to_yojson x.log_file_path);
      ("StepName", option_to_yojson string256_to_yojson x.step_name);
      ("StepId", option_to_yojson string256_to_yojson x.step_id);
      ("ClusterId", option_to_yojson string256_to_yojson x.cluster_id);
    ]

let quality_check_step_metadata_to_yojson (x : quality_check_step_metadata) =
  assoc_to_yojson
    [
      ("RegisterNewBaseline", option_to_yojson boolean__to_yojson x.register_new_baseline);
      ("SkipCheck", option_to_yojson boolean__to_yojson x.skip_check);
      ("CheckJobArn", option_to_yojson string256_to_yojson x.check_job_arn);
      ("ViolationReport", option_to_yojson string1024_to_yojson x.violation_report);
      ("ModelPackageGroupName", option_to_yojson string256_to_yojson x.model_package_group_name);
      ( "CalculatedBaselineConstraints",
        option_to_yojson string1024_to_yojson x.calculated_baseline_constraints );
      ( "CalculatedBaselineStatistics",
        option_to_yojson string1024_to_yojson x.calculated_baseline_statistics );
      ( "BaselineUsedForDriftCheckConstraints",
        option_to_yojson string1024_to_yojson x.baseline_used_for_drift_check_constraints );
      ( "BaselineUsedForDriftCheckStatistics",
        option_to_yojson string1024_to_yojson x.baseline_used_for_drift_check_statistics );
      ("CheckType", option_to_yojson string256_to_yojson x.check_type);
    ]

let clarify_check_step_metadata_to_yojson (x : clarify_check_step_metadata) =
  assoc_to_yojson
    [
      ("RegisterNewBaseline", option_to_yojson boolean__to_yojson x.register_new_baseline);
      ("SkipCheck", option_to_yojson boolean__to_yojson x.skip_check);
      ("CheckJobArn", option_to_yojson string256_to_yojson x.check_job_arn);
      ("ViolationReport", option_to_yojson string1024_to_yojson x.violation_report);
      ("ModelPackageGroupName", option_to_yojson string256_to_yojson x.model_package_group_name);
      ( "CalculatedBaselineConstraints",
        option_to_yojson string1024_to_yojson x.calculated_baseline_constraints );
      ( "BaselineUsedForDriftCheckConstraints",
        option_to_yojson string1024_to_yojson x.baseline_used_for_drift_check_constraints );
      ("CheckType", option_to_yojson string256_to_yojson x.check_type);
    ]

let fail_step_metadata_to_yojson (x : fail_step_metadata) =
  assoc_to_yojson [ ("ErrorMessage", option_to_yojson string3072_to_yojson x.error_message) ]

let auto_ml_job_step_metadata_to_yojson (x : auto_ml_job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson auto_ml_job_arn_to_yojson x.arn) ]

let endpoint_step_metadata_to_yojson (x : endpoint_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson endpoint_arn_to_yojson x.arn) ]

let endpoint_config_arn_to_yojson = string_to_yojson

let endpoint_config_step_metadata_to_yojson (x : endpoint_config_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson endpoint_config_arn_to_yojson x.arn) ]

let bedrock_custom_model_metadata_to_yojson (x : bedrock_custom_model_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let bedrock_custom_model_deployment_metadata_to_yojson
    (x : bedrock_custom_model_deployment_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let bedrock_provisioned_model_throughput_metadata_to_yojson
    (x : bedrock_provisioned_model_throughput_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let bedrock_model_import_metadata_to_yojson (x : bedrock_model_import_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let inference_component_metadata_to_yojson (x : inference_component_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string2048_to_yojson x.arn) ]

let map_string2048_to_yojson tree = map_to_yojson string2048_to_yojson string2048_to_yojson tree

let association_info_to_yojson (x : association_info) =
  assoc_to_yojson
    [
      ("DestinationArn", Some (string2048_to_yojson x.destination_arn));
      ("SourceArn", Some (string2048_to_yojson x.source_arn));
    ]

let association_info_list_to_yojson tree = list_to_yojson association_info_to_yojson tree

let lineage_metadata_to_yojson (x : lineage_metadata) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson association_info_list_to_yojson x.associations);
      ("ContextArns", option_to_yojson map_string2048_to_yojson x.context_arns);
      ("ArtifactArns", option_to_yojson map_string2048_to_yojson x.artifact_arns);
      ("ActionArns", option_to_yojson map_string2048_to_yojson x.action_arns);
    ]

let job_step_metadata_to_yojson (x : job_step_metadata) =
  assoc_to_yojson [ ("Arn", option_to_yojson string1024_to_yojson x.arn) ]

let pipeline_execution_step_metadata_to_yojson (x : pipeline_execution_step_metadata) =
  assoc_to_yojson
    [
      ("Job", option_to_yojson job_step_metadata_to_yojson x.job);
      ("Lineage", option_to_yojson lineage_metadata_to_yojson x.lineage);
      ( "InferenceComponent",
        option_to_yojson inference_component_metadata_to_yojson x.inference_component );
      ( "BedrockModelImport",
        option_to_yojson bedrock_model_import_metadata_to_yojson x.bedrock_model_import );
      ( "BedrockProvisionedModelThroughput",
        option_to_yojson bedrock_provisioned_model_throughput_metadata_to_yojson
          x.bedrock_provisioned_model_throughput );
      ( "BedrockCustomModelDeployment",
        option_to_yojson bedrock_custom_model_deployment_metadata_to_yojson
          x.bedrock_custom_model_deployment );
      ( "BedrockCustomModel",
        option_to_yojson bedrock_custom_model_metadata_to_yojson x.bedrock_custom_model );
      ("EndpointConfig", option_to_yojson endpoint_config_step_metadata_to_yojson x.endpoint_config);
      ("Endpoint", option_to_yojson endpoint_step_metadata_to_yojson x.endpoint);
      ("AutoMLJob", option_to_yojson auto_ml_job_step_metadata_to_yojson x.auto_ml_job);
      ("Fail", option_to_yojson fail_step_metadata_to_yojson x.fail);
      ("ClarifyCheck", option_to_yojson clarify_check_step_metadata_to_yojson x.clarify_check);
      ("QualityCheck", option_to_yojson quality_check_step_metadata_to_yojson x.quality_check);
      ("EMR", option_to_yojson emr_step_metadata_to_yojson x.em_r);
      ("Lambda", option_to_yojson lambda_step_metadata_to_yojson x.lambda);
      ("Callback", option_to_yojson callback_step_metadata_to_yojson x.callback);
      ("Condition", option_to_yojson condition_step_metadata_to_yojson x.condition);
      ("RegisterModel", option_to_yojson register_model_step_metadata_to_yojson x.register_model);
      ("Model", option_to_yojson model_step_metadata_to_yojson x.model);
      ("TuningJob", option_to_yojson tuning_job_step_meta_data_to_yojson x.tuning_job);
      ("TransformJob", option_to_yojson transform_job_step_metadata_to_yojson x.transform_job);
      ("ProcessingJob", option_to_yojson processing_job_step_metadata_to_yojson x.processing_job);
      ("TrainingJob", option_to_yojson training_job_step_metadata_to_yojson x.training_job);
    ]

let pipeline_execution_step_to_yojson (x : pipeline_execution_step) =
  assoc_to_yojson
    [
      ( "SelectiveExecutionResult",
        option_to_yojson selective_execution_result_to_yojson x.selective_execution_result );
      ("AttemptCount", option_to_yojson integer_to_yojson x.attempt_count);
      ("Metadata", option_to_yojson pipeline_execution_step_metadata_to_yojson x.metadata);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CacheHitResult", option_to_yojson cache_hit_result_to_yojson x.cache_hit_result);
      ("StepStatus", option_to_yojson step_status_to_yojson x.step_status);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("StepDescription", option_to_yojson step_description_to_yojson x.step_description);
      ("StepDisplayName", option_to_yojson step_display_name_to_yojson x.step_display_name);
      ("StepName", option_to_yojson step_name_to_yojson x.step_name);
    ]

let pipeline_execution_step_list_to_yojson tree =
  list_to_yojson pipeline_execution_step_to_yojson tree

let list_pipeline_execution_steps_response_to_yojson (x : list_pipeline_execution_steps_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "PipelineExecutionSteps",
        option_to_yojson pipeline_execution_step_list_to_yojson x.pipeline_execution_steps );
    ]

let list_pipeline_execution_steps_request_to_yojson (x : list_pipeline_execution_steps_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let pipeline_execution_summary_to_yojson (x : pipeline_execution_summary) =
  assoc_to_yojson
    [
      ( "PipelineExecutionFailureReason",
        option_to_yojson string3072_to_yojson x.pipeline_execution_failure_reason );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ( "PipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson x.pipeline_execution_status );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
    ]

let pipeline_execution_summary_list_to_yojson tree =
  list_to_yojson pipeline_execution_summary_to_yojson tree

let list_pipeline_executions_response_to_yojson (x : list_pipeline_executions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "PipelineExecutionSummaries",
        option_to_yojson pipeline_execution_summary_list_to_yojson x.pipeline_execution_summaries );
    ]

let list_pipeline_executions_request_to_yojson (x : list_pipeline_executions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_pipeline_executions_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
    ]

let partner_app_name_to_yojson = string_to_yojson

let partner_app_type_to_yojson (x : partner_app_type) =
  match x with
  | FIDDLER -> `String "fiddler"
  | DEEPCHECKS_LLM_EVALUATION -> `String "deepchecks-llm-evaluation"
  | COMET -> `String "comet"
  | LAKERA_GUARD -> `String "lakera-guard"

let partner_app_status_to_yojson (x : partner_app_status) =
  match x with
  | DELETED -> `String "Deleted"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | FAILED -> `String "Failed"
  | AVAILABLE -> `String "Available"
  | DELETING -> `String "Deleting"
  | UPDATING -> `String "Updating"
  | CREATING -> `String "Creating"

let partner_app_summary_to_yojson (x : partner_app_summary) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson partner_app_status_to_yojson x.status);
      ("Type", option_to_yojson partner_app_type_to_yojson x.type_);
      ("Name", option_to_yojson partner_app_name_to_yojson x.name);
      ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn);
    ]

let partner_app_summaries_to_yojson tree = list_to_yojson partner_app_summary_to_yojson tree

let list_partner_apps_response_to_yojson (x : list_partner_apps_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Summaries", option_to_yojson partner_app_summaries_to_yojson x.summaries);
    ]

let list_partner_apps_request_to_yojson (x : list_partner_apps_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let optimization_job_arn_to_yojson = string_to_yojson

let optimization_job_status_to_yojson (x : optimization_job_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | STARTING -> `String "STARTING"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | INPROGRESS -> `String "INPROGRESS"

let optimization_job_deployment_instance_type_to_yojson
    (x : optimization_job_deployment_instance_type) =
  match x with
  | ML_TRN1N_32XLARGE -> `String "ml.trn1n.32xlarge"
  | ML_TRN1_32XLARGE -> `String "ml.trn1.32xlarge"
  | ML_TRN1_2XLARGE -> `String "ml.trn1.2xlarge"
  | ML_INF2_48XLARGE -> `String "ml.inf2.48xlarge"
  | ML_INF2_24XLARGE -> `String "ml.inf2.24xlarge"
  | ML_INF2_8XLARGE -> `String "ml.inf2.8xlarge"
  | ML_INF2_XLARGE -> `String "ml.inf2.xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"
  | ML_G4DN_16XLARGE -> `String "ml.g4dn.16xlarge"
  | ML_G4DN_12XLARGE -> `String "ml.g4dn.12xlarge"
  | ML_G4DN_8XLARGE -> `String "ml.g4dn.8xlarge"
  | ML_G4DN_4XLARGE -> `String "ml.g4dn.4xlarge"
  | ML_G4DN_2XLARGE -> `String "ml.g4dn.2xlarge"
  | ML_G4DN_XLARGE -> `String "ml.g4dn.xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"

let optimization_job_max_instance_count_to_yojson = int_to_yojson
let optimization_type_to_yojson = string_to_yojson
let optimization_types_to_yojson tree = list_to_yojson optimization_type_to_yojson tree

let optimization_job_summary_to_yojson (x : optimization_job_summary) =
  assoc_to_yojson
    [
      ("OptimizationTypes", Some (optimization_types_to_yojson x.optimization_types));
      ( "MaxInstanceCount",
        option_to_yojson optimization_job_max_instance_count_to_yojson x.max_instance_count );
      ( "DeploymentInstanceType",
        Some (optimization_job_deployment_instance_type_to_yojson x.deployment_instance_type) );
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("OptimizationEndTime", option_to_yojson timestamp_to_yojson x.optimization_end_time);
      ("OptimizationStartTime", option_to_yojson timestamp_to_yojson x.optimization_start_time);
      ("OptimizationJobStatus", Some (optimization_job_status_to_yojson x.optimization_job_status));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("OptimizationJobArn", Some (optimization_job_arn_to_yojson x.optimization_job_arn));
      ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name));
    ]

let optimization_job_summaries_to_yojson tree =
  list_to_yojson optimization_job_summary_to_yojson tree

let list_optimization_jobs_response_to_yojson (x : list_optimization_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "OptimizationJobSummaries",
        Some (optimization_job_summaries_to_yojson x.optimization_job_summaries) );
    ]

let list_optimization_jobs_sort_by_to_yojson (x : list_optimization_jobs_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let list_optimization_jobs_request_to_yojson (x : list_optimization_jobs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_optimization_jobs_sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson optimization_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("OptimizationContains", option_to_yojson name_contains_to_yojson x.optimization_contains);
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let notebook_instance_arn_to_yojson = string_to_yojson

let notebook_instance_status_to_yojson (x : notebook_instance_status) =
  match x with
  | Updating -> `String "Updating"
  | Deleting -> `String "Deleting"
  | Failed -> `String "Failed"
  | Stopped -> `String "Stopped"
  | Stopping -> `String "Stopping"
  | InService -> `String "InService"
  | Pending -> `String "Pending"

let notebook_instance_url_to_yojson = string_to_yojson

let notebook_instance_summary_to_yojson (x : notebook_instance_summary) =
  assoc_to_yojson
    [
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "NotebookInstanceLifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name );
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("Url", option_to_yojson notebook_instance_url_to_yojson x.url);
      ( "NotebookInstanceStatus",
        option_to_yojson notebook_instance_status_to_yojson x.notebook_instance_status );
      ("NotebookInstanceArn", Some (notebook_instance_arn_to_yojson x.notebook_instance_arn));
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
    ]

let notebook_instance_summary_list_to_yojson tree =
  list_to_yojson notebook_instance_summary_to_yojson tree

let list_notebook_instances_output_to_yojson (x : list_notebook_instances_output) =
  assoc_to_yojson
    [
      ( "NotebookInstances",
        option_to_yojson notebook_instance_summary_list_to_yojson x.notebook_instances );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let notebook_instance_sort_key_to_yojson (x : notebook_instance_sort_key) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let notebook_instance_sort_order_to_yojson (x : notebook_instance_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let notebook_instance_name_contains_to_yojson = string_to_yojson
let code_repository_contains_to_yojson = string_to_yojson

let list_notebook_instances_input_to_yojson (x : list_notebook_instances_input) =
  assoc_to_yojson
    [
      ( "AdditionalCodeRepositoryEquals",
        option_to_yojson code_repository_name_or_url_to_yojson x.additional_code_repository_equals
      );
      ( "DefaultCodeRepositoryContains",
        option_to_yojson code_repository_contains_to_yojson x.default_code_repository_contains );
      ( "NotebookInstanceLifecycleConfigNameContains",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name_contains );
      ("StatusEquals", option_to_yojson notebook_instance_status_to_yojson x.status_equals);
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson notebook_instance_name_contains_to_yojson x.name_contains);
      ("SortOrder", option_to_yojson notebook_instance_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson notebook_instance_sort_key_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let notebook_instance_lifecycle_config_arn_to_yojson = string_to_yojson

let notebook_instance_lifecycle_config_summary_to_yojson
    (x : notebook_instance_lifecycle_config_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ( "NotebookInstanceLifecycleConfigArn",
        Some
          (notebook_instance_lifecycle_config_arn_to_yojson x.notebook_instance_lifecycle_config_arn)
      );
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
    ]

let notebook_instance_lifecycle_config_summary_list_to_yojson tree =
  list_to_yojson notebook_instance_lifecycle_config_summary_to_yojson tree

let list_notebook_instance_lifecycle_configs_output_to_yojson
    (x : list_notebook_instance_lifecycle_configs_output) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigs",
        option_to_yojson notebook_instance_lifecycle_config_summary_list_to_yojson
          x.notebook_instance_lifecycle_configs );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let notebook_instance_lifecycle_config_sort_key_to_yojson
    (x : notebook_instance_lifecycle_config_sort_key) =
  match x with
  | LAST_MODIFIED_TIME -> `String "LastModifiedTime"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let notebook_instance_lifecycle_config_sort_order_to_yojson
    (x : notebook_instance_lifecycle_config_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let notebook_instance_lifecycle_config_name_contains_to_yojson = string_to_yojson

let list_notebook_instance_lifecycle_configs_input_to_yojson
    (x : list_notebook_instance_lifecycle_configs_input) =
  assoc_to_yojson
    [
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ( "NameContains",
        option_to_yojson notebook_instance_lifecycle_config_name_contains_to_yojson x.name_contains
      );
      ( "SortOrder",
        option_to_yojson notebook_instance_lifecycle_config_sort_order_to_yojson x.sort_order );
      ("SortBy", option_to_yojson notebook_instance_lifecycle_config_sort_key_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let monitoring_schedule_summary_to_yojson (x : monitoring_schedule_summary) =
  assoc_to_yojson
    [
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("MonitoringScheduleStatus", Some (schedule_status_to_yojson x.monitoring_schedule_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let monitoring_schedule_summary_list_to_yojson tree =
  list_to_yojson monitoring_schedule_summary_to_yojson tree

let list_monitoring_schedules_response_to_yojson (x : list_monitoring_schedules_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MonitoringScheduleSummaries",
        Some (monitoring_schedule_summary_list_to_yojson x.monitoring_schedule_summaries) );
    ]

let monitoring_schedule_sort_key_to_yojson (x : monitoring_schedule_sort_key) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let list_monitoring_schedules_request_to_yojson (x : list_monitoring_schedules_request) =
  assoc_to_yojson
    [
      ("MonitoringTypeEquals", option_to_yojson monitoring_type_to_yojson x.monitoring_type_equals);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("StatusEquals", option_to_yojson schedule_status_to_yojson x.status_equals);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson monitoring_schedule_sort_key_to_yojson x.sort_by);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
    ]

let monitoring_execution_summary_list_to_yojson tree =
  list_to_yojson monitoring_execution_summary_to_yojson tree

let list_monitoring_executions_response_to_yojson (x : list_monitoring_executions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MonitoringExecutionSummaries",
        Some (monitoring_execution_summary_list_to_yojson x.monitoring_execution_summaries) );
    ]

let monitoring_execution_sort_key_to_yojson (x : monitoring_execution_sort_key) =
  match x with
  | STATUS -> `String "Status"
  | SCHEDULED_TIME -> `String "ScheduledTime"
  | CREATION_TIME -> `String "CreationTime"

let list_monitoring_executions_request_to_yojson (x : list_monitoring_executions_request) =
  assoc_to_yojson
    [
      ("MonitoringTypeEquals", option_to_yojson monitoring_type_to_yojson x.monitoring_type_equals);
      ( "MonitoringJobDefinitionName",
        option_to_yojson monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name
      );
      ("StatusEquals", option_to_yojson execution_status_to_yojson x.status_equals);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("ScheduledTimeAfter", option_to_yojson timestamp_to_yojson x.scheduled_time_after);
      ("ScheduledTimeBefore", option_to_yojson timestamp_to_yojson x.scheduled_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson monitoring_execution_sort_key_to_yojson x.sort_by);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
    ]

let list_monitoring_alerts_response_to_yojson (x : list_monitoring_alerts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MonitoringAlertSummaries",
        option_to_yojson monitoring_alert_summary_list_to_yojson x.monitoring_alert_summaries );
    ]

let list_monitoring_alerts_request_to_yojson (x : list_monitoring_alerts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let monitoring_alert_history_summary_to_yojson (x : monitoring_alert_history_summary) =
  assoc_to_yojson
    [
      ("AlertStatus", Some (monitoring_alert_status_to_yojson x.alert_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("MonitoringAlertName", Some (monitoring_alert_name_to_yojson x.monitoring_alert_name));
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let monitoring_alert_history_list_to_yojson tree =
  list_to_yojson monitoring_alert_history_summary_to_yojson tree

let list_monitoring_alert_history_response_to_yojson (x : list_monitoring_alert_history_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "MonitoringAlertHistory",
        option_to_yojson monitoring_alert_history_list_to_yojson x.monitoring_alert_history );
    ]

let monitoring_alert_history_sort_key_to_yojson (x : monitoring_alert_history_sort_key) =
  match x with Status -> `String "Status" | CreationTime -> `String "CreationTime"

let list_monitoring_alert_history_request_to_yojson (x : list_monitoring_alert_history_request) =
  assoc_to_yojson
    [
      ("StatusEquals", option_to_yojson monitoring_alert_status_to_yojson x.status_equals);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson monitoring_alert_history_sort_key_to_yojson x.sort_by);
      ( "MonitoringAlertName",
        option_to_yojson monitoring_alert_name_to_yojson x.monitoring_alert_name );
      ( "MonitoringScheduleName",
        option_to_yojson monitoring_schedule_name_to_yojson x.monitoring_schedule_name );
    ]

let model_summary_to_yojson (x : model_summary) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ModelArn", Some (model_arn_to_yojson x.model_arn));
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let model_summary_list_to_yojson tree = list_to_yojson model_summary_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let list_models_output_to_yojson (x : list_models_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Models", Some (model_summary_list_to_yojson x.models));
    ]

let model_sort_key_to_yojson (x : model_sort_key) =
  match x with CreationTime -> `String "CreationTime" | Name -> `String "Name"

let order_key_to_yojson (x : order_key) =
  match x with Descending -> `String "Descending" | Ascending -> `String "Ascending"

let model_name_contains_to_yojson = string_to_yojson

let list_models_input_to_yojson (x : list_models_input) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson model_name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("SortBy", option_to_yojson model_sort_key_to_yojson x.sort_by);
    ]

let monitoring_job_definition_arn_to_yojson = string_to_yojson

let monitoring_job_definition_summary_to_yojson (x : monitoring_job_definition_summary) =
  assoc_to_yojson
    [
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "MonitoringJobDefinitionArn",
        Some (monitoring_job_definition_arn_to_yojson x.monitoring_job_definition_arn) );
      ( "MonitoringJobDefinitionName",
        Some (monitoring_job_definition_name_to_yojson x.monitoring_job_definition_name) );
    ]

let monitoring_job_definition_summary_list_to_yojson tree =
  list_to_yojson monitoring_job_definition_summary_to_yojson tree

let list_model_quality_job_definitions_response_to_yojson
    (x : list_model_quality_job_definitions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
    ]

let monitoring_job_definition_sort_key_to_yojson (x : monitoring_job_definition_sort_key) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let list_model_quality_job_definitions_request_to_yojson
    (x : list_model_quality_job_definitions_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
    ]

let model_package_summary_to_yojson (x : model_package_summary) =
  assoc_to_yojson
    [
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("ModelPackageStatus", Some (model_package_status_to_yojson x.model_package_status));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
      ("ModelPackageName", option_to_yojson entity_name_to_yojson x.model_package_name);
    ]

let model_package_summary_list_to_yojson tree = list_to_yojson model_package_summary_to_yojson tree

let list_model_packages_output_to_yojson (x : list_model_packages_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ModelPackageSummaryList",
        Some (model_package_summary_list_to_yojson x.model_package_summary_list) );
    ]

let model_package_type_to_yojson (x : model_package_type) =
  match x with
  | BOTH -> `String "Both"
  | UNVERSIONED -> `String "Unversioned"
  | VERSIONED -> `String "Versioned"

let model_package_sort_by_to_yojson (x : model_package_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let list_model_packages_input_to_yojson (x : list_model_packages_input) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson model_package_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ModelPackageType", option_to_yojson model_package_type_to_yojson x.model_package_type);
      ("ModelPackageGroupName", option_to_yojson arn_or_name_to_yojson x.model_package_group_name);
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
    ]

let managed_storage_type_to_yojson (x : managed_storage_type) =
  match x with RESTRICTED -> `String "Restricted"

let managed_configuration_to_yojson (x : managed_configuration) =
  assoc_to_yojson
    [
      ("ManagedStorageType", option_to_yojson managed_storage_type_to_yojson x.managed_storage_type);
    ]

let model_package_group_summary_to_yojson (x : model_package_group_summary) =
  assoc_to_yojson
    [
      ( "ManagedConfiguration",
        option_to_yojson managed_configuration_to_yojson x.managed_configuration );
      ( "ModelPackageGroupStatus",
        Some (model_package_group_status_to_yojson x.model_package_group_status) );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn));
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
    ]

let model_package_group_summary_list_to_yojson tree =
  list_to_yojson model_package_group_summary_to_yojson tree

let list_model_package_groups_output_to_yojson (x : list_model_package_groups_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ModelPackageGroupSummaryList",
        Some (model_package_group_summary_list_to_yojson x.model_package_group_summary_list) );
    ]

let model_package_group_sort_by_to_yojson (x : model_package_group_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let list_model_package_groups_input_to_yojson (x : list_model_package_groups_input) =
  assoc_to_yojson
    [
      ( "CrossAccountFilterOption",
        option_to_yojson cross_account_filter_option_to_yojson x.cross_account_filter_option );
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson model_package_group_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
    ]

let model_metadata_summary_to_yojson (x : model_metadata_summary) =
  assoc_to_yojson
    [
      ("FrameworkVersion", Some (string__to_yojson x.framework_version));
      ("Model", Some (string__to_yojson x.model));
      ("Task", Some (string__to_yojson x.task));
      ("Framework", Some (string__to_yojson x.framework));
      ("Domain", Some (string__to_yojson x.domain));
    ]

let model_metadata_summaries_to_yojson tree = list_to_yojson model_metadata_summary_to_yojson tree

let list_model_metadata_response_to_yojson (x : list_model_metadata_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ModelMetadataSummaries",
        Some (model_metadata_summaries_to_yojson x.model_metadata_summaries) );
    ]

let model_metadata_filter_type_to_yojson (x : model_metadata_filter_type) =
  match x with
  | FRAMEWORKVERSION -> `String "FrameworkVersion"
  | TASK -> `String "Task"
  | FRAMEWORK -> `String "Framework"
  | DOMAIN -> `String "Domain"

let model_metadata_filter_to_yojson (x : model_metadata_filter) =
  assoc_to_yojson
    [
      ("Value", Some (string256_to_yojson x.value));
      ("Name", Some (model_metadata_filter_type_to_yojson x.name));
    ]

let model_metadata_filters_to_yojson tree = list_to_yojson model_metadata_filter_to_yojson tree

let model_metadata_search_expression_to_yojson (x : model_metadata_search_expression) =
  assoc_to_yojson [ ("Filters", option_to_yojson model_metadata_filters_to_yojson x.filters) ]

let list_model_metadata_request_to_yojson (x : list_model_metadata_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "SearchExpression",
        option_to_yojson model_metadata_search_expression_to_yojson x.search_expression );
    ]

let list_model_explainability_job_definitions_response_to_yojson
    (x : list_model_explainability_job_definitions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
    ]

let list_model_explainability_job_definitions_request_to_yojson
    (x : list_model_explainability_job_definitions_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
    ]

let model_card_version_summary_to_yojson (x : model_card_version_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
    ]

let model_card_version_summary_list_to_yojson tree =
  list_to_yojson model_card_version_summary_to_yojson tree

let list_model_card_versions_response_to_yojson (x : list_model_card_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ModelCardVersionSummaryList",
        Some (model_card_version_summary_list_to_yojson x.model_card_version_summary_list) );
    ]

let model_card_version_sort_by_to_yojson (x : model_card_version_sort_by) =
  match x with VERSION -> `String "Version"

let model_card_sort_order_to_yojson (x : model_card_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let list_model_card_versions_request_to_yojson (x : list_model_card_versions_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson model_card_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson model_card_version_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let model_card_summary_to_yojson (x : model_card_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
    ]

let model_card_summary_list_to_yojson tree = list_to_yojson model_card_summary_to_yojson tree

let list_model_cards_response_to_yojson (x : list_model_cards_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ModelCardSummaries", Some (model_card_summary_list_to_yojson x.model_card_summaries));
    ]

let model_card_sort_by_to_yojson (x : model_card_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let list_model_cards_request_to_yojson (x : list_model_cards_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson model_card_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson model_card_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ModelCardStatus", option_to_yojson model_card_status_to_yojson x.model_card_status);
      ("NameContains", option_to_yojson entity_name_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let model_card_export_job_arn_to_yojson = string_to_yojson

let model_card_export_job_status_to_yojson (x : model_card_export_job_status) =
  match x with
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let model_card_export_job_summary_to_yojson (x : model_card_export_job_summary) =
  assoc_to_yojson
    [
      ("LastModifiedAt", Some (timestamp_to_yojson x.last_modified_at));
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("Status", Some (model_card_export_job_status_to_yojson x.status));
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
      ("ModelCardExportJobName", Some (entity_name_to_yojson x.model_card_export_job_name));
    ]

let model_card_export_job_summary_list_to_yojson tree =
  list_to_yojson model_card_export_job_summary_to_yojson tree

let list_model_card_export_jobs_response_to_yojson (x : list_model_card_export_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ModelCardExportJobSummaries",
        Some (model_card_export_job_summary_list_to_yojson x.model_card_export_job_summaries) );
    ]

let model_card_export_job_sort_by_to_yojson (x : model_card_export_job_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let model_card_export_job_sort_order_to_yojson (x : model_card_export_job_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let list_model_card_export_jobs_request_to_yojson (x : list_model_card_export_jobs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson model_card_export_job_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson model_card_export_job_sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson model_card_export_job_status_to_yojson x.status_equals);
      ( "ModelCardExportJobNameContains",
        option_to_yojson entity_name_to_yojson x.model_card_export_job_name_contains );
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
    ]

let list_model_bias_job_definitions_response_to_yojson
    (x : list_model_bias_job_definitions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
    ]

let list_model_bias_job_definitions_request_to_yojson (x : list_model_bias_job_definitions_request)
    =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
    ]

let list_mlflow_tracking_servers_response_to_yojson (x : list_mlflow_tracking_servers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "TrackingServerSummaries",
        option_to_yojson tracking_server_summary_list_to_yojson x.tracking_server_summaries );
    ]

let list_mlflow_tracking_servers_request_to_yojson (x : list_mlflow_tracking_servers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_tracking_server_by_to_yojson x.sort_by);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ( "TrackingServerStatus",
        option_to_yojson tracking_server_status_to_yojson x.tracking_server_status );
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
    ]

let mlflow_app_status_to_yojson (x : mlflow_app_status) =
  match x with
  | DELETED -> `String "Deleted"
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETING -> `String "Deleting"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATED -> `String "Updated"
  | UPDATING -> `String "Updating"
  | CREATE_FAILED -> `String "CreateFailed"
  | CREATED -> `String "Created"
  | CREATING -> `String "Creating"

let mlflow_app_summary_to_yojson (x : mlflow_app_summary) =
  assoc_to_yojson
    [
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson mlflow_app_status_to_yojson x.status);
      ("Name", option_to_yojson mlflow_app_name_to_yojson x.name);
      ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn);
    ]

let mlflow_app_summaries_to_yojson tree = list_to_yojson mlflow_app_summary_to_yojson tree

let list_mlflow_apps_response_to_yojson (x : list_mlflow_apps_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Summaries", option_to_yojson mlflow_app_summaries_to_yojson x.summaries);
    ]

let list_mlflow_apps_request_to_yojson (x : list_mlflow_apps_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_mlflow_app_by_to_yojson x.sort_by);
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
      ("DefaultForDomainId", option_to_yojson string__to_yojson x.default_for_domain_id);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("Status", option_to_yojson mlflow_app_status_to_yojson x.status);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
    ]

let lineage_group_summary_to_yojson (x : lineage_group_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("LineageGroupName", option_to_yojson experiment_entity_name_to_yojson x.lineage_group_name);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
    ]

let lineage_group_summaries_to_yojson tree = list_to_yojson lineage_group_summary_to_yojson tree

let list_lineage_groups_response_to_yojson (x : list_lineage_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "LineageGroupSummaries",
        option_to_yojson lineage_group_summaries_to_yojson x.lineage_group_summaries );
    ]

let list_lineage_groups_request_to_yojson (x : list_lineage_groups_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_lineage_groups_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
    ]

let job_reference_code_to_yojson = string_to_yojson
let label_counter_to_yojson = int_to_yojson

let label_counters_for_workteam_to_yojson (x : label_counters_for_workteam) =
  assoc_to_yojson
    [
      ("Total", option_to_yojson label_counter_to_yojson x.total);
      ("PendingHuman", option_to_yojson label_counter_to_yojson x.pending_human);
      ("HumanLabeled", option_to_yojson label_counter_to_yojson x.human_labeled);
    ]

let number_of_human_workers_per_data_object_to_yojson = int_to_yojson

let labeling_job_for_workteam_summary_to_yojson (x : labeling_job_for_workteam_summary) =
  assoc_to_yojson
    [
      ( "NumberOfHumanWorkersPerDataObject",
        option_to_yojson number_of_human_workers_per_data_object_to_yojson
          x.number_of_human_workers_per_data_object );
      ("LabelCounters", option_to_yojson label_counters_for_workteam_to_yojson x.label_counters);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("WorkRequesterAccountId", Some (account_id_to_yojson x.work_requester_account_id));
      ("JobReferenceCode", Some (job_reference_code_to_yojson x.job_reference_code));
      ("LabelingJobName", option_to_yojson labeling_job_name_to_yojson x.labeling_job_name);
    ]

let labeling_job_for_workteam_summary_list_to_yojson tree =
  list_to_yojson labeling_job_for_workteam_summary_to_yojson tree

let list_labeling_jobs_for_workteam_response_to_yojson
    (x : list_labeling_jobs_for_workteam_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "LabelingJobSummaryList",
        Some (labeling_job_for_workteam_summary_list_to_yojson x.labeling_job_summary_list) );
    ]

let job_reference_code_contains_to_yojson = string_to_yojson

let list_labeling_jobs_for_workteam_sort_by_options_to_yojson
    (x : list_labeling_jobs_for_workteam_sort_by_options) =
  match x with CREATION_TIME -> `String "CreationTime"

let list_labeling_jobs_for_workteam_request_to_yojson (x : list_labeling_jobs_for_workteam_request)
    =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ( "SortBy",
        option_to_yojson list_labeling_jobs_for_workteam_sort_by_options_to_yojson x.sort_by );
      ( "JobReferenceCodeContains",
        option_to_yojson job_reference_code_contains_to_yojson x.job_reference_code_contains );
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
    ]

let labeling_job_status_to_yojson (x : labeling_job_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | INITIALIZING -> `String "Initializing"

let label_counters_to_yojson (x : label_counters) =
  assoc_to_yojson
    [
      ("Unlabeled", option_to_yojson label_counter_to_yojson x.unlabeled);
      ( "FailedNonRetryableError",
        option_to_yojson label_counter_to_yojson x.failed_non_retryable_error );
      ("MachineLabeled", option_to_yojson label_counter_to_yojson x.machine_labeled);
      ("HumanLabeled", option_to_yojson label_counter_to_yojson x.human_labeled);
      ("TotalLabeled", option_to_yojson label_counter_to_yojson x.total_labeled);
    ]

let lambda_function_arn_to_yojson = string_to_yojson

let labeling_job_output_to_yojson (x : labeling_job_output) =
  assoc_to_yojson
    [
      ( "FinalActiveLearningModelArn",
        option_to_yojson model_arn_to_yojson x.final_active_learning_model_arn );
      ("OutputDatasetS3Uri", Some (s3_uri_to_yojson x.output_dataset_s3_uri));
    ]

let labeling_job_s3_data_source_to_yojson (x : labeling_job_s3_data_source) =
  assoc_to_yojson [ ("ManifestS3Uri", Some (s3_uri_to_yojson x.manifest_s3_uri)) ]

let labeling_job_sns_data_source_to_yojson (x : labeling_job_sns_data_source) =
  assoc_to_yojson [ ("SnsTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn)) ]

let labeling_job_data_source_to_yojson (x : labeling_job_data_source) =
  assoc_to_yojson
    [
      ("SnsDataSource", option_to_yojson labeling_job_sns_data_source_to_yojson x.sns_data_source);
      ("S3DataSource", option_to_yojson labeling_job_s3_data_source_to_yojson x.s3_data_source);
    ]

let content_classifier_to_yojson (x : content_classifier) =
  match x with
  | FREE_OF_ADULT_CONTENT -> `String "FreeOfAdultContent"
  | FREE_OF_PERSONALLY_IDENTIFIABLE_INFORMATION -> `String "FreeOfPersonallyIdentifiableInformation"

let content_classifiers_to_yojson tree = list_to_yojson content_classifier_to_yojson tree

let labeling_job_data_attributes_to_yojson (x : labeling_job_data_attributes) =
  assoc_to_yojson
    [ ("ContentClassifiers", option_to_yojson content_classifiers_to_yojson x.content_classifiers) ]

let labeling_job_input_config_to_yojson (x : labeling_job_input_config) =
  assoc_to_yojson
    [
      ("DataAttributes", option_to_yojson labeling_job_data_attributes_to_yojson x.data_attributes);
      ("DataSource", Some (labeling_job_data_source_to_yojson x.data_source));
    ]

let labeling_job_summary_to_yojson (x : labeling_job_summary) =
  assoc_to_yojson
    [
      ("InputConfig", option_to_yojson labeling_job_input_config_to_yojson x.input_config);
      ("LabelingJobOutput", option_to_yojson labeling_job_output_to_yojson x.labeling_job_output);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "AnnotationConsolidationLambdaArn",
        option_to_yojson lambda_function_arn_to_yojson x.annotation_consolidation_lambda_arn );
      ( "PreHumanTaskLambdaArn",
        option_to_yojson lambda_function_arn_to_yojson x.pre_human_task_lambda_arn );
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
      ("LabelCounters", Some (label_counters_to_yojson x.label_counters));
      ("LabelingJobStatus", Some (labeling_job_status_to_yojson x.labeling_job_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LabelingJobArn", Some (labeling_job_arn_to_yojson x.labeling_job_arn));
      ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name));
    ]

let labeling_job_summary_list_to_yojson tree = list_to_yojson labeling_job_summary_to_yojson tree

let list_labeling_jobs_response_to_yojson (x : list_labeling_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "LabelingJobSummaryList",
        option_to_yojson labeling_job_summary_list_to_yojson x.labeling_job_summary_list );
    ]

let list_labeling_jobs_request_to_yojson (x : list_labeling_jobs_request) =
  assoc_to_yojson
    [
      ("StatusEquals", option_to_yojson labeling_job_status_to_yojson x.status_equals);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let job_config_schema_version_summary_to_yojson (x : job_config_schema_version_summary) =
  assoc_to_yojson
    [ ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version)) ]

let job_config_schemas_to_yojson tree =
  list_to_yojson job_config_schema_version_summary_to_yojson tree

let list_job_schema_versions_response_to_yojson (x : list_job_schema_versions_response) =
  assoc_to_yojson
    [
      ("JobConfigSchemas", Some (job_config_schemas_to_yojson x.job_config_schemas));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_job_schema_versions_request_to_yojson (x : list_job_schema_versions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("JobCategory", Some (job_category_to_yojson x.job_category));
    ]

let job_summary_to_yojson (x : job_summary) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("JobSecondaryStatus", Some (job_secondary_status_to_yojson x.job_secondary_status));
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobName", Some (job_name_to_yojson x.job_name));
      ("JobArn", Some (job_arn_to_yojson x.job_arn));
    ]

let job_summaries_to_yojson tree = list_to_yojson job_summary_to_yojson tree

let list_jobs_response_to_yojson (x : list_jobs_response) =
  assoc_to_yojson
    [
      ("JobSummaries", Some (job_summaries_to_yojson x.job_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_jobs_request_to_yojson (x : list_jobs_request) =
  assoc_to_yojson
    [
      ("StatusEquals", option_to_yojson job_status_to_yojson x.status_equals);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("JobCategory", Some (job_category_to_yojson x.job_category));
    ]

let recommendation_step_type_to_yojson (x : recommendation_step_type) =
  match x with BENCHMARK -> `String "BENCHMARK"

let recommendation_job_status_to_yojson (x : recommendation_job_status) =
  match x with
  | DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | PENDING -> `String "PENDING"

let model_setup_time_to_yojson = int_to_yojson

let recommendation_metrics_to_yojson (x : recommendation_metrics) =
  assoc_to_yojson
    [
      ("ModelSetupTime", option_to_yojson model_setup_time_to_yojson x.model_setup_time);
      ("MemoryUtilization", option_to_yojson utilization_metric_to_yojson x.memory_utilization);
      ("CpuUtilization", option_to_yojson utilization_metric_to_yojson x.cpu_utilization);
      ("ModelLatency", option_to_yojson integer_to_yojson x.model_latency);
      ("MaxInvocations", option_to_yojson integer_to_yojson x.max_invocations);
      ("CostPerInference", option_to_yojson float__to_yojson x.cost_per_inference);
      ("CostPerHour", option_to_yojson float__to_yojson x.cost_per_hour);
    ]

let inference_metrics_to_yojson (x : inference_metrics) =
  assoc_to_yojson
    [
      ("ModelLatency", Some (integer_to_yojson x.model_latency));
      ("MaxInvocations", Some (integer_to_yojson x.max_invocations));
    ]

let initial_instance_count_to_yojson = int_to_yojson

let endpoint_output_configuration_to_yojson (x : endpoint_output_configuration) =
  assoc_to_yojson
    [
      ( "ServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.serverless_config );
      ( "InitialInstanceCount",
        option_to_yojson initial_instance_count_to_yojson x.initial_instance_count );
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ("VariantName", Some (string__to_yojson x.variant_name));
      ("EndpointName", Some (string__to_yojson x.endpoint_name));
    ]

let environment_parameter_to_yojson (x : environment_parameter) =
  assoc_to_yojson
    [
      ("Value", Some (string__to_yojson x.value));
      ("ValueType", Some (string__to_yojson x.value_type));
      ("Key", Some (string__to_yojson x.key));
    ]

let environment_parameters_to_yojson tree = list_to_yojson environment_parameter_to_yojson tree
let recommendation_job_compilation_job_name_to_yojson = string_to_yojson

let model_configuration_to_yojson (x : model_configuration) =
  assoc_to_yojson
    [
      ( "CompilationJobName",
        option_to_yojson recommendation_job_compilation_job_name_to_yojson x.compilation_job_name );
      ( "EnvironmentParameters",
        option_to_yojson environment_parameters_to_yojson x.environment_parameters );
      ( "InferenceSpecificationName",
        option_to_yojson inference_specification_name_to_yojson x.inference_specification_name );
    ]

let recommendation_failure_reason_to_yojson = string_to_yojson
let invocation_end_time_to_yojson = timestamp_epoch_seconds_to_yojson
let invocation_start_time_to_yojson = timestamp_epoch_seconds_to_yojson

let recommendation_job_inference_benchmark_to_yojson (x : recommendation_job_inference_benchmark) =
  assoc_to_yojson
    [
      ( "InvocationStartTime",
        option_to_yojson invocation_start_time_to_yojson x.invocation_start_time );
      ("InvocationEndTime", option_to_yojson invocation_end_time_to_yojson x.invocation_end_time);
      ("FailureReason", option_to_yojson recommendation_failure_reason_to_yojson x.failure_reason);
      ("ModelConfiguration", Some (model_configuration_to_yojson x.model_configuration));
      ( "EndpointConfiguration",
        option_to_yojson endpoint_output_configuration_to_yojson x.endpoint_configuration );
      ("EndpointMetrics", option_to_yojson inference_metrics_to_yojson x.endpoint_metrics);
      ("Metrics", option_to_yojson recommendation_metrics_to_yojson x.metrics);
    ]

let inference_recommendations_job_step_to_yojson (x : inference_recommendations_job_step) =
  assoc_to_yojson
    [
      ( "InferenceBenchmark",
        option_to_yojson recommendation_job_inference_benchmark_to_yojson x.inference_benchmark );
      ("Status", Some (recommendation_job_status_to_yojson x.status));
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
      ("StepType", Some (recommendation_step_type_to_yojson x.step_type));
    ]

let inference_recommendations_job_steps_to_yojson tree =
  list_to_yojson inference_recommendations_job_step_to_yojson tree

let list_inference_recommendations_job_steps_response_to_yojson
    (x : list_inference_recommendations_job_steps_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Steps", option_to_yojson inference_recommendations_job_steps_to_yojson x.steps);
    ]

let list_inference_recommendations_job_steps_request_to_yojson
    (x : list_inference_recommendations_job_steps_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("StepType", option_to_yojson recommendation_step_type_to_yojson x.step_type);
      ("Status", option_to_yojson recommendation_job_status_to_yojson x.status);
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
    ]

let recommendation_job_description_to_yojson = string_to_yojson

let recommendation_job_type_to_yojson (x : recommendation_job_type) =
  match x with ADVANCED -> `String "Advanced" | DEFAULT -> `String "Default"

let recommendation_job_arn_to_yojson = string_to_yojson

let inference_recommendations_job_to_yojson (x : inference_recommendations_job) =
  assoc_to_yojson
    [
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
      ("SamplePayloadUrl", option_to_yojson s3_uri_to_yojson x.sample_payload_url);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("Status", Some (recommendation_job_status_to_yojson x.status));
      ("JobArn", Some (recommendation_job_arn_to_yojson x.job_arn));
      ("JobType", Some (recommendation_job_type_to_yojson x.job_type));
      ("JobDescription", Some (recommendation_job_description_to_yojson x.job_description));
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
    ]

let inference_recommendations_jobs_to_yojson tree =
  list_to_yojson inference_recommendations_job_to_yojson tree

let list_inference_recommendations_jobs_response_to_yojson
    (x : list_inference_recommendations_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "InferenceRecommendationsJobs",
        Some (inference_recommendations_jobs_to_yojson x.inference_recommendations_jobs) );
    ]

let list_inference_recommendations_jobs_sort_by_to_yojson
    (x : list_inference_recommendations_jobs_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let list_inference_recommendations_jobs_request_to_yojson
    (x : list_inference_recommendations_jobs_request) =
  assoc_to_yojson
    [
      ( "ModelPackageVersionArnEquals",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn_equals );
      ("ModelNameEquals", option_to_yojson model_name_to_yojson x.model_name_equals);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_inference_recommendations_jobs_sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson recommendation_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
    ]

let inference_experiment_type_to_yojson (x : inference_experiment_type) =
  match x with SHADOW_MODE -> `String "ShadowMode"

let inference_experiment_status_to_yojson (x : inference_experiment_status) =
  match x with
  | CANCELLED -> `String "Cancelled"
  | COMPLETED -> `String "Completed"
  | STOPPING -> `String "Stopping"
  | STARTING -> `String "Starting"
  | RUNNING -> `String "Running"
  | UPDATING -> `String "Updating"
  | CREATED -> `String "Created"
  | CREATING -> `String "Creating"

let inference_experiment_summary_to_yojson (x : inference_experiment_summary) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("StatusReason", option_to_yojson inference_experiment_status_reason_to_yojson x.status_reason);
      ("Status", Some (inference_experiment_status_to_yojson x.status));
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Type", Some (inference_experiment_type_to_yojson x.type_));
      ("Name", Some (inference_experiment_name_to_yojson x.name));
    ]

let inference_experiment_list_to_yojson tree =
  list_to_yojson inference_experiment_summary_to_yojson tree

let list_inference_experiments_response_to_yojson (x : list_inference_experiments_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "InferenceExperiments",
        option_to_yojson inference_experiment_list_to_yojson x.inference_experiments );
    ]

let list_inference_experiments_request_to_yojson (x : list_inference_experiments_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_inference_experiments_by_to_yojson x.sort_by);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("StatusEquals", option_to_yojson inference_experiment_status_to_yojson x.status_equals);
      ("Type", option_to_yojson inference_experiment_type_to_yojson x.type_);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
    ]

let inference_component_status_to_yojson (x : inference_component_status) =
  match x with
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | UPDATING -> `String "Updating"
  | CREATING -> `String "Creating"
  | IN_SERVICE -> `String "InService"

let inference_component_summary_to_yojson (x : inference_component_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ( "InferenceComponentStatus",
        option_to_yojson inference_component_status_to_yojson x.inference_component_status );
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let inference_component_summary_list_to_yojson tree =
  list_to_yojson inference_component_summary_to_yojson tree

let list_inference_components_output_to_yojson (x : list_inference_components_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "InferenceComponents",
        Some (inference_component_summary_list_to_yojson x.inference_components) );
    ]

let inference_component_sort_key_to_yojson (x : inference_component_sort_key) =
  match x with
  | Status -> `String "Status"
  | CreationTime -> `String "CreationTime"
  | Name -> `String "Name"

let inference_component_name_contains_to_yojson = string_to_yojson

let list_inference_components_input_to_yojson (x : list_inference_components_input) =
  assoc_to_yojson
    [
      ("VariantNameEquals", option_to_yojson variant_name_to_yojson x.variant_name_equals);
      ("EndpointNameEquals", option_to_yojson endpoint_name_to_yojson x.endpoint_name_equals);
      ("StatusEquals", option_to_yojson inference_component_status_to_yojson x.status_equals);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson inference_component_name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("SortBy", option_to_yojson inference_component_sort_key_to_yojson x.sort_by);
    ]

let image_version_status_to_yojson (x : image_version_status) =
  match x with
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETING -> `String "DELETING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let image_version_to_yojson (x : image_version) =
  assoc_to_yojson
    [
      ("Version", Some (image_version_number_to_yojson x.version));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("ImageVersionStatus", Some (image_version_status_to_yojson x.image_version_status));
      ("ImageVersionArn", Some (image_version_arn_to_yojson x.image_version_arn));
      ("ImageArn", Some (image_arn_to_yojson x.image_arn));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let image_versions_to_yojson tree = list_to_yojson image_version_to_yojson tree

let list_image_versions_response_to_yojson (x : list_image_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ImageVersions", option_to_yojson image_versions_to_yojson x.image_versions);
    ]

let image_version_sort_by_to_yojson (x : image_version_sort_by) =
  match x with
  | VERSION -> `String "VERSION"
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"
  | CREATION_TIME -> `String "CREATION_TIME"

let image_version_sort_order_to_yojson (x : image_version_sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let list_image_versions_request_to_yojson (x : list_image_versions_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson image_version_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson image_version_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let image_status_to_yojson (x : image_status) =
  match x with
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETING -> `String "DELETING"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("ImageStatus", Some (image_status_to_yojson x.image_status));
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("ImageArn", Some (image_arn_to_yojson x.image_arn));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson image_description_to_yojson x.description);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
    ]

let images_to_yojson tree = list_to_yojson image_to_yojson tree

let list_images_response_to_yojson (x : list_images_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Images", option_to_yojson images_to_yojson x.images);
    ]

let image_name_contains_to_yojson = string_to_yojson

let image_sort_by_to_yojson (x : image_sort_by) =
  match x with
  | IMAGE_NAME -> `String "IMAGE_NAME"
  | LAST_MODIFIED_TIME -> `String "LAST_MODIFIED_TIME"
  | CREATION_TIME -> `String "CREATION_TIME"

let image_sort_order_to_yojson (x : image_sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let list_images_request_to_yojson (x : list_images_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson image_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson image_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson image_name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let hyper_parameter_tuning_job_summary_to_yojson (x : hyper_parameter_tuning_job_summary) =
  assoc_to_yojson
    [
      ("ResourceLimits", option_to_yojson resource_limits_to_yojson x.resource_limits);
      ( "ObjectiveStatusCounters",
        Some (objective_status_counters_to_yojson x.objective_status_counters) );
      ( "TrainingJobStatusCounters",
        Some (training_job_status_counters_to_yojson x.training_job_status_counters) );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "HyperParameterTuningEndTime",
        option_to_yojson timestamp_to_yojson x.hyper_parameter_tuning_end_time );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Strategy", Some (hyper_parameter_tuning_job_strategy_type_to_yojson x.strategy));
      ( "HyperParameterTuningJobStatus",
        Some (hyper_parameter_tuning_job_status_to_yojson x.hyper_parameter_tuning_job_status) );
      ( "HyperParameterTuningJobArn",
        Some (hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn) );
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let hyper_parameter_tuning_job_summaries_to_yojson tree =
  list_to_yojson hyper_parameter_tuning_job_summary_to_yojson tree

let list_hyper_parameter_tuning_jobs_response_to_yojson
    (x : list_hyper_parameter_tuning_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "HyperParameterTuningJobSummaries",
        Some (hyper_parameter_tuning_job_summaries_to_yojson x.hyper_parameter_tuning_job_summaries)
      );
    ]

let hyper_parameter_tuning_job_sort_by_options_to_yojson
    (x : hyper_parameter_tuning_job_sort_by_options) =
  match x with
  | CreationTime -> `String "CreationTime"
  | Status -> `String "Status"
  | Name -> `String "Name"

let list_hyper_parameter_tuning_jobs_request_to_yojson
    (x : list_hyper_parameter_tuning_jobs_request) =
  assoc_to_yojson
    [
      ("StatusEquals", option_to_yojson hyper_parameter_tuning_job_status_to_yojson x.status_equals);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson hyper_parameter_tuning_job_sort_by_options_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let human_task_ui_name_to_yojson = string_to_yojson

let human_task_ui_summary_to_yojson (x : human_task_ui_summary) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn));
      ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name));
    ]

let human_task_ui_summaries_to_yojson tree = list_to_yojson human_task_ui_summary_to_yojson tree

let list_human_task_uis_response_to_yojson (x : list_human_task_uis_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("HumanTaskUiSummaries", Some (human_task_ui_summaries_to_yojson x.human_task_ui_summaries));
    ]

let list_human_task_uis_request_to_yojson (x : list_human_task_uis_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let hub_name_to_yojson = string_to_yojson

let hub_status_to_yojson (x : hub_status) =
  match x with
  | DELETE_FAILED -> `String "DeleteFailed"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | CREATE_FAILED -> `String "CreateFailed"
  | DELETING -> `String "Deleting"
  | UPDATING -> `String "Updating"
  | CREATING -> `String "Creating"
  | IN_SERVICE -> `String "InService"

let hub_info_to_yojson (x : hub_info) =
  assoc_to_yojson
    [
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("HubStatus", Some (hub_status_to_yojson x.hub_status));
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
      ("HubDescription", option_to_yojson hub_description_to_yojson x.hub_description);
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubName", Some (hub_name_to_yojson x.hub_name));
    ]

let hub_info_list_to_yojson tree = list_to_yojson hub_info_to_yojson tree

let list_hubs_response_to_yojson (x : list_hubs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("HubSummaries", Some (hub_info_list_to_yojson x.hub_summaries));
    ]

let hub_sort_by_to_yojson (x : hub_sort_by) =
  match x with
  | ACCOUNT_ID_OWNER -> `String "AccountIdOwner"
  | HUB_STATUS -> `String "HubStatus"
  | CREATION_TIME -> `String "CreationTime"
  | HUB_NAME -> `String "HubName"

let list_hubs_request_to_yojson (x : list_hubs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson hub_sort_by_to_yojson x.sort_by);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
    ]

let document_schema_version_to_yojson = string_to_yojson

let hub_content_status_to_yojson (x : hub_content_status) =
  match x with
  | PENDING_DELETE -> `String "PendingDelete"
  | PENDING_IMPORT -> `String "PendingImport"
  | DELETE_FAILED -> `String "DeleteFailed"
  | IMPORT_FAILED -> `String "ImportFailed"
  | DELETING -> `String "Deleting"
  | IMPORTING -> `String "Importing"
  | AVAILABLE -> `String "Available"

let hub_content_info_to_yojson (x : hub_content_info) =
  assoc_to_yojson
    [
      ("OriginalCreationTime", option_to_yojson timestamp_to_yojson x.original_creation_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("HubContentStatus", Some (hub_content_status_to_yojson x.hub_content_status));
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ("DocumentSchemaVersion", Some (document_schema_version_to_yojson x.document_schema_version));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
      ( "SageMakerPublicHubContentArn",
        option_to_yojson sage_maker_public_hub_content_arn_to_yojson
          x.sage_maker_public_hub_content_arn );
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
    ]

let hub_content_info_list_to_yojson tree = list_to_yojson hub_content_info_to_yojson tree

let list_hub_content_versions_response_to_yojson (x : list_hub_content_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("HubContentSummaries", Some (hub_content_info_list_to_yojson x.hub_content_summaries));
    ]

let hub_content_sort_by_to_yojson (x : hub_content_sort_by) =
  match x with
  | HUB_CONTENT_STATUS -> `String "HubContentStatus"
  | CREATION_TIME -> `String "CreationTime"
  | HUB_CONTENT_NAME -> `String "HubContentName"

let list_hub_content_versions_request_to_yojson (x : list_hub_content_versions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson hub_content_sort_by_to_yojson x.sort_by);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("MaxSchemaVersion", option_to_yojson document_schema_version_to_yojson x.max_schema_version);
      ("MinVersion", option_to_yojson hub_content_version_to_yojson x.min_version);
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let list_hub_contents_response_to_yojson (x : list_hub_contents_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("HubContentSummaries", Some (hub_content_info_list_to_yojson x.hub_content_summaries));
    ]

let list_hub_contents_request_to_yojson (x : list_hub_contents_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson hub_content_sort_by_to_yojson x.sort_by);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("MaxSchemaVersion", option_to_yojson document_schema_version_to_yojson x.max_schema_version);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let flow_definition_name_to_yojson = string_to_yojson
let flow_definition_arn_to_yojson = string_to_yojson

let flow_definition_status_to_yojson (x : flow_definition_status) =
  match x with
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | ACTIVE -> `String "Active"
  | INITIALIZING -> `String "Initializing"

let flow_definition_summary_to_yojson (x : flow_definition_summary) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FlowDefinitionStatus", Some (flow_definition_status_to_yojson x.flow_definition_status));
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
      ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name));
    ]

let flow_definition_summaries_to_yojson tree = list_to_yojson flow_definition_summary_to_yojson tree

let list_flow_definitions_response_to_yojson (x : list_flow_definitions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "FlowDefinitionSummaries",
        Some (flow_definition_summaries_to_yojson x.flow_definition_summaries) );
    ]

let list_flow_definitions_request_to_yojson (x : list_flow_definitions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let feature_group_summary_to_yojson (x : feature_group_summary) =
  assoc_to_yojson
    [
      ("OfflineStoreStatus", option_to_yojson offline_store_status_to_yojson x.offline_store_status);
      ("FeatureGroupStatus", option_to_yojson feature_group_status_to_yojson x.feature_group_status);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn));
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
    ]

let feature_group_summaries_to_yojson tree = list_to_yojson feature_group_summary_to_yojson tree

let list_feature_groups_response_to_yojson (x : list_feature_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FeatureGroupSummaries", Some (feature_group_summaries_to_yojson x.feature_group_summaries));
    ]

let feature_group_name_contains_to_yojson = string_to_yojson

let feature_group_sort_order_to_yojson (x : feature_group_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let feature_group_sort_by_to_yojson (x : feature_group_sort_by) =
  match x with
  | CREATION_TIME -> `String "CreationTime"
  | OFFLINE_STORE_STATUS -> `String "OfflineStoreStatus"
  | FEATURE_GROUP_STATUS -> `String "FeatureGroupStatus"
  | NAME -> `String "Name"

let feature_group_max_results_to_yojson = int_to_yojson

let list_feature_groups_request_to_yojson (x : list_feature_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson feature_group_max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson feature_group_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson feature_group_sort_order_to_yojson x.sort_order);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ( "OfflineStoreStatusEquals",
        option_to_yojson offline_store_status_value_to_yojson x.offline_store_status_equals );
      ( "FeatureGroupStatusEquals",
        option_to_yojson feature_group_status_to_yojson x.feature_group_status_equals );
      ("NameContains", option_to_yojson feature_group_name_contains_to_yojson x.name_contains);
    ]

let experiment_summary_to_yojson (x : experiment_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ExperimentSource", option_to_yojson experiment_source_to_yojson x.experiment_source);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn);
    ]

let experiment_summaries_to_yojson tree = list_to_yojson experiment_summary_to_yojson tree

let list_experiments_response_to_yojson (x : list_experiments_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ExperimentSummaries", option_to_yojson experiment_summaries_to_yojson x.experiment_summaries);
    ]

let list_experiments_request_to_yojson (x : list_experiments_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_experiments_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
    ]

let endpoint_summary_to_yojson (x : endpoint_summary) =
  assoc_to_yojson
    [
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let endpoint_summary_list_to_yojson tree = list_to_yojson endpoint_summary_to_yojson tree

let list_endpoints_output_to_yojson (x : list_endpoints_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Endpoints", Some (endpoint_summary_list_to_yojson x.endpoints));
    ]

let endpoint_sort_key_to_yojson (x : endpoint_sort_key) =
  match x with
  | Status -> `String "Status"
  | CreationTime -> `String "CreationTime"
  | Name -> `String "Name"

let endpoint_name_contains_to_yojson = string_to_yojson

let list_endpoints_input_to_yojson (x : list_endpoints_input) =
  assoc_to_yojson
    [
      ("StatusEquals", option_to_yojson endpoint_status_to_yojson x.status_equals);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson endpoint_name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("SortBy", option_to_yojson endpoint_sort_key_to_yojson x.sort_by);
    ]

let endpoint_config_summary_to_yojson (x : endpoint_config_summary) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("EndpointConfigArn", Some (endpoint_config_arn_to_yojson x.endpoint_config_arn));
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
    ]

let endpoint_config_summary_list_to_yojson tree =
  list_to_yojson endpoint_config_summary_to_yojson tree

let list_endpoint_configs_output_to_yojson (x : list_endpoint_configs_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("EndpointConfigs", Some (endpoint_config_summary_list_to_yojson x.endpoint_configs));
    ]

let endpoint_config_sort_key_to_yojson (x : endpoint_config_sort_key) =
  match x with CreationTime -> `String "CreationTime" | Name -> `String "Name"

let endpoint_config_name_contains_to_yojson = string_to_yojson

let list_endpoint_configs_input_to_yojson (x : list_endpoint_configs_input) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson endpoint_config_name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson order_key_to_yojson x.sort_order);
      ("SortBy", option_to_yojson endpoint_config_sort_key_to_yojson x.sort_by);
    ]

let edge_packaging_job_arn_to_yojson = string_to_yojson

let edge_packaging_job_status_to_yojson (x : edge_packaging_job_status) =
  match x with
  | Stopped -> `String "STOPPED"
  | Stopping -> `String "STOPPING"
  | Failed -> `String "FAILED"
  | Completed -> `String "COMPLETED"
  | InProgress -> `String "INPROGRESS"
  | Starting -> `String "STARTING"

let edge_version_to_yojson = string_to_yojson

let edge_packaging_job_summary_to_yojson (x : edge_packaging_job_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ModelVersion", option_to_yojson edge_version_to_yojson x.model_version);
      ("ModelName", option_to_yojson entity_name_to_yojson x.model_name);
      ("CompilationJobName", option_to_yojson entity_name_to_yojson x.compilation_job_name);
      ( "EdgePackagingJobStatus",
        Some (edge_packaging_job_status_to_yojson x.edge_packaging_job_status) );
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
      ("EdgePackagingJobArn", Some (edge_packaging_job_arn_to_yojson x.edge_packaging_job_arn));
    ]

let edge_packaging_job_summaries_to_yojson tree =
  list_to_yojson edge_packaging_job_summary_to_yojson tree

let list_edge_packaging_jobs_response_to_yojson (x : list_edge_packaging_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "EdgePackagingJobSummaries",
        Some (edge_packaging_job_summaries_to_yojson x.edge_packaging_job_summaries) );
    ]

let list_edge_packaging_jobs_sort_by_to_yojson (x : list_edge_packaging_jobs_sort_by) =
  match x with
  | EdgePackagingJobStatus -> `String "STATUS"
  | LastModifiedTime -> `String "LAST_MODIFIED_TIME"
  | CreationTime -> `String "CREATION_TIME"
  | ModelName -> `String "MODEL_NAME"
  | Name -> `String "NAME"

let list_edge_packaging_jobs_request_to_yojson (x : list_edge_packaging_jobs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_edge_packaging_jobs_sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson edge_packaging_job_status_to_yojson x.status_equals);
      ("ModelNameContains", option_to_yojson name_contains_to_yojson x.model_name_contains);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let edge_deployment_plan_summary_to_yojson (x : edge_deployment_plan_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("EdgeDeploymentFailed", Some (integer_to_yojson x.edge_deployment_failed));
      ("EdgeDeploymentPending", Some (integer_to_yojson x.edge_deployment_pending));
      ("EdgeDeploymentSuccess", Some (integer_to_yojson x.edge_deployment_success));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
    ]

let edge_deployment_plan_summaries_to_yojson tree =
  list_to_yojson edge_deployment_plan_summary_to_yojson tree

let list_edge_deployment_plans_response_to_yojson (x : list_edge_deployment_plans_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "EdgeDeploymentPlanSummaries",
        Some (edge_deployment_plan_summaries_to_yojson x.edge_deployment_plan_summaries) );
    ]

let list_edge_deployment_plans_sort_by_to_yojson (x : list_edge_deployment_plans_sort_by) =
  match x with
  | LastModifiedTime -> `String "LAST_MODIFIED_TIME"
  | CreationTime -> `String "CREATION_TIME"
  | DeviceFleetName -> `String "DEVICE_FLEET_NAME"
  | Name -> `String "NAME"

let list_edge_deployment_plans_request_to_yojson (x : list_edge_deployment_plans_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_edge_deployment_plans_sort_by_to_yojson x.sort_by);
      ( "DeviceFleetNameContains",
        option_to_yojson name_contains_to_yojson x.device_fleet_name_contains );
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let domain_name_to_yojson = string_to_yojson

let domain_status_to_yojson (x : domain_status) =
  match x with
  | Delete_Failed -> `String "Delete_Failed"
  | Update_Failed -> `String "Update_Failed"
  | Updating -> `String "Updating"
  | Pending -> `String "Pending"
  | InService -> `String "InService"
  | Failed -> `String "Failed"
  | Deleting -> `String "Deleting"

let domain_details_to_yojson (x : domain_details) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson string1024_to_yojson x.url);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("Status", option_to_yojson domain_status_to_yojson x.status);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn);
    ]

let domain_list_to_yojson tree = list_to_yojson domain_details_to_yojson tree

let list_domains_response_to_yojson (x : list_domains_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Domains", option_to_yojson domain_list_to_yojson x.domains);
    ]

let list_domains_request_to_yojson (x : list_domains_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let edge_model_summary_to_yojson (x : edge_model_summary) =
  assoc_to_yojson
    [
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
      ("ModelName", Some (entity_name_to_yojson x.model_name));
    ]

let edge_model_summaries_to_yojson tree = list_to_yojson edge_model_summary_to_yojson tree

let device_summary_to_yojson (x : device_summary) =
  assoc_to_yojson
    [
      ("AgentVersion", option_to_yojson edge_version_to_yojson x.agent_version);
      ("Models", option_to_yojson edge_model_summaries_to_yojson x.models);
      ("LatestHeartbeat", option_to_yojson timestamp_to_yojson x.latest_heartbeat);
      ("RegistrationTime", option_to_yojson timestamp_to_yojson x.registration_time);
      ("IotThingName", option_to_yojson thing_name_to_yojson x.iot_thing_name);
      ("DeviceFleetName", option_to_yojson entity_name_to_yojson x.device_fleet_name);
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ("DeviceArn", Some (device_arn_to_yojson x.device_arn));
      ("DeviceName", Some (entity_name_to_yojson x.device_name));
    ]

let device_summaries_to_yojson tree = list_to_yojson device_summary_to_yojson tree

let list_devices_response_to_yojson (x : list_devices_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DeviceSummaries", Some (device_summaries_to_yojson x.device_summaries));
    ]

let list_devices_request_to_yojson (x : list_devices_request) =
  assoc_to_yojson
    [
      ("DeviceFleetName", option_to_yojson entity_name_to_yojson x.device_fleet_name);
      ("ModelName", option_to_yojson entity_name_to_yojson x.model_name);
      ("LatestHeartbeatAfter", option_to_yojson timestamp_to_yojson x.latest_heartbeat_after);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let device_fleet_arn_to_yojson = string_to_yojson

let device_fleet_summary_to_yojson (x : device_fleet_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("DeviceFleetArn", Some (device_fleet_arn_to_yojson x.device_fleet_arn));
    ]

let device_fleet_summaries_to_yojson tree = list_to_yojson device_fleet_summary_to_yojson tree

let list_device_fleets_response_to_yojson (x : list_device_fleets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DeviceFleetSummaries", Some (device_fleet_summaries_to_yojson x.device_fleet_summaries));
    ]

let list_device_fleets_sort_by_to_yojson (x : list_device_fleets_sort_by) =
  match x with
  | LastModifiedTime -> `String "LAST_MODIFIED_TIME"
  | CreationTime -> `String "CREATION_TIME"
  | Name -> `String "NAME"

let list_device_fleets_request_to_yojson (x : list_device_fleets_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_device_fleets_sort_by_to_yojson x.sort_by);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("MaxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_data_quality_job_definitions_response_to_yojson
    (x : list_data_quality_job_definitions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "JobDefinitionSummaries",
        Some (monitoring_job_definition_summary_list_to_yojson x.job_definition_summaries) );
    ]

let list_data_quality_job_definitions_request_to_yojson
    (x : list_data_quality_job_definitions_request) =
  assoc_to_yojson
    [
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson monitoring_job_definition_sort_key_to_yojson x.sort_by);
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
    ]

let context_source_to_yojson (x : context_source) =
  assoc_to_yojson
    [
      ("SourceId", option_to_yojson string256_to_yojson x.source_id);
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("SourceUri", Some (source_uri_to_yojson x.source_uri));
    ]

let context_summary_to_yojson (x : context_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ContextType", option_to_yojson string256_to_yojson x.context_type);
      ("Source", option_to_yojson context_source_to_yojson x.source);
      ("ContextName", option_to_yojson context_name_to_yojson x.context_name);
      ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn);
    ]

let context_summaries_to_yojson tree = list_to_yojson context_summary_to_yojson tree

let list_contexts_response_to_yojson (x : list_contexts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ContextSummaries", option_to_yojson context_summaries_to_yojson x.context_summaries);
    ]

let list_contexts_request_to_yojson (x : list_contexts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_contexts_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("ContextType", option_to_yojson string256_to_yojson x.context_type);
      ("SourceUri", option_to_yojson source_uri_to_yojson x.source_uri);
    ]

let compute_quota_summary_to_yojson (x : compute_quota_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("ComputeQuotaTarget", Some (compute_quota_target_to_yojson x.compute_quota_target));
      ("ComputeQuotaConfig", option_to_yojson compute_quota_config_to_yojson x.compute_quota_config);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("ComputeQuotaVersion", option_to_yojson integer_to_yojson x.compute_quota_version);
      ("Name", Some (entity_name_to_yojson x.name));
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
    ]

let compute_quota_summary_list_to_yojson tree = list_to_yojson compute_quota_summary_to_yojson tree

let list_compute_quotas_response_to_yojson (x : list_compute_quotas_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ComputeQuotaSummaries",
        option_to_yojson compute_quota_summary_list_to_yojson x.compute_quota_summaries );
    ]

let list_compute_quotas_request_to_yojson (x : list_compute_quotas_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_quota_by_to_yojson x.sort_by);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("Status", option_to_yojson scheduler_resource_status_to_yojson x.status);
      ("NameContains", option_to_yojson entity_name_to_yojson x.name_contains);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
    ]

let compilation_job_arn_to_yojson = string_to_yojson

let compilation_job_status_to_yojson (x : compilation_job_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | STARTING -> `String "STARTING"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | INPROGRESS -> `String "INPROGRESS"

let compilation_job_summary_to_yojson (x : compilation_job_summary) =
  assoc_to_yojson
    [
      ("CompilationJobStatus", Some (compilation_job_status_to_yojson x.compilation_job_status));
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ( "CompilationTargetPlatformAccelerator",
        option_to_yojson target_platform_accelerator_to_yojson
          x.compilation_target_platform_accelerator );
      ( "CompilationTargetPlatformArch",
        option_to_yojson target_platform_arch_to_yojson x.compilation_target_platform_arch );
      ( "CompilationTargetPlatformOs",
        option_to_yojson target_platform_os_to_yojson x.compilation_target_platform_os );
      ( "CompilationTargetDevice",
        option_to_yojson target_device_to_yojson x.compilation_target_device );
      ("CompilationEndTime", option_to_yojson timestamp_to_yojson x.compilation_end_time);
      ("CompilationStartTime", option_to_yojson timestamp_to_yojson x.compilation_start_time);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("CompilationJobArn", Some (compilation_job_arn_to_yojson x.compilation_job_arn));
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
    ]

let compilation_job_summaries_to_yojson tree = list_to_yojson compilation_job_summary_to_yojson tree

let list_compilation_jobs_response_to_yojson (x : list_compilation_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "CompilationJobSummaries",
        Some (compilation_job_summaries_to_yojson x.compilation_job_summaries) );
    ]

let list_compilation_jobs_sort_by_to_yojson (x : list_compilation_jobs_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let list_compilation_jobs_request_to_yojson (x : list_compilation_jobs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_compilation_jobs_sort_by_to_yojson x.sort_by);
      ("StatusEquals", option_to_yojson compilation_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ( "LastModifiedTimeBefore",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_before );
      ( "LastModifiedTimeAfter",
        option_to_yojson last_modified_time_to_yojson x.last_modified_time_after );
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let git_config_url_to_yojson = string_to_yojson
let branch_to_yojson = string_to_yojson

let git_config_to_yojson (x : git_config) =
  assoc_to_yojson
    [
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("Branch", option_to_yojson branch_to_yojson x.branch);
      ("RepositoryUrl", Some (git_config_url_to_yojson x.repository_url));
    ]

let code_repository_summary_to_yojson (x : code_repository_summary) =
  assoc_to_yojson
    [
      ("GitConfig", option_to_yojson git_config_to_yojson x.git_config);
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn));
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
    ]

let code_repository_summary_list_to_yojson tree =
  list_to_yojson code_repository_summary_to_yojson tree

let list_code_repositories_output_to_yojson (x : list_code_repositories_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "CodeRepositorySummaryList",
        Some (code_repository_summary_list_to_yojson x.code_repository_summary_list) );
    ]

let code_repository_name_contains_to_yojson = string_to_yojson

let code_repository_sort_by_to_yojson (x : code_repository_sort_by) =
  match x with
  | LAST_MODIFIED_TIME -> `String "LastModifiedTime"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let code_repository_sort_order_to_yojson (x : code_repository_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let list_code_repositories_input_to_yojson (x : list_code_repositories_input) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson code_repository_sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson code_repository_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson code_repository_name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
    ]

let cluster_scheduler_config_summary_to_yojson (x : cluster_scheduler_config_summary) =
  assoc_to_yojson
    [
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Name", Some (entity_name_to_yojson x.name));
      ( "ClusterSchedulerConfigVersion",
        option_to_yojson integer_to_yojson x.cluster_scheduler_config_version );
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
    ]

let cluster_scheduler_config_summary_list_to_yojson tree =
  list_to_yojson cluster_scheduler_config_summary_to_yojson tree

let list_cluster_scheduler_configs_response_to_yojson (x : list_cluster_scheduler_configs_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ClusterSchedulerConfigSummaries",
        option_to_yojson cluster_scheduler_config_summary_list_to_yojson
          x.cluster_scheduler_config_summaries );
    ]

let list_cluster_scheduler_configs_request_to_yojson (x : list_cluster_scheduler_configs_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_cluster_scheduler_config_by_to_yojson x.sort_by);
      ("Status", option_to_yojson scheduler_resource_status_to_yojson x.status);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("NameContains", option_to_yojson entity_name_to_yojson x.name_contains);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
    ]

let cluster_name_to_yojson = string_to_yojson

let cluster_status_to_yojson (x : cluster_status) =
  match x with
  | UPDATING -> `String "Updating"
  | SYSTEMUPDATING -> `String "SystemUpdating"
  | ROLLINGBACK -> `String "RollingBack"
  | INSERVICE -> `String "InService"
  | FAILED -> `String "Failed"
  | DELETING -> `String "Deleting"
  | CREATING -> `String "Creating"

let cluster_image_version_status_to_yojson (x : cluster_image_version_status) =
  match x with
  | END_OF_LIFE -> `String "EndOfLife"
  | SECURITY_UPDATE_REQUIRED -> `String "SecurityUpdateRequired"
  | UPDATE_AVAILABLE -> `String "UpdateAvailable"
  | UP_TO_DATE -> `String "UpToDate"

let cluster_summary_to_yojson (x : cluster_summary) =
  assoc_to_yojson
    [
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
      ("TrainingPlanArns", option_to_yojson training_plan_arns_to_yojson x.training_plan_arns);
      ("ClusterStatus", Some (cluster_status_to_yojson x.cluster_status));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
    ]

let cluster_summaries_to_yojson tree = list_to_yojson cluster_summary_to_yojson tree

let list_clusters_response_to_yojson (x : list_clusters_response) =
  assoc_to_yojson
    [
      ("ClusterSummaries", Some (cluster_summaries_to_yojson x.cluster_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let cluster_sort_by_to_yojson (x : cluster_sort_by) =
  match x with NAME -> `String "NAME" | CREATION_TIME -> `String "CREATION_TIME"

let list_clusters_request_to_yojson (x : list_clusters_request) =
  assoc_to_yojson
    [
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson cluster_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let cluster_instance_status_to_yojson (x : cluster_instance_status) =
  match x with
  | NOT_FOUND -> `String "NotFound"
  | DEEP_HEALTH_CHECK_IN_PROGRESS -> `String "DeepHealthCheckInProgress"
  | SYSTEM_UPDATING -> `String "SystemUpdating"
  | SHUTTING_DOWN -> `String "ShuttingDown"
  | PENDING -> `String "Pending"
  | FAILURE -> `String "Failure"
  | RUNNING -> `String "Running"

let cluster_instance_status_details_to_yojson (x : cluster_instance_status_details) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("Status", Some (cluster_instance_status_to_yojson x.status));
    ]

let cluster_private_dns_hostname_to_yojson = string_to_yojson

let cluster_node_summary_to_yojson (x : cluster_node_summary) =
  assoc_to_yojson
    [
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
      ( "CurrentImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.current_image_release_version );
      ( "PrivateDnsHostname",
        option_to_yojson cluster_private_dns_hostname_to_yojson x.private_dns_hostname );
      ("UltraServerInfo", option_to_yojson ultra_server_info_to_yojson x.ultra_server_info);
      ("InstanceStatus", Some (cluster_instance_status_details_to_yojson x.instance_status));
      ("LastSoftwareUpdateTime", option_to_yojson timestamp_to_yojson x.last_software_update_time);
      ("LaunchTime", Some (timestamp_to_yojson x.launch_time));
      ("InstanceType", Some (cluster_instance_type_to_yojson x.instance_type));
      ( "NodeLogicalId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.node_logical_id
      );
      ("InstanceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id));
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
    ]

let cluster_node_summaries_to_yojson tree = list_to_yojson cluster_node_summary_to_yojson tree

let list_cluster_nodes_response_to_yojson (x : list_cluster_nodes_response) =
  assoc_to_yojson
    [
      ("ClusterNodeSummaries", Some (cluster_node_summaries_to_yojson x.cluster_node_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let include_node_logical_ids_boolean_to_yojson = bool_to_yojson

let list_cluster_nodes_request_to_yojson (x : list_cluster_nodes_request) =
  assoc_to_yojson
    [
      ( "IncludeNodeLogicalIds",
        option_to_yojson include_node_logical_ids_boolean_to_yojson x.include_node_logical_ids );
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson cluster_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "InstanceGroupNameContains",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name_contains );
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let event_id_to_yojson = string_to_yojson

let cluster_event_resource_type_to_yojson (x : cluster_event_resource_type) =
  match x with
  | INSTANCE -> `String "Instance"
  | INSTANCE_GROUP -> `String "InstanceGroup"
  | CLUSTER -> `String "Cluster"

let cluster_event_level_to_yojson (x : cluster_event_level) =
  match x with ERROR -> `String "Error" | WARN -> `String "Warn" | INFO -> `String "Info"

let cluster_event_summary_to_yojson (x : cluster_event_summary) =
  assoc_to_yojson
    [
      ("EventLevel", option_to_yojson cluster_event_level_to_yojson x.event_level);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("EventTime", Some (timestamp_to_yojson x.event_time));
      ("ResourceType", Some (cluster_event_resource_type_to_yojson x.resource_type));
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("EventId", Some (event_id_to_yojson x.event_id));
    ]

let cluster_event_summaries_to_yojson tree = list_to_yojson cluster_event_summary_to_yojson tree

let list_cluster_events_response_to_yojson (x : list_cluster_events_response) =
  assoc_to_yojson
    [
      ("Events", option_to_yojson cluster_event_summaries_to_yojson x.events);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let event_sort_by_to_yojson (x : event_sort_by) = match x with EVENT_TIME -> `String "EventTime"
let cluster_event_max_results_to_yojson = int_to_yojson

let list_cluster_events_request_to_yojson (x : list_cluster_events_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson cluster_event_max_results_to_yojson x.max_results);
      ("ResourceType", option_to_yojson cluster_event_resource_type_to_yojson x.resource_type);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson event_sort_by_to_yojson x.sort_by);
      ("EventTimeBefore", option_to_yojson timestamp_to_yojson x.event_time_before);
      ("EventTimeAfter", option_to_yojson timestamp_to_yojson x.event_time_after);
      ("NodeId", option_to_yojson cluster_node_id_to_yojson x.node_id);
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let candidate_name_to_yojson = string_to_yojson

let auto_ml_job_objective_type_to_yojson (x : auto_ml_job_objective_type) =
  match x with MINIMIZE -> `String "Minimize" | MAXIMIZE -> `String "Maximize"

let auto_ml_metric_enum_to_yojson (x : auto_ml_metric_enum) =
  match x with
  | AVERAGE_WEIGHTED_QUANTILE_LOSS -> `String "AverageWeightedQuantileLoss"
  | WAPE -> `String "WAPE"
  | MASE -> `String "MASE"
  | MAPE -> `String "MAPE"
  | MAE -> `String "MAE"
  | PRECISION_MACRO -> `String "PrecisionMacro"
  | PRECISION -> `String "Precision"
  | RECALL_MACRO -> `String "RecallMacro"
  | RECALL -> `String "Recall"
  | R2 -> `String "R2"
  | BALANCED_ACCURACY -> `String "BalancedAccuracy"
  | RMSE -> `String "RMSE"
  | AUC -> `String "AUC"
  | F1_MACRO -> `String "F1macro"
  | F1 -> `String "F1"
  | MSE -> `String "MSE"
  | ACCURACY -> `String "Accuracy"

let final_auto_ml_job_objective_metric_to_yojson (x : final_auto_ml_job_objective_metric) =
  assoc_to_yojson
    [
      ("StandardMetricName", option_to_yojson auto_ml_metric_enum_to_yojson x.standard_metric_name);
      ("Value", Some (metric_value_to_yojson x.value));
      ("MetricName", Some (auto_ml_metric_enum_to_yojson x.metric_name));
      ("Type", option_to_yojson auto_ml_job_objective_type_to_yojson x.type_);
    ]

let candidate_step_type_to_yojson (x : candidate_step_type) =
  match x with
  | PROCESSING -> `String "AWS::SageMaker::ProcessingJob"
  | TRANSFORM -> `String "AWS::SageMaker::TransformJob"
  | TRAINING -> `String "AWS::SageMaker::TrainingJob"

let candidate_step_arn_to_yojson = string_to_yojson
let candidate_step_name_to_yojson = string_to_yojson

let auto_ml_candidate_step_to_yojson (x : auto_ml_candidate_step) =
  assoc_to_yojson
    [
      ("CandidateStepName", Some (candidate_step_name_to_yojson x.candidate_step_name));
      ("CandidateStepArn", Some (candidate_step_arn_to_yojson x.candidate_step_arn));
      ("CandidateStepType", Some (candidate_step_type_to_yojson x.candidate_step_type));
    ]

let candidate_steps_to_yojson tree = list_to_yojson auto_ml_candidate_step_to_yojson tree

let candidate_status_to_yojson (x : candidate_status) =
  match x with
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | FAILED -> `String "Failed"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"

let auto_ml_container_definition_to_yojson (x : auto_ml_container_definition) =
  assoc_to_yojson
    [
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ("ModelDataUrl", Some (url_to_yojson x.model_data_url));
      ("Image", Some (container_image_to_yojson x.image));
    ]

let auto_ml_container_definitions_to_yojson tree =
  list_to_yojson auto_ml_container_definition_to_yojson tree

let auto_ml_failure_reason_to_yojson = string_to_yojson
let explainability_location_to_yojson = string_to_yojson
let model_insights_location_to_yojson = string_to_yojson
let backtest_results_location_to_yojson = string_to_yojson

let candidate_artifact_locations_to_yojson (x : candidate_artifact_locations) =
  assoc_to_yojson
    [
      ("BacktestResults", option_to_yojson backtest_results_location_to_yojson x.backtest_results);
      ("ModelInsights", option_to_yojson model_insights_location_to_yojson x.model_insights);
      ("Explainability", Some (explainability_location_to_yojson x.explainability));
    ]

let auto_ml_metric_extended_enum_to_yojson (x : auto_ml_metric_extended_enum) =
  match x with
  | TRAINING_LOSS -> `String "TrainingLoss"
  | VALIDATION_LOSS -> `String "ValidationLoss"
  | PERPLEXITY -> `String "Perplexity"
  | ROUGEL_SUM -> `String "RougeLSum"
  | ROUGEL -> `String "RougeL"
  | ROUGE2 -> `String "Rouge2"
  | ROUGE1 -> `String "Rouge1"
  | AVERAGE_WEIGHTED_QUANTILE_LOSS -> `String "AverageWeightedQuantileLoss"
  | WAPE -> `String "WAPE"
  | MASE -> `String "MASE"
  | MAPE -> `String "MAPE"
  | INFERENCE_LATENCY -> `String "InferenceLatency"
  | LogLoss -> `String "LogLoss"
  | RECALL_MACRO -> `String "RecallMacro"
  | RECALL -> `String "Recall"
  | PRECISION_MACRO -> `String "PrecisionMacro"
  | PRECISION -> `String "Precision"
  | BALANCED_ACCURACY -> `String "BalancedAccuracy"
  | R2 -> `String "R2"
  | MAE -> `String "MAE"
  | RMSE -> `String "RMSE"
  | AUC -> `String "AUC"
  | F1_MACRO -> `String "F1macro"
  | F1 -> `String "F1"
  | MSE -> `String "MSE"
  | ACCURACY -> `String "Accuracy"

let metric_set_source_to_yojson (x : metric_set_source) =
  match x with
  | TEST -> `String "Test"
  | VALIDATION -> `String "Validation"
  | TRAIN -> `String "Train"

let metric_datum_to_yojson (x : metric_datum) =
  assoc_to_yojson
    [
      ("Set", option_to_yojson metric_set_source_to_yojson x.set);
      ("Value", option_to_yojson float__to_yojson x.value);
      ( "StandardMetricName",
        option_to_yojson auto_ml_metric_extended_enum_to_yojson x.standard_metric_name );
      ("MetricName", option_to_yojson auto_ml_metric_enum_to_yojson x.metric_name);
    ]

let metric_data_list_to_yojson tree = list_to_yojson metric_datum_to_yojson tree

let candidate_properties_to_yojson (x : candidate_properties) =
  assoc_to_yojson
    [
      ("CandidateMetrics", option_to_yojson metric_data_list_to_yojson x.candidate_metrics);
      ( "CandidateArtifactLocations",
        option_to_yojson candidate_artifact_locations_to_yojson x.candidate_artifact_locations );
    ]

let auto_ml_processing_unit_to_yojson (x : auto_ml_processing_unit) =
  match x with GPU -> `String "GPU" | CPU -> `String "CPU"

let auto_ml_inference_container_definitions_to_yojson tree =
  map_to_yojson auto_ml_processing_unit_to_yojson auto_ml_container_definitions_to_yojson tree

let auto_ml_candidate_to_yojson (x : auto_ml_candidate) =
  assoc_to_yojson
    [
      ( "InferenceContainerDefinitions",
        option_to_yojson auto_ml_inference_container_definitions_to_yojson
          x.inference_container_definitions );
      ("CandidateProperties", option_to_yojson candidate_properties_to_yojson x.candidate_properties);
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "InferenceContainers",
        option_to_yojson auto_ml_container_definitions_to_yojson x.inference_containers );
      ("CandidateStatus", Some (candidate_status_to_yojson x.candidate_status));
      ("CandidateSteps", Some (candidate_steps_to_yojson x.candidate_steps));
      ("ObjectiveStatus", Some (objective_status_to_yojson x.objective_status));
      ( "FinalAutoMLJobObjectiveMetric",
        option_to_yojson final_auto_ml_job_objective_metric_to_yojson
          x.final_auto_ml_job_objective_metric );
      ("CandidateName", Some (candidate_name_to_yojson x.candidate_name));
    ]

let auto_ml_candidates_to_yojson tree = list_to_yojson auto_ml_candidate_to_yojson tree

let list_candidates_for_auto_ml_job_response_to_yojson
    (x : list_candidates_for_auto_ml_job_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Candidates", Some (auto_ml_candidates_to_yojson x.candidates));
    ]

let auto_ml_sort_order_to_yojson (x : auto_ml_sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let candidate_sort_by_to_yojson (x : candidate_sort_by) =
  match x with
  | FinalObjectiveMetricValue -> `String "FinalObjectiveMetricValue"
  | Status -> `String "Status"
  | CreationTime -> `String "CreationTime"

let auto_ml_max_results_for_trials_to_yojson = int_to_yojson

let list_candidates_for_auto_ml_job_request_to_yojson (x : list_candidates_for_auto_ml_job_request)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson auto_ml_max_results_for_trials_to_yojson x.max_results);
      ("SortBy", option_to_yojson candidate_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson auto_ml_sort_order_to_yojson x.sort_order);
      ("CandidateNameEquals", option_to_yojson candidate_name_to_yojson x.candidate_name_equals);
      ("StatusEquals", option_to_yojson candidate_status_to_yojson x.status_equals);
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
    ]

let auto_ml_job_status_to_yojson (x : auto_ml_job_status) =
  match x with
  | STOPPING -> `String "Stopping"
  | STOPPED -> `String "Stopped"
  | FAILED -> `String "Failed"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETED -> `String "Completed"

let auto_ml_job_secondary_status_to_yojson (x : auto_ml_job_secondary_status) =
  match x with
  | PRE_TRAINING -> `String "PreTraining"
  | TRAINING_MODELS -> `String "TrainingModels"
  | GENERATING_EXPLAINABILITY_REPORT -> `String "GeneratingExplainabilityReport"
  | MODEL_TUNING -> `String "ModelTuning"
  | FEATURE_ENGINEERING -> `String "FeatureEngineering"
  | ANALYZING_DATA -> `String "AnalyzingData"
  | MODEL_INSIGHTS_ERROR -> `String "ModelInsightsError"
  | GENERATING_MODEL_INSIGHTS_REPORT -> `String "GeneratingModelInsightsReport"
  | MODEL_DEPLOYMENT_ERROR -> `String "ModelDeploymentError"
  | DEPLOYING_MODEL -> `String "DeployingModel"
  | EXPLAINABILITY_ERROR -> `String "ExplainabilityError"
  | COMPLETED -> `String "Completed"
  | CANDIDATE_DEFINITIONS_GENERATED -> `String "CandidateDefinitionsGenerated"
  | STOPPING -> `String "Stopping"
  | MAX_AUTO_ML_JOB_RUNTIME_REACHED -> `String "MaxAutoMLJobRuntimeReached"
  | STOPPED -> `String "Stopped"
  | FAILED -> `String "Failed"
  | MAX_CANDIDATES_REACHED -> `String "MaxCandidatesReached"
  | STARTING -> `String "Starting"

let auto_ml_partial_failure_reason_to_yojson (x : auto_ml_partial_failure_reason) =
  assoc_to_yojson
    [
      ( "PartialFailureMessage",
        option_to_yojson auto_ml_failure_reason_to_yojson x.partial_failure_message );
    ]

let auto_ml_partial_failure_reasons_to_yojson tree =
  list_to_yojson auto_ml_partial_failure_reason_to_yojson tree

let auto_ml_job_summary_to_yojson (x : auto_ml_job_summary) =
  assoc_to_yojson
    [
      ( "PartialFailureReasons",
        option_to_yojson auto_ml_partial_failure_reasons_to_yojson x.partial_failure_reasons );
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "AutoMLJobSecondaryStatus",
        Some (auto_ml_job_secondary_status_to_yojson x.auto_ml_job_secondary_status) );
      ("AutoMLJobStatus", Some (auto_ml_job_status_to_yojson x.auto_ml_job_status));
      ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn));
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
    ]

let auto_ml_job_summaries_to_yojson tree = list_to_yojson auto_ml_job_summary_to_yojson tree

let list_auto_ml_jobs_response_to_yojson (x : list_auto_ml_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AutoMLJobSummaries", Some (auto_ml_job_summaries_to_yojson x.auto_ml_job_summaries));
    ]

let auto_ml_name_contains_to_yojson = string_to_yojson

let auto_ml_sort_by_to_yojson (x : auto_ml_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let auto_ml_max_results_to_yojson = int_to_yojson

let list_auto_ml_jobs_request_to_yojson (x : list_auto_ml_jobs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson auto_ml_max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson auto_ml_sort_by_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson auto_ml_sort_order_to_yojson x.sort_order);
      ("StatusEquals", option_to_yojson auto_ml_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson auto_ml_name_contains_to_yojson x.name_contains);
      ("LastModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.last_modified_time_before);
      ("LastModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.last_modified_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
    ]

let association_summary_to_yojson (x : association_summary) =
  assoc_to_yojson
    [
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("DestinationName", option_to_yojson experiment_entity_name_to_yojson x.destination_name);
      ("SourceName", option_to_yojson experiment_entity_name_to_yojson x.source_name);
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
      ("DestinationType", option_to_yojson string256_to_yojson x.destination_type);
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
    ]

let association_summaries_to_yojson tree = list_to_yojson association_summary_to_yojson tree

let list_associations_response_to_yojson (x : list_associations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "AssociationSummaries",
        option_to_yojson association_summaries_to_yojson x.association_summaries );
    ]

let list_associations_request_to_yojson (x : list_associations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_associations_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
      ("DestinationType", option_to_yojson string256_to_yojson x.destination_type);
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
    ]

let artifact_source_id_type_to_yojson (x : artifact_source_id_type) =
  match x with
  | CUSTOM -> `String "Custom"
  | S3_VERSION -> `String "S3Version"
  | S3_ETAG -> `String "S3ETag"
  | MD5_HASH -> `String "MD5Hash"

let artifact_source_type_to_yojson (x : artifact_source_type) =
  assoc_to_yojson
    [
      ("Value", Some (string256_to_yojson x.value));
      ("SourceIdType", Some (artifact_source_id_type_to_yojson x.source_id_type));
    ]

let artifact_source_types_to_yojson tree = list_to_yojson artifact_source_type_to_yojson tree

let artifact_source_to_yojson (x : artifact_source) =
  assoc_to_yojson
    [
      ("SourceTypes", option_to_yojson artifact_source_types_to_yojson x.source_types);
      ("SourceUri", Some (source_uri_to_yojson x.source_uri));
    ]

let artifact_summary_to_yojson (x : artifact_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ArtifactType", option_to_yojson string256_to_yojson x.artifact_type);
      ("Source", option_to_yojson artifact_source_to_yojson x.source);
      ("ArtifactName", option_to_yojson experiment_entity_name_to_yojson x.artifact_name);
      ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn);
    ]

let artifact_summaries_to_yojson tree = list_to_yojson artifact_summary_to_yojson tree

let list_artifacts_response_to_yojson (x : list_artifacts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ArtifactSummaries", option_to_yojson artifact_summaries_to_yojson x.artifact_summaries);
    ]

let list_artifacts_request_to_yojson (x : list_artifacts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_artifacts_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("ArtifactType", option_to_yojson string256_to_yojson x.artifact_type);
      ("SourceUri", option_to_yojson source_uri_to_yojson x.source_uri);
    ]

let app_name_to_yojson = string_to_yojson

let app_status_to_yojson (x : app_status) =
  match x with
  | Pending -> `String "Pending"
  | InService -> `String "InService"
  | Failed -> `String "Failed"
  | Deleting -> `String "Deleting"
  | Deleted -> `String "Deleted"

let app_details_to_yojson (x : app_details) =
  assoc_to_yojson
    [
      ("ResourceSpec", option_to_yojson resource_spec_to_yojson x.resource_spec);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("Status", option_to_yojson app_status_to_yojson x.status);
      ("AppName", option_to_yojson app_name_to_yojson x.app_name);
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let app_list_to_yojson tree = list_to_yojson app_details_to_yojson tree

let list_apps_response_to_yojson (x : list_apps_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Apps", option_to_yojson app_list_to_yojson x.apps);
    ]

let app_sort_key_to_yojson (x : app_sort_key) =
  match x with CreationTime -> `String "CreationTime"

let list_apps_request_to_yojson (x : list_apps_request) =
  assoc_to_yojson
    [
      ("SpaceNameEquals", option_to_yojson space_name_to_yojson x.space_name_equals);
      ( "UserProfileNameEquals",
        option_to_yojson user_profile_name_to_yojson x.user_profile_name_equals );
      ("DomainIdEquals", option_to_yojson domain_id_to_yojson x.domain_id_equals);
      ("SortBy", option_to_yojson app_sort_key_to_yojson x.sort_by);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let app_image_config_details_to_yojson (x : app_image_config_details) =
  assoc_to_yojson
    [
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "AppImageConfigName",
        option_to_yojson app_image_config_name_to_yojson x.app_image_config_name );
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
    ]

let app_image_config_list_to_yojson tree = list_to_yojson app_image_config_details_to_yojson tree

let list_app_image_configs_response_to_yojson (x : list_app_image_configs_response) =
  assoc_to_yojson
    [
      ("AppImageConfigs", option_to_yojson app_image_config_list_to_yojson x.app_image_configs);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let app_image_config_sort_key_to_yojson (x : app_image_config_sort_key) =
  match x with
  | Name -> `String "Name"
  | LastModifiedTime -> `String "LastModifiedTime"
  | CreationTime -> `String "CreationTime"

let list_app_image_configs_request_to_yojson (x : list_app_image_configs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson app_image_config_sort_key_to_yojson x.sort_by);
      ("ModifiedTimeAfter", option_to_yojson timestamp_to_yojson x.modified_time_after);
      ("ModifiedTimeBefore", option_to_yojson timestamp_to_yojson x.modified_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("NameContains", option_to_yojson app_image_config_name_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_aliases_response_to_yojson (x : list_aliases_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "SageMakerImageVersionAliases",
        option_to_yojson sage_maker_image_version_aliases_to_yojson
          x.sage_maker_image_version_aliases );
    ]

let list_aliases_request_to_yojson (x : list_aliases_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
      ("ImageName", Some (image_name_to_yojson x.image_name));
    ]

let algorithm_arn_to_yojson = string_to_yojson

let algorithm_status_to_yojson (x : algorithm_status) =
  match x with
  | DELETING -> `String "Deleting"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"

let algorithm_summary_to_yojson (x : algorithm_summary) =
  assoc_to_yojson
    [
      ("AlgorithmStatus", Some (algorithm_status_to_yojson x.algorithm_status));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("AlgorithmDescription", option_to_yojson entity_description_to_yojson x.algorithm_description);
      ("AlgorithmArn", Some (algorithm_arn_to_yojson x.algorithm_arn));
      ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name));
    ]

let algorithm_summary_list_to_yojson tree = list_to_yojson algorithm_summary_to_yojson tree

let list_algorithms_output_to_yojson (x : list_algorithms_output) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AlgorithmSummaryList", Some (algorithm_summary_list_to_yojson x.algorithm_summary_list));
    ]

let algorithm_sort_by_to_yojson (x : algorithm_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let list_algorithms_input_to_yojson (x : list_algorithms_input) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson algorithm_sort_by_to_yojson x.sort_by);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("CreationTimeBefore", option_to_yojson creation_time_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson creation_time_to_yojson x.creation_time_after);
    ]

let ai_workload_config_arn_to_yojson = string_to_yojson

let ai_workload_config_summary_to_yojson (x : ai_workload_config_summary) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("AIWorkloadConfigArn", Some (ai_workload_config_arn_to_yojson x.ai_workload_config_arn));
      ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name));
    ]

let ai_workload_config_summary_list_to_yojson tree =
  list_to_yojson ai_workload_config_summary_to_yojson tree

let list_ai_workload_configs_response_to_yojson (x : list_ai_workload_configs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AIWorkloadConfigs", Some (ai_workload_config_summary_list_to_yojson x.ai_workload_configs));
    ]

let list_ai_workload_configs_sort_by_to_yojson (x : list_ai_workload_configs_sort_by) =
  match x with CREATION_TIME -> `String "CreationTime" | NAME -> `String "Name"

let list_ai_workload_configs_request_to_yojson (x : list_ai_workload_configs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_ai_workload_configs_sort_by_to_yojson x.sort_by);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let ai_recommendation_job_status_to_yojson (x : ai_recommendation_job_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let ai_recommendation_job_summary_to_yojson (x : ai_recommendation_job_summary) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "AIRecommendationJobStatus",
        Some (ai_recommendation_job_status_to_yojson x.ai_recommendation_job_status) );
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
      ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name));
    ]

let ai_recommendation_job_summary_list_to_yojson tree =
  list_to_yojson ai_recommendation_job_summary_to_yojson tree

let list_ai_recommendation_jobs_response_to_yojson (x : list_ai_recommendation_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "AIRecommendationJobs",
        Some (ai_recommendation_job_summary_list_to_yojson x.ai_recommendation_jobs) );
    ]

let list_ai_recommendation_jobs_sort_by_to_yojson (x : list_ai_recommendation_jobs_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let list_ai_recommendation_jobs_request_to_yojson (x : list_ai_recommendation_jobs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_ai_recommendation_jobs_sort_by_to_yojson x.sort_by);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("StatusEquals", option_to_yojson ai_recommendation_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let ai_benchmark_job_status_to_yojson (x : ai_benchmark_job_status) =
  match x with
  | STOPPED -> `String "Stopped"
  | STOPPING -> `String "Stopping"
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"

let ai_benchmark_job_summary_to_yojson (x : ai_benchmark_job_summary) =
  assoc_to_yojson
    [
      ("AIWorkloadConfigName", option_to_yojson ai_entity_name_to_yojson x.ai_workload_config_name);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("AIBenchmarkJobStatus", Some (ai_benchmark_job_status_to_yojson x.ai_benchmark_job_status));
      ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn));
      ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name));
    ]

let ai_benchmark_job_summary_list_to_yojson tree =
  list_to_yojson ai_benchmark_job_summary_to_yojson tree

let list_ai_benchmark_jobs_response_to_yojson (x : list_ai_benchmark_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AIBenchmarkJobs", Some (ai_benchmark_job_summary_list_to_yojson x.ai_benchmark_jobs));
    ]

let list_ai_benchmark_jobs_sort_by_to_yojson (x : list_ai_benchmark_jobs_sort_by) =
  match x with
  | STATUS -> `String "Status"
  | CREATION_TIME -> `String "CreationTime"
  | NAME -> `String "Name"

let list_ai_benchmark_jobs_request_to_yojson (x : list_ai_benchmark_jobs_request) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson list_ai_benchmark_jobs_sort_by_to_yojson x.sort_by);
      ("CreationTimeBefore", option_to_yojson timestamp_to_yojson x.creation_time_before);
      ("CreationTimeAfter", option_to_yojson timestamp_to_yojson x.creation_time_after);
      ("StatusEquals", option_to_yojson ai_benchmark_job_status_to_yojson x.status_equals);
      ("NameContains", option_to_yojson name_contains_to_yojson x.name_contains);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let action_source_to_yojson (x : action_source) =
  assoc_to_yojson
    [
      ("SourceId", option_to_yojson string256_to_yojson x.source_id);
      ("SourceType", option_to_yojson string256_to_yojson x.source_type);
      ("SourceUri", Some (source_uri_to_yojson x.source_uri));
    ]

let action_summary_to_yojson (x : action_summary) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("ActionType", option_to_yojson string64_to_yojson x.action_type);
      ("Source", option_to_yojson action_source_to_yojson x.source);
      ("ActionName", option_to_yojson experiment_entity_name_to_yojson x.action_name);
      ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn);
    ]

let action_summaries_to_yojson tree = list_to_yojson action_summary_to_yojson tree

let list_actions_response_to_yojson (x : list_actions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ActionSummaries", option_to_yojson action_summaries_to_yojson x.action_summaries);
    ]

let list_actions_request_to_yojson (x : list_actions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("SortBy", option_to_yojson sort_actions_by_to_yojson x.sort_by);
      ("CreatedBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("CreatedAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("ActionType", option_to_yojson string256_to_yojson x.action_type);
      ("SourceUri", option_to_yojson source_uri_to_yojson x.source_uri);
    ]

let import_hub_content_response_to_yojson (x : import_hub_content_response) =
  assoc_to_yojson
    [
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
    ]

let hub_content_document_to_yojson = string_to_yojson

let import_hub_content_request_to_yojson (x : import_hub_content_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
      ("HubContentDocument", Some (hub_content_document_to_yojson x.hub_content_document));
      ("HubContentMarkdown", option_to_yojson hub_content_markdown_to_yojson x.hub_content_markdown);
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
      ("DocumentSchemaVersion", Some (document_schema_version_to_yojson x.document_schema_version));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
    ]

let property_name_suggestion_to_yojson (x : property_name_suggestion) =
  assoc_to_yojson
    [ ("PropertyName", option_to_yojson resource_property_name_to_yojson x.property_name) ]

let property_name_suggestion_list_to_yojson tree =
  list_to_yojson property_name_suggestion_to_yojson tree

let get_search_suggestions_response_to_yojson (x : get_search_suggestions_response) =
  assoc_to_yojson
    [
      ( "PropertyNameSuggestions",
        option_to_yojson property_name_suggestion_list_to_yojson x.property_name_suggestions );
    ]

let get_search_suggestions_request_to_yojson (x : get_search_suggestions_request) =
  assoc_to_yojson
    [
      ("SuggestionQuery", option_to_yojson suggestion_query_to_yojson x.suggestion_query);
      ("Resource", Some (resource_type_to_yojson x.resource));
    ]

let dynamic_scaling_configuration_to_yojson (x : dynamic_scaling_configuration) =
  assoc_to_yojson
    [
      ("ScalingPolicies", option_to_yojson scaling_policies_to_yojson x.scaling_policies);
      ("ScaleOutCooldown", option_to_yojson integer_to_yojson x.scale_out_cooldown);
      ("ScaleInCooldown", option_to_yojson integer_to_yojson x.scale_in_cooldown);
      ("MaxCapacity", option_to_yojson integer_to_yojson x.max_capacity);
      ("MinCapacity", option_to_yojson integer_to_yojson x.min_capacity);
    ]

let get_scaling_configuration_recommendation_response_to_yojson
    (x : get_scaling_configuration_recommendation_response) =
  assoc_to_yojson
    [
      ( "DynamicScalingConfiguration",
        option_to_yojson dynamic_scaling_configuration_to_yojson x.dynamic_scaling_configuration );
      ("Metric", option_to_yojson scaling_policy_metric_to_yojson x.metric);
      ( "ScalingPolicyObjective",
        option_to_yojson scaling_policy_objective_to_yojson x.scaling_policy_objective );
      ( "TargetCpuUtilizationPerCore",
        option_to_yojson utilization_percentage_per_core_to_yojson x.target_cpu_utilization_per_core
      );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("RecommendationId", option_to_yojson string__to_yojson x.recommendation_id);
      ( "InferenceRecommendationsJobName",
        option_to_yojson recommendation_job_name_to_yojson x.inference_recommendations_job_name );
    ]

let get_scaling_configuration_recommendation_request_to_yojson
    (x : get_scaling_configuration_recommendation_request) =
  assoc_to_yojson
    [
      ( "ScalingPolicyObjective",
        option_to_yojson scaling_policy_objective_to_yojson x.scaling_policy_objective );
      ( "TargetCpuUtilizationPerCore",
        option_to_yojson utilization_percentage_per_core_to_yojson x.target_cpu_utilization_per_core
      );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ("RecommendationId", option_to_yojson string__to_yojson x.recommendation_id);
      ( "InferenceRecommendationsJobName",
        Some (recommendation_job_name_to_yojson x.inference_recommendations_job_name) );
    ]

let get_sagemaker_servicecatalog_portfolio_status_output_to_yojson
    (x : get_sagemaker_servicecatalog_portfolio_status_output) =
  assoc_to_yojson
    [ ("Status", option_to_yojson sagemaker_servicecatalog_status_to_yojson x.status) ]

let get_sagemaker_servicecatalog_portfolio_status_input_to_yojson = unit_to_yojson

let get_model_package_group_policy_output_to_yojson (x : get_model_package_group_policy_output) =
  assoc_to_yojson [ ("ResourcePolicy", Some (policy_string_to_yojson x.resource_policy)) ]

let get_model_package_group_policy_input_to_yojson (x : get_model_package_group_policy_input) =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name)) ]

let resource_policy_string_to_yojson = string_to_yojson

let get_lineage_group_policy_response_to_yojson (x : get_lineage_group_policy_response) =
  assoc_to_yojson
    [
      ("ResourcePolicy", option_to_yojson resource_policy_string_to_yojson x.resource_policy);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
    ]

let lineage_group_name_or_arn_to_yojson = string_to_yojson

let get_lineage_group_policy_request_to_yojson (x : get_lineage_group_policy_request) =
  assoc_to_yojson
    [ ("LineageGroupName", Some (lineage_group_name_or_arn_to_yojson x.lineage_group_name)) ]

let device_stats_to_yojson (x : device_stats) =
  assoc_to_yojson
    [
      ("RegisteredDeviceCount", Some (long_to_yojson x.registered_device_count));
      ("ConnectedDeviceCount", Some (long_to_yojson x.connected_device_count));
    ]

let agent_version_to_yojson (x : agent_version) =
  assoc_to_yojson
    [
      ("AgentCount", Some (long_to_yojson x.agent_count));
      ("Version", Some (edge_version_to_yojson x.version));
    ]

let agent_versions_to_yojson tree = list_to_yojson agent_version_to_yojson tree

let edge_model_stat_to_yojson (x : edge_model_stat) =
  assoc_to_yojson
    [
      ("SamplingDeviceCount", Some (long_to_yojson x.sampling_device_count));
      ("ActiveDeviceCount", Some (long_to_yojson x.active_device_count));
      ("ConnectedDeviceCount", Some (long_to_yojson x.connected_device_count));
      ("OfflineDeviceCount", Some (long_to_yojson x.offline_device_count));
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
      ("ModelName", Some (entity_name_to_yojson x.model_name));
    ]

let edge_model_stats_to_yojson tree = list_to_yojson edge_model_stat_to_yojson tree

let get_device_fleet_report_response_to_yojson (x : get_device_fleet_report_response) =
  assoc_to_yojson
    [
      ("ModelStats", option_to_yojson edge_model_stats_to_yojson x.model_stats);
      ("AgentVersions", option_to_yojson agent_versions_to_yojson x.agent_versions);
      ("DeviceStats", option_to_yojson device_stats_to_yojson x.device_stats);
      ("ReportGenerated", option_to_yojson timestamp_to_yojson x.report_generated);
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("OutputConfig", option_to_yojson edge_output_config_to_yojson x.output_config);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("DeviceFleetArn", Some (device_fleet_arn_to_yojson x.device_fleet_arn));
    ]

let get_device_fleet_report_request_to_yojson (x : get_device_fleet_report_request) =
  assoc_to_yojson [ ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name)) ]

let extend_training_plan_response_to_yojson (x : extend_training_plan_response) =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensions",
        Some (training_plan_extensions_to_yojson x.training_plan_extensions) );
    ]

let extend_training_plan_request_to_yojson (x : extend_training_plan_request) =
  assoc_to_yojson
    [
      ( "TrainingPlanExtensionOfferingId",
        Some (training_plan_extension_offering_id_to_yojson x.training_plan_extension_offering_id)
      );
    ]

let enable_sagemaker_servicecatalog_portfolio_output_to_yojson = unit_to_yojson
let enable_sagemaker_servicecatalog_portfolio_input_to_yojson = unit_to_yojson

let disassociate_trial_component_response_to_yojson (x : disassociate_trial_component_response) =
  assoc_to_yojson
    [
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
    ]

let disassociate_trial_component_request_to_yojson (x : disassociate_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
    ]

let disable_sagemaker_servicecatalog_portfolio_output_to_yojson = unit_to_yojson
let disable_sagemaker_servicecatalog_portfolio_input_to_yojson = unit_to_yojson

let detach_cluster_node_volume_response_to_yojson (x : detach_cluster_node_volume_response) =
  assoc_to_yojson
    [
      ("DeviceName", Some (volume_device_name_to_yojson x.device_name));
      ("Status", Some (volume_attachment_status_to_yojson x.status));
      ("AttachTime", Some (timestamp_to_yojson x.attach_time));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
    ]

let detach_cluster_node_volume_request_to_yojson (x : detach_cluster_node_volume_request) =
  assoc_to_yojson
    [
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
    ]

let describe_workteam_response_to_yojson (x : describe_workteam_response) =
  assoc_to_yojson [ ("Workteam", Some (workteam_to_yojson x.workteam)) ]

let describe_workteam_request_to_yojson (x : describe_workteam_request) =
  assoc_to_yojson [ ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name)) ]

let describe_workforce_response_to_yojson (x : describe_workforce_response) =
  assoc_to_yojson [ ("Workforce", Some (workforce_to_yojson x.workforce)) ]

let describe_workforce_request_to_yojson (x : describe_workforce_request) =
  assoc_to_yojson [ ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name)) ]

let efs_uid_to_yojson = string_to_yojson

let describe_user_profile_response_to_yojson (x : describe_user_profile_response) =
  assoc_to_yojson
    [
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
      ("SingleSignOnUserValue", option_to_yojson string256_to_yojson x.single_sign_on_user_value);
      ( "SingleSignOnUserIdentifier",
        option_to_yojson single_sign_on_user_identifier_to_yojson x.single_sign_on_user_identifier
      );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("Status", option_to_yojson user_profile_status_to_yojson x.status);
      ("HomeEfsFileSystemUid", option_to_yojson efs_uid_to_yojson x.home_efs_file_system_uid);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("UserProfileArn", option_to_yojson user_profile_arn_to_yojson x.user_profile_arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let describe_user_profile_request_to_yojson (x : describe_user_profile_request) =
  assoc_to_yojson
    [
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let describe_trial_component_response_to_yojson (x : describe_trial_component_response) =
  assoc_to_yojson
    [
      ("Sources", option_to_yojson trial_component_sources_to_yojson x.sources);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("Metrics", option_to_yojson trial_component_metric_summaries_to_yojson x.metrics);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("Source", option_to_yojson trial_component_source_to_yojson x.source);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
      ( "TrialComponentName",
        option_to_yojson experiment_entity_name_to_yojson x.trial_component_name );
    ]

let experiment_entity_name_or_arn_to_yojson = string_to_yojson

let describe_trial_component_request_to_yojson (x : describe_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialComponentName", Some (experiment_entity_name_or_arn_to_yojson x.trial_component_name));
    ]

let describe_trial_response_to_yojson (x : describe_trial_response) =
  assoc_to_yojson
    [
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Source", option_to_yojson trial_source_to_yojson x.source);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
      ("TrialName", option_to_yojson experiment_entity_name_to_yojson x.trial_name);
    ]

let describe_trial_request_to_yojson (x : describe_trial_request) =
  assoc_to_yojson [ ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name)) ]

let describe_transform_job_response_to_yojson (x : describe_transform_job_response) =
  assoc_to_yojson
    [
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("DataProcessing", option_to_yojson data_processing_to_yojson x.data_processing);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("TransformEndTime", option_to_yojson timestamp_to_yojson x.transform_end_time);
      ("TransformStartTime", option_to_yojson timestamp_to_yojson x.transform_start_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("TransformResources", Some (transform_resources_to_yojson x.transform_resources));
      ( "DataCaptureConfig",
        option_to_yojson batch_data_capture_config_to_yojson x.data_capture_config );
      ("TransformOutput", option_to_yojson transform_output_to_yojson x.transform_output);
      ("TransformInput", Some (transform_input_to_yojson x.transform_input));
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("ModelClientConfig", option_to_yojson model_client_config_to_yojson x.model_client_config);
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("TransformJobStatus", Some (transform_job_status_to_yojson x.transform_job_status));
      ("TransformJobArn", Some (transform_job_arn_to_yojson x.transform_job_arn));
      ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name));
    ]

let describe_transform_job_request_to_yojson (x : describe_transform_job_request) =
  assoc_to_yojson [ ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name)) ]

let describe_training_plan_extension_history_response_to_yojson
    (x : describe_training_plan_extension_history_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "TrainingPlanExtensions",
        Some (training_plan_extensions_to_yojson x.training_plan_extensions) );
    ]

let describe_training_plan_extension_history_request_to_yojson
    (x : describe_training_plan_extension_history_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn));
    ]

let describe_training_plan_response_to_yojson (x : describe_training_plan_response) =
  assoc_to_yojson
    [
      ( "ReservedCapacitySummaries",
        option_to_yojson reserved_capacity_summaries_to_yojson x.reserved_capacity_summaries );
      ("TargetResources", option_to_yojson sage_maker_resource_names_to_yojson x.target_resources);
      ( "TotalUltraServerCount",
        option_to_yojson ultra_server_count_to_yojson x.total_ultra_server_count );
      ( "AvailableSpareInstanceCount",
        option_to_yojson available_spare_instance_count_to_yojson x.available_spare_instance_count
      );
      ( "UnhealthyInstanceCount",
        option_to_yojson unhealthy_instance_count_to_yojson x.unhealthy_instance_count );
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ("TotalInstanceCount", option_to_yojson total_instance_count_to_yojson x.total_instance_count);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("UpfrontFee", option_to_yojson string256_to_yojson x.upfront_fee);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "DurationMinutes",
        option_to_yojson training_plan_duration_minutes_to_yojson x.duration_minutes );
      ("DurationHours", option_to_yojson training_plan_duration_hours_to_yojson x.duration_hours);
      ("StatusMessage", option_to_yojson training_plan_status_message_to_yojson x.status_message);
      ("Status", Some (training_plan_status_to_yojson x.status));
      ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name));
      ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn));
    ]

let describe_training_plan_request_to_yojson (x : describe_training_plan_request) =
  assoc_to_yojson [ ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name)) ]

let billable_token_count_to_yojson = long_to_yojson

let profiler_rule_evaluation_status_to_yojson (x : profiler_rule_evaluation_status) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("StatusDetails", option_to_yojson status_details_to_yojson x.status_details);
      ( "RuleEvaluationStatus",
        option_to_yojson rule_evaluation_status_to_yojson x.rule_evaluation_status );
      ( "RuleEvaluationJobArn",
        option_to_yojson processing_job_arn_to_yojson x.rule_evaluation_job_arn );
      ( "RuleConfigurationName",
        option_to_yojson rule_configuration_name_to_yojson x.rule_configuration_name );
    ]

let profiler_rule_evaluation_statuses_to_yojson tree =
  list_to_yojson profiler_rule_evaluation_status_to_yojson tree

let profiling_status_to_yojson (x : profiling_status) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let remote_debug_config_to_yojson (x : remote_debug_config) =
  assoc_to_yojson
    [ ("EnableRemoteDebug", option_to_yojson enable_remote_debug_to_yojson x.enable_remote_debug) ]

let enable_infra_check_to_yojson = bool_to_yojson

let infra_check_config_to_yojson (x : infra_check_config) =
  assoc_to_yojson
    [ ("EnableInfraCheck", option_to_yojson enable_infra_check_to_yojson x.enable_infra_check) ]

let ml_flow_resource_arn_to_yojson = string_to_yojson
let mlflow_experiment_name_to_yojson = string_to_yojson
let mlflow_run_name_to_yojson = string_to_yojson

let mlflow_config_to_yojson (x : mlflow_config) =
  assoc_to_yojson
    [
      ("MlflowRunName", option_to_yojson mlflow_run_name_to_yojson x.mlflow_run_name);
      ( "MlflowExperimentName",
        option_to_yojson mlflow_experiment_name_to_yojson x.mlflow_experiment_name );
      ("MlflowResourceArn", Some (ml_flow_resource_arn_to_yojson x.mlflow_resource_arn));
    ]

let mlflow_experiment_id_to_yojson = string_to_yojson
let mlflow_run_id_to_yojson = string_to_yojson

let mlflow_details_to_yojson (x : mlflow_details) =
  assoc_to_yojson
    [
      ("MlflowRunId", option_to_yojson mlflow_run_id_to_yojson x.mlflow_run_id);
      ("MlflowExperimentId", option_to_yojson mlflow_experiment_id_to_yojson x.mlflow_experiment_id);
    ]

let describe_training_job_response_to_yojson (x : describe_training_job_response) =
  assoc_to_yojson
    [
      ( "OutputModelPackageArn",
        option_to_yojson model_package_arn_to_yojson x.output_model_package_arn );
      ("ProgressInfo", option_to_yojson training_progress_info_to_yojson x.progress_info);
      ("MlflowDetails", option_to_yojson mlflow_details_to_yojson x.mlflow_details);
      ("ModelPackageConfig", option_to_yojson model_package_config_to_yojson x.model_package_config);
      ("MlflowConfig", option_to_yojson mlflow_config_to_yojson x.mlflow_config);
      ( "ServerlessJobConfig",
        option_to_yojson serverless_job_config_to_yojson x.serverless_job_config );
      ("InfraCheckConfig", option_to_yojson infra_check_config_to_yojson x.infra_check_config);
      ("RemoteDebugConfig", option_to_yojson remote_debug_config_to_yojson x.remote_debug_config);
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ("Environment", option_to_yojson training_environment_map_to_yojson x.environment);
      ("ProfilingStatus", option_to_yojson profiling_status_to_yojson x.profiling_status);
      ( "ProfilerRuleEvaluationStatuses",
        option_to_yojson profiler_rule_evaluation_statuses_to_yojson
          x.profiler_rule_evaluation_statuses );
      ( "ProfilerRuleConfigurations",
        option_to_yojson profiler_rule_configurations_to_yojson x.profiler_rule_configurations );
      ("ProfilerConfig", option_to_yojson profiler_config_to_yojson x.profiler_config);
      ( "DebugRuleEvaluationStatuses",
        option_to_yojson debug_rule_evaluation_statuses_to_yojson x.debug_rule_evaluation_statuses
      );
      ( "TensorBoardOutputConfig",
        option_to_yojson tensor_board_output_config_to_yojson x.tensor_board_output_config );
      ( "DebugRuleConfigurations",
        option_to_yojson debug_rule_configurations_to_yojson x.debug_rule_configurations );
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("DebugHookConfig", option_to_yojson debug_hook_config_to_yojson x.debug_hook_config);
      ("BillableTokenCount", option_to_yojson billable_token_count_to_yojson x.billable_token_count);
      ( "BillableTimeInSeconds",
        option_to_yojson billable_time_in_seconds_to_yojson x.billable_time_in_seconds );
      ( "TrainingTimeInSeconds",
        option_to_yojson training_time_in_seconds_to_yojson x.training_time_in_seconds );
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "FinalMetricDataList",
        option_to_yojson final_metric_data_list_to_yojson x.final_metric_data_list );
      ( "SecondaryStatusTransitions",
        option_to_yojson secondary_status_transitions_to_yojson x.secondary_status_transitions );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("TrainingEndTime", option_to_yojson timestamp_to_yojson x.training_end_time);
      ("TrainingStartTime", option_to_yojson timestamp_to_yojson x.training_start_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("WarmPoolStatus", option_to_yojson warm_pool_status_to_yojson x.warm_pool_status);
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ("OutputDataConfig", option_to_yojson output_data_config_to_yojson x.output_data_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "AlgorithmSpecification",
        option_to_yojson algorithm_specification_to_yojson x.algorithm_specification );
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("SecondaryStatus", Some (secondary_status_to_yojson x.secondary_status));
      ("TrainingJobStatus", Some (training_job_status_to_yojson x.training_job_status));
      ("ModelArtifacts", Some (model_artifacts_to_yojson x.model_artifacts));
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ("LabelingJobArn", option_to_yojson labeling_job_arn_to_yojson x.labeling_job_arn);
      ("TuningJobArn", option_to_yojson hyper_parameter_tuning_job_arn_to_yojson x.tuning_job_arn);
      ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn));
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
    ]

let describe_training_job_request_to_yojson (x : describe_training_job_request) =
  assoc_to_yojson [ ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name)) ]

let describe_subscribed_workteam_response_to_yojson (x : describe_subscribed_workteam_response) =
  assoc_to_yojson
    [ ("SubscribedWorkteam", Some (subscribed_workteam_to_yojson x.subscribed_workteam)) ]

let describe_subscribed_workteam_request_to_yojson (x : describe_subscribed_workteam_request) =
  assoc_to_yojson [ ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn)) ]

let describe_studio_lifecycle_config_response_to_yojson
    (x : describe_studio_lifecycle_config_response) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigAppType",
        option_to_yojson studio_lifecycle_config_app_type_to_yojson
          x.studio_lifecycle_config_app_type );
      ( "StudioLifecycleConfigContent",
        option_to_yojson studio_lifecycle_config_content_to_yojson x.studio_lifecycle_config_content
      );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "StudioLifecycleConfigName",
        option_to_yojson studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name );
      ( "StudioLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.studio_lifecycle_config_arn );
    ]

let describe_studio_lifecycle_config_request_to_yojson
    (x : describe_studio_lifecycle_config_request) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigName",
        Some (studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name) );
    ]

let ownership_settings_to_yojson (x : ownership_settings) =
  assoc_to_yojson
    [ ("OwnerUserProfileName", Some (user_profile_name_to_yojson x.owner_user_profile_name)) ]

let describe_space_response_to_yojson (x : describe_space_response) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson string1024_to_yojson x.url);
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
      ( "SpaceSharingSettings",
        option_to_yojson space_sharing_settings_to_yojson x.space_sharing_settings );
      ("OwnershipSettings", option_to_yojson ownership_settings_to_yojson x.ownership_settings);
      ("SpaceSettings", option_to_yojson space_settings_to_yojson x.space_settings);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("Status", option_to_yojson space_status_to_yojson x.status);
      ("HomeEfsFileSystemUid", option_to_yojson efs_uid_to_yojson x.home_efs_file_system_uid);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("SpaceArn", option_to_yojson space_arn_to_yojson x.space_arn);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
    ]

let describe_space_request_to_yojson (x : describe_space_request) =
  assoc_to_yojson
    [
      ("SpaceName", Some (space_name_to_yojson x.space_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let describe_reserved_capacity_response_to_yojson (x : describe_reserved_capacity_response) =
  assoc_to_yojson
    [
      ("UltraServerSummary", option_to_yojson ultra_server_summary_to_yojson x.ultra_server_summary);
      ( "InUseInstanceCount",
        option_to_yojson in_use_instance_count_to_yojson x.in_use_instance_count );
      ( "AvailableInstanceCount",
        option_to_yojson available_instance_count_to_yojson x.available_instance_count );
      ("TotalInstanceCount", Some (total_instance_count_to_yojson x.total_instance_count));
      ("InstanceType", Some (reserved_capacity_instance_type_to_yojson x.instance_type));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "DurationMinutes",
        option_to_yojson reserved_capacity_duration_minutes_to_yojson x.duration_minutes );
      ("DurationHours", option_to_yojson reserved_capacity_duration_hours_to_yojson x.duration_hours);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("Status", option_to_yojson reserved_capacity_status_to_yojson x.status);
      ( "ReservedCapacityType",
        option_to_yojson reserved_capacity_type_to_yojson x.reserved_capacity_type );
      ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn));
    ]

let describe_reserved_capacity_request_to_yojson (x : describe_reserved_capacity_request) =
  assoc_to_yojson
    [ ("ReservedCapacityArn", Some (reserved_capacity_arn_to_yojson x.reserved_capacity_arn)) ]

let describe_project_output_to_yojson (x : describe_project_output) =
  assoc_to_yojson
    [
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ( "TemplateProviderDetails",
        option_to_yojson template_provider_detail_list_to_yojson x.template_provider_details );
      ("ProjectStatus", Some (project_status_to_yojson x.project_status));
      ( "ServiceCatalogProvisionedProductDetails",
        option_to_yojson service_catalog_provisioned_product_details_to_yojson
          x.service_catalog_provisioned_product_details );
      ( "ServiceCatalogProvisioningDetails",
        option_to_yojson service_catalog_provisioning_details_to_yojson
          x.service_catalog_provisioning_details );
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ("ProjectId", Some (project_id_to_yojson x.project_id));
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
    ]

let describe_project_input_to_yojson (x : describe_project_input) =
  assoc_to_yojson [ ("ProjectName", Some (project_entity_name_to_yojson x.project_name)) ]

let describe_processing_job_response_to_yojson (x : describe_processing_job_response) =
  assoc_to_yojson
    [
      ("TrainingJobArn", option_to_yojson training_job_arn_to_yojson x.training_job_arn);
      ("AutoMLJobArn", option_to_yojson auto_ml_job_arn_to_yojson x.auto_ml_job_arn);
      ( "MonitoringScheduleArn",
        option_to_yojson monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ProcessingStartTime", option_to_yojson timestamp_to_yojson x.processing_start_time);
      ("ProcessingEndTime", option_to_yojson timestamp_to_yojson x.processing_end_time);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("ExitMessage", option_to_yojson exit_message_to_yojson x.exit_message);
      ("ProcessingJobStatus", Some (processing_job_status_to_yojson x.processing_job_status));
      ("ProcessingJobArn", Some (processing_job_arn_to_yojson x.processing_job_arn));
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("Environment", option_to_yojson processing_environment_map_to_yojson x.environment);
      ("AppSpecification", Some (app_specification_to_yojson x.app_specification));
      ( "StoppingCondition",
        option_to_yojson processing_stopping_condition_to_yojson x.stopping_condition );
      ("ProcessingResources", Some (processing_resources_to_yojson x.processing_resources));
      ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name));
      ( "ProcessingOutputConfig",
        option_to_yojson processing_output_config_to_yojson x.processing_output_config );
      ("ProcessingInputs", option_to_yojson processing_inputs_to_yojson x.processing_inputs);
    ]

let describe_processing_job_request_to_yojson (x : describe_processing_job_request) =
  assoc_to_yojson
    [ ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name)) ]

let m_lflow_arn_to_yojson = string_to_yojson

let m_lflow_configuration_to_yojson (x : m_lflow_configuration) =
  assoc_to_yojson
    [
      ( "MlflowExperimentName",
        option_to_yojson mlflow_experiment_entity_name_to_yojson x.mlflow_experiment_name );
      ("MlflowResourceArn", option_to_yojson m_lflow_arn_to_yojson x.mlflow_resource_arn);
    ]

let describe_pipeline_execution_response_to_yojson (x : describe_pipeline_execution_response) =
  assoc_to_yojson
    [
      ("MLflowConfig", option_to_yojson m_lflow_configuration_to_yojson x.m_lflow_config);
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ( "SelectiveExecutionConfig",
        option_to_yojson selective_execution_config_to_yojson x.selective_execution_config );
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "FailureReason",
        option_to_yojson pipeline_execution_failure_reason_to_yojson x.failure_reason );
      ( "PipelineExperimentConfig",
        option_to_yojson pipeline_experiment_config_to_yojson x.pipeline_experiment_config );
      ( "PipelineExecutionDescription",
        option_to_yojson pipeline_execution_description_to_yojson x.pipeline_execution_description
      );
      ( "PipelineExecutionStatus",
        option_to_yojson pipeline_execution_status_to_yojson x.pipeline_execution_status );
      ( "PipelineExecutionDisplayName",
        option_to_yojson pipeline_execution_name_to_yojson x.pipeline_execution_display_name );
      ( "PipelineExecutionArn",
        option_to_yojson pipeline_execution_arn_to_yojson x.pipeline_execution_arn );
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let describe_pipeline_execution_request_to_yojson (x : describe_pipeline_execution_request) =
  assoc_to_yojson
    [ ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn)) ]

let describe_pipeline_definition_for_execution_response_to_yojson
    (x : describe_pipeline_definition_for_execution_response) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
    ]

let describe_pipeline_definition_for_execution_request_to_yojson
    (x : describe_pipeline_definition_for_execution_request) =
  assoc_to_yojson
    [ ("PipelineExecutionArn", Some (pipeline_execution_arn_to_yojson x.pipeline_execution_arn)) ]

let describe_pipeline_response_to_yojson (x : describe_pipeline_response) =
  assoc_to_yojson
    [
      ( "PipelineVersionDescription",
        option_to_yojson pipeline_version_description_to_yojson x.pipeline_version_description );
      ( "PipelineVersionDisplayName",
        option_to_yojson pipeline_version_name_to_yojson x.pipeline_version_display_name );
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("LastRunTime", option_to_yojson timestamp_to_yojson x.last_run_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("PipelineStatus", option_to_yojson pipeline_status_to_yojson x.pipeline_status);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineName", option_to_yojson pipeline_name_to_yojson x.pipeline_name);
      ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn);
    ]

let describe_pipeline_request_to_yojson (x : describe_pipeline_request) =
  assoc_to_yojson
    [
      ("PipelineVersionId", option_to_yojson pipeline_version_id_to_yojson x.pipeline_version_id);
      ("PipelineName", Some (pipeline_name_or_arn_to_yojson x.pipeline_name));
    ]

let partner_app_auth_type_to_yojson (x : partner_app_auth_type) =
  match x with IAM -> `String "IAM"

let error_info_to_yojson (x : error_info) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson non_empty_string256_to_yojson x.reason);
      ("Code", option_to_yojson non_empty_string64_to_yojson x.code);
    ]

let release_notes_list_to_yojson tree = list_to_yojson string1024_to_yojson tree

let available_upgrade_to_yojson (x : available_upgrade) =
  assoc_to_yojson
    [
      ("ReleaseNotes", option_to_yojson release_notes_list_to_yojson x.release_notes);
      ("Version", option_to_yojson major_minor_version_to_yojson x.version);
    ]

let describe_partner_app_response_to_yojson (x : describe_partner_app_response) =
  assoc_to_yojson
    [
      ("AvailableUpgrade", option_to_yojson available_upgrade_to_yojson x.available_upgrade);
      ("CurrentVersionEolDate", option_to_yojson timestamp_to_yojson x.current_version_eol_date);
      ( "EnableAutoMinorVersionUpgrade",
        option_to_yojson boolean__to_yojson x.enable_auto_minor_version_upgrade );
      ("Error", option_to_yojson error_info_to_yojson x.error);
      ( "EnableIamSessionBasedIdentity",
        option_to_yojson boolean__to_yojson x.enable_iam_session_based_identity );
      ("AuthType", option_to_yojson partner_app_auth_type_to_yojson x.auth_type);
      ("ApplicationConfig", option_to_yojson partner_app_config_to_yojson x.application_config);
      ("Version", option_to_yojson non_empty_string64_to_yojson x.version);
      ("Tier", option_to_yojson non_empty_string64_to_yojson x.tier);
      ( "MaintenanceConfig",
        option_to_yojson partner_app_maintenance_config_to_yojson x.maintenance_config );
      ("BaseUrl", option_to_yojson string2048_to_yojson x.base_url);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson partner_app_status_to_yojson x.status);
      ("Type", option_to_yojson partner_app_type_to_yojson x.type_);
      ("Name", option_to_yojson partner_app_name_to_yojson x.name);
      ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn);
    ]

let describe_partner_app_request_to_yojson (x : describe_partner_app_request) =
  assoc_to_yojson
    [
      ("IncludeAvailableUpgrade", option_to_yojson boolean__to_yojson x.include_available_upgrade);
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
    ]

let optimization_model_accept_eula_to_yojson = bool_to_yojson

let optimization_model_access_config_to_yojson (x : optimization_model_access_config) =
  assoc_to_yojson [ ("AcceptEula", Some (optimization_model_accept_eula_to_yojson x.accept_eula)) ]

let optimization_job_model_source_s3_to_yojson (x : optimization_job_model_source_s3) =
  assoc_to_yojson
    [
      ( "ModelAccessConfig",
        option_to_yojson optimization_model_access_config_to_yojson x.model_access_config );
      ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri);
    ]

let optimization_sage_maker_model_to_yojson (x : optimization_sage_maker_model) =
  assoc_to_yojson [ ("ModelName", option_to_yojson model_name_to_yojson x.model_name) ]

let optimization_job_model_source_to_yojson (x : optimization_job_model_source) =
  assoc_to_yojson
    [
      ("SageMakerModel", option_to_yojson optimization_sage_maker_model_to_yojson x.sage_maker_model);
      ("S3", option_to_yojson optimization_job_model_source_s3_to_yojson x.s3);
    ]

let optimization_job_environment_variables_to_yojson tree =
  map_to_yojson non_empty_string256_to_yojson string256_to_yojson tree

let optimization_container_image_to_yojson = string_to_yojson

let model_quantization_config_to_yojson (x : model_quantization_config) =
  assoc_to_yojson
    [
      ( "OverrideEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.override_environment );
      ("Image", option_to_yojson optimization_container_image_to_yojson x.image);
    ]

let model_compilation_config_to_yojson (x : model_compilation_config) =
  assoc_to_yojson
    [
      ( "OverrideEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.override_environment );
      ("Image", option_to_yojson optimization_container_image_to_yojson x.image);
    ]

let model_sharding_config_to_yojson (x : model_sharding_config) =
  assoc_to_yojson
    [
      ( "OverrideEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.override_environment );
      ("Image", option_to_yojson optimization_container_image_to_yojson x.image);
    ]

let model_speculative_decoding_technique_to_yojson (x : model_speculative_decoding_technique) =
  match x with EAGLE -> `String "EAGLE"

let model_speculative_decoding_s3_data_type_to_yojson (x : model_speculative_decoding_s3_data_type)
    =
  match x with ManifestFile -> `String "ManifestFile" | S3Prefix -> `String "S3Prefix"

let model_speculative_decoding_training_data_source_to_yojson
    (x : model_speculative_decoding_training_data_source) =
  assoc_to_yojson
    [
      ("S3DataType", Some (model_speculative_decoding_s3_data_type_to_yojson x.s3_data_type));
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let model_speculative_decoding_config_to_yojson (x : model_speculative_decoding_config) =
  assoc_to_yojson
    [
      ( "TrainingDataSource",
        option_to_yojson model_speculative_decoding_training_data_source_to_yojson
          x.training_data_source );
      ("Technique", Some (model_speculative_decoding_technique_to_yojson x.technique));
    ]

let optimization_config_to_yojson (x : optimization_config) =
  match x with
  | ModelSpeculativeDecodingConfig arg ->
      assoc_to_yojson
        [
          ("ModelSpeculativeDecodingConfig", Some (model_speculative_decoding_config_to_yojson arg));
        ]
  | ModelShardingConfig arg ->
      assoc_to_yojson [ ("ModelShardingConfig", Some (model_sharding_config_to_yojson arg)) ]
  | ModelCompilationConfig arg ->
      assoc_to_yojson [ ("ModelCompilationConfig", Some (model_compilation_config_to_yojson arg)) ]
  | ModelQuantizationConfig arg ->
      assoc_to_yojson
        [ ("ModelQuantizationConfig", Some (model_quantization_config_to_yojson arg)) ]

let optimization_configs_to_yojson tree = list_to_yojson optimization_config_to_yojson tree

let optimization_job_output_config_to_yojson (x : optimization_job_output_config) =
  assoc_to_yojson
    [
      ("SageMakerModel", option_to_yojson optimization_sage_maker_model_to_yojson x.sage_maker_model);
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let optimization_output_to_yojson (x : optimization_output) =
  assoc_to_yojson
    [
      ( "RecommendedInferenceImage",
        option_to_yojson optimization_container_image_to_yojson x.recommended_inference_image );
    ]

let optimization_vpc_security_group_id_to_yojson = string_to_yojson

let optimization_vpc_security_group_ids_to_yojson tree =
  list_to_yojson optimization_vpc_security_group_id_to_yojson tree

let optimization_vpc_subnet_id_to_yojson = string_to_yojson

let optimization_vpc_subnets_to_yojson tree =
  list_to_yojson optimization_vpc_subnet_id_to_yojson tree

let optimization_vpc_config_to_yojson (x : optimization_vpc_config) =
  assoc_to_yojson
    [
      ("Subnets", Some (optimization_vpc_subnets_to_yojson x.subnets));
      ("SecurityGroupIds", Some (optimization_vpc_security_group_ids_to_yojson x.security_group_ids));
    ]

let describe_optimization_job_response_to_yojson (x : describe_optimization_job_response) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson optimization_vpc_config_to_yojson x.vpc_config);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OptimizationOutput", option_to_yojson optimization_output_to_yojson x.optimization_output);
      ("OutputConfig", Some (optimization_job_output_config_to_yojson x.output_config));
      ("OptimizationConfigs", Some (optimization_configs_to_yojson x.optimization_configs));
      ( "MaxInstanceCount",
        option_to_yojson optimization_job_max_instance_count_to_yojson x.max_instance_count );
      ( "DeploymentInstanceType",
        Some (optimization_job_deployment_instance_type_to_yojson x.deployment_instance_type) );
      ( "OptimizationEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.optimization_environment
      );
      ("ModelSource", Some (optimization_job_model_source_to_yojson x.model_source));
      ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("OptimizationEndTime", option_to_yojson timestamp_to_yojson x.optimization_end_time);
      ("OptimizationStartTime", option_to_yojson timestamp_to_yojson x.optimization_start_time);
      ("OptimizationJobStatus", Some (optimization_job_status_to_yojson x.optimization_job_status));
      ("OptimizationJobArn", Some (optimization_job_arn_to_yojson x.optimization_job_arn));
    ]

let describe_optimization_job_request_to_yojson (x : describe_optimization_job_request) =
  assoc_to_yojson [ ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name)) ]

let describe_notebook_instance_lifecycle_config_output_to_yojson
    (x : describe_notebook_instance_lifecycle_config_output) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("OnStart", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_start);
      ("OnCreate", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_create);
      ( "NotebookInstanceLifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name );
      ( "NotebookInstanceLifecycleConfigArn",
        option_to_yojson notebook_instance_lifecycle_config_arn_to_yojson
          x.notebook_instance_lifecycle_config_arn );
    ]

let describe_notebook_instance_lifecycle_config_input_to_yojson
    (x : describe_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
    ]

let network_interface_id_to_yojson = string_to_yojson

let direct_internet_access_to_yojson (x : direct_internet_access) =
  match x with DISABLED -> `String "Disabled" | ENABLED -> `String "Enabled"

let describe_notebook_instance_output_to_yojson (x : describe_notebook_instance_output) =
  assoc_to_yojson
    [
      ( "InstanceMetadataServiceConfiguration",
        option_to_yojson instance_metadata_service_configuration_to_yojson
          x.instance_metadata_service_configuration );
      ("PlatformIdentifier", option_to_yojson platform_identifier_to_yojson x.platform_identifier);
      ("RootAccess", option_to_yojson root_access_to_yojson x.root_access);
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "AcceleratorTypes",
        option_to_yojson notebook_instance_accelerator_types_to_yojson x.accelerator_types );
      ( "VolumeSizeInGB",
        option_to_yojson notebook_instance_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "DirectInternetAccess",
        option_to_yojson direct_internet_access_to_yojson x.direct_internet_access );
      ( "NotebookInstanceLifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson
          x.notebook_instance_lifecycle_config_name );
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("SecurityGroups", option_to_yojson security_group_ids_to_yojson x.security_groups);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("Url", option_to_yojson notebook_instance_url_to_yojson x.url);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "NotebookInstanceStatus",
        option_to_yojson notebook_instance_status_to_yojson x.notebook_instance_status );
      ( "NotebookInstanceName",
        option_to_yojson notebook_instance_name_to_yojson x.notebook_instance_name );
      ( "NotebookInstanceArn",
        option_to_yojson notebook_instance_arn_to_yojson x.notebook_instance_arn );
    ]

let describe_notebook_instance_input_to_yojson (x : describe_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let describe_monitoring_schedule_response_to_yojson (x : describe_monitoring_schedule_response) =
  assoc_to_yojson
    [
      ( "LastMonitoringExecutionSummary",
        option_to_yojson monitoring_execution_summary_to_yojson x.last_monitoring_execution_summary
      );
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "MonitoringScheduleConfig",
        Some (monitoring_schedule_config_to_yojson x.monitoring_schedule_config) );
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("MonitoringType", option_to_yojson monitoring_type_to_yojson x.monitoring_type);
      ("MonitoringScheduleStatus", Some (schedule_status_to_yojson x.monitoring_schedule_status));
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
    ]

let describe_monitoring_schedule_request_to_yojson (x : describe_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let model_quality_baseline_config_to_yojson (x : model_quality_baseline_config) =
  assoc_to_yojson
    [
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
    ]

let monitoring_problem_type_to_yojson (x : monitoring_problem_type) =
  match x with
  | REGRESSION -> `String "Regression"
  | MULTICLASS_CLASSIFICATION -> `String "MulticlassClassification"
  | BINARY_CLASSIFICATION -> `String "BinaryClassification"

let model_quality_app_specification_to_yojson (x : model_quality_app_specification) =
  assoc_to_yojson
    [
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
      ("ProblemType", option_to_yojson monitoring_problem_type_to_yojson x.problem_type);
      ( "PostAnalyticsProcessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.post_analytics_processor_source_uri );
      ( "RecordPreprocessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.record_preprocessor_source_uri );
      ( "ContainerArguments",
        option_to_yojson monitoring_container_arguments_to_yojson x.container_arguments );
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
    ]

let monitoring_ground_truth_s3_input_to_yojson (x : monitoring_ground_truth_s3_input) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson monitoring_s3_uri_to_yojson x.s3_uri) ]

let model_quality_job_input_to_yojson (x : model_quality_job_input) =
  assoc_to_yojson
    [
      ( "GroundTruthS3Input",
        Some (monitoring_ground_truth_s3_input_to_yojson x.ground_truth_s3_input) );
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
    ]

let monitoring_network_config_to_yojson (x : monitoring_network_config) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
    ]

let describe_model_quality_job_definition_response_to_yojson
    (x : describe_model_quality_job_definition_response) =
  assoc_to_yojson
    [
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "ModelQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_quality_job_output_config) );
      ("ModelQualityJobInput", Some (model_quality_job_input_to_yojson x.model_quality_job_input));
      ( "ModelQualityAppSpecification",
        Some (model_quality_app_specification_to_yojson x.model_quality_app_specification) );
      ( "ModelQualityBaselineConfig",
        option_to_yojson model_quality_baseline_config_to_yojson x.model_quality_baseline_config );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
    ]

let describe_model_quality_job_definition_request_to_yojson
    (x : describe_model_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let describe_model_package_group_output_to_yojson (x : describe_model_package_group_output) =
  assoc_to_yojson
    [
      ( "ManagedConfiguration",
        option_to_yojson managed_configuration_to_yojson x.managed_configuration );
      ( "ModelPackageGroupStatus",
        Some (model_package_group_status_to_yojson x.model_package_group_status) );
      ("CreatedBy", Some (user_context_to_yojson x.created_by));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn));
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
    ]

let describe_model_package_group_input_to_yojson (x : describe_model_package_group_input) =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (arn_or_name_to_yojson x.model_package_group_name)) ]

let describe_model_package_output_to_yojson (x : describe_model_package_output) =
  assoc_to_yojson
    [
      ("ManagedStorageType", option_to_yojson managed_storage_type_to_yojson x.managed_storage_type);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("SecurityConfig", option_to_yojson model_package_security_config_to_yojson x.security_config);
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ( "SkipModelValidation",
        option_to_yojson skip_model_validation_to_yojson x.skip_model_validation );
      ( "AdditionalInferenceSpecifications",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications );
      ( "DriftCheckBaselines",
        option_to_yojson drift_check_baselines_to_yojson x.drift_check_baselines );
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ("SamplePayloadUrl", option_to_yojson string__to_yojson x.sample_payload_url);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("Domain", option_to_yojson string__to_yojson x.domain);
      ("ApprovalDescription", option_to_yojson approval_description_to_yojson x.approval_description);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ( "ModelPackageStatusDetails",
        Some (model_package_status_details_to_yojson x.model_package_status_details) );
      ("ModelPackageStatus", Some (model_package_status_to_yojson x.model_package_status));
      ( "ValidationSpecification",
        option_to_yojson model_package_validation_specification_to_yojson x.validation_specification
      );
      ( "SourceAlgorithmSpecification",
        option_to_yojson source_algorithm_specification_to_yojson x.source_algorithm_specification
      );
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ("ModelPackageGroupName", option_to_yojson entity_name_to_yojson x.model_package_group_name);
      ("ModelPackageName", Some (entity_name_to_yojson x.model_package_name));
    ]

let included_data_to_yojson (x : included_data) =
  match x with METADATA_ONLY -> `String "MetadataOnly" | ALL_DATA -> `String "AllData"

let describe_model_package_input_to_yojson (x : describe_model_package_input) =
  assoc_to_yojson
    [
      ("IncludedData", option_to_yojson included_data_to_yojson x.included_data);
      ("ModelPackageName", Some (versioned_arn_or_name_to_yojson x.model_package_name));
    ]

let model_explainability_baseline_config_to_yojson (x : model_explainability_baseline_config) =
  assoc_to_yojson
    [
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
    ]

let model_explainability_app_specification_to_yojson (x : model_explainability_app_specification) =
  assoc_to_yojson
    [
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
      ("ConfigUri", Some (s3_uri_to_yojson x.config_uri));
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
    ]

let model_explainability_job_input_to_yojson (x : model_explainability_job_input) =
  assoc_to_yojson
    [
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
    ]

let describe_model_explainability_job_definition_response_to_yojson
    (x : describe_model_explainability_job_definition_response) =
  assoc_to_yojson
    [
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "ModelExplainabilityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_explainability_job_output_config) );
      ( "ModelExplainabilityJobInput",
        Some (model_explainability_job_input_to_yojson x.model_explainability_job_input) );
      ( "ModelExplainabilityAppSpecification",
        Some
          (model_explainability_app_specification_to_yojson x.model_explainability_app_specification)
      );
      ( "ModelExplainabilityBaselineConfig",
        option_to_yojson model_explainability_baseline_config_to_yojson
          x.model_explainability_baseline_config );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
    ]

let describe_model_explainability_job_definition_request_to_yojson
    (x : describe_model_explainability_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let model_card_export_output_config_to_yojson (x : model_card_export_output_config) =
  assoc_to_yojson [ ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path)) ]

let model_card_export_artifacts_to_yojson (x : model_card_export_artifacts) =
  assoc_to_yojson [ ("S3ExportArtifacts", Some (s3_uri_to_yojson x.s3_export_artifacts)) ]

let describe_model_card_export_job_response_to_yojson (x : describe_model_card_export_job_response)
    =
  assoc_to_yojson
    [
      ("ExportArtifacts", option_to_yojson model_card_export_artifacts_to_yojson x.export_artifacts);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LastModifiedAt", Some (timestamp_to_yojson x.last_modified_at));
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("OutputConfig", Some (model_card_export_output_config_to_yojson x.output_config));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("Status", Some (model_card_export_job_status_to_yojson x.status));
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
      ("ModelCardExportJobName", Some (entity_name_to_yojson x.model_card_export_job_name));
    ]

let describe_model_card_export_job_request_to_yojson (x : describe_model_card_export_job_request) =
  assoc_to_yojson
    [
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
    ]

let model_card_processing_status_to_yojson (x : model_card_processing_status) =
  match x with
  | DELETE_FAILED -> `String "DeleteFailed"
  | DELETE_COMPLETED -> `String "DeleteCompleted"
  | EXPORTJOBS_DELETED -> `String "ExportJobsDeleted"
  | CONTENT_DELETED -> `String "ContentDeleted"
  | DELETE_PENDING -> `String "DeletePending"
  | DELETE_INPROGRESS -> `String "DeleteInProgress"

let describe_model_card_response_to_yojson (x : describe_model_card_response) =
  assoc_to_yojson
    [
      ( "ModelCardProcessingStatus",
        option_to_yojson model_card_processing_status_to_yojson x.model_card_processing_status );
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", Some (user_context_to_yojson x.created_by));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("Content", Some (model_card_content_to_yojson x.content));
      ("ModelCardVersion", Some (integer_to_yojson x.model_card_version));
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
      ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn));
    ]

let describe_model_card_request_to_yojson (x : describe_model_card_request) =
  assoc_to_yojson
    [
      ("IncludedData", option_to_yojson included_data_to_yojson x.included_data);
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
    ]

let model_bias_baseline_config_to_yojson (x : model_bias_baseline_config) =
  assoc_to_yojson
    [
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
    ]

let model_bias_app_specification_to_yojson (x : model_bias_app_specification) =
  assoc_to_yojson
    [
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
      ("ConfigUri", Some (s3_uri_to_yojson x.config_uri));
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
    ]

let model_bias_job_input_to_yojson (x : model_bias_job_input) =
  assoc_to_yojson
    [
      ( "GroundTruthS3Input",
        Some (monitoring_ground_truth_s3_input_to_yojson x.ground_truth_s3_input) );
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
    ]

let describe_model_bias_job_definition_response_to_yojson
    (x : describe_model_bias_job_definition_response) =
  assoc_to_yojson
    [
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "ModelBiasJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_bias_job_output_config) );
      ("ModelBiasJobInput", Some (model_bias_job_input_to_yojson x.model_bias_job_input));
      ( "ModelBiasAppSpecification",
        Some (model_bias_app_specification_to_yojson x.model_bias_app_specification) );
      ( "ModelBiasBaselineConfig",
        option_to_yojson model_bias_baseline_config_to_yojson x.model_bias_baseline_config );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
    ]

let describe_model_bias_job_definition_request_to_yojson
    (x : describe_model_bias_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let describe_model_output_to_yojson (x : describe_model_output) =
  assoc_to_yojson
    [
      ( "DeploymentRecommendation",
        option_to_yojson deployment_recommendation_to_yojson x.deployment_recommendation );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("ModelArn", Some (model_arn_to_yojson x.model_arn));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ( "InferenceExecutionConfig",
        option_to_yojson inference_execution_config_to_yojson x.inference_execution_config );
      ("Containers", option_to_yojson container_definition_list_to_yojson x.containers);
      ("PrimaryContainer", option_to_yojson container_definition_to_yojson x.primary_container);
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let describe_model_input_to_yojson (x : describe_model_input) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let describe_mlflow_tracking_server_response_to_yojson
    (x : describe_mlflow_tracking_server_response) =
  assoc_to_yojson
    [
      ( "S3BucketOwnerVerification",
        option_to_yojson boolean__to_yojson x.s3_bucket_owner_verification );
      ("S3BucketOwnerAccountId", option_to_yojson account_id_to_yojson x.s3_bucket_owner_account_id);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "AutomaticModelRegistration",
        option_to_yojson boolean__to_yojson x.automatic_model_registration );
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ("TrackingServerUrl", option_to_yojson tracking_server_url_to_yojson x.tracking_server_url);
      ("IsActive", option_to_yojson is_tracking_server_active_to_yojson x.is_active);
      ( "TrackingServerMaintenanceStatus",
        option_to_yojson tracking_server_maintenance_status_to_yojson
          x.tracking_server_maintenance_status );
      ( "TrackingServerStatus",
        option_to_yojson tracking_server_status_to_yojson x.tracking_server_status );
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("TrackingServerSize", option_to_yojson tracking_server_size_to_yojson x.tracking_server_size);
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ("TrackingServerName", option_to_yojson tracking_server_name_to_yojson x.tracking_server_name);
      ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn);
    ]

let describe_mlflow_tracking_server_request_to_yojson (x : describe_mlflow_tracking_server_request)
    =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let maintenance_status_to_yojson (x : maintenance_status) =
  match x with
  | MAINTENANCE_FAILED -> `String "MaintenanceFailed"
  | MAINTENANCE_COMPLETE -> `String "MaintenanceComplete"
  | MAINTENANCE_IN_PROGRESS -> `String "MaintenanceInProgress"

let describe_mlflow_app_response_to_yojson (x : describe_mlflow_app_response) =
  assoc_to_yojson
    [
      ("MaintenanceStatus", option_to_yojson maintenance_status_to_yojson x.maintenance_status);
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "DefaultDomainIdList",
        option_to_yojson default_domain_id_list_to_yojson x.default_domain_id_list );
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
      ( "ModelRegistrationMode",
        option_to_yojson model_registration_mode_to_yojson x.model_registration_mode );
      ("Status", option_to_yojson mlflow_app_status_to_yojson x.status);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("ArtifactStoreUri", option_to_yojson s3_uri_to_yojson x.artifact_store_uri);
      ("Name", option_to_yojson mlflow_app_name_to_yojson x.name);
      ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn);
    ]

let describe_mlflow_app_request_to_yojson (x : describe_mlflow_app_request) =
  assoc_to_yojson [ ("Arn", Some (mlflow_app_arn_to_yojson x.arn)) ]

let describe_lineage_group_response_to_yojson (x : describe_lineage_group_response) =
  assoc_to_yojson
    [
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("LineageGroupName", option_to_yojson experiment_entity_name_to_yojson x.lineage_group_name);
    ]

let describe_lineage_group_request_to_yojson (x : describe_lineage_group_request) =
  assoc_to_yojson
    [ ("LineageGroupName", Some (experiment_entity_name_to_yojson x.lineage_group_name)) ]

let label_attribute_name_to_yojson = string_to_yojson

let labeling_job_output_config_to_yojson (x : labeling_job_output_config) =
  assoc_to_yojson
    [
      ("SnsTopicArn", option_to_yojson sns_topic_arn_to_yojson x.sns_topic_arn);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
    ]

let max_human_labeled_object_count_to_yojson = int_to_yojson
let max_percentage_of_input_dataset_labeled_to_yojson = int_to_yojson

let labeling_job_stopping_conditions_to_yojson (x : labeling_job_stopping_conditions) =
  assoc_to_yojson
    [
      ( "MaxPercentageOfInputDatasetLabeled",
        option_to_yojson max_percentage_of_input_dataset_labeled_to_yojson
          x.max_percentage_of_input_dataset_labeled );
      ( "MaxHumanLabeledObjectCount",
        option_to_yojson max_human_labeled_object_count_to_yojson x.max_human_labeled_object_count
      );
    ]

let labeling_job_algorithm_specification_arn_to_yojson = string_to_yojson

let labeling_job_resource_config_to_yojson (x : labeling_job_resource_config) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
    ]

let labeling_job_algorithms_config_to_yojson (x : labeling_job_algorithms_config) =
  assoc_to_yojson
    [
      ( "LabelingJobResourceConfig",
        option_to_yojson labeling_job_resource_config_to_yojson x.labeling_job_resource_config );
      ( "InitialActiveLearningModelArn",
        option_to_yojson model_arn_to_yojson x.initial_active_learning_model_arn );
      ( "LabelingJobAlgorithmSpecificationArn",
        Some
          (labeling_job_algorithm_specification_arn_to_yojson
             x.labeling_job_algorithm_specification_arn) );
    ]

let max_concurrent_task_count_to_yojson = int_to_yojson

let annotation_consolidation_config_to_yojson (x : annotation_consolidation_config) =
  assoc_to_yojson
    [
      ( "AnnotationConsolidationLambdaArn",
        Some (lambda_function_arn_to_yojson x.annotation_consolidation_lambda_arn) );
    ]

let public_workforce_task_price_to_yojson (x : public_workforce_task_price) =
  assoc_to_yojson [ ("AmountInUsd", option_to_yojson us_d_to_yojson x.amount_in_usd) ]

let human_task_config_to_yojson (x : human_task_config) =
  assoc_to_yojson
    [
      ( "PublicWorkforceTaskPrice",
        option_to_yojson public_workforce_task_price_to_yojson x.public_workforce_task_price );
      ( "AnnotationConsolidationConfig",
        option_to_yojson annotation_consolidation_config_to_yojson x.annotation_consolidation_config
      );
      ( "MaxConcurrentTaskCount",
        option_to_yojson max_concurrent_task_count_to_yojson x.max_concurrent_task_count );
      ( "TaskAvailabilityLifetimeInSeconds",
        option_to_yojson task_availability_lifetime_in_seconds_to_yojson
          x.task_availability_lifetime_in_seconds );
      ( "TaskTimeLimitInSeconds",
        Some (task_time_limit_in_seconds_to_yojson x.task_time_limit_in_seconds) );
      ( "NumberOfHumanWorkersPerDataObject",
        Some
          (number_of_human_workers_per_data_object_to_yojson
             x.number_of_human_workers_per_data_object) );
      ("TaskDescription", Some (task_description_to_yojson x.task_description));
      ("TaskTitle", Some (task_title_to_yojson x.task_title));
      ("TaskKeywords", option_to_yojson task_keywords_to_yojson x.task_keywords);
      ( "PreHumanTaskLambdaArn",
        option_to_yojson lambda_function_arn_to_yojson x.pre_human_task_lambda_arn );
      ("UiConfig", Some (ui_config_to_yojson x.ui_config));
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
    ]

let describe_labeling_job_response_to_yojson (x : describe_labeling_job_response) =
  assoc_to_yojson
    [
      ("LabelingJobOutput", option_to_yojson labeling_job_output_to_yojson x.labeling_job_output);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("HumanTaskConfig", Some (human_task_config_to_yojson x.human_task_config));
      ( "LabelingJobAlgorithmsConfig",
        option_to_yojson labeling_job_algorithms_config_to_yojson x.labeling_job_algorithms_config
      );
      ( "StoppingConditions",
        option_to_yojson labeling_job_stopping_conditions_to_yojson x.stopping_conditions );
      ("LabelCategoryConfigS3Uri", option_to_yojson s3_uri_to_yojson x.label_category_config_s3_uri);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OutputConfig", Some (labeling_job_output_config_to_yojson x.output_config));
      ("InputConfig", Some (labeling_job_input_config_to_yojson x.input_config));
      ("LabelAttributeName", option_to_yojson label_attribute_name_to_yojson x.label_attribute_name);
      ("LabelingJobArn", Some (labeling_job_arn_to_yojson x.labeling_job_arn));
      ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name));
      ("JobReferenceCode", Some (job_reference_code_to_yojson x.job_reference_code));
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LabelCounters", Some (label_counters_to_yojson x.label_counters));
      ("LabelingJobStatus", Some (labeling_job_status_to_yojson x.labeling_job_status));
    ]

let describe_labeling_job_request_to_yojson (x : describe_labeling_job_request) =
  assoc_to_yojson [ ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name)) ]

let describe_job_schema_version_response_to_yojson (x : describe_job_schema_version_response) =
  assoc_to_yojson
    [
      ("JobConfigSchema", Some (job_config_document_to_yojson x.job_config_schema));
      ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
    ]

let describe_job_schema_version_request_to_yojson (x : describe_job_schema_version_request) =
  assoc_to_yojson
    [
      ( "JobConfigSchemaVersion",
        option_to_yojson job_schema_version_to_yojson x.job_config_schema_version );
      ("JobCategory", Some (job_category_to_yojson x.job_category));
    ]

let describe_job_response_to_yojson (x : describe_job_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "SecondaryStatusTransitions",
        Some (job_secondary_status_transitions_to_yojson x.secondary_status_transitions) );
      ("SecondaryStatus", Some (job_secondary_status_to_yojson x.secondary_status));
      ("JobStatus", Some (job_status_to_yojson x.job_status));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("JobConfigDocument", option_to_yojson job_config_document_to_yojson x.job_config_document);
      ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("JobArn", Some (job_arn_to_yojson x.job_arn));
      ("JobName", Some (job_name_to_yojson x.job_name));
    ]

let describe_job_request_to_yojson (x : describe_job_request) =
  assoc_to_yojson
    [
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobName", Some (job_name_to_yojson x.job_name));
    ]

let job_duration_in_seconds_to_yojson = int_to_yojson
let max_number_of_tests_to_yojson = int_to_yojson
let max_parallel_of_tests_to_yojson = int_to_yojson

let recommendation_job_resource_limit_to_yojson (x : recommendation_job_resource_limit) =
  assoc_to_yojson
    [
      ( "MaxParallelOfTests",
        option_to_yojson max_parallel_of_tests_to_yojson x.max_parallel_of_tests );
      ("MaxNumberOfTests", option_to_yojson max_number_of_tests_to_yojson x.max_number_of_tests);
    ]

let categorical_parameter_range_values_to_yojson tree = list_to_yojson string128_to_yojson tree

let categorical_parameter_to_yojson (x : categorical_parameter) =
  assoc_to_yojson
    [
      ("Value", Some (categorical_parameter_range_values_to_yojson x.value));
      ("Name", Some (string64_to_yojson x.name));
    ]

let categorical_parameters_to_yojson tree = list_to_yojson categorical_parameter_to_yojson tree

let environment_parameter_ranges_to_yojson (x : environment_parameter_ranges) =
  assoc_to_yojson
    [
      ( "CategoricalParameterRanges",
        option_to_yojson categorical_parameters_to_yojson x.categorical_parameter_ranges );
    ]

let endpoint_input_configuration_to_yojson (x : endpoint_input_configuration) =
  assoc_to_yojson
    [
      ( "EnvironmentParameterRanges",
        option_to_yojson environment_parameter_ranges_to_yojson x.environment_parameter_ranges );
      ( "InferenceSpecificationName",
        option_to_yojson inference_specification_name_to_yojson x.inference_specification_name );
      ( "ServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.serverless_config );
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
    ]

let endpoint_input_configurations_to_yojson tree =
  list_to_yojson endpoint_input_configuration_to_yojson tree

let recommendation_job_framework_version_to_yojson = string_to_yojson
let recommendation_job_supported_content_type_to_yojson = string_to_yojson

let recommendation_job_supported_content_types_to_yojson tree =
  list_to_yojson recommendation_job_supported_content_type_to_yojson tree

let recommendation_job_payload_config_to_yojson (x : recommendation_job_payload_config) =
  assoc_to_yojson
    [
      ( "SupportedContentTypes",
        option_to_yojson recommendation_job_supported_content_types_to_yojson
          x.supported_content_types );
      ("SamplePayloadUrl", option_to_yojson s3_uri_to_yojson x.sample_payload_url);
    ]

let recommendation_job_supported_instance_types_to_yojson tree =
  list_to_yojson string__to_yojson tree

let recommendation_job_supported_endpoint_type_to_yojson
    (x : recommendation_job_supported_endpoint_type) =
  match x with SERVERLESS -> `String "Serverless" | REALTIME -> `String "RealTime"

let recommendation_job_data_input_config_to_yojson = string_to_yojson
let recommendation_job_supported_response_mime_type_to_yojson = string_to_yojson

let recommendation_job_supported_response_mime_types_to_yojson tree =
  list_to_yojson recommendation_job_supported_response_mime_type_to_yojson tree

let recommendation_job_container_config_to_yojson (x : recommendation_job_container_config) =
  assoc_to_yojson
    [
      ( "SupportedResponseMIMETypes",
        option_to_yojson recommendation_job_supported_response_mime_types_to_yojson
          x.supported_response_mime_types );
      ( "DataInputConfig",
        option_to_yojson recommendation_job_data_input_config_to_yojson x.data_input_config );
      ( "SupportedEndpointType",
        option_to_yojson recommendation_job_supported_endpoint_type_to_yojson
          x.supported_endpoint_type );
      ( "SupportedInstanceTypes",
        option_to_yojson recommendation_job_supported_instance_types_to_yojson
          x.supported_instance_types );
      ("NearestModelName", option_to_yojson string__to_yojson x.nearest_model_name);
      ( "PayloadConfig",
        option_to_yojson recommendation_job_payload_config_to_yojson x.payload_config );
      ( "FrameworkVersion",
        option_to_yojson recommendation_job_framework_version_to_yojson x.framework_version );
      ("Framework", option_to_yojson string__to_yojson x.framework);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("Domain", option_to_yojson string__to_yojson x.domain);
    ]

let endpoint_info_to_yojson (x : endpoint_info) =
  assoc_to_yojson [ ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name) ]

let endpoints_to_yojson tree = list_to_yojson endpoint_info_to_yojson tree
let recommendation_job_vpc_security_group_id_to_yojson = string_to_yojson

let recommendation_job_vpc_security_group_ids_to_yojson tree =
  list_to_yojson recommendation_job_vpc_security_group_id_to_yojson tree

let recommendation_job_vpc_subnet_id_to_yojson = string_to_yojson

let recommendation_job_vpc_subnets_to_yojson tree =
  list_to_yojson recommendation_job_vpc_subnet_id_to_yojson tree

let recommendation_job_vpc_config_to_yojson (x : recommendation_job_vpc_config) =
  assoc_to_yojson
    [
      ("Subnets", Some (recommendation_job_vpc_subnets_to_yojson x.subnets));
      ( "SecurityGroupIds",
        Some (recommendation_job_vpc_security_group_ids_to_yojson x.security_group_ids) );
    ]

let recommendation_job_input_config_to_yojson (x : recommendation_job_input_config) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson recommendation_job_vpc_config_to_yojson x.vpc_config);
      ("Endpoints", option_to_yojson endpoints_to_yojson x.endpoints);
      ( "ContainerConfig",
        option_to_yojson recommendation_job_container_config_to_yojson x.container_config );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
      ( "EndpointConfigurations",
        option_to_yojson endpoint_input_configurations_to_yojson x.endpoint_configurations );
      ( "ResourceLimit",
        option_to_yojson recommendation_job_resource_limit_to_yojson x.resource_limit );
      ("TrafficPattern", option_to_yojson traffic_pattern_to_yojson x.traffic_pattern);
      ( "JobDurationInSeconds",
        option_to_yojson job_duration_in_seconds_to_yojson x.job_duration_in_seconds );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
    ]

let model_latency_threshold_to_yojson (x : model_latency_threshold) =
  assoc_to_yojson
    [
      ("ValueInMilliseconds", option_to_yojson integer_to_yojson x.value_in_milliseconds);
      ("Percentile", option_to_yojson string64_to_yojson x.percentile);
    ]

let model_latency_thresholds_to_yojson tree = list_to_yojson model_latency_threshold_to_yojson tree

let flat_invocations_to_yojson (x : flat_invocations) =
  match x with STOP -> `String "Stop" | CONTINUE -> `String "Continue"

let recommendation_job_stopping_conditions_to_yojson (x : recommendation_job_stopping_conditions) =
  assoc_to_yojson
    [
      ("FlatInvocations", option_to_yojson flat_invocations_to_yojson x.flat_invocations);
      ( "ModelLatencyThresholds",
        option_to_yojson model_latency_thresholds_to_yojson x.model_latency_thresholds );
      ("MaxInvocations", option_to_yojson integer_to_yojson x.max_invocations);
    ]

let inference_recommendation_to_yojson (x : inference_recommendation) =
  assoc_to_yojson
    [
      ( "InvocationStartTime",
        option_to_yojson invocation_start_time_to_yojson x.invocation_start_time );
      ("InvocationEndTime", option_to_yojson invocation_end_time_to_yojson x.invocation_end_time);
      ("ModelConfiguration", Some (model_configuration_to_yojson x.model_configuration));
      ( "EndpointConfiguration",
        Some (endpoint_output_configuration_to_yojson x.endpoint_configuration) );
      ("Metrics", option_to_yojson recommendation_metrics_to_yojson x.metrics);
      ("RecommendationId", option_to_yojson string__to_yojson x.recommendation_id);
    ]

let inference_recommendations_to_yojson tree =
  list_to_yojson inference_recommendation_to_yojson tree

let endpoint_performance_to_yojson (x : endpoint_performance) =
  assoc_to_yojson
    [
      ("EndpointInfo", Some (endpoint_info_to_yojson x.endpoint_info));
      ("Metrics", Some (inference_metrics_to_yojson x.metrics));
    ]

let endpoint_performances_to_yojson tree = list_to_yojson endpoint_performance_to_yojson tree

let describe_inference_recommendations_job_response_to_yojson
    (x : describe_inference_recommendations_job_response) =
  assoc_to_yojson
    [
      ( "EndpointPerformances",
        option_to_yojson endpoint_performances_to_yojson x.endpoint_performances );
      ( "InferenceRecommendations",
        option_to_yojson inference_recommendations_to_yojson x.inference_recommendations );
      ( "StoppingConditions",
        option_to_yojson recommendation_job_stopping_conditions_to_yojson x.stopping_conditions );
      ("InputConfig", Some (recommendation_job_input_config_to_yojson x.input_config));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("Status", Some (recommendation_job_status_to_yojson x.status));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("JobArn", Some (recommendation_job_arn_to_yojson x.job_arn));
      ("JobType", Some (recommendation_job_type_to_yojson x.job_type));
      ("JobDescription", option_to_yojson recommendation_job_description_to_yojson x.job_description);
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
    ]

let describe_inference_recommendations_job_request_to_yojson
    (x : describe_inference_recommendations_job_request) =
  assoc_to_yojson [ ("JobName", Some (recommendation_job_name_to_yojson x.job_name)) ]

let endpoint_metadata_to_yojson (x : endpoint_metadata) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("EndpointStatus", option_to_yojson endpoint_status_to_yojson x.endpoint_status);
      ("EndpointConfigName", option_to_yojson endpoint_config_name_to_yojson x.endpoint_config_name);
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let model_variant_status_to_yojson (x : model_variant_status) =
  match x with
  | DELETED -> `String "Deleted"
  | DELETING -> `String "Deleting"
  | IN_SERVICE -> `String "InService"
  | UPDATING -> `String "Updating"
  | CREATING -> `String "Creating"

let model_variant_config_summary_to_yojson (x : model_variant_config_summary) =
  assoc_to_yojson
    [
      ("Status", Some (model_variant_status_to_yojson x.status));
      ("InfrastructureConfig", Some (model_infrastructure_config_to_yojson x.infrastructure_config));
      ("VariantName", Some (model_variant_name_to_yojson x.variant_name));
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let model_variant_config_summary_list_to_yojson tree =
  list_to_yojson model_variant_config_summary_to_yojson tree

let describe_inference_experiment_response_to_yojson (x : describe_inference_experiment_response) =
  assoc_to_yojson
    [
      ("KmsKey", option_to_yojson kms_key_id_to_yojson x.kms_key);
      ("ShadowModeConfig", option_to_yojson shadow_mode_config_to_yojson x.shadow_mode_config);
      ( "DataStorageConfig",
        option_to_yojson inference_experiment_data_storage_config_to_yojson x.data_storage_config );
      ("ModelVariants", Some (model_variant_config_summary_list_to_yojson x.model_variants));
      ("EndpointMetadata", Some (endpoint_metadata_to_yojson x.endpoint_metadata));
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CompletionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("StatusReason", option_to_yojson inference_experiment_status_reason_to_yojson x.status_reason);
      ("Status", Some (inference_experiment_status_to_yojson x.status));
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Type", Some (inference_experiment_type_to_yojson x.type_));
      ("Name", Some (inference_experiment_name_to_yojson x.name));
      ("Arn", Some (inference_experiment_arn_to_yojson x.arn));
    ]

let describe_inference_experiment_request_to_yojson (x : describe_inference_experiment_request) =
  assoc_to_yojson [ ("Name", Some (inference_experiment_name_to_yojson x.name)) ]

let inference_component_container_specification_summary_to_yojson
    (x : inference_component_container_specification_summary) =
  assoc_to_yojson
    [
      ( "ContainerMetricsConfig",
        option_to_yojson container_metrics_config_to_yojson x.container_metrics_config );
      ("Environment", option_to_yojson environment_map_to_yojson x.environment);
      ("ArtifactUrl", option_to_yojson url_to_yojson x.artifact_url);
      ("DeployedImage", option_to_yojson deployed_image_to_yojson x.deployed_image);
    ]

let inference_component_data_cache_config_summary_to_yojson
    (x : inference_component_data_cache_config_summary) =
  assoc_to_yojson [ ("EnableCaching", Some (enable_caching_to_yojson x.enable_caching)) ]

let inference_component_specification_summary_to_yojson
    (x : inference_component_specification_summary) =
  assoc_to_yojson
    [
      ( "SchedulingConfig",
        option_to_yojson inference_component_scheduling_config_to_yojson x.scheduling_config );
      ( "DataCacheConfig",
        option_to_yojson inference_component_data_cache_config_summary_to_yojson x.data_cache_config
      );
      ( "BaseInferenceComponentName",
        option_to_yojson inference_component_name_to_yojson x.base_inference_component_name );
      ( "ComputeResourceRequirements",
        option_to_yojson inference_component_compute_resource_requirements_to_yojson
          x.compute_resource_requirements );
      ( "StartupParameters",
        option_to_yojson inference_component_startup_parameters_to_yojson x.startup_parameters );
      ( "Container",
        option_to_yojson inference_component_container_specification_summary_to_yojson x.container
      );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
    ]

let inference_component_specification_summary_list_to_yojson tree =
  list_to_yojson inference_component_specification_summary_to_yojson tree

let inference_component_placement_status_to_yojson (x : inference_component_placement_status) =
  assoc_to_yojson
    [
      ("CurrentCopyCount", Some (inference_component_copy_count_to_yojson x.current_copy_count));
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
    ]

let inference_component_placement_status_list_to_yojson tree =
  list_to_yojson inference_component_placement_status_to_yojson tree

let inference_component_runtime_config_summary_to_yojson
    (x : inference_component_runtime_config_summary) =
  assoc_to_yojson
    [
      ( "PlacementStatus",
        option_to_yojson inference_component_placement_status_list_to_yojson x.placement_status );
      ( "CurrentCopyCount",
        option_to_yojson inference_component_copy_count_to_yojson x.current_copy_count );
      ( "DesiredCopyCount",
        option_to_yojson inference_component_copy_count_to_yojson x.desired_copy_count );
    ]

let describe_inference_component_output_to_yojson (x : describe_inference_component_output) =
  assoc_to_yojson
    [
      ( "LastDeploymentConfig",
        option_to_yojson inference_component_deployment_config_to_yojson x.last_deployment_config );
      ( "InferenceComponentStatus",
        option_to_yojson inference_component_status_to_yojson x.inference_component_status );
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "RuntimeConfig",
        option_to_yojson inference_component_runtime_config_summary_to_yojson x.runtime_config );
      ( "Specifications",
        option_to_yojson inference_component_specification_summary_list_to_yojson x.specifications
      );
      ( "Specification",
        option_to_yojson inference_component_specification_summary_to_yojson x.specification );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("VariantName", option_to_yojson variant_name_to_yojson x.variant_name);
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let describe_inference_component_input_to_yojson (x : describe_inference_component_input) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let image_base_image_to_yojson = string_to_yojson
let image_container_image_to_yojson = string_to_yojson

let describe_image_version_response_to_yojson (x : describe_image_version_response) =
  assoc_to_yojson
    [
      ("ReleaseNotes", option_to_yojson release_notes_to_yojson x.release_notes);
      ("Horovod", option_to_yojson horovod_to_yojson x.horovod);
      ("Processor", option_to_yojson processor_to_yojson x.processor);
      ("ProgrammingLang", option_to_yojson programming_lang_to_yojson x.programming_lang);
      ("MLFramework", option_to_yojson ml_framework_to_yojson x.ml_framework);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("VendorGuidance", option_to_yojson vendor_guidance_to_yojson x.vendor_guidance);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ImageVersionStatus", option_to_yojson image_version_status_to_yojson x.image_version_status);
      ("ImageVersionArn", option_to_yojson image_version_arn_to_yojson x.image_version_arn);
      ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ContainerImage", option_to_yojson image_container_image_to_yojson x.container_image);
      ("BaseImage", option_to_yojson image_base_image_to_yojson x.base_image);
    ]

let describe_image_version_request_to_yojson (x : describe_image_version_request) =
  assoc_to_yojson
    [
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("ImageName", Some (image_name_to_yojson x.image_name));
    ]

let describe_image_response_to_yojson (x : describe_image_response) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("ImageStatus", option_to_yojson image_status_to_yojson x.image_status);
      ("ImageName", option_to_yojson image_name_to_yojson x.image_name);
      ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson image_description_to_yojson x.description);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let describe_image_request_to_yojson (x : describe_image_request) =
  assoc_to_yojson [ ("ImageName", Some (image_name_to_yojson x.image_name)) ]

let autotune_mode_to_yojson (x : autotune_mode) = match x with ENABLED -> `String "Enabled"

let autotune_to_yojson (x : autotune) =
  assoc_to_yojson [ ("Mode", Some (autotune_mode_to_yojson x.mode)) ]

let describe_hyper_parameter_tuning_job_response_to_yojson
    (x : describe_hyper_parameter_tuning_job_response) =
  assoc_to_yojson
    [
      ( "ConsumedResources",
        option_to_yojson hyper_parameter_tuning_job_consumed_resources_to_yojson
          x.consumed_resources );
      ( "TuningJobCompletionDetails",
        option_to_yojson hyper_parameter_tuning_job_completion_details_to_yojson
          x.tuning_job_completion_details );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Autotune", option_to_yojson autotune_to_yojson x.autotune);
      ( "WarmStartConfig",
        option_to_yojson hyper_parameter_tuning_job_warm_start_config_to_yojson x.warm_start_config
      );
      ( "OverallBestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.overall_best_training_job
      );
      ( "BestTrainingJob",
        option_to_yojson hyper_parameter_training_job_summary_to_yojson x.best_training_job );
      ( "ObjectiveStatusCounters",
        Some (objective_status_counters_to_yojson x.objective_status_counters) );
      ( "TrainingJobStatusCounters",
        Some (training_job_status_counters_to_yojson x.training_job_status_counters) );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ( "HyperParameterTuningEndTime",
        option_to_yojson timestamp_to_yojson x.hyper_parameter_tuning_end_time );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "HyperParameterTuningJobStatus",
        Some (hyper_parameter_tuning_job_status_to_yojson x.hyper_parameter_tuning_job_status) );
      ( "TrainingJobDefinitions",
        option_to_yojson hyper_parameter_training_job_definitions_to_yojson
          x.training_job_definitions );
      ( "TrainingJobDefinition",
        option_to_yojson hyper_parameter_training_job_definition_to_yojson x.training_job_definition
      );
      ( "HyperParameterTuningJobConfig",
        Some (hyper_parameter_tuning_job_config_to_yojson x.hyper_parameter_tuning_job_config) );
      ( "HyperParameterTuningJobArn",
        Some (hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn) );
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let describe_hyper_parameter_tuning_job_request_to_yojson
    (x : describe_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let human_task_ui_status_to_yojson (x : human_task_ui_status) =
  match x with DELETING -> `String "Deleting" | ACTIVE -> `String "Active"

let describe_human_task_ui_response_to_yojson (x : describe_human_task_ui_response) =
  assoc_to_yojson
    [
      ("UiTemplate", Some (ui_template_info_to_yojson x.ui_template));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("HumanTaskUiStatus", option_to_yojson human_task_ui_status_to_yojson x.human_task_ui_status);
      ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name));
      ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn));
    ]

let describe_human_task_ui_request_to_yojson (x : describe_human_task_ui_request) =
  assoc_to_yojson [ ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name)) ]

let reference_min_version_to_yojson = string_to_yojson
let dependency_origin_path_to_yojson = string_to_yojson
let dependency_copy_path_to_yojson = string_to_yojson

let hub_content_dependency_to_yojson (x : hub_content_dependency) =
  assoc_to_yojson
    [
      ("DependencyCopyPath", option_to_yojson dependency_copy_path_to_yojson x.dependency_copy_path);
      ( "DependencyOriginPath",
        option_to_yojson dependency_origin_path_to_yojson x.dependency_origin_path );
    ]

let hub_content_dependency_list_to_yojson tree =
  list_to_yojson hub_content_dependency_to_yojson tree

let describe_hub_content_response_to_yojson (x : describe_hub_content_response) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("HubContentStatus", Some (hub_content_status_to_yojson x.hub_content_status));
      ( "HubContentDependencies",
        option_to_yojson hub_content_dependency_list_to_yojson x.hub_content_dependencies );
      ( "HubContentSearchKeywords",
        option_to_yojson hub_content_search_keyword_list_to_yojson x.hub_content_search_keywords );
      ("SupportStatus", option_to_yojson hub_content_support_status_to_yojson x.support_status);
      ( "ReferenceMinVersion",
        option_to_yojson reference_min_version_to_yojson x.reference_min_version );
      ( "SageMakerPublicHubContentArn",
        option_to_yojson sage_maker_public_hub_content_arn_to_yojson
          x.sage_maker_public_hub_content_arn );
      ("HubContentDocument", Some (hub_content_document_to_yojson x.hub_content_document));
      ("HubContentMarkdown", option_to_yojson hub_content_markdown_to_yojson x.hub_content_markdown);
      ( "HubContentDescription",
        option_to_yojson hub_content_description_to_yojson x.hub_content_description );
      ( "HubContentDisplayName",
        option_to_yojson hub_content_display_name_to_yojson x.hub_content_display_name );
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubName", Some (hub_name_to_yojson x.hub_name));
      ("DocumentSchemaVersion", Some (document_schema_version_to_yojson x.document_schema_version));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
    ]

let describe_hub_content_request_to_yojson (x : describe_hub_content_request) =
  assoc_to_yojson
    [
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let s3_output_path_to_yojson = string_to_yojson

let hub_s3_storage_config_to_yojson (x : hub_s3_storage_config) =
  assoc_to_yojson [ ("S3OutputPath", option_to_yojson s3_output_path_to_yojson x.s3_output_path) ]

let describe_hub_response_to_yojson (x : describe_hub_response) =
  assoc_to_yojson
    [
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("HubStatus", Some (hub_status_to_yojson x.hub_status));
      ("S3StorageConfig", option_to_yojson hub_s3_storage_config_to_yojson x.s3_storage_config);
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
      ("HubDescription", option_to_yojson hub_description_to_yojson x.hub_description);
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
      ("HubName", Some (hub_name_to_yojson x.hub_name));
    ]

let describe_hub_request_to_yojson (x : describe_hub_request) =
  assoc_to_yojson [ ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name)) ]

let aws_managed_human_loop_request_source_to_yojson (x : aws_managed_human_loop_request_source) =
  match x with
  | TEXTRACT_ANALYZE_DOCUMENT_FORMS_V1 -> `String "AWS/Textract/AnalyzeDocument/Forms/V1"
  | REKOGNITION_DETECT_MODERATION_LABELS_IMAGE_V3 ->
      `String "AWS/Rekognition/DetectModerationLabels/Image/V3"

let human_loop_request_source_to_yojson (x : human_loop_request_source) =
  assoc_to_yojson
    [
      ( "AwsManagedHumanLoopRequestSource",
        Some
          (aws_managed_human_loop_request_source_to_yojson x.aws_managed_human_loop_request_source)
      );
    ]

let human_loop_activation_conditions_to_yojson = string_to_yojson

let human_loop_activation_conditions_config_to_yojson (x : human_loop_activation_conditions_config)
    =
  assoc_to_yojson
    [
      ( "HumanLoopActivationConditions",
        Some (human_loop_activation_conditions_to_yojson x.human_loop_activation_conditions) );
    ]

let human_loop_activation_config_to_yojson (x : human_loop_activation_config) =
  assoc_to_yojson
    [
      ( "HumanLoopActivationConditionsConfig",
        Some
          (human_loop_activation_conditions_config_to_yojson
             x.human_loop_activation_conditions_config) );
    ]

let flow_definition_task_title_to_yojson = string_to_yojson
let flow_definition_task_description_to_yojson = string_to_yojson
let flow_definition_task_count_to_yojson = int_to_yojson
let flow_definition_task_availability_lifetime_in_seconds_to_yojson = int_to_yojson
let flow_definition_task_time_limit_in_seconds_to_yojson = int_to_yojson
let flow_definition_task_keyword_to_yojson = string_to_yojson

let flow_definition_task_keywords_to_yojson tree =
  list_to_yojson flow_definition_task_keyword_to_yojson tree

let human_loop_config_to_yojson (x : human_loop_config) =
  assoc_to_yojson
    [
      ( "PublicWorkforceTaskPrice",
        option_to_yojson public_workforce_task_price_to_yojson x.public_workforce_task_price );
      ("TaskKeywords", option_to_yojson flow_definition_task_keywords_to_yojson x.task_keywords);
      ( "TaskTimeLimitInSeconds",
        option_to_yojson flow_definition_task_time_limit_in_seconds_to_yojson
          x.task_time_limit_in_seconds );
      ( "TaskAvailabilityLifetimeInSeconds",
        option_to_yojson flow_definition_task_availability_lifetime_in_seconds_to_yojson
          x.task_availability_lifetime_in_seconds );
      ("TaskCount", Some (flow_definition_task_count_to_yojson x.task_count));
      ("TaskDescription", Some (flow_definition_task_description_to_yojson x.task_description));
      ("TaskTitle", Some (flow_definition_task_title_to_yojson x.task_title));
      ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn));
      ("WorkteamArn", Some (workteam_arn_to_yojson x.workteam_arn));
    ]

let flow_definition_output_config_to_yojson (x : flow_definition_output_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
    ]

let describe_flow_definition_response_to_yojson (x : describe_flow_definition_response) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OutputConfig", Some (flow_definition_output_config_to_yojson x.output_config));
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ( "HumanLoopActivationConfig",
        option_to_yojson human_loop_activation_config_to_yojson x.human_loop_activation_config );
      ( "HumanLoopRequestSource",
        option_to_yojson human_loop_request_source_to_yojson x.human_loop_request_source );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FlowDefinitionStatus", Some (flow_definition_status_to_yojson x.flow_definition_status));
      ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name));
      ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn));
    ]

let describe_flow_definition_request_to_yojson (x : describe_flow_definition_request) =
  assoc_to_yojson
    [ ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name)) ]

let describe_feature_metadata_response_to_yojson (x : describe_feature_metadata_response) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson feature_parameters_to_yojson x.parameters);
      ("Description", option_to_yojson feature_description_to_yojson x.description);
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("FeatureType", Some (feature_type_to_yojson x.feature_type));
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
      ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn));
    ]

let describe_feature_metadata_request_to_yojson (x : describe_feature_metadata_request) =
  assoc_to_yojson
    [
      ("FeatureName", Some (feature_name_to_yojson x.feature_name));
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
    ]

let online_store_total_size_bytes_to_yojson = long_to_yojson

let describe_feature_group_response_to_yojson (x : describe_feature_group_response) =
  assoc_to_yojson
    [
      ( "OnlineStoreTotalSizeBytes",
        option_to_yojson online_store_total_size_bytes_to_yojson x.online_store_total_size_bytes );
      ("NextToken", Some (next_token_to_yojson x.next_token));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LastUpdateStatus", option_to_yojson last_update_status_to_yojson x.last_update_status);
      ("OfflineStoreStatus", option_to_yojson offline_store_status_to_yojson x.offline_store_status);
      ("FeatureGroupStatus", option_to_yojson feature_group_status_to_yojson x.feature_group_status);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "ThroughputConfig",
        option_to_yojson throughput_config_description_to_yojson x.throughput_config );
      ("OfflineStoreConfig", option_to_yojson offline_store_config_to_yojson x.offline_store_config);
      ("OnlineStoreConfig", option_to_yojson online_store_config_to_yojson x.online_store_config);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("FeatureDefinitions", Some (feature_definitions_to_yojson x.feature_definitions));
      ("EventTimeFeatureName", Some (feature_name_to_yojson x.event_time_feature_name));
      ("RecordIdentifierFeatureName", Some (feature_name_to_yojson x.record_identifier_feature_name));
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
      ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn));
    ]

let describe_feature_group_request_to_yojson (x : describe_feature_group_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FeatureGroupName", Some (feature_group_name_or_arn_to_yojson x.feature_group_name));
    ]

let describe_experiment_response_to_yojson (x : describe_experiment_response) =
  assoc_to_yojson
    [
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("Source", option_to_yojson experiment_source_to_yojson x.source);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn);
      ("ExperimentName", option_to_yojson experiment_entity_name_to_yojson x.experiment_name);
    ]

let describe_experiment_request_to_yojson (x : describe_experiment_request) =
  assoc_to_yojson [ ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name)) ]

let initial_task_count_to_yojson = int_to_yojson
let instance_pool_priority_to_yojson = int_to_yojson

let instance_pool_to_yojson (x : instance_pool) =
  assoc_to_yojson
    [
      ("Priority", Some (instance_pool_priority_to_yojson x.priority));
      ("ModelNameOverride", option_to_yojson model_name_to_yojson x.model_name_override);
      ("InstanceType", Some (production_variant_instance_type_to_yojson x.instance_type));
    ]

let instance_pool_list_to_yojson tree = list_to_yojson instance_pool_to_yojson tree

let production_variant_accelerator_type_to_yojson (x : production_variant_accelerator_type) =
  match x with
  | ML_EIA2_XLARGE -> `String "ml.eia2.xlarge"
  | ML_EIA2_LARGE -> `String "ml.eia2.large"
  | ML_EIA2_MEDIUM -> `String "ml.eia2.medium"
  | ML_EIA1_XLARGE -> `String "ml.eia1.xlarge"
  | ML_EIA1_LARGE -> `String "ml.eia1.large"
  | ML_EIA1_MEDIUM -> `String "ml.eia1.medium"

let production_variant_core_dump_config_to_yojson (x : production_variant_core_dump_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DestinationS3Uri", Some (destination_s3_uri_to_yojson x.destination_s3_uri));
    ]

let production_variant_volume_size_in_g_b_to_yojson = int_to_yojson
let production_variant_ssm_access_to_yojson = bool_to_yojson

let production_variant_inference_ami_version_to_yojson
    (x : production_variant_inference_ami_version) =
  match x with
  | AL2023_GPU_4_1 -> `String "al2023-ami-sagemaker-inference-gpu-4-1"
  | AL2_NEURON_2 -> `String "al2-ami-sagemaker-inference-neuron-2"
  | AL2_GPU_3_1 -> `String "al2-ami-sagemaker-inference-gpu-3-1"
  | AL2_GPU_2_1 -> `String "al2-ami-sagemaker-inference-gpu-2-1"
  | AL2_GPU_2 -> `String "al2-ami-sagemaker-inference-gpu-2"

let production_variant_capacity_reservation_config_to_yojson
    (x : production_variant_capacity_reservation_config) =
  assoc_to_yojson
    [
      ("MlReservationArn", option_to_yojson ml_reservation_arn_to_yojson x.ml_reservation_arn);
      ( "CapacityReservationPreference",
        option_to_yojson capacity_reservation_preference_to_yojson x.capacity_reservation_preference
      );
    ]

let production_variant_to_yojson (x : production_variant) =
  assoc_to_yojson
    [
      ( "CapacityReservationConfig",
        option_to_yojson production_variant_capacity_reservation_config_to_yojson
          x.capacity_reservation_config );
      ( "InferenceAmiVersion",
        option_to_yojson production_variant_inference_ami_version_to_yojson x.inference_ami_version
      );
      ( "RoutingConfig",
        option_to_yojson production_variant_routing_config_to_yojson x.routing_config );
      ( "ManagedInstanceScaling",
        option_to_yojson production_variant_managed_instance_scaling_to_yojson
          x.managed_instance_scaling );
      ( "EnableSSMAccess",
        option_to_yojson production_variant_ssm_access_to_yojson x.enable_ssm_access );
      ( "ContainerStartupHealthCheckTimeoutInSeconds",
        option_to_yojson
          production_variant_container_startup_health_check_timeout_in_seconds_to_yojson
          x.container_startup_health_check_timeout_in_seconds );
      ( "ModelDataDownloadTimeoutInSeconds",
        option_to_yojson production_variant_model_data_download_timeout_in_seconds_to_yojson
          x.model_data_download_timeout_in_seconds );
      ( "VolumeSizeInGB",
        option_to_yojson production_variant_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "ServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.serverless_config );
      ( "CoreDumpConfig",
        option_to_yojson production_variant_core_dump_config_to_yojson x.core_dump_config );
      ( "AcceleratorType",
        option_to_yojson production_variant_accelerator_type_to_yojson x.accelerator_type );
      ("InitialVariantWeight", option_to_yojson variant_weight_to_yojson x.initial_variant_weight);
      ( "VariantInstanceProvisionTimeoutInSeconds",
        option_to_yojson variant_instance_provision_timeout_in_seconds_to_yojson
          x.variant_instance_provision_timeout_in_seconds );
      ("InstancePools", option_to_yojson instance_pool_list_to_yojson x.instance_pools);
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ( "InitialInstanceCount",
        option_to_yojson initial_task_count_to_yojson x.initial_instance_count );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
    ]

let production_variant_list_to_yojson tree = list_to_yojson production_variant_to_yojson tree

let capture_mode_to_yojson (x : capture_mode) =
  match x with
  | INPUT_AND_OUTPUT -> `String "InputAndOutput"
  | OUTPUT -> `String "Output"
  | INPUT -> `String "Input"

let capture_option_to_yojson (x : capture_option) =
  assoc_to_yojson [ ("CaptureMode", Some (capture_mode_to_yojson x.capture_mode)) ]

let capture_option_list_to_yojson tree = list_to_yojson capture_option_to_yojson tree

let data_capture_config_to_yojson (x : data_capture_config) =
  assoc_to_yojson
    [
      ( "CaptureContentTypeHeader",
        option_to_yojson capture_content_type_header_to_yojson x.capture_content_type_header );
      ("CaptureOptions", Some (capture_option_list_to_yojson x.capture_options));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DestinationS3Uri", Some (destination_s3_uri_to_yojson x.destination_s3_uri));
      ( "InitialSamplingPercentage",
        Some (sampling_percentage_to_yojson x.initial_sampling_percentage) );
      ("EnableCapture", option_to_yojson enable_capture_to_yojson x.enable_capture);
    ]

let max_concurrent_invocations_per_instance_to_yojson = int_to_yojson

let async_inference_client_config_to_yojson (x : async_inference_client_config) =
  assoc_to_yojson
    [
      ( "MaxConcurrentInvocationsPerInstance",
        option_to_yojson max_concurrent_invocations_per_instance_to_yojson
          x.max_concurrent_invocations_per_instance );
    ]

let async_notification_topic_types_to_yojson (x : async_notification_topic_types) =
  match x with
  | ERROR_NOTIFICATION_TOPIC -> `String "ERROR_NOTIFICATION_TOPIC"
  | SUCCESS_NOTIFICATION_TOPIC -> `String "SUCCESS_NOTIFICATION_TOPIC"

let async_notification_topic_type_list_to_yojson tree =
  list_to_yojson async_notification_topic_types_to_yojson tree

let async_inference_notification_config_to_yojson (x : async_inference_notification_config) =
  assoc_to_yojson
    [
      ( "IncludeInferenceResponseIn",
        option_to_yojson async_notification_topic_type_list_to_yojson
          x.include_inference_response_in );
      ("ErrorTopic", option_to_yojson sns_topic_arn_to_yojson x.error_topic);
      ("SuccessTopic", option_to_yojson sns_topic_arn_to_yojson x.success_topic);
    ]

let async_inference_output_config_to_yojson (x : async_inference_output_config) =
  assoc_to_yojson
    [
      ("S3FailurePath", option_to_yojson destination_s3_uri_to_yojson x.s3_failure_path);
      ( "NotificationConfig",
        option_to_yojson async_inference_notification_config_to_yojson x.notification_config );
      ("S3OutputPath", option_to_yojson destination_s3_uri_to_yojson x.s3_output_path);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let async_inference_config_to_yojson (x : async_inference_config) =
  assoc_to_yojson
    [
      ("OutputConfig", Some (async_inference_output_config_to_yojson x.output_config));
      ("ClientConfig", option_to_yojson async_inference_client_config_to_yojson x.client_config);
    ]

let clarify_enable_explanations_to_yojson = string_to_yojson
let clarify_features_attribute_to_yojson = string_to_yojson
let clarify_content_template_to_yojson = string_to_yojson
let clarify_max_record_count_to_yojson = int_to_yojson
let clarify_max_payload_in_m_b_to_yojson = int_to_yojson
let clarify_probability_index_to_yojson = int_to_yojson
let clarify_label_index_to_yojson = int_to_yojson
let clarify_probability_attribute_to_yojson = string_to_yojson
let clarify_label_attribute_to_yojson = string_to_yojson
let clarify_header_to_yojson = string_to_yojson
let clarify_label_headers_to_yojson tree = list_to_yojson clarify_header_to_yojson tree
let clarify_feature_headers_to_yojson tree = list_to_yojson clarify_header_to_yojson tree

let clarify_feature_type_to_yojson (x : clarify_feature_type) =
  match x with
  | TEXT -> `String "text"
  | CATEGORICAL -> `String "categorical"
  | NUMERICAL -> `String "numerical"

let clarify_feature_types_to_yojson tree = list_to_yojson clarify_feature_type_to_yojson tree

let clarify_inference_config_to_yojson (x : clarify_inference_config) =
  assoc_to_yojson
    [
      ("FeatureTypes", option_to_yojson clarify_feature_types_to_yojson x.feature_types);
      ("FeatureHeaders", option_to_yojson clarify_feature_headers_to_yojson x.feature_headers);
      ("LabelHeaders", option_to_yojson clarify_label_headers_to_yojson x.label_headers);
      ("LabelAttribute", option_to_yojson clarify_label_attribute_to_yojson x.label_attribute);
      ( "ProbabilityAttribute",
        option_to_yojson clarify_probability_attribute_to_yojson x.probability_attribute );
      ("LabelIndex", option_to_yojson clarify_label_index_to_yojson x.label_index);
      ("ProbabilityIndex", option_to_yojson clarify_probability_index_to_yojson x.probability_index);
      ("MaxPayloadInMB", option_to_yojson clarify_max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("MaxRecordCount", option_to_yojson clarify_max_record_count_to_yojson x.max_record_count);
      ("ContentTemplate", option_to_yojson clarify_content_template_to_yojson x.content_template);
      ( "FeaturesAttribute",
        option_to_yojson clarify_features_attribute_to_yojson x.features_attribute );
    ]

let clarify_mime_type_to_yojson = string_to_yojson
let clarify_shap_baseline_to_yojson = string_to_yojson

let clarify_shap_baseline_config_to_yojson (x : clarify_shap_baseline_config) =
  assoc_to_yojson
    [
      ("ShapBaselineUri", option_to_yojson url_to_yojson x.shap_baseline_uri);
      ("ShapBaseline", option_to_yojson clarify_shap_baseline_to_yojson x.shap_baseline);
      ("MimeType", option_to_yojson clarify_mime_type_to_yojson x.mime_type);
    ]

let clarify_shap_number_of_samples_to_yojson = int_to_yojson
let clarify_shap_use_logit_to_yojson = bool_to_yojson
let clarify_shap_seed_to_yojson = int_to_yojson

let clarify_text_language_to_yojson (x : clarify_text_language) =
  match x with
  | MULTI_LANGUAGE -> `String "xx"
  | LIGURIAN -> `String "lij"
  | YORUBA -> `String "yo"
  | URDU -> `String "ur"
  | UKRAINIAN -> `String "uk"
  | TURKISH -> `String "tr"
  | TELUGU -> `String "te"
  | TATAR -> `String "tt"
  | TAMIL -> `String "ta"
  | TAGALOG -> `String "tl"
  | SWEDISH -> `String "sv"
  | SPANISH -> `String "es"
  | SLOVENIAN -> `String "sl"
  | SLOVAK -> `String "sk"
  | SINHALA -> `String "si"
  | SETSWANA -> `String "tn"
  | SERBIAN -> `String "sr"
  | SANSKRIT -> `String "sa"
  | RUSSIAN -> `String "ru"
  | ROMANIAN -> `String "ro"
  | PORTUGUESE -> `String "pt"
  | POLISH -> `String "pl"
  | PERSIAN -> `String "fa"
  | NORWEGIAN_BOKMAL -> `String "nb"
  | NEPALI -> `String "ne"
  | MARATHI -> `String "mr"
  | MALAYALAM -> `String "ml"
  | MACEDONIAN -> `String "mk"
  | LUXEMBOURGISH -> `String "lb"
  | LITHUANIAN -> `String "lt"
  | LATVIAN -> `String "lv"
  | KYRGYZ -> `String "ky"
  | KANNADA -> `String "kn"
  | ITALIAN -> `String "it"
  | IRISH -> `String "ga"
  | INDONESIAN -> `String "id"
  | ICELANDIC -> `String "is"
  | HUNGARIAN -> `String "hu"
  | HINDI -> `String "hi"
  | HEBREW -> `String "he"
  | GUJARATI -> `String "gu"
  | GREEK -> `String "el"
  | GERMAN -> `String "de"
  | FRENCH -> `String "fr"
  | FINNISH -> `String "fi"
  | ESTONIAN -> `String "et"
  | ENGLISH -> `String "en"
  | DUTCH -> `String "nl"
  | DANISH -> `String "da"
  | CZECH -> `String "cs"
  | CROATIAN -> `String "hr"
  | CHINESE -> `String "zh"
  | CATALAN -> `String "ca"
  | BULGARIAN -> `String "bg"
  | BENGALI -> `String "bn"
  | BASQUE -> `String "eu"
  | ARMENIAN -> `String "hy"
  | ARABIC -> `String "ar"
  | ALBANIAN -> `String "sq"
  | AFRIKAANS -> `String "af"

let clarify_text_granularity_to_yojson (x : clarify_text_granularity) =
  match x with
  | PARAGRAPH -> `String "paragraph"
  | SENTENCE -> `String "sentence"
  | TOKEN -> `String "token"

let clarify_text_config_to_yojson (x : clarify_text_config) =
  assoc_to_yojson
    [
      ("Granularity", Some (clarify_text_granularity_to_yojson x.granularity));
      ("Language", Some (clarify_text_language_to_yojson x.language));
    ]

let clarify_shap_config_to_yojson (x : clarify_shap_config) =
  assoc_to_yojson
    [
      ("TextConfig", option_to_yojson clarify_text_config_to_yojson x.text_config);
      ("Seed", option_to_yojson clarify_shap_seed_to_yojson x.seed);
      ("UseLogit", option_to_yojson clarify_shap_use_logit_to_yojson x.use_logit);
      ( "NumberOfSamples",
        option_to_yojson clarify_shap_number_of_samples_to_yojson x.number_of_samples );
      ("ShapBaselineConfig", Some (clarify_shap_baseline_config_to_yojson x.shap_baseline_config));
    ]

let clarify_explainer_config_to_yojson (x : clarify_explainer_config) =
  assoc_to_yojson
    [
      ("ShapConfig", Some (clarify_shap_config_to_yojson x.shap_config));
      ("InferenceConfig", option_to_yojson clarify_inference_config_to_yojson x.inference_config);
      ( "EnableExplanations",
        option_to_yojson clarify_enable_explanations_to_yojson x.enable_explanations );
    ]

let explainer_config_to_yojson (x : explainer_config) =
  assoc_to_yojson
    [
      ( "ClarifyExplainerConfig",
        option_to_yojson clarify_explainer_config_to_yojson x.clarify_explainer_config );
    ]

let enable_enhanced_metrics_to_yojson = bool_to_yojson
let enable_detailed_observability_to_yojson = bool_to_yojson

let metrics_config_to_yojson (x : metrics_config) =
  assoc_to_yojson
    [
      ( "MetricPublishFrequencyInSeconds",
        option_to_yojson metric_publish_frequency_in_seconds_to_yojson
          x.metric_publish_frequency_in_seconds );
      ( "EnableDetailedObservability",
        option_to_yojson enable_detailed_observability_to_yojson x.enable_detailed_observability );
      ( "EnableEnhancedMetrics",
        option_to_yojson enable_enhanced_metrics_to_yojson x.enable_enhanced_metrics );
    ]

let describe_endpoint_config_output_to_yojson (x : describe_endpoint_config_output) =
  assoc_to_yojson
    [
      ("MetricsConfig", option_to_yojson metrics_config_to_yojson x.metrics_config);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_list_to_yojson x.shadow_production_variants );
      ("ExplainerConfig", option_to_yojson explainer_config_to_yojson x.explainer_config);
      ( "AsyncInferenceConfig",
        option_to_yojson async_inference_config_to_yojson x.async_inference_config );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DataCaptureConfig", option_to_yojson data_capture_config_to_yojson x.data_capture_config);
      ("ProductionVariants", Some (production_variant_list_to_yojson x.production_variants));
      ("EndpointConfigArn", Some (endpoint_config_arn_to_yojson x.endpoint_config_arn));
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
    ]

let describe_endpoint_config_input_to_yojson (x : describe_endpoint_config_input) =
  assoc_to_yojson
    [ ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name)) ]

let pending_production_variant_summary_to_yojson (x : pending_production_variant_summary) =
  assoc_to_yojson
    [
      ( "RoutingConfig",
        option_to_yojson production_variant_routing_config_to_yojson x.routing_config );
      ( "ManagedInstanceScaling",
        option_to_yojson production_variant_managed_instance_scaling_to_yojson
          x.managed_instance_scaling );
      ( "DesiredServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.desired_serverless_config
      );
      ( "CurrentServerlessConfig",
        option_to_yojson production_variant_serverless_config_to_yojson x.current_serverless_config
      );
      ("VariantStatus", option_to_yojson production_variant_status_list_to_yojson x.variant_status);
      ( "AcceleratorType",
        option_to_yojson production_variant_accelerator_type_to_yojson x.accelerator_type );
      ("InstancePools", option_to_yojson instance_pool_summary_list_to_yojson x.instance_pools);
      ("InstanceType", option_to_yojson production_variant_instance_type_to_yojson x.instance_type);
      ("DesiredInstanceCount", option_to_yojson task_count_to_yojson x.desired_instance_count);
      ("CurrentInstanceCount", option_to_yojson task_count_to_yojson x.current_instance_count);
      ("DesiredWeight", option_to_yojson variant_weight_to_yojson x.desired_weight);
      ("CurrentWeight", option_to_yojson variant_weight_to_yojson x.current_weight);
      ("DeployedImages", option_to_yojson deployed_images_to_yojson x.deployed_images);
      ("VariantName", Some (variant_name_to_yojson x.variant_name));
    ]

let pending_production_variant_summary_list_to_yojson tree =
  list_to_yojson pending_production_variant_summary_to_yojson tree

let pending_deployment_summary_to_yojson (x : pending_deployment_summary) =
  assoc_to_yojson
    [
      ( "ShadowProductionVariants",
        option_to_yojson pending_production_variant_summary_list_to_yojson
          x.shadow_production_variants );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ( "ProductionVariants",
        option_to_yojson pending_production_variant_summary_list_to_yojson x.production_variants );
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
    ]

let describe_endpoint_output_to_yojson (x : describe_endpoint_output) =
  assoc_to_yojson
    [
      ("MetricsConfig", option_to_yojson metrics_config_to_yojson x.metrics_config);
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.shadow_production_variants );
      ("ExplainerConfig", option_to_yojson explainer_config_to_yojson x.explainer_config);
      ( "PendingDeploymentSummary",
        option_to_yojson pending_deployment_summary_to_yojson x.pending_deployment_summary );
      ( "AsyncInferenceConfig",
        option_to_yojson async_inference_config_to_yojson x.async_inference_config );
      ("LastDeploymentConfig", option_to_yojson deployment_config_to_yojson x.last_deployment_config);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("EndpointStatus", Some (endpoint_status_to_yojson x.endpoint_status));
      ( "DataCaptureConfig",
        option_to_yojson data_capture_config_summary_to_yojson x.data_capture_config );
      ( "ProductionVariants",
        option_to_yojson production_variant_summary_list_to_yojson x.production_variants );
      ("EndpointConfigName", option_to_yojson endpoint_config_name_to_yojson x.endpoint_config_name);
      ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let describe_endpoint_input_to_yojson (x : describe_endpoint_input) =
  assoc_to_yojson [ ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name)) ]

let edge_preset_deployment_artifact_to_yojson = string_to_yojson

let edge_preset_deployment_status_to_yojson (x : edge_preset_deployment_status) =
  match x with Failed -> `String "FAILED" | Completed -> `String "COMPLETED"

let edge_preset_deployment_output_to_yojson (x : edge_preset_deployment_output) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("Status", option_to_yojson edge_preset_deployment_status_to_yojson x.status);
      ("Artifact", option_to_yojson edge_preset_deployment_artifact_to_yojson x.artifact);
      ("Type", Some (edge_preset_deployment_type_to_yojson x.type_));
    ]

let describe_edge_packaging_job_response_to_yojson (x : describe_edge_packaging_job_response) =
  assoc_to_yojson
    [
      ( "PresetDeploymentOutput",
        option_to_yojson edge_preset_deployment_output_to_yojson x.preset_deployment_output );
      ("ModelSignature", option_to_yojson string__to_yojson x.model_signature);
      ("ModelArtifact", option_to_yojson s3_uri_to_yojson x.model_artifact);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "EdgePackagingJobStatusMessage",
        option_to_yojson string__to_yojson x.edge_packaging_job_status_message );
      ( "EdgePackagingJobStatus",
        Some (edge_packaging_job_status_to_yojson x.edge_packaging_job_status) );
      ("ResourceKey", option_to_yojson kms_key_id_to_yojson x.resource_key);
      ("OutputConfig", option_to_yojson edge_output_config_to_yojson x.output_config);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ModelVersion", option_to_yojson edge_version_to_yojson x.model_version);
      ("ModelName", option_to_yojson entity_name_to_yojson x.model_name);
      ("CompilationJobName", option_to_yojson entity_name_to_yojson x.compilation_job_name);
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
      ("EdgePackagingJobArn", Some (edge_packaging_job_arn_to_yojson x.edge_packaging_job_arn));
    ]

let describe_edge_packaging_job_request_to_yojson (x : describe_edge_packaging_job_request) =
  assoc_to_yojson
    [ ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name)) ]

let edge_deployment_model_config_to_yojson (x : edge_deployment_model_config) =
  assoc_to_yojson
    [
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
      ("ModelHandle", Some (entity_name_to_yojson x.model_handle));
    ]

let edge_deployment_model_configs_to_yojson tree =
  list_to_yojson edge_deployment_model_config_to_yojson tree

let device_subset_type_to_yojson (x : device_subset_type) =
  match x with
  | NameContains -> `String "NAMECONTAINS"
  | Selection -> `String "SELECTION"
  | Percentage -> `String "PERCENTAGE"

let device_names_to_yojson tree = list_to_yojson device_name_to_yojson tree

let device_selection_config_to_yojson (x : device_selection_config) =
  assoc_to_yojson
    [
      ("DeviceNameContains", option_to_yojson device_name_to_yojson x.device_name_contains);
      ("DeviceNames", option_to_yojson device_names_to_yojson x.device_names);
      ("Percentage", option_to_yojson percentage_to_yojson x.percentage);
      ("DeviceSubsetType", Some (device_subset_type_to_yojson x.device_subset_type));
    ]

let failure_handling_policy_to_yojson (x : failure_handling_policy) =
  match x with
  | DoNothing -> `String "DO_NOTHING"
  | RollbackOnFailure -> `String "ROLLBACK_ON_FAILURE"

let edge_deployment_config_to_yojson (x : edge_deployment_config) =
  assoc_to_yojson
    [
      ("FailureHandlingPolicy", Some (failure_handling_policy_to_yojson x.failure_handling_policy));
    ]

let edge_deployment_status_to_yojson (x : edge_deployment_status) =
  assoc_to_yojson
    [
      ( "EdgeDeploymentStageStartTime",
        option_to_yojson timestamp_to_yojson x.edge_deployment_stage_start_time );
      ( "EdgeDeploymentStatusMessage",
        option_to_yojson string__to_yojson x.edge_deployment_status_message );
      ("EdgeDeploymentFailedInStage", Some (integer_to_yojson x.edge_deployment_failed_in_stage));
      ("EdgeDeploymentPendingInStage", Some (integer_to_yojson x.edge_deployment_pending_in_stage));
      ("EdgeDeploymentSuccessInStage", Some (integer_to_yojson x.edge_deployment_success_in_stage));
      ("StageStatus", Some (stage_status_to_yojson x.stage_status));
    ]

let deployment_stage_status_summary_to_yojson (x : deployment_stage_status_summary) =
  assoc_to_yojson
    [
      ("DeploymentStatus", Some (edge_deployment_status_to_yojson x.deployment_status));
      ("DeploymentConfig", Some (edge_deployment_config_to_yojson x.deployment_config));
      ("DeviceSelectionConfig", Some (device_selection_config_to_yojson x.device_selection_config));
      ("StageName", Some (entity_name_to_yojson x.stage_name));
    ]

let deployment_stage_status_summaries_to_yojson tree =
  list_to_yojson deployment_stage_status_summary_to_yojson tree

let describe_edge_deployment_plan_response_to_yojson (x : describe_edge_deployment_plan_response) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Stages", Some (deployment_stage_status_summaries_to_yojson x.stages));
      ("EdgeDeploymentFailed", option_to_yojson integer_to_yojson x.edge_deployment_failed);
      ("EdgeDeploymentPending", option_to_yojson integer_to_yojson x.edge_deployment_pending);
      ("EdgeDeploymentSuccess", option_to_yojson integer_to_yojson x.edge_deployment_success);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("ModelConfigs", Some (edge_deployment_model_configs_to_yojson x.model_configs));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
    ]

let deployment_stage_max_results_to_yojson = int_to_yojson

let describe_edge_deployment_plan_request_to_yojson (x : describe_edge_deployment_plan_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson deployment_stage_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
    ]

let resource_id_to_yojson = string_to_yojson
let auth_mode_to_yojson (x : auth_mode) = match x with IAM -> `String "IAM" | SSO -> `String "SSO"

let r_studio_server_pro_domain_settings_to_yojson (x : r_studio_server_pro_domain_settings) =
  assoc_to_yojson
    [
      ("DefaultResourceSpec", option_to_yojson resource_spec_to_yojson x.default_resource_spec);
      ("RStudioPackageManagerUrl", option_to_yojson string__to_yojson x.r_studio_package_manager_url);
      ("RStudioConnectUrl", option_to_yojson string__to_yojson x.r_studio_connect_url);
      ("DomainExecutionRoleArn", Some (role_arn_to_yojson x.domain_execution_role_arn));
    ]

let domain_settings_to_yojson (x : domain_settings) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "UnifiedStudioSettings",
        option_to_yojson unified_studio_settings_to_yojson x.unified_studio_settings );
      ("AmazonQSettings", option_to_yojson amazon_q_settings_to_yojson x.amazon_q_settings);
      ("DockerSettings", option_to_yojson docker_settings_to_yojson x.docker_settings);
      ( "TrustedIdentityPropagationSettings",
        option_to_yojson trusted_identity_propagation_settings_to_yojson
          x.trusted_identity_propagation_settings );
      ( "ExecutionRoleIdentityConfig",
        option_to_yojson execution_role_identity_config_to_yojson x.execution_role_identity_config
      );
      ( "RStudioServerProDomainSettings",
        option_to_yojson r_studio_server_pro_domain_settings_to_yojson
          x.r_studio_server_pro_domain_settings );
      ("SecurityGroupIds", option_to_yojson domain_security_group_ids_to_yojson x.security_group_ids);
    ]

let describe_domain_response_to_yojson (x : describe_domain_response) =
  assoc_to_yojson
    [
      ( "DefaultSpaceSettings",
        option_to_yojson default_space_settings_to_yojson x.default_space_settings );
      ("TagPropagation", option_to_yojson tag_propagation_to_yojson x.tag_propagation);
      ( "HomeEfsFileSystemCreation",
        option_to_yojson home_efs_file_system_creation_to_yojson x.home_efs_file_system_creation );
      ( "AppSecurityGroupManagement",
        option_to_yojson app_security_group_management_to_yojson x.app_security_group_management );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("Url", option_to_yojson string1024_to_yojson x.url);
      ("SubnetIds", option_to_yojson subnets_to_yojson x.subnet_ids);
      ( "HomeEfsFileSystemKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.home_efs_file_system_kms_key_id );
      ( "AppNetworkAccessType",
        option_to_yojson app_network_access_type_to_yojson x.app_network_access_type );
      ("DomainSettings", option_to_yojson domain_settings_to_yojson x.domain_settings);
      ("DefaultUserSettings", option_to_yojson user_settings_to_yojson x.default_user_settings);
      ("AuthMode", option_to_yojson auth_mode_to_yojson x.auth_mode);
      ( "SecurityGroupIdForDomainBoundary",
        option_to_yojson security_group_id_to_yojson x.security_group_id_for_domain_boundary );
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", option_to_yojson last_modified_time_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("Status", option_to_yojson domain_status_to_yojson x.status);
      ( "SingleSignOnApplicationArn",
        option_to_yojson single_sign_on_application_arn_to_yojson x.single_sign_on_application_arn
      );
      ( "SingleSignOnManagedApplicationInstanceId",
        option_to_yojson string256_to_yojson x.single_sign_on_managed_application_instance_id );
      ("HomeEfsFileSystemId", option_to_yojson resource_id_to_yojson x.home_efs_file_system_id);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn);
    ]

let describe_domain_request_to_yojson (x : describe_domain_request) =
  assoc_to_yojson [ ("DomainId", Some (domain_id_to_yojson x.domain_id)) ]

let iot_role_alias_to_yojson = string_to_yojson

let describe_device_fleet_response_to_yojson (x : describe_device_fleet_response) =
  assoc_to_yojson
    [
      ("IotRoleAlias", option_to_yojson iot_role_alias_to_yojson x.iot_role_alias);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ("DeviceFleetArn", Some (device_fleet_arn_to_yojson x.device_fleet_arn));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
    ]

let describe_device_fleet_request_to_yojson (x : describe_device_fleet_request) =
  assoc_to_yojson [ ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name)) ]

let edge_model_to_yojson (x : edge_model) =
  assoc_to_yojson
    [
      ("LatestInference", option_to_yojson timestamp_to_yojson x.latest_inference);
      ("LatestSampleTime", option_to_yojson timestamp_to_yojson x.latest_sample_time);
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
      ("ModelName", Some (entity_name_to_yojson x.model_name));
    ]

let edge_models_to_yojson tree = list_to_yojson edge_model_to_yojson tree

let describe_device_response_to_yojson (x : describe_device_response) =
  assoc_to_yojson
    [
      ("AgentVersion", option_to_yojson edge_version_to_yojson x.agent_version);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxModels", option_to_yojson integer_to_yojson x.max_models);
      ("Models", option_to_yojson edge_models_to_yojson x.models);
      ("LatestHeartbeat", option_to_yojson timestamp_to_yojson x.latest_heartbeat);
      ("RegistrationTime", Some (timestamp_to_yojson x.registration_time));
      ("IotThingName", option_to_yojson thing_name_to_yojson x.iot_thing_name);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("Description", option_to_yojson device_description_to_yojson x.description);
      ("DeviceName", Some (entity_name_to_yojson x.device_name));
      ("DeviceArn", option_to_yojson device_arn_to_yojson x.device_arn);
    ]

let describe_device_request_to_yojson (x : describe_device_request) =
  assoc_to_yojson
    [
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("DeviceName", Some (entity_name_to_yojson x.device_name));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let data_quality_baseline_config_to_yojson (x : data_quality_baseline_config) =
  assoc_to_yojson
    [
      ( "StatisticsResource",
        option_to_yojson monitoring_statistics_resource_to_yojson x.statistics_resource );
      ( "ConstraintsResource",
        option_to_yojson monitoring_constraints_resource_to_yojson x.constraints_resource );
      ("BaseliningJobName", option_to_yojson processing_job_name_to_yojson x.baselining_job_name);
    ]

let data_quality_app_specification_to_yojson (x : data_quality_app_specification) =
  assoc_to_yojson
    [
      ("Environment", option_to_yojson monitoring_environment_map_to_yojson x.environment);
      ( "PostAnalyticsProcessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.post_analytics_processor_source_uri );
      ( "RecordPreprocessorSourceUri",
        option_to_yojson s3_uri_to_yojson x.record_preprocessor_source_uri );
      ( "ContainerArguments",
        option_to_yojson monitoring_container_arguments_to_yojson x.container_arguments );
      ("ContainerEntrypoint", option_to_yojson container_entrypoint_to_yojson x.container_entrypoint);
      ("ImageUri", Some (image_uri_to_yojson x.image_uri));
    ]

let data_quality_job_input_to_yojson (x : data_quality_job_input) =
  assoc_to_yojson
    [
      ( "BatchTransformInput",
        option_to_yojson batch_transform_input_to_yojson x.batch_transform_input );
      ("EndpointInput", option_to_yojson endpoint_input_to_yojson x.endpoint_input);
    ]

let describe_data_quality_job_definition_response_to_yojson
    (x : describe_data_quality_job_definition_response) =
  assoc_to_yojson
    [
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "DataQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.data_quality_job_output_config) );
      ("DataQualityJobInput", Some (data_quality_job_input_to_yojson x.data_quality_job_input));
      ( "DataQualityAppSpecification",
        Some (data_quality_app_specification_to_yojson x.data_quality_app_specification) );
      ( "DataQualityBaselineConfig",
        option_to_yojson data_quality_baseline_config_to_yojson x.data_quality_baseline_config );
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
      ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn));
    ]

let describe_data_quality_job_definition_request_to_yojson
    (x : describe_data_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let describe_context_response_to_yojson (x : describe_context_response) =
  assoc_to_yojson
    [
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("ContextType", option_to_yojson string256_to_yojson x.context_type);
      ("Source", option_to_yojson context_source_to_yojson x.source);
      ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn);
      ("ContextName", option_to_yojson context_name_to_yojson x.context_name);
    ]

let context_name_or_arn_to_yojson = string_to_yojson

let describe_context_request_to_yojson (x : describe_context_request) =
  assoc_to_yojson [ ("ContextName", Some (context_name_or_arn_to_yojson x.context_name)) ]

let describe_compute_quota_response_to_yojson (x : describe_compute_quota_response) =
  assoc_to_yojson
    [
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("ComputeQuotaTarget", Some (compute_quota_target_to_yojson x.compute_quota_target));
      ("ComputeQuotaConfig", option_to_yojson compute_quota_config_to_yojson x.compute_quota_config);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("ComputeQuotaVersion", Some (integer_to_yojson x.compute_quota_version));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Name", Some (entity_name_to_yojson x.name));
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
    ]

let describe_compute_quota_request_to_yojson (x : describe_compute_quota_request) =
  assoc_to_yojson
    [
      ("ComputeQuotaVersion", option_to_yojson integer_to_yojson x.compute_quota_version);
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
    ]

let inference_image_to_yojson = string_to_yojson
let artifact_digest_to_yojson = string_to_yojson

let model_digests_to_yojson (x : model_digests) =
  assoc_to_yojson
    [ ("ArtifactDigest", option_to_yojson artifact_digest_to_yojson x.artifact_digest) ]

let framework_to_yojson (x : framework) =
  match x with
  | SKLEARN -> `String "SKLEARN"
  | DARKNET -> `String "DARKNET"
  | TFLITE -> `String "TFLITE"
  | XGBOOST -> `String "XGBOOST"
  | PYTORCH -> `String "PYTORCH"
  | ONNX -> `String "ONNX"
  | MXNET -> `String "MXNET"
  | KERAS -> `String "KERAS"
  | TENSORFLOW -> `String "TENSORFLOW"

let framework_version_to_yojson = string_to_yojson

let input_config_to_yojson (x : input_config) =
  assoc_to_yojson
    [
      ("FrameworkVersion", option_to_yojson framework_version_to_yojson x.framework_version);
      ("Framework", Some (framework_to_yojson x.framework));
      ("DataInputConfig", option_to_yojson data_input_config_to_yojson x.data_input_config);
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
    ]

let compiler_options_to_yojson = string_to_yojson

let output_config_to_yojson (x : output_config) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("CompilerOptions", option_to_yojson compiler_options_to_yojson x.compiler_options);
      ("TargetPlatform", option_to_yojson target_platform_to_yojson x.target_platform);
      ("TargetDevice", option_to_yojson target_device_to_yojson x.target_device);
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
    ]

let neo_vpc_security_group_id_to_yojson = string_to_yojson

let neo_vpc_security_group_ids_to_yojson tree =
  list_to_yojson neo_vpc_security_group_id_to_yojson tree

let neo_vpc_subnet_id_to_yojson = string_to_yojson
let neo_vpc_subnets_to_yojson tree = list_to_yojson neo_vpc_subnet_id_to_yojson tree

let neo_vpc_config_to_yojson (x : neo_vpc_config) =
  assoc_to_yojson
    [
      ("Subnets", Some (neo_vpc_subnets_to_yojson x.subnets));
      ("SecurityGroupIds", Some (neo_vpc_security_group_ids_to_yojson x.security_group_ids));
    ]

let derived_information_to_yojson (x : derived_information) =
  assoc_to_yojson
    [
      ( "DerivedDataInputConfig",
        option_to_yojson data_input_config_to_yojson x.derived_data_input_config );
    ]

let describe_compilation_job_response_to_yojson (x : describe_compilation_job_response) =
  assoc_to_yojson
    [
      ("DerivedInformation", option_to_yojson derived_information_to_yojson x.derived_information);
      ("VpcConfig", option_to_yojson neo_vpc_config_to_yojson x.vpc_config);
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("InputConfig", Some (input_config_to_yojson x.input_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("ModelDigests", option_to_yojson model_digests_to_yojson x.model_digests);
      ("ModelArtifacts", Some (model_artifacts_to_yojson x.model_artifacts));
      ("FailureReason", Some (failure_reason_to_yojson x.failure_reason));
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
      ("InferenceImage", option_to_yojson inference_image_to_yojson x.inference_image);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("CompilationEndTime", option_to_yojson timestamp_to_yojson x.compilation_end_time);
      ("CompilationStartTime", option_to_yojson timestamp_to_yojson x.compilation_start_time);
      ("CompilationJobStatus", Some (compilation_job_status_to_yojson x.compilation_job_status));
      ("CompilationJobArn", Some (compilation_job_arn_to_yojson x.compilation_job_arn));
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
    ]

let describe_compilation_job_request_to_yojson (x : describe_compilation_job_request) =
  assoc_to_yojson [ ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name)) ]

let describe_code_repository_output_to_yojson (x : describe_code_repository_output) =
  assoc_to_yojson
    [
      ("GitConfig", option_to_yojson git_config_to_yojson x.git_config);
      ("LastModifiedTime", Some (last_modified_time_to_yojson x.last_modified_time));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn));
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
    ]

let describe_code_repository_input_to_yojson (x : describe_code_repository_input) =
  assoc_to_yojson [ ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name)) ]

let describe_cluster_scheduler_config_response_to_yojson
    (x : describe_cluster_scheduler_config_response) =
  assoc_to_yojson
    [
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("SchedulerConfig", option_to_yojson scheduler_config_to_yojson x.scheduler_config);
      ("ClusterArn", option_to_yojson cluster_arn_to_yojson x.cluster_arn);
      ("StatusDetails", option_to_yojson status_details_map_to_yojson x.status_details);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("Status", Some (scheduler_resource_status_to_yojson x.status));
      ("ClusterSchedulerConfigVersion", Some (integer_to_yojson x.cluster_scheduler_config_version));
      ("Name", Some (entity_name_to_yojson x.name));
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
    ]

let describe_cluster_scheduler_config_request_to_yojson
    (x : describe_cluster_scheduler_config_request) =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigVersion",
        option_to_yojson integer_to_yojson x.cluster_scheduler_config_version );
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
    ]

let cluster_node_logical_id_to_yojson = string_to_yojson
let cluster_private_primary_ip_to_yojson = string_to_yojson
let cluster_private_primary_ipv6_to_yojson = string_to_yojson
let cluster_availability_zone_to_yojson = string_to_yojson
let cluster_availability_zone_id_to_yojson = string_to_yojson

let cluster_instance_placement_to_yojson (x : cluster_instance_placement) =
  assoc_to_yojson
    [
      ( "AvailabilityZoneId",
        option_to_yojson cluster_availability_zone_id_to_yojson x.availability_zone_id );
      ("AvailabilityZone", option_to_yojson cluster_availability_zone_to_yojson x.availability_zone);
    ]

let cluster_kubernetes_config_node_details_to_yojson (x : cluster_kubernetes_config_node_details) =
  assoc_to_yojson
    [
      ("DesiredTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.desired_taints);
      ("CurrentTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.current_taints);
      ("DesiredLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.desired_labels);
      ("CurrentLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.current_labels);
    ]

let cluster_capacity_type_to_yojson (x : cluster_capacity_type) =
  match x with ON_DEMAND -> `String "OnDemand" | SPOT -> `String "Spot"

let cluster_network_interface_details_to_yojson (x : cluster_network_interface_details) =
  assoc_to_yojson
    [ ("InterfaceType", option_to_yojson cluster_interface_type_to_yojson x.interface_type) ]

let cluster_node_details_to_yojson (x : cluster_node_details) =
  assoc_to_yojson
    [
      ( "NetworkInterface",
        option_to_yojson cluster_network_interface_details_to_yojson x.network_interface );
      ("CapacityType", option_to_yojson cluster_capacity_type_to_yojson x.capacity_type);
      ( "KubernetesConfig",
        option_to_yojson cluster_kubernetes_config_node_details_to_yojson x.kubernetes_config );
      ("UltraServerInfo", option_to_yojson ultra_server_info_to_yojson x.ultra_server_info);
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
      ( "DesiredImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.desired_image_release_version );
      ( "CurrentImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.current_image_release_version );
      ("DesiredImageId", option_to_yojson image_id_to_yojson x.desired_image_id);
      ("CurrentImageId", option_to_yojson image_id_to_yojson x.current_image_id);
      ("Placement", option_to_yojson cluster_instance_placement_to_yojson x.placement);
      ( "PrivateDnsHostname",
        option_to_yojson cluster_private_dns_hostname_to_yojson x.private_dns_hostname );
      ( "PrivatePrimaryIpv6",
        option_to_yojson cluster_private_primary_ipv6_to_yojson x.private_primary_ipv6 );
      ( "PrivatePrimaryIp",
        option_to_yojson cluster_private_primary_ip_to_yojson x.private_primary_ip );
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ("LifeCycleConfig", option_to_yojson cluster_life_cycle_config_to_yojson x.life_cycle_config);
      ("LastSoftwareUpdateTime", option_to_yojson timestamp_to_yojson x.last_software_update_time);
      ("LaunchTime", option_to_yojson timestamp_to_yojson x.launch_time);
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ( "InstanceStatus",
        option_to_yojson cluster_instance_status_details_to_yojson x.instance_status );
      ("NodeLogicalId", option_to_yojson cluster_node_logical_id_to_yojson x.node_logical_id);
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
    ]

let describe_cluster_node_response_to_yojson (x : describe_cluster_node_response) =
  assoc_to_yojson [ ("NodeDetails", Some (cluster_node_details_to_yojson x.node_details)) ]

let describe_cluster_node_request_to_yojson (x : describe_cluster_node_request) =
  assoc_to_yojson
    [
      ("NodeLogicalId", option_to_yojson cluster_node_logical_id_to_yojson x.node_logical_id);
      ("NodeId", option_to_yojson cluster_node_id_to_yojson x.node_id);
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let eks_role_access_entries_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let cluster_metadata_to_yojson (x : cluster_metadata) =
  assoc_to_yojson
    [
      ( "SlrAccessEntry",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.slr_access_entry
      );
      ( "EksRoleAccessEntries",
        option_to_yojson eks_role_access_entries_to_yojson x.eks_role_access_entries );
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let capacity_reservation_type_to_yojson (x : capacity_reservation_type) =
  match x with CRG -> `String "CRG" | ODCR -> `String "ODCR"

let capacity_reservation_to_yojson (x : capacity_reservation) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson capacity_reservation_type_to_yojson x.type_);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
    ]

let instance_group_metadata_to_yojson (x : instance_group_metadata) =
  assoc_to_yojson
    [
      ( "AmiOverride",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ami_override );
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ( "SubnetId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.subnet_id );
      ("CapacityReservation", option_to_yojson capacity_reservation_to_yojson x.capacity_reservation);
      ( "AvailabilityZoneId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.availability_zone_id );
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let instance_group_scaling_metadata_to_yojson (x : instance_group_scaling_metadata) =
  assoc_to_yojson
    [
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("MinCount", option_to_yojson instance_count_to_yojson x.min_count);
      ("TargetCount", option_to_yojson target_count_to_yojson x.target_count);
      ("InstanceCount", option_to_yojson instance_count_to_yojson x.instance_count);
    ]

let efa_enis_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let additional_enis_to_yojson (x : additional_enis) =
  assoc_to_yojson [ ("EfaEnis", option_to_yojson efa_enis_to_yojson x.efa_enis) ]

let instance_requirements_eni_configuration_to_yojson (x : instance_requirements_eni_configuration)
    =
  assoc_to_yojson
    [
      ("AdditionalEnis", option_to_yojson additional_enis_to_yojson x.additional_enis);
      ( "CustomerEni",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_eni );
    ]

let instance_requirements_eni_configurations_to_yojson tree =
  list_to_yojson instance_requirements_eni_configuration_to_yojson tree

let instance_metadata_to_yojson (x : instance_metadata) =
  assoc_to_yojson
    [
      ("NodeLogicalId", option_to_yojson cluster_node_logical_id_to_yojson x.node_logical_id);
      ( "LcsExecutionState",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.lcs_execution_state );
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("CapacityReservation", option_to_yojson capacity_reservation_to_yojson x.capacity_reservation);
      ( "InstanceRequirementsEniConfigurations",
        option_to_yojson instance_requirements_eni_configurations_to_yojson
          x.instance_requirements_eni_configurations );
      ("AdditionalEnis", option_to_yojson additional_enis_to_yojson x.additional_enis);
      ( "CustomerEni",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.customer_eni );
    ]

let event_metadata_to_yojson (x : event_metadata) =
  match x with
  | Instance arg -> assoc_to_yojson [ ("Instance", Some (instance_metadata_to_yojson arg)) ]
  | InstanceGroupScaling arg ->
      assoc_to_yojson
        [ ("InstanceGroupScaling", Some (instance_group_scaling_metadata_to_yojson arg)) ]
  | InstanceGroup arg ->
      assoc_to_yojson [ ("InstanceGroup", Some (instance_group_metadata_to_yojson arg)) ]
  | Cluster arg -> assoc_to_yojson [ ("Cluster", Some (cluster_metadata_to_yojson arg)) ]

let event_details_to_yojson (x : event_details) =
  assoc_to_yojson [ ("EventMetadata", option_to_yojson event_metadata_to_yojson x.event_metadata) ]

let cluster_event_detail_to_yojson (x : cluster_event_detail) =
  assoc_to_yojson
    [
      ("EventLevel", option_to_yojson cluster_event_level_to_yojson x.event_level);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("EventDetails", option_to_yojson event_details_to_yojson x.event_details);
      ("EventTime", Some (timestamp_to_yojson x.event_time));
      ("ResourceType", Some (cluster_event_resource_type_to_yojson x.resource_type));
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("EventId", Some (event_id_to_yojson x.event_id));
    ]

let describe_cluster_event_response_to_yojson (x : describe_cluster_event_response) =
  assoc_to_yojson
    [ ("EventDetails", option_to_yojson cluster_event_detail_to_yojson x.event_details) ]

let describe_cluster_event_request_to_yojson (x : describe_cluster_event_request) =
  assoc_to_yojson
    [
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
      ("EventId", Some (event_id_to_yojson x.event_id));
    ]

let cluster_non_negative_instance_count_to_yojson = int_to_yojson

let cluster_instance_requirement_details_to_yojson (x : cluster_instance_requirement_details) =
  assoc_to_yojson
    [
      ( "DesiredInstanceTypes",
        option_to_yojson cluster_instance_types_to_yojson x.desired_instance_types );
      ( "CurrentInstanceTypes",
        option_to_yojson cluster_instance_types_to_yojson x.current_instance_types );
    ]

let cluster_instance_type_detail_to_yojson (x : cluster_instance_type_detail) =
  assoc_to_yojson
    [
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ( "CurrentCount",
        option_to_yojson cluster_non_negative_instance_count_to_yojson x.current_count );
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
    ]

let cluster_instance_type_details_to_yojson tree =
  list_to_yojson cluster_instance_type_detail_to_yojson tree

let instance_group_status_to_yojson (x : instance_group_status) =
  match x with
  | DELETING -> `String "Deleting"
  | SYSTEMUPDATING -> `String "SystemUpdating"
  | DEGRADED -> `String "Degraded"
  | FAILED -> `String "Failed"
  | UPDATING -> `String "Updating"
  | CREATING -> `String "Creating"
  | INSERVICE -> `String "InService"

let instance_group_training_plan_status_to_yojson = string_to_yojson

let cluster_patch_schedule_details_to_yojson (x : cluster_patch_schedule_details) =
  assoc_to_yojson [ ("NextPatchDate", option_to_yojson timestamp_to_yojson x.next_patch_date) ]

let cluster_auto_patch_config_details_to_yojson (x : cluster_auto_patch_config_details) =
  assoc_to_yojson
    [
      ("DeploymentConfig", option_to_yojson deployment_configuration_to_yojson x.deployment_config);
      ( "DesiredPatchSchedule",
        option_to_yojson cluster_patch_schedule_details_to_yojson x.desired_patch_schedule );
      ( "CurrentPatchSchedule",
        option_to_yojson cluster_patch_schedule_details_to_yojson x.current_patch_schedule );
      ("PatchingStrategy", option_to_yojson cluster_patching_strategy_to_yojson x.patching_strategy);
    ]

let active_cluster_operation_count_to_yojson = int_to_yojson

let active_cluster_operation_name_to_yojson (x : active_cluster_operation_name) =
  match x with SCALING -> `String "Scaling"

let active_operations_to_yojson tree =
  map_to_yojson active_cluster_operation_name_to_yojson active_cluster_operation_count_to_yojson
    tree

let cluster_kubernetes_config_details_to_yojson (x : cluster_kubernetes_config_details) =
  assoc_to_yojson
    [
      ("DesiredTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.desired_taints);
      ("CurrentTaints", option_to_yojson cluster_kubernetes_taints_to_yojson x.current_taints);
      ("DesiredLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.desired_labels);
      ("CurrentLabels", option_to_yojson cluster_kubernetes_labels_to_yojson x.current_labels);
    ]

let cluster_slurm_config_details_to_yojson (x : cluster_slurm_config_details) =
  assoc_to_yojson
    [
      ("PartitionNames", option_to_yojson cluster_partition_names_to_yojson x.partition_names);
      ("NodeType", Some (cluster_slurm_node_type_to_yojson x.node_type));
    ]

let cluster_instance_group_details_to_yojson (x : cluster_instance_group_details) =
  assoc_to_yojson
    [
      ( "NetworkInterface",
        option_to_yojson cluster_network_interface_details_to_yojson x.network_interface );
      ("SlurmConfig", option_to_yojson cluster_slurm_config_details_to_yojson x.slurm_config);
      ( "ActiveSoftwareUpdateConfig",
        option_to_yojson deployment_configuration_to_yojson x.active_software_update_config );
      ( "SoftwareUpdateStatus",
        option_to_yojson software_update_status_to_yojson x.software_update_status );
      ("TargetStateCount", option_to_yojson cluster_instance_count_to_yojson x.target_state_count);
      ( "CapacityRequirements",
        option_to_yojson cluster_capacity_requirements_to_yojson x.capacity_requirements );
      ( "KubernetesConfig",
        option_to_yojson cluster_kubernetes_config_details_to_yojson x.kubernetes_config );
      ("ActiveOperations", option_to_yojson active_operations_to_yojson x.active_operations);
      ( "ImageVersionStatus",
        option_to_yojson cluster_image_version_status_to_yojson x.image_version_status );
      ( "DesiredImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.desired_image_release_version );
      ( "CurrentImageReleaseVersion",
        option_to_yojson image_release_version_to_yojson x.current_image_release_version );
      ("DesiredImageId", option_to_yojson image_id_to_yojson x.desired_image_id);
      ("CurrentImageId", option_to_yojson image_id_to_yojson x.current_image_id);
      ( "AutoPatchConfig",
        option_to_yojson cluster_auto_patch_config_details_to_yojson x.auto_patch_config );
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ( "TrainingPlanStatus",
        option_to_yojson instance_group_training_plan_status_to_yojson x.training_plan_status );
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ("Status", option_to_yojson instance_group_status_to_yojson x.status);
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("LifeCycleConfig", option_to_yojson cluster_life_cycle_config_to_yojson x.life_cycle_config);
      ( "InstanceTypeDetails",
        option_to_yojson cluster_instance_type_details_to_yojson x.instance_type_details );
      ( "InstanceRequirements",
        option_to_yojson cluster_instance_requirement_details_to_yojson x.instance_requirements );
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("MinCount", option_to_yojson cluster_instance_count_to_yojson x.min_count);
      ("TargetCount", option_to_yojson cluster_instance_count_to_yojson x.target_count);
      ( "CurrentCount",
        option_to_yojson cluster_non_negative_instance_count_to_yojson x.current_count );
    ]

let cluster_instance_group_details_list_to_yojson tree =
  list_to_yojson cluster_instance_group_details_to_yojson tree

let environment_config_details_to_yojson (x : environment_config_details) =
  assoc_to_yojson
    [
      ("S3OutputPath", option_to_yojson s3_uri_to_yojson x.s3_output_path);
      ("FSxLustreConfig", option_to_yojson f_sx_lustre_config_to_yojson x.f_sx_lustre_config);
    ]

let cluster_restricted_instance_group_details_to_yojson
    (x : cluster_restricted_instance_group_details) =
  assoc_to_yojson
    [
      ( "EnvironmentConfig",
        option_to_yojson environment_config_details_to_yojson x.environment_config );
      ( "ScheduledUpdateConfig",
        option_to_yojson scheduled_update_config_to_yojson x.scheduled_update_config );
      ("OverrideVpcConfig", option_to_yojson vpc_config_to_yojson x.override_vpc_config);
      ( "TrainingPlanStatus",
        option_to_yojson instance_group_training_plan_status_to_yojson x.training_plan_status );
      ("TrainingPlanArn", option_to_yojson training_plan_arn_to_yojson x.training_plan_arn);
      ("Status", option_to_yojson instance_group_status_to_yojson x.status);
      ( "OnStartDeepHealthChecks",
        option_to_yojson on_start_deep_health_checks_to_yojson x.on_start_deep_health_checks );
      ( "InstanceStorageConfigs",
        option_to_yojson cluster_instance_storage_configs_to_yojson x.instance_storage_configs );
      ("ThreadsPerCore", option_to_yojson cluster_threads_per_core_to_yojson x.threads_per_core);
      ("ExecutionRole", option_to_yojson role_arn_to_yojson x.execution_role);
      ("InstanceType", option_to_yojson cluster_instance_type_to_yojson x.instance_type);
      ( "InstanceGroupName",
        option_to_yojson cluster_instance_group_name_to_yojson x.instance_group_name );
      ("TargetCount", option_to_yojson cluster_instance_count_to_yojson x.target_count);
      ( "CurrentCount",
        option_to_yojson cluster_non_negative_instance_count_to_yojson x.current_count );
    ]

let cluster_restricted_instance_group_details_list_to_yojson tree =
  list_to_yojson cluster_restricted_instance_group_details_to_yojson tree

let cluster_shared_environment_config_details_to_yojson
    (x : cluster_shared_environment_config_details) =
  assoc_to_yojson
    [
      ( "DesiredFSxLustreDeletionPolicy",
        option_to_yojson cluster_f_sx_lustre_deletion_policy_to_yojson
          x.desired_f_sx_lustre_deletion_policy );
      ( "CurrentFSxLustreDeletionPolicy",
        option_to_yojson cluster_f_sx_lustre_deletion_policy_to_yojson
          x.current_f_sx_lustre_deletion_policy );
      ( "DesiredFSxLustreConfig",
        option_to_yojson f_sx_lustre_config_to_yojson x.desired_f_sx_lustre_config );
      ( "CurrentFSxLustreConfig",
        option_to_yojson f_sx_lustre_config_to_yojson x.current_f_sx_lustre_config );
    ]

let cluster_restricted_instance_groups_config_output_to_yojson
    (x : cluster_restricted_instance_groups_config_output) =
  assoc_to_yojson
    [
      ( "SharedEnvironmentConfig",
        Some (cluster_shared_environment_config_details_to_yojson x.shared_environment_config) );
    ]

let cluster_auto_scaling_status_to_yojson (x : cluster_auto_scaling_status) =
  match x with
  | DELETING -> `String "Deleting"
  | CREATING -> `String "Creating"
  | FAILED -> `String "Failed"
  | INSERVICE -> `String "InService"

let cluster_auto_scaling_config_output_to_yojson (x : cluster_auto_scaling_config_output) =
  assoc_to_yojson
    [
      ( "FailureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("Status", Some (cluster_auto_scaling_status_to_yojson x.status));
      ("AutoScalerType", option_to_yojson cluster_auto_scaler_type_to_yojson x.auto_scaler_type);
      ("Mode", Some (cluster_auto_scaling_mode_to_yojson x.mode));
    ]

let describe_cluster_response_to_yojson (x : describe_cluster_response) =
  assoc_to_yojson
    [
      ("AutoScaling", option_to_yojson cluster_auto_scaling_config_output_to_yojson x.auto_scaling);
      ("ClusterRole", option_to_yojson role_arn_to_yojson x.cluster_role);
      ( "NodeProvisioningMode",
        option_to_yojson cluster_node_provisioning_mode_to_yojson x.node_provisioning_mode );
      ("NodeRecovery", option_to_yojson cluster_node_recovery_to_yojson x.node_recovery);
      ( "TieredStorageConfig",
        option_to_yojson cluster_tiered_storage_config_to_yojson x.tiered_storage_config );
      ("Orchestrator", option_to_yojson cluster_orchestrator_to_yojson x.orchestrator);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "RestrictedInstanceGroupsConfig",
        option_to_yojson cluster_restricted_instance_groups_config_output_to_yojson
          x.restricted_instance_groups_config );
      ( "RestrictedInstanceGroups",
        option_to_yojson cluster_restricted_instance_group_details_list_to_yojson
          x.restricted_instance_groups );
      ("InstanceGroups", Some (cluster_instance_group_details_list_to_yojson x.instance_groups));
      ("FailureMessage", option_to_yojson string__to_yojson x.failure_message);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ClusterStatus", Some (cluster_status_to_yojson x.cluster_status));
      ("ClusterName", option_to_yojson cluster_name_to_yojson x.cluster_name);
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
    ]

let describe_cluster_request_to_yojson (x : describe_cluster_request) =
  assoc_to_yojson [ ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name)) ]

let auto_ml_channel_type_to_yojson (x : auto_ml_channel_type) =
  match x with VALIDATION -> `String "validation" | TRAINING -> `String "training"

let auto_mls3_data_type_to_yojson (x : auto_mls3_data_type) =
  match x with
  | AUGMENTED_MANIFEST_FILE -> `String "AugmentedManifestFile"
  | S3_PREFIX -> `String "S3Prefix"
  | MANIFEST_FILE -> `String "ManifestFile"

let auto_mls3_data_source_to_yojson (x : auto_mls3_data_source) =
  assoc_to_yojson
    [
      ("S3Uri", Some (s3_uri_to_yojson x.s3_uri));
      ("S3DataType", Some (auto_mls3_data_type_to_yojson x.s3_data_type));
    ]

let auto_ml_data_source_to_yojson (x : auto_ml_data_source) =
  assoc_to_yojson [ ("S3DataSource", Some (auto_mls3_data_source_to_yojson x.s3_data_source)) ]

let auto_ml_job_channel_to_yojson (x : auto_ml_job_channel) =
  assoc_to_yojson
    [
      ("DataSource", option_to_yojson auto_ml_data_source_to_yojson x.data_source);
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("ChannelType", option_to_yojson auto_ml_channel_type_to_yojson x.channel_type);
    ]

let auto_ml_job_input_data_config_to_yojson tree = list_to_yojson auto_ml_job_channel_to_yojson tree

let auto_ml_output_data_config_to_yojson (x : auto_ml_output_data_config) =
  assoc_to_yojson
    [
      ("S3OutputPath", Some (s3_uri_to_yojson x.s3_output_path));
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let auto_ml_job_objective_to_yojson (x : auto_ml_job_objective) =
  assoc_to_yojson [ ("MetricName", Some (auto_ml_metric_enum_to_yojson x.metric_name)) ]

let image_classification_job_config_to_yojson (x : image_classification_job_config) =
  assoc_to_yojson
    [
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
    ]

let auto_ml_problem_type_config_to_yojson (x : auto_ml_problem_type_config) =
  match x with
  | TextGenerationJobConfig arg ->
      assoc_to_yojson
        [ ("TextGenerationJobConfig", Some (text_generation_job_config_to_yojson arg)) ]
  | TabularJobConfig arg ->
      assoc_to_yojson [ ("TabularJobConfig", Some (tabular_job_config_to_yojson arg)) ]
  | TimeSeriesForecastingJobConfig arg ->
      assoc_to_yojson
        [
          ("TimeSeriesForecastingJobConfig", Some (time_series_forecasting_job_config_to_yojson arg));
        ]
  | TextClassificationJobConfig arg ->
      assoc_to_yojson
        [ ("TextClassificationJobConfig", Some (text_classification_job_config_to_yojson arg)) ]
  | ImageClassificationJobConfig arg ->
      assoc_to_yojson
        [ ("ImageClassificationJobConfig", Some (image_classification_job_config_to_yojson arg)) ]

let auto_ml_problem_type_config_name_to_yojson (x : auto_ml_problem_type_config_name) =
  match x with
  | TEXT_GENERATION -> `String "TextGeneration"
  | TABULAR -> `String "Tabular"
  | TIMESERIES_FORECASTING -> `String "TimeSeriesForecasting"
  | TEXT_CLASSIFICATION -> `String "TextClassification"
  | IMAGE_CLASSIFICATION -> `String "ImageClassification"

let candidate_definition_notebook_location_to_yojson = string_to_yojson
let data_exploration_notebook_location_to_yojson = string_to_yojson

let auto_ml_job_artifacts_to_yojson (x : auto_ml_job_artifacts) =
  assoc_to_yojson
    [
      ( "DataExplorationNotebookLocation",
        option_to_yojson data_exploration_notebook_location_to_yojson
          x.data_exploration_notebook_location );
      ( "CandidateDefinitionNotebookLocation",
        option_to_yojson candidate_definition_notebook_location_to_yojson
          x.candidate_definition_notebook_location );
    ]

let auto_ml_problem_type_resolved_attributes_to_yojson
    (x : auto_ml_problem_type_resolved_attributes) =
  match x with
  | TextGenerationResolvedAttributes arg ->
      assoc_to_yojson
        [
          ( "TextGenerationResolvedAttributes",
            Some (text_generation_resolved_attributes_to_yojson arg) );
        ]
  | TabularResolvedAttributes arg ->
      assoc_to_yojson
        [ ("TabularResolvedAttributes", Some (tabular_resolved_attributes_to_yojson arg)) ]

let auto_ml_resolved_attributes_to_yojson (x : auto_ml_resolved_attributes) =
  assoc_to_yojson
    [
      ( "AutoMLProblemTypeResolvedAttributes",
        option_to_yojson auto_ml_problem_type_resolved_attributes_to_yojson
          x.auto_ml_problem_type_resolved_attributes );
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
    ]

let auto_generate_endpoint_name_to_yojson = bool_to_yojson

let model_deploy_config_to_yojson (x : model_deploy_config) =
  assoc_to_yojson
    [
      ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name);
      ( "AutoGenerateEndpointName",
        option_to_yojson auto_generate_endpoint_name_to_yojson x.auto_generate_endpoint_name );
    ]

let model_deploy_result_to_yojson (x : model_deploy_result) =
  assoc_to_yojson [ ("EndpointName", option_to_yojson endpoint_name_to_yojson x.endpoint_name) ]

let auto_ml_data_split_config_to_yojson (x : auto_ml_data_split_config) =
  assoc_to_yojson
    [ ("ValidationFraction", option_to_yojson validation_fraction_to_yojson x.validation_fraction) ]

let auto_ml_security_config_to_yojson (x : auto_ml_security_config) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("VolumeKmsKeyId", option_to_yojson kms_key_id_to_yojson x.volume_kms_key_id);
    ]

let emr_serverless_compute_config_to_yojson (x : emr_serverless_compute_config) =
  assoc_to_yojson [ ("ExecutionRoleARN", Some (role_arn_to_yojson x.execution_role_ar_n)) ]

let auto_ml_compute_config_to_yojson (x : auto_ml_compute_config) =
  assoc_to_yojson
    [
      ( "EmrServerlessComputeConfig",
        option_to_yojson emr_serverless_compute_config_to_yojson x.emr_serverless_compute_config );
    ]

let describe_auto_ml_job_v2_response_to_yojson (x : describe_auto_ml_job_v2_response) =
  assoc_to_yojson
    [
      ( "AutoMLComputeConfig",
        option_to_yojson auto_ml_compute_config_to_yojson x.auto_ml_compute_config );
      ("SecurityConfig", option_to_yojson auto_ml_security_config_to_yojson x.security_config);
      ("DataSplitConfig", option_to_yojson auto_ml_data_split_config_to_yojson x.data_split_config);
      ("ModelDeployResult", option_to_yojson model_deploy_result_to_yojson x.model_deploy_result);
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
      ( "ResolvedAttributes",
        option_to_yojson auto_ml_resolved_attributes_to_yojson x.resolved_attributes );
      ( "AutoMLJobArtifacts",
        option_to_yojson auto_ml_job_artifacts_to_yojson x.auto_ml_job_artifacts );
      ( "AutoMLJobSecondaryStatus",
        Some (auto_ml_job_secondary_status_to_yojson x.auto_ml_job_secondary_status) );
      ("AutoMLJobStatus", Some (auto_ml_job_status_to_yojson x.auto_ml_job_status));
      ("BestCandidate", option_to_yojson auto_ml_candidate_to_yojson x.best_candidate);
      ( "PartialFailureReasons",
        option_to_yojson auto_ml_partial_failure_reasons_to_yojson x.partial_failure_reasons );
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ( "AutoMLProblemTypeConfigName",
        option_to_yojson auto_ml_problem_type_config_name_to_yojson
          x.auto_ml_problem_type_config_name );
      ( "AutoMLProblemTypeConfig",
        option_to_yojson auto_ml_problem_type_config_to_yojson x.auto_ml_problem_type_config );
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ( "AutoMLJobInputDataConfig",
        Some (auto_ml_job_input_data_config_to_yojson x.auto_ml_job_input_data_config) );
      ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn));
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
    ]

let describe_auto_ml_job_v2_request_to_yojson (x : describe_auto_ml_job_v2_request) =
  assoc_to_yojson [ ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name)) ]

let auto_ml_channel_to_yojson (x : auto_ml_channel) =
  assoc_to_yojson
    [
      ( "SampleWeightAttributeName",
        option_to_yojson sample_weight_attribute_name_to_yojson x.sample_weight_attribute_name );
      ("ChannelType", option_to_yojson auto_ml_channel_type_to_yojson x.channel_type);
      ("ContentType", option_to_yojson content_type_to_yojson x.content_type);
      ("TargetAttributeName", Some (target_attribute_name_to_yojson x.target_attribute_name));
      ("CompressionType", option_to_yojson compression_type_to_yojson x.compression_type);
      ("DataSource", option_to_yojson auto_ml_data_source_to_yojson x.data_source);
    ]

let auto_ml_input_data_config_to_yojson tree = list_to_yojson auto_ml_channel_to_yojson tree

let auto_ml_candidate_generation_config_to_yojson (x : auto_ml_candidate_generation_config) =
  assoc_to_yojson
    [
      ("AlgorithmsConfig", option_to_yojson auto_ml_algorithms_config_to_yojson x.algorithms_config);
      ("FeatureSpecificationS3Uri", option_to_yojson s3_uri_to_yojson x.feature_specification_s3_uri);
    ]

let auto_ml_job_config_to_yojson (x : auto_ml_job_config) =
  assoc_to_yojson
    [
      ("Mode", option_to_yojson auto_ml_mode_to_yojson x.mode);
      ("DataSplitConfig", option_to_yojson auto_ml_data_split_config_to_yojson x.data_split_config);
      ( "CandidateGenerationConfig",
        option_to_yojson auto_ml_candidate_generation_config_to_yojson x.candidate_generation_config
      );
      ("SecurityConfig", option_to_yojson auto_ml_security_config_to_yojson x.security_config);
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
    ]

let resolved_attributes_to_yojson (x : resolved_attributes) =
  assoc_to_yojson
    [
      ( "CompletionCriteria",
        option_to_yojson auto_ml_job_completion_criteria_to_yojson x.completion_criteria );
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
    ]

let describe_auto_ml_job_response_to_yojson (x : describe_auto_ml_job_response) =
  assoc_to_yojson
    [
      ("ModelDeployResult", option_to_yojson model_deploy_result_to_yojson x.model_deploy_result);
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
      ("ResolvedAttributes", option_to_yojson resolved_attributes_to_yojson x.resolved_attributes);
      ( "AutoMLJobArtifacts",
        option_to_yojson auto_ml_job_artifacts_to_yojson x.auto_ml_job_artifacts );
      ( "GenerateCandidateDefinitionsOnly",
        option_to_yojson generate_candidate_definitions_only_to_yojson
          x.generate_candidate_definitions_only );
      ( "AutoMLJobSecondaryStatus",
        Some (auto_ml_job_secondary_status_to_yojson x.auto_ml_job_secondary_status) );
      ("AutoMLJobStatus", Some (auto_ml_job_status_to_yojson x.auto_ml_job_status));
      ("BestCandidate", option_to_yojson auto_ml_candidate_to_yojson x.best_candidate);
      ( "PartialFailureReasons",
        option_to_yojson auto_ml_partial_failure_reasons_to_yojson x.partial_failure_reasons );
      ("FailureReason", option_to_yojson auto_ml_failure_reason_to_yojson x.failure_reason);
      ("LastModifiedTime", Some (timestamp_to_yojson x.last_modified_time));
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("AutoMLJobConfig", option_to_yojson auto_ml_job_config_to_yojson x.auto_ml_job_config);
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (auto_ml_input_data_config_to_yojson x.input_data_config));
      ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn));
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
    ]

let describe_auto_ml_job_request_to_yojson (x : describe_auto_ml_job_request) =
  assoc_to_yojson [ ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name)) ]

let describe_artifact_response_to_yojson (x : describe_artifact_response) =
  assoc_to_yojson
    [
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("ArtifactType", option_to_yojson string256_to_yojson x.artifact_type);
      ("Source", option_to_yojson artifact_source_to_yojson x.source);
      ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn);
      ("ArtifactName", option_to_yojson experiment_entity_name_or_arn_to_yojson x.artifact_name);
    ]

let describe_artifact_request_to_yojson (x : describe_artifact_request) =
  assoc_to_yojson [ ("ArtifactArn", Some (artifact_arn_to_yojson x.artifact_arn)) ]

let describe_app_image_config_response_to_yojson (x : describe_app_image_config_response) =
  assoc_to_yojson
    [
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "AppImageConfigName",
        option_to_yojson app_image_config_name_to_yojson x.app_image_config_name );
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
    ]

let describe_app_image_config_request_to_yojson (x : describe_app_image_config_request) =
  assoc_to_yojson
    [ ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name)) ]

let app_arn_to_yojson = string_to_yojson

let describe_app_response_to_yojson (x : describe_app_response) =
  assoc_to_yojson
    [
      ( "BuiltInLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.built_in_lifecycle_config_arn );
      ("ResourceSpec", option_to_yojson resource_spec_to_yojson x.resource_spec);
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "LastUserActivityTimestamp",
        option_to_yojson timestamp_to_yojson x.last_user_activity_timestamp );
      ( "LastHealthCheckTimestamp",
        option_to_yojson timestamp_to_yojson x.last_health_check_timestamp );
      ("RecoveryMode", option_to_yojson boolean__to_yojson x.recovery_mode);
      ( "EffectiveTrustedIdentityPropagationStatus",
        option_to_yojson feature_status_to_yojson x.effective_trusted_identity_propagation_status );
      ("Status", option_to_yojson app_status_to_yojson x.status);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("AppName", option_to_yojson app_name_to_yojson x.app_name);
      ("AppType", option_to_yojson app_type_to_yojson x.app_type);
      ("AppArn", option_to_yojson app_arn_to_yojson x.app_arn);
    ]

let describe_app_request_to_yojson (x : describe_app_request) =
  assoc_to_yojson
    [
      ("AppName", Some (app_name_to_yojson x.app_name));
      ("AppType", Some (app_type_to_yojson x.app_type));
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let algorithm_validation_profile_to_yojson (x : algorithm_validation_profile) =
  assoc_to_yojson
    [
      ( "TransformJobDefinition",
        option_to_yojson transform_job_definition_to_yojson x.transform_job_definition );
      ("TrainingJobDefinition", Some (training_job_definition_to_yojson x.training_job_definition));
      ("ProfileName", Some (entity_name_to_yojson x.profile_name));
    ]

let algorithm_validation_profiles_to_yojson tree =
  list_to_yojson algorithm_validation_profile_to_yojson tree

let algorithm_validation_specification_to_yojson (x : algorithm_validation_specification) =
  assoc_to_yojson
    [
      ("ValidationProfiles", Some (algorithm_validation_profiles_to_yojson x.validation_profiles));
      ("ValidationRole", Some (role_arn_to_yojson x.validation_role));
    ]

let detailed_algorithm_status_to_yojson (x : detailed_algorithm_status) =
  match x with
  | FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | IN_PROGRESS -> `String "InProgress"
  | NOT_STARTED -> `String "NotStarted"

let algorithm_status_item_to_yojson (x : algorithm_status_item) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("Status", Some (detailed_algorithm_status_to_yojson x.status));
      ("Name", Some (entity_name_to_yojson x.name));
    ]

let algorithm_status_item_list_to_yojson tree = list_to_yojson algorithm_status_item_to_yojson tree

let algorithm_status_details_to_yojson (x : algorithm_status_details) =
  assoc_to_yojson
    [
      ( "ImageScanStatuses",
        option_to_yojson algorithm_status_item_list_to_yojson x.image_scan_statuses );
      ( "ValidationStatuses",
        option_to_yojson algorithm_status_item_list_to_yojson x.validation_statuses );
    ]

let describe_algorithm_output_to_yojson (x : describe_algorithm_output) =
  assoc_to_yojson
    [
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ("ProductId", option_to_yojson product_id_to_yojson x.product_id);
      ( "AlgorithmStatusDetails",
        Some (algorithm_status_details_to_yojson x.algorithm_status_details) );
      ("AlgorithmStatus", Some (algorithm_status_to_yojson x.algorithm_status));
      ( "ValidationSpecification",
        option_to_yojson algorithm_validation_specification_to_yojson x.validation_specification );
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ("TrainingSpecification", Some (training_specification_to_yojson x.training_specification));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("AlgorithmDescription", option_to_yojson entity_description_to_yojson x.algorithm_description);
      ("AlgorithmArn", Some (algorithm_arn_to_yojson x.algorithm_arn));
      ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name));
    ]

let describe_algorithm_input_to_yojson (x : describe_algorithm_input) =
  assoc_to_yojson [ ("AlgorithmName", Some (arn_or_name_to_yojson x.algorithm_name)) ]

let ai_channel_name_to_yojson = string_to_yojson

let ai_workload_s3_data_source_to_yojson (x : ai_workload_s3_data_source) =
  assoc_to_yojson [ ("S3Uri", Some (s3_uri_to_yojson x.s3_uri)) ]

let ai_workload_data_source_to_yojson (x : ai_workload_data_source) =
  assoc_to_yojson
    [ ("S3DataSource", option_to_yojson ai_workload_s3_data_source_to_yojson x.s3_data_source) ]

let ai_workload_input_data_config_to_yojson (x : ai_workload_input_data_config) =
  assoc_to_yojson
    [
      ("DataSource", Some (ai_workload_data_source_to_yojson x.data_source));
      ("ChannelName", Some (ai_channel_name_to_yojson x.channel_name));
    ]

let ai_workload_input_data_config_list_to_yojson tree =
  list_to_yojson ai_workload_input_data_config_to_yojson tree

let ai_dataset_config_to_yojson (x : ai_dataset_config) =
  match x with
  | InputDataConfig arg ->
      assoc_to_yojson
        [ ("InputDataConfig", Some (ai_workload_input_data_config_list_to_yojson arg)) ]

let ai_workload_configs_to_yojson (x : ai_workload_configs) =
  assoc_to_yojson [ ("WorkloadSpec", Some (workload_spec_to_yojson x.workload_spec)) ]

let describe_ai_workload_config_response_to_yojson (x : describe_ai_workload_config_response) =
  assoc_to_yojson
    [
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AIWorkloadConfigs", option_to_yojson ai_workload_configs_to_yojson x.ai_workload_configs);
      ("DatasetConfig", option_to_yojson ai_dataset_config_to_yojson x.dataset_config);
      ("AIWorkloadConfigArn", Some (ai_workload_config_arn_to_yojson x.ai_workload_config_arn));
      ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name));
    ]

let describe_ai_workload_config_request_to_yojson (x : describe_ai_workload_config_request) =
  assoc_to_yojson
    [ ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name)) ]

let ai_model_source_s3_to_yojson (x : ai_model_source_s3) =
  assoc_to_yojson [ ("S3Uri", option_to_yojson s3_uri_to_yojson x.s3_uri) ]

let ai_model_source_to_yojson (x : ai_model_source) =
  match x with S3 arg -> assoc_to_yojson [ ("S3", Some (ai_model_source_s3_to_yojson arg)) ]

let ai_resource_identifier_to_yojson = string_to_yojson
let ai_mlflow_resource_arn_to_yojson = string_to_yojson
let ai_mlflow_experiment_name_to_yojson = string_to_yojson
let ai_mlflow_run_name_to_yojson = string_to_yojson

let ai_mlflow_config_to_yojson (x : ai_mlflow_config) =
  assoc_to_yojson
    [
      ("MlflowRunName", option_to_yojson ai_mlflow_run_name_to_yojson x.mlflow_run_name);
      ( "MlflowExperimentName",
        option_to_yojson ai_mlflow_experiment_name_to_yojson x.mlflow_experiment_name );
      ("MlflowResourceArn", Some (ai_mlflow_resource_arn_to_yojson x.mlflow_resource_arn));
    ]

let ai_recommendation_output_result_to_yojson (x : ai_recommendation_output_result) =
  assoc_to_yojson
    [
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
      ( "ModelPackageGroupIdentifier",
        option_to_yojson ai_resource_identifier_to_yojson x.model_package_group_identifier );
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
    ]

let ai_recommendation_inference_framework_to_yojson (x : ai_recommendation_inference_framework) =
  match x with VLLM -> `String "VLLM" | LMI -> `String "LMI"

let ai_recommendation_inference_specification_to_yojson
    (x : ai_recommendation_inference_specification) =
  assoc_to_yojson
    [ ("Framework", option_to_yojson ai_recommendation_inference_framework_to_yojson x.framework) ]

let ai_recommendation_allow_optimization_to_yojson = bool_to_yojson

let ai_recommendation_metric_to_yojson (x : ai_recommendation_metric) =
  match x with
  | COST -> `String "cost"
  | THROUGHPUT -> `String "throughput"
  | TTFT_MS -> `String "ttft-ms"

let ai_recommendation_constraint_to_yojson (x : ai_recommendation_constraint) =
  assoc_to_yojson [ ("Metric", Some (ai_recommendation_metric_to_yojson x.metric)) ]

let ai_recommendation_constraint_list_to_yojson tree =
  list_to_yojson ai_recommendation_constraint_to_yojson tree

let ai_recommendation_performance_target_to_yojson (x : ai_recommendation_performance_target) =
  assoc_to_yojson
    [ ("Constraints", Some (ai_recommendation_constraint_list_to_yojson x.constraints)) ]

let ai_recommendation_optimization_type_to_yojson (x : ai_recommendation_optimization_type) =
  match x with
  | KERNEL_TUNING -> `String "KernelTuning"
  | SPECULATIVE_DECODING -> `String "SpeculativeDecoding"

let ai_recommendation_optimization_config_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let ai_recommendation_optimization_detail_to_yojson (x : ai_recommendation_optimization_detail) =
  assoc_to_yojson
    [
      ( "OptimizationConfig",
        option_to_yojson ai_recommendation_optimization_config_map_to_yojson x.optimization_config
      );
      ("OptimizationType", Some (ai_recommendation_optimization_type_to_yojson x.optimization_type));
    ]

let ai_recommendation_optimization_detail_list_to_yojson tree =
  list_to_yojson ai_recommendation_optimization_detail_to_yojson tree

let ai_inference_specification_name_to_yojson = string_to_yojson

let ai_recommendation_instance_type_to_yojson (x : ai_recommendation_instance_type) =
  match x with
  | ML_P6_B200_48XLARGE -> `String "ml.p6-b200.48xlarge"
  | ML_P5EN_48XLARGE -> `String "ml.p5en.48xlarge"
  | ML_P5E_48XLARGE -> `String "ml.p5e.48xlarge"
  | ML_P5_48XLARGE -> `String "ml.p5.48xlarge"
  | ML_P5_4XLARGE -> `String "ml.p5.4xlarge"
  | ML_P4DE_24XLARGE -> `String "ml.p4de.24xlarge"
  | ML_P4D_24XLARGE -> `String "ml.p4d.24xlarge"
  | ML_P3_16XLARGE -> `String "ml.p3.16xlarge"
  | ML_P3_8XLARGE -> `String "ml.p3.8xlarge"
  | ML_P3_2XLARGE -> `String "ml.p3.2xlarge"
  | ML_G7E_48XLARGE -> `String "ml.g7e.48xlarge"
  | ML_G7E_24XLARGE -> `String "ml.g7e.24xlarge"
  | ML_G7E_12XLARGE -> `String "ml.g7e.12xlarge"
  | ML_G7E_8XLARGE -> `String "ml.g7e.8xlarge"
  | ML_G7E_4XLARGE -> `String "ml.g7e.4xlarge"
  | ML_G7E_2XLARGE -> `String "ml.g7e.2xlarge"
  | ML_G6E_48XLARGE -> `String "ml.g6e.48xlarge"
  | ML_G6E_24XLARGE -> `String "ml.g6e.24xlarge"
  | ML_G6E_16XLARGE -> `String "ml.g6e.16xlarge"
  | ML_G6E_12XLARGE -> `String "ml.g6e.12xlarge"
  | ML_G6E_8XLARGE -> `String "ml.g6e.8xlarge"
  | ML_G6E_4XLARGE -> `String "ml.g6e.4xlarge"
  | ML_G6E_2XLARGE -> `String "ml.g6e.2xlarge"
  | ML_G6E_XLARGE -> `String "ml.g6e.xlarge"
  | ML_G6_48XLARGE -> `String "ml.g6.48xlarge"
  | ML_G6_24XLARGE -> `String "ml.g6.24xlarge"
  | ML_G6_16XLARGE -> `String "ml.g6.16xlarge"
  | ML_G6_12XLARGE -> `String "ml.g6.12xlarge"
  | ML_G6_8XLARGE -> `String "ml.g6.8xlarge"
  | ML_G6_4XLARGE -> `String "ml.g6.4xlarge"
  | ML_G6_2XLARGE -> `String "ml.g6.2xlarge"
  | ML_G6_XLARGE -> `String "ml.g6.xlarge"
  | ML_G5_48XLARGE -> `String "ml.g5.48xlarge"
  | ML_G5_24XLARGE -> `String "ml.g5.24xlarge"
  | ML_G5_16XLARGE -> `String "ml.g5.16xlarge"
  | ML_G5_12XLARGE -> `String "ml.g5.12xlarge"
  | ML_G5_8XLARGE -> `String "ml.g5.8xlarge"
  | ML_G5_4XLARGE -> `String "ml.g5.4xlarge"
  | ML_G5_2XLARGE -> `String "ml.g5.2xlarge"
  | ML_G5_XLARGE -> `String "ml.g5.xlarge"

let ai_recommendation_instance_count_to_yojson = int_to_yojson
let ai_recommendation_copy_count_per_instance_to_yojson = int_to_yojson

let ai_recommendation_instance_detail_to_yojson (x : ai_recommendation_instance_detail) =
  assoc_to_yojson
    [
      ( "CopyCountPerInstance",
        option_to_yojson ai_recommendation_copy_count_per_instance_to_yojson
          x.copy_count_per_instance );
      ("InstanceCount", option_to_yojson ai_recommendation_instance_count_to_yojson x.instance_count);
      ("InstanceType", option_to_yojson ai_recommendation_instance_type_to_yojson x.instance_type);
    ]

let ai_recommendation_instance_detail_list_to_yojson tree =
  list_to_yojson ai_recommendation_instance_detail_to_yojson tree

let ai_recommendation_model_details_to_yojson (x : ai_recommendation_model_details) =
  assoc_to_yojson
    [
      ( "InstanceDetails",
        option_to_yojson ai_recommendation_instance_detail_list_to_yojson x.instance_details );
      ( "InferenceSpecificationName",
        option_to_yojson ai_inference_specification_name_to_yojson x.inference_specification_name );
      ("ModelPackageArn", option_to_yojson model_package_arn_to_yojson x.model_package_arn);
    ]

let ai_recommendation_deployment_s3_channel_to_yojson (x : ai_recommendation_deployment_s3_channel)
    =
  assoc_to_yojson
    [
      ("Uri", option_to_yojson s3_uri_to_yojson x.uri);
      ("ChannelName", option_to_yojson ai_channel_name_to_yojson x.channel_name);
    ]

let ai_recommendation_deployment_s3_channel_list_to_yojson tree =
  list_to_yojson ai_recommendation_deployment_s3_channel_to_yojson tree

let ai_recommendation_deployment_configuration_to_yojson
    (x : ai_recommendation_deployment_configuration) =
  assoc_to_yojson
    [
      ("EnvironmentVariables", option_to_yojson environment_map_to_yojson x.environment_variables);
      ( "CopyCountPerInstance",
        option_to_yojson ai_recommendation_copy_count_per_instance_to_yojson
          x.copy_count_per_instance );
      ("InstanceCount", option_to_yojson ai_recommendation_instance_count_to_yojson x.instance_count);
      ("InstanceType", option_to_yojson ai_recommendation_instance_type_to_yojson x.instance_type);
      ("ImageUri", option_to_yojson string__to_yojson x.image_uri);
      ("S3", option_to_yojson ai_recommendation_deployment_s3_channel_list_to_yojson x.s3);
    ]

let ai_recommendation_performance_metric_to_yojson (x : ai_recommendation_performance_metric) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson string__to_yojson x.unit_);
      ("Value", Some (string__to_yojson x.value));
      ("Stat", option_to_yojson string__to_yojson x.stat);
      ("Metric", Some (string__to_yojson x.metric));
    ]

let expected_performance_list_to_yojson tree =
  list_to_yojson ai_recommendation_performance_metric_to_yojson tree

let ai_recommendation_to_yojson (x : ai_recommendation) =
  assoc_to_yojson
    [
      ( "ExpectedPerformance",
        option_to_yojson expected_performance_list_to_yojson x.expected_performance );
      ("AIBenchmarkJobArn", option_to_yojson ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn);
      ( "DeploymentConfiguration",
        option_to_yojson ai_recommendation_deployment_configuration_to_yojson
          x.deployment_configuration );
      ("ModelDetails", option_to_yojson ai_recommendation_model_details_to_yojson x.model_details);
      ( "OptimizationDetails",
        option_to_yojson ai_recommendation_optimization_detail_list_to_yojson x.optimization_details
      );
      ("RecommendationDescription", option_to_yojson string__to_yojson x.recommendation_description);
    ]

let ai_recommendation_list_to_yojson tree = list_to_yojson ai_recommendation_to_yojson tree

let ai_recommendation_instance_type_list_to_yojson tree =
  list_to_yojson ai_recommendation_instance_type_to_yojson tree

let ai_capacity_reservation_preference_to_yojson (x : ai_capacity_reservation_preference) =
  match x with CAPACITY_RESERVATIONS_ONLY -> `String "capacity-reservations-only"

let ai_ml_reservation_arn_to_yojson = string_to_yojson
let ai_ml_reservation_arn_list_to_yojson tree = list_to_yojson ai_ml_reservation_arn_to_yojson tree

let ai_capacity_reservation_config_to_yojson (x : ai_capacity_reservation_config) =
  assoc_to_yojson
    [
      ( "MlReservationArns",
        option_to_yojson ai_ml_reservation_arn_list_to_yojson x.ml_reservation_arns );
      ( "CapacityReservationPreference",
        option_to_yojson ai_capacity_reservation_preference_to_yojson
          x.capacity_reservation_preference );
    ]

let ai_recommendation_compute_spec_to_yojson (x : ai_recommendation_compute_spec) =
  assoc_to_yojson
    [
      ( "CapacityReservationConfig",
        option_to_yojson ai_capacity_reservation_config_to_yojson x.capacity_reservation_config );
      ( "InstanceTypes",
        option_to_yojson ai_recommendation_instance_type_list_to_yojson x.instance_types );
    ]

let describe_ai_recommendation_job_response_to_yojson (x : describe_ai_recommendation_job_response)
    =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("ComputeSpec", option_to_yojson ai_recommendation_compute_spec_to_yojson x.compute_spec);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Recommendations", option_to_yojson ai_recommendation_list_to_yojson x.recommendations);
      ( "PerformanceTarget",
        option_to_yojson ai_recommendation_performance_target_to_yojson x.performance_target );
      ( "OptimizeModel",
        option_to_yojson ai_recommendation_allow_optimization_to_yojson x.optimize_model );
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ( "InferenceSpecification",
        option_to_yojson ai_recommendation_inference_specification_to_yojson
          x.inference_specification );
      ("OutputConfig", Some (ai_recommendation_output_result_to_yojson x.output_config));
      ("ModelSource", Some (ai_model_source_to_yojson x.model_source));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "AIRecommendationJobStatus",
        Some (ai_recommendation_job_status_to_yojson x.ai_recommendation_job_status) );
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
      ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name));
    ]

let describe_ai_recommendation_job_request_to_yojson (x : describe_ai_recommendation_job_request) =
  assoc_to_yojson
    [ ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name)) ]

let ai_benchmark_inference_component_to_yojson (x : ai_benchmark_inference_component) =
  assoc_to_yojson [ ("Identifier", Some (ai_resource_identifier_to_yojson x.identifier)) ]

let ai_benchmark_inference_component_list_to_yojson tree =
  list_to_yojson ai_benchmark_inference_component_to_yojson tree

let ai_benchmark_endpoint_to_yojson (x : ai_benchmark_endpoint) =
  assoc_to_yojson
    [
      ( "InferenceComponents",
        option_to_yojson ai_benchmark_inference_component_list_to_yojson x.inference_components );
      ("TargetContainerHostname", option_to_yojson string__to_yojson x.target_container_hostname);
      ("Identifier", Some (ai_resource_identifier_to_yojson x.identifier));
    ]

let ai_benchmark_target_to_yojson (x : ai_benchmark_target) =
  match x with
  | Endpoint arg -> assoc_to_yojson [ ("Endpoint", Some (ai_benchmark_endpoint_to_yojson arg)) ]

let ai_cloud_watch_logs_to_yojson (x : ai_cloud_watch_logs) =
  assoc_to_yojson
    [
      ("LogStreamName", option_to_yojson string__to_yojson x.log_stream_name);
      ("LogGroupArn", option_to_yojson string__to_yojson x.log_group_arn);
    ]

let ai_cloud_watch_logs_list_to_yojson tree = list_to_yojson ai_cloud_watch_logs_to_yojson tree

let ai_benchmark_output_result_to_yojson (x : ai_benchmark_output_result) =
  assoc_to_yojson
    [
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
      ("CloudWatchLogs", option_to_yojson ai_cloud_watch_logs_list_to_yojson x.cloud_watch_logs);
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
    ]

let ai_benchmark_network_config_to_yojson (x : ai_benchmark_network_config) =
  assoc_to_yojson [ ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config) ]

let describe_ai_benchmark_job_response_to_yojson (x : describe_ai_benchmark_job_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("CreationTime", Some (timestamp_to_yojson x.creation_time));
      ("NetworkConfig", option_to_yojson ai_benchmark_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ("OutputConfig", Some (ai_benchmark_output_result_to_yojson x.output_config));
      ("BenchmarkTarget", Some (ai_benchmark_target_to_yojson x.benchmark_target));
      ("FailureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("AIBenchmarkJobStatus", Some (ai_benchmark_job_status_to_yojson x.ai_benchmark_job_status));
      ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn));
      ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name));
    ]

let describe_ai_benchmark_job_request_to_yojson (x : describe_ai_benchmark_job_request) =
  assoc_to_yojson
    [ ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name)) ]

let describe_action_response_to_yojson (x : describe_action_response) =
  assoc_to_yojson
    [
      ("LineageGroupArn", option_to_yojson lineage_group_arn_to_yojson x.lineage_group_arn);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("LastModifiedBy", option_to_yojson user_context_to_yojson x.last_modified_by);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedBy", option_to_yojson user_context_to_yojson x.created_by);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("ActionType", option_to_yojson string256_to_yojson x.action_type);
      ("Source", option_to_yojson action_source_to_yojson x.source);
      ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn);
      ("ActionName", option_to_yojson experiment_entity_name_or_arn_to_yojson x.action_name);
    ]

let describe_action_request_to_yojson (x : describe_action_request) =
  assoc_to_yojson [ ("ActionName", Some (experiment_entity_name_or_arn_to_yojson x.action_name)) ]

let deregister_devices_request_to_yojson (x : deregister_devices_request) =
  assoc_to_yojson
    [
      ("DeviceNames", Some (device_names_to_yojson x.device_names));
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
    ]

let delete_workteam_response_to_yojson (x : delete_workteam_response) =
  assoc_to_yojson [ ("Success", Some (success_to_yojson x.success)) ]

let delete_workteam_request_to_yojson (x : delete_workteam_request) =
  assoc_to_yojson [ ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name)) ]

let delete_workforce_response_to_yojson = unit_to_yojson

let delete_workforce_request_to_yojson (x : delete_workforce_request) =
  assoc_to_yojson [ ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name)) ]

let delete_user_profile_request_to_yojson (x : delete_user_profile_request) =
  assoc_to_yojson
    [
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let delete_trial_component_response_to_yojson (x : delete_trial_component_response) =
  assoc_to_yojson
    [ ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn) ]

let delete_trial_component_request_to_yojson (x : delete_trial_component_request) =
  assoc_to_yojson
    [ ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name)) ]

let delete_trial_response_to_yojson (x : delete_trial_response) =
  assoc_to_yojson [ ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn) ]

let delete_trial_request_to_yojson (x : delete_trial_request) =
  assoc_to_yojson [ ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name)) ]

let delete_training_job_request_to_yojson (x : delete_training_job_request) =
  assoc_to_yojson [ ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name)) ]

let delete_tags_output_to_yojson = unit_to_yojson

let delete_tags_input_to_yojson (x : delete_tags_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let delete_studio_lifecycle_config_request_to_yojson (x : delete_studio_lifecycle_config_request) =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigName",
        Some (studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name) );
    ]

let delete_space_request_to_yojson (x : delete_space_request) =
  assoc_to_yojson
    [
      ("SpaceName", Some (space_name_to_yojson x.space_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let delete_project_input_to_yojson (x : delete_project_input) =
  assoc_to_yojson [ ("ProjectName", Some (project_entity_name_to_yojson x.project_name)) ]

let delete_processing_job_request_to_yojson (x : delete_processing_job_request) =
  assoc_to_yojson
    [ ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name)) ]

let delete_pipeline_response_to_yojson (x : delete_pipeline_response) =
  assoc_to_yojson [ ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn) ]

let delete_pipeline_request_to_yojson (x : delete_pipeline_request) =
  assoc_to_yojson
    [
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ("PipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let delete_partner_app_response_to_yojson (x : delete_partner_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn) ]

let delete_partner_app_request_to_yojson (x : delete_partner_app_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
    ]

let delete_optimization_job_request_to_yojson (x : delete_optimization_job_request) =
  assoc_to_yojson [ ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name)) ]

let delete_notebook_instance_lifecycle_config_input_to_yojson
    (x : delete_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
    ]

let delete_notebook_instance_input_to_yojson (x : delete_notebook_instance_input) =
  assoc_to_yojson
    [ ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name)) ]

let delete_monitoring_schedule_request_to_yojson (x : delete_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let delete_model_quality_job_definition_request_to_yojson
    (x : delete_model_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_model_package_group_policy_input_to_yojson (x : delete_model_package_group_policy_input)
    =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name)) ]

let delete_model_package_group_input_to_yojson (x : delete_model_package_group_input) =
  assoc_to_yojson
    [ ("ModelPackageGroupName", Some (arn_or_name_to_yojson x.model_package_group_name)) ]

let delete_model_package_input_to_yojson (x : delete_model_package_input) =
  assoc_to_yojson
    [ ("ModelPackageName", Some (versioned_arn_or_name_to_yojson x.model_package_name)) ]

let delete_model_explainability_job_definition_request_to_yojson
    (x : delete_model_explainability_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_model_card_request_to_yojson (x : delete_model_card_request) =
  assoc_to_yojson [ ("ModelCardName", Some (entity_name_to_yojson x.model_card_name)) ]

let delete_model_bias_job_definition_request_to_yojson
    (x : delete_model_bias_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_model_input_to_yojson (x : delete_model_input) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let delete_mlflow_tracking_server_response_to_yojson (x : delete_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let delete_mlflow_tracking_server_request_to_yojson (x : delete_mlflow_tracking_server_request) =
  assoc_to_yojson
    [ ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name)) ]

let delete_mlflow_app_response_to_yojson (x : delete_mlflow_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn) ]

let delete_mlflow_app_request_to_yojson (x : delete_mlflow_app_request) =
  assoc_to_yojson [ ("Arn", Some (mlflow_app_arn_to_yojson x.arn)) ]

let delete_job_response_to_yojson = unit_to_yojson

let delete_job_request_to_yojson (x : delete_job_request) =
  assoc_to_yojson
    [
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("JobName", Some (job_name_to_yojson x.job_name));
    ]

let delete_inference_experiment_response_to_yojson (x : delete_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let delete_inference_experiment_request_to_yojson (x : delete_inference_experiment_request) =
  assoc_to_yojson [ ("Name", Some (inference_experiment_name_to_yojson x.name)) ]

let delete_inference_component_input_to_yojson (x : delete_inference_component_input) =
  assoc_to_yojson
    [
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let delete_image_version_response_to_yojson = unit_to_yojson

let delete_image_version_request_to_yojson (x : delete_image_version_request) =
  assoc_to_yojson
    [
      ("Alias", option_to_yojson sage_maker_image_version_alias_to_yojson x.alias);
      ("Version", option_to_yojson image_version_number_to_yojson x.version);
      ("ImageName", Some (image_name_to_yojson x.image_name));
    ]

let delete_image_response_to_yojson = unit_to_yojson

let delete_image_request_to_yojson (x : delete_image_request) =
  assoc_to_yojson [ ("ImageName", Some (image_name_to_yojson x.image_name)) ]

let delete_hyper_parameter_tuning_job_request_to_yojson
    (x : delete_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let delete_human_task_ui_response_to_yojson = unit_to_yojson

let delete_human_task_ui_request_to_yojson (x : delete_human_task_ui_request) =
  assoc_to_yojson [ ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name)) ]

let delete_hub_content_reference_request_to_yojson (x : delete_hub_content_reference_request) =
  assoc_to_yojson
    [
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let delete_hub_content_request_to_yojson (x : delete_hub_content_request) =
  assoc_to_yojson
    [
      ("HubContentVersion", Some (hub_content_version_to_yojson x.hub_content_version));
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let delete_hub_request_to_yojson (x : delete_hub_request) =
  assoc_to_yojson [ ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name)) ]

let delete_flow_definition_response_to_yojson = unit_to_yojson

let delete_flow_definition_request_to_yojson (x : delete_flow_definition_request) =
  assoc_to_yojson
    [ ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name)) ]

let delete_feature_group_request_to_yojson (x : delete_feature_group_request) =
  assoc_to_yojson [ ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name)) ]

let delete_experiment_response_to_yojson (x : delete_experiment_response) =
  assoc_to_yojson [ ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn) ]

let delete_experiment_request_to_yojson (x : delete_experiment_request) =
  assoc_to_yojson [ ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name)) ]

let delete_endpoint_config_input_to_yojson (x : delete_endpoint_config_input) =
  assoc_to_yojson
    [ ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name)) ]

let delete_endpoint_input_to_yojson (x : delete_endpoint_input) =
  assoc_to_yojson [ ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name)) ]

let delete_edge_deployment_stage_request_to_yojson (x : delete_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("StageName", Some (entity_name_to_yojson x.stage_name));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
    ]

let delete_edge_deployment_plan_request_to_yojson (x : delete_edge_deployment_plan_request) =
  assoc_to_yojson
    [ ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name)) ]

let retention_type_to_yojson (x : retention_type) =
  match x with Delete -> `String "Delete" | Retain -> `String "Retain"

let retention_policy_to_yojson (x : retention_policy) =
  assoc_to_yojson
    [ ("HomeEfsFileSystem", option_to_yojson retention_type_to_yojson x.home_efs_file_system) ]

let delete_domain_request_to_yojson (x : delete_domain_request) =
  assoc_to_yojson
    [
      ("RetentionPolicy", option_to_yojson retention_policy_to_yojson x.retention_policy);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let delete_device_fleet_request_to_yojson (x : delete_device_fleet_request) =
  assoc_to_yojson [ ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name)) ]

let delete_data_quality_job_definition_request_to_yojson
    (x : delete_data_quality_job_definition_request) =
  assoc_to_yojson
    [ ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name)) ]

let delete_context_response_to_yojson (x : delete_context_response) =
  assoc_to_yojson [ ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn) ]

let delete_context_request_to_yojson (x : delete_context_request) =
  assoc_to_yojson [ ("ContextName", Some (context_name_to_yojson x.context_name)) ]

let delete_compute_quota_request_to_yojson (x : delete_compute_quota_request) =
  assoc_to_yojson [ ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id)) ]

let delete_compilation_job_request_to_yojson (x : delete_compilation_job_request) =
  assoc_to_yojson [ ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name)) ]

let delete_code_repository_input_to_yojson (x : delete_code_repository_input) =
  assoc_to_yojson [ ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name)) ]

let delete_cluster_scheduler_config_request_to_yojson (x : delete_cluster_scheduler_config_request)
    =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
    ]

let delete_cluster_response_to_yojson (x : delete_cluster_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let delete_cluster_request_to_yojson (x : delete_cluster_request) =
  assoc_to_yojson [ ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name)) ]

let delete_association_response_to_yojson (x : delete_association_response) =
  assoc_to_yojson
    [
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
    ]

let delete_association_request_to_yojson (x : delete_association_request) =
  assoc_to_yojson
    [
      ("DestinationArn", Some (association_entity_arn_to_yojson x.destination_arn));
      ("SourceArn", Some (association_entity_arn_to_yojson x.source_arn));
    ]

let delete_artifact_response_to_yojson (x : delete_artifact_response) =
  assoc_to_yojson [ ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn) ]

let delete_artifact_request_to_yojson (x : delete_artifact_request) =
  assoc_to_yojson
    [
      ("Source", option_to_yojson artifact_source_to_yojson x.source);
      ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn);
    ]

let delete_app_image_config_request_to_yojson (x : delete_app_image_config_request) =
  assoc_to_yojson
    [ ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name)) ]

let delete_app_request_to_yojson (x : delete_app_request) =
  assoc_to_yojson
    [
      ("AppName", Some (app_name_to_yojson x.app_name));
      ("AppType", Some (app_type_to_yojson x.app_type));
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let delete_algorithm_input_to_yojson (x : delete_algorithm_input) =
  assoc_to_yojson [ ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name)) ]

let delete_ai_workload_config_response_to_yojson (x : delete_ai_workload_config_response) =
  assoc_to_yojson
    [
      ( "AIWorkloadConfigArn",
        option_to_yojson ai_workload_config_arn_to_yojson x.ai_workload_config_arn );
    ]

let delete_ai_workload_config_request_to_yojson (x : delete_ai_workload_config_request) =
  assoc_to_yojson
    [ ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name)) ]

let delete_ai_recommendation_job_response_to_yojson (x : delete_ai_recommendation_job_response) =
  assoc_to_yojson
    [
      ( "AIRecommendationJobArn",
        option_to_yojson ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn );
    ]

let delete_ai_recommendation_job_request_to_yojson (x : delete_ai_recommendation_job_request) =
  assoc_to_yojson
    [ ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name)) ]

let delete_ai_benchmark_job_response_to_yojson (x : delete_ai_benchmark_job_response) =
  assoc_to_yojson
    [
      ("AIBenchmarkJobArn", option_to_yojson ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn);
    ]

let delete_ai_benchmark_job_request_to_yojson (x : delete_ai_benchmark_job_request) =
  assoc_to_yojson
    [ ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name)) ]

let delete_action_response_to_yojson (x : delete_action_response) =
  assoc_to_yojson [ ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn) ]

let delete_action_request_to_yojson (x : delete_action_request) =
  assoc_to_yojson [ ("ActionName", Some (experiment_entity_name_to_yojson x.action_name)) ]

let create_workteam_response_to_yojson (x : create_workteam_response) =
  assoc_to_yojson [ ("WorkteamArn", option_to_yojson workteam_arn_to_yojson x.workteam_arn) ]

let create_workteam_request_to_yojson (x : create_workteam_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "WorkerAccessConfiguration",
        option_to_yojson worker_access_configuration_to_yojson x.worker_access_configuration );
      ( "NotificationConfiguration",
        option_to_yojson notification_configuration_to_yojson x.notification_configuration );
      ("Description", Some (string200_to_yojson x.description));
      ("MemberDefinitions", Some (member_definitions_to_yojson x.member_definitions));
      ("WorkforceName", option_to_yojson workforce_name_to_yojson x.workforce_name);
      ("WorkteamName", Some (workteam_name_to_yojson x.workteam_name));
    ]

let create_workforce_response_to_yojson (x : create_workforce_response) =
  assoc_to_yojson [ ("WorkforceArn", Some (workforce_arn_to_yojson x.workforce_arn)) ]

let create_workforce_request_to_yojson (x : create_workforce_request) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson workforce_ip_address_type_to_yojson x.ip_address_type);
      ( "WorkforceVpcConfig",
        option_to_yojson workforce_vpc_config_request_to_yojson x.workforce_vpc_config );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("WorkforceName", Some (workforce_name_to_yojson x.workforce_name));
      ("SourceIpConfig", option_to_yojson source_ip_config_to_yojson x.source_ip_config);
      ("OidcConfig", option_to_yojson oidc_config_to_yojson x.oidc_config);
      ("CognitoConfig", option_to_yojson cognito_config_to_yojson x.cognito_config);
    ]

let create_user_profile_response_to_yojson (x : create_user_profile_response) =
  assoc_to_yojson
    [ ("UserProfileArn", option_to_yojson user_profile_arn_to_yojson x.user_profile_arn) ]

let create_user_profile_request_to_yojson (x : create_user_profile_request) =
  assoc_to_yojson
    [
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SingleSignOnUserValue", option_to_yojson string256_to_yojson x.single_sign_on_user_value);
      ( "SingleSignOnUserIdentifier",
        option_to_yojson single_sign_on_user_identifier_to_yojson x.single_sign_on_user_identifier
      );
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let create_trial_component_response_to_yojson (x : create_trial_component_response) =
  assoc_to_yojson
    [ ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn) ]

let create_trial_component_request_to_yojson (x : create_trial_component_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("OutputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.output_artifacts);
      ("InputArtifacts", option_to_yojson trial_component_artifacts_to_yojson x.input_artifacts);
      ("Parameters", option_to_yojson trial_component_parameters_to_yojson x.parameters);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("Status", option_to_yojson trial_component_status_to_yojson x.status);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
    ]

let create_trial_response_to_yojson (x : create_trial_response) =
  assoc_to_yojson [ ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn) ]

let create_trial_request_to_yojson (x : create_trial_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name));
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
    ]

let create_transform_job_response_to_yojson (x : create_transform_job_response) =
  assoc_to_yojson [ ("TransformJobArn", Some (transform_job_arn_to_yojson x.transform_job_arn)) ]

let create_transform_job_request_to_yojson (x : create_transform_job_request) =
  assoc_to_yojson
    [
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataProcessing", option_to_yojson data_processing_to_yojson x.data_processing);
      ("TransformResources", Some (transform_resources_to_yojson x.transform_resources));
      ( "DataCaptureConfig",
        option_to_yojson batch_data_capture_config_to_yojson x.data_capture_config );
      ("TransformOutput", Some (transform_output_to_yojson x.transform_output));
      ("TransformInput", Some (transform_input_to_yojson x.transform_input));
      ("Environment", option_to_yojson transform_environment_map_to_yojson x.environment);
      ("BatchStrategy", option_to_yojson batch_strategy_to_yojson x.batch_strategy);
      ("MaxPayloadInMB", option_to_yojson max_payload_in_m_b_to_yojson x.max_payload_in_m_b);
      ("ModelClientConfig", option_to_yojson model_client_config_to_yojson x.model_client_config);
      ( "MaxConcurrentTransforms",
        option_to_yojson max_concurrent_transforms_to_yojson x.max_concurrent_transforms );
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("TransformJobName", Some (transform_job_name_to_yojson x.transform_job_name));
    ]

let create_training_plan_response_to_yojson (x : create_training_plan_response) =
  assoc_to_yojson [ ("TrainingPlanArn", Some (training_plan_arn_to_yojson x.training_plan_arn)) ]

let create_training_plan_request_to_yojson (x : create_training_plan_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "SpareInstanceCountPerUltraServer",
        option_to_yojson spare_instance_count_per_ultra_server_to_yojson
          x.spare_instance_count_per_ultra_server );
      ( "TrainingPlanOfferingId",
        Some (training_plan_offering_id_to_yojson x.training_plan_offering_id) );
      ("TrainingPlanName", Some (training_plan_name_to_yojson x.training_plan_name));
    ]

let create_training_job_response_to_yojson (x : create_training_job_response) =
  assoc_to_yojson [ ("TrainingJobArn", Some (training_job_arn_to_yojson x.training_job_arn)) ]

let create_training_job_request_to_yojson (x : create_training_job_request) =
  assoc_to_yojson
    [
      ("ModelPackageConfig", option_to_yojson model_package_config_to_yojson x.model_package_config);
      ("MlflowConfig", option_to_yojson mlflow_config_to_yojson x.mlflow_config);
      ( "ServerlessJobConfig",
        option_to_yojson serverless_job_config_to_yojson x.serverless_job_config );
      ( "SessionChainingConfig",
        option_to_yojson session_chaining_config_to_yojson x.session_chaining_config );
      ("InfraCheckConfig", option_to_yojson infra_check_config_to_yojson x.infra_check_config);
      ("RemoteDebugConfig", option_to_yojson remote_debug_config_to_yojson x.remote_debug_config);
      ("RetryStrategy", option_to_yojson retry_strategy_to_yojson x.retry_strategy);
      ("Environment", option_to_yojson training_environment_map_to_yojson x.environment);
      ( "ProfilerRuleConfigurations",
        option_to_yojson profiler_rule_configurations_to_yojson x.profiler_rule_configurations );
      ("ProfilerConfig", option_to_yojson profiler_config_to_yojson x.profiler_config);
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ( "TensorBoardOutputConfig",
        option_to_yojson tensor_board_output_config_to_yojson x.tensor_board_output_config );
      ( "DebugRuleConfigurations",
        option_to_yojson debug_rule_configurations_to_yojson x.debug_rule_configurations );
      ("DebugHookConfig", option_to_yojson debug_hook_config_to_yojson x.debug_hook_config);
      ("CheckpointConfig", option_to_yojson checkpoint_config_to_yojson x.checkpoint_config);
      ( "EnableManagedSpotTraining",
        option_to_yojson boolean__to_yojson x.enable_managed_spot_training );
      ( "EnableInterContainerTrafficEncryption",
        option_to_yojson boolean__to_yojson x.enable_inter_container_traffic_encryption );
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("StoppingCondition", option_to_yojson stopping_condition_to_yojson x.stopping_condition);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ResourceConfig", option_to_yojson resource_config_to_yojson x.resource_config);
      ("OutputDataConfig", Some (output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AlgorithmSpecification",
        option_to_yojson algorithm_specification_to_yojson x.algorithm_specification );
      ("HyperParameters", option_to_yojson hyper_parameters_to_yojson x.hyper_parameters);
      ("TrainingJobName", Some (training_job_name_to_yojson x.training_job_name));
    ]

let create_studio_lifecycle_config_response_to_yojson (x : create_studio_lifecycle_config_response)
    =
  assoc_to_yojson
    [
      ( "StudioLifecycleConfigArn",
        option_to_yojson studio_lifecycle_config_arn_to_yojson x.studio_lifecycle_config_arn );
    ]

let create_studio_lifecycle_config_request_to_yojson (x : create_studio_lifecycle_config_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "StudioLifecycleConfigAppType",
        Some (studio_lifecycle_config_app_type_to_yojson x.studio_lifecycle_config_app_type) );
      ( "StudioLifecycleConfigContent",
        Some (studio_lifecycle_config_content_to_yojson x.studio_lifecycle_config_content) );
      ( "StudioLifecycleConfigName",
        Some (studio_lifecycle_config_name_to_yojson x.studio_lifecycle_config_name) );
    ]

let create_space_response_to_yojson (x : create_space_response) =
  assoc_to_yojson [ ("SpaceArn", option_to_yojson space_arn_to_yojson x.space_arn) ]

let create_space_request_to_yojson (x : create_space_request) =
  assoc_to_yojson
    [
      ("SpaceDisplayName", option_to_yojson non_empty_string64_to_yojson x.space_display_name);
      ( "SpaceSharingSettings",
        option_to_yojson space_sharing_settings_to_yojson x.space_sharing_settings );
      ("OwnershipSettings", option_to_yojson ownership_settings_to_yojson x.ownership_settings);
      ("SpaceSettings", option_to_yojson space_settings_to_yojson x.space_settings);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("SpaceName", Some (space_name_to_yojson x.space_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let create_project_output_to_yojson (x : create_project_output) =
  assoc_to_yojson
    [
      ("ProjectId", Some (project_id_to_yojson x.project_id));
      ("ProjectArn", Some (project_arn_to_yojson x.project_arn));
    ]

let cfn_stack_create_parameter_to_yojson (x : cfn_stack_create_parameter) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson cfn_stack_parameter_value_to_yojson x.value);
      ("Key", Some (cfn_stack_parameter_key_to_yojson x.key));
    ]

let cfn_stack_create_parameters_to_yojson tree =
  list_to_yojson cfn_stack_create_parameter_to_yojson tree

let cfn_create_template_provider_to_yojson (x : cfn_create_template_provider) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson cfn_stack_create_parameters_to_yojson x.parameters);
      ("RoleARN", option_to_yojson role_arn_to_yojson x.role_ar_n);
      ("TemplateURL", Some (cfn_template_ur_l_to_yojson x.template_ur_l));
      ("TemplateName", Some (cfn_template_name_to_yojson x.template_name));
    ]

let create_template_provider_to_yojson (x : create_template_provider) =
  assoc_to_yojson
    [
      ( "CfnTemplateProvider",
        option_to_yojson cfn_create_template_provider_to_yojson x.cfn_template_provider );
    ]

let create_template_provider_list_to_yojson tree =
  list_to_yojson create_template_provider_to_yojson tree

let create_project_input_to_yojson (x : create_project_input) =
  assoc_to_yojson
    [
      ( "TemplateProviders",
        option_to_yojson create_template_provider_list_to_yojson x.template_providers );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ServiceCatalogProvisioningDetails",
        option_to_yojson service_catalog_provisioning_details_to_yojson
          x.service_catalog_provisioning_details );
      ("ProjectDescription", option_to_yojson entity_description_to_yojson x.project_description);
      ("ProjectName", Some (project_entity_name_to_yojson x.project_name));
    ]

let create_processing_job_response_to_yojson (x : create_processing_job_response) =
  assoc_to_yojson [ ("ProcessingJobArn", Some (processing_job_arn_to_yojson x.processing_job_arn)) ]

let create_processing_job_request_to_yojson (x : create_processing_job_request) =
  assoc_to_yojson
    [
      ("ExperimentConfig", option_to_yojson experiment_config_to_yojson x.experiment_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson network_config_to_yojson x.network_config);
      ("Environment", option_to_yojson processing_environment_map_to_yojson x.environment);
      ("AppSpecification", Some (app_specification_to_yojson x.app_specification));
      ( "StoppingCondition",
        option_to_yojson processing_stopping_condition_to_yojson x.stopping_condition );
      ("ProcessingResources", Some (processing_resources_to_yojson x.processing_resources));
      ("ProcessingJobName", Some (processing_job_name_to_yojson x.processing_job_name));
      ( "ProcessingOutputConfig",
        option_to_yojson processing_output_config_to_yojson x.processing_output_config );
      ("ProcessingInputs", option_to_yojson processing_inputs_to_yojson x.processing_inputs);
    ]

let create_presigned_notebook_instance_url_output_to_yojson
    (x : create_presigned_notebook_instance_url_output) =
  assoc_to_yojson
    [ ("AuthorizedUrl", option_to_yojson notebook_instance_url_to_yojson x.authorized_url) ]

let create_presigned_notebook_instance_url_input_to_yojson
    (x : create_presigned_notebook_instance_url_input) =
  assoc_to_yojson
    [
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
    ]

let create_presigned_mlflow_tracking_server_url_response_to_yojson
    (x : create_presigned_mlflow_tracking_server_url_response) =
  assoc_to_yojson
    [ ("AuthorizedUrl", option_to_yojson tracking_server_url_to_yojson x.authorized_url) ]

let expires_in_seconds_to_yojson = int_to_yojson

let create_presigned_mlflow_tracking_server_url_request_to_yojson
    (x : create_presigned_mlflow_tracking_server_url_request) =
  assoc_to_yojson
    [
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name));
    ]

let mlflow_app_url_to_yojson = string_to_yojson

let create_presigned_mlflow_app_url_response_to_yojson
    (x : create_presigned_mlflow_app_url_response) =
  assoc_to_yojson [ ("AuthorizedUrl", option_to_yojson mlflow_app_url_to_yojson x.authorized_url) ]

let create_presigned_mlflow_app_url_request_to_yojson (x : create_presigned_mlflow_app_url_request)
    =
  assoc_to_yojson
    [
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ("Arn", Some (mlflow_app_arn_to_yojson x.arn));
    ]

let presigned_domain_url_to_yojson = string_to_yojson

let create_presigned_domain_url_response_to_yojson (x : create_presigned_domain_url_response) =
  assoc_to_yojson
    [ ("AuthorizedUrl", option_to_yojson presigned_domain_url_to_yojson x.authorized_url) ]

let create_presigned_domain_url_request_to_yojson (x : create_presigned_domain_url_request) =
  assoc_to_yojson
    [
      ("LandingUri", option_to_yojson landing_uri_to_yojson x.landing_uri);
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
      ("UserProfileName", Some (user_profile_name_to_yojson x.user_profile_name));
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let create_pipeline_response_to_yojson (x : create_pipeline_response) =
  assoc_to_yojson [ ("PipelineArn", option_to_yojson pipeline_arn_to_yojson x.pipeline_arn) ]

let create_pipeline_request_to_yojson (x : create_pipeline_request) =
  assoc_to_yojson
    [
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("ClientRequestToken", Some (idempotency_token_to_yojson x.client_request_token));
      ("PipelineDescription", option_to_yojson pipeline_description_to_yojson x.pipeline_description);
      ( "PipelineDefinitionS3Location",
        option_to_yojson pipeline_definition_s3_location_to_yojson x.pipeline_definition_s3_location
      );
      ("PipelineDefinition", option_to_yojson pipeline_definition_to_yojson x.pipeline_definition);
      ("PipelineDisplayName", option_to_yojson pipeline_name_to_yojson x.pipeline_display_name);
      ("PipelineName", Some (pipeline_name_to_yojson x.pipeline_name));
    ]

let create_partner_app_presigned_url_response_to_yojson
    (x : create_partner_app_presigned_url_response) =
  assoc_to_yojson [ ("Url", option_to_yojson string2048_to_yojson x.url) ]

let create_partner_app_presigned_url_request_to_yojson
    (x : create_partner_app_presigned_url_request) =
  assoc_to_yojson
    [
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
      ("ExpiresInSeconds", option_to_yojson expires_in_seconds_to_yojson x.expires_in_seconds);
      ("Arn", Some (partner_app_arn_to_yojson x.arn));
    ]

let create_partner_app_response_to_yojson (x : create_partner_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson partner_app_arn_to_yojson x.arn) ]

let create_partner_app_request_to_yojson (x : create_partner_app_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "EnableAutoMinorVersionUpgrade",
        option_to_yojson boolean__to_yojson x.enable_auto_minor_version_upgrade );
      ( "EnableIamSessionBasedIdentity",
        option_to_yojson boolean__to_yojson x.enable_iam_session_based_identity );
      ("AuthType", Some (partner_app_auth_type_to_yojson x.auth_type));
      ("ApplicationConfig", option_to_yojson partner_app_config_to_yojson x.application_config);
      ("Tier", Some (non_empty_string64_to_yojson x.tier));
      ( "MaintenanceConfig",
        option_to_yojson partner_app_maintenance_config_to_yojson x.maintenance_config );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("ExecutionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("Type", Some (partner_app_type_to_yojson x.type_));
      ("Name", Some (partner_app_name_to_yojson x.name));
    ]

let create_optimization_job_response_to_yojson (x : create_optimization_job_response) =
  assoc_to_yojson
    [ ("OptimizationJobArn", Some (optimization_job_arn_to_yojson x.optimization_job_arn)) ]

let create_optimization_job_request_to_yojson (x : create_optimization_job_request) =
  assoc_to_yojson
    [
      ("VpcConfig", option_to_yojson optimization_vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("OutputConfig", Some (optimization_job_output_config_to_yojson x.output_config));
      ("OptimizationConfigs", Some (optimization_configs_to_yojson x.optimization_configs));
      ( "OptimizationEnvironment",
        option_to_yojson optimization_job_environment_variables_to_yojson x.optimization_environment
      );
      ( "MaxInstanceCount",
        option_to_yojson optimization_job_max_instance_count_to_yojson x.max_instance_count );
      ( "DeploymentInstanceType",
        Some (optimization_job_deployment_instance_type_to_yojson x.deployment_instance_type) );
      ("ModelSource", Some (optimization_job_model_source_to_yojson x.model_source));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OptimizationJobName", Some (entity_name_to_yojson x.optimization_job_name));
    ]

let create_notebook_instance_lifecycle_config_output_to_yojson
    (x : create_notebook_instance_lifecycle_config_output) =
  assoc_to_yojson
    [
      ( "NotebookInstanceLifecycleConfigArn",
        option_to_yojson notebook_instance_lifecycle_config_arn_to_yojson
          x.notebook_instance_lifecycle_config_arn );
    ]

let create_notebook_instance_lifecycle_config_input_to_yojson
    (x : create_notebook_instance_lifecycle_config_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OnStart", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_start);
      ("OnCreate", option_to_yojson notebook_instance_lifecycle_config_list_to_yojson x.on_create);
      ( "NotebookInstanceLifecycleConfigName",
        Some
          (notebook_instance_lifecycle_config_name_to_yojson
             x.notebook_instance_lifecycle_config_name) );
    ]

let create_notebook_instance_output_to_yojson (x : create_notebook_instance_output) =
  assoc_to_yojson
    [
      ( "NotebookInstanceArn",
        option_to_yojson notebook_instance_arn_to_yojson x.notebook_instance_arn );
    ]

let create_notebook_instance_input_to_yojson (x : create_notebook_instance_input) =
  assoc_to_yojson
    [
      ( "InstanceMetadataServiceConfiguration",
        option_to_yojson instance_metadata_service_configuration_to_yojson
          x.instance_metadata_service_configuration );
      ("PlatformIdentifier", option_to_yojson platform_identifier_to_yojson x.platform_identifier);
      ("RootAccess", option_to_yojson root_access_to_yojson x.root_access);
      ( "AdditionalCodeRepositories",
        option_to_yojson additional_code_repository_names_or_urls_to_yojson
          x.additional_code_repositories );
      ( "DefaultCodeRepository",
        option_to_yojson code_repository_name_or_url_to_yojson x.default_code_repository );
      ( "AcceleratorTypes",
        option_to_yojson notebook_instance_accelerator_types_to_yojson x.accelerator_types );
      ( "VolumeSizeInGB",
        option_to_yojson notebook_instance_volume_size_in_g_b_to_yojson x.volume_size_in_g_b );
      ( "DirectInternetAccess",
        option_to_yojson direct_internet_access_to_yojson x.direct_internet_access );
      ( "LifecycleConfigName",
        option_to_yojson notebook_instance_lifecycle_config_name_to_yojson x.lifecycle_config_name
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("InstanceType", Some (instance_type_to_yojson x.instance_type));
      ("NotebookInstanceName", Some (notebook_instance_name_to_yojson x.notebook_instance_name));
    ]

let create_monitoring_schedule_response_to_yojson (x : create_monitoring_schedule_response) =
  assoc_to_yojson
    [
      ("MonitoringScheduleArn", Some (monitoring_schedule_arn_to_yojson x.monitoring_schedule_arn));
    ]

let create_monitoring_schedule_request_to_yojson (x : create_monitoring_schedule_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "MonitoringScheduleConfig",
        Some (monitoring_schedule_config_to_yojson x.monitoring_schedule_config) );
      ( "MonitoringScheduleName",
        Some (monitoring_schedule_name_to_yojson x.monitoring_schedule_name) );
    ]

let create_model_quality_job_definition_response_to_yojson
    (x : create_model_quality_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let create_model_quality_job_definition_request_to_yojson
    (x : create_model_quality_job_definition_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "ModelQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_quality_job_output_config) );
      ("ModelQualityJobInput", Some (model_quality_job_input_to_yojson x.model_quality_job_input));
      ( "ModelQualityAppSpecification",
        Some (model_quality_app_specification_to_yojson x.model_quality_app_specification) );
      ( "ModelQualityBaselineConfig",
        option_to_yojson model_quality_baseline_config_to_yojson x.model_quality_baseline_config );
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
    ]

let create_model_package_group_output_to_yojson (x : create_model_package_group_output) =
  assoc_to_yojson
    [ ("ModelPackageGroupArn", Some (model_package_group_arn_to_yojson x.model_package_group_arn)) ]

let create_model_package_group_input_to_yojson (x : create_model_package_group_input) =
  assoc_to_yojson
    [
      ( "ManagedConfiguration",
        option_to_yojson managed_configuration_to_yojson x.managed_configuration );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ModelPackageGroupDescription",
        option_to_yojson entity_description_to_yojson x.model_package_group_description );
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
    ]

let create_model_package_output_to_yojson (x : create_model_package_output) =
  assoc_to_yojson [ ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn)) ]

let create_model_package_input_to_yojson (x : create_model_package_input) =
  assoc_to_yojson
    [
      ("ManagedStorageType", option_to_yojson managed_storage_type_to_yojson x.managed_storage_type);
      ("ModelLifeCycle", option_to_yojson model_life_cycle_to_yojson x.model_life_cycle);
      ("ModelCard", option_to_yojson model_package_model_card_to_yojson x.model_card);
      ("SecurityConfig", option_to_yojson model_package_security_config_to_yojson x.security_config);
      ("SourceUri", option_to_yojson model_package_source_uri_to_yojson x.source_uri);
      ( "SkipModelValidation",
        option_to_yojson skip_model_validation_to_yojson x.skip_model_validation );
      ( "AdditionalInferenceSpecifications",
        option_to_yojson additional_inference_specifications_to_yojson
          x.additional_inference_specifications );
      ( "DriftCheckBaselines",
        option_to_yojson drift_check_baselines_to_yojson x.drift_check_baselines );
      ( "CustomerMetadataProperties",
        option_to_yojson customer_metadata_map_to_yojson x.customer_metadata_properties );
      ("SamplePayloadUrl", option_to_yojson s3_uri_to_yojson x.sample_payload_url);
      ("Task", option_to_yojson string__to_yojson x.task);
      ("Domain", option_to_yojson string__to_yojson x.domain);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ( "SourceAlgorithmSpecification",
        option_to_yojson source_algorithm_specification_to_yojson x.source_algorithm_specification
      );
      ( "ValidationSpecification",
        option_to_yojson model_package_validation_specification_to_yojson x.validation_specification
      );
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("ModelPackageGroupName", option_to_yojson arn_or_name_to_yojson x.model_package_group_name);
      ("ModelPackageName", option_to_yojson entity_name_to_yojson x.model_package_name);
    ]

let create_model_explainability_job_definition_response_to_yojson
    (x : create_model_explainability_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let create_model_explainability_job_definition_request_to_yojson
    (x : create_model_explainability_job_definition_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "ModelExplainabilityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_explainability_job_output_config) );
      ( "ModelExplainabilityJobInput",
        Some (model_explainability_job_input_to_yojson x.model_explainability_job_input) );
      ( "ModelExplainabilityAppSpecification",
        Some
          (model_explainability_app_specification_to_yojson x.model_explainability_app_specification)
      );
      ( "ModelExplainabilityBaselineConfig",
        option_to_yojson model_explainability_baseline_config_to_yojson
          x.model_explainability_baseline_config );
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
    ]

let create_model_card_export_job_response_to_yojson (x : create_model_card_export_job_response) =
  assoc_to_yojson
    [
      ( "ModelCardExportJobArn",
        Some (model_card_export_job_arn_to_yojson x.model_card_export_job_arn) );
    ]

let create_model_card_export_job_request_to_yojson (x : create_model_card_export_job_request) =
  assoc_to_yojson
    [
      ("OutputConfig", Some (model_card_export_output_config_to_yojson x.output_config));
      ("ModelCardExportJobName", Some (entity_name_to_yojson x.model_card_export_job_name));
      ("ModelCardVersion", option_to_yojson integer_to_yojson x.model_card_version);
      ("ModelCardName", Some (model_card_name_or_arn_to_yojson x.model_card_name));
    ]

let create_model_card_response_to_yojson (x : create_model_card_response) =
  assoc_to_yojson [ ("ModelCardArn", Some (model_card_arn_to_yojson x.model_card_arn)) ]

let create_model_card_request_to_yojson (x : create_model_card_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ModelCardStatus", Some (model_card_status_to_yojson x.model_card_status));
      ("Content", Some (model_card_content_to_yojson x.content));
      ("SecurityConfig", option_to_yojson model_card_security_config_to_yojson x.security_config);
      ("ModelCardName", Some (entity_name_to_yojson x.model_card_name));
    ]

let create_model_bias_job_definition_response_to_yojson
    (x : create_model_bias_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let create_model_bias_job_definition_request_to_yojson
    (x : create_model_bias_job_definition_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "ModelBiasJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.model_bias_job_output_config) );
      ("ModelBiasJobInput", Some (model_bias_job_input_to_yojson x.model_bias_job_input));
      ( "ModelBiasAppSpecification",
        Some (model_bias_app_specification_to_yojson x.model_bias_app_specification) );
      ( "ModelBiasBaselineConfig",
        option_to_yojson model_bias_baseline_config_to_yojson x.model_bias_baseline_config );
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
    ]

let create_model_output_to_yojson (x : create_model_output) =
  assoc_to_yojson [ ("ModelArn", Some (model_arn_to_yojson x.model_arn)) ]

let create_model_input_to_yojson (x : create_model_input) =
  assoc_to_yojson
    [
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ( "InferenceExecutionConfig",
        option_to_yojson inference_execution_config_to_yojson x.inference_execution_config );
      ("Containers", option_to_yojson container_definition_list_to_yojson x.containers);
      ("PrimaryContainer", option_to_yojson container_definition_to_yojson x.primary_container);
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let create_mlflow_tracking_server_response_to_yojson (x : create_mlflow_tracking_server_response) =
  assoc_to_yojson
    [ ("TrackingServerArn", option_to_yojson tracking_server_arn_to_yojson x.tracking_server_arn) ]

let create_mlflow_tracking_server_request_to_yojson (x : create_mlflow_tracking_server_request) =
  assoc_to_yojson
    [
      ( "S3BucketOwnerVerification",
        option_to_yojson boolean__to_yojson x.s3_bucket_owner_verification );
      ("S3BucketOwnerAccountId", option_to_yojson account_id_to_yojson x.s3_bucket_owner_account_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ( "AutomaticModelRegistration",
        option_to_yojson boolean__to_yojson x.automatic_model_registration );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("MlflowVersion", option_to_yojson mlflow_version_to_yojson x.mlflow_version);
      ("TrackingServerSize", option_to_yojson tracking_server_size_to_yojson x.tracking_server_size);
      ("ArtifactStoreUri", Some (s3_uri_to_yojson x.artifact_store_uri));
      ("TrackingServerName", Some (tracking_server_name_to_yojson x.tracking_server_name));
    ]

let create_mlflow_app_response_to_yojson (x : create_mlflow_app_response) =
  assoc_to_yojson [ ("Arn", option_to_yojson mlflow_app_arn_to_yojson x.arn) ]

let create_mlflow_app_request_to_yojson (x : create_mlflow_app_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DefaultDomainIdList",
        option_to_yojson default_domain_id_list_to_yojson x.default_domain_id_list );
      ( "AccountDefaultStatus",
        option_to_yojson account_default_status_to_yojson x.account_default_status );
      ( "WeeklyMaintenanceWindowStart",
        option_to_yojson weekly_maintenance_window_start_to_yojson x.weekly_maintenance_window_start
      );
      ( "ModelRegistrationMode",
        option_to_yojson model_registration_mode_to_yojson x.model_registration_mode );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("ArtifactStoreUri", Some (s3_uri_to_yojson x.artifact_store_uri));
      ("Name", Some (mlflow_app_name_to_yojson x.name));
    ]

let create_labeling_job_response_to_yojson (x : create_labeling_job_response) =
  assoc_to_yojson [ ("LabelingJobArn", Some (labeling_job_arn_to_yojson x.labeling_job_arn)) ]

let create_labeling_job_request_to_yojson (x : create_labeling_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("HumanTaskConfig", Some (human_task_config_to_yojson x.human_task_config));
      ( "LabelingJobAlgorithmsConfig",
        option_to_yojson labeling_job_algorithms_config_to_yojson x.labeling_job_algorithms_config
      );
      ( "StoppingConditions",
        option_to_yojson labeling_job_stopping_conditions_to_yojson x.stopping_conditions );
      ("LabelCategoryConfigS3Uri", option_to_yojson s3_uri_to_yojson x.label_category_config_s3_uri);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OutputConfig", Some (labeling_job_output_config_to_yojson x.output_config));
      ("InputConfig", Some (labeling_job_input_config_to_yojson x.input_config));
      ("LabelAttributeName", Some (label_attribute_name_to_yojson x.label_attribute_name));
      ("LabelingJobName", Some (labeling_job_name_to_yojson x.labeling_job_name));
    ]

let create_job_response_to_yojson (x : create_job_response) =
  assoc_to_yojson [ ("JobArn", Some (job_arn_to_yojson x.job_arn)) ]

let create_job_request_to_yojson (x : create_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("JobConfigDocument", Some (job_config_document_to_yojson x.job_config_document));
      ("JobConfigSchemaVersion", Some (job_schema_version_to_yojson x.job_config_schema_version));
      ("JobCategory", Some (job_category_to_yojson x.job_category));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("JobName", Some (job_name_to_yojson x.job_name));
    ]

let create_inference_recommendations_job_response_to_yojson
    (x : create_inference_recommendations_job_response) =
  assoc_to_yojson [ ("JobArn", Some (recommendation_job_arn_to_yojson x.job_arn)) ]

let recommendation_job_compiled_output_config_to_yojson
    (x : recommendation_job_compiled_output_config) =
  assoc_to_yojson [ ("S3OutputUri", option_to_yojson s3_uri_to_yojson x.s3_output_uri) ]

let recommendation_job_output_config_to_yojson (x : recommendation_job_output_config) =
  assoc_to_yojson
    [
      ( "CompiledOutputConfig",
        option_to_yojson recommendation_job_compiled_output_config_to_yojson
          x.compiled_output_config );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let create_inference_recommendations_job_request_to_yojson
    (x : create_inference_recommendations_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OutputConfig", option_to_yojson recommendation_job_output_config_to_yojson x.output_config);
      ( "StoppingConditions",
        option_to_yojson recommendation_job_stopping_conditions_to_yojson x.stopping_conditions );
      ("JobDescription", option_to_yojson recommendation_job_description_to_yojson x.job_description);
      ("InputConfig", Some (recommendation_job_input_config_to_yojson x.input_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("JobType", Some (recommendation_job_type_to_yojson x.job_type));
      ("JobName", Some (recommendation_job_name_to_yojson x.job_name));
    ]

let create_inference_experiment_response_to_yojson (x : create_inference_experiment_response) =
  assoc_to_yojson
    [
      ( "InferenceExperimentArn",
        Some (inference_experiment_arn_to_yojson x.inference_experiment_arn) );
    ]

let create_inference_experiment_request_to_yojson (x : create_inference_experiment_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKey", option_to_yojson kms_key_id_to_yojson x.kms_key);
      ("ShadowModeConfig", Some (shadow_mode_config_to_yojson x.shadow_mode_config));
      ( "DataStorageConfig",
        option_to_yojson inference_experiment_data_storage_config_to_yojson x.data_storage_config );
      ("ModelVariants", Some (model_variant_config_list_to_yojson x.model_variants));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("Description", option_to_yojson inference_experiment_description_to_yojson x.description);
      ("Schedule", option_to_yojson inference_experiment_schedule_to_yojson x.schedule);
      ("Type", Some (inference_experiment_type_to_yojson x.type_));
      ("Name", Some (inference_experiment_name_to_yojson x.name));
    ]

let create_inference_component_output_to_yojson (x : create_inference_component_output) =
  assoc_to_yojson
    [
      ("InferenceComponentArn", Some (inference_component_arn_to_yojson x.inference_component_arn));
    ]

let create_inference_component_input_to_yojson (x : create_inference_component_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "RuntimeConfig",
        option_to_yojson inference_component_runtime_config_to_yojson x.runtime_config );
      ( "Specifications",
        option_to_yojson inference_component_specification_list_to_yojson x.specifications );
      ("Specification", option_to_yojson inference_component_specification_to_yojson x.specification);
      ("VariantName", option_to_yojson variant_name_to_yojson x.variant_name);
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
      ( "InferenceComponentName",
        Some (inference_component_name_to_yojson x.inference_component_name) );
    ]

let create_image_version_response_to_yojson (x : create_image_version_response) =
  assoc_to_yojson
    [ ("ImageVersionArn", option_to_yojson image_version_arn_to_yojson x.image_version_arn) ]

let create_image_version_request_to_yojson (x : create_image_version_request) =
  assoc_to_yojson
    [
      ("ReleaseNotes", option_to_yojson release_notes_to_yojson x.release_notes);
      ("Horovod", option_to_yojson horovod_to_yojson x.horovod);
      ("Processor", option_to_yojson processor_to_yojson x.processor);
      ("ProgrammingLang", option_to_yojson programming_lang_to_yojson x.programming_lang);
      ("MLFramework", option_to_yojson ml_framework_to_yojson x.ml_framework);
      ("JobType", option_to_yojson job_type_to_yojson x.job_type);
      ("VendorGuidance", option_to_yojson vendor_guidance_to_yojson x.vendor_guidance);
      ("Aliases", option_to_yojson sage_maker_image_version_aliases_to_yojson x.aliases);
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("BaseImage", Some (image_base_image_to_yojson x.base_image));
    ]

let create_image_response_to_yojson (x : create_image_response) =
  assoc_to_yojson [ ("ImageArn", option_to_yojson image_arn_to_yojson x.image_arn) ]

let create_image_request_to_yojson (x : create_image_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("ImageName", Some (image_name_to_yojson x.image_name));
      ("DisplayName", option_to_yojson image_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson image_description_to_yojson x.description);
    ]

let create_hyper_parameter_tuning_job_response_to_yojson
    (x : create_hyper_parameter_tuning_job_response) =
  assoc_to_yojson
    [
      ( "HyperParameterTuningJobArn",
        Some (hyper_parameter_tuning_job_arn_to_yojson x.hyper_parameter_tuning_job_arn) );
    ]

let create_hyper_parameter_tuning_job_request_to_yojson
    (x : create_hyper_parameter_tuning_job_request) =
  assoc_to_yojson
    [
      ("Autotune", option_to_yojson autotune_to_yojson x.autotune);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "WarmStartConfig",
        option_to_yojson hyper_parameter_tuning_job_warm_start_config_to_yojson x.warm_start_config
      );
      ( "TrainingJobDefinitions",
        option_to_yojson hyper_parameter_training_job_definitions_to_yojson
          x.training_job_definitions );
      ( "TrainingJobDefinition",
        option_to_yojson hyper_parameter_training_job_definition_to_yojson x.training_job_definition
      );
      ( "HyperParameterTuningJobConfig",
        Some (hyper_parameter_tuning_job_config_to_yojson x.hyper_parameter_tuning_job_config) );
      ( "HyperParameterTuningJobName",
        Some (hyper_parameter_tuning_job_name_to_yojson x.hyper_parameter_tuning_job_name) );
    ]

let create_human_task_ui_response_to_yojson (x : create_human_task_ui_response) =
  assoc_to_yojson [ ("HumanTaskUiArn", Some (human_task_ui_arn_to_yojson x.human_task_ui_arn)) ]

let create_human_task_ui_request_to_yojson (x : create_human_task_ui_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("UiTemplate", Some (ui_template_to_yojson x.ui_template));
      ("HumanTaskUiName", Some (human_task_ui_name_to_yojson x.human_task_ui_name));
    ]

let create_hub_content_reference_response_to_yojson (x : create_hub_content_reference_response) =
  assoc_to_yojson
    [
      ("HubContentArn", Some (hub_content_arn_to_yojson x.hub_content_arn));
      ("HubArn", Some (hub_arn_to_yojson x.hub_arn));
    ]

let create_hub_content_reference_request_to_yojson (x : create_hub_content_reference_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("MinVersion", option_to_yojson hub_content_version_to_yojson x.min_version);
      ("HubContentName", option_to_yojson hub_content_name_to_yojson x.hub_content_name);
      ( "SageMakerPublicHubContentArn",
        Some (sage_maker_public_hub_content_arn_to_yojson x.sage_maker_public_hub_content_arn) );
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let long_s3_uri_to_yojson = string_to_yojson
let local_path_to_yojson = string_to_yojson

let authorized_url_to_yojson (x : authorized_url) =
  assoc_to_yojson
    [
      ("LocalPath", option_to_yojson local_path_to_yojson x.local_path);
      ("Url", option_to_yojson long_s3_uri_to_yojson x.url);
    ]

let authorized_url_configs_to_yojson tree = list_to_yojson authorized_url_to_yojson tree

let create_hub_content_presigned_urls_response_to_yojson
    (x : create_hub_content_presigned_urls_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AuthorizedUrlConfigs", Some (authorized_url_configs_to_yojson x.authorized_url_configs));
    ]

let presigned_url_access_config_to_yojson (x : presigned_url_access_config) =
  assoc_to_yojson
    [
      ("ExpectedS3Url", option_to_yojson s3_model_uri_to_yojson x.expected_s3_url);
      ("AcceptEula", option_to_yojson boolean__to_yojson x.accept_eula);
    ]

let create_hub_content_presigned_urls_request_to_yojson
    (x : create_hub_content_presigned_urls_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("AccessConfig", option_to_yojson presigned_url_access_config_to_yojson x.access_config);
      ("HubContentVersion", option_to_yojson hub_content_version_to_yojson x.hub_content_version);
      ("HubContentName", Some (hub_content_name_to_yojson x.hub_content_name));
      ("HubContentType", Some (hub_content_type_to_yojson x.hub_content_type));
      ("HubName", Some (hub_name_or_arn_to_yojson x.hub_name));
    ]

let create_hub_response_to_yojson (x : create_hub_response) =
  assoc_to_yojson [ ("HubArn", Some (hub_arn_to_yojson x.hub_arn)) ]

let create_hub_request_to_yojson (x : create_hub_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("S3StorageConfig", option_to_yojson hub_s3_storage_config_to_yojson x.s3_storage_config);
      ("HubSearchKeywords", option_to_yojson hub_search_keyword_list_to_yojson x.hub_search_keywords);
      ("HubDisplayName", option_to_yojson hub_display_name_to_yojson x.hub_display_name);
      ("HubDescription", Some (hub_description_to_yojson x.hub_description));
      ("HubName", Some (hub_name_to_yojson x.hub_name));
    ]

let create_flow_definition_response_to_yojson (x : create_flow_definition_response) =
  assoc_to_yojson
    [ ("FlowDefinitionArn", Some (flow_definition_arn_to_yojson x.flow_definition_arn)) ]

let create_flow_definition_request_to_yojson (x : create_flow_definition_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("OutputConfig", Some (flow_definition_output_config_to_yojson x.output_config));
      ("HumanLoopConfig", option_to_yojson human_loop_config_to_yojson x.human_loop_config);
      ( "HumanLoopActivationConfig",
        option_to_yojson human_loop_activation_config_to_yojson x.human_loop_activation_config );
      ( "HumanLoopRequestSource",
        option_to_yojson human_loop_request_source_to_yojson x.human_loop_request_source );
      ("FlowDefinitionName", Some (flow_definition_name_to_yojson x.flow_definition_name));
    ]

let create_feature_group_response_to_yojson (x : create_feature_group_response) =
  assoc_to_yojson [ ("FeatureGroupArn", Some (feature_group_arn_to_yojson x.feature_group_arn)) ]

let create_feature_group_request_to_yojson (x : create_feature_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("ThroughputConfig", option_to_yojson throughput_config_to_yojson x.throughput_config);
      ("OfflineStoreConfig", option_to_yojson offline_store_config_to_yojson x.offline_store_config);
      ("OnlineStoreConfig", option_to_yojson online_store_config_to_yojson x.online_store_config);
      ("FeatureDefinitions", Some (feature_definitions_to_yojson x.feature_definitions));
      ("EventTimeFeatureName", Some (feature_name_to_yojson x.event_time_feature_name));
      ("RecordIdentifierFeatureName", Some (feature_name_to_yojson x.record_identifier_feature_name));
      ("FeatureGroupName", Some (feature_group_name_to_yojson x.feature_group_name));
    ]

let create_experiment_response_to_yojson (x : create_experiment_response) =
  assoc_to_yojson [ ("ExperimentArn", option_to_yojson experiment_arn_to_yojson x.experiment_arn) ]

let create_experiment_request_to_yojson (x : create_experiment_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("DisplayName", option_to_yojson experiment_entity_name_to_yojson x.display_name);
      ("ExperimentName", Some (experiment_entity_name_to_yojson x.experiment_name));
    ]

let create_endpoint_config_output_to_yojson (x : create_endpoint_config_output) =
  assoc_to_yojson
    [ ("EndpointConfigArn", Some (endpoint_config_arn_to_yojson x.endpoint_config_arn)) ]

let create_endpoint_config_input_to_yojson (x : create_endpoint_config_input) =
  assoc_to_yojson
    [
      ("MetricsConfig", option_to_yojson metrics_config_to_yojson x.metrics_config);
      ("EnableNetworkIsolation", option_to_yojson boolean__to_yojson x.enable_network_isolation);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ExecutionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ( "ShadowProductionVariants",
        option_to_yojson production_variant_list_to_yojson x.shadow_production_variants );
      ("ExplainerConfig", option_to_yojson explainer_config_to_yojson x.explainer_config);
      ( "AsyncInferenceConfig",
        option_to_yojson async_inference_config_to_yojson x.async_inference_config );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataCaptureConfig", option_to_yojson data_capture_config_to_yojson x.data_capture_config);
      ("ProductionVariants", Some (production_variant_list_to_yojson x.production_variants));
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
    ]

let create_endpoint_output_to_yojson (x : create_endpoint_output) =
  assoc_to_yojson [ ("EndpointArn", Some (endpoint_arn_to_yojson x.endpoint_arn)) ]

let create_endpoint_input_to_yojson (x : create_endpoint_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DeploymentConfig", option_to_yojson deployment_config_to_yojson x.deployment_config);
      ("EndpointConfigName", Some (endpoint_config_name_to_yojson x.endpoint_config_name));
      ("EndpointName", Some (endpoint_name_to_yojson x.endpoint_name));
    ]

let create_edge_packaging_job_request_to_yojson (x : create_edge_packaging_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceKey", option_to_yojson kms_key_id_to_yojson x.resource_key);
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("ModelVersion", Some (edge_version_to_yojson x.model_version));
      ("ModelName", Some (entity_name_to_yojson x.model_name));
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
      ("EdgePackagingJobName", Some (entity_name_to_yojson x.edge_packaging_job_name));
    ]

let deployment_stage_to_yojson (x : deployment_stage) =
  assoc_to_yojson
    [
      ("DeploymentConfig", option_to_yojson edge_deployment_config_to_yojson x.deployment_config);
      ("DeviceSelectionConfig", Some (device_selection_config_to_yojson x.device_selection_config));
      ("StageName", Some (entity_name_to_yojson x.stage_name));
    ]

let deployment_stages_to_yojson tree = list_to_yojson deployment_stage_to_yojson tree

let create_edge_deployment_stage_request_to_yojson (x : create_edge_deployment_stage_request) =
  assoc_to_yojson
    [
      ("Stages", Some (deployment_stages_to_yojson x.stages));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
    ]

let create_edge_deployment_plan_response_to_yojson (x : create_edge_deployment_plan_response) =
  assoc_to_yojson
    [
      ("EdgeDeploymentPlanArn", Some (edge_deployment_plan_arn_to_yojson x.edge_deployment_plan_arn));
    ]

let create_edge_deployment_plan_request_to_yojson (x : create_edge_deployment_plan_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Stages", option_to_yojson deployment_stages_to_yojson x.stages);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
      ("ModelConfigs", Some (edge_deployment_model_configs_to_yojson x.model_configs));
      ("EdgeDeploymentPlanName", Some (entity_name_to_yojson x.edge_deployment_plan_name));
    ]

let create_domain_response_to_yojson (x : create_domain_response) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson string1024_to_yojson x.url);
      ("DomainId", option_to_yojson domain_id_to_yojson x.domain_id);
      ("DomainArn", option_to_yojson domain_arn_to_yojson x.domain_arn);
    ]

let create_domain_request_to_yojson (x : create_domain_request) =
  assoc_to_yojson
    [
      ( "DefaultSpaceSettings",
        option_to_yojson default_space_settings_to_yojson x.default_space_settings );
      ("TagPropagation", option_to_yojson tag_propagation_to_yojson x.tag_propagation);
      ( "HomeEfsFileSystemCreation",
        option_to_yojson home_efs_file_system_creation_to_yojson x.home_efs_file_system_creation );
      ( "AppSecurityGroupManagement",
        option_to_yojson app_security_group_management_to_yojson x.app_security_group_management );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "HomeEfsFileSystemKmsKeyId",
        option_to_yojson kms_key_id_to_yojson x.home_efs_file_system_kms_key_id );
      ( "AppNetworkAccessType",
        option_to_yojson app_network_access_type_to_yojson x.app_network_access_type );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetIds", option_to_yojson subnets_to_yojson x.subnet_ids);
      ("DomainSettings", option_to_yojson domain_settings_to_yojson x.domain_settings);
      ("DefaultUserSettings", Some (user_settings_to_yojson x.default_user_settings));
      ("AuthMode", Some (auth_mode_to_yojson x.auth_mode));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let create_device_fleet_request_to_yojson (x : create_device_fleet_request) =
  assoc_to_yojson
    [
      ( "EnableIotRoleAlias",
        option_to_yojson enable_iot_role_alias_to_yojson x.enable_iot_role_alias );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OutputConfig", Some (edge_output_config_to_yojson x.output_config));
      ("Description", option_to_yojson device_fleet_description_to_yojson x.description);
      ("RoleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("DeviceFleetName", Some (entity_name_to_yojson x.device_fleet_name));
    ]

let create_data_quality_job_definition_response_to_yojson
    (x : create_data_quality_job_definition_response) =
  assoc_to_yojson
    [ ("JobDefinitionArn", Some (monitoring_job_definition_arn_to_yojson x.job_definition_arn)) ]

let create_data_quality_job_definition_request_to_yojson
    (x : create_data_quality_job_definition_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "StoppingCondition",
        option_to_yojson monitoring_stopping_condition_to_yojson x.stopping_condition );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("NetworkConfig", option_to_yojson monitoring_network_config_to_yojson x.network_config);
      ("JobResources", Some (monitoring_resources_to_yojson x.job_resources));
      ( "DataQualityJobOutputConfig",
        Some (monitoring_output_config_to_yojson x.data_quality_job_output_config) );
      ("DataQualityJobInput", Some (data_quality_job_input_to_yojson x.data_quality_job_input));
      ( "DataQualityAppSpecification",
        Some (data_quality_app_specification_to_yojson x.data_quality_app_specification) );
      ( "DataQualityBaselineConfig",
        option_to_yojson data_quality_baseline_config_to_yojson x.data_quality_baseline_config );
      ("JobDefinitionName", Some (monitoring_job_definition_name_to_yojson x.job_definition_name));
    ]

let create_context_response_to_yojson (x : create_context_response) =
  assoc_to_yojson [ ("ContextArn", option_to_yojson context_arn_to_yojson x.context_arn) ]

let create_context_request_to_yojson (x : create_context_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("ContextType", Some (string256_to_yojson x.context_type));
      ("Source", Some (context_source_to_yojson x.source));
      ("ContextName", Some (context_name_to_yojson x.context_name));
    ]

let create_compute_quota_response_to_yojson (x : create_compute_quota_response) =
  assoc_to_yojson
    [
      ("ComputeQuotaId", Some (compute_quota_id_to_yojson x.compute_quota_id));
      ("ComputeQuotaArn", Some (compute_quota_arn_to_yojson x.compute_quota_arn));
    ]

let create_compute_quota_request_to_yojson (x : create_compute_quota_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ActivationState", option_to_yojson activation_state_to_yojson x.activation_state);
      ("ComputeQuotaTarget", Some (compute_quota_target_to_yojson x.compute_quota_target));
      ("ComputeQuotaConfig", Some (compute_quota_config_to_yojson x.compute_quota_config));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("Name", Some (entity_name_to_yojson x.name));
    ]

let create_compilation_job_response_to_yojson (x : create_compilation_job_response) =
  assoc_to_yojson
    [ ("CompilationJobArn", Some (compilation_job_arn_to_yojson x.compilation_job_arn)) ]

let create_compilation_job_request_to_yojson (x : create_compilation_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("StoppingCondition", Some (stopping_condition_to_yojson x.stopping_condition));
      ("VpcConfig", option_to_yojson neo_vpc_config_to_yojson x.vpc_config);
      ("OutputConfig", Some (output_config_to_yojson x.output_config));
      ("InputConfig", option_to_yojson input_config_to_yojson x.input_config);
      ( "ModelPackageVersionArn",
        option_to_yojson model_package_arn_to_yojson x.model_package_version_arn );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("CompilationJobName", Some (entity_name_to_yojson x.compilation_job_name));
    ]

let create_code_repository_output_to_yojson (x : create_code_repository_output) =
  assoc_to_yojson
    [ ("CodeRepositoryArn", Some (code_repository_arn_to_yojson x.code_repository_arn)) ]

let create_code_repository_input_to_yojson (x : create_code_repository_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("GitConfig", Some (git_config_to_yojson x.git_config));
      ("CodeRepositoryName", Some (entity_name_to_yojson x.code_repository_name));
    ]

let create_cluster_scheduler_config_response_to_yojson
    (x : create_cluster_scheduler_config_response) =
  assoc_to_yojson
    [
      ( "ClusterSchedulerConfigId",
        Some (cluster_scheduler_config_id_to_yojson x.cluster_scheduler_config_id) );
      ( "ClusterSchedulerConfigArn",
        Some (cluster_scheduler_config_arn_to_yojson x.cluster_scheduler_config_arn) );
    ]

let create_cluster_scheduler_config_request_to_yojson (x : create_cluster_scheduler_config_request)
    =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Description", option_to_yojson entity_description_to_yojson x.description);
      ("SchedulerConfig", Some (scheduler_config_to_yojson x.scheduler_config));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
      ("Name", Some (entity_name_to_yojson x.name));
    ]

let create_cluster_response_to_yojson (x : create_cluster_response) =
  assoc_to_yojson [ ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn)) ]

let create_cluster_request_to_yojson (x : create_cluster_request) =
  assoc_to_yojson
    [
      ("AutoScaling", option_to_yojson cluster_auto_scaling_config_to_yojson x.auto_scaling);
      ("ClusterRole", option_to_yojson role_arn_to_yojson x.cluster_role);
      ( "NodeProvisioningMode",
        option_to_yojson cluster_node_provisioning_mode_to_yojson x.node_provisioning_mode );
      ( "TieredStorageConfig",
        option_to_yojson cluster_tiered_storage_config_to_yojson x.tiered_storage_config );
      ("NodeRecovery", option_to_yojson cluster_node_recovery_to_yojson x.node_recovery);
      ("Orchestrator", option_to_yojson cluster_orchestrator_to_yojson x.orchestrator);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "RestrictedInstanceGroupsConfig",
        option_to_yojson cluster_restricted_instance_groups_config_to_yojson
          x.restricted_instance_groups_config );
      ( "RestrictedInstanceGroups",
        option_to_yojson cluster_restricted_instance_group_specifications_to_yojson
          x.restricted_instance_groups );
      ( "InstanceGroups",
        option_to_yojson cluster_instance_group_specifications_to_yojson x.instance_groups );
      ("ClusterName", Some (cluster_name_to_yojson x.cluster_name));
    ]

let create_auto_ml_job_v2_response_to_yojson (x : create_auto_ml_job_v2_response) =
  assoc_to_yojson [ ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn)) ]

let create_auto_ml_job_v2_request_to_yojson (x : create_auto_ml_job_v2_request) =
  assoc_to_yojson
    [
      ( "AutoMLComputeConfig",
        option_to_yojson auto_ml_compute_config_to_yojson x.auto_ml_compute_config );
      ("DataSplitConfig", option_to_yojson auto_ml_data_split_config_to_yojson x.data_split_config);
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("SecurityConfig", option_to_yojson auto_ml_security_config_to_yojson x.security_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AutoMLProblemTypeConfig",
        Some (auto_ml_problem_type_config_to_yojson x.auto_ml_problem_type_config) );
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ( "AutoMLJobInputDataConfig",
        Some (auto_ml_job_input_data_config_to_yojson x.auto_ml_job_input_data_config) );
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
    ]

let create_auto_ml_job_response_to_yojson (x : create_auto_ml_job_response) =
  assoc_to_yojson [ ("AutoMLJobArn", Some (auto_ml_job_arn_to_yojson x.auto_ml_job_arn)) ]

let create_auto_ml_job_request_to_yojson (x : create_auto_ml_job_request) =
  assoc_to_yojson
    [
      ("ModelDeployConfig", option_to_yojson model_deploy_config_to_yojson x.model_deploy_config);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "GenerateCandidateDefinitionsOnly",
        option_to_yojson generate_candidate_definitions_only_to_yojson
          x.generate_candidate_definitions_only );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ("AutoMLJobConfig", option_to_yojson auto_ml_job_config_to_yojson x.auto_ml_job_config);
      ( "AutoMLJobObjective",
        option_to_yojson auto_ml_job_objective_to_yojson x.auto_ml_job_objective );
      ("ProblemType", option_to_yojson problem_type_to_yojson x.problem_type);
      ("OutputDataConfig", Some (auto_ml_output_data_config_to_yojson x.output_data_config));
      ("InputDataConfig", Some (auto_ml_input_data_config_to_yojson x.input_data_config));
      ("AutoMLJobName", Some (auto_ml_job_name_to_yojson x.auto_ml_job_name));
    ]

let create_artifact_response_to_yojson (x : create_artifact_response) =
  assoc_to_yojson [ ("ArtifactArn", option_to_yojson artifact_arn_to_yojson x.artifact_arn) ]

let create_artifact_request_to_yojson (x : create_artifact_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Properties", option_to_yojson artifact_properties_to_yojson x.properties);
      ("ArtifactType", Some (string256_to_yojson x.artifact_type));
      ("Source", Some (artifact_source_to_yojson x.source));
      ("ArtifactName", option_to_yojson experiment_entity_name_to_yojson x.artifact_name);
    ]

let create_app_image_config_response_to_yojson (x : create_app_image_config_response) =
  assoc_to_yojson
    [
      ("AppImageConfigArn", option_to_yojson app_image_config_arn_to_yojson x.app_image_config_arn);
    ]

let create_app_image_config_request_to_yojson (x : create_app_image_config_request) =
  assoc_to_yojson
    [
      ( "CodeEditorAppImageConfig",
        option_to_yojson code_editor_app_image_config_to_yojson x.code_editor_app_image_config );
      ( "JupyterLabAppImageConfig",
        option_to_yojson jupyter_lab_app_image_config_to_yojson x.jupyter_lab_app_image_config );
      ( "KernelGatewayImageConfig",
        option_to_yojson kernel_gateway_image_config_to_yojson x.kernel_gateway_image_config );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AppImageConfigName", Some (app_image_config_name_to_yojson x.app_image_config_name));
    ]

let create_app_response_to_yojson (x : create_app_response) =
  assoc_to_yojson [ ("AppArn", option_to_yojson app_arn_to_yojson x.app_arn) ]

let create_app_request_to_yojson (x : create_app_request) =
  assoc_to_yojson
    [
      ("RecoveryMode", option_to_yojson boolean__to_yojson x.recovery_mode);
      ("ResourceSpec", option_to_yojson resource_spec_to_yojson x.resource_spec);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AppName", Some (app_name_to_yojson x.app_name));
      ("AppType", Some (app_type_to_yojson x.app_type));
      ("SpaceName", option_to_yojson space_name_to_yojson x.space_name);
      ("UserProfileName", option_to_yojson user_profile_name_to_yojson x.user_profile_name);
      ("DomainId", Some (domain_id_to_yojson x.domain_id));
    ]

let create_algorithm_output_to_yojson (x : create_algorithm_output) =
  assoc_to_yojson [ ("AlgorithmArn", Some (algorithm_arn_to_yojson x.algorithm_arn)) ]

let create_algorithm_input_to_yojson (x : create_algorithm_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CertifyForMarketplace",
        option_to_yojson certify_for_marketplace_to_yojson x.certify_for_marketplace );
      ( "ValidationSpecification",
        option_to_yojson algorithm_validation_specification_to_yojson x.validation_specification );
      ( "InferenceSpecification",
        option_to_yojson inference_specification_to_yojson x.inference_specification );
      ("TrainingSpecification", Some (training_specification_to_yojson x.training_specification));
      ("AlgorithmDescription", option_to_yojson entity_description_to_yojson x.algorithm_description);
      ("AlgorithmName", Some (entity_name_to_yojson x.algorithm_name));
    ]

let create_ai_workload_config_response_to_yojson (x : create_ai_workload_config_response) =
  assoc_to_yojson
    [ ("AIWorkloadConfigArn", Some (ai_workload_config_arn_to_yojson x.ai_workload_config_arn)) ]

let create_ai_workload_config_request_to_yojson (x : create_ai_workload_config_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AIWorkloadConfigs", option_to_yojson ai_workload_configs_to_yojson x.ai_workload_configs);
      ("DatasetConfig", option_to_yojson ai_dataset_config_to_yojson x.dataset_config);
      ("AIWorkloadConfigName", Some (ai_entity_name_to_yojson x.ai_workload_config_name));
    ]

let create_ai_recommendation_job_response_to_yojson (x : create_ai_recommendation_job_response) =
  assoc_to_yojson
    [
      ( "AIRecommendationJobArn",
        Some (ai_recommendation_job_arn_to_yojson x.ai_recommendation_job_arn) );
    ]

let ai_recommendation_output_config_to_yojson (x : ai_recommendation_output_config) =
  assoc_to_yojson
    [
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
      ( "ModelPackageGroupIdentifier",
        option_to_yojson ai_resource_identifier_to_yojson x.model_package_group_identifier );
      ("S3OutputLocation", option_to_yojson s3_uri_to_yojson x.s3_output_location);
    ]

let create_ai_recommendation_job_request_to_yojson (x : create_ai_recommendation_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ComputeSpec", option_to_yojson ai_recommendation_compute_spec_to_yojson x.compute_spec);
      ( "OptimizeModel",
        option_to_yojson ai_recommendation_allow_optimization_to_yojson x.optimize_model );
      ( "InferenceSpecification",
        option_to_yojson ai_recommendation_inference_specification_to_yojson
          x.inference_specification );
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "PerformanceTarget",
        Some (ai_recommendation_performance_target_to_yojson x.performance_target) );
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ("OutputConfig", Some (ai_recommendation_output_config_to_yojson x.output_config));
      ("ModelSource", Some (ai_model_source_to_yojson x.model_source));
      ("AIRecommendationJobName", Some (ai_entity_name_to_yojson x.ai_recommendation_job_name));
    ]

let create_ai_benchmark_job_response_to_yojson (x : create_ai_benchmark_job_response) =
  assoc_to_yojson
    [ ("AIBenchmarkJobArn", Some (ai_benchmark_job_arn_to_yojson x.ai_benchmark_job_arn)) ]

let ai_benchmark_output_config_to_yojson (x : ai_benchmark_output_config) =
  assoc_to_yojson
    [
      ("MlflowConfig", option_to_yojson ai_mlflow_config_to_yojson x.mlflow_config);
      ("S3OutputLocation", Some (s3_uri_to_yojson x.s3_output_location));
    ]

let create_ai_benchmark_job_request_to_yojson (x : create_ai_benchmark_job_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("NetworkConfig", option_to_yojson ai_benchmark_network_config_to_yojson x.network_config);
      ("RoleArn", Some (role_arn_to_yojson x.role_arn));
      ( "AIWorkloadConfigIdentifier",
        Some (ai_resource_identifier_to_yojson x.ai_workload_config_identifier) );
      ("OutputConfig", Some (ai_benchmark_output_config_to_yojson x.output_config));
      ("BenchmarkTarget", Some (ai_benchmark_target_to_yojson x.benchmark_target));
      ("AIBenchmarkJobName", Some (ai_entity_name_to_yojson x.ai_benchmark_job_name));
    ]

let create_action_response_to_yojson (x : create_action_response) =
  assoc_to_yojson [ ("ActionArn", option_to_yojson action_arn_to_yojson x.action_arn) ]

let create_action_request_to_yojson (x : create_action_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("MetadataProperties", option_to_yojson metadata_properties_to_yojson x.metadata_properties);
      ("Properties", option_to_yojson lineage_entity_parameters_to_yojson x.properties);
      ("Status", option_to_yojson action_status_to_yojson x.status);
      ("Description", option_to_yojson experiment_description_to_yojson x.description);
      ("ActionType", Some (string256_to_yojson x.action_type));
      ("Source", Some (action_source_to_yojson x.source));
      ("ActionName", Some (experiment_entity_name_to_yojson x.action_name));
    ]

let cluster_node_ids_to_yojson tree = list_to_yojson cluster_node_id_to_yojson tree

let batch_replace_cluster_nodes_error_code_to_yojson (x : batch_replace_cluster_nodes_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "InternalServerError"
  | INSTANCE_ID_IN_USE -> `String "InstanceIdInUse"
  | INVALID_INSTANCE_STATUS -> `String "InvalidInstanceStatus"
  | INSTANCE_ID_NOT_FOUND -> `String "InstanceIdNotFound"

let batch_replace_cluster_nodes_error_to_yojson (x : batch_replace_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ErrorCode", Some (batch_replace_cluster_nodes_error_code_to_yojson x.error_code));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
    ]

let batch_replace_cluster_nodes_errors_to_yojson tree =
  list_to_yojson batch_replace_cluster_nodes_error_to_yojson tree

let batch_replace_cluster_node_logical_ids_error_to_yojson
    (x : batch_replace_cluster_node_logical_ids_error) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ErrorCode", Some (batch_replace_cluster_nodes_error_code_to_yojson x.error_code));
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
    ]

let batch_replace_cluster_node_logical_ids_errors_to_yojson tree =
  list_to_yojson batch_replace_cluster_node_logical_ids_error_to_yojson tree

let cluster_node_logical_id_list_to_yojson tree =
  list_to_yojson cluster_node_logical_id_to_yojson tree

let batch_replace_cluster_nodes_response_to_yojson (x : batch_replace_cluster_nodes_response) =
  assoc_to_yojson
    [
      ( "SuccessfulNodeLogicalIds",
        option_to_yojson cluster_node_logical_id_list_to_yojson x.successful_node_logical_ids );
      ( "FailedNodeLogicalIds",
        option_to_yojson batch_replace_cluster_node_logical_ids_errors_to_yojson
          x.failed_node_logical_ids );
      ("Failed", option_to_yojson batch_replace_cluster_nodes_errors_to_yojson x.failed);
      ("Successful", option_to_yojson cluster_node_ids_to_yojson x.successful);
    ]

let batch_replace_cluster_nodes_request_to_yojson (x : batch_replace_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("NodeLogicalIds", option_to_yojson cluster_node_logical_id_list_to_yojson x.node_logical_ids);
      ("NodeIds", option_to_yojson cluster_node_ids_to_yojson x.node_ids);
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let batch_reboot_cluster_nodes_error_code_to_yojson (x : batch_reboot_cluster_nodes_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "InternalServerError"
  | INSTANCE_ID_IN_USE -> `String "InstanceIdInUse"
  | INVALID_INSTANCE_STATUS -> `String "InvalidInstanceStatus"
  | INSTANCE_ID_NOT_FOUND -> `String "InstanceIdNotFound"

let batch_reboot_cluster_nodes_error_to_yojson (x : batch_reboot_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ErrorCode", Some (batch_reboot_cluster_nodes_error_code_to_yojson x.error_code));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
    ]

let batch_reboot_cluster_nodes_errors_to_yojson tree =
  list_to_yojson batch_reboot_cluster_nodes_error_to_yojson tree

let batch_reboot_cluster_node_logical_ids_error_to_yojson
    (x : batch_reboot_cluster_node_logical_ids_error) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ErrorCode", Some (batch_reboot_cluster_nodes_error_code_to_yojson x.error_code));
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
    ]

let batch_reboot_cluster_node_logical_ids_errors_to_yojson tree =
  list_to_yojson batch_reboot_cluster_node_logical_ids_error_to_yojson tree

let batch_reboot_cluster_nodes_response_to_yojson (x : batch_reboot_cluster_nodes_response) =
  assoc_to_yojson
    [
      ( "SuccessfulNodeLogicalIds",
        option_to_yojson cluster_node_logical_id_list_to_yojson x.successful_node_logical_ids );
      ( "FailedNodeLogicalIds",
        option_to_yojson batch_reboot_cluster_node_logical_ids_errors_to_yojson
          x.failed_node_logical_ids );
      ("Failed", option_to_yojson batch_reboot_cluster_nodes_errors_to_yojson x.failed);
      ("Successful", option_to_yojson cluster_node_ids_to_yojson x.successful);
    ]

let batch_reboot_cluster_nodes_request_to_yojson (x : batch_reboot_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("NodeLogicalIds", option_to_yojson cluster_node_logical_id_list_to_yojson x.node_logical_ids);
      ("NodeIds", option_to_yojson cluster_node_ids_to_yojson x.node_ids);
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let batch_describe_model_package_summary_to_yojson (x : batch_describe_model_package_summary) =
  assoc_to_yojson
    [
      ( "ModelPackageRegistrationType",
        option_to_yojson model_package_registration_type_to_yojson x.model_package_registration_type
      );
      ( "ModelApprovalStatus",
        option_to_yojson model_approval_status_to_yojson x.model_approval_status );
      ("ModelPackageStatus", Some (model_package_status_to_yojson x.model_package_status));
      ("InferenceSpecification", Some (inference_specification_to_yojson x.inference_specification));
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ( "ModelPackageDescription",
        option_to_yojson entity_description_to_yojson x.model_package_description );
      ("ModelPackageArn", Some (model_package_arn_to_yojson x.model_package_arn));
      ( "ModelPackageVersion",
        option_to_yojson model_package_version_to_yojson x.model_package_version );
      ("ModelPackageGroupName", Some (entity_name_to_yojson x.model_package_group_name));
    ]

let model_package_summaries_to_yojson tree =
  map_to_yojson model_package_arn_to_yojson batch_describe_model_package_summary_to_yojson tree

let batch_describe_model_package_error_to_yojson (x : batch_describe_model_package_error) =
  assoc_to_yojson
    [
      ("ErrorResponse", Some (string__to_yojson x.error_response));
      ("ErrorCode", Some (string__to_yojson x.error_code));
    ]

let batch_describe_model_package_error_map_to_yojson tree =
  map_to_yojson model_package_arn_to_yojson batch_describe_model_package_error_to_yojson tree

let batch_describe_model_package_output_to_yojson (x : batch_describe_model_package_output) =
  assoc_to_yojson
    [
      ( "BatchDescribeModelPackageErrorMap",
        option_to_yojson batch_describe_model_package_error_map_to_yojson
          x.batch_describe_model_package_error_map );
      ( "ModelPackageSummaries",
        option_to_yojson model_package_summaries_to_yojson x.model_package_summaries );
    ]

let model_package_arn_list_to_yojson tree = list_to_yojson model_package_arn_to_yojson tree

let batch_describe_model_package_input_to_yojson (x : batch_describe_model_package_input) =
  assoc_to_yojson
    [ ("ModelPackageArnList", Some (model_package_arn_list_to_yojson x.model_package_arn_list)) ]

let batch_delete_cluster_nodes_error_code_to_yojson (x : batch_delete_cluster_nodes_error_code) =
  match x with
  | NODE_ID_IN_USE -> `String "NodeIdInUse"
  | INVALID_NODE_STATUS -> `String "InvalidNodeStatus"
  | NODE_ID_NOT_FOUND -> `String "NodeIdNotFound"

let batch_delete_cluster_nodes_error_to_yojson (x : batch_delete_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Code", Some (batch_delete_cluster_nodes_error_code_to_yojson x.code));
    ]

let batch_delete_cluster_nodes_error_list_to_yojson tree =
  list_to_yojson batch_delete_cluster_nodes_error_to_yojson tree

let batch_delete_cluster_node_logical_ids_error_to_yojson
    (x : batch_delete_cluster_node_logical_ids_error) =
  assoc_to_yojson
    [
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
      ("Message", Some (string__to_yojson x.message));
      ("Code", Some (batch_delete_cluster_nodes_error_code_to_yojson x.code));
    ]

let batch_delete_cluster_node_logical_ids_error_list_to_yojson tree =
  list_to_yojson batch_delete_cluster_node_logical_ids_error_to_yojson tree

let batch_delete_cluster_nodes_response_to_yojson (x : batch_delete_cluster_nodes_response) =
  assoc_to_yojson
    [
      ( "SuccessfulNodeLogicalIds",
        option_to_yojson cluster_node_logical_id_list_to_yojson x.successful_node_logical_ids );
      ( "FailedNodeLogicalIds",
        option_to_yojson batch_delete_cluster_node_logical_ids_error_list_to_yojson
          x.failed_node_logical_ids );
      ("Successful", option_to_yojson cluster_node_ids_to_yojson x.successful);
      ("Failed", option_to_yojson batch_delete_cluster_nodes_error_list_to_yojson x.failed);
    ]

let batch_delete_cluster_nodes_request_to_yojson (x : batch_delete_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("NodeLogicalIds", option_to_yojson cluster_node_logical_id_list_to_yojson x.node_logical_ids);
      ("NodeIds", option_to_yojson cluster_node_ids_to_yojson x.node_ids);
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let cluster_availability_zones_to_yojson tree =
  list_to_yojson cluster_availability_zone_to_yojson tree

let node_addition_result_to_yojson (x : node_addition_result) =
  assoc_to_yojson
    [
      ("InstanceTypes", option_to_yojson cluster_instance_types_to_yojson x.instance_types);
      ( "AvailabilityZones",
        option_to_yojson cluster_availability_zones_to_yojson x.availability_zones );
      ("Status", Some (cluster_instance_status_to_yojson x.status));
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
      ("NodeLogicalId", Some (cluster_node_logical_id_to_yojson x.node_logical_id));
    ]

let node_addition_result_list_to_yojson tree = list_to_yojson node_addition_result_to_yojson tree

let batch_add_cluster_nodes_error_code_to_yojson (x : batch_add_cluster_nodes_error_code) =
  match x with
  | INCOMPATIBLE_INSTANCE_TYPES -> `String "IncompatibleInstanceTypes"
  | INCOMPATIBLE_AVAILABILITY_ZONES -> `String "IncompatibleAvailabilityZones"
  | INVALID_INSTANCE_GROUP_STATUS -> `String "InvalidInstanceGroupStatus"
  | INSTANCE_GROUP_NOT_FOUND -> `String "InstanceGroupNotFound"

let batch_add_failure_count_to_yojson = int_to_yojson

let batch_add_cluster_nodes_error_to_yojson (x : batch_add_cluster_nodes_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("InstanceTypes", option_to_yojson cluster_instance_types_to_yojson x.instance_types);
      ( "AvailabilityZones",
        option_to_yojson cluster_availability_zones_to_yojson x.availability_zones );
      ("FailedCount", Some (batch_add_failure_count_to_yojson x.failed_count));
      ("ErrorCode", Some (batch_add_cluster_nodes_error_code_to_yojson x.error_code));
      ("InstanceGroupName", Some (instance_group_name_to_yojson x.instance_group_name));
    ]

let batch_add_cluster_nodes_error_list_to_yojson tree =
  list_to_yojson batch_add_cluster_nodes_error_to_yojson tree

let batch_add_cluster_nodes_response_to_yojson (x : batch_add_cluster_nodes_response) =
  assoc_to_yojson
    [
      ("Failed", Some (batch_add_cluster_nodes_error_list_to_yojson x.failed));
      ("Successful", Some (node_addition_result_list_to_yojson x.successful));
    ]

let batch_add_increment_count_to_yojson = int_to_yojson

let add_cluster_node_specification_to_yojson (x : add_cluster_node_specification) =
  assoc_to_yojson
    [
      ("InstanceTypes", option_to_yojson cluster_instance_types_to_yojson x.instance_types);
      ( "AvailabilityZones",
        option_to_yojson cluster_availability_zones_to_yojson x.availability_zones );
      ( "IncrementTargetCountBy",
        Some (batch_add_increment_count_to_yojson x.increment_target_count_by) );
      ("InstanceGroupName", Some (cluster_instance_group_name_to_yojson x.instance_group_name));
    ]

let add_cluster_node_specification_list_to_yojson tree =
  list_to_yojson add_cluster_node_specification_to_yojson tree

let batch_add_cluster_nodes_request_to_yojson (x : batch_add_cluster_nodes_request) =
  assoc_to_yojson
    [
      ("NodesToAdd", Some (add_cluster_node_specification_list_to_yojson x.nodes_to_add));
      ( "ClientToken",
        Some (string__to_yojson (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ())))
      );
      ("ClusterName", Some (cluster_name_or_arn_to_yojson x.cluster_name));
    ]

let attach_cluster_node_volume_response_to_yojson (x : attach_cluster_node_volume_response) =
  assoc_to_yojson
    [
      ("DeviceName", Some (volume_device_name_to_yojson x.device_name));
      ("Status", Some (volume_attachment_status_to_yojson x.status));
      ("AttachTime", Some (timestamp_to_yojson x.attach_time));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
    ]

let attach_cluster_node_volume_request_to_yojson (x : attach_cluster_node_volume_request) =
  assoc_to_yojson
    [
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("NodeId", Some (cluster_node_id_to_yojson x.node_id));
      ("ClusterArn", Some (cluster_arn_to_yojson x.cluster_arn));
    ]

let associate_trial_component_response_to_yojson (x : associate_trial_component_response) =
  assoc_to_yojson
    [
      ("TrialArn", option_to_yojson trial_arn_to_yojson x.trial_arn);
      ("TrialComponentArn", option_to_yojson trial_component_arn_to_yojson x.trial_component_arn);
    ]

let associate_trial_component_request_to_yojson (x : associate_trial_component_request) =
  assoc_to_yojson
    [
      ("TrialName", Some (experiment_entity_name_to_yojson x.trial_name));
      ("TrialComponentName", Some (experiment_entity_name_to_yojson x.trial_component_name));
    ]

let add_tags_output_to_yojson (x : add_tags_output) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let add_tags_input_to_yojson (x : add_tags_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let add_association_response_to_yojson (x : add_association_response) =
  assoc_to_yojson
    [
      ("DestinationArn", option_to_yojson association_entity_arn_to_yojson x.destination_arn);
      ("SourceArn", option_to_yojson association_entity_arn_to_yojson x.source_arn);
    ]

let add_association_request_to_yojson (x : add_association_request) =
  assoc_to_yojson
    [
      ("AssociationType", option_to_yojson association_edge_type_to_yojson x.association_type);
      ("DestinationArn", Some (association_entity_arn_to_yojson x.destination_arn));
      ("SourceArn", Some (association_entity_arn_to_yojson x.source_arn));
    ]
