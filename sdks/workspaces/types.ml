type nonrec aga_mode_for_directory_enum = ENABLED_AUTO [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aga_mode_for_work_space_enum =
  | ENABLED_AUTO [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | INHERITED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aga_preferred_protocol_for_directory = TCP [@ocaml.doc ""] | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aga_preferred_protocol_for_work_space =
  | TCP [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
  | INHERITED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ar_n = string [@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You either haven't provided a [TargetAccountId] or are using the same value for \
   [TargetAccountId] and [SourceAccountId].\n"]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : exception_message option; [@ocaml.doc "The resource could not be found.\n"]
  resource_id : non_empty_string option;
      [@ocaml.doc "The ID of the resource that could not be found.\n"]
}
[@@ocaml.doc "The resource could not be found.\n"]

type nonrec internal_server_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Unexpected server error occured.\n"]

type nonrec conflict_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The [TargetAccountId] is already linked or invited.\n"]

type nonrec access_denied_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The user is not authorized to access a resource.\n"]

type nonrec aws_account = string [@@ocaml.doc ""]

type nonrec account_link_status_enum =
  | LINKED [@ocaml.doc ""]
  | LINKING_FAILED [@ocaml.doc ""]
  | LINK_NOT_FOUND [@ocaml.doc ""]
  | PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec link_id = string [@@ocaml.doc ""]

type nonrec account_link = {
  account_link_id : link_id option; [@ocaml.doc "The identifier of the account link.\n"]
  account_link_status : account_link_status_enum option;
      [@ocaml.doc "The status of the account link.\n"]
  source_account_id : aws_account option; [@ocaml.doc "The identifier of the source account.\n"]
  target_account_id : aws_account option; [@ocaml.doc "The identifier of the target account.\n"]
}
[@@ocaml.doc "Information about about the account link.\n"]

type nonrec accept_account_link_invitation_result = {
  account_link : account_link option; [@ocaml.doc "Information about the account link.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec accept_account_link_invitation_request = {
  link_id : link_id; [@ocaml.doc "The identifier of the account link.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A string of up to 64 ASCII characters that Amazon WorkSpaces uses to ensure idempotent \
         creation.\n"]
}
[@@ocaml.doc ""]

type nonrec alphanumeric_dash_underscore_non_empty_string = string [@@ocaml.doc ""]

type nonrec access_endpoint_type = STREAMING_WSP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec access_endpoint = {
  access_endpoint_type : access_endpoint_type option;
      [@ocaml.doc "Indicates the type of access endpoint.\n"]
  vpc_endpoint_id : alphanumeric_dash_underscore_non_empty_string option;
      [@ocaml.doc "Indicates the VPC endpoint to use for access.\n"]
}
[@@ocaml.doc "Describes the access type and endpoint for a WorkSpace.\n"]

type nonrec internet_fallback_protocol = PCOIP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec internet_fallback_protocol_list = internet_fallback_protocol list [@@ocaml.doc ""]

type nonrec access_endpoint_list = access_endpoint list [@@ocaml.doc ""]

type nonrec access_endpoint_config = {
  access_endpoints : access_endpoint_list;
      [@ocaml.doc "Indicates a list of access endpoints associated with this directory.\n"]
  internet_fallback_protocols : internet_fallback_protocol_list option;
      [@ocaml.doc
        "Indicates a list of protocols that fallback to using the public Internet when streaming \
         over a VPC endpoint is not available.\n"]
}
[@@ocaml.doc "Describes the access endpoint configuration for a WorkSpace.\n"]

type nonrec access_property_value = ALLOW [@ocaml.doc ""] | DENY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec account_link_list = account_link list [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec workspace_error_code = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec dedicated_tenancy_management_cidr_range = string [@@ocaml.doc ""]

type nonrec dedicated_tenancy_support_result_enum =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dedicated_tenancy_modification_state_enum =
  | PENDING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_modification = {
  modification_state : dedicated_tenancy_modification_state_enum option;
      [@ocaml.doc "The state of the modification to the configuration of BYOL.\n"]
  dedicated_tenancy_support : dedicated_tenancy_support_result_enum option;
      [@ocaml.doc "The status of BYOL (whether BYOL is being enabled or disabled).\n"]
  dedicated_tenancy_management_cidr_range : dedicated_tenancy_management_cidr_range option;
      [@ocaml.doc
        "The IP address range, specified as an IPv4 CIDR block, for the management network \
         interface used for the account.\n"]
  start_time : timestamp option;
      [@ocaml.doc "The timestamp when the modification of the BYOL configuration was started.\n"]
  error_code : workspace_error_code option;
      [@ocaml.doc
        "The error code that is returned if the configuration of BYOL cannot be modified.\n"]
  error_message : description option;
      [@ocaml.doc
        "The text of the error message that is returned if the configuration of BYOL cannot be \
         modified.\n"]
}
[@@ocaml.doc
  "Describes a modification to the configuration of Bring Your Own License (BYOL) for the \
   specified account. \n"]

type nonrec account_modification_list = account_modification list [@@ocaml.doc ""]

type nonrec secrets_manager_arn = string [@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec active_directory_config = {
  domain_name : domain_name; [@ocaml.doc "The name of the domain.\n"]
  service_account_secret_arn : secrets_manager_arn;
      [@ocaml.doc "Indicates the secret ARN on the service account.\n"]
}
[@@ocaml.doc "Information about the Active Directory config.\n"]

type nonrec active_user_sessions = int [@@ocaml.doc ""]

type nonrec actual_user_sessions = int [@@ocaml.doc ""]

type nonrec add_in_name = string [@@ocaml.doc ""]

type nonrec add_in_url = string [@@ocaml.doc ""]

type nonrec alias = string [@@ocaml.doc ""]

type nonrec amazon_uuid = string [@@ocaml.doc ""]

type nonrec application =
  | Microsoft_Office_2016 [@ocaml.doc ""]
  | Microsoft_Office_2019 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec application_associated_resource_type =
  | WORKSPACE [@ocaml.doc ""]
  | BUNDLE [@ocaml.doc ""]
  | IMAGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec application_associated_resource_type_list = application_associated_resource_type list
[@@ocaml.doc ""]

type nonrec application_list = application list [@@ocaml.doc ""]

type nonrec application_not_supported_exception = unit [@@ocaml.doc ""]

type nonrec string2048 = string [@@ocaml.doc ""]

type nonrec association_error_code =
  | INSUFFICIENT_DISKSPACE [@ocaml.doc ""]
  | INSUFFICIENT_MEMORY [@ocaml.doc ""]
  | UNSUPPORTED_OPERATING_SYSTEM [@ocaml.doc ""]
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | WORKSPACE_UNREACHABLE [@ocaml.doc ""]
  | APPLICATION_OLDVERSIONEXIST_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec association_state_reason = {
  error_code : association_error_code option;
      [@ocaml.doc "The error code of the association deployment failure.\n"]
  error_message : string2048 option;
      [@ocaml.doc "The error message of the association deployment failure.\n"]
}
[@@ocaml.doc
  "Indicates the reason that the association deployment failed, including the error code and error \
   message.\n"]

type nonrec association_state =
  | PENDING_INSTALL [@ocaml.doc ""]
  | PENDING_INSTALL_DEPLOYMENT [@ocaml.doc ""]
  | PENDING_UNINSTALL [@ocaml.doc ""]
  | PENDING_UNINSTALL_DEPLOYMENT [@ocaml.doc ""]
  | INSTALLING [@ocaml.doc ""]
  | UNINSTALLING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | REMOVED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec work_space_application_id = string [@@ocaml.doc ""]

type nonrec application_resource_association = {
  application_id : work_space_application_id option;
      [@ocaml.doc "The identifier of the application.\n"]
  associated_resource_id : non_empty_string option;
      [@ocaml.doc "The identifier of the associated resource.\n"]
  associated_resource_type : application_associated_resource_type option;
      [@ocaml.doc "The resource type of the associated resource.\n"]
  created : timestamp option; [@ocaml.doc "The time the association was created.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The time the association status was last updated.\n"]
  state : association_state option;
      [@ocaml.doc "The status of the application resource association.\n"]
  state_reason : association_state_reason option;
      [@ocaml.doc "The reason the association deployment failed.\n"]
}
[@@ocaml.doc "Describes the association between an application and an application resource.\n"]

type nonrec application_resource_association_list = application_resource_association list
[@@ocaml.doc ""]

type nonrec settings_group = string [@@ocaml.doc ""]

type nonrec application_settings_status_enum = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec application_settings_request = {
  status : application_settings_status_enum;
      [@ocaml.doc
        "Enables or disables persistent application settings for users during their pool sessions.\n"]
  settings_group : settings_group option;
      [@ocaml.doc
        "The path prefix for the S3 bucket where users\226\128\153 persistent application settings \
         are stored. You can allow the same persistent application settings to be used across \
         multiple pools by specifying the same settings group for each pool.\n"]
}
[@@ocaml.doc "The persistent application settings for WorkSpaces Pools users.\n"]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec application_settings_response = {
  status : application_settings_status_enum;
      [@ocaml.doc
        "Specifies whether persistent application settings are enabled for users during their pool \
         sessions.\n"]
  settings_group : settings_group option;
      [@ocaml.doc
        "The path prefix for the S3 bucket where users\226\128\153 persistent application settings \
         are stored.\n"]
  s3_bucket_name : s3_bucket_name option;
      [@ocaml.doc
        "The S3 bucket where users\226\128\153 persistent application settings are stored. When \
         persistent application settings are enabled for the first time for an account in an \
         Amazon Web Services Region, an S3 bucket is created. The bucket is unique to the Amazon \
         Web Services account and the Region.\n"]
}
[@@ocaml.doc "Describes the persistent application settings for WorkSpaces Pools users.\n"]

type nonrec resource_associated_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource is associated with a directory.\n"]

type nonrec exception_error_code = string [@@ocaml.doc ""]

type nonrec operation_not_supported_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
  reason : exception_error_code option; [@ocaml.doc "The exception error reason.\n"]
}
[@@ocaml.doc "This operation is not supported.\n"]

type nonrec invalid_resource_state_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The state of the resource is not valid for this operation.\n"]

type nonrec invalid_parameter_values_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "One or more parameter values are not valid.\n"]

type nonrec connection_identifier = string [@@ocaml.doc ""]

type nonrec associate_connection_alias_result = {
  connection_identifier : connection_identifier option;
      [@ocaml.doc
        "The identifier of the connection alias association. You use the connection identifier in \
         the DNS TXT record when you're configuring your DNS routing policies. \n"]
}
[@@ocaml.doc ""]

type nonrec connection_alias_id = string [@@ocaml.doc ""]

type nonrec associate_connection_alias_request = {
  alias_id : connection_alias_id; [@ocaml.doc "The identifier of the connection alias.\n"]
  resource_id : non_empty_string;
      [@ocaml.doc "The identifier of the directory to associate the connection alias with.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_limit_exceeded_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "Your resource limits have been exceeded.\n"]

type nonrec associate_ip_groups_result = unit [@@ocaml.doc ""]

type nonrec ip_group_id = string [@@ocaml.doc ""]

type nonrec ip_group_id_list = ip_group_id list [@@ocaml.doc ""]

type nonrec directory_id = string [@@ocaml.doc ""]

type nonrec associate_ip_groups_request = {
  directory_id : directory_id; [@ocaml.doc "The identifier of the directory.\n"]
  group_ids : ip_group_id_list;
      [@ocaml.doc "The identifiers of one or more IP access control groups.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_in_use_exception = {
  message : exception_message option; [@ocaml.doc ""]
  resource_id : non_empty_string option; [@ocaml.doc "The ID of the resource that is in use.\n"]
}
[@@ocaml.doc "The specified resource is currently in use.\n"]

type nonrec resource_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified resource already exists.\n"]

type nonrec operating_system_not_compatible_exception = unit [@@ocaml.doc ""]

type nonrec incompatible_applications_exception = unit [@@ocaml.doc ""]

type nonrec compute_not_compatible_exception = unit [@@ocaml.doc ""]

type nonrec workspace_id = string [@@ocaml.doc ""]

type nonrec work_space_associated_resource_type = APPLICATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec workspace_resource_association = {
  associated_resource_id : non_empty_string option;
      [@ocaml.doc "The identifier of the associated resource.\n"]
  associated_resource_type : work_space_associated_resource_type option;
      [@ocaml.doc "The resource types of the associated resource.\n"]
  created : timestamp option; [@ocaml.doc "The time the association is created.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The time the association status was last updated.\n"]
  state : association_state option;
      [@ocaml.doc "The status of the WorkSpace resource association.\n"]
  state_reason : association_state_reason option;
      [@ocaml.doc "The reason the association deployment failed.\n"]
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc "Describes the association between an application and a WorkSpace resource.\n"]

type nonrec associate_workspace_application_result = {
  association : workspace_resource_association option;
      [@ocaml.doc
        "Information about the association between the specified WorkSpace and the specified \
         application.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_workspace_application_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  application_id : work_space_application_id; [@ocaml.doc "The identifier of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec association_status =
  | NOT_ASSOCIATED [@ocaml.doc ""]
  | ASSOCIATED_WITH_OWNER_ACCOUNT [@ocaml.doc ""]
  | ASSOCIATED_WITH_SHARED_ACCOUNT [@ocaml.doc ""]
  | PENDING_ASSOCIATION [@ocaml.doc ""]
  | PENDING_DISASSOCIATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authentication_type = SAML [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec authorize_ip_rules_result = unit [@@ocaml.doc ""]

type nonrec ip_rule_desc = string [@@ocaml.doc ""]

type nonrec ip_rule = string [@@ocaml.doc ""]

type nonrec ip_rule_item = {
  ip_rule : ip_rule option; [@ocaml.doc "The IP address range, in CIDR notation.\n"]
  rule_desc : ip_rule_desc option; [@ocaml.doc "The description.\n"]
}
[@@ocaml.doc "Describes a rule for an IP access control group.\n"]

type nonrec ip_rule_list = ip_rule_item list [@@ocaml.doc ""]

type nonrec authorize_ip_rules_request = {
  group_id : ip_group_id; [@ocaml.doc "The identifier of the group.\n"]
  user_rules : ip_rule_list; [@ocaml.doc "The rules to add to the group.\n"]
}
[@@ocaml.doc ""]

type nonrec available_user_sessions = int [@@ocaml.doc ""]

type nonrec boolean_object = bool [@@ocaml.doc ""]

type nonrec bundle_associated_resource_type = APPLICATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec bundle_associated_resource_type_list = bundle_associated_resource_type list
[@@ocaml.doc ""]

type nonrec bundle_id = string [@@ocaml.doc ""]

type nonrec bundle_id_list = bundle_id list [@@ocaml.doc ""]

type nonrec bundle_type = REGULAR [@ocaml.doc ""] | STANDBY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec workspace_bundle_state =
  | AVAILABLE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compute =
  | VALUE [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""]
  | PERFORMANCE [@ocaml.doc ""]
  | POWER [@ocaml.doc ""]
  | GRAPHICS [@ocaml.doc ""]
  | POWERPRO [@ocaml.doc ""]
  | GENERALPURPOSE_4XLARGE [@ocaml.doc ""]
  | GENERALPURPOSE_8XLARGE [@ocaml.doc ""]
  | GRAPHICSPRO [@ocaml.doc ""]
  | GRAPHICS_G4DN [@ocaml.doc ""]
  | GRAPHICSPRO_G4DN [@ocaml.doc ""]
  | GRAPHICS_G6_XLARGE [@ocaml.doc ""]
  | GRAPHICS_G6_2XLARGE [@ocaml.doc ""]
  | GRAPHICS_G6_4XLARGE [@ocaml.doc ""]
  | GRAPHICS_G6_8XLARGE [@ocaml.doc ""]
  | GRAPHICS_G6_16XLARGE [@ocaml.doc ""]
  | GRAPHICS_GR6_4XLARGE [@ocaml.doc ""]
  | GRAPHICS_GR6_8XLARGE [@ocaml.doc ""]
  | GRAPHICS_G6F_LARGE [@ocaml.doc ""]
  | GRAPHICS_G6F_XLARGE [@ocaml.doc ""]
  | GRAPHICS_G6F_2XLARGE [@ocaml.doc ""]
  | GRAPHICS_G6F_4XLARGE [@ocaml.doc ""]
  | GRAPHICS_GR6F_4XLARGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compute_type = { name : compute option [@ocaml.doc "The compute type.\n"] }
[@@ocaml.doc "Describes the compute type of the bundle.\n"]

type nonrec user_storage = {
  capacity : non_empty_string; [@ocaml.doc "The size of the user volume.\n"]
}
[@@ocaml.doc "Describes the user volume for a WorkSpace bundle.\n"]

type nonrec root_storage = {
  capacity : non_empty_string; [@ocaml.doc "The size of the root volume.\n"]
}
[@@ocaml.doc "Describes the root volume for a WorkSpace bundle.\n"]

type nonrec workspace_image_id = string [@@ocaml.doc ""]

type nonrec bundle_owner = string [@@ocaml.doc ""]

type nonrec workspace_bundle = {
  bundle_id : bundle_id option; [@ocaml.doc "The identifier of the bundle.\n"]
  name : non_empty_string option; [@ocaml.doc "The name of the bundle.\n"]
  owner : bundle_owner option;
      [@ocaml.doc
        "The owner of the bundle. This is the account identifier of the owner, or [AMAZON] if the \
         bundle is provided by Amazon Web Services.\n"]
  description : description option; [@ocaml.doc "The description of the bundle.\n"]
  image_id : workspace_image_id option;
      [@ocaml.doc "The identifier of the image that was used to create the bundle.\n"]
  root_storage : root_storage option; [@ocaml.doc "The size of the root volume.\n"]
  user_storage : user_storage option; [@ocaml.doc "The size of the user volume.\n"]
  compute_type : compute_type option;
      [@ocaml.doc
        "The compute type of the bundle. For more information, see \
         {{:http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles}Amazon WorkSpaces \
         Bundles}.\n"]
  last_updated_time : timestamp option; [@ocaml.doc "The last time that the bundle was updated.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time when the bundle was created.\n"]
  state : workspace_bundle_state option; [@ocaml.doc "The state of the WorkSpace bundle.\n"]
  bundle_type : bundle_type option; [@ocaml.doc "The type of WorkSpace bundle.\n"]
}
[@@ocaml.doc "Describes a WorkSpace bundle.\n"]

type nonrec bundle_list = workspace_bundle list [@@ocaml.doc ""]

type nonrec bundle_resource_association = {
  associated_resource_id : non_empty_string option;
      [@ocaml.doc "The identifier of the associated resource.\n"]
  associated_resource_type : bundle_associated_resource_type option;
      [@ocaml.doc "The resource type of the associated resources.\n"]
  bundle_id : bundle_id option; [@ocaml.doc "The identifier of the bundle.\n"]
  created : timestamp option; [@ocaml.doc "The time the association is created.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The time the association status was last updated.\n"]
  state : association_state option; [@ocaml.doc "The status of the bundle resource association.\n"]
  state_reason : association_state_reason option;
      [@ocaml.doc "The reason the association deployment failed.\n"]
}
[@@ocaml.doc "Describes the association between an application and a bundle resource.\n"]

type nonrec bundle_resource_association_list = bundle_resource_association list [@@ocaml.doc ""]

type nonrec desired_user_sessions = int [@@ocaml.doc ""]

type nonrec capacity = {
  desired_user_sessions : desired_user_sessions;
      [@ocaml.doc "The desired number of user sessions for the WorkSpaces in the pool.\n"]
}
[@@ocaml.doc "Describes the user capacity for a pool of WorkSpaces.\n"]

type nonrec capacity_status = {
  available_user_sessions : available_user_sessions;
      [@ocaml.doc
        "The number of user sessions currently available for streaming from your pool.\n\n\
        \ AvailableUserSessions = ActualUserSessions - ActiveUserSessions\n\
        \ "]
  desired_user_sessions : desired_user_sessions;
      [@ocaml.doc
        "The total number of sessions slots that are either running or pending. This represents \
         the total number of concurrent streaming sessions your pool can support in a steady state.\n"]
  actual_user_sessions : actual_user_sessions;
      [@ocaml.doc
        "The total number of user sessions that are available for streaming or are currently \
         streaming in your pool.\n\n\
        \ ActualUserSessions = AvailableUserSessions + ActiveUserSessions\n\
        \ "]
  active_user_sessions : active_user_sessions;
      [@ocaml.doc "The number of user sessions currently being used for your pool.\n"]
}
[@@ocaml.doc "Describes the capacity status for a pool of WorkSpaces.\n"]

type nonrec certificate_authority_arn = string [@@ocaml.doc ""]

type nonrec certificate_based_auth_status_enum =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_based_auth_properties = {
  status : certificate_based_auth_status_enum option;
      [@ocaml.doc "The status of the certificate-based authentication properties.\n"]
  certificate_authority_arn : certificate_authority_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Certificate Manager Private CA \
         resource.\n"]
}
[@@ocaml.doc
  "Describes the properties of the certificate-based authentication you want to use with your \
   WorkSpaces.\n"]

type nonrec client_device_type =
  | DEVICE_TYPE_WINDOWS [@ocaml.doc ""]
  | DEVICE_TYPE_OSX [@ocaml.doc ""]
  | DEVICE_TYPE_ANDROID [@ocaml.doc ""]
  | DEVICE_TYPE_IOS [@ocaml.doc ""]
  | DEVICE_TYPE_LINUX [@ocaml.doc ""]
  | DEVICE_TYPE_WEB [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec client_device_type_list = client_device_type list [@@ocaml.doc ""]

type nonrec client_email = string [@@ocaml.doc ""]

type nonrec client_locale = string [@@ocaml.doc ""]

type nonrec client_login_message = string [@@ocaml.doc ""]

type nonrec log_upload_enum = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec reconnect_enum = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec client_properties = {
  reconnect_enabled : reconnect_enum option;
      [@ocaml.doc
        "Specifies whether users can cache their credentials on the Amazon WorkSpaces client. When \
         enabled, users can choose to reconnect to their WorkSpaces without re-entering their \
         credentials. \n"]
  log_upload_enabled : log_upload_enum option;
      [@ocaml.doc
        "Specifies whether users can upload diagnostic log files of Amazon WorkSpaces client \
         directly to WorkSpaces to troubleshoot issues when using the WorkSpaces client. When \
         enabled, the log files will be sent to WorkSpaces automatically and will be applied to \
         all users in the specified directory.\n"]
}
[@@ocaml.doc "Describes an Amazon WorkSpaces client.\n"]

type nonrec client_properties_result = {
  resource_id : non_empty_string option;
      [@ocaml.doc "The resource identifier, in the form of a directory ID.\n"]
  client_properties : client_properties option;
      [@ocaml.doc "Information about the Amazon WorkSpaces client.\n"]
}
[@@ocaml.doc "Information about the Amazon WorkSpaces client.\n"]

type nonrec client_properties_list = client_properties_result list [@@ocaml.doc ""]

type nonrec client_url = string [@@ocaml.doc ""]

type nonrec compute_list = compute list [@@ocaml.doc ""]

type nonrec computer_name = string [@@ocaml.doc ""]

type nonrec connect_client_add_in = {
  add_in_id : amazon_uuid option; [@ocaml.doc "The client add-in identifier.\n"]
  resource_id : directory_id option;
      [@ocaml.doc "The directory identifier for which the client add-in is configured.\n"]
  name : add_in_name option; [@ocaml.doc "The name of the client add in.\n"]
  ur_l : add_in_url option; [@ocaml.doc "The endpoint URL of the client add-in.\n"]
}
[@@ocaml.doc "Describes an Connect Customer client add-in.\n"]

type nonrec connect_client_add_in_list = connect_client_add_in list [@@ocaml.doc ""]

type nonrec connection_alias_association = {
  association_status : association_status option;
      [@ocaml.doc "The association status of the connection alias.\n"]
  associated_account_id : aws_account option;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account that associated the connection alias \
         with a directory.\n"]
  resource_id : non_empty_string option;
      [@ocaml.doc "The identifier of the directory associated with a connection alias.\n"]
  connection_identifier : connection_identifier option;
      [@ocaml.doc
        "The identifier of the connection alias association. You use the connection identifier in \
         the DNS TXT record when you're configuring your DNS routing policies.\n"]
}
[@@ocaml.doc
  "Describes a connection alias association that is used for cross-Region redirection. For more \
   information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n"]

type nonrec connection_alias_association_list = connection_alias_association list [@@ocaml.doc ""]

type nonrec connection_alias_state =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connection_string = string [@@ocaml.doc ""]

type nonrec connection_alias = {
  connection_string : connection_string option;
      [@ocaml.doc
        "The connection string specified for the connection alias. The connection string must be \
         in the form of a fully qualified domain name (FQDN), such as [www.example.com].\n"]
  alias_id : connection_alias_id option; [@ocaml.doc "The identifier of the connection alias.\n"]
  state : connection_alias_state option; [@ocaml.doc "The current state of the connection alias.\n"]
  owner_account_id : aws_account option;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account that owns the connection alias.\n"]
  associations : connection_alias_association_list option;
      [@ocaml.doc "The association status of the connection alias.\n"]
}
[@@ocaml.doc
  "Describes a connection alias. Connection aliases are used for cross-Region redirection. For \
   more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n"]

type nonrec connection_alias_id_list = connection_alias_id list [@@ocaml.doc ""]

type nonrec connection_alias_list = connection_alias list [@@ocaml.doc ""]

type nonrec connection_alias_permission = {
  shared_account_id : aws_account;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account that the connection alias is shared with.\n"]
  allow_association : boolean_object;
      [@ocaml.doc
        "Indicates whether the specified Amazon Web Services account is allowed to associate the \
         connection alias with a directory.\n"]
}
[@@ocaml.doc
  "Describes the permissions for a connection alias. Connection aliases are used for cross-Region \
   redirection. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/cross-region-redirection.html} \
   Cross-Region Redirection for Amazon WorkSpaces}.\n"]

type nonrec connection_alias_permissions = connection_alias_permission list [@@ocaml.doc ""]

type nonrec connection_state =
  | CONNECTED [@ocaml.doc ""]
  | DISCONNECTED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_unavailable_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
  resource_id : non_empty_string option;
      [@ocaml.doc "The identifier of the resource that is not available.\n"]
}
[@@ocaml.doc "The specified resource is not available.\n"]

type nonrec copy_workspace_image_result = {
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the image.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
  value : tag_value option; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc "Describes a tag.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec workspace_image_description = string [@@ocaml.doc ""]

type nonrec workspace_image_name = string [@@ocaml.doc ""]

type nonrec copy_workspace_image_request = {
  name : workspace_image_name; [@ocaml.doc "The name of the image.\n"]
  description : workspace_image_description option; [@ocaml.doc "A description of the image.\n"]
  source_image_id : workspace_image_id; [@ocaml.doc "The identifier of the source image.\n"]
  source_region : region; [@ocaml.doc "The identifier of the source Region.\n"]
  tags : tag_list option; [@ocaml.doc "The tags for the image.\n"]
}
[@@ocaml.doc ""]

type nonrec create_account_link_invitation_result = {
  account_link : account_link option; [@ocaml.doc "Information about the account link.\n"]
}
[@@ocaml.doc ""]

type nonrec create_account_link_invitation_request = {
  target_account_id : aws_account; [@ocaml.doc "The identifier of the target account.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A string of up to 64 ASCII characters that Amazon WorkSpaces uses to ensure idempotent \
         creation.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_creation_failed_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The resource could not be created.\n"]

type nonrec create_connect_client_add_in_result = {
  add_in_id : amazon_uuid option; [@ocaml.doc "The client add-in identifier.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connect_client_add_in_request = {
  resource_id : directory_id;
      [@ocaml.doc "The directory identifier for which to configure the client add-in.\n"]
  name : add_in_name; [@ocaml.doc "The name of the client add-in.\n"]
  ur_l : add_in_url; [@ocaml.doc "The endpoint URL of the Connect Customer client add-in.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_alias_result = {
  alias_id : connection_alias_id option; [@ocaml.doc "The identifier of the connection alias.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_alias_request = {
  connection_string : connection_string;
      [@ocaml.doc
        "A connection string in the form of a fully qualified domain name (FQDN), such as \
         [www.example.com].\n\n\
        \  After you create a connection string, it is always associated to your Amazon Web \
         Services account. You cannot recreate the same connection string with a different \
         account, even if you delete all instances of it from the original account. The connection \
         string is globally reserved for your account.\n\
        \  \n\
        \   "]
  tags : tag_list option; [@ocaml.doc "The tags to associate with the connection alias.\n"]
}
[@@ocaml.doc ""]

type nonrec create_ip_group_result = {
  group_id : ip_group_id option; [@ocaml.doc "The identifier of the group.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_group_desc = string [@@ocaml.doc ""]

type nonrec ip_group_name = string [@@ocaml.doc ""]

type nonrec create_ip_group_request = {
  group_name : ip_group_name; [@ocaml.doc "The name of the group.\n"]
  group_desc : ip_group_desc option; [@ocaml.doc "The description of the group.\n"]
  user_rules : ip_rule_list option; [@ocaml.doc "The rules to add to the group.\n"]
  tags : tag_list option;
      [@ocaml.doc "The tags. Each WorkSpaces resource can have a maximum of 50 tags.\n"]
}
[@@ocaml.doc ""]

type nonrec workspace_state =
  | PENDING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | IMPAIRED [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | REBOOTING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | REBUILDING [@ocaml.doc ""]
  | RESTORING [@ocaml.doc ""]
  | MAINTENANCE [@ocaml.doc ""]
  | ADMIN_MAINTENANCE [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_name = string [@@ocaml.doc ""]

type nonrec pending_create_standby_workspaces_request = {
  user_name : user_name option;
      [@ocaml.doc
        "Describes the standby WorkSpace that was created.\n\n\
        \ Because this operation is asynchronous, the identifier returned is not immediately \
         available for use with other operations. For example, if you call \
         {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html} \
         DescribeWorkspaces} before the WorkSpace is created, the information returned can be \
         incomplete. \n\
        \ "]
  directory_id : directory_id option;
      [@ocaml.doc "The identifier of the directory for the standby WorkSpace.\n"]
  state : workspace_state option; [@ocaml.doc "The operational state of the standby WorkSpace.\n"]
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the standby WorkSpace.\n"]
}
[@@ocaml.doc "Information about the standby WorkSpace.\n"]

type nonrec pending_create_standby_workspaces_request_list =
  pending_create_standby_workspaces_request list
[@@ocaml.doc ""]

type nonrec data_replication = NO_REPLICATION [@ocaml.doc ""] | PRIMARY_AS_SOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec volume_encryption_key = string [@@ocaml.doc ""]

type nonrec standby_workspace = {
  primary_workspace_id : workspace_id; [@ocaml.doc "The identifier of the standby WorkSpace.\n"]
  volume_encryption_key : volume_encryption_key option;
      [@ocaml.doc "The volume encryption key of the standby WorkSpace.\n"]
  directory_id : directory_id;
      [@ocaml.doc "The identifier of the directory for the standby WorkSpace.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the standby WorkSpace.\n"]
  data_replication : data_replication option;
      [@ocaml.doc
        "Indicates whether data replication is enabled, and if enabled, the type of data \
         replication.\n"]
}
[@@ocaml.doc "Describes a standby WorkSpace.\n"]

type nonrec failed_create_standby_workspaces_request = {
  standby_workspace_request : standby_workspace option;
      [@ocaml.doc "Information about the standby WorkSpace that could not be created.\n"]
  error_code : workspace_error_code option;
      [@ocaml.doc
        "The error code that is returned if the standby WorkSpace could not be created.\n"]
  error_message : description option;
      [@ocaml.doc
        "The text of the error message that is returned if the standby WorkSpace could not be \
         created.\n"]
}
[@@ocaml.doc "Describes the standby WorkSpace that could not be created.\n"]

type nonrec failed_create_standby_workspaces_request_list =
  failed_create_standby_workspaces_request list
[@@ocaml.doc ""]

type nonrec create_standby_workspaces_result = {
  failed_standby_requests : failed_create_standby_workspaces_request_list option;
      [@ocaml.doc "Information about the standby WorkSpace that could not be created. \n"]
  pending_standby_requests : pending_create_standby_workspaces_request_list option;
      [@ocaml.doc "Information about the standby WorkSpace that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec standby_workspaces_list = standby_workspace list [@@ocaml.doc ""]

type nonrec create_standby_workspaces_request = {
  primary_region : region; [@ocaml.doc "The Region of the primary WorkSpace.\n"]
  standby_workspaces : standby_workspaces_list;
      [@ocaml.doc "Information about the standby WorkSpace to be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_tags_result = unit [@@ocaml.doc ""]

type nonrec create_tags_request = {
  resource_id : non_empty_string;
      [@ocaml.doc
        "The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, \
         registered directories, images, custom bundles, IP access control groups, and connection \
         aliases.\n"]
  tags : tag_list; [@ocaml.doc "The tags. Each WorkSpaces resource can have a maximum of 50 tags.\n"]
}
[@@ocaml.doc ""]

type nonrec create_updated_workspace_image_result = {
  image_id : workspace_image_id option;
      [@ocaml.doc "The identifier of the new updated WorkSpace image.\n"]
}
[@@ocaml.doc ""]

type nonrec create_updated_workspace_image_request = {
  name : workspace_image_name; [@ocaml.doc "The name of the new updated WorkSpace image.\n"]
  description : workspace_image_description;
      [@ocaml.doc "A description of whether updates for the WorkSpace image are available.\n"]
  source_image_id : workspace_image_id;
      [@ocaml.doc "The identifier of the source WorkSpace image.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags that you want to add to the new updated WorkSpace image.\n\n\
        \  To add tags at the same time when you're creating the updated image, you must create an \
         IAM policy that grants your IAM user permissions to use [workspaces:CreateTags]. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_workspace_bundle_result = {
  workspace_bundle : workspace_bundle option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec workspace_bundle_description = string [@@ocaml.doc ""]

type nonrec workspace_bundle_name = string [@@ocaml.doc ""]

type nonrec create_workspace_bundle_request = {
  bundle_name : workspace_bundle_name; [@ocaml.doc "The name of the bundle.\n"]
  bundle_description : workspace_bundle_description; [@ocaml.doc "The description of the bundle.\n"]
  image_id : workspace_image_id;
      [@ocaml.doc "The identifier of the image that is used to create the bundle.\n"]
  compute_type : compute_type; [@ocaml.doc ""]
  user_storage : user_storage; [@ocaml.doc ""]
  root_storage : root_storage option; [@ocaml.doc ""]
  tags : tag_list option;
      [@ocaml.doc
        "The tags associated with the bundle.\n\n\
        \  To add tags at the same time when you're creating the bundle, you must create an IAM \
         policy that grants your IAM user permissions to use [workspaces:CreateTags]. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec workspace_image_required_tenancy = DEFAULT [@ocaml.doc ""] | DEDICATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workspace_image_state =
  | AVAILABLE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operating_system_type = WINDOWS [@ocaml.doc ""] | LINUX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operating_system = {
  type_ : operating_system_type option; [@ocaml.doc "The operating system.\n"]
}
[@@ocaml.doc "The operating system that the image is running.\n"]

type nonrec create_workspace_image_result = {
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the new WorkSpace image.\n"]
  name : workspace_image_name option; [@ocaml.doc "The name of the image.\n"]
  description : workspace_image_description option; [@ocaml.doc "The description of the image.\n"]
  operating_system : operating_system option;
      [@ocaml.doc "The operating system that the image is running.\n"]
  state : workspace_image_state option; [@ocaml.doc "The availability status of the image.\n"]
  required_tenancy : workspace_image_required_tenancy option;
      [@ocaml.doc
        "Specifies whether the image is running on dedicated hardware. When Bring Your Own License \
         (BYOL) is enabled, this value is set to DEDICATED. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.htm} \
         Bring Your Own Windows Desktop Images.}.\n"]
  created : timestamp option; [@ocaml.doc "The date when the image was created.\n"]
  owner_account_id : aws_account option;
      [@ocaml.doc "The identifier of the Amazon Web Services account that owns the image.\n"]
}
[@@ocaml.doc ""]

type nonrec create_workspace_image_request = {
  name : workspace_image_name; [@ocaml.doc "The name of the new WorkSpace image.\n"]
  description : workspace_image_description;
      [@ocaml.doc "The description of the new WorkSpace image.\n"]
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the source WorkSpace\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags that you want to add to the new WorkSpace image. To add tags when you're \
         creating the image, you must create an IAM policy that grants your IAM user permission to \
         use [workspaces:CreateTags].\n"]
}
[@@ocaml.doc ""]

type nonrec standby_workspaces_properties = {
  standby_workspace_id : workspace_id option;
      [@ocaml.doc "The identifier of the standby WorkSpace\n"]
  data_replication : data_replication option;
      [@ocaml.doc
        "Indicates whether data replication is enabled, and if enabled, the type of data \
         replication.\n"]
  recovery_snapshot_time : timestamp option;
      [@ocaml.doc
        "The date and time at which the last successful snapshot was taken of the primary \
         WorkSpace used for replicating data.\n"]
}
[@@ocaml.doc "Describes the properties of the related standby WorkSpaces. \n"]

type nonrec standby_workspaces_properties_list = standby_workspaces_properties list [@@ocaml.doc ""]

type nonrec data_replication_settings = {
  data_replication : data_replication option;
      [@ocaml.doc
        "Indicates whether data replication is enabled, and if enabled, the type of data \
         replication.\n"]
  recovery_snapshot_time : timestamp option;
      [@ocaml.doc
        "The date and time at which the last successful snapshot was taken of the primary \
         WorkSpace used for replicating data.\n"]
}
[@@ocaml.doc "Describes the data replication settings.\n"]

type nonrec standby_workspace_relationship_type =
  | PRIMARY [@ocaml.doc ""]
  | STANDBY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec related_workspace_properties = {
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the related WorkSpace.\n"]
  region : region option; [@ocaml.doc "The Region of the related WorkSpace.\n"]
  state : workspace_state option; [@ocaml.doc "Indicates the state of the WorkSpace.\n"]
  type_ : standby_workspace_relationship_type option;
      [@ocaml.doc "Indicates the type of WorkSpace.\n"]
}
[@@ocaml.doc
  "Describes the related WorkSpace. The related WorkSpace could be a standby WorkSpace or primary \
   WorkSpace related to the specified WorkSpace.\n"]

type nonrec related_workspaces = related_workspace_properties list [@@ocaml.doc ""]

type nonrec modification_state_enum =
  | UPDATE_INITIATED [@ocaml.doc ""]
  | UPDATE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec modification_resource_enum =
  | ROOT_VOLUME [@ocaml.doc ""]
  | USER_VOLUME [@ocaml.doc ""]
  | COMPUTE_TYPE [@ocaml.doc ""]
  | PROTOCOL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec modification_state = {
  resource : modification_resource_enum option; [@ocaml.doc "The resource.\n"]
  state : modification_state_enum option; [@ocaml.doc "The modification state.\n"]
}
[@@ocaml.doc "Describes a WorkSpace modification.\n"]

type nonrec modification_state_list = modification_state list [@@ocaml.doc ""]

type nonrec global_accelerator_for_work_space = {
  mode : aga_mode_for_work_space_enum;
      [@ocaml.doc
        "Indicates if Global Accelerator for WorkSpaces is enabled, disabled, or the same mode as \
         the associated directory.\n"]
  preferred_protocol : aga_preferred_protocol_for_work_space option;
      [@ocaml.doc "Indicates the preferred protocol for Global Accelerator.\n"]
}
[@@ocaml.doc "Describes the Global Accelerator for WorkSpaces.\n"]

type nonrec operating_system_name =
  | AMAZON_LINUX_2 [@ocaml.doc ""]
  | UBUNTU_18_04 [@ocaml.doc ""]
  | UBUNTU_20_04 [@ocaml.doc ""]
  | UBUNTU_22_04 [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | WINDOWS_10 [@ocaml.doc ""]
  | WINDOWS_11 [@ocaml.doc ""]
  | WINDOWS_7 [@ocaml.doc ""]
  | WINDOWS_SERVER_2016 [@ocaml.doc ""]
  | WINDOWS_SERVER_2019 [@ocaml.doc ""]
  | WINDOWS_SERVER_2022 [@ocaml.doc ""]
  | WINDOWS_SERVER_2025 [@ocaml.doc ""]
  | RHEL_8 [@ocaml.doc ""]
  | ROCKY_8 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec protocol = PCOIP [@ocaml.doc ""] | WSP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec protocol_list = protocol list [@@ocaml.doc ""]

type nonrec user_volume_size_gib = int [@@ocaml.doc ""]

type nonrec root_volume_size_gib = int [@@ocaml.doc ""]

type nonrec running_mode_auto_stop_timeout_in_minutes = int [@@ocaml.doc ""]

type nonrec running_mode =
  | AUTO_STOP [@ocaml.doc ""]
  | ALWAYS_ON [@ocaml.doc ""]
  | MANUAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workspace_properties = {
  running_mode : running_mode option;
      [@ocaml.doc
        "The running mode. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/running-mode.html}Manage the \
         WorkSpace Running Mode}.\n\n\
        \  The [MANUAL] value is only supported by Amazon WorkSpaces Core. Contact your account \
         team to be allow-listed to use this value. For more information, see \
         {{:http://aws.amazon.com/workspaces/core/}Amazon WorkSpaces Core}.\n\
        \  \n\
        \    Review your running mode to ensure you are using one that is optimal for your needs \
         and budget. For more information on switching running modes, see \
         {{:http://aws.amazon.com/workspaces-family/workspaces/faqs/#:~:text=Can%20I%20switch%20between%20hourly%20and%20monthly%20billing%20on%20WorkSpaces%20Personal%3F} \
         Can I switch between hourly and monthly billing?} \n\
        \    "]
  running_mode_auto_stop_timeout_in_minutes : running_mode_auto_stop_timeout_in_minutes option;
      [@ocaml.doc
        "The time after a user logs off when WorkSpaces are automatically stopped. Configured in \
         60-minute intervals.\n"]
  root_volume_size_gib : root_volume_size_gib option;
      [@ocaml.doc
        "The size of the root volume. For important information about how to modify the size of \
         the root and user volumes, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html}Modify \
         a WorkSpace}.\n"]
  user_volume_size_gib : user_volume_size_gib option;
      [@ocaml.doc
        "The size of the user storage. For important information about how to modify the size of \
         the root and user volumes, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/modify-workspaces.html}Modify \
         a WorkSpace}.\n"]
  compute_type_name : compute option;
      [@ocaml.doc
        "The compute type. For more information, see \
         {{:http://aws.amazon.com/workspaces/details/#Amazon_WorkSpaces_Bundles}Amazon WorkSpaces \
         Bundles}.\n"]
  protocols : protocol_list option;
      [@ocaml.doc
        "The protocol. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-protocols.html} \
         Protocols for Amazon WorkSpaces}.\n\n\
        \  {ul\n\
        \        {-  Only available for WorkSpaces created with PCoIP bundles.\n\
        \            \n\
        \             }\n\
        \        {-  The [Protocols] property is case sensitive. Ensure you use [PCOIP] or [DCV] \
         (formerly WSP).\n\
        \            \n\
        \             }\n\
        \        {-  Unavailable for Windows 7 WorkSpaces and WorkSpaces using GPU-based bundles \
         (Graphics, GraphicsPro, Graphics.g4dn, GraphicsPro.g4dn, and Graphics.g6).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  operating_system_name : operating_system_name option;
      [@ocaml.doc "The name of the operating system.\n"]
  global_accelerator : global_accelerator_for_work_space option;
      [@ocaml.doc "Indicates the Global Accelerator properties.\n"]
}
[@@ocaml.doc "Describes a WorkSpace.\n"]

type nonrec workspace_name = string [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec ipv6_address = string [@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec workspace = {
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  directory_id : directory_id option;
      [@ocaml.doc "The identifier of the Directory Service directory for the WorkSpace.\n"]
  user_name : user_name option; [@ocaml.doc "The user for the WorkSpace.\n"]
  ip_address : ip_address option; [@ocaml.doc "The IP address of the WorkSpace.\n"]
  ipv6_address : ipv6_address option; [@ocaml.doc "The IPv6 address of the WorkSpace.\n"]
  state : workspace_state option;
      [@ocaml.doc
        "The operational state of the WorkSpace.\n\n\
        \ {ul\n\
        \       {-   [PENDING] \226\128\147 The WorkSpace is in a waiting state (for example, the \
         WorkSpace is being created).\n\
        \           \n\
        \            }\n\
        \       {-   [AVAILABLE] \226\128\147 The WorkSpace is running and has passed the health \
         checks.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPAIRED] \226\128\147 Refer to [UNHEALTHY] state.\n\
        \           \n\
        \            }\n\
        \       {-   [UNHEALTHY] \226\128\147 The WorkSpace is not responding to health checks.\n\
        \           \n\
        \            }\n\
        \       {-   [REBOOTING] \226\128\147 The WorkSpace is being rebooted (restarted).\n\
        \           \n\
        \            }\n\
        \       {-   [STARTING] \226\128\147 The WorkSpace is starting up and health checks are \
         being run.\n\
        \           \n\
        \            }\n\
        \       {-   [REBUILDING] \226\128\147 The WorkSpace is being rebuilt.\n\
        \           \n\
        \            }\n\
        \       {-   [RESTORING] \226\128\147 The WorkSpace is being restored.\n\
        \           \n\
        \            }\n\
        \       {-   [MAINTENANCE] \226\128\147 The WorkSpace is undergoing scheduled maintenance \
         by Amazon Web Services.\n\
        \           \n\
        \            }\n\
        \       {-   [ADMIN_MAINTENANCE] \226\128\147 The WorkSpace is undergoing maintenance by \
         the WorkSpaces administrator.\n\
        \           \n\
        \            }\n\
        \       {-   [TERMINATING] \226\128\147 The WorkSpace is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [TERMINATED] \226\128\147 The WorkSpace has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [SUSPENDED] \226\128\147 The WorkSpace has been suspended for image creation.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] \226\128\147 The WorkSpace is undergoing an update.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPING] \226\128\147 The WorkSpace is being stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [STOPPED] \226\128\147 The WorkSpace has been stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [ERROR ] \226\128\147 The WorkSpace is an error state (for example, an error \
         occurred during startup).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    After a WorkSpace is terminated, the [TERMINATED] state is returned only briefly \
         before the WorkSpace directory metadata is cleaned up, so this state is rarely returned. \
         To confirm that a WorkSpace is terminated, check for the WorkSpace ID by using \
         {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaces.html} \
         DescribeWorkSpaces}. If the WorkSpace ID isn't returned, then the WorkSpace has been \
         successfully terminated.\n\
        \    \n\
        \     "]
  bundle_id : bundle_id option;
      [@ocaml.doc "The identifier of the bundle used to create the WorkSpace.\n"]
  subnet_id : subnet_id option; [@ocaml.doc "The identifier of the subnet for the WorkSpace.\n"]
  error_message : description option;
      [@ocaml.doc
        "The text of the error message that is returned if the WorkSpace cannot be created.\n"]
  error_code : workspace_error_code option;
      [@ocaml.doc "The error code that is returned if the WorkSpace cannot be created.\n"]
  computer_name : computer_name option;
      [@ocaml.doc
        "The name of the WorkSpace, as seen by the operating system. The format of this name \
         varies. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/launch-workspaces-tutorials.html} \
         Launch a WorkSpace}. \n"]
  volume_encryption_key : volume_encryption_key option;
      [@ocaml.doc
        "The ARN of the symmetric KMS key used to encrypt data stored on your WorkSpace. Amazon \
         WorkSpaces does not support asymmetric KMS keys.\n"]
  user_volume_encryption_enabled : boolean_object option;
      [@ocaml.doc "Indicates whether the data stored on the user volume is encrypted.\n"]
  root_volume_encryption_enabled : boolean_object option;
      [@ocaml.doc "Indicates whether the data stored on the root volume is encrypted.\n"]
  workspace_name : workspace_name option; [@ocaml.doc "The name of the user-decoupled WorkSpace.\n"]
  workspace_properties : workspace_properties option;
      [@ocaml.doc "The properties of the WorkSpace.\n"]
  modification_states : modification_state_list option;
      [@ocaml.doc "The modification states of the WorkSpace.\n"]
  related_workspaces : related_workspaces option;
      [@ocaml.doc
        "The standby WorkSpace or primary WorkSpace related to the specified WorkSpace.\n"]
  data_replication_settings : data_replication_settings option;
      [@ocaml.doc "Indicates the settings of the data replication.\n"]
  standby_workspaces_properties : standby_workspaces_properties_list option;
      [@ocaml.doc "The properties of the standby WorkSpace\n"]
}
[@@ocaml.doc "Describes a WorkSpace.\n"]

type nonrec workspace_list = workspace list [@@ocaml.doc ""]

type nonrec error_type = string [@@ocaml.doc ""]

type nonrec workspace_request = {
  directory_id : directory_id;
      [@ocaml.doc
        "The identifier of the Directory Service directory for the WorkSpace. You can use \
         [DescribeWorkspaceDirectories] to list the available directories.\n"]
  user_name : user_name;
      [@ocaml.doc
        "The user name of the user for the WorkSpace. This user name must exist in the Directory \
         Service directory for the WorkSpace.\n\n\
        \ The username is not case-sensitive, but we recommend matching the case in the Directory \
         Service directory to avoid potential incompatibilities.\n\
        \ \n\
        \  The reserved keyword, [\\[UNDEFINED\\]], is used when creating user-decoupled WorkSpaces.\n\
        \  "]
  bundle_id : bundle_id;
      [@ocaml.doc
        "The identifier of the bundle for the WorkSpace. You can use [DescribeWorkspaceBundles] to \
         list the available bundles.\n"]
  volume_encryption_key : volume_encryption_key option;
      [@ocaml.doc
        "The ARN of the symmetric KMS key used to encrypt data stored on your WorkSpace. Amazon \
         WorkSpaces does not support asymmetric KMS keys.\n"]
  user_volume_encryption_enabled : boolean_object option;
      [@ocaml.doc "Indicates whether the data stored on the user volume is encrypted.\n"]
  root_volume_encryption_enabled : boolean_object option;
      [@ocaml.doc "Indicates whether the data stored on the root volume is encrypted.\n"]
  workspace_properties : workspace_properties option; [@ocaml.doc "The WorkSpace properties.\n"]
  tags : tag_list option; [@ocaml.doc "The tags for the WorkSpace.\n"]
  workspace_name : workspace_name option;
      [@ocaml.doc
        "The name of the user-decoupled WorkSpace.\n\n\
        \   [WorkspaceName] is required if [UserName] is [\\[UNDEFINED\\]] for user-decoupled \
         WorkSpaces. [WorkspaceName] is not applicable if [UserName] is specified for \
         user-assigned WorkSpaces.\n\
        \  \n\
        \   "]
  ipv6_address : ipv6_address option; [@ocaml.doc "The IPv6 address for the WorkSpace.\n"]
}
[@@ocaml.doc "Describes the information used to create a WorkSpace.\n"]

type nonrec failed_create_workspace_request = {
  workspace_request : workspace_request option; [@ocaml.doc "Information about the WorkSpace.\n"]
  error_code : error_type option;
      [@ocaml.doc "The error code that is returned if the WorkSpace cannot be created.\n"]
  error_message : description option;
      [@ocaml.doc
        "The text of the error message that is returned if the WorkSpace cannot be created.\n"]
}
[@@ocaml.doc "Describes a WorkSpace that cannot be created.\n"]

type nonrec failed_create_workspace_requests = failed_create_workspace_request list [@@ocaml.doc ""]

type nonrec create_workspaces_result = {
  failed_requests : failed_create_workspace_requests option;
      [@ocaml.doc "Information about the WorkSpaces that could not be created.\n"]
  pending_requests : workspace_list option;
      [@ocaml.doc
        "Information about the WorkSpaces that were created.\n\n\
        \ Because this operation is asynchronous, the identifier returned is not immediately \
         available for use with other operations. For example, if you call [DescribeWorkspaces] \
         before the WorkSpace is created, the information returned can be incomplete.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec workspace_request_list = workspace_request list [@@ocaml.doc ""]

type nonrec create_workspaces_request = {
  workspaces : workspace_request_list;
      [@ocaml.doc "The WorkSpaces to create. You can specify up to 25 WorkSpaces.\n"]
}
[@@ocaml.doc ""]

type nonrec pools_running_mode = AUTO_STOP [@ocaml.doc ""] | ALWAYS_ON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec max_user_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec idle_disconnect_timeout_in_seconds = int [@@ocaml.doc ""]

type nonrec disconnect_timeout_in_seconds = int [@@ocaml.doc ""]

type nonrec timeout_settings = {
  disconnect_timeout_in_seconds : disconnect_timeout_in_seconds option;
      [@ocaml.doc
        "Specifies the amount of time, in seconds, that a streaming session remains active after \
         users disconnect. If users try to reconnect to the streaming session after a \
         disconnection or network interruption within the time set, they are connected to their \
         previous session. Otherwise, they are connected to a new session with a new streaming \
         instance.\n"]
  idle_disconnect_timeout_in_seconds : idle_disconnect_timeout_in_seconds option;
      [@ocaml.doc "The amount of time in seconds a connection will stay active while idle.\n"]
  max_user_duration_in_seconds : max_user_duration_in_seconds option;
      [@ocaml.doc
        "Specifies the maximum amount of time, in seconds, that a streaming session can remain \
         active. If users are still connected to a streaming instance five minutes before this \
         limit is reached, they are prompted to save any open documents before being disconnected. \
         After this time elapses, the instance is terminated and replaced by a new instance.\n"]
}
[@@ocaml.doc "Describes the timeout settings for a pool of WorkSpaces.\n"]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec workspaces_pool_error_code =
  | IAM_SERVICE_ROLE_IS_MISSING [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION [@ocaml.doc ""]
  | NETWORK_INTERFACE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | INTERNAL_SERVICE_ERROR [@ocaml.doc ""]
  | MACHINE_ROLE_IS_MISSING [@ocaml.doc ""]
  | STS_DISABLED_IN_REGION [@ocaml.doc ""]
  | SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION [@ocaml.doc ""]
  | SUBNET_NOT_FOUND [@ocaml.doc ""]
  | IMAGE_NOT_FOUND [@ocaml.doc ""]
  | INVALID_SUBNET_CONFIGURATION [@ocaml.doc ""]
  | SECURITY_GROUPS_NOT_FOUND [@ocaml.doc ""]
  | IGW_NOT_ATTACHED [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION [@ocaml.doc ""]
  | WORKSPACES_POOL_STOPPED [@ocaml.doc ""]
  | WORKSPACES_POOL_INSTANCE_PROVISIONING_FAILURE [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_FILE_NOT_FOUND [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_ACCESS_DENIED [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_LOGON_FAILURE [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_INVALID_PARAMETER [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_MORE_DATA [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_NOT_SUPPORTED [@ocaml.doc ""]
  | DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME [@ocaml.doc ""]
  | DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED [@ocaml.doc ""]
  | DOMAIN_JOIN_NERR_PASSWORD_EXPIRED [@ocaml.doc ""]
  | DOMAIN_JOIN_INTERNAL_SERVICE_ERROR [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_SECRET_ACTION_PERMISSION_IS_MISSING [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_SECRET_DECRYPTION_FAILURE [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_SECRET_STATE_INVALID [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_SECRET_NOT_FOUND [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_SECRET_VALUE_KEY_NOT_FOUND [@ocaml.doc ""]
  | DOMAIN_JOIN_ERROR_SECRET_INVALID [@ocaml.doc ""]
  | BUNDLE_NOT_FOUND [@ocaml.doc ""]
  | DIRECTORY_NOT_FOUND [@ocaml.doc ""]
  | INSUFFICIENT_PERMISSIONS_ERROR [@ocaml.doc ""]
  | DEFAULT_OU_IS_MISSING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workspaces_pool_error = {
  error_code : workspaces_pool_error_code option; [@ocaml.doc "The error code.\n"]
  error_message : error_message option; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "Describes a pool error.\n"]

type nonrec workspaces_pool_errors = workspaces_pool_error list [@@ocaml.doc ""]

type nonrec workspaces_pool_state =
  | CREATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_description = string [@@ocaml.doc ""]

type nonrec workspaces_pool_name = string [@@ocaml.doc ""]

type nonrec workspaces_pool_id = string [@@ocaml.doc ""]

type nonrec workspaces_pool = {
  pool_id : workspaces_pool_id; [@ocaml.doc "The identifier of a pool.\n"]
  pool_arn : ar_n; [@ocaml.doc "The Amazon Resource Name (ARN) for the pool.\n"]
  capacity_status : capacity_status; [@ocaml.doc "The capacity status for the pool\n"]
  pool_name : workspaces_pool_name; [@ocaml.doc "The name of the pool.\n"]
  description : update_description option; [@ocaml.doc "The description of the pool.\n"]
  state : workspaces_pool_state; [@ocaml.doc "The current state of the pool.\n"]
  created_at : timestamp; [@ocaml.doc "The time the pool was created.\n"]
  bundle_id : bundle_id; [@ocaml.doc "The identifier of the bundle used by the pool.\n"]
  directory_id : directory_id; [@ocaml.doc "The identifier of the directory used by the pool.\n"]
  errors : workspaces_pool_errors option; [@ocaml.doc "The pool errors.\n"]
  application_settings : application_settings_response option;
      [@ocaml.doc "The persistent application settings for users of the pool.\n"]
  timeout_settings : timeout_settings option;
      [@ocaml.doc
        "The amount of time that a pool session remains active after users disconnect. If they try \
         to reconnect to the pool session after a disconnection or network interruption within \
         this time interval, they are connected to their previous session. Otherwise, they are \
         connected to a new session with a new pool instance.\n"]
  running_mode : pools_running_mode; [@ocaml.doc "The running mode of the pool.\n"]
}
[@@ocaml.doc "Describes a pool of WorkSpaces.\n"]

type nonrec create_workspaces_pool_result = {
  workspaces_pool : workspaces_pool option; [@ocaml.doc "Indicates the pool to create.\n"]
}
[@@ocaml.doc ""]

type nonrec create_workspaces_pool_request = {
  pool_name : workspaces_pool_name; [@ocaml.doc "The name of the pool.\n"]
  description : update_description; [@ocaml.doc "The pool description.\n"]
  bundle_id : bundle_id; [@ocaml.doc "The identifier of the bundle for the pool.\n"]
  directory_id : directory_id; [@ocaml.doc "The identifier of the directory for the pool.\n"]
  capacity : capacity; [@ocaml.doc "The user capacity of the pool.\n"]
  tags : tag_list option; [@ocaml.doc "The tags for the pool.\n"]
  application_settings : application_settings_request option;
      [@ocaml.doc "Indicates the application settings of the pool.\n"]
  timeout_settings : timeout_settings option;
      [@ocaml.doc "Indicates the timeout settings of the pool.\n"]
  running_mode : pools_running_mode option; [@ocaml.doc "The running mode for the pool.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_image_protocol =
  | PCOIP [@ocaml.doc ""]
  | DCV [@ocaml.doc ""]
  | BYOP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_error_message = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec custom_workspace_image_import_error_details = {
  error_code : error_code option;
      [@ocaml.doc "The error code that is returned for the image import.\n"]
  error_message : image_error_message option;
      [@ocaml.doc "The text of the error message that is returned for the image import.\n"]
}
[@@ocaml.doc
  "Describes in-depth details about the error. These details include the possible causes of the \
   error and troubleshooting information.\n"]

type nonrec custom_workspace_image_import_error_details_list =
  custom_workspace_image_import_error_details list
[@@ocaml.doc ""]

type nonrec custom_workspace_image_import_state =
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PROCESSING_SOURCE_IMAGE [@ocaml.doc ""]
  | IMAGE_TESTING_START [@ocaml.doc ""]
  | UPDATING_OPERATING_SYSTEM [@ocaml.doc ""]
  | IMAGE_COMPATIBILITY_CHECKING [@ocaml.doc ""]
  | IMAGE_TESTING_GENERALIZATION [@ocaml.doc ""]
  | CREATING_TEST_INSTANCE [@ocaml.doc ""]
  | INSTALLING_COMPONENTS [@ocaml.doc ""]
  | GENERALIZING [@ocaml.doc ""]
  | VALIDATING [@ocaml.doc ""]
  | PUBLISHING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dedicated_tenancy_account_type =
  | SOURCE_ACCOUNT [@ocaml.doc ""]
  | TARGET_ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dedicated_tenancy_cidr_range_list = dedicated_tenancy_management_cidr_range list
[@@ocaml.doc ""]

type nonrec dedicated_tenancy_support_enum = ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec login_message = (client_locale * client_login_message) list [@@ocaml.doc ""]

type nonrec default_client_branding_attributes = {
  logo_url : client_url option;
      [@ocaml.doc
        "The logo. The only image format accepted is a binary data object that is converted from a \
         [.png] file.\n"]
  support_email : client_email option;
      [@ocaml.doc
        "The support email. The company's customer support email address.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive. You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default email is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  support_link : client_url option;
      [@ocaml.doc
        "The support link. The link for the company's customer support page for their WorkSpace.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive.You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default support link is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  forgot_password_link : client_url option;
      [@ocaml.doc
        "The forgotten password link. This is the web address that users can go to if they forget \
         the password for their WorkSpace.\n"]
  login_message : login_message option;
      [@ocaml.doc
        "The login message. Specified as a key value pair, in which the key is a locale and the \
         value is the localized message for that locale. The only key supported is [en_US]. The \
         HTML tags supported include the following: [a, b, blockquote, br, cite, code, dd, dl, dt, \
         div, em, \n\
        \            i, li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul].\n"]
}
[@@ocaml.doc
  "Returns default client branding attributes that were imported. These attributes display on the \
   client login screen.\n\n\
  \  Client branding attributes are public facing. Ensure that you don't include sensitive \
   information.\n\
  \  \n\
  \   "]

type nonrec default_logo = bytes [@@ocaml.doc ""]

type nonrec default_import_client_branding_attributes = {
  logo : default_logo option;
      [@ocaml.doc
        "The logo. The only image format accepted is a binary data object that is converted from a \
         [.png] file.\n"]
  support_email : client_email option;
      [@ocaml.doc
        "The support email. The company's customer support email address.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive. You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default email is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  support_link : client_url option;
      [@ocaml.doc
        "The support link. The link for the company's customer support page for their WorkSpace.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive. You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default support link is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  forgot_password_link : client_url option;
      [@ocaml.doc
        "The forgotten password link. This is the web address that users can go to if they forget \
         the password for their WorkSpace.\n"]
  login_message : login_message option;
      [@ocaml.doc
        "The login message. Specified as a key value pair, in which the key is a locale and the \
         value is the localized message for that locale. The only key supported is [en_US]. The \
         HTML tags supported include the following: [a, b, blockquote, br, cite, code, dd, dl, dt, \
         div, em, \n\
        \            i, li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul].\n"]
}
[@@ocaml.doc
  "The default client branding attributes to be imported. These attributes display on the client \
   login screen.\n\n\
  \  Client branding attributes are public facing. Ensure that you do not include sensitive \
   information.\n\
  \  \n\
  \   "]

type nonrec default_ou = string [@@ocaml.doc ""]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec default_workspace_creation_properties = {
  enable_internet_access : boolean_object option;
      [@ocaml.doc
        "Specifies whether to automatically assign an Elastic public IP address to WorkSpaces in \
         this directory by default. If enabled, the Elastic public IP address allows outbound \
         internet access from your WorkSpaces when you\226\128\153re using an internet gateway in \
         the Amazon VPC in which your WorkSpaces are located. If you're using a Network Address \
         Translation (NAT) gateway for outbound internet access from your VPC, or if your \
         WorkSpaces are in public subnets and you manually assign them Elastic IP addresses, you \
         should disable this setting. This setting applies to new WorkSpaces that you launch or to \
         existing WorkSpaces that you rebuild. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-vpc.html} \
         Configure a VPC for Amazon WorkSpaces}.\n"]
  default_ou : default_ou option;
      [@ocaml.doc
        "The organizational unit (OU) in the directory for the WorkSpace machine accounts.\n"]
  custom_security_group_id : security_group_id option;
      [@ocaml.doc
        "The identifier of the default security group to apply to WorkSpaces when they are \
         created. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-security-groups.html} \
         Security Groups for Your WorkSpaces}.\n"]
  user_enabled_as_local_administrator : boolean_object option;
      [@ocaml.doc
        "Specifies whether WorkSpace users are local administrators on their WorkSpaces.\n"]
  enable_maintenance_mode : boolean_object option;
      [@ocaml.doc
        "Specifies whether maintenance mode is enabled for WorkSpaces. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/workspace-maintenance.html}WorkSpace \
         Maintenance}.\n"]
  instance_iam_role_arn : ar_n option; [@ocaml.doc "Indicates the IAM role ARN of the instance.\n"]
}
[@@ocaml.doc
  "Describes the default values that are used to create WorkSpaces. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html}Update \
   Directory Details for Your WorkSpaces}.\n"]

type nonrec deletable_certificate_based_auth_property =
  | CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deletable_certificate_based_auth_properties_list =
  deletable_certificate_based_auth_property list
[@@ocaml.doc ""]

type nonrec deletable_saml_property =
  | SAML_PROPERTIES_USER_ACCESS_URL [@ocaml.doc ""]
  | SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deletable_saml_properties_list = deletable_saml_property list [@@ocaml.doc ""]

type nonrec delete_account_link_invitation_result = {
  account_link : account_link option; [@ocaml.doc "Information about the account link.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_account_link_invitation_request = {
  link_id : link_id; [@ocaml.doc "The identifier of the account link.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A string of up to 64 ASCII characters that Amazon WorkSpaces uses to ensure idempotent \
         creation.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_client_branding_result = unit [@@ocaml.doc ""]

type nonrec delete_client_branding_request = {
  resource_id : directory_id;
      [@ocaml.doc
        "The directory identifier of the WorkSpace for which you want to delete client branding.\n"]
  platforms : client_device_type_list;
      [@ocaml.doc "The device type for which you want to delete client branding.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connect_client_add_in_result = unit [@@ocaml.doc ""]

type nonrec delete_connect_client_add_in_request = {
  add_in_id : amazon_uuid; [@ocaml.doc "The identifier of the client add-in to delete.\n"]
  resource_id : directory_id;
      [@ocaml.doc "The directory identifier for which the client add-in is configured.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_connection_alias_result = unit [@@ocaml.doc ""]

type nonrec delete_connection_alias_request = {
  alias_id : connection_alias_id; [@ocaml.doc "The identifier of the connection alias to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_ip_group_result = unit [@@ocaml.doc ""]

type nonrec delete_ip_group_request = {
  group_id : ip_group_id; [@ocaml.doc "The identifier of the IP access control group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_tags_result = unit [@@ocaml.doc ""]

type nonrec tag_key_list = non_empty_string list [@@ocaml.doc ""]

type nonrec delete_tags_request = {
  resource_id : non_empty_string;
      [@ocaml.doc
        "The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, \
         registered directories, images, custom bundles, IP access control groups, and connection \
         aliases.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The tag keys.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workspace_bundle_result = unit [@@ocaml.doc ""]

type nonrec delete_workspace_bundle_request = {
  bundle_id : bundle_id option; [@ocaml.doc "The identifier of the bundle.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_workspace_image_result = unit [@@ocaml.doc ""]

type nonrec delete_workspace_image_request = {
  image_id : workspace_image_id; [@ocaml.doc "The identifier of the image.\n"]
}
[@@ocaml.doc ""]

type nonrec workspace_resource_association_list = workspace_resource_association list
[@@ocaml.doc ""]

type nonrec work_space_application_deployment = {
  associations : workspace_resource_association_list option;
      [@ocaml.doc "The associations between the applications and the associated resources.\n"]
}
[@@ocaml.doc "Describes the WorkSpace application deployment.\n"]

type nonrec deploy_workspace_applications_result = {
  deployment : work_space_application_deployment option;
      [@ocaml.doc "The list of deployed associations and information about them.\n"]
}
[@@ocaml.doc ""]

type nonrec deploy_workspace_applications_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  force : boolean_object option;
      [@ocaml.doc
        "Indicates whether the force flag is applied for the specified WorkSpace. When the force \
         flag is enabled, it allows previously failed deployments to be retried.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_workspace_directory_result = unit [@@ocaml.doc ""]

type nonrec deregister_workspace_directory_request = {
  directory_id : directory_id;
      [@ocaml.doc
        "The identifier of the directory. If any WorkSpaces are registered to this directory, you \
         must remove them before you deregister the directory, or you will receive an \
         OperationNotSupportedException error.\n"]
}
[@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec describe_account_result = {
  dedicated_tenancy_support : dedicated_tenancy_support_result_enum option;
      [@ocaml.doc "The status of BYOL (whether BYOL is enabled or disabled).\n"]
  dedicated_tenancy_management_cidr_range : dedicated_tenancy_management_cidr_range option;
      [@ocaml.doc
        "The IP address range, specified as an IPv4 CIDR block, used for the management network \
         interface.\n\n\
        \ The management network interface is connected to a secure Amazon WorkSpaces management \
         network. It is used for interactive streaming of the WorkSpace desktop to Amazon \
         WorkSpaces clients, and to allow Amazon WorkSpaces to manage the WorkSpace.\n\
        \ "]
  dedicated_tenancy_account_type : dedicated_tenancy_account_type option;
      [@ocaml.doc "The type of linked account.\n"]
  message : message option; [@ocaml.doc "The text message to describe the status of BYOL.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_request = unit [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec describe_account_modifications_result = {
  account_modifications : account_modification_list option;
      [@ocaml.doc "The list of modifications to the configuration of BYOL.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_modifications_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_associations_result = {
  associations : application_resource_association_list option;
      [@ocaml.doc "List of associations and information about them.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec limit = int [@@ocaml.doc ""]

type nonrec describe_application_associations_request = {
  max_results : limit option; [@ocaml.doc "The maximum number of associations to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
  application_id : work_space_application_id;
      [@ocaml.doc "The identifier of the specified application.\n"]
  associated_resource_types : application_associated_resource_type_list;
      [@ocaml.doc "The resource type of the associated resources.\n"]
}
[@@ocaml.doc ""]

type nonrec operating_system_name_list = operating_system_name list [@@ocaml.doc ""]

type nonrec work_space_application_state =
  | PENDING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | UNINSTALL_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec work_space_application_owner = string [@@ocaml.doc ""]

type nonrec work_space_application_license_type =
  | LICENSED [@ocaml.doc ""]
  | UNLICENSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec work_space_application = {
  application_id : work_space_application_id option;
      [@ocaml.doc "The identifier of the application.\n"]
  created : timestamp option; [@ocaml.doc "The time the application is created.\n"]
  description : string2048 option; [@ocaml.doc "The description of the WorkSpace application.\n"]
  license_type : work_space_application_license_type option;
      [@ocaml.doc "The license availability for the applications.\n"]
  name : non_empty_string option; [@ocaml.doc "The name of the WorkSpace application.\n"]
  owner : work_space_application_owner option;
      [@ocaml.doc "The owner of the WorkSpace application.\n"]
  state : work_space_application_state option; [@ocaml.doc "The status of WorkSpace application.\n"]
  supported_compute_type_names : compute_list option;
      [@ocaml.doc "The supported compute types of the WorkSpace application.\n"]
  supported_operating_system_names : operating_system_name_list option;
      [@ocaml.doc "The supported operating systems of the WorkSpace application.\n"]
}
[@@ocaml.doc "Describes the WorkSpace application.\n"]

type nonrec work_space_application_list = work_space_application list [@@ocaml.doc ""]

type nonrec describe_applications_result = {
  applications : work_space_application_list option;
      [@ocaml.doc "List of information about the specified applications.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec work_space_application_id_list = work_space_application_id list [@@ocaml.doc ""]

type nonrec describe_applications_request = {
  application_ids : work_space_application_id_list option;
      [@ocaml.doc "The identifiers of one or more applications.\n"]
  compute_type_names : compute_list option;
      [@ocaml.doc "The compute types supported by the applications.\n"]
  license_type : work_space_application_license_type option;
      [@ocaml.doc "The license availability for the applications.\n"]
  operating_system_names : operating_system_name_list option;
      [@ocaml.doc "The operating systems supported by the applications.\n"]
  owner : work_space_application_owner option; [@ocaml.doc "The owner of the applications.\n"]
  max_results : limit option; [@ocaml.doc "The maximum number of applications to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_bundle_associations_result = {
  associations : bundle_resource_association_list option;
      [@ocaml.doc "List of information about the specified associations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_bundle_associations_request = {
  bundle_id : bundle_id; [@ocaml.doc "The identifier of the bundle.\n"]
  associated_resource_types : bundle_associated_resource_type_list;
      [@ocaml.doc "The resource types of the associated resource.\n"]
}
[@@ocaml.doc ""]

type nonrec ios_client_branding_attributes = {
  logo_url : client_url option;
      [@ocaml.doc
        "The logo. This is the standard-resolution display that has a 1:1 pixel density (or \
         \\@1x), where one pixel is equal to one point. The only image format accepted is a binary \
         data object that is converted from a [.png] file.\n"]
  logo2x_url : client_url option;
      [@ocaml.doc
        "The \\@2x version of the logo. This is the higher resolution display that offers a scale \
         factor of 2.0 (or \\@2x). The only image format accepted is a binary data object that is \
         converted from a [.png] file.\n\n\
        \   For more information about iOS image size and resolution, see \
         {{:https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/}Image \
         Size and Resolution } in the {i Apple Human Interface Guidelines}.\n\
        \  \n\
        \   "]
  logo3x_url : client_url option;
      [@ocaml.doc
        "The \\@3x version of the logo. This is the higher resolution display that offers a scale \
         factor of 3.0 (or \\@3x).The only image format accepted is a binary data object that is \
         converted from a [.png] file.\n\n\
        \   For more information about iOS image size and resolution, see \
         {{:https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/}Image \
         Size and Resolution } in the {i Apple Human Interface Guidelines}.\n\
        \  \n\
        \   "]
  support_email : client_email option;
      [@ocaml.doc
        "The support email. The company's customer support email address.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive. You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default email is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  support_link : client_url option;
      [@ocaml.doc
        "The support link. The link for the company's customer support page for their WorkSpace.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive. You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default support link is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  forgot_password_link : client_url option;
      [@ocaml.doc
        "The forgotten password link. This is the web address that users can go to if they forget \
         the password for their WorkSpace.\n"]
  login_message : login_message option;
      [@ocaml.doc
        "The login message. Specified as a key value pair, in which the key is a locale and the \
         value is the localized message for that locale. The only key supported is [en_US]. The \
         HTML tags supported include the following: [a, b, blockquote, br, cite, code, dd, dl, dt, \
         div, em, \n\
        \            i, li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul].\n"]
}
[@@ocaml.doc
  "The client branding attributes for iOS device types. These attributes are displayed on the iOS \
   client login screen only.\n\n\
  \  Client branding attributes are public facing. Ensure you do not include sensitive information.\n\
  \  \n\
  \   "]

type nonrec describe_client_branding_result = {
  device_type_windows : default_client_branding_attributes option;
      [@ocaml.doc "The branding information for Windows devices.\n"]
  device_type_osx : default_client_branding_attributes option;
      [@ocaml.doc "The branding information for macOS devices.\n"]
  device_type_android : default_client_branding_attributes option;
      [@ocaml.doc "The branding information for Android devices.\n"]
  device_type_ios : ios_client_branding_attributes option;
      [@ocaml.doc "The branding information for iOS devices.\n"]
  device_type_linux : default_client_branding_attributes option;
      [@ocaml.doc "The branding information for Linux devices.\n"]
  device_type_web : default_client_branding_attributes option;
      [@ocaml.doc "The branding information for Web access.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_client_branding_request = {
  resource_id : directory_id;
      [@ocaml.doc
        "The directory identifier of the WorkSpace for which you want to view client branding \
         information.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_client_properties_result = {
  client_properties_list : client_properties_list option;
      [@ocaml.doc "Information about the specified Amazon WorkSpaces clients.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id_list = non_empty_string list [@@ocaml.doc ""]

type nonrec describe_client_properties_request = {
  resource_ids : resource_id_list;
      [@ocaml.doc "The resource identifier, in the form of directory IDs.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connect_client_add_ins_result = {
  add_ins : connect_client_add_in_list option; [@ocaml.doc "Information about client add-ins.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_connect_client_add_ins_request = {
  resource_id : directory_id;
      [@ocaml.doc "The directory identifier for which the client add-in is configured.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
  max_results : limit option; [@ocaml.doc "The maximum number of items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_alias_permissions_result = {
  alias_id : connection_alias_id option; [@ocaml.doc "The identifier of the connection alias.\n"]
  connection_alias_permissions : connection_alias_permissions option;
      [@ocaml.doc "The permissions associated with a connection alias.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_alias_permissions_request = {
  alias_id : connection_alias_id; [@ocaml.doc "The identifier of the connection alias.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results. \n"]
  max_results : limit option; [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_aliases_result = {
  connection_aliases : connection_alias_list option;
      [@ocaml.doc "Information about the specified connection aliases.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_connection_aliases_request = {
  alias_ids : connection_alias_id_list option;
      [@ocaml.doc "The identifiers of the connection aliases to describe.\n"]
  resource_id : non_empty_string option;
      [@ocaml.doc "The identifier of the directory associated with the connection alias.\n"]
  limit : limit option; [@ocaml.doc "The maximum number of connection aliases to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results. \n"]
}
[@@ocaml.doc ""]

type nonrec ec2_image_id = string [@@ocaml.doc ""]

type nonrec image_build_version_arn = string [@@ocaml.doc ""]

type nonrec ec2_import_task_id = string [@@ocaml.doc ""]

type nonrec image_source_identifier =
  | Ec2ImportTaskId of ec2_import_task_id
      [@ocaml.doc
        "The EC2 import task ID to import the image from the Amazon EC2 VM import process.\n"]
  | ImageBuildVersionArn of image_build_version_arn
      [@ocaml.doc "The ARN of the EC2 Image Builder image.\n"]
  | Ec2ImageId of ec2_image_id [@ocaml.doc "The identifier of the EC2 image.\n"]
[@@ocaml.doc "Describes the image import source.\n"]

type nonrec percentage = int [@@ocaml.doc ""]

type nonrec workflow_state_message = string [@@ocaml.doc ""]

type nonrec infrastructure_configuration_arn = string [@@ocaml.doc ""]

type nonrec describe_custom_workspace_image_import_result = {
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the WorkSpace image.\n"]
  infrastructure_configuration_arn : infrastructure_configuration_arn option;
      [@ocaml.doc
        "The infrastructure configuration ARN that specifies how the WorkSpace image is built.\n"]
  state : custom_workspace_image_import_state option;
      [@ocaml.doc "The state of the WorkSpace image.\n"]
  state_message : workflow_state_message option;
      [@ocaml.doc "The state message of the WorkSpace image import workflow.\n"]
  progress_percentage : percentage option;
      [@ocaml.doc "The estimated progress percentage of the WorkSpace image import workflow.\n"]
  created : timestamp option;
      [@ocaml.doc "The timestamp when the WorkSpace image import was created.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The timestamp when the WorkSpace image import was last updated.\n"]
  image_source : image_source_identifier option; [@ocaml.doc "Describes the image import source.\n"]
  image_builder_instance_id : non_empty_string option;
      [@ocaml.doc "The image builder instance ID of the WorkSpace image.\n"]
  error_details : custom_workspace_image_import_error_details_list option;
      [@ocaml.doc
        "Describes in-depth details about the error. These details include the possible causes of \
         the error and troubleshooting information.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_workspace_image_import_request = {
  image_id : workspace_image_id; [@ocaml.doc "The identifier of the WorkSpace image.\n"]
}
[@@ocaml.doc ""]

type nonrec image_associated_resource_type = APPLICATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec image_resource_association = {
  associated_resource_id : non_empty_string option;
      [@ocaml.doc "The identifier of the associated resource.\n"]
  associated_resource_type : image_associated_resource_type option;
      [@ocaml.doc "The resource type of the associated resources.\n"]
  created : timestamp option; [@ocaml.doc "The time the association is created.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "The time the association status was last updated.\n"]
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the image.\n"]
  state : association_state option; [@ocaml.doc "The status of the image resource association.\n"]
  state_reason : association_state_reason option;
      [@ocaml.doc "The reason the association deployment failed.\n"]
}
[@@ocaml.doc "Describes the association between an application and an image resource.\n"]

type nonrec image_resource_association_list = image_resource_association list [@@ocaml.doc ""]

type nonrec describe_image_associations_result = {
  associations : image_resource_association_list option;
      [@ocaml.doc "List of information about the specified associations.\n"]
}
[@@ocaml.doc ""]

type nonrec image_associated_resource_type_list = image_associated_resource_type list
[@@ocaml.doc ""]

type nonrec describe_image_associations_request = {
  image_id : workspace_image_id; [@ocaml.doc "The identifier of the image.\n"]
  associated_resource_types : image_associated_resource_type_list;
      [@ocaml.doc "The resource types of the associated resource.\n"]
}
[@@ocaml.doc ""]

type nonrec workspaces_ip_group = {
  group_id : ip_group_id option; [@ocaml.doc "The identifier of the group.\n"]
  group_name : ip_group_name option; [@ocaml.doc "The name of the group.\n"]
  group_desc : ip_group_desc option; [@ocaml.doc "The description of the group.\n"]
  user_rules : ip_rule_list option; [@ocaml.doc "The rules.\n"]
}
[@@ocaml.doc "Describes an IP access control group.\n"]

type nonrec workspaces_ip_groups_list = workspaces_ip_group list [@@ocaml.doc ""]

type nonrec describe_ip_groups_result = {
  result_ : workspaces_ip_groups_list option;
      [@ocaml.doc "Information about the IP access control groups.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_ip_groups_request = {
  group_ids : ip_group_id_list option;
      [@ocaml.doc "The identifiers of one or more IP access control groups.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
  max_results : limit option; [@ocaml.doc "The maximum number of items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tags_result = { tag_list : tag_list option [@ocaml.doc "The tags.\n"] }
[@@ocaml.doc ""]

type nonrec describe_tags_request = {
  resource_id : non_empty_string;
      [@ocaml.doc
        "The identifier of the WorkSpaces resource. The supported resource types are WorkSpaces, \
         registered directories, images, custom bundles, IP access control groups, and connection \
         aliases.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspace_associations_result = {
  associations : workspace_resource_association_list option;
      [@ocaml.doc "List of information about the specified associations.\n"]
}
[@@ocaml.doc ""]

type nonrec work_space_associated_resource_type_list = work_space_associated_resource_type list
[@@ocaml.doc ""]

type nonrec describe_workspace_associations_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  associated_resource_types : work_space_associated_resource_type_list;
      [@ocaml.doc "The resource types of the associated resources.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspace_bundles_result = {
  bundles : bundle_list option; [@ocaml.doc "Information about the bundles.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. This token is valid for one day and must be used within that \
         time frame.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspace_bundles_request = {
  bundle_ids : bundle_id_list option;
      [@ocaml.doc
        "The identifiers of the bundles. You cannot combine this parameter with any other filter.\n"]
  owner : bundle_owner option;
      [@ocaml.doc
        "The owner of the bundles. You cannot combine this parameter with any other filter.\n\n\
        \ To describe the bundles provided by Amazon Web Services, specify [AMAZON]. To describe \
         the bundles that belong to your account, don't specify a value.\n\
        \ "]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of results. (You received this token from a previous call.)\n"]
}
[@@ocaml.doc ""]

type nonrec global_accelerator_for_directory = {
  mode : aga_mode_for_directory_enum;
      [@ocaml.doc "Indicates if Global Accelerator for directory is enabled or disabled.\n"]
  preferred_protocol : aga_preferred_protocol_for_directory option;
      [@ocaml.doc "Indicates the preferred protocol for Global Accelerator.\n"]
}
[@@ocaml.doc "Describes the Global Accelerator for directory\n"]

type nonrec storage_connector_status_enum = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec storage_connector_type_enum = HOME_FOLDER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec storage_connector = {
  connector_type : storage_connector_type_enum;
      [@ocaml.doc "The type of connector used to save user files.\n"]
  status : storage_connector_status_enum;
      [@ocaml.doc "Indicates if the storage connetor is enabled or disabled.\n"]
}
[@@ocaml.doc "Describes the storage connector.\n"]

type nonrec storage_connectors = storage_connector list [@@ocaml.doc ""]

type nonrec maximum_length = int [@@ocaml.doc ""]

type nonrec user_setting_permission_enum = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_setting_action_enum =
  | CLIPBOARD_COPY_FROM_LOCAL_DEVICE [@ocaml.doc ""]
  | CLIPBOARD_COPY_TO_LOCAL_DEVICE [@ocaml.doc ""]
  | PRINTING_TO_LOCAL_DEVICE [@ocaml.doc ""]
  | SMART_CARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_setting = {
  action : user_setting_action_enum; [@ocaml.doc "Indicates the type of action.\n"]
  permission : user_setting_permission_enum;
      [@ocaml.doc "Indicates if the setting is enabled or disabled.\n"]
  maximum_length : maximum_length option;
      [@ocaml.doc "Indicates the maximum character length for the specified user setting.\n"]
}
[@@ocaml.doc "Information about the user's permission settings.\n"]

type nonrec user_settings = user_setting list [@@ocaml.doc ""]

type nonrec streaming_experience_preferred_protocol_enum =
  | TCP [@ocaml.doc ""]
  | UDP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec streaming_properties = {
  streaming_experience_preferred_protocol : streaming_experience_preferred_protocol_enum option;
      [@ocaml.doc "Indicates the type of preferred protocol for the streaming experience.\n"]
  user_settings : user_settings option;
      [@ocaml.doc "Indicates the permission settings asscoiated with the user.\n"]
  storage_connectors : storage_connectors option;
      [@ocaml.doc "Indicates the storage connector used \n"]
  global_accelerator : global_accelerator_for_directory option;
      [@ocaml.doc "Indicates the Global Accelerator properties.\n"]
}
[@@ocaml.doc "Describes the streaming properties.\n"]

type nonrec idc_config = {
  instance_arn : ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the identity center instance.\n"]
  application_arn : ar_n option; [@ocaml.doc "The Amazon Resource Name (ARN) of the application.\n"]
}
[@@ocaml.doc "Specifies the configurations of the identity center.\n"]

type nonrec workspace_type = PERSONAL [@ocaml.doc ""] | POOLS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec user_identity_type =
  | CUSTOMER_MANAGED [@ocaml.doc ""]
  | AWS_DIRECTORY_SERVICE [@ocaml.doc ""]
  | AWS_IAM_IDENTITY_CENTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workspace_directory_description = string [@@ocaml.doc ""]

type nonrec workspace_directory_name = string [@@ocaml.doc ""]

type nonrec microsoft_entra_config_tenant_id = string [@@ocaml.doc ""]

type nonrec microsoft_entra_config = {
  tenant_id : microsoft_entra_config_tenant_id option;
      [@ocaml.doc "The identifier of the tenant.\n"]
  application_config_secret_arn : secrets_manager_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the application config.\n"]
}
[@@ocaml.doc "Specifies the configurations of the Microsoft Entra.\n"]

type nonrec endpoint_encryption_mode =
  | STANDARD_TLS [@ocaml.doc ""]
  | FIPS_VALIDATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec saml_user_access_url = string [@@ocaml.doc ""]

type nonrec saml_status_enum =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec saml_properties = {
  status : saml_status_enum option;
      [@ocaml.doc
        "Indicates the status of SAML 2.0 authentication. These statuses include the following.\n\n\
        \ {ul\n\
        \       {-  If the setting is [DISABLED], end users will be directed to login with their \
         directory credentials.\n\
        \           \n\
        \            }\n\
        \       {-  If the setting is [ENABLED], end users will be directed to login via the user \
         access URL. Users attempting to connect to WorkSpaces from a client application that does \
         not support SAML 2.0 authentication will not be able to connect.\n\
        \           \n\
        \            }\n\
        \       {-  If the setting is [ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK], end users will be \
         directed to login via the user access URL on supported client applications, but will not \
         prevent clients that do not support SAML 2.0 authentication from connecting as if SAML \
         2.0 authentication was disabled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  user_access_url : saml_user_access_url option;
      [@ocaml.doc
        "The SAML 2.0 identity provider (IdP) user access URL is the URL a user would navigate to \
         in their web browser in order to federate from the IdP and directly access the \
         application, without any SAML 2.0 service provider (SP) bindings.\n"]
  relay_state_parameter_name : non_empty_string option;
      [@ocaml.doc
        "The relay state parameter name supported by the SAML 2.0 identity provider (IdP). When \
         the end user is redirected to the user access URL from the WorkSpaces client application, \
         this relay state parameter name is appended as a query parameter to the URL along with \
         the relay state endpoint to return the user to the client application session.\n\n\
        \ To use SAML 2.0 authentication with WorkSpaces, the IdP must support IdP-initiated deep \
         linking for the relay state URL. Consult your IdP documentation for more information.\n\
        \ "]
}
[@@ocaml.doc
  "Describes the enablement status, user access URL, and relay state parameter name that are used \
   for configuring federation with an SAML 2.0 identity provider.\n"]

type nonrec selfservice_permissions = {
  restart_workspace : reconnect_enum option;
      [@ocaml.doc "Specifies whether users can restart their WorkSpace.\n"]
  increase_volume_size : reconnect_enum option;
      [@ocaml.doc
        "Specifies whether users can increase the volume size of the drives on their WorkSpace.\n"]
  change_compute_type : reconnect_enum option;
      [@ocaml.doc
        "Specifies whether users can change the compute type (bundle) for their WorkSpace.\n"]
  switch_running_mode : reconnect_enum option;
      [@ocaml.doc "Specifies whether users can switch the running mode of their WorkSpace.\n"]
  rebuild_workspace : reconnect_enum option;
      [@ocaml.doc
        "Specifies whether users can rebuild the operating system of a WorkSpace to its original \
         state.\n"]
}
[@@ocaml.doc
  "Describes the self-service permissions for a directory. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/enable-user-self-service-workspace-management.html}Enable \
   Self-Service WorkSpace Management Capabilities for Your Users}.\n"]

type nonrec tenancy = DEDICATED [@ocaml.doc ""] | SHARED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec workspace_access_properties = {
  device_type_windows : access_property_value option;
      [@ocaml.doc "Indicates whether users can use Windows clients to access their WorkSpaces.\n"]
  device_type_osx : access_property_value option;
      [@ocaml.doc "Indicates whether users can use macOS clients to access their WorkSpaces.\n"]
  device_type_web : access_property_value option;
      [@ocaml.doc "Indicates whether users can access their WorkSpaces through a web browser.\n"]
  device_type_ios : access_property_value option;
      [@ocaml.doc "Indicates whether users can use iOS devices to access their WorkSpaces.\n"]
  device_type_android : access_property_value option;
      [@ocaml.doc
        "Indicates whether users can use Android and Android-compatible Chrome OS devices to \
         access their WorkSpaces.\n"]
  device_type_chrome_os : access_property_value option;
      [@ocaml.doc "Indicates whether users can use Chromebooks to access their WorkSpaces.\n"]
  device_type_zero_client : access_property_value option;
      [@ocaml.doc
        "Indicates whether users can use zero client devices to access their WorkSpaces.\n"]
  device_type_linux : access_property_value option;
      [@ocaml.doc "Indicates whether users can use Linux clients to access their WorkSpaces.\n"]
  device_type_work_spaces_thin_client : access_property_value option;
      [@ocaml.doc
        "Indicates whether users can access their WorkSpaces through a WorkSpaces Thin Client.\n"]
  access_endpoint_config : access_endpoint_config option;
      [@ocaml.doc "Specifies the configuration for accessing the WorkSpace.\n"]
}
[@@ocaml.doc
  "The device types and operating systems that can be used to access a WorkSpace. For more \
   information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/workspaces-network-requirements.html}Amazon \
   WorkSpaces Client Network Requirements}.\n"]

type nonrec workspace_directory_state =
  | REGISTERING [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""]
  | DEREGISTERING [@ocaml.doc ""]
  | DEREGISTERED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workspace_directory_type =
  | SIMPLE_AD [@ocaml.doc ""]
  | AD_CONNECTOR [@ocaml.doc ""]
  | CUSTOMER_MANAGED [@ocaml.doc ""]
  | AWS_IAM_IDENTITY_CENTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dns_ipv6_addresses = ipv6_address list [@@ocaml.doc ""]

type nonrec dns_ip_addresses = ip_address list [@@ocaml.doc ""]

type nonrec subnet_ids = subnet_id list [@@ocaml.doc ""]

type nonrec registration_code = string [@@ocaml.doc ""]

type nonrec directory_name = string [@@ocaml.doc ""]

type nonrec workspace_directory = {
  directory_id : directory_id option; [@ocaml.doc "The directory identifier.\n"]
  alias : alias option; [@ocaml.doc "The directory alias.\n"]
  directory_name : directory_name option; [@ocaml.doc "The name of the directory.\n"]
  registration_code : registration_code option;
      [@ocaml.doc
        "The registration code for the directory. This is the code that users enter in their \
         Amazon WorkSpaces client application to connect to the directory.\n"]
  subnet_ids : subnet_ids option;
      [@ocaml.doc "The identifiers of the subnets used with the directory.\n"]
  dns_ip_addresses : dns_ip_addresses option;
      [@ocaml.doc "The IP addresses of the DNS servers for the directory.\n"]
  dns_ipv6_addresses : dns_ipv6_addresses option;
      [@ocaml.doc "The IPv6 addresses of the DNS servers for the directory.\n"]
  customer_user_name : user_name option; [@ocaml.doc "The user name for the service account.\n"]
  iam_role_id : ar_n option;
      [@ocaml.doc
        "The identifier of the IAM role. This is the role that allows Amazon WorkSpaces to make \
         calls to other services, such as Amazon EC2, on your behalf.\n"]
  directory_type : workspace_directory_type option; [@ocaml.doc "The directory type.\n"]
  workspace_security_group_id : security_group_id option;
      [@ocaml.doc "The identifier of the security group that is assigned to new WorkSpaces.\n"]
  state : workspace_directory_state option;
      [@ocaml.doc
        "The state of the directory's registration with Amazon WorkSpaces. After a directory is \
         deregistered, the [DEREGISTERED] state is returned very briefly before the directory \
         metadata is cleaned up, so this state is rarely returned. To confirm that a directory is \
         deregistered, check for the directory ID by using \
         {{:https://docs.aws.amazon.com/workspaces/latest/api/API_DescribeWorkspaceDirectories.html} \
         DescribeWorkspaceDirectories}. If the directory ID isn't returned, then the directory has \
         been successfully deregistered.\n"]
  workspace_creation_properties : default_workspace_creation_properties option;
      [@ocaml.doc "The default creation properties for all WorkSpaces in the directory.\n"]
  ip_group_ids : ip_group_id_list option;
      [@ocaml.doc
        "The identifiers of the IP access control groups associated with the directory.\n"]
  workspace_access_properties : workspace_access_properties option;
      [@ocaml.doc "The devices and operating systems that users can use to access WorkSpaces.\n"]
  tenancy : tenancy option;
      [@ocaml.doc
        "Specifies whether the directory is dedicated or shared. To use Bring Your Own License \
         (BYOL), this value must be set to [DEDICATED]. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html}Bring \
         Your Own Windows Desktop Images}.\n"]
  selfservice_permissions : selfservice_permissions option;
      [@ocaml.doc "The default self-service permissions for WorkSpaces in the directory.\n"]
  saml_properties : saml_properties option;
      [@ocaml.doc
        "Describes the enablement status, user access URL, and relay state parameter name that are \
         used for configuring federation with an SAML 2.0 identity provider.\n"]
  certificate_based_auth_properties : certificate_based_auth_properties option;
      [@ocaml.doc
        "The certificate-based authentication properties used to authenticate SAML 2.0 Identity \
         Provider (IdP) user identities to Active Directory for WorkSpaces login.\n"]
  endpoint_encryption_mode : endpoint_encryption_mode option;
      [@ocaml.doc
        "Endpoint encryption mode that allows you to configure the specified directory between \
         Standard TLS and FIPS 140-2 validated mode.\n"]
  microsoft_entra_config : microsoft_entra_config option;
      [@ocaml.doc "Specifies details about Microsoft Entra configurations.\n"]
  workspace_directory_name : workspace_directory_name option;
      [@ocaml.doc "The name fo the WorkSpace directory.\n"]
  workspace_directory_description : workspace_directory_description option;
      [@ocaml.doc "The description of the WorkSpace directory\n"]
  user_identity_type : user_identity_type option;
      [@ocaml.doc "Indicates the identity type of the specifired user.\n"]
  workspace_type : workspace_type option;
      [@ocaml.doc "Indicates whether the directory's WorkSpace type is personal or pools.\n"]
  idc_config : idc_config option;
      [@ocaml.doc "Specifies details about identity center configurations.\n"]
  active_directory_config : active_directory_config option;
      [@ocaml.doc "Information about the Active Directory config.\n"]
  streaming_properties : streaming_properties option;
      [@ocaml.doc "The streaming properties to configure.\n"]
  error_message : description option; [@ocaml.doc "The error message returned.\n"]
}
[@@ocaml.doc "Describes a directory that is used with Amazon WorkSpaces.\n"]

type nonrec directory_list = workspace_directory list [@@ocaml.doc ""]

type nonrec describe_workspace_directories_result = {
  directories : directory_list option; [@ocaml.doc "Information about the directories.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspace_directories_filter_value = string [@@ocaml.doc ""]

type nonrec describe_workspace_directories_filter_values =
  describe_workspace_directories_filter_value list
[@@ocaml.doc ""]

type nonrec describe_workspace_directories_filter_name =
  | USER_IDENTITY_TYPE [@ocaml.doc ""]
  | WORKSPACE_TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_workspace_directories_filter = {
  name : describe_workspace_directories_filter_name;
      [@ocaml.doc "The name of the WorkSpaces to filter.\n"]
  values : describe_workspace_directories_filter_values;
      [@ocaml.doc "The values for filtering WorkSpaces\n"]
}
[@@ocaml.doc "Describes the filter conditions for the WorkSpaces to return.\n"]

type nonrec describe_workspace_directories_filter_list = describe_workspace_directories_filter list
[@@ocaml.doc ""]

type nonrec workspace_directory_name_list = workspace_directory_name list [@@ocaml.doc ""]

type nonrec directory_id_list = directory_id list [@@ocaml.doc ""]

type nonrec describe_workspace_directories_request = {
  directory_ids : directory_id_list option;
      [@ocaml.doc
        "The identifiers of the directories. If the value is null, all directories are retrieved.\n"]
  workspace_directory_names : workspace_directory_name_list option;
      [@ocaml.doc "The names of the WorkSpace directories.\n"]
  limit : limit option; [@ocaml.doc "The maximum number of directories to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
  filters : describe_workspace_directories_filter_list option;
      [@ocaml.doc "The filter condition for the WorkSpaces.\n"]
}
[@@ocaml.doc ""]

type nonrec image_permission = {
  shared_account_id : aws_account option;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account that an image has been shared with.\n"]
}
[@@ocaml.doc
  "Describes the Amazon Web Services accounts that have been granted permission to use a shared \
   image. For more information about sharing images, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/share-custom-image.html} Share or \
   Unshare a Custom WorkSpaces Image}.\n"]

type nonrec image_permissions = image_permission list [@@ocaml.doc ""]

type nonrec describe_workspace_image_permissions_result = {
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the image.\n"]
  image_permissions : image_permissions option;
      [@ocaml.doc
        "The identifiers of the Amazon Web Services accounts that the image has been shared with.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspace_image_permissions_request = {
  image_id : workspace_image_id; [@ocaml.doc "The identifier of the image.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
  max_results : limit option; [@ocaml.doc "The maximum number of items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec workspace_image_error_detail_code =
  | OUTDATED_POWERSHELL_VERSION [@ocaml.doc ""]
  | OFFICE_INSTALLED [@ocaml.doc ""]
  | PCOIP_AGENT_INSTALLED [@ocaml.doc ""]
  | WINDOWS_UPDATES_ENABLED [@ocaml.doc ""]
  | AUTO_MOUNT_DISABLED [@ocaml.doc ""]
  | WORKSPACES_BYOL_ACCOUNT_NOT_FOUND [@ocaml.doc ""]
  | WORKSPACES_BYOL_ACCOUNT_DISABLED [@ocaml.doc ""]
  | DHCP_DISABLED [@ocaml.doc ""]
  | DISK_FREE_SPACE [@ocaml.doc ""]
  | ADDITIONAL_DRIVES_ATTACHED [@ocaml.doc ""]
  | OS_NOT_SUPPORTED [@ocaml.doc ""]
  | DOMAIN_JOINED [@ocaml.doc ""]
  | AZURE_DOMAIN_JOINED [@ocaml.doc ""]
  | FIREWALL_ENABLED [@ocaml.doc ""]
  | VMWARE_TOOLS_INSTALLED [@ocaml.doc ""]
  | DISK_SIZE_EXCEEDED [@ocaml.doc ""]
  | INCOMPATIBLE_PARTITIONING [@ocaml.doc ""]
  | PENDING_REBOOT [@ocaml.doc ""]
  | AUTO_LOGON_ENABLED [@ocaml.doc ""]
  | REALTIME_UNIVERSAL_DISABLED [@ocaml.doc ""]
  | MULTIPLE_BOOT_PARTITION [@ocaml.doc ""]
  | SIXTY_FOUR_BIT_OS [@ocaml.doc ""]
  | ZERO_REARM_COUNT [@ocaml.doc ""]
  | IN_PLACE_UPGRADE [@ocaml.doc ""]
  | ANTI_VIRUS_INSTALLED [@ocaml.doc ""]
  | UEFI_NOT_SUPPORTED [@ocaml.doc ""]
  | UNKNOWN_ERROR [@ocaml.doc ""]
  | APPX_PACKAGES_INSTALLED [@ocaml.doc ""]
  | RESERVED_STORAGE_IN_USE [@ocaml.doc ""]
  | ADDITIONAL_DRIVES_PRESENT [@ocaml.doc ""]
  | WINDOWS_UPDATES_REQUIRED [@ocaml.doc ""]
  | SYSPREP_FILE_MISSING [@ocaml.doc ""]
  | USER_PROFILE_MISSING [@ocaml.doc ""]
  | INSUFFICIENT_DISK_SPACE [@ocaml.doc ""]
  | ENVIRONMENT_VARIABLES_PATH_MISSING_ENTRIES [@ocaml.doc ""]
  | DOMAIN_ACCOUNT_SERVICES_FOUND [@ocaml.doc ""]
  | INVALID_IP [@ocaml.doc ""]
  | REMOTE_DESKTOP_SERVICES_DISABLED [@ocaml.doc ""]
  | WINDOWS_MODULES_INSTALLER_DISABLED [@ocaml.doc ""]
  | AMAZON_SSM_AGENT_ENABLED [@ocaml.doc ""]
  | UNSUPPORTED_SECURITY_PROTOCOL [@ocaml.doc ""]
  | MULTIPLE_USER_PROFILES [@ocaml.doc ""]
  | STAGED_APPX_PACKAGE [@ocaml.doc ""]
  | UNSUPPORTED_OS_UPGRADE [@ocaml.doc ""]
  | INSUFFICIENT_REARM_COUNT [@ocaml.doc ""]
  | INCOMPATIBLE_PROTOCOL [@ocaml.doc ""]
  | INCOMPATIBLE_MEMORY_INTEGRITY [@ocaml.doc ""]
  | RESTRICTED_DRIVE_LETTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_details = {
  error_code : workspace_image_error_detail_code option;
      [@ocaml.doc "Indicates the error code returned.\n"]
  error_message : description option;
      [@ocaml.doc "The text of the error message related the error code.\n"]
}
[@@ocaml.doc
  "Describes in-depth details about the error. These details include the possible causes of the \
   error and troubleshooting information.\n"]

type nonrec error_details_list = error_details list [@@ocaml.doc ""]

type nonrec update_result = {
  update_available : boolean_object option;
      [@ocaml.doc
        "Indicates whether updated drivers or other components are available for the specified \
         WorkSpace image.\n"]
  description : update_description option;
      [@ocaml.doc
        "A description of whether updates for the WorkSpace image are pending or available.\n"]
}
[@@ocaml.doc
  "Describes whether a WorkSpace image needs to be updated with the latest drivers and other \
   components required by Amazon WorkSpaces.\n\n\
  \  Only Windows 10 WorkSpace images can be programmatically updated at this time.\n\
  \  \n\
  \   "]

type nonrec workspace_image_error_code = string [@@ocaml.doc ""]

type nonrec workspace_image = {
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the image.\n"]
  name : workspace_image_name option; [@ocaml.doc "The name of the image.\n"]
  description : workspace_image_description option; [@ocaml.doc "The description of the image.\n"]
  operating_system : operating_system option;
      [@ocaml.doc "The operating system that the image is running. \n"]
  state : workspace_image_state option; [@ocaml.doc "The status of the image.\n"]
  required_tenancy : workspace_image_required_tenancy option;
      [@ocaml.doc
        "Specifies whether the image is running on dedicated hardware. When Bring Your Own License \
         (BYOL) is enabled, this value is set to [DEDICATED]. For more information, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html}Bring \
         Your Own Windows Desktop Images}.\n"]
  error_code : workspace_image_error_code option;
      [@ocaml.doc "The error code that is returned for the image.\n"]
  error_message : description option;
      [@ocaml.doc "The text of the error message that is returned for the image.\n"]
  created : timestamp option;
      [@ocaml.doc
        "The date when the image was created. If the image has been shared, the Amazon Web \
         Services account that the image has been shared with sees the original creation date of \
         the image.\n"]
  owner_account_id : aws_account option;
      [@ocaml.doc "The identifier of the Amazon Web Services account that owns the image.\n"]
  updates : update_result option;
      [@ocaml.doc "The updates (if any) that are available for the specified image.\n"]
  error_details : error_details_list option;
      [@ocaml.doc
        "Additional details of the error returned for the image, including the possible causes of \
         the errors and troubleshooting information.\n"]
}
[@@ocaml.doc "Describes a WorkSpace image.\n"]

type nonrec workspace_image_list = workspace_image list [@@ocaml.doc ""]

type nonrec describe_workspace_images_result = {
  images : workspace_image_list option; [@ocaml.doc "Information about the images.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec image_type = OWNED [@ocaml.doc ""] | SHARED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec workspace_image_id_list = workspace_image_id list [@@ocaml.doc ""]

type nonrec describe_workspace_images_request = {
  image_ids : workspace_image_id_list option; [@ocaml.doc "The identifier of the image.\n"]
  image_type : image_type option; [@ocaml.doc "The type (owned or shared) of the image.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
  max_results : limit option; [@ocaml.doc "The maximum number of items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec snapshot = {
  snapshot_time : timestamp option; [@ocaml.doc "The time when the snapshot was created.\n"]
}
[@@ocaml.doc "Describes a snapshot.\n"]

type nonrec snapshot_list = snapshot list [@@ocaml.doc ""]

type nonrec describe_workspace_snapshots_result = {
  rebuild_snapshots : snapshot_list option;
      [@ocaml.doc
        "Information about the snapshots that can be used to rebuild a WorkSpace. These snapshots \
         include the user volume.\n"]
  restore_snapshots : snapshot_list option;
      [@ocaml.doc
        "Information about the snapshots that can be used to restore a WorkSpace. These snapshots \
         include both the root volume and the user volume.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspace_snapshots_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspaces_result = {
  workspaces : workspace_list option;
      [@ocaml.doc
        "Information about the WorkSpaces.\n\n\
        \ Because [CreateWorkspaces] is an asynchronous operation, some of the returned \
         information could be incomplete.\n\
        \ "]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec workspace_id_list = workspace_id list [@@ocaml.doc ""]

type nonrec describe_workspaces_request = {
  workspace_ids : workspace_id_list option;
      [@ocaml.doc
        "The identifiers of the WorkSpaces. You cannot combine this parameter with any other \
         filter.\n\n\
        \ Because the [CreateWorkspaces] operation is asynchronous, the identifier it returns is \
         not immediately available. If you immediately call [DescribeWorkspaces] with this \
         identifier, no information is returned.\n\
        \ "]
  directory_id : directory_id option;
      [@ocaml.doc
        "The identifier of the directory. In addition, you can optionally specify a specific \
         directory user (see [UserName]). You cannot combine this parameter with any other filter.\n"]
  user_name : user_name option;
      [@ocaml.doc
        "The name of the directory user. You must specify this parameter with [DirectoryId].\n"]
  bundle_id : bundle_id option;
      [@ocaml.doc
        "The identifier of the bundle. All WorkSpaces that are created from this bundle are \
         retrieved. You cannot combine this parameter with any other filter.\n"]
  limit : limit option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
  workspace_name : workspace_name option; [@ocaml.doc "The name of the user-decoupled WorkSpace.\n"]
}
[@@ocaml.doc ""]

type nonrec workspace_connection_status = {
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  connection_state : connection_state option;
      [@ocaml.doc
        "The connection state of the WorkSpace. The connection state is unknown if the WorkSpace \
         is stopped.\n"]
  connection_state_check_timestamp : timestamp option;
      [@ocaml.doc "The timestamp of the connection status check.\n"]
  last_known_user_connection_timestamp : timestamp option;
      [@ocaml.doc "The timestamp of the last known user connection.\n"]
}
[@@ocaml.doc "Describes the connection status of a WorkSpace.\n"]

type nonrec workspace_connection_status_list = workspace_connection_status list [@@ocaml.doc ""]

type nonrec describe_workspaces_connection_status_result = {
  workspaces_connection_status : workspace_connection_status_list option;
      [@ocaml.doc "Information about the connection status of the WorkSpace.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspaces_connection_status_request = {
  workspace_ids : workspace_id_list option;
      [@ocaml.doc "The identifiers of the WorkSpaces. You can specify up to 25 WorkSpaces.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec workspaces_pool_user_id = string [@@ocaml.doc ""]

type nonrec network_access_configuration = {
  eni_private_ip_address : non_empty_string option;
      [@ocaml.doc
        "The private IP address of the elastic network interface that is attached to instances in \
         your VPC.\n"]
  eni_id : non_empty_string option;
      [@ocaml.doc
        "The resource identifier of the elastic network interface that is attached to instances in \
         your VPC. All network interfaces have the eni-xxxxxxxx resource identifier.\n"]
}
[@@ocaml.doc "Describes the network details of a WorkSpaces Pool.\n"]

type nonrec session_instance_id = string [@@ocaml.doc ""]

type nonrec session_connection_state = CONNECTED [@ocaml.doc ""] | NOT_CONNECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workspaces_pool_session = {
  authentication_type : authentication_type option;
      [@ocaml.doc
        "The authentication method. The user is authenticated using a WorkSpaces Pools URL (API) \
         or SAML 2.0 federation (SAML).\n"]
  connection_state : session_connection_state option;
      [@ocaml.doc "Specifies whether a user is connected to the pool session.\n"]
  session_id : amazon_uuid; [@ocaml.doc "The identifier of the session.\n"]
  instance_id : session_instance_id option;
      [@ocaml.doc "The identifier for the instance hosting the session.\n"]
  pool_id : workspaces_pool_id; [@ocaml.doc "The identifier of the pool.\n"]
  expiration_time : timestamp option; [@ocaml.doc "The time that the pool session ended.\n"]
  network_access_configuration : network_access_configuration option;
      [@ocaml.doc "Describes the network details of the pool.\n"]
  start_time : timestamp option; [@ocaml.doc "The time that the pool sission started.\n"]
  user_id : workspaces_pool_user_id; [@ocaml.doc "The identifier of the user.\n"]
}
[@@ocaml.doc "Describes a pool session.\n"]

type nonrec workspaces_pool_sessions = workspaces_pool_session list [@@ocaml.doc ""]

type nonrec describe_workspaces_pool_sessions_result = {
  sessions : workspaces_pool_sessions option; [@ocaml.doc "Describes the pool sessions.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec limit50 = int [@@ocaml.doc ""]

type nonrec describe_workspaces_pool_sessions_request = {
  pool_id : workspaces_pool_id; [@ocaml.doc "The identifier of the pool.\n"]
  user_id : workspaces_pool_user_id option; [@ocaml.doc "The identifier of the user.\n"]
  limit : limit50 option;
      [@ocaml.doc
        "The maximum size of each page of results. The default value is 20 and the maximum value \
         is 50.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec workspaces_pools = workspaces_pool list [@@ocaml.doc ""]

type nonrec describe_workspaces_pools_result = {
  workspaces_pools : workspaces_pools option;
      [@ocaml.doc "Information about the WorkSpaces Pools.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_workspaces_pools_filter_operator =
  | EQUALS [@ocaml.doc ""]
  | NOTEQUALS [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | NOTCONTAINS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_workspaces_pools_filter_value = string [@@ocaml.doc ""]

type nonrec describe_workspaces_pools_filter_values = describe_workspaces_pools_filter_value list
[@@ocaml.doc ""]

type nonrec describe_workspaces_pools_filter_name = POOLNAME [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec describe_workspaces_pools_filter = {
  name : describe_workspaces_pools_filter_name; [@ocaml.doc "The name of the pool to filter.\n"]
  values : describe_workspaces_pools_filter_values;
      [@ocaml.doc "The values for filtering WorkSpaces Pools.\n"]
  operator : describe_workspaces_pools_filter_operator;
      [@ocaml.doc "The operator values for filtering WorkSpaces Pools.\n"]
}
[@@ocaml.doc "Describes the filter conditions for WorkSpaces Pools to return.\n"]

type nonrec describe_workspaces_pools_filters = describe_workspaces_pools_filter list
[@@ocaml.doc ""]

type nonrec workspaces_pool_ids = workspaces_pool_id list [@@ocaml.doc ""]

type nonrec describe_workspaces_pools_request = {
  pool_ids : workspaces_pool_ids option; [@ocaml.doc "The identifier of the WorkSpaces Pools.\n"]
  filters : describe_workspaces_pools_filters option;
      [@ocaml.doc "The filter conditions for the WorkSpaces Pool to return.\n"]
  limit : limit option; [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_connection_alias_result = unit [@@ocaml.doc ""]

type nonrec disassociate_connection_alias_request = {
  alias_id : connection_alias_id;
      [@ocaml.doc "The identifier of the connection alias to disassociate.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_ip_groups_result = unit [@@ocaml.doc ""]

type nonrec disassociate_ip_groups_request = {
  directory_id : directory_id; [@ocaml.doc "The identifier of the directory.\n"]
  group_ids : ip_group_id_list;
      [@ocaml.doc "The identifiers of one or more IP access control groups.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_workspace_application_result = {
  association : workspace_resource_association option;
      [@ocaml.doc "Information about the targeted association.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_workspace_application_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  application_id : work_space_application_id; [@ocaml.doc "The identifier of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec failed_workspace_change_request = {
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  error_code : error_type option;
      [@ocaml.doc "The error code that is returned if the WorkSpace cannot be rebooted.\n"]
  error_message : description option;
      [@ocaml.doc
        "The text of the error message that is returned if the WorkSpace cannot be rebooted.\n"]
}
[@@ocaml.doc
  "Describes a WorkSpace that could not be rebooted. ([RebootWorkspaces]), rebuilt \
   ([RebuildWorkspaces]), restored ([RestoreWorkspace]), terminated ([TerminateWorkspaces]), \
   started ([StartWorkspaces]), or stopped ([StopWorkspaces]).\n"]

type nonrec failed_reboot_workspace_requests = failed_workspace_change_request list [@@ocaml.doc ""]

type nonrec failed_rebuild_workspace_requests = failed_workspace_change_request list
[@@ocaml.doc ""]

type nonrec failed_start_workspace_requests = failed_workspace_change_request list [@@ocaml.doc ""]

type nonrec failed_stop_workspace_requests = failed_workspace_change_request list [@@ocaml.doc ""]

type nonrec failed_terminate_workspace_requests = failed_workspace_change_request list
[@@ocaml.doc ""]

type nonrec get_account_link_result = {
  account_link : account_link option;
      [@ocaml.doc "The account link of the account link to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_link_request = {
  link_id : link_id option; [@ocaml.doc "The identifier of the account to link.\n"]
  linked_account_id : aws_account option; [@ocaml.doc "The identifier of the account link\n"]
}
[@@ocaml.doc ""]

type nonrec image_compute_type =
  | BASE [@ocaml.doc ""]
  | GRAPHICS_G4DN [@ocaml.doc ""]
  | GRAPHICS_G6 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_client_branding_result = {
  device_type_windows : default_client_branding_attributes option;
      [@ocaml.doc "The branding information configured for Windows devices.\n"]
  device_type_osx : default_client_branding_attributes option;
      [@ocaml.doc "The branding information configured for macOS devices.\n"]
  device_type_android : default_client_branding_attributes option;
      [@ocaml.doc "The branding information configured for Android devices.\n"]
  device_type_ios : ios_client_branding_attributes option;
      [@ocaml.doc "The branding information configured for iOS devices.\n"]
  device_type_linux : default_client_branding_attributes option;
      [@ocaml.doc "The branding information configured for Linux devices.\n"]
  device_type_web : default_client_branding_attributes option;
      [@ocaml.doc "The branding information configured for web access.\n"]
}
[@@ocaml.doc ""]

type nonrec ios3_x_logo = bytes [@@ocaml.doc ""]

type nonrec ios2_x_logo = bytes [@@ocaml.doc ""]

type nonrec ios_logo = bytes [@@ocaml.doc ""]

type nonrec ios_import_client_branding_attributes = {
  logo : ios_logo option;
      [@ocaml.doc
        "The logo. This is the standard-resolution display that has a 1:1 pixel density (or \
         \\@1x), where one pixel is equal to one point. The only image format accepted is a binary \
         data object that is converted from a [.png] file.\n"]
  logo2x : ios2_x_logo option;
      [@ocaml.doc
        "The \\@2x version of the logo. This is the higher resolution display that offers a scale \
         factor of 2.0 (or \\@2x). The only image format accepted is a binary data object that is \
         converted from a [.png] file.\n\n\
        \   For more information about iOS image size and resolution, see \
         {{:https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/}Image \
         Size and Resolution } in the {i Apple Human Interface Guidelines}.\n\
        \  \n\
        \   "]
  logo3x : ios3_x_logo option;
      [@ocaml.doc
        "The \\@3x version of the logo. This is the higher resolution display that offers a scale \
         factor of 3.0 (or \\@3x). The only image format accepted is a binary data object that is \
         converted from a [.png] file.\n\n\
        \   For more information about iOS image size and resolution, see \
         {{:https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/image-size-and-resolution/}Image \
         Size and Resolution } in the {i Apple Human Interface Guidelines}.\n\
        \  \n\
        \   "]
  support_email : client_email option;
      [@ocaml.doc
        "The support email. The company's customer support email address.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive. You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default email is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  support_link : client_url option;
      [@ocaml.doc
        "The support link. The link for the company's customer support page for their WorkSpace.\n\n\
        \  {ul\n\
        \        {-  In each platform type, the [SupportEmail] and [SupportLink] parameters are \
         mutually exclusive. You can specify one parameter for each platform type, but not both.\n\
        \            \n\
        \             }\n\
        \        {-  The default support link is [workspaces-feedback@amazon.com].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  forgot_password_link : client_url option;
      [@ocaml.doc
        "The forgotten password link. This is the web address that users can go to if they forget \
         the password for their WorkSpace.\n"]
  login_message : login_message option;
      [@ocaml.doc
        "The login message. Specified as a key value pair, in which the key is a locale and the \
         value is the localized message for that locale. The only key supported is [en_US]. The \
         HTML tags supported include the following: [a, b, blockquote, br, cite, code, dd, dl, dt, \
         div, em, \n\
        \            i, li, ol, p, pre, q, small, span, strike, strong, sub, sup, u, ul].\n"]
}
[@@ocaml.doc
  "The client branding attributes to import for iOS device types. These attributes are displayed \
   on the iOS client login screen.\n\n\
  \  Client branding attributes are public facing. Ensure you do not include sensitive information.\n\
  \  \n\
  \   "]

type nonrec import_client_branding_request = {
  resource_id : directory_id;
      [@ocaml.doc
        "The directory identifier of the WorkSpace for which you want to import client branding.\n"]
  device_type_windows : default_import_client_branding_attributes option;
      [@ocaml.doc "The branding information to import for Windows devices.\n"]
  device_type_osx : default_import_client_branding_attributes option;
      [@ocaml.doc "The branding information to import for macOS devices.\n"]
  device_type_android : default_import_client_branding_attributes option;
      [@ocaml.doc "The branding information to import for Android devices.\n"]
  device_type_ios : ios_import_client_branding_attributes option;
      [@ocaml.doc "The branding information to import for iOS devices.\n"]
  device_type_linux : default_import_client_branding_attributes option;
      [@ocaml.doc "The branding information to import for Linux devices.\n"]
  device_type_web : default_import_client_branding_attributes option;
      [@ocaml.doc "The branding information to import for web access.\n"]
}
[@@ocaml.doc ""]

type nonrec import_custom_workspace_image_result = {
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the WorkSpace image.\n"]
  state : custom_workspace_image_import_state option;
      [@ocaml.doc "The state of the WorkSpace image.\n"]
}
[@@ocaml.doc ""]

type nonrec os_version = Windows_10 [@ocaml.doc ""] | Windows_11 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec platform = WINDOWS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec import_custom_workspace_image_request = {
  image_name : workspace_image_name; [@ocaml.doc "The name of the WorkSpace image.\n"]
  image_description : workspace_image_description;
      [@ocaml.doc "The description of the WorkSpace image.\n"]
  compute_type : image_compute_type;
      [@ocaml.doc "The supported compute type for the WorkSpace image.\n"]
  protocol : custom_image_protocol;
      [@ocaml.doc
        "The supported protocol for the WorkSpace image. Windows 11 does not support PCOIP protocol.\n"]
  image_source : image_source_identifier; [@ocaml.doc "The options for image import source.\n"]
  infrastructure_configuration_arn : infrastructure_configuration_arn;
      [@ocaml.doc
        "The infrastructure configuration ARN that specifies how the WorkSpace image is built.\n"]
  platform : platform; [@ocaml.doc "The platform for the WorkSpace image source.\n"]
  os_version : os_version; [@ocaml.doc "The OS version for the WorkSpace image source.\n"]
  tags : tag_list option;
      [@ocaml.doc "The resource tags. Each WorkSpaces resource can have a maximum of 50 tags.\n"]
}
[@@ocaml.doc ""]

type nonrec import_workspace_image_result = {
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the WorkSpace image.\n"]
}
[@@ocaml.doc ""]

type nonrec workspace_image_ingestion_process =
  | BYOL_REGULAR [@ocaml.doc ""]
  | BYOL_GRAPHICS [@ocaml.doc ""]
  | BYOL_GRAPHICSPRO [@ocaml.doc ""]
  | BYOL_GRAPHICS_G4DN [@ocaml.doc ""]
  | BYOL_REGULAR_WSP [@ocaml.doc ""]
  | BYOL_GRAPHICS_G4DN_WSP [@ocaml.doc ""]
  | BYOL_REGULAR_BYOP [@ocaml.doc ""]
  | BYOL_GRAPHICS_G4DN_BYOP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_workspace_image_request = {
  ec2_image_id : ec2_image_id; [@ocaml.doc "The identifier of the EC2 image.\n"]
  ingestion_process : workspace_image_ingestion_process;
      [@ocaml.doc
        "The ingestion process to be used when importing the image, depending on which protocol \
         you want to use for your BYOL Workspace image, either PCoIP, WSP, or bring your own \
         protocol (BYOP). To use DCV, specify a value that ends in [_WSP]. To use PCoIP, specify a \
         value that does not end in [_WSP]. To use BYOP, specify a value that ends in [_BYOP].\n\n\
        \ For non-GPU-enabled bundles (bundles other than Graphics or GraphicsPro), specify \
         [BYOL_REGULAR], [BYOL_REGULAR_WSP], or [BYOL_REGULAR_BYOP], depending on the protocol.\n\
        \ \n\
        \   The [BYOL_REGULAR_BYOP] and [BYOL_GRAPHICS_G4DN_BYOP] values are only supported by \
         Amazon WorkSpaces Core. Contact your account team to be allow-listed to use these values. \
         For more information, see {{:http://aws.amazon.com/workspaces/core/}Amazon WorkSpaces \
         Core}.\n\
        \   \n\
        \    "]
  image_name : workspace_image_name; [@ocaml.doc "The name of the WorkSpace image.\n"]
  image_description : workspace_image_description;
      [@ocaml.doc "The description of the WorkSpace image.\n"]
  tags : tag_list option;
      [@ocaml.doc "The tags. Each WorkSpaces resource can have a maximum of 50 tags.\n"]
  applications : application_list option;
      [@ocaml.doc
        "If specified, the version of Microsoft Office to subscribe to. Valid only for Windows 10 \
         and 11 BYOL images. For more information about subscribing to Office for BYOL images, see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html} \
         Bring Your Own Windows Desktop Licenses}.\n\n\
        \  {ul\n\
        \        {-  Although this parameter is an array, only one item is allowed at this time.\n\
        \            \n\
        \             }\n\
        \        {-  During the image import process, non-GPU DCV (formerly WSP) WorkSpaces with \
         Windows 11 support only [Microsoft_Office_2019]. GPU DCV (formerly WSP) WorkSpaces with \
         Windows 11 do not support Office installation.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec invalid_parameter_combination_exception = {
  message : exception_message option; [@ocaml.doc "The exception error message.\n"]
}
[@@ocaml.doc "Two or more of the selected parameter values cannot be used together.\n"]

type nonrec ip_revoked_rule_list = ip_rule list [@@ocaml.doc ""]

type nonrec link_status_filter_list = account_link_status_enum list [@@ocaml.doc ""]

type nonrec list_account_links_result = {
  account_links : account_link_list option; [@ocaml.doc "Information about the account links.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_account_links_request = {
  link_status_filter : link_status_filter_list option;
      [@ocaml.doc "Filters the account based on their link status.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return.\n"]
  max_results : limit option; [@ocaml.doc "The maximum number of accounts to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_available_management_cidr_ranges_result = {
  management_cidr_ranges : dedicated_tenancy_cidr_range_list option;
      [@ocaml.doc "The list of available IP address ranges, specified as IPv4 CIDR blocks.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is null when there are \
         no more results to return. \n"]
}
[@@ocaml.doc ""]

type nonrec management_cidr_range_max_results = int [@@ocaml.doc ""]

type nonrec management_cidr_range_constraint = string [@@ocaml.doc ""]

type nonrec list_available_management_cidr_ranges_request = {
  management_cidr_range_constraint : management_cidr_range_constraint;
      [@ocaml.doc
        "The IP address range to search. Specify an IP address range that is compatible with your \
         network and in CIDR notation (that is, specify the range as an IPv4 CIDR block).\n"]
  max_results : management_cidr_range_max_results option;
      [@ocaml.doc "The maximum number of items to return.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If you received a [NextToken] from a previous call that was paginated, provide this token \
         to receive the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_in_progress_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The properties of this WorkSpace are currently being modified. Try again in a moment.\n"]

type nonrec migrate_workspace_result = {
  source_workspace_id : workspace_id option;
      [@ocaml.doc "The original identifier of the WorkSpace that is being migrated.\n"]
  target_workspace_id : workspace_id option;
      [@ocaml.doc
        "The new identifier of the WorkSpace that is being migrated. If the migration does not \
         succeed, the target WorkSpace ID will not be used, and the WorkSpace will still have the \
         original WorkSpace ID.\n"]
}
[@@ocaml.doc ""]

type nonrec migrate_workspace_request = {
  source_workspace_id : workspace_id;
      [@ocaml.doc "The identifier of the WorkSpace to migrate from.\n"]
  bundle_id : bundle_id;
      [@ocaml.doc "The identifier of the target bundle type to migrate the WorkSpace to.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_account_result = {
  message : message option;
      [@ocaml.doc "The text message to describe the status of BYOL modification.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_account_request = {
  dedicated_tenancy_support : dedicated_tenancy_support_enum option;
      [@ocaml.doc "The status of BYOL.\n"]
  dedicated_tenancy_management_cidr_range : dedicated_tenancy_management_cidr_range option;
      [@ocaml.doc
        "The IP address range, specified as an IPv4 CIDR block, for the management network \
         interface. Specify an IP address range that is compatible with your network and in CIDR \
         notation (that is, specify the range as an IPv4 CIDR block). The CIDR block size must be \
         /16 (for example, 203.0.113.25/16). It must also be specified as available by the \
         [ListAvailableManagementCidrRanges] operation.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_certificate_based_auth_properties_result = unit [@@ocaml.doc ""]

type nonrec modify_certificate_based_auth_properties_request = {
  resource_id : directory_id;
      [@ocaml.doc "The resource identifiers, in the form of directory IDs.\n"]
  certificate_based_auth_properties : certificate_based_auth_properties option;
      [@ocaml.doc "The properties of the certificate-based authentication.\n"]
  properties_to_delete : deletable_certificate_based_auth_properties_list option;
      [@ocaml.doc "The properties of the certificate-based authentication you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_client_properties_result = unit [@@ocaml.doc ""]

type nonrec modify_client_properties_request = {
  resource_id : non_empty_string;
      [@ocaml.doc "The resource identifiers, in the form of directory IDs.\n"]
  client_properties : client_properties;
      [@ocaml.doc "Information about the Amazon WorkSpaces client.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_endpoint_encryption_mode_response = unit [@@ocaml.doc ""]

type nonrec modify_endpoint_encryption_mode_request = {
  directory_id : directory_id; [@ocaml.doc " The identifier of the directory.\n"]
  endpoint_encryption_mode : endpoint_encryption_mode;
      [@ocaml.doc
        "The encryption mode used for endpoint connections when streaming to WorkSpaces Personal \
         or WorkSpace Pools.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_saml_properties_result = unit [@@ocaml.doc ""]

type nonrec modify_saml_properties_request = {
  resource_id : directory_id;
      [@ocaml.doc "The directory identifier for which you want to configure SAML properties.\n"]
  saml_properties : saml_properties option;
      [@ocaml.doc "The properties for configuring SAML 2.0 authentication.\n"]
  properties_to_delete : deletable_saml_properties_list option;
      [@ocaml.doc
        "The SAML properties to delete as part of your request.\n\n\
        \ Specify one of the following options:\n\
        \ \n\
        \  {ul\n\
        \        {-   [SAML_PROPERTIES_USER_ACCESS_URL] to delete the user access URL.\n\
        \            \n\
        \             }\n\
        \        {-   [SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME] to delete the relay state \
         parameter name.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec modify_selfservice_permissions_result = unit [@@ocaml.doc ""]

type nonrec modify_selfservice_permissions_request = {
  resource_id : directory_id; [@ocaml.doc "The identifier of the directory.\n"]
  selfservice_permissions : selfservice_permissions;
      [@ocaml.doc "The permissions to enable or disable self-service capabilities.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_streaming_properties_result = unit [@@ocaml.doc ""]

type nonrec modify_streaming_properties_request = {
  resource_id : directory_id; [@ocaml.doc "The identifier of the resource.\n"]
  streaming_properties : streaming_properties option;
      [@ocaml.doc "The streaming properties to configure.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_workspace_access_properties_result = unit [@@ocaml.doc ""]

type nonrec modify_workspace_access_properties_request = {
  resource_id : directory_id; [@ocaml.doc "The identifier of the directory.\n"]
  workspace_access_properties : workspace_access_properties;
      [@ocaml.doc "The device types and operating systems to enable or disable for access.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_workspace_creation_properties_result = unit [@@ocaml.doc ""]

type nonrec workspace_creation_properties = {
  enable_internet_access : boolean_object option;
      [@ocaml.doc "Indicates whether internet access is enabled for your WorkSpaces.\n"]
  default_ou : default_ou option;
      [@ocaml.doc
        "The default organizational unit (OU) for your WorkSpaces directories. This string must be \
         the full Lightweight Directory Access Protocol (LDAP) distinguished name for the target \
         domain and OU. It must be in the form \n\
         {[\n\
         \"OU={i value},DC={i value},DC={i value}\"\n\
         ]}\n\
         , where {i value} is any string of characters, and the number of domain components (DCs) \
         is two or more. For example, [OU=WorkSpaces_machines,DC=machines,DC=example,DC=com]. \n\n\
        \  {ul\n\
        \        {-  To avoid errors, certain characters in the distinguished name must be \
         escaped. For more information, see \
         {{:https://docs.microsoft.com/previous-versions/windows/desktop/ldap/distinguished-names} \
         Distinguished Names} in the Microsoft documentation.\n\
        \            \n\
        \             }\n\
        \        {-  The API doesn't validate whether the OU exists.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  custom_security_group_id : security_group_id option;
      [@ocaml.doc "The identifier of your custom security group.\n"]
  user_enabled_as_local_administrator : boolean_object option;
      [@ocaml.doc "Indicates whether users are local administrators of their WorkSpaces.\n"]
  enable_maintenance_mode : boolean_object option;
      [@ocaml.doc
        "Indicates whether maintenance mode is enabled for your WorkSpaces. For more information, \
         see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/workspace-maintenance.html}WorkSpace \
         Maintenance}. \n"]
  instance_iam_role_arn : ar_n option; [@ocaml.doc "Indicates the IAM role ARN of the instance.\n"]
}
[@@ocaml.doc
  "Describes the default properties that are used for creating WorkSpaces. For more information, \
   see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/update-directory-details.html}Update \
   Directory Details for Your WorkSpaces}. \n"]

type nonrec modify_workspace_creation_properties_request = {
  resource_id : directory_id; [@ocaml.doc "The identifier of the directory.\n"]
  workspace_creation_properties : workspace_creation_properties;
      [@ocaml.doc "The default properties for creating WorkSpaces.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_workspace_configuration_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The configuration of this WorkSpace is not supported for this operation. For more information, \
   see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/required-service-components.html}Required \
   Configuration and Service Components for WorkSpaces }.\n"]

type nonrec modify_workspace_properties_result = unit [@@ocaml.doc ""]

type nonrec modify_workspace_properties_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  workspace_properties : workspace_properties option;
      [@ocaml.doc "The properties of the WorkSpace.\n"]
  data_replication : data_replication option; [@ocaml.doc "Indicates the data replication status.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_workspace_state_result = unit [@@ocaml.doc ""]

type nonrec target_workspace_state = AVAILABLE [@ocaml.doc ""] | ADMIN_MAINTENANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec modify_workspace_state_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
  workspace_state : target_workspace_state; [@ocaml.doc "The WorkSpace state.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc "Describes the information used to reboot a WorkSpace.\n"]

type nonrec reboot_workspace_requests = reboot_request list [@@ocaml.doc ""]

type nonrec reboot_workspaces_result = {
  failed_requests : failed_reboot_workspace_requests option;
      [@ocaml.doc "Information about the WorkSpaces that could not be rebooted.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_workspaces_request = {
  reboot_workspace_requests : reboot_workspace_requests;
      [@ocaml.doc "The WorkSpaces to reboot. You can specify up to 25 WorkSpaces.\n"]
}
[@@ocaml.doc ""]

type nonrec rebuild_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc "Describes the information used to rebuild a WorkSpace.\n"]

type nonrec rebuild_workspace_requests = rebuild_request list [@@ocaml.doc ""]

type nonrec rebuild_workspaces_result = {
  failed_requests : failed_rebuild_workspace_requests option;
      [@ocaml.doc "Information about the WorkSpace that could not be rebuilt.\n"]
}
[@@ocaml.doc ""]

type nonrec rebuild_workspaces_request = {
  rebuild_workspace_requests : rebuild_workspace_requests;
      [@ocaml.doc "The WorkSpace to rebuild. You can specify a single WorkSpace.\n"]
}
[@@ocaml.doc ""]

type nonrec workspaces_default_role_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The workspaces_DefaultRole role could not be found. If this is the first time you are \
   registering a directory, you will need to create the workspaces_DefaultRole role before you can \
   register a directory. For more information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/workspaces-access-control.html#create-default-role}Creating \
   the workspaces_DefaultRole Role}.\n"]

type nonrec unsupported_network_configuration_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The configuration of this network is not supported for this operation, or your network \
   configuration conflicts with the Amazon WorkSpaces management network IP range. For more \
   information, see \
   {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-vpc.html} \
   Configure a VPC for Amazon WorkSpaces}.\n"]

type nonrec register_workspace_directory_result = {
  directory_id : directory_id option; [@ocaml.doc "The identifier of the directory.\n"]
  state : workspace_directory_state option;
      [@ocaml.doc "The registration status of the WorkSpace directory.\n"]
}
[@@ocaml.doc ""]

type nonrec register_workspace_directory_request = {
  directory_id : directory_id option;
      [@ocaml.doc
        "The identifier of the directory. You cannot register a directory if it does not have a \
         status of Active. If the directory does not have a status of Active, you will receive an \
         InvalidResourceStateException error. If you have already registered the maximum number of \
         directories that you can register with Amazon WorkSpaces, you will receive a \
         ResourceLimitExceededException error. Deregister directories that you are not using for \
         WorkSpaces, and try again.\n"]
  subnet_ids : subnet_ids option;
      [@ocaml.doc
        "The identifiers of the subnets for your virtual private cloud (VPC). Make sure that the \
         subnets are in supported Availability Zones. The subnets must also be in separate \
         Availability Zones. If these conditions are not met, you will receive an \
         OperationNotSupportedException error.\n"]
  enable_self_service : boolean_object option;
      [@ocaml.doc "Indicates whether self-service capabilities are enabled or disabled.\n"]
  tenancy : tenancy option;
      [@ocaml.doc
        "Indicates whether your WorkSpace directory is dedicated or shared. To use Bring Your Own \
         License (BYOL) images, this value must be set to [DEDICATED] and your Amazon Web Services \
         account must be enabled for BYOL. If your account has not been enabled for BYOL, you will \
         receive an InvalidParameterValuesException error. For more information about BYOL images, \
         see \
         {{:https://docs.aws.amazon.com/workspaces/latest/adminguide/byol-windows-images.html}Bring \
         Your Own Windows Desktop Images}.\n"]
  tags : tag_list option; [@ocaml.doc "The tags associated with the directory.\n"]
  workspace_directory_name : workspace_directory_name option;
      [@ocaml.doc "The name of the directory to register.\n"]
  workspace_directory_description : workspace_directory_description option;
      [@ocaml.doc "Description of the directory to register.\n"]
  user_identity_type : user_identity_type option;
      [@ocaml.doc "The type of identity management the user is using.\n"]
  idc_instance_arn : ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the identity center instance.\n"]
  microsoft_entra_config : microsoft_entra_config option;
      [@ocaml.doc "The details about Microsoft Entra config.\n"]
  workspace_type : workspace_type option;
      [@ocaml.doc "Indicates whether the directory's WorkSpace type is personal or pools.\n"]
  active_directory_config : active_directory_config option;
      [@ocaml.doc "The active directory config of the directory.\n"]
}
[@@ocaml.doc ""]

type nonrec reject_account_link_invitation_result = {
  account_link : account_link option; [@ocaml.doc "Information about the account link.\n"]
}
[@@ocaml.doc ""]

type nonrec reject_account_link_invitation_request = {
  link_id : link_id; [@ocaml.doc "The identifier of the account link\n"]
  client_token : client_token option;
      [@ocaml.doc "The client token of the account link invitation to reject.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_workspace_result = unit [@@ocaml.doc ""]

type nonrec restore_workspace_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc ""]

type nonrec revoke_ip_rules_result = unit [@@ocaml.doc ""]

type nonrec revoke_ip_rules_request = {
  group_id : ip_group_id; [@ocaml.doc "The identifier of the group.\n"]
  user_rules : ip_revoked_rule_list; [@ocaml.doc "The rules to remove from the group.\n"]
}
[@@ocaml.doc ""]

type nonrec start_request = {
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc "Information used to start a WorkSpace.\n"]

type nonrec start_workspace_requests = start_request list [@@ocaml.doc ""]

type nonrec start_workspaces_result = {
  failed_requests : failed_start_workspace_requests option;
      [@ocaml.doc "Information about the WorkSpaces that could not be started.\n"]
}
[@@ocaml.doc ""]

type nonrec start_workspaces_request = {
  start_workspace_requests : start_workspace_requests;
      [@ocaml.doc "The WorkSpaces to start. You can specify up to 25 WorkSpaces.\n"]
}
[@@ocaml.doc ""]

type nonrec start_workspaces_pool_result = unit [@@ocaml.doc ""]

type nonrec start_workspaces_pool_request = {
  pool_id : workspaces_pool_id; [@ocaml.doc "The identifier of the pool.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_request = {
  workspace_id : workspace_id option; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc "Describes the information used to stop a WorkSpace.\n"]

type nonrec stop_workspace_requests = stop_request list [@@ocaml.doc ""]

type nonrec stop_workspaces_result = {
  failed_requests : failed_stop_workspace_requests option;
      [@ocaml.doc "Information about the WorkSpaces that could not be stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_workspaces_request = {
  stop_workspace_requests : stop_workspace_requests;
      [@ocaml.doc "The WorkSpaces to stop. You can specify up to 25 WorkSpaces.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_workspaces_pool_result = unit [@@ocaml.doc ""]

type nonrec stop_workspaces_pool_request = {
  pool_id : workspaces_pool_id; [@ocaml.doc "The identifier of the pool.\n"]
}
[@@ocaml.doc ""]

type nonrec terminate_request = {
  workspace_id : workspace_id; [@ocaml.doc "The identifier of the WorkSpace.\n"]
}
[@@ocaml.doc "Describes the information used to terminate a WorkSpace.\n"]

type nonrec terminate_workspace_requests = terminate_request list [@@ocaml.doc ""]

type nonrec terminate_workspaces_result = {
  failed_requests : failed_terminate_workspace_requests option;
      [@ocaml.doc "Information about the WorkSpaces that could not be terminated.\n"]
}
[@@ocaml.doc ""]

type nonrec terminate_workspaces_request = {
  terminate_workspace_requests : terminate_workspace_requests;
      [@ocaml.doc "The WorkSpaces to terminate. You can specify up to 25 WorkSpaces.\n"]
}
[@@ocaml.doc ""]

type nonrec terminate_workspaces_pool_result = unit [@@ocaml.doc ""]

type nonrec terminate_workspaces_pool_request = {
  pool_id : workspaces_pool_id; [@ocaml.doc "The identifier of the pool.\n"]
}
[@@ocaml.doc ""]

type nonrec terminate_workspaces_pool_session_result = unit [@@ocaml.doc ""]

type nonrec terminate_workspaces_pool_session_request = {
  session_id : amazon_uuid; [@ocaml.doc "The identifier of the pool session.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connect_client_add_in_result = unit [@@ocaml.doc ""]

type nonrec update_connect_client_add_in_request = {
  add_in_id : amazon_uuid; [@ocaml.doc "The identifier of the client add-in to update.\n"]
  resource_id : directory_id;
      [@ocaml.doc "The directory identifier for which the client add-in is configured.\n"]
  name : add_in_name option; [@ocaml.doc "The name of the client add-in.\n"]
  ur_l : add_in_url option; [@ocaml.doc "The endpoint URL of the Connect Customer client add-in.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connection_alias_permission_result = unit [@@ocaml.doc ""]

type nonrec update_connection_alias_permission_request = {
  alias_id : connection_alias_id;
      [@ocaml.doc
        "The identifier of the connection alias that you want to update permissions for.\n"]
  connection_alias_permission : connection_alias_permission;
      [@ocaml.doc
        "Indicates whether to share or unshare the connection alias with the specified Amazon Web \
         Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec update_rules_of_ip_group_result = unit [@@ocaml.doc ""]

type nonrec update_rules_of_ip_group_request = {
  group_id : ip_group_id; [@ocaml.doc "The identifier of the group.\n"]
  user_rules : ip_rule_list; [@ocaml.doc "One or more rules.\n"]
}
[@@ocaml.doc ""]

type nonrec update_workspace_bundle_result = unit [@@ocaml.doc ""]

type nonrec update_workspace_bundle_request = {
  bundle_id : bundle_id option; [@ocaml.doc "The identifier of the bundle.\n"]
  image_id : workspace_image_id option; [@ocaml.doc "The identifier of the image.\n"]
}
[@@ocaml.doc ""]

type nonrec update_workspace_image_permission_result = unit [@@ocaml.doc ""]

type nonrec update_workspace_image_permission_request = {
  image_id : workspace_image_id; [@ocaml.doc "The identifier of the image.\n"]
  allow_copy_image : boolean_object;
      [@ocaml.doc
        "The permission to copy the image. This permission can be revoked only after an image has \
         been shared.\n"]
  shared_account_id : aws_account;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account to share or unshare the image with.\n\n\
        \  Before sharing the image, confirm that you are sharing to the correct Amazon Web \
         Services account ID.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec update_workspaces_pool_result = {
  workspaces_pool : workspaces_pool option; [@ocaml.doc "Describes the specified pool.\n"]
}
[@@ocaml.doc ""]

type nonrec update_workspaces_pool_request = {
  pool_id : workspaces_pool_id; [@ocaml.doc "The identifier of the specified pool to update.\n"]
  description : update_description option; [@ocaml.doc "Describes the specified pool to update.\n"]
  bundle_id : bundle_id option; [@ocaml.doc "The identifier of the bundle.\n"]
  directory_id : directory_id option; [@ocaml.doc "The identifier of the directory.\n"]
  capacity : capacity option; [@ocaml.doc "The desired capacity for the pool.\n"]
  application_settings : application_settings_request option;
      [@ocaml.doc "The persistent application settings for users in the pool.\n"]
  timeout_settings : timeout_settings option;
      [@ocaml.doc "Indicates the timeout settings of the specified pool.\n"]
  running_mode : pools_running_mode option;
      [@ocaml.doc
        "The desired running mode for the pool. The running mode can only be updated when the pool \
         is in a stopped state.\n"]
}
[@@ocaml.doc ""]
