type nonrec string_ = string [@@ocaml.doc ""]

type nonrec access_endpoint_type = STREAMING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec access_endpoint = {
  endpoint_type : access_endpoint_type; [@ocaml.doc "The type of interface endpoint.\n"]
  vpce_id : string_ option;
      [@ocaml.doc "The identifier (ID) of the VPC in which the interface endpoint is used.\n"]
}
[@@ocaml.doc
  "Describes an interface VPC endpoint (interface endpoint) that lets you create a private \
   connection between the virtual private cloud (VPC) that you specify and WorkSpaces \
   Applications. When you specify an interface endpoint for a stack, users of the stack can \
   connect to WorkSpaces Applications only through that endpoint. When you specify an interface \
   endpoint for an image builder, administrators can connect to the image builder only through \
   that endpoint.\n"]

type nonrec access_endpoint_list = access_endpoint list [@@ocaml.doc ""]

type nonrec account_name = string [@@ocaml.doc ""]

type nonrec account_password = string [@@ocaml.doc ""]

type nonrec action =
  | CLIPBOARD_COPY_FROM_LOCAL_DEVICE [@ocaml.doc ""]
  | CLIPBOARD_COPY_TO_LOCAL_DEVICE [@ocaml.doc ""]
  | FILE_UPLOAD [@ocaml.doc ""]
  | FILE_DOWNLOAD [@ocaml.doc ""]
  | PRINTING_TO_LOCAL_DEVICE [@ocaml.doc ""]
  | DOMAIN_PASSWORD_SIGNIN [@ocaml.doc ""]
  | DOMAIN_SMART_CARD_SIGNIN [@ocaml.doc ""]
  | AUTO_TIME_ZONE_REDIRECTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec admin_app_license_usage_record = {
  user_arn : string_;
      [@ocaml.doc "The ARN of the user who used the license-included application.\n"]
  billing_period : string_; [@ocaml.doc "The billing period for the license usage record.\n"]
  owner_aws_account_id : aws_account_id;
      [@ocaml.doc "The account ID of the owner of the license.\n"]
  subscription_first_used_date : timestamp;
      [@ocaml.doc "The date and time when the license was first used.\n"]
  subscription_last_used_date : timestamp;
      [@ocaml.doc "The date and time when the license was last used.\n"]
  license_type : string_; [@ocaml.doc "The type of license (for example, Microsoft Office).\n"]
  user_id : string_; [@ocaml.doc "The ID of the user who used the license-included application.\n"]
}
[@@ocaml.doc "The collection of license usage records.\n"]

type nonrec admin_app_license_usage_list = admin_app_license_usage_record list [@@ocaml.doc ""]

type nonrec user_control_mode =
  | VIEW_ONLY [@ocaml.doc ""]
  | VIEW_STOP [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc
  "The user control mode for agent sessions.\n\n\
  \ {ul\n\
  \       {-  VIEW_ONLY - Users can view and observe agent actions as they happen.\n\
  \           \n\
  \            }\n\
  \       {-  VIEW_STOP - Users can view agent actions and stop the agent if needed.\n\
  \           \n\
  \            }\n\
  \       {-  DISABLED - Users cannot view or stop the agent session.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec screen_image_format = PNG [@ocaml.doc ""] | JPEG [@ocaml.doc ""]
[@@ocaml.doc
  "The image format for agent screen captures.\n\n\
  \ {ul\n\
  \       {-  PNG - PNG format.\n\
  \           \n\
  \            }\n\
  \       {-  JPEG - JPEG format.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec screen_resolution = W_1280xH_720 [@ocaml.doc ""]
[@@ocaml.doc
  "The screen resolution for the agent streaming environment.\n\n\
  \ {ul\n\
  \       {-  W_1280xH_720 - 1280 x 720 pixels.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec boolean_object = bool [@@ocaml.doc ""]

type nonrec s3_bucket_arn = string [@@ocaml.doc ""]

type nonrec permission = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec agent_action =
  | COMPUTER_VISION [@ocaml.doc ""]
  | COMPUTER_INPUT [@ocaml.doc ""]
  | FORWARD_MCP_TOOLS [@ocaml.doc ""]
[@@ocaml.doc
  "The type of agent action.\n\n\
  \ {ul\n\
  \       {-  COMPUTER_VISION - Allows agents to take screenshots of the desktop.\n\
  \           \n\
  \            }\n\
  \       {-  COMPUTER_INPUT - Allows agents to click, type, and scroll on the desktop. Requires \
   COMPUTER_VISION to also be enabled.\n\
  \           \n\
  \            }\n\
  \       {-  FORWARD_MCP_TOOLS - Allows agents to interact with applications and the desktop \
   operating system through direct MCP calls rather than using computer use tools. Forwards MCP \
   tools configured on the WorkSpaces application session to the agent.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec agent_access_setting = {
  agent_action : agent_action;
      [@ocaml.doc
        "The agent action to configure. Valid values are COMPUTER_VISION, COMPUTER_INPUT, and \
         FORWARD_MCP_TOOLS. If you enable COMPUTER_INPUT, you must also enable COMPUTER_VISION.\n"]
  permission : permission; [@ocaml.doc "Whether the agent action is enabled or disabled.\n"]
}
[@@ocaml.doc
  "A permission setting for an agent action. Each setting specifies an agent action and whether it \
   is enabled or disabled.\n"]

type nonrec agent_access_setting_list = agent_access_setting list [@@ocaml.doc ""]

type nonrec agent_access_config = {
  settings : agent_access_setting_list;
      [@ocaml.doc
        "The list of agent access settings that define permissions for each agent action. You must \
         specify at least one setting.\n"]
  s3_bucket_arn : s3_bucket_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon S3 bucket where agent screenshots are \
         stored. Required when ScreenshotsUploadEnabled is true.\n"]
  screenshots_upload_enabled : boolean_object option;
      [@ocaml.doc
        "Indicates whether screenshot uploads to Amazon S3 are enabled for agent sessions.\n"]
  screen_resolution : screen_resolution;
      [@ocaml.doc "The screen resolution for the agent streaming environment.\n"]
  screen_image_format : screen_image_format;
      [@ocaml.doc "The image format for agent screen captures.\n"]
  user_control_mode : user_control_mode option;
      [@ocaml.doc
        "The user control mode for agent sessions. This setting determines how users can interact \
         with agent sessions.\n"]
}
[@@ocaml.doc
  "The configuration for agent access on a stack. Agent access enables AI agents to interact with \
   desktop applications during streaming sessions.\n"]

type nonrec agent_access_config_for_update = {
  settings : agent_access_setting_list option;
      [@ocaml.doc
        "The list of agent access settings that define permissions for each agent action.\n"]
  s3_bucket_arn : s3_bucket_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon S3 bucket where agent screenshots are stored.\n"]
  screenshots_upload_enabled : boolean_object option;
      [@ocaml.doc
        "Indicates whether screenshot uploads to Amazon S3 are enabled for agent sessions.\n"]
  screen_resolution : screen_resolution option;
      [@ocaml.doc "The screen resolution for the agent streaming environment.\n"]
  screen_image_format : screen_image_format option;
      [@ocaml.doc "The image format for agent screen captures.\n"]
  user_control_mode : user_control_mode option;
      [@ocaml.doc
        "The user control mode for agent sessions. This setting determines how users can interact \
         with agent sessions.\n"]
}
[@@ocaml.doc
  "The configuration for updating agent access on a stack. This type supports partial updates, so \
   you only need to specify the fields you want to change.\n"]

type nonrec agent_software_version =
  | CURRENT_LATEST [@ocaml.doc ""]
  | ALWAYS_LATEST [@ocaml.doc ""]
[@@ocaml.doc "The image type is the type of AppStream image resource."]

type nonrec ami_name = string [@@ocaml.doc ""]

type nonrec error_details = {
  error_code : string_ option; [@ocaml.doc "The error code.\n"]
  error_message : string_ option; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "The error details.\n"]

type nonrec error_details_list = error_details list [@@ocaml.doc ""]

type nonrec app_block_state = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec packaging_type = CUSTOM [@ocaml.doc ""] | APPSTREAM2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_location = {
  s3_bucket : s3_bucket; [@ocaml.doc "The S3 bucket of the S3 object.\n"]
  s3_key : s3_key option;
      [@ocaml.doc
        "The S3 key of the S3 object.\n\n\
        \ This is required when used for the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  IconS3Location (Actions: CreateApplication and UpdateApplication)\n\
        \            \n\
        \             }\n\
        \        {-  SessionScriptS3Location (Actions: CreateFleet and UpdateFleet)\n\
        \            \n\
        \             }\n\
        \        {-  ScriptDetails (Actions: CreateAppBlock)\n\
        \            \n\
        \             }\n\
        \        {-  SourceS3Location when creating an app block with [CUSTOM] PackagingType \
         (Actions: CreateAppBlock)\n\
        \            \n\
        \             }\n\
        \        {-  SourceS3Location when creating an app block with [APPSTREAM2] PackagingType, \
         and using an existing application package (VHD file). In this case, [S3Key] refers to the \
         VHD file. If a new application package is required, then [S3Key] is not required. \
         (Actions: CreateAppBlock)\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Describes the S3 location.\n"]

type nonrec script_details = {
  script_s3_location : s3_location; [@ocaml.doc "The S3 object location for the script.\n"]
  executable_path : string_; [@ocaml.doc "The run path for the script.\n"]
  executable_parameters : string_ option;
      [@ocaml.doc "The runtime parameters passed to the run path for the script.\n"]
  timeout_in_seconds : integer; [@ocaml.doc "The run timeout, in seconds, for the script.\n"]
}
[@@ocaml.doc "Describes the details of the script.\n"]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec app_block = {
  name : string_; [@ocaml.doc "The name of the app block.\n"]
  arn : arn; [@ocaml.doc "The ARN of the app block.\n"]
  description : string_ option; [@ocaml.doc "The description of the app block.\n"]
  display_name : string_ option; [@ocaml.doc "The display name of the app block.\n"]
  source_s3_location : s3_location option; [@ocaml.doc "The source S3 location of the app block.\n"]
  setup_script_details : script_details option;
      [@ocaml.doc
        "The setup script details of the app block.\n\n\
        \ This only applies to app blocks with PackagingType [CUSTOM].\n\
        \ "]
  created_time : timestamp option; [@ocaml.doc "The created time of the app block.\n"]
  post_setup_script_details : script_details option;
      [@ocaml.doc
        "The post setup script details of the app block.\n\n\
        \ This only applies to app blocks with PackagingType [APPSTREAM2].\n\
        \ "]
  packaging_type : packaging_type option; [@ocaml.doc "The packaging type of the app block.\n"]
  state : app_block_state option;
      [@ocaml.doc
        "The state of the app block.\n\n\
        \ An app block with WorkSpaces Applications packaging will be in the [INACTIVE] state if \
         no application package (VHD) is assigned to it. After an application package (VHD) is \
         created by an app block builder for an app block, it becomes [ACTIVE]. \n\
        \ \n\
        \  Custom app blocks are always in the [ACTIVE] state and no action is required to use them.\n\
        \  "]
  app_block_errors : error_details_list option; [@ocaml.doc "The errors of the app block.\n"]
}
[@@ocaml.doc
  "Describes an app block.\n\n\
  \ App blocks are a WorkSpaces Applications resource that stores the details about the virtual \
   hard disk in an S3 bucket. It also stores the setup script with details about how to mount the \
   virtual hard disk. The virtual hard disk includes the application binaries and other files \
   necessary to launch your applications. Multiple applications can be assigned to a single app \
   block.\n\
  \ \n\
  \  This is only supported for Elastic fleets.\n\
  \  "]

type nonrec app_block_builder_state_change_reason_code = INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec app_block_builder_state_change_reason = {
  code : app_block_builder_state_change_reason_code option;
      [@ocaml.doc "The state change reason code.\n"]
  message : string_ option; [@ocaml.doc "The state change reason message.\n"]
}
[@@ocaml.doc "Describes the reason why the last app block builder state change occurred.\n"]

type nonrec fleet_error_code =
  | IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION [@ocaml.doc ""]
  | NETWORK_INTERFACE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | INTERNAL_SERVICE_ERROR [@ocaml.doc ""]
  | IAM_SERVICE_ROLE_IS_MISSING [@ocaml.doc ""]
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
  | FLEET_STOPPED [@ocaml.doc ""]
  | FLEET_INSTANCE_PROVISIONING_FAILURE [@ocaml.doc ""]
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
  | VALIDATION_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_error = {
  error_code : fleet_error_code option; [@ocaml.doc "The error code.\n"]
  error_message : string_ option; [@ocaml.doc "The error message.\n"]
  error_timestamp : timestamp option; [@ocaml.doc "The time the error occurred.\n"]
}
[@@ocaml.doc "Describes a resource error.\n"]

type nonrec resource_errors = resource_error list [@@ocaml.doc ""]

type nonrec app_block_builder_state =
  | STARTING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec security_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec subnet_id_list = string_ list [@@ocaml.doc ""]

type nonrec vpc_config = {
  subnet_ids : subnet_id_list option;
      [@ocaml.doc
        "The identifiers of the subnets to which a network interface is attached from the fleet \
         instance or image builder instance. Fleet instances use one or more subnets. Image \
         builder instances use one subnet.\n"]
  security_group_ids : security_group_id_list option;
      [@ocaml.doc "The identifiers of the security groups for the fleet or image builder.\n"]
}
[@@ocaml.doc "Describes VPC configuration information for fleets and image builders.\n"]

type nonrec app_block_builder_platform_type = WINDOWS_SERVER_2019 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec app_block_builder = {
  arn : arn; [@ocaml.doc "The ARN of the app block builder.\n"]
  name : string_; [@ocaml.doc "The name of the app block builder.\n"]
  display_name : string_ option; [@ocaml.doc "The display name of the app block builder.\n"]
  description : string_ option; [@ocaml.doc "The description of the app block builder.\n"]
  platform : app_block_builder_platform_type;
      [@ocaml.doc
        "The platform of the app block builder.\n\n\
        \  [WINDOWS_SERVER_2019] is the only valid value.\n\
        \ "]
  instance_type : string_; [@ocaml.doc "The instance type of the app block builder.\n"]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc
        "Indicates whether default internet access is enabled for the app block builder.\n"]
  iam_role_arn : arn option;
      [@ocaml.doc "The ARN of the IAM role that is applied to the app block builder.\n"]
  vpc_config : vpc_config; [@ocaml.doc "The VPC configuration for the app block builder.\n"]
  state : app_block_builder_state; [@ocaml.doc "The state of the app block builder.\n"]
  created_time : timestamp option; [@ocaml.doc "The creation time of the app block builder.\n"]
  app_block_builder_errors : resource_errors option; [@ocaml.doc "The app block builder errors.\n"]
  state_change_reason : app_block_builder_state_change_reason option;
      [@ocaml.doc "The state change reason.\n"]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of interface VPC endpoint (interface endpoint) objects. Administrators can \
         connect to the app block builder only through the specified endpoints.\n"]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Indicates whether Instance Metadata Service Version 1 (IMDSv1) is disabled for the app \
         block builder.\n"]
}
[@@ocaml.doc "Describes an app block builder.\n"]

type nonrec name = string [@@ocaml.doc ""]

type nonrec app_block_builder_app_block_association = {
  app_block_arn : arn; [@ocaml.doc "The ARN of the app block.\n"]
  app_block_builder_name : name; [@ocaml.doc "The name of the app block builder.\n"]
}
[@@ocaml.doc "Describes an association between an app block builder and app block.\n"]

type nonrec app_block_builder_app_block_associations_list =
  app_block_builder_app_block_association list
[@@ocaml.doc ""]

type nonrec app_block_builder_attribute =
  | IAM_ROLE_ARN [@ocaml.doc ""]
  | ACCESS_ENDPOINTS [@ocaml.doc ""]
  | VPC_CONFIGURATION_SECURITY_GROUP_IDS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec app_block_builder_attributes = app_block_builder_attribute list [@@ocaml.doc ""]

type nonrec app_block_builder_list = app_block_builder list [@@ocaml.doc ""]

type nonrec app_blocks = app_block list [@@ocaml.doc ""]

type nonrec launch_parameters = string [@@ocaml.doc ""]

type nonrec file_path = string [@@ocaml.doc ""]

type nonrec app_display_name = string [@@ocaml.doc ""]

type nonrec app_name = string [@@ocaml.doc ""]

type nonrec application_config = {
  name : app_name;
      [@ocaml.doc
        "The name of the application. This is a required field that must be unique within the \
         application catalog and between 1-100 characters, matching the pattern \
         ^\\[a-zA-Z0-9\\]\\[a-zA-Z0-9_.-\\]\\{0,99\\}$.\n"]
  display_name : app_display_name option;
      [@ocaml.doc
        "The display name shown to users for this application. This field is optional and can be \
         0-100 characters, matching the pattern ^\\[a-zA-Z0-9\\]\\[a-zA-Z0-9_. -\\]\\{0,99\\}$.\n"]
  absolute_app_path : file_path;
      [@ocaml.doc
        "The absolute path to the executable file that launches the application. This is a \
         required field that can be 1-32767 characters to support Windows extended file paths. Use \
         escaped file path strings like \"C:\\\\\\\\Windows\\\\\\\\System32\\\\\\\\notepad.exe\".\n"]
  absolute_icon_path : file_path option;
      [@ocaml.doc
        "The absolute path to the icon file for the application. This field is optional and can be \
         1-32767 characters. If not provided, the icon is derived from the executable. Use PNG \
         images with proper transparency for the best user experience.\n"]
  absolute_manifest_path : file_path option;
      [@ocaml.doc
        "The absolute path to the prewarm manifest file for this application. This field is \
         optional and only applicable when using application-specific manifests. The path can be \
         1-32767 characters and should point to a text file containing file paths to prewarm.\n"]
  working_directory : file_path option;
      [@ocaml.doc
        "The working directory to use when launching the application. This field is optional and \
         can be 0-32767 characters. Use escaped file path strings like \
         \"C:\\\\\\\\Path\\\\\\\\To\\\\\\\\Working\\\\\\\\Directory\".\n"]
  launch_parameters : launch_parameters option;
      [@ocaml.doc
        "The launch parameters to pass to the application executable. This field is optional and \
         can be 0-1024 characters. Use escaped strings with the full list of required parameters, \
         such as PowerShell script paths or command-line arguments.\n"]
}
[@@ocaml.doc
  "Configuration for an application in the imported image's application catalog. This structure \
   defines how applications appear and launch for users.\n"]

type nonrec app_catalog_config = application_config list [@@ocaml.doc ""]

type nonrec app_visibility = ALL [@ocaml.doc ""] | ASSOCIATED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec platform_type =
  | WINDOWS [@ocaml.doc ""]
  | WINDOWS_SERVER_2016 [@ocaml.doc ""]
  | WINDOWS_SERVER_2019 [@ocaml.doc ""]
  | WINDOWS_SERVER_2022 [@ocaml.doc ""]
  | WINDOWS_SERVER_2025 [@ocaml.doc ""]
  | AMAZON_LINUX2 [@ocaml.doc ""]
  | RHEL8 [@ocaml.doc ""]
  | ROCKY_LINUX8 [@ocaml.doc ""]
  | UBUNTU_PRO_2404 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec platforms = platform_type list [@@ocaml.doc ""]

type nonrec metadata = (string_ * string_) list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec application = {
  name : string_ option; [@ocaml.doc "The name of the application.\n"]
  display_name : string_ option; [@ocaml.doc "The application name to display.\n"]
  icon_ur_l : string_ option;
      [@ocaml.doc "The URL for the application icon. This URL might be time-limited.\n"]
  launch_path : string_ option;
      [@ocaml.doc "The path to the application executable in the instance.\n"]
  launch_parameters : string_ option;
      [@ocaml.doc "The arguments that are passed to the application at launch.\n"]
  enabled : boolean_ option;
      [@ocaml.doc "If there is a problem, the application can be disabled after image creation.\n"]
  metadata : metadata option; [@ocaml.doc "Additional attributes that describe the application.\n"]
  working_directory : string_ option; [@ocaml.doc "The working directory for the application.\n"]
  description : string_ option; [@ocaml.doc "The description of the application.\n"]
  arn : arn option; [@ocaml.doc "The ARN of the application.\n"]
  app_block_arn : arn option; [@ocaml.doc "The app block ARN of the application.\n"]
  icon_s3_location : s3_location option; [@ocaml.doc "The S3 location of the application icon.\n"]
  platforms : platforms option; [@ocaml.doc "The platforms on which the application can run.\n"]
  instance_families : string_list option;
      [@ocaml.doc "The instance families for the application.\n"]
  created_time : timestamp option;
      [@ocaml.doc "The time at which the application was created within the app block.\n"]
}
[@@ocaml.doc "Describes an application in the application catalog.\n"]

type nonrec application_attribute =
  | LAUNCH_PARAMETERS [@ocaml.doc ""]
  | WORKING_DIRECTORY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec application_attributes = application_attribute list [@@ocaml.doc ""]

type nonrec application_fleet_association = {
  fleet_name : string_; [@ocaml.doc "The name of the fleet associated with the application.\n"]
  application_arn : arn; [@ocaml.doc "The ARN of the application associated with the fleet.\n"]
}
[@@ocaml.doc "Describes the application fleet association.\n"]

type nonrec application_fleet_association_list = application_fleet_association list [@@ocaml.doc ""]

type nonrec settings_group = string [@@ocaml.doc ""]

type nonrec application_settings = {
  enabled : boolean_;
      [@ocaml.doc
        "Enables or disables persistent application settings for users during their streaming \
         sessions. \n"]
  settings_group : settings_group option;
      [@ocaml.doc
        "The path prefix for the S3 bucket where users\226\128\153 persistent application settings \
         are stored. You can allow the same persistent application settings to be used across \
         multiple stacks by specifying the same settings group for each stack. \n"]
}
[@@ocaml.doc "The persistent application settings for users of a stack.\n"]

type nonrec application_settings_response = {
  enabled : boolean_ option;
      [@ocaml.doc
        "Specifies whether persistent application settings are enabled for users during their \
         streaming sessions.\n"]
  settings_group : settings_group option;
      [@ocaml.doc
        "The path prefix for the S3 bucket where users\226\128\153 persistent application settings \
         are stored.\n"]
  s3_bucket_name : string_ option;
      [@ocaml.doc
        "The S3 bucket where users\226\128\153 persistent application settings are stored. When \
         persistent application settings are enabled for the first time for an account in an AWS \
         Region, an S3 bucket is created. The bucket is unique to the AWS account and the Region. \n"]
}
[@@ocaml.doc "Describes the persistent application settings for users of a stack.\n"]

type nonrec applications = application list [@@ocaml.doc ""]

type nonrec appstream_agent_version = string [@@ocaml.doc ""]

type nonrec arn_list = arn list [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource was not found.\n"]

type nonrec operation_not_permitted_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The attempted operation is not permitted.\n"]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested limit exceeds the permitted limit for an account.\n"]

type nonrec invalid_parameter_combination_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates an incorrect combination of parameters, or a missing parameter.\n"]

type nonrec concurrent_modification_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An API error occurred. Wait a few minutes and try again.\n"]

type nonrec associate_app_block_builder_app_block_result = {
  app_block_builder_app_block_association : app_block_builder_app_block_association option;
      [@ocaml.doc "The list of app block builders associated with app blocks.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_app_block_builder_app_block_request = {
  app_block_arn : arn; [@ocaml.doc "The ARN of the app block.\n"]
  app_block_builder_name : name; [@ocaml.doc "The name of the app block builder.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_application_fleet_result = {
  application_fleet_association : application_fleet_association option;
      [@ocaml.doc
        "If fleet name is specified, this returns the list of applications that are associated to \
         it. If application ARN is specified, this returns the list of fleets to which it is \
         associated.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_application_fleet_request = {
  fleet_name : name; [@ocaml.doc "The name of the fleet.\n"]
  application_arn : arn; [@ocaml.doc "The ARN of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec entitlement_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The entitlement can't be found.\n"]

type nonrec associate_application_to_entitlement_result = unit [@@ocaml.doc ""]

type nonrec associate_application_to_entitlement_request = {
  stack_name : name; [@ocaml.doc "The name of the stack.\n"]
  entitlement_name : name; [@ocaml.doc "The name of the entitlement.\n"]
  application_identifier : string_; [@ocaml.doc "The identifier of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_account_status_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource cannot be created because your AWS account is suspended. For assistance, contact \
   AWS Support. \n"]

type nonrec incompatible_image_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The image can't be updated because it's not compatible for updates.\n"]

type nonrec associate_fleet_result = unit [@@ocaml.doc ""]

type nonrec associate_fleet_request = {
  fleet_name : string_; [@ocaml.doc "The name of the fleet. \n"]
  stack_name : string_; [@ocaml.doc "The name of the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_software_to_image_builder_result = unit [@@ocaml.doc ""]

type nonrec associate_software_to_image_builder_request = {
  image_builder_name : name; [@ocaml.doc "The name of the target image builder instance.\n"]
  software_names : string_list;
      [@ocaml.doc
        "The list of license included applications to associate with the image builder.\n\n\
        \ Possible values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec authentication_type =
  | API [@ocaml.doc ""]
  | SAML [@ocaml.doc ""]
  | USERPOOL [@ocaml.doc ""]
  | AWS_AD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_account_id_list = aws_account_id list [@@ocaml.doc ""]

type nonrec user_stack_association_error_code =
  | STACK_NOT_FOUND [@ocaml.doc ""]
  | USER_NAME_NOT_FOUND [@ocaml.doc ""]
  | DIRECTORY_NOT_FOUND [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec username = string [@@ocaml.doc ""]

type nonrec user_stack_association = {
  stack_name : string_; [@ocaml.doc "The name of the stack that is associated with the user.\n"]
  user_name : username;
      [@ocaml.doc
        "The email address of the user who is associated with the stack.\n\n\
        \  Users' email addresses are case-sensitive.\n\
        \  \n\
        \   "]
  authentication_type : authentication_type; [@ocaml.doc "The authentication type for the user.\n"]
  send_email_notification : boolean_ option;
      [@ocaml.doc
        "Specifies whether a welcome email is sent to a user after the user is created in the user \
         pool.\n"]
}
[@@ocaml.doc "Describes a user in the user pool and the associated stack.\n"]

type nonrec user_stack_association_error = {
  user_stack_association : user_stack_association option;
      [@ocaml.doc "Information about the user and associated stack.\n"]
  error_code : user_stack_association_error_code option;
      [@ocaml.doc
        "The error code for the error that is returned when a user can\226\128\153t be associated \
         with or disassociated from a stack.\n"]
  error_message : string_ option;
      [@ocaml.doc
        "The error message for the error that is returned when a user can\226\128\153t be \
         associated with or disassociated from a stack.\n"]
}
[@@ocaml.doc
  "Describes the error that is returned when a user can\226\128\153t be associated with or \
   disassociated from a stack. \n"]

type nonrec user_stack_association_error_list = user_stack_association_error list [@@ocaml.doc ""]

type nonrec batch_associate_user_stack_result = {
  errors : user_stack_association_error_list option;
      [@ocaml.doc "The list of UserStackAssociationError objects.\n"]
}
[@@ocaml.doc ""]

type nonrec user_stack_association_list = user_stack_association list [@@ocaml.doc ""]

type nonrec batch_associate_user_stack_request = {
  user_stack_associations : user_stack_association_list;
      [@ocaml.doc "The list of UserStackAssociation objects.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_disassociate_user_stack_result = {
  errors : user_stack_association_error_list option;
      [@ocaml.doc "The list of UserStackAssociationError objects.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_disassociate_user_stack_request = {
  user_stack_associations : user_stack_association_list;
      [@ocaml.doc "The list of UserStackAssociation objects.\n"]
}
[@@ocaml.doc ""]

type nonrec certificate_based_auth_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLED_NO_DIRECTORY_LOGIN_FALLBACK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_based_auth_properties = {
  status : certificate_based_auth_status option;
      [@ocaml.doc "The status of the certificate-based authentication properties.\n"]
  certificate_authority_arn : arn option;
      [@ocaml.doc "The ARN of the AWS Certificate Manager Private CA resource.\n"]
}
[@@ocaml.doc
  "The certificate-based authentication properties used to authenticate SAML 2.0 Identity Provider \
   (IdP) user identities to Active Directory domain-joined streaming instances. Fallback is turned \
   on by default when certificate-based authentication is {b Enabled} . Fallback allows users to \
   log in using their AD domain password if certificate-based authentication is unsuccessful, or \
   to unlock a desktop lock screen. {b Enabled_no_directory_login_fallback} enables \
   certificate-based authentication, but does not allow users to log in using their AD domain \
   password. Users will be disconnected to re-authenticate using certificates.\n"]

type nonrec compute_capacity = {
  desired_instances : integer option; [@ocaml.doc "The desired number of streaming instances.\n"]
  desired_sessions : integer option;
      [@ocaml.doc
        "The desired number of user sessions for a multi-session fleet. This is not allowed for \
         single-session fleets.\n\n\
        \ When you create a fleet, you must set either the DesiredSessions or DesiredInstances \
         attribute, based on the type of fleet you create. You can\226\128\153t define both \
         attributes or leave both attributes blank.\n\
        \ "]
}
[@@ocaml.doc "Describes the capacity for a fleet.\n"]

type nonrec compute_capacity_status = {
  desired : integer; [@ocaml.doc "The desired number of streaming instances.\n"]
  running : integer option;
      [@ocaml.doc "The total number of simultaneous streaming instances that are running.\n"]
  in_use : integer option; [@ocaml.doc "The number of instances in use for streaming.\n"]
  available : integer option;
      [@ocaml.doc
        "The number of currently available instances that can be used to stream sessions.\n"]
  desired_user_sessions : integer option;
      [@ocaml.doc
        "The total number of sessions slots that are either running or pending. This represents \
         the total number of concurrent streaming sessions your fleet can support in a steady \
         state.\n\n\
        \ DesiredUserSessionCapacity = ActualUserSessionCapacity + PendingUserSessionCapacity\n\
        \ \n\
        \  This only applies to multi-session fleets.\n\
        \  "]
  available_user_sessions : integer option;
      [@ocaml.doc
        "The number of idle session slots currently available for user sessions.\n\n\
        \ AvailableUserSessionCapacity = ActualUserSessionCapacity - ActiveUserSessions\n\
        \ \n\
        \  This only applies to multi-session fleets.\n\
        \  "]
  active_user_sessions : integer option;
      [@ocaml.doc
        "The number of user sessions currently being used for streaming sessions. This only \
         applies to multi-session fleets.\n"]
  actual_user_sessions : integer option;
      [@ocaml.doc
        "The total number of session slots that are available for streaming or are currently \
         streaming.\n\n\
        \ ActualUserSessionCapacity = AvailableUserSessionCapacity + ActiveUserSessions\n\
        \ \n\
        \  This only applies to multi-session fleets.\n\
        \  "]
  draining : integer option;
      [@ocaml.doc
        "The number of instances in drain mode. This only applies to multi-session fleets.\n"]
  drain_mode_active_user_sessions : integer option;
      [@ocaml.doc
        "The number of active user sessions on instances in drain mode. This only applies to \
         multi-session fleets.\n"]
  drain_mode_unused_user_sessions : integer option;
      [@ocaml.doc
        "The number of unused session slots on instances in drain mode that cannot be used for \
         user session provisioning. This only applies to multi-session fleets.\n"]
}
[@@ocaml.doc "Describes the capacity status for a fleet.\n"]

type nonrec url_pattern = string [@@ocaml.doc ""]

type nonrec url_pattern_list = url_pattern list [@@ocaml.doc ""]

type nonrec url_redirection_config = {
  enabled : boolean_object; [@ocaml.doc "Whether URL redirection is enabled for this direction.\n"]
  allowed_urls : url_pattern_list option;
      [@ocaml.doc
        "List of URL patterns that are allowed to be redirected. URLs matching these patterns will \
         be redirected unless they also match a pattern in the denied list.\n"]
  denied_urls : url_pattern_list option;
      [@ocaml.doc
        "List of URL patterns that are denied from redirection. This list takes precedence over \
         the allowed list.\n"]
}
[@@ocaml.doc
  "Configuration for URL redirection in a specific direction (host-to-client or client-to-host). \
   When enabled, URLs matching the allowed or denied patterns are redirected accordingly. The \
   denied list takes precedence over the allowed list.\n"]

type nonrec content_redirection = {
  host_to_client : url_redirection_config option;
      [@ocaml.doc
        "Configuration for redirecting URLs from the remote desktop to the local client browser.\n"]
}
[@@ocaml.doc
  "Configuration for bidirectional URL redirection between the streaming session and the local \
   client. Use HostToClient to redirect URLs from the remote desktop to the local browser.\n"]

type nonrec resource_not_available_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource exists and is not in use, but isn't available.\n"]

type nonrec resource_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource already exists.\n"]

type nonrec copy_image_response = {
  destination_image_name : name option; [@ocaml.doc "The name of the destination image.\n"]
}
[@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec region_name = string [@@ocaml.doc ""]

type nonrec copy_image_request = {
  source_image_name : name; [@ocaml.doc "The name of the image to copy.\n"]
  destination_image_name : name;
      [@ocaml.doc "The name that the image will have when it is copied to the destination.\n"]
  destination_region : region_name;
      [@ocaml.doc
        "The destination region to which the image will be copied. This parameter is required, \
         even if you are copying an image within the same region.\n"]
  destination_image_description : description option;
      [@ocaml.doc
        "The description that the image will have when it is copied to the destination.\n"]
}
[@@ocaml.doc ""]

type nonrec create_app_block_result = {
  app_block : app_block option; [@ocaml.doc "The app block.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tags = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec display_name = string [@@ocaml.doc ""]

type nonrec create_app_block_request = {
  name : name; [@ocaml.doc "The name of the app block.\n"]
  description : description option; [@ocaml.doc "The description of the app block.\n"]
  display_name : display_name option;
      [@ocaml.doc "The display name of the app block. This is not displayed to the user.\n"]
  source_s3_location : s3_location; [@ocaml.doc "The source S3 location of the app block.\n"]
  setup_script_details : script_details option;
      [@ocaml.doc
        "The setup script details of the app block. This must be provided for the [CUSTOM] \
         PackagingType.\n"]
  tags : tags option; [@ocaml.doc "The tags assigned to the app block.\n"]
  post_setup_script_details : script_details option;
      [@ocaml.doc
        "The post setup script details of the app block. This can only be provided for the \
         [APPSTREAM2] PackagingType.\n"]
  packaging_type : packaging_type option; [@ocaml.doc "The packaging type of the app block.\n"]
}
[@@ocaml.doc ""]

type nonrec request_limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "WorkSpaces Applications can\226\128\153t process the request right now because the Describe \
   calls from your AWS account are being throttled by Amazon EC2. Try again later.\n"]

type nonrec invalid_role_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified role is invalid.\n"]

type nonrec create_app_block_builder_result = {
  app_block_builder : app_block_builder option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_app_block_builder_request = {
  name : name; [@ocaml.doc "The unique name for the app block builder.\n"]
  description : description option; [@ocaml.doc "The description of the app block builder.\n"]
  display_name : display_name option; [@ocaml.doc "The display name of the app block builder.\n"]
  tags : tags option;
      [@ocaml.doc
        "The tags to associate with the app block builder. A tag is a key-value pair, and the \
         value is optional. For example, Environment=Test. If you do not specify a value, \
         Environment=. \n\n\
        \ If you do not specify a value, the value is set to an empty string.\n\
        \ \n\
        \  Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, \
         and the following special characters: \n\
        \  \n\
        \   _ . : / = + \\ - \\@\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging \
         Your Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
        \    "]
  platform : app_block_builder_platform_type;
      [@ocaml.doc
        "The platform of the app block builder.\n\n\
        \  [WINDOWS_SERVER_2019] is the only valid value.\n\
        \ "]
  instance_type : string_;
      [@ocaml.doc
        "The instance type to use when launching the app block builder. The following instance \
         types are available:\n\n\
        \ {ul\n\
        \       {-  stream.standard.small\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.medium\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.2xlarge\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config;
      [@ocaml.doc
        "The VPC configuration for the app block builder.\n\n\
        \ App block builders require that you specify at least two subnets in different \
         availability zones.\n\
        \ "]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc "Enables or disables default internet access for the app block builder.\n"]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to apply to the app block builder. To \
         assume a role, the app block builder calls the AWS Security Token Service (STS) \
         [AssumeRole] API operation and passes the ARN of the role to use. The operation creates a \
         new session with temporary credentials. WorkSpaces Applications retrieves the temporary \
         credentials and creates the {b appstream_machine_role} credential profile on the \
         instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html}Using \
         an IAM Role to Grant Permissions to Applications and Scripts Running on WorkSpaces \
         Applications Streaming Instances} in the {i Amazon WorkSpaces Applications Administration \
         Guide}.\n\
        \ "]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of interface VPC endpoint (interface endpoint) objects. Administrators can \
         connect to the app block builder only through the specified endpoints.\n"]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Set to true to disable Instance Metadata Service Version 1 (IMDSv1) and enforce IMDSv2. \
         Set to false to enable both IMDSv1 and IMDSv2.\n"]
}
[@@ocaml.doc ""]

type nonrec create_app_block_builder_streaming_url_result = {
  streaming_ur_l : string_ option; [@ocaml.doc "The URL to start the streaming session.\n"]
  expires : timestamp option;
      [@ocaml.doc "The elapsed time, in seconds after the Unix epoch, when this URL expires.\n"]
}
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec create_app_block_builder_streaming_url_request = {
  app_block_builder_name : name; [@ocaml.doc "The name of the app block builder.\n"]
  validity : long option;
      [@ocaml.doc
        "The time that the streaming URL will be valid, in seconds. Specify a value between 1 and \
         604800 seconds. The default is 3600 seconds.\n"]
}
[@@ocaml.doc ""]

type nonrec create_application_result = { application : application option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec create_application_request = {
  name : name;
      [@ocaml.doc
        "The name of the application. This name is visible to users when display name is not \
         specified.\n"]
  display_name : display_name option;
      [@ocaml.doc
        "The display name of the application. This name is visible to users in the application \
         catalog.\n"]
  description : description option; [@ocaml.doc "The description of the application.\n"]
  icon_s3_location : s3_location; [@ocaml.doc "The location in S3 of the application icon.\n"]
  launch_path : string_; [@ocaml.doc "The launch path of the application.\n"]
  working_directory : string_ option; [@ocaml.doc "The working directory of the application.\n"]
  launch_parameters : string_ option; [@ocaml.doc "The launch parameters of the application.\n"]
  platforms : platforms;
      [@ocaml.doc
        "The platforms the application supports. WINDOWS_SERVER_2019, AMAZON_LINUX2 and \
         UBUNTU_PRO_2404 are supported for Elastic fleets.\n"]
  instance_families : string_list;
      [@ocaml.doc
        "The instance families the application supports. Valid values are GENERAL_PURPOSE and \
         GRAPHICS_G4.\n"]
  app_block_arn : arn;
      [@ocaml.doc "The app block ARN to which the application should be associated\n"]
  tags : tags option; [@ocaml.doc "The tags assigned to the application.\n"]
}
[@@ocaml.doc ""]

type nonrec service_account_credentials = {
  account_name : account_name;
      [@ocaml.doc
        "The user name of the account. This account must have the following privileges: create \
         computer objects, join computers to the domain, and change/reset the password on \
         descendant computer objects for the organizational units specified.\n"]
  account_password : account_password; [@ocaml.doc "The password for the account.\n"]
}
[@@ocaml.doc
  "Describes the credentials for the service account used by the fleet or image builder to connect \
   to the directory.\n"]

type nonrec organizational_unit_distinguished_name = string [@@ocaml.doc ""]

type nonrec organizational_unit_distinguished_names_list =
  organizational_unit_distinguished_name list
[@@ocaml.doc ""]

type nonrec directory_name = string [@@ocaml.doc ""]

type nonrec directory_config = {
  directory_name : directory_name;
      [@ocaml.doc "The fully qualified name of the directory (for example, corp.example.com).\n"]
  organizational_unit_distinguished_names : organizational_unit_distinguished_names_list option;
      [@ocaml.doc "The distinguished names of the organizational units for computer accounts.\n"]
  service_account_credentials : service_account_credentials option;
      [@ocaml.doc
        "The credentials for the service account used by the fleet or image builder to connect to \
         the directory.\n"]
  created_time : timestamp option;
      [@ocaml.doc "The time the directory configuration was created.\n"]
  certificate_based_auth_properties : certificate_based_auth_properties option;
      [@ocaml.doc
        "The certificate-based authentication properties used to authenticate SAML 2.0 Identity \
         Provider (IdP) user identities to Active Directory domain-joined streaming instances. \
         Fallback is turned on by default when certificate-based authentication is {b Enabled} . \
         Fallback allows users to log in using their AD domain password if certificate-based \
         authentication is unsuccessful, or to unlock a desktop lock screen. {b \
         Enabled_no_directory_login_fallback} enables certificate-based authentication, but does \
         not allow users to log in using their AD domain password. Users will be disconnected to \
         re-authenticate using certificates.\n"]
}
[@@ocaml.doc
  "Describes the configuration information required to join fleets and image builders to Microsoft \
   Active Directory domains.\n"]

type nonrec create_directory_config_result = {
  directory_config : directory_config option;
      [@ocaml.doc "Information about the directory configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_directory_config_request = {
  directory_name : directory_name;
      [@ocaml.doc "The fully qualified name of the directory (for example, corp.example.com).\n"]
  organizational_unit_distinguished_names : organizational_unit_distinguished_names_list;
      [@ocaml.doc "The distinguished names of the organizational units for computer accounts.\n"]
  service_account_credentials : service_account_credentials option;
      [@ocaml.doc
        "The credentials for the service account used by the fleet or image builder to connect to \
         the directory.\n"]
  certificate_based_auth_properties : certificate_based_auth_properties option;
      [@ocaml.doc
        "The certificate-based authentication properties used to authenticate SAML 2.0 Identity \
         Provider (IdP) user identities to Active Directory domain-joined streaming instances. \
         Fallback is turned on by default when certificate-based authentication is {b Enabled} . \
         Fallback allows users to log in using their AD domain password if certificate-based \
         authentication is unsuccessful, or to unlock a desktop lock screen. {b \
         Enabled_no_directory_login_fallback} enables certificate-based authentication, but does \
         not allow users to log in using their AD domain password. Users will be disconnected to \
         re-authenticate using certificates.\n"]
}
[@@ocaml.doc ""]

type nonrec entitlement_already_exists_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The entitlement already exists.\n"]

type nonrec entitlement_attribute = {
  name : string_;
      [@ocaml.doc
        "A supported AWS IAM SAML [PrincipalTag] attribute that is matched to the associated value \
         when a user identity federates into a WorkSpaces Applications SAML application.\n\n\
        \ The following are valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  roles\n\
        \            \n\
        \             }\n\
        \        {-  department \n\
        \            \n\
        \             }\n\
        \        {-  organization \n\
        \            \n\
        \             }\n\
        \        {-  groups \n\
        \            \n\
        \             }\n\
        \        {-  title \n\
        \            \n\
        \             }\n\
        \        {-  costCenter \n\
        \            \n\
        \             }\n\
        \        {-  userType\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    \n\
        \   "]
  value : string_;
      [@ocaml.doc
        "A value that is matched to a supported SAML attribute name when a user identity federates \
         into a WorkSpaces Applications SAML application. \n"]
}
[@@ocaml.doc
  "An attribute associated with an entitlement. Application entitlements work by matching a \
   supported SAML 2.0 attribute name to a value when a user identity federates to a WorkSpaces \
   Applications SAML application.\n"]

type nonrec entitlement_attribute_list = entitlement_attribute list [@@ocaml.doc ""]

type nonrec entitlement = {
  name : name; [@ocaml.doc "The name of the entitlement.\n"]
  stack_name : name;
      [@ocaml.doc "The name of the stack with which the entitlement is associated.\n"]
  description : description option; [@ocaml.doc "The description of the entitlement.\n"]
  app_visibility : app_visibility;
      [@ocaml.doc "Specifies whether all or selected apps are entitled.\n"]
  attributes : entitlement_attribute_list; [@ocaml.doc "The attributes of the entitlement.\n"]
  created_time : timestamp option; [@ocaml.doc "The time when the entitlement was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "The time when the entitlement was last modified.\n"]
}
[@@ocaml.doc
  "Specifies an entitlement. Entitlements control access to specific applications within a stack, \
   based on user attributes. Entitlements apply to SAML 2.0 federated user identities. WorkSpaces \
   Applications user pool and streaming URL users are entitled to all applications in a stack. \
   Entitlements don't apply to the desktop stream view application, or to applications managed by \
   a dynamic app provider using the Dynamic Application Framework.\n"]

type nonrec create_entitlement_result = {
  entitlement : entitlement option; [@ocaml.doc "The entitlement.\n"]
}
[@@ocaml.doc ""]

type nonrec create_entitlement_request = {
  name : name; [@ocaml.doc "The name of the entitlement.\n"]
  stack_name : name;
      [@ocaml.doc "The name of the stack with which the entitlement is associated.\n"]
  description : description option; [@ocaml.doc "The description of the entitlement.\n"]
  app_visibility : app_visibility;
      [@ocaml.doc "Specifies whether all or selected apps are entitled.\n"]
  attributes : entitlement_attribute_list; [@ocaml.doc "The attributes of the entitlement.\n"]
}
[@@ocaml.doc ""]

type nonrec photon_ami_id = string [@@ocaml.doc ""]

type nonrec export_image_task_state =
  | EXPORTING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec uui_d = string [@@ocaml.doc ""]

type nonrec export_image_task = {
  task_id : uui_d;
      [@ocaml.doc
        "The unique identifier for the export image task. Use this ID to track the task's progress \
         and retrieve its details.\n"]
  image_arn : arn; [@ocaml.doc "The ARN of the WorkSpaces Applications image being exported.\n"]
  ami_name : ami_name;
      [@ocaml.doc "The name of the EC2 AMI that will be created by this export task.\n"]
  created_date : timestamp;
      [@ocaml.doc "The date and time when the export image task was created.\n"]
  ami_description : description option;
      [@ocaml.doc "The description that will be applied to the exported EC2 AMI.\n"]
  state : export_image_task_state option;
      [@ocaml.doc
        "The current state of the export image task, such as PENDING, RUNNING, COMPLETED, or FAILED.\n"]
  ami_id : photon_ami_id option;
      [@ocaml.doc
        "The ID of the EC2 AMI that was created by this export task. This field is only populated \
         when the task completes successfully.\n"]
  tag_specifications : tags option;
      [@ocaml.doc "The tags that will be applied to the exported EC2 AMI.\n"]
  error_details : error_details_list option;
      [@ocaml.doc
        "Details about any errors that occurred during the export process. This field is only \
         populated when the task fails.\n"]
}
[@@ocaml.doc
  "Information about an export image task, including its current state, timestamps, and any error \
   details.\n"]

type nonrec create_export_image_task_result = {
  export_image_task : export_image_task option;
      [@ocaml.doc
        "Information about the export image task that was created, including the task ID and \
         initial state.\n"]
}
[@@ocaml.doc ""]

type nonrec create_export_image_task_request = {
  image_name : name;
      [@ocaml.doc
        "The name of the WorkSpaces Applications image to export. The image must be in an \
         available state and owned by your account.\n"]
  ami_name : ami_name;
      [@ocaml.doc
        "The name for the exported EC2 AMI. This is a required field that must be unique within \
         your account and region.\n"]
  iam_role_arn : arn;
      [@ocaml.doc
        "The ARN of the IAM role that allows WorkSpaces Applications to create the AMI. The role \
         must have permissions to copy images, describe images, and create tags, with a trust \
         relationship allowing appstream.amazonaws.com to assume the role.\n"]
  tag_specifications : tags option;
      [@ocaml.doc
        "The tags to apply to the exported AMI. These tags help you organize and manage your EC2 \
         AMIs.\n"]
  ami_description : description option;
      [@ocaml.doc
        "An optional description for the exported AMI. This description will be applied to the \
         resulting EC2 AMI.\n"]
}
[@@ocaml.doc ""]

type nonrec volume_config = {
  volume_size_in_gb : integer option;
      [@ocaml.doc
        "The size of the root volume in GB. Valid range is 200-500 GB. The default is 200 GB, \
         which is included in the hourly instance rate. Additional storage beyond 200 GB incurs \
         extra charges and applies to instances regardless of their running state.\n"]
}
[@@ocaml.doc
  "Configuration for the root volume of fleet instances and image builders. This allows you to \
   customize the storage capacity beyond the default 200 GB.\n"]

type nonrec usb_device_filter_string = string [@@ocaml.doc ""]

type nonrec usb_device_filter_strings = usb_device_filter_string list [@@ocaml.doc ""]

type nonrec stream_view = APP [@ocaml.doc ""] | DESKTOP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec domain_join_info = {
  directory_name : directory_name option;
      [@ocaml.doc "The fully qualified name of the directory (for example, corp.example.com).\n"]
  organizational_unit_distinguished_name : organizational_unit_distinguished_name option;
      [@ocaml.doc "The distinguished name of the organizational unit for computer accounts.\n"]
}
[@@ocaml.doc
  "Describes the configuration information required to join fleets and image builders to Microsoft \
   Active Directory domains.\n"]

type nonrec fleet_error = {
  error_code : fleet_error_code option; [@ocaml.doc "The error code.\n"]
  error_message : string_ option; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "Describes a fleet error.\n"]

type nonrec fleet_errors = fleet_error list [@@ocaml.doc ""]

type nonrec fleet_state =
  | STARTING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleet_type =
  | ALWAYS_ON [@ocaml.doc ""]
  | ON_DEMAND [@ocaml.doc ""]
  | ELASTIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fleet = {
  arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) for the fleet.\n"]
  name : string_; [@ocaml.doc "The name of the fleet.\n"]
  display_name : string_ option; [@ocaml.doc "The fleet name to display.\n"]
  description : string_ option; [@ocaml.doc "The description to display.\n"]
  image_name : string_ option; [@ocaml.doc "The name of the image used to create the fleet.\n"]
  image_arn : arn option; [@ocaml.doc "The ARN for the public, private, or shared image.\n"]
  instance_type : string_;
      [@ocaml.doc
        "The instance type to use when launching fleet instances. The following instance types are \
         available:\n\n\
        \ {ul\n\
        \       {-  stream.standard.small\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.medium\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.3xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.6xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  fleet_type : fleet_type option;
      [@ocaml.doc
        "The fleet type.\n\n\
        \  ALWAYS_ON  Provides users with instant-on access to their apps. You are charged for all \
         running instances in your fleet, even if no users are streaming apps.\n\
        \             \n\
        \               ON_DEMAND  Provide users with access to applications after they connect, \
         which takes one to two minutes. You are charged for instance streaming when users are \
         connected and a small hourly fee for instances that are not streaming apps.\n\
        \                          \n\
        \                            "]
  compute_capacity_status : compute_capacity_status;
      [@ocaml.doc "The capacity status for the fleet.\n"]
  max_user_duration_in_seconds : integer option;
      [@ocaml.doc
        "The maximum amount of time that a streaming session can remain active, in seconds. If \
         users are still connected to a streaming instance five minutes before this limit is \
         reached, they are prompted to save any open documents before being disconnected. After \
         this time elapses, the instance is terminated and replaced by a new instance. \n\n\
        \ Specify a value between 600 and 360000.\n\
        \ "]
  disconnect_timeout_in_seconds : integer option;
      [@ocaml.doc
        "The amount of time that a streaming session remains active after users disconnect. If \
         they try to reconnect to the streaming session after a disconnection or network \
         interruption within this time interval, they are connected to their previous session. \
         Otherwise, they are connected to a new session with a new streaming instance.\n\n\
        \ Specify a value between 60 and 36000.\n\
        \ "]
  state : fleet_state; [@ocaml.doc "The current state for the fleet.\n"]
  vpc_config : vpc_config option; [@ocaml.doc "The VPC configuration for the fleet.\n"]
  created_time : timestamp option; [@ocaml.doc "The time the fleet was created.\n"]
  fleet_errors : fleet_errors option; [@ocaml.doc "The fleet errors.\n"]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc "Indicates whether default internet access is enabled for the fleet.\n"]
  domain_join_info : domain_join_info option;
      [@ocaml.doc
        "The name of the directory and organizational unit (OU) to use to join the fleet to a \
         Microsoft Active Directory domain. \n"]
  idle_disconnect_timeout_in_seconds : integer option;
      [@ocaml.doc
        "The amount of time that users can be idle (inactive) before they are disconnected from \
         their streaming session and the [DisconnectTimeoutInSeconds] time interval begins. Users \
         are notified before they are disconnected due to inactivity. If users try to reconnect to \
         the streaming session before the time interval specified in [DisconnectTimeoutInSeconds] \
         elapses, they are connected to their previous session. Users are considered idle when \
         they stop providing keyboard or mouse input during their streaming session. File uploads \
         and downloads, audio in, audio out, and pixels changing do not qualify as user activity. \
         If users continue to be idle after the time interval in [IdleDisconnectTimeoutInSeconds] \
         elapses, they are disconnected.\n\n\
        \ To prevent users from being disconnected due to inactivity, specify a value of 0. \
         Otherwise, specify a value between 60 and 36000. The default value is 0.\n\
        \ \n\
        \   If you enable this feature, we recommend that you specify a value that corresponds \
         exactly to a whole number of minutes (for example, 60, 120, and 180). If you don't do \
         this, the value is rounded to the nearest minute. For example, if you specify a value of \
         70, users are disconnected after 1 minute of inactivity. If you specify a value that is \
         at the midpoint between two different minutes, the value is rounded up. For example, if \
         you specify a value of 90, users are disconnected after 2 minutes of inactivity. \n\
        \   \n\
        \    "]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The ARN of the IAM role that is applied to the fleet. To assume a role, the fleet \
         instance calls the AWS Security Token Service (STS) [AssumeRole] API operation and passes \
         the ARN of the role to use. The operation creates a new session with temporary \
         credentials. WorkSpaces Applications retrieves the temporary credentials and creates the \
         {b appstream_machine_role} credential profile on the instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html}Using \
         an IAM Role to Grant Permissions to Applications and Scripts Running on WorkSpaces \
         Applications Streaming Instances} in the {i Amazon WorkSpaces Applications Administration \
         Guide}.\n\
        \ "]
  stream_view : stream_view option;
      [@ocaml.doc
        "The WorkSpaces Applications view that is displayed to your users when they stream from \
         the fleet. When [APP] is specified, only the windows of applications opened by users \
         display. When [DESKTOP] is specified, the standard desktop that is provided by the \
         operating system displays.\n\n\
        \ The default value is [APP].\n\
        \ "]
  platform : platform_type option; [@ocaml.doc "The platform of the fleet.\n"]
  max_concurrent_sessions : integer option;
      [@ocaml.doc "The maximum number of concurrent sessions for the fleet.\n"]
  usb_device_filter_strings : usb_device_filter_strings option;
      [@ocaml.doc "The USB device filter strings associated with the fleet.\n"]
  session_script_s3_location : s3_location option;
      [@ocaml.doc
        "The S3 location of the session scripts configuration zip file. This only applies to \
         Elastic fleets.\n"]
  max_sessions_per_instance : integer option;
      [@ocaml.doc
        "The maximum number of user sessions on an instance. This only applies to multi-session \
         fleets.\n"]
  root_volume_config : volume_config option;
      [@ocaml.doc
        "The current configuration of the root volume for fleet instances, including the storage \
         size in GB.\n"]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Indicates whether Instance Metadata Service Version 1 (IMDSv1) is disabled for the fleet.\n"]
}
[@@ocaml.doc "Describes a fleet.\n"]

type nonrec create_fleet_result = {
  fleet : fleet option; [@ocaml.doc "Information about the fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_request = {
  name : name; [@ocaml.doc "A unique name for the fleet.\n"]
  image_name : name option; [@ocaml.doc "The name of the image used to create the fleet.\n"]
  image_arn : arn option; [@ocaml.doc "The ARN of the public, private, or shared image to use.\n"]
  instance_type : string_;
      [@ocaml.doc
        "The instance type to use when launching fleet instances. The following instance types are \
         available:\n\n\
        \ {ul\n\
        \       {-  stream.standard.small\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.medium\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.3xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.6xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The following instance types are available for Elastic fleets:\n\
        \   \n\
        \    {ul\n\
        \          {-  stream.standard.small\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.medium\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.large\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.xlarge\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.2xlarge\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  fleet_type : fleet_type option;
      [@ocaml.doc
        "The fleet type.\n\n\
        \  ALWAYS_ON  Provides users with instant-on access to their apps. You are charged for all \
         running instances in your fleet, even if no users are streaming apps.\n\
        \             \n\
        \               ON_DEMAND  Provide users with access to applications after they connect, \
         which takes one to two minutes. You are charged for instance streaming when users are \
         connected and a small hourly fee for instances that are not streaming apps.\n\
        \                          \n\
        \                            "]
  compute_capacity : compute_capacity option;
      [@ocaml.doc
        "The desired capacity for the fleet. This is not allowed for Elastic fleets. For Elastic \
         fleets, specify MaxConcurrentSessions instead.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "The VPC configuration for the fleet. This is required for Elastic fleets, but not \
         required for other fleet types. Elastic fleets require that you specify at least two \
         subnets in different availability zones.\n"]
  max_user_duration_in_seconds : integer option;
      [@ocaml.doc
        "The maximum amount of time that a streaming session can remain active, in seconds. If \
         users are still connected to a streaming instance five minutes before this limit is \
         reached, they are prompted to save any open documents before being disconnected. After \
         this time elapses, the instance is terminated and replaced by a new instance.\n\n\
        \ Specify a value between 600 and 432000.\n\
        \ "]
  disconnect_timeout_in_seconds : integer option;
      [@ocaml.doc
        "The amount of time that a streaming session remains active after users disconnect. If \
         users try to reconnect to the streaming session after a disconnection or network \
         interruption within this time interval, they are connected to their previous session. \
         Otherwise, they are connected to a new session with a new streaming instance. \n\n\
        \ Specify a value between 60 and 36000.\n\
        \ "]
  description : description option; [@ocaml.doc "The description to display.\n"]
  display_name : display_name option; [@ocaml.doc "The fleet name to display.\n"]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc "Enables or disables default internet access for the fleet.\n"]
  domain_join_info : domain_join_info option;
      [@ocaml.doc
        "The name of the directory and organizational unit (OU) to use to join the fleet to a \
         Microsoft Active Directory domain. This is not allowed for Elastic fleets. \n"]
  tags : tags option;
      [@ocaml.doc
        "The tags to associate with the fleet. A tag is a key-value pair, and the value is \
         optional. For example, Environment=Test. If you do not specify a value, Environment=. \n\n\
        \ If you do not specify a value, the value is set to an empty string.\n\
        \ \n\
        \  Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, \
         and the following special characters: \n\
        \  \n\
        \   _ . : / = + \\ - \\@\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging \
         Your Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
        \    "]
  idle_disconnect_timeout_in_seconds : integer option;
      [@ocaml.doc
        "The amount of time that users can be idle (inactive) before they are disconnected from \
         their streaming session and the [DisconnectTimeoutInSeconds] time interval begins. Users \
         are notified before they are disconnected due to inactivity. If they try to reconnect to \
         the streaming session before the time interval specified in [DisconnectTimeoutInSeconds] \
         elapses, they are connected to their previous session. Users are considered idle when \
         they stop providing keyboard or mouse input during their streaming session. File uploads \
         and downloads, audio in, audio out, and pixels changing do not qualify as user activity. \
         If users continue to be idle after the time interval in [IdleDisconnectTimeoutInSeconds] \
         elapses, they are disconnected.\n\n\
        \ To prevent users from being disconnected due to inactivity, specify a value of 0. \
         Otherwise, specify a value between 60 and 36000. The default value is 0.\n\
        \ \n\
        \   If you enable this feature, we recommend that you specify a value that corresponds \
         exactly to a whole number of minutes (for example, 60, 120, and 180). If you don't do \
         this, the value is rounded to the nearest minute. For example, if you specify a value of \
         70, users are disconnected after 1 minute of inactivity. If you specify a value that is \
         at the midpoint between two different minutes, the value is rounded up. For example, if \
         you specify a value of 90, users are disconnected after 2 minutes of inactivity. \n\
        \   \n\
        \    "]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to apply to the fleet. To assume a role, a \
         fleet instance calls the AWS Security Token Service (STS) [AssumeRole] API operation and \
         passes the ARN of the role to use. The operation creates a new session with temporary \
         credentials. WorkSpaces Applications retrieves the temporary credentials and creates the \
         {b appstream_machine_role} credential profile on the instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html}Using \
         an IAM Role to Grant Permissions to Applications and Scripts Running on WorkSpaces \
         Applications Streaming Instances} in the {i Amazon WorkSpaces Applications Administration \
         Guide}.\n\
        \ "]
  stream_view : stream_view option;
      [@ocaml.doc
        "The WorkSpaces Applications view that is displayed to your users when they stream from \
         the fleet. When [APP] is specified, only the windows of applications opened by users \
         display. When [DESKTOP] is specified, the standard desktop that is provided by the \
         operating system displays.\n\n\
        \ The default value is [APP].\n\
        \ "]
  platform : platform_type option;
      [@ocaml.doc
        "The fleet platform. WINDOWS_SERVER_2019, AMAZON_LINUX2 and UBUNTU_PRO_2404 are supported \
         for Elastic fleets. \n"]
  max_concurrent_sessions : integer option;
      [@ocaml.doc
        "The maximum concurrent sessions of the Elastic fleet. This is required for Elastic \
         fleets, and not allowed for other fleet types.\n"]
  usb_device_filter_strings : usb_device_filter_strings option;
      [@ocaml.doc
        "The USB device filter strings that specify which USB devices a user can redirect to the \
         fleet streaming session, when using the Windows native client. This is allowed but not \
         required for Elastic fleets.\n"]
  session_script_s3_location : s3_location option;
      [@ocaml.doc
        "The S3 location of the session scripts configuration zip file. This only applies to \
         Elastic fleets.\n"]
  max_sessions_per_instance : integer option;
      [@ocaml.doc
        "The maximum number of user sessions on an instance. This only applies to multi-session \
         fleets.\n"]
  root_volume_config : volume_config option;
      [@ocaml.doc
        "The configuration for the root volume of fleet instances. Use this to customize storage \
         capacity from 200 GB up to 500 GB based on your application requirements.\n"]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Set to true to disable Instance Metadata Service Version 1 (IMDSv1) and enforce IMDSv2. \
         Set to false to enable both IMDSv1 and IMDSv2.\n\n\
        \  Before disabling IMDSv1, ensure your WorkSpaces Applications images are running the \
         agent version or managed image update released on or after January 16, 2024 to support \
         IMDSv2 enforcement.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec latest_appstream_agent_version = TRUE [@ocaml.doc ""] | FALSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec network_access_configuration = {
  eni_private_ip_address : string_ option;
      [@ocaml.doc
        "The private IP address of the elastic network interface that is attached to instances in \
         your VPC.\n"]
  eni_ipv6_addresses : string_list option;
      [@ocaml.doc
        "The IPv6 addresses assigned to the elastic network interface. This field supports IPv6 \
         connectivity for WorkSpaces Applications instances.\n"]
  eni_id : string_ option;
      [@ocaml.doc
        "The resource identifier of the elastic network interface that is attached to instances in \
         your VPC. All network interfaces have the eni-xxxxxxxx resource identifier.\n"]
}
[@@ocaml.doc "Describes the network details of the fleet or image builder instance.\n"]

type nonrec image_builder_state_change_reason_code =
  | INTERNAL_ERROR [@ocaml.doc ""]
  | IMAGE_UNAVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_builder_state_change_reason = {
  code : image_builder_state_change_reason_code option;
      [@ocaml.doc "The state change reason code.\n"]
  message : string_ option; [@ocaml.doc "The state change reason message.\n"]
}
[@@ocaml.doc "Describes the reason why the last image builder state change occurred.\n"]

type nonrec image_builder_state =
  | PENDING [@ocaml.doc ""]
  | UPDATING_AGENT [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | REBOOTING [@ocaml.doc ""]
  | SNAPSHOTTING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | PENDING_QUALIFICATION [@ocaml.doc ""]
  | PENDING_SYNCING_APPS [@ocaml.doc ""]
  | SYNCING_APPS [@ocaml.doc ""]
  | PENDING_IMAGE_IMPORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_builder = {
  name : string_; [@ocaml.doc "The name of the image builder.\n"]
  arn : arn option; [@ocaml.doc "The ARN for the image builder.\n"]
  image_arn : arn option; [@ocaml.doc "The ARN of the image from which this builder was created.\n"]
  description : string_ option; [@ocaml.doc "The description to display.\n"]
  display_name : string_ option; [@ocaml.doc "The image builder name to display.\n"]
  vpc_config : vpc_config option; [@ocaml.doc "The VPC configuration of the image builder.\n"]
  instance_type : string_ option;
      [@ocaml.doc
        "The instance type for the image builder. The following instance types are available:\n\n\
        \ {ul\n\
        \       {-  stream.standard.small\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.medium\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.3xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.6xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  platform : platform_type option;
      [@ocaml.doc "The operating system platform of the image builder.\n"]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The ARN of the IAM role that is applied to the image builder. To assume a role, the image \
         builder calls the AWS Security Token Service (STS) [AssumeRole] API operation and passes \
         the ARN of the role to use. The operation creates a new session with temporary \
         credentials. WorkSpaces Applications retrieves the temporary credentials and creates the \
         {b appstream_machine_role} credential profile on the instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html}Using \
         an IAM Role to Grant Permissions to Applications and Scripts Running on WorkSpaces \
         Applications Streaming Instances} in the {i Amazon WorkSpaces Applications Administration \
         Guide}.\n\
        \ "]
  state : image_builder_state option; [@ocaml.doc "The state of the image builder.\n"]
  state_change_reason : image_builder_state_change_reason option;
      [@ocaml.doc "The reason why the last state change occurred.\n"]
  created_time : timestamp option;
      [@ocaml.doc "The time stamp when the image builder was created.\n"]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc "Enables or disables default internet access for the image builder.\n"]
  domain_join_info : domain_join_info option;
      [@ocaml.doc
        "The name of the directory and organizational unit (OU) to use to join the image builder \
         to a Microsoft Active Directory domain. \n"]
  network_access_configuration : network_access_configuration option; [@ocaml.doc ""]
  image_builder_errors : resource_errors option; [@ocaml.doc "The image builder errors.\n"]
  appstream_agent_version : appstream_agent_version option;
      [@ocaml.doc
        "The version of the WorkSpaces Applications agent that is currently being used by the \
         image builder. \n"]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of virtual private cloud (VPC) interface endpoint objects. Administrators can \
         connect to the image builder only through the specified endpoints.\n"]
  root_volume_config : volume_config option;
      [@ocaml.doc
        "The current configuration of the root volume for the image builder, including the storage \
         size in GB.\n"]
  latest_appstream_agent_version : latest_appstream_agent_version option;
      [@ocaml.doc
        "Indicates whether the image builder is using the latest WorkSpaces Applications agent \
         version or not.\n"]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Indicates whether Instance Metadata Service Version 1 (IMDSv1) is disabled for the image \
         builder.\n"]
}
[@@ocaml.doc "Describes a virtual machine that is used to create an image. \n"]

type nonrec create_image_builder_result = {
  image_builder : image_builder option; [@ocaml.doc "Information about the image builder.\n"]
}
[@@ocaml.doc ""]

type nonrec create_image_builder_request = {
  name : name; [@ocaml.doc "A unique name for the image builder.\n"]
  image_name : string_ option;
      [@ocaml.doc "The name of the image used to create the image builder.\n"]
  image_arn : arn option; [@ocaml.doc "The ARN of the public, private, or shared image to use.\n"]
  instance_type : string_;
      [@ocaml.doc
        "The instance type to use when launching the image builder. The following instance types \
         are available:\n\n\
        \ {ul\n\
        \       {-  stream.standard.small\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.medium\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.3xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.6xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  description : description option; [@ocaml.doc "The description to display.\n"]
  display_name : display_name option; [@ocaml.doc "The image builder name to display.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc "The VPC configuration for the image builder. You can specify only one subnet.\n"]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to apply to the image builder. To assume a \
         role, the image builder calls the AWS Security Token Service (STS) [AssumeRole] API \
         operation and passes the ARN of the role to use. The operation creates a new session with \
         temporary credentials. WorkSpaces Applications retrieves the temporary credentials and \
         creates the {b appstream_machine_role} credential profile on the instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html}Using \
         an IAM Role to Grant Permissions to Applications and Scripts Running on WorkSpaces \
         Applications Streaming Instances} in the {i Amazon WorkSpaces Applications Administration \
         Guide}.\n\
        \ "]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc "Enables or disables default internet access for the image builder.\n"]
  domain_join_info : domain_join_info option;
      [@ocaml.doc
        "The name of the directory and organizational unit (OU) to use to join the image builder \
         to a Microsoft Active Directory domain. \n"]
  appstream_agent_version : appstream_agent_version option;
      [@ocaml.doc
        "The version of the WorkSpaces Applications agent to use for this image builder. To use \
         the latest version of the WorkSpaces Applications agent, specify \\[LATEST\\]. \n"]
  tags : tags option;
      [@ocaml.doc
        "The tags to associate with the image builder. A tag is a key-value pair, and the value is \
         optional. For example, Environment=Test. If you do not specify a value, Environment=. \n\n\
        \ Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, \
         and the following special characters: \n\
        \ \n\
        \  _ . : / = + \\ - \\@\n\
        \  \n\
        \   If you do not specify a value, the value is set to an empty string.\n\
        \   \n\
        \    For more information about tags, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging \
         Your Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
        \    "]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of interface VPC endpoint (interface endpoint) objects. Administrators can \
         connect to the image builder only through the specified endpoints.\n"]
  root_volume_config : volume_config option;
      [@ocaml.doc
        "The configuration for the root volume of the image builder. Use this to customize storage \
         capacity from 200 GB up to 500 GB based on your application installation requirements.\n"]
  softwares_to_install : string_list option;
      [@ocaml.doc
        "The list of license included applications to install on the image builder during \
         creation.\n\n\
        \ Possible values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  softwares_to_uninstall : string_list option;
      [@ocaml.doc
        "The list of license included applications to uninstall from the image builder during \
         creation.\n\n\
        \ Possible values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Set to true to disable Instance Metadata Service Version 1 (IMDSv1) and enforce IMDSv2. \
         Set to false to enable both IMDSv1 and IMDSv2.\n\n\
        \  Before disabling IMDSv1, ensure your WorkSpaces Applications images are running the \
         agent version or managed image update released on or after January 16, 2024 to support \
         IMDSv2 enforcement.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_image_builder_streaming_url_result = {
  streaming_ur_l : string_ option;
      [@ocaml.doc "The URL to start the WorkSpaces Applications streaming session.\n"]
  expires : timestamp option;
      [@ocaml.doc "The elapsed time, in seconds after the Unix epoch, when this URL expires.\n"]
}
[@@ocaml.doc ""]

type nonrec create_image_builder_streaming_url_request = {
  name : string_; [@ocaml.doc "The name of the image builder.\n"]
  validity : long option;
      [@ocaml.doc
        "The time that the streaming URL will be valid, in seconds. Specify a value between 1 and \
         604800 seconds. The default is 3600 seconds.\n"]
}
[@@ocaml.doc ""]

type nonrec dry_run_operation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The exception that is thrown when a dry run operation is requested. This indicates that the \
   validation checks have been performed successfully, but no actual resources were created or \
   modified.\n"]

type nonrec image_type = CUSTOM [@ocaml.doc ""] | NATIVE [@ocaml.doc ""] | BYOL [@ocaml.doc ""]
[@@ocaml.doc "The image type is the type of AppStream image resource."]

type nonrec image_shared_with_others = TRUE [@ocaml.doc ""] | FALSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dynamic_app_providers_enabled = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_permissions = {
  allow_fleet : boolean_object option;
      [@ocaml.doc "Indicates whether the image can be used for a fleet.\n"]
  allow_image_builder : boolean_object option;
      [@ocaml.doc "Indicates whether the image can be used for an image builder.\n"]
}
[@@ocaml.doc "Describes the permissions for an image. \n"]

type nonrec image_state_change_reason_code =
  | INTERNAL_ERROR [@ocaml.doc ""]
  | IMAGE_BUILDER_NOT_AVAILABLE [@ocaml.doc ""]
  | IMAGE_COPY_FAILURE [@ocaml.doc ""]
  | IMAGE_UPDATE_FAILURE [@ocaml.doc ""]
  | IMAGE_IMPORT_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_state_change_reason = {
  code : image_state_change_reason_code option; [@ocaml.doc "The state change reason code.\n"]
  message : string_ option; [@ocaml.doc "The state change reason message.\n"]
}
[@@ocaml.doc "Describes the reason why the last image state change occurred.\n"]

type nonrec visibility_type =
  | PUBLIC [@ocaml.doc ""]
  | PRIVATE [@ocaml.doc ""]
  | SHARED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_state =
  | PENDING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COPYING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | IMPORTING [@ocaml.doc ""]
  | VALIDATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image = {
  name : string_; [@ocaml.doc "The name of the image.\n"]
  arn : arn option; [@ocaml.doc "The ARN of the image.\n"]
  base_image_arn : arn option;
      [@ocaml.doc "The ARN of the image from which this image was created.\n"]
  display_name : string_ option; [@ocaml.doc "The image name to display.\n"]
  state : image_state option;
      [@ocaml.doc
        "The image starts in the [PENDING] state. If image creation succeeds, the state is \
         [AVAILABLE]. If image creation fails, the state is [FAILED].\n"]
  visibility : visibility_type option;
      [@ocaml.doc "Indicates whether the image is public or private.\n"]
  image_builder_supported : boolean_ option;
      [@ocaml.doc "Indicates whether an image builder can be launched from this image.\n"]
  image_builder_name : string_ option;
      [@ocaml.doc
        "The name of the image builder that was used to create the private image. If the image is \
         shared, copied, or updated by using Managed Image Updates, this value is null.\n"]
  platform : platform_type option; [@ocaml.doc "The operating system platform of the image.\n"]
  description : string_ option; [@ocaml.doc "The description to display.\n"]
  state_change_reason : image_state_change_reason option;
      [@ocaml.doc "The reason why the last state change occurred.\n"]
  applications : applications option; [@ocaml.doc "The applications associated with the image.\n"]
  created_time : timestamp option; [@ocaml.doc "The time the image was created.\n"]
  public_base_image_released_date : timestamp option;
      [@ocaml.doc
        "The release date of the public base image. For private images, this date is the release \
         date of the base image from which the image was created.\n"]
  appstream_agent_version : appstream_agent_version option;
      [@ocaml.doc
        "The version of the WorkSpaces Applications agent to use for instances that are launched \
         from this image. \n"]
  image_permissions : image_permissions option;
      [@ocaml.doc
        "The permissions to provide to the destination AWS account for the specified image.\n"]
  image_errors : resource_errors option;
      [@ocaml.doc "Describes the errors that are returned when a new image can't be created.\n"]
  latest_appstream_agent_version : latest_appstream_agent_version option;
      [@ocaml.doc
        "Indicates whether the image is using the latest WorkSpaces Applications agent version or \
         not.\n"]
  supported_instance_families : string_list option;
      [@ocaml.doc
        "The supported instances families that determine which image a customer can use when the \
         customer launches a fleet or image builder. The following instances families are \
         supported:\n\n\
        \ {ul\n\
        \       {-  General Purpose\n\
        \           \n\
        \            }\n\
        \       {-  Compute Optimized\n\
        \           \n\
        \            }\n\
        \       {-  Memory Optimized\n\
        \           \n\
        \            }\n\
        \       {-  Graphics G4\n\
        \           \n\
        \            }\n\
        \       {-  Graphics G5\n\
        \           \n\
        \            }\n\
        \       {-  Graphics G6\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dynamic_app_providers_enabled : dynamic_app_providers_enabled option;
      [@ocaml.doc
        "Indicates whether dynamic app providers are enabled within an WorkSpaces Applications \
         image or not.\n"]
  image_shared_with_others : image_shared_with_others option;
      [@ocaml.doc "Indicates whether the image is shared with another account ID.\n"]
  managed_software_included : boolean_ option;
      [@ocaml.doc "Indicates whether the image includes license-included applications.\n"]
  image_type : image_type option;
      [@ocaml.doc
        "The type of the image. Images created through AMI import have type \"custom\", while \
         WorkSpaces Applications provided images have type \"native\". Custom images support \
         additional instance types including GeneralPurpose, MemoryOptimized, ComputeOptimized, \
         and Accelerated instance families.\n"]
}
[@@ocaml.doc "Describes an image.\n"]

type nonrec create_imported_image_result = { image : image option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec instance_type = string [@@ocaml.doc ""]

type nonrec runtime_validation_config = {
  intended_instance_type : instance_type option;
      [@ocaml.doc
        "The instance type to use for runtime validation testing. It's recommended to use the same \
         instance type you plan to use for your fleet to ensure accurate validation results.\n"]
}
[@@ocaml.doc
  "Configuration for runtime validation of imported images. This structure specifies the instance \
   type to use for testing the imported image's streaming capabilities.\n"]

type nonrec image_import_display_name = string [@@ocaml.doc ""]

type nonrec image_import_description = string [@@ocaml.doc ""]

type nonrec workspace_image_id = string [@@ocaml.doc ""]

type nonrec create_imported_image_request = {
  name : name;
      [@ocaml.doc
        "A unique name for the imported image. The name must be between 1 and 100 characters and \
         can contain letters, numbers, underscores, periods, and hyphens.\n"]
  source_ami_id : photon_ami_id option; [@ocaml.doc "The ID of the EC2 AMI to import.\n"]
  workspace_image_id : workspace_image_id option;
      [@ocaml.doc "The ID of the Workspaces Image to import.\n"]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The ARN of the IAM role that allows WorkSpaces Applications to access your AMI. The role \
         must have permissions to modify image attributes and describe images, with a trust \
         relationship allowing appstream.amazonaws.com to assume the role.\n"]
  description : image_import_description option;
      [@ocaml.doc
        "An optional description for the imported image. The description must match approved regex \
         patterns and can be up to 256 characters.\n"]
  display_name : image_import_display_name option;
      [@ocaml.doc
        "An optional display name for the imported image. The display name must match approved \
         regex patterns and can be up to 100 characters.\n"]
  tags : tags option;
      [@ocaml.doc
        "The tags to apply to the imported image. Tags help you organize and manage your \
         WorkSpaces Applications resources.\n"]
  runtime_validation_config : runtime_validation_config option;
      [@ocaml.doc
        "Configuration for runtime validation of the imported image. When specified, WorkSpaces \
         Applications provisions an instance to test streaming functionality, which helps ensure \
         the image is suitable for use.\n"]
  agent_software_version : agent_software_version option;
      [@ocaml.doc
        "The version of the WorkSpaces Applications agent to use for the imported image. Choose \
         CURRENT_LATEST to use the agent version available at the time of import, or ALWAYS_LATEST \
         to automatically update to the latest agent version when new versions are released.\n"]
  app_catalog_config : app_catalog_config option;
      [@ocaml.doc
        "Configuration for the application catalog of the imported image. This allows you to \
         specify applications available for streaming, including their paths, icons, and launch \
         parameters. This field contains sensitive data.\n"]
  dry_run : boolean_ option;
      [@ocaml.doc
        "When set to true, performs validation checks without actually creating the imported \
         image. Use this to verify your configuration before executing the actual import operation.\n"]
}
[@@ocaml.doc ""]

type nonrec preferred_protocol = TCP [@ocaml.doc ""] | UDP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec streaming_experience_settings = {
  preferred_protocol : preferred_protocol option;
      [@ocaml.doc "The preferred protocol that you want to use while streaming your application.\n"]
}
[@@ocaml.doc
  "The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, UDP is \
   only supported in the Windows native client.\n"]

type nonrec embed_host_domain = string [@@ocaml.doc ""]

type nonrec embed_host_domains = embed_host_domain list [@@ocaml.doc ""]

type nonrec user_setting = {
  action : action; [@ocaml.doc "The action that is enabled or disabled.\n"]
  permission : permission; [@ocaml.doc "Indicates whether the action is enabled or disabled.\n"]
  maximum_length : integer option;
      [@ocaml.doc
        "Specifies the number of characters that can be copied by end users from the local device \
         to the remote session, and to the local device from the remote session.\n\n\
        \ This can be specified only for the [CLIPBOARD_COPY_FROM_LOCAL_DEVICE] and \
         [CLIPBOARD_COPY_TO_LOCAL_DEVICE] actions.\n\
        \ \n\
        \  This defaults to 20,971,520 (20 MB) when unspecified and the permission is [ENABLED]. \
         This can't be specified when the permission is [DISABLED]. \n\
        \  \n\
        \   The value can be between 1 and 20,971,520 (20 MB).\n\
        \   "]
}
[@@ocaml.doc
  "Describes an action and whether the action is enabled or disabled for users during their \
   streaming sessions.\n"]

type nonrec user_setting_list = user_setting list [@@ocaml.doc ""]

type nonrec stack_error_code =
  | STORAGE_CONNECTOR_ERROR [@ocaml.doc ""]
  | INTERNAL_SERVICE_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stack_error = {
  error_code : stack_error_code option; [@ocaml.doc "The error code.\n"]
  error_message : string_ option; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "Describes a stack error.\n"]

type nonrec stack_errors = stack_error list [@@ocaml.doc ""]

type nonrec feedback_ur_l = string [@@ocaml.doc ""]

type nonrec redirect_ur_l = string [@@ocaml.doc ""]

type nonrec domain = string [@@ocaml.doc ""]

type nonrec domain_list = domain list [@@ocaml.doc ""]

type nonrec resource_identifier = string [@@ocaml.doc ""]

type nonrec storage_connector_type =
  | HOMEFOLDERS [@ocaml.doc ""]
  | GOOGLE_DRIVE [@ocaml.doc ""]
  | ONE_DRIVE [@ocaml.doc ""]
[@@ocaml.doc "The type of storage connector.\n"]

type nonrec storage_connector = {
  connector_type : storage_connector_type; [@ocaml.doc "The type of storage connector.\n"]
  resource_identifier : resource_identifier option;
      [@ocaml.doc "The ARN of the storage connector.\n"]
  domains : domain_list option; [@ocaml.doc "The names of the domains for the account.\n"]
  domains_require_admin_consent : domain_list option;
      [@ocaml.doc
        "The OneDrive for Business domains where you require admin consent when users try to link \
         their OneDrive account to WorkSpaces Applications. The attribute can only be specified \
         when ConnectorType=ONE_DRIVE.\n"]
}
[@@ocaml.doc "Describes a connector that enables persistent storage for users.\n"]

type nonrec storage_connector_list = storage_connector list [@@ocaml.doc ""]

type nonrec stack = {
  arn : arn option; [@ocaml.doc "The ARN of the stack.\n"]
  name : string_; [@ocaml.doc "The name of the stack.\n"]
  description : string_ option; [@ocaml.doc "The description to display.\n"]
  display_name : string_ option; [@ocaml.doc "The stack name to display.\n"]
  created_time : timestamp option; [@ocaml.doc "The time the stack was created.\n"]
  storage_connectors : storage_connector_list option;
      [@ocaml.doc "The storage connectors to enable.\n"]
  redirect_ur_l : redirect_ur_l option;
      [@ocaml.doc "The URL that users are redirected to after their streaming session ends.\n"]
  feedback_ur_l : feedback_ur_l option;
      [@ocaml.doc
        "The URL that users are redirected to after they click the Send Feedback link. If no URL \
         is specified, no Send Feedback link is displayed.\n"]
  stack_errors : stack_errors option; [@ocaml.doc "The errors for the stack.\n"]
  user_settings : user_setting_list option;
      [@ocaml.doc
        "The actions that are enabled or disabled for users during their streaming sessions. By \
         default these actions are enabled.\n"]
  application_settings : application_settings_response option;
      [@ocaml.doc "The persistent application settings for users of the stack.\n"]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of virtual private cloud (VPC) interface endpoint objects. Users of the stack \
         can connect to WorkSpaces Applications only through the specified endpoints. \n"]
  embed_host_domains : embed_host_domains option;
      [@ocaml.doc
        "The domains where WorkSpaces Applications streaming sessions can be embedded in an \
         iframe. You must approve the domains that you want to host embedded WorkSpaces \
         Applications streaming sessions.\n"]
  streaming_experience_settings : streaming_experience_settings option;
      [@ocaml.doc
        "The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, \
         UDP is only supported in the Windows native client.\n"]
  content_redirection : content_redirection option;
      [@ocaml.doc
        "Configuration for bidirectional URL redirection between the streaming session and the \
         local client. Use HostToClient to redirect URLs from the remote desktop to the local \
         browser.\n"]
  agent_access_config : agent_access_config option;
      [@ocaml.doc "The agent access configuration of the stack, if agent access is enabled.\n"]
}
[@@ocaml.doc "Describes a stack.\n"]

type nonrec create_stack_result = {
  stack : stack option; [@ocaml.doc "Information about the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec create_stack_request = {
  name : name; [@ocaml.doc "The name of the stack.\n"]
  description : description option; [@ocaml.doc "The description to display.\n"]
  display_name : display_name option; [@ocaml.doc "The stack name to display.\n"]
  storage_connectors : storage_connector_list option;
      [@ocaml.doc "The storage connectors to enable.\n"]
  redirect_ur_l : redirect_ur_l option;
      [@ocaml.doc "The URL that users are redirected to after their streaming session ends.\n"]
  feedback_ur_l : feedback_ur_l option;
      [@ocaml.doc
        "The URL that users are redirected to after they click the Send Feedback link. If no URL \
         is specified, no Send Feedback link is displayed.\n"]
  user_settings : user_setting_list option;
      [@ocaml.doc
        "The actions that are enabled or disabled for users during their streaming sessions. By \
         default, these actions are enabled. \n"]
  application_settings : application_settings option;
      [@ocaml.doc
        "The persistent application settings for users of a stack. When these settings are \
         enabled, changes that users make to applications and Windows settings are automatically \
         saved after each session and applied to the next session.\n"]
  tags : tags option;
      [@ocaml.doc
        "The tags to associate with the stack. A tag is a key-value pair, and the value is \
         optional. For example, Environment=Test. If you do not specify a value, Environment=. \n\n\
        \ If you do not specify a value, the value is set to an empty string.\n\
        \ \n\
        \  Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, \
         and the following special characters: \n\
        \  \n\
        \   _ . : / = + \\ - \\@\n\
        \   \n\
        \    For more information about tags, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging \
         Your Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
        \    "]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of interface VPC endpoint (interface endpoint) objects. Users of the stack can \
         connect to WorkSpaces Applications only through the specified endpoints.\n"]
  embed_host_domains : embed_host_domains option;
      [@ocaml.doc
        "The domains where WorkSpaces Applications streaming sessions can be embedded in an \
         iframe. You must approve the domains that you want to host embedded WorkSpaces \
         Applications streaming sessions. \n"]
  streaming_experience_settings : streaming_experience_settings option;
      [@ocaml.doc
        "The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, \
         UDP is only supported in the Windows native client.\n"]
  content_redirection : content_redirection option; [@ocaml.doc ""]
  agent_access_config : agent_access_config option;
      [@ocaml.doc
        "The configuration for agent access on the stack. If specified, agent access is enabled \
         for the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec create_streaming_url_result = {
  streaming_ur_l : string_ option;
      [@ocaml.doc "The URL to start the WorkSpaces Applications streaming session.\n"]
  expires : timestamp option;
      [@ocaml.doc "The elapsed time, in seconds after the Unix epoch, when this URL expires.\n"]
}
[@@ocaml.doc ""]

type nonrec streaming_url_user_id = string [@@ocaml.doc ""]

type nonrec create_streaming_url_request = {
  stack_name : string_; [@ocaml.doc "The name of the stack.\n"]
  fleet_name : string_; [@ocaml.doc "The name of the fleet.\n"]
  user_id : streaming_url_user_id; [@ocaml.doc "The identifier of the user.\n"]
  application_id : string_ option;
      [@ocaml.doc
        "The name of the application to launch after the session starts. This is the name that you \
         specified as {b Name} in the Image Assistant. If your fleet is enabled for the {b \
         Desktop} stream view, you can also choose to launch directly to the operating system \
         desktop. To do so, specify {b Desktop}.\n"]
  validity : long option;
      [@ocaml.doc
        "The time that the streaming URL will be valid, in seconds. Specify a value between 1 and \
         604800 seconds. The default is 60 seconds.\n"]
  session_context : string_ option;
      [@ocaml.doc
        "The session context. For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/managing-stacks-fleets.html#managing-stacks-fleets-parameters}Session \
         Context} in the {i Amazon WorkSpaces Applications Administration Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec theme_footer_link_ur_l = string [@@ocaml.doc ""]

type nonrec theme_footer_link_display_name = string [@@ocaml.doc ""]

type nonrec theme_footer_link = {
  display_name : theme_footer_link_display_name option;
      [@ocaml.doc "The name of the websites that display in the catalog page footer.\n"]
  footer_link_ur_l : theme_footer_link_ur_l option;
      [@ocaml.doc "The URL of the websites that display in the catalog page footer.\n"]
}
[@@ocaml.doc "The website links that display in the catalog page footer.\n"]

type nonrec theme_footer_links = theme_footer_link list [@@ocaml.doc ""]

type nonrec theme_styling =
  | LIGHT_BLUE [@ocaml.doc ""]
  | BLUE [@ocaml.doc ""]
  | PINK [@ocaml.doc ""]
  | RED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec theme_title_text = string [@@ocaml.doc ""]

type nonrec theme_state = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec theme = {
  stack_name : name option; [@ocaml.doc "The stack that has the custom branding theme.\n"]
  state : theme_state option; [@ocaml.doc "The state of the theme.\n"]
  theme_title_text : theme_title_text option; [@ocaml.doc "The browser tab page title.\n"]
  theme_styling : theme_styling option;
      [@ocaml.doc
        "The color that is used for the website links, text, buttons, and catalog page background.\n"]
  theme_footer_links : theme_footer_links option;
      [@ocaml.doc "The website links that display in the catalog page footer.\n"]
  theme_organization_logo_ur_l : string_ option;
      [@ocaml.doc "The URL of the logo that displays in the catalog page header.\n"]
  theme_favicon_ur_l : string_ option;
      [@ocaml.doc
        "The URL of the icon that displays at the top of a user's browser tab during streaming \
         sessions.\n"]
  created_time : timestamp option; [@ocaml.doc "The time the theme was created.\n"]
}
[@@ocaml.doc
  "The custom branding theme, which might include a custom logo, website links, and other branding \
   to display to users.\n"]

type nonrec create_theme_for_stack_result = {
  theme : theme option;
      [@ocaml.doc " The theme object that contains the metadata of the custom branding.\n"]
}
[@@ocaml.doc ""]

type nonrec create_theme_for_stack_request = {
  stack_name : name; [@ocaml.doc "The name of the stack for the theme.\n"]
  footer_links : theme_footer_links option;
      [@ocaml.doc
        "The links that are displayed in the footer of the streaming application catalog page. \
         These links are helpful resources for users, such as the organization's IT support and \
         product marketing sites.\n"]
  title_text : theme_title_text;
      [@ocaml.doc
        "The title that is displayed at the top of the browser tab during users' application \
         streaming sessions.\n"]
  theme_styling : theme_styling;
      [@ocaml.doc
        "The color theme that is applied to website links, text, and buttons. These colors are \
         also applied as accents in the background for the streaming application catalog page.\n"]
  organization_logo_s3_location : s3_location;
      [@ocaml.doc "The organization logo that appears on the streaming application catalog page.\n"]
  favicon_s3_location : s3_location;
      [@ocaml.doc
        "The S3 location of the favicon. The favicon enables users to recognize their application \
         streaming site in a browser full of tabs or bookmarks. It is displayed at the top of the \
         browser tab for the application streaming site during users' streaming sessions.\n"]
}
[@@ocaml.doc ""]

type nonrec create_updated_image_result = {
  image : image option; [@ocaml.doc ""]
  can_update_image : boolean_ option; [@ocaml.doc "Indicates whether a new image can be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_updated_image_request = {
  existing_image_name : name; [@ocaml.doc "The name of the image to update.\n"]
  new_image_name : name;
      [@ocaml.doc
        "The name of the new image. The name must be unique within the AWS account and Region.\n"]
  new_image_description : description option;
      [@ocaml.doc "The description to display for the new image.\n"]
  new_image_display_name : display_name option;
      [@ocaml.doc "The name to display for the new image.\n"]
  new_image_tags : tags option;
      [@ocaml.doc
        "The tags to associate with the new image. A tag is a key-value pair, and the value is \
         optional. For example, Environment=Test. If you do not specify a value, Environment=. \n\n\
        \ Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, \
         and the following special characters: \n\
        \ \n\
        \  _ . : / = + \\ - \\@\n\
        \  \n\
        \   If you do not specify a value, the value is set to an empty string.\n\
        \   \n\
        \    For more information about tags, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging \
         Your Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
        \    "]
  dry_run : boolean_ option;
      [@ocaml.doc
        "Indicates whether to display the status of image update availability before WorkSpaces \
         Applications initiates the process of creating a new updated image. If this value is set \
         to [true], WorkSpaces Applications displays whether image updates are available. If this \
         value is set to [false], WorkSpaces Applications initiates the process of creating a new \
         updated image without displaying whether image updates are available.\n"]
}
[@@ocaml.doc ""]

type nonrec usage_report_schedule = DAILY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec create_usage_report_subscription_result = {
  s3_bucket_name : string_ option;
      [@ocaml.doc
        "The Amazon S3 bucket where generated reports are stored.\n\n\
        \ If you enabled on-instance session scripts and Amazon S3 logging for your session script \
         configuration, WorkSpaces Applications created an S3 bucket to store the script output. \
         The bucket is unique to your account and Region. When you enable usage reporting in this \
         case, WorkSpaces Applications uses the same bucket to store your usage reports. If you \
         haven't already enabled on-instance session scripts, when you enable usage reports, \
         WorkSpaces Applications creates a new S3 bucket.\n\
        \ "]
  schedule : usage_report_schedule option;
      [@ocaml.doc "The schedule for generating usage reports.\n"]
}
[@@ocaml.doc ""]

type nonrec create_usage_report_subscription_request = unit [@@ocaml.doc ""]

type nonrec create_user_result = unit [@@ocaml.doc ""]

type nonrec user_attribute_value = string [@@ocaml.doc ""]

type nonrec message_action = SUPPRESS [@ocaml.doc ""] | RESEND [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec create_user_request = {
  user_name : username;
      [@ocaml.doc
        "The email address of the user.\n\n\
        \  Users' email addresses are case-sensitive. During login, if they specify an email \
         address that doesn't use the same capitalization as the email address specified when \
         their user pool account was created, a \"user does not exist\" error message displays.\n\
        \  \n\
        \   "]
  message_action : message_action option;
      [@ocaml.doc
        "The action to take for the welcome email that is sent to a user after the user is created \
         in the user pool. If you specify SUPPRESS, no email is sent. If you specify RESEND, do \
         not specify the first name or last name of the user. If the value is null, the email is \
         sent. \n\n\
        \  The temporary password in the welcome email is valid for only 7 days. If users \
         don\226\128\153t set their passwords within 7 days, you must send them a new welcome \
         email.\n\
        \  \n\
        \   "]
  first_name : user_attribute_value option;
      [@ocaml.doc "The first name, or given name, of the user.\n"]
  last_name : user_attribute_value option; [@ocaml.doc "The last name, or surname, of the user.\n"]
  authentication_type : authentication_type;
      [@ocaml.doc "The authentication type for the user. You must specify USERPOOL. \n"]
}
[@@ocaml.doc ""]

type nonrec resource_in_use_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource is in use.\n"]

type nonrec delete_app_block_result = unit [@@ocaml.doc ""]

type nonrec delete_app_block_request = { name : name [@ocaml.doc "The name of the app block.\n"] }
[@@ocaml.doc ""]

type nonrec delete_app_block_builder_result = unit [@@ocaml.doc ""]

type nonrec delete_app_block_builder_request = {
  name : name; [@ocaml.doc "The name of the app block builder.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_application_result = unit [@@ocaml.doc ""]

type nonrec delete_application_request = {
  name : name; [@ocaml.doc "The name of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_directory_config_result = unit [@@ocaml.doc ""]

type nonrec delete_directory_config_request = {
  directory_name : directory_name; [@ocaml.doc "The name of the directory configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_entitlement_result = unit [@@ocaml.doc ""]

type nonrec delete_entitlement_request = {
  name : name; [@ocaml.doc "The name of the entitlement.\n"]
  stack_name : name; [@ocaml.doc "The name of the stack with which the entitlement is associated.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_result = unit [@@ocaml.doc ""]

type nonrec delete_fleet_request = { name : string_ [@ocaml.doc "The name of the fleet.\n"] }
[@@ocaml.doc ""]

type nonrec delete_image_result = {
  image : image option; [@ocaml.doc "Information about the image.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_image_request = { name : name [@ocaml.doc "The name of the image.\n"] }
[@@ocaml.doc ""]

type nonrec delete_image_builder_result = {
  image_builder : image_builder option; [@ocaml.doc "Information about the image builder.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_image_builder_request = {
  name : name; [@ocaml.doc "The name of the image builder.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_image_permissions_result = unit [@@ocaml.doc ""]

type nonrec delete_image_permissions_request = {
  name : name; [@ocaml.doc "The name of the private image.\n"]
  shared_account_id : aws_account_id;
      [@ocaml.doc
        "The 12-digit identifier of the AWS account for which to delete image permissions.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_stack_result = unit [@@ocaml.doc ""]

type nonrec delete_stack_request = { name : string_ [@ocaml.doc "The name of the stack.\n"] }
[@@ocaml.doc ""]

type nonrec delete_theme_for_stack_result = unit [@@ocaml.doc ""]

type nonrec delete_theme_for_stack_request = {
  stack_name : name; [@ocaml.doc "The name of the stack for the theme.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_usage_report_subscription_result = unit [@@ocaml.doc ""]

type nonrec delete_usage_report_subscription_request = unit [@@ocaml.doc ""]

type nonrec delete_user_result = unit [@@ocaml.doc ""]

type nonrec delete_user_request = {
  user_name : username;
      [@ocaml.doc
        "The email address of the user.\n\n  Users' email addresses are case-sensitive.\n  \n   "]
  authentication_type : authentication_type;
      [@ocaml.doc "The authentication type for the user. You must specify USERPOOL.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_block_builder_app_block_associations_result = {
  app_block_builder_app_block_associations : app_block_builder_app_block_associations_list option;
      [@ocaml.doc "This list of app block builders associated with app blocks.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_block_builder_app_block_associations_request = {
  app_block_arn : arn option; [@ocaml.doc "The ARN of the app block.\n"]
  app_block_builder_name : name option; [@ocaml.doc "The name of the app block builder.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_block_builders_result = {
  app_block_builders : app_block_builder_list option;
      [@ocaml.doc "The list that describes one or more app block builders.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_block_builders_request = {
  names : string_list option; [@ocaml.doc "The names of the app block builders.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
  max_results : integer option;
      [@ocaml.doc "The maximum size of each page of results. The maximum value is 25.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_blocks_result = {
  app_blocks : app_blocks option; [@ocaml.doc "The app blocks in the list.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_blocks_request = {
  arns : arn_list option; [@ocaml.doc "The ARNs of the app blocks.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_license_usage_result = {
  app_license_usages : admin_app_license_usage_list option;
      [@ocaml.doc "Collection of license usage records.\n"]
  next_token : string_ option; [@ocaml.doc "Token for pagination of results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_app_license_usage_request = {
  billing_period : string_;
      [@ocaml.doc
        "Billing period for the usage record.\n\n\
        \ Specify the value in {i yyyy-mm} format. For example, for August 2025, use {i 2025-08}.\n\
        \ "]
  max_results : integer option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : string_ option; [@ocaml.doc "Token for pagination of results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_fleet_associations_result = {
  application_fleet_associations : application_fleet_association_list option;
      [@ocaml.doc "The application fleet associations in the list.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_application_fleet_associations_request = {
  fleet_name : name option; [@ocaml.doc "The name of the fleet.\n"]
  application_arn : arn option; [@ocaml.doc "The ARN of the application.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_applications_result = {
  applications : applications option; [@ocaml.doc "The applications in the list.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_applications_request = {
  arns : arn_list option; [@ocaml.doc "The ARNs for the applications.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec directory_config_list = directory_config list [@@ocaml.doc ""]

type nonrec describe_directory_configs_result = {
  directory_configs : directory_config_list option;
      [@ocaml.doc
        "Information about the directory configurations. Note that although the response syntax in \
         this topic includes the account password, this password is not returned in the actual \
         response. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec directory_name_list = directory_name list [@@ocaml.doc ""]

type nonrec describe_directory_configs_request = {
  directory_names : directory_name_list option; [@ocaml.doc "The directory names.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec entitlement_list = entitlement list [@@ocaml.doc ""]

type nonrec describe_entitlements_result = {
  entitlements : entitlement_list option; [@ocaml.doc "The entitlements.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entitlements_request = {
  name : name option; [@ocaml.doc "The name of the entitlement.\n"]
  stack_name : name;
      [@ocaml.doc "The name of the stack with which the entitlement is associated.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_list = fleet list [@@ocaml.doc ""]

type nonrec describe_fleets_result = {
  fleets : fleet_list option; [@ocaml.doc "Information about the fleets.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleets_request = {
  names : string_list option; [@ocaml.doc "The names of the fleets to describe.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec image_builder_list = image_builder list [@@ocaml.doc ""]

type nonrec describe_image_builders_result = {
  image_builders : image_builder_list option; [@ocaml.doc "Information about the image builders.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_image_builders_request = {
  names : string_list option; [@ocaml.doc "The names of the image builders to describe.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec shared_image_permissions = {
  shared_account_id : aws_account_id;
      [@ocaml.doc "The 12-digit identifier of the AWS account with which the image is shared.\n"]
  image_permissions : image_permissions;
      [@ocaml.doc "Describes the permissions for a shared image.\n"]
}
[@@ocaml.doc
  "Describes the permissions that are available to the specified AWS account for a shared image.\n"]

type nonrec shared_image_permissions_list = shared_image_permissions list [@@ocaml.doc ""]

type nonrec describe_image_permissions_result = {
  name : name option; [@ocaml.doc "The name of the private image.\n"]
  shared_image_permissions_list : shared_image_permissions_list option;
      [@ocaml.doc "The permissions for a private image that you own. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec describe_image_permissions_request = {
  name : name;
      [@ocaml.doc
        "The name of the private image for which to describe permissions. The image must be one \
         that you own. \n"]
  max_results : max_results option; [@ocaml.doc "The maximum size of each page of results.\n"]
  shared_aws_account_ids : aws_account_id_list option;
      [@ocaml.doc
        "The 12-digit identifier of one or more AWS accounts with which the image is shared.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec image_list = image list [@@ocaml.doc ""]

type nonrec describe_images_result = {
  images : image_list option; [@ocaml.doc "Information about the images.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_images_max_results = int [@@ocaml.doc ""]

type nonrec describe_images_request = {
  names : string_list option;
      [@ocaml.doc "The names of the public or private images to describe.\n"]
  arns : arn_list option;
      [@ocaml.doc "The ARNs of the public, private, and shared images to describe.\n"]
  type_ : visibility_type option;
      [@ocaml.doc "The type of image (public, private, or shared) to describe. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
  max_results : describe_images_max_results option;
      [@ocaml.doc "The maximum size of each page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_drain_status =
  | ACTIVE [@ocaml.doc ""]
  | DRAINING [@ocaml.doc ""]
  | NOT_APPLICABLE [@ocaml.doc ""]
[@@ocaml.doc "Possible values for the drain status of a streaming instance.\n"]

type nonrec session_connection_state = CONNECTED [@ocaml.doc ""] | NOT_CONNECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec session_state =
  | ACTIVE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
[@@ocaml.doc "Possible values for the state of a streaming session.\n"]

type nonrec user_id = string [@@ocaml.doc ""]

type nonrec session = {
  id : string_; [@ocaml.doc "The identifier of the streaming session.\n"]
  user_id : user_id; [@ocaml.doc "The identifier of the user for whom the session was created.\n"]
  stack_name : string_; [@ocaml.doc "The name of the stack for the streaming session.\n"]
  fleet_name : string_; [@ocaml.doc "The name of the fleet for the streaming session.\n"]
  state : session_state; [@ocaml.doc "The current state of the streaming session.\n"]
  connection_state : session_connection_state option;
      [@ocaml.doc "Specifies whether a user is connected to the streaming session.\n"]
  start_time : timestamp option;
      [@ocaml.doc "The time when a streaming instance is dedicated for the user.\n"]
  max_expiration_time : timestamp option;
      [@ocaml.doc
        "The time when the streaming session is set to expire. This time is based on the \
         [MaxUserDurationinSeconds] value, which determines the maximum length of time that a \
         streaming session can run. A streaming session might end earlier than the time specified \
         in [SessionMaxExpirationTime], when the [DisconnectTimeOutInSeconds] elapses or the user \
         chooses to end his or her session. If the [DisconnectTimeOutInSeconds] elapses, or the \
         user chooses to end his or her session, the streaming instance is terminated and the \
         streaming session ends.\n"]
  authentication_type : authentication_type option;
      [@ocaml.doc
        "The authentication method. The user is authenticated using a streaming URL ([API]) or \
         SAML 2.0 federation ([SAML]).\n"]
  network_access_configuration : network_access_configuration option;
      [@ocaml.doc "The network details for the streaming session.\n"]
  instance_id : string_ option;
      [@ocaml.doc "The identifier for the instance hosting the session.\n"]
  instance_drain_status : instance_drain_status option;
      [@ocaml.doc
        "The drain status of the instance hosting the streaming session. This only applies to \
         multi-session fleets.\n"]
}
[@@ocaml.doc "Describes a streaming session.\n"]

type nonrec session_list = session list [@@ocaml.doc ""]

type nonrec describe_sessions_result = {
  sessions : session_list option; [@ocaml.doc "Information about the streaming sessions.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_sessions_request = {
  stack_name : name; [@ocaml.doc "The name of the stack. This value is case-sensitive.\n"]
  fleet_name : name; [@ocaml.doc "The name of the fleet. This value is case-sensitive.\n"]
  user_id : user_id option;
      [@ocaml.doc
        "The user identifier (ID). If you specify a user ID, you must also specify the \
         authentication type.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
  limit : integer option;
      [@ocaml.doc
        "The size of each page of results. The default value is 20 and the maximum value is 50.\n"]
  authentication_type : authentication_type option;
      [@ocaml.doc
        "The authentication method. Specify [API] for a user authenticated using a streaming URL \
         or [SAML] for a SAML federated user. The default is to authenticate users using a \
         streaming URL.\n"]
  instance_id : string_ option; [@ocaml.doc "The identifier for the instance hosting the session.\n"]
}
[@@ocaml.doc ""]

type nonrec software_deployment_status =
  | STAGED_FOR_INSTALLATION [@ocaml.doc ""]
  | PENDING_INSTALLATION [@ocaml.doc ""]
  | INSTALLED [@ocaml.doc ""]
  | STAGED_FOR_UNINSTALLATION [@ocaml.doc ""]
  | PENDING_UNINSTALLATION [@ocaml.doc ""]
  | FAILED_TO_INSTALL [@ocaml.doc ""]
  | FAILED_TO_UNINSTALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec software_associations = {
  software_name : string_ option;
      [@ocaml.doc
        "The name of the license-included application.\n\n\
        \ Possible values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  status : software_deployment_status option;
      [@ocaml.doc "The deployment status of the license-included application.\n"]
  deployment_error : error_details_list option;
      [@ocaml.doc "The error details for failed deployments of the license-included application.\n"]
}
[@@ocaml.doc "The association between a license-included application and a resource.\n"]

type nonrec software_associations_list = software_associations list [@@ocaml.doc ""]

type nonrec describe_software_associations_result = {
  associated_resource : arn option;
      [@ocaml.doc "The ARN of the resource to describe software associations.\n"]
  software_associations : software_associations_list option;
      [@ocaml.doc
        "Collection of license included applications association details including:\n\n\
        \ {ul\n\
        \       {-  License included application name and version information\n\
        \           \n\
        \            }\n\
        \       {-  Deployment status (SoftwareDeploymentStatus enum)\n\
        \           \n\
        \            }\n\
        \       {-  Error details for failed deployments\n\
        \           \n\
        \            }\n\
        \       {-  Association timestamps\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_software_associations_request = {
  associated_resource : arn;
      [@ocaml.doc
        "The ARN of the resource to describe software associations. Possible resources are Image \
         and ImageBuilder.\n"]
  max_results : integer option; [@ocaml.doc "The maximum number of results to return.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec stack_list = stack list [@@ocaml.doc ""]

type nonrec describe_stacks_result = {
  stacks : stack_list option; [@ocaml.doc "Information about the stacks.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_stacks_request = {
  names : string_list option; [@ocaml.doc "The names of the stacks to describe.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_theme_for_stack_result = {
  theme : theme option;
      [@ocaml.doc " The theme object that contains the metadata of the custom branding.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_theme_for_stack_request = {
  stack_name : name; [@ocaml.doc "The name of the stack for the theme.\n"]
}
[@@ocaml.doc ""]

type nonrec usage_report_execution_error_code =
  | RESOURCE_NOT_FOUND [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
  | INTERNAL_SERVICE_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec last_report_generation_execution_error = {
  error_code : usage_report_execution_error_code option;
      [@ocaml.doc
        "The error code for the error that is returned when a usage report can't be generated.\n"]
  error_message : string_ option;
      [@ocaml.doc
        "The error message for the error that is returned when a usage report can't be generated.\n"]
}
[@@ocaml.doc "Describes the error that is returned when a usage report can't be generated.\n"]

type nonrec last_report_generation_execution_errors = last_report_generation_execution_error list
[@@ocaml.doc ""]

type nonrec usage_report_subscription = {
  s3_bucket_name : string_ option;
      [@ocaml.doc
        "The Amazon S3 bucket where generated reports are stored.\n\n\
        \ If you enabled on-instance session scripts and Amazon S3 logging for your session script \
         configuration, WorkSpaces Applications created an S3 bucket to store the script output. \
         The bucket is unique to your account and Region. When you enable usage reporting in this \
         case, WorkSpaces Applications uses the same bucket to store your usage reports. If you \
         haven't already enabled on-instance session scripts, when you enable usage reports, \
         WorkSpaces Applications creates a new S3 bucket.\n\
        \ "]
  schedule : usage_report_schedule option;
      [@ocaml.doc "The schedule for generating usage reports.\n"]
  last_generated_report_date : timestamp option;
      [@ocaml.doc "The time when the last usage report was generated.\n"]
  subscription_errors : last_report_generation_execution_errors option;
      [@ocaml.doc "The errors that were returned if usage reports couldn't be generated.\n"]
}
[@@ocaml.doc "Describes information about the usage report subscription.\n"]

type nonrec usage_report_subscription_list = usage_report_subscription list [@@ocaml.doc ""]

type nonrec describe_usage_report_subscriptions_result = {
  usage_report_subscriptions : usage_report_subscription_list option;
      [@ocaml.doc "Information about the usage report subscription.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_usage_report_subscriptions_request = {
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_user_stack_associations_result = {
  user_stack_associations : user_stack_association_list option;
      [@ocaml.doc "The UserStackAssociation objects.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_user_stack_associations_request = {
  stack_name : string_ option;
      [@ocaml.doc "The name of the stack that is associated with the user.\n"]
  user_name : username option;
      [@ocaml.doc
        "The email address of the user who is associated with the stack.\n\n\
        \  Users' email addresses are case-sensitive.\n\
        \  \n\
        \   "]
  authentication_type : authentication_type option;
      [@ocaml.doc
        "The authentication type for the user who is associated with the stack. You must specify \
         USERPOOL.\n"]
  max_results : max_results option; [@ocaml.doc "The maximum size of each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec user = {
  arn : arn option; [@ocaml.doc "The ARN of the user.\n"]
  user_name : username option;
      [@ocaml.doc
        "The email address of the user.\n\n  Users' email addresses are case-sensitive.\n  \n   "]
  enabled : boolean_ option;
      [@ocaml.doc "Specifies whether the user in the user pool is enabled.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the user in the user pool. The status can be one of the following:\n\n\
        \ {ul\n\
        \       {-  UNCONFIRMED \226\128\147 The user is created but not confirmed.\n\
        \           \n\
        \            }\n\
        \       {-  CONFIRMED \226\128\147 The user is confirmed.\n\
        \           \n\
        \            }\n\
        \       {-  ARCHIVED \226\128\147 The user is no longer active.\n\
        \           \n\
        \            }\n\
        \       {-  COMPROMISED \226\128\147 The user is disabled because of a potential security \
         threat.\n\
        \           \n\
        \            }\n\
        \       {-  UNKNOWN \226\128\147 The user status is not known.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  first_name : user_attribute_value option;
      [@ocaml.doc "The first name, or given name, of the user.\n"]
  last_name : user_attribute_value option; [@ocaml.doc "The last name, or surname, of the user.\n"]
  created_time : timestamp option;
      [@ocaml.doc "The date and time the user was created in the user pool.\n"]
  authentication_type : authentication_type; [@ocaml.doc "The authentication type for the user.\n"]
}
[@@ocaml.doc "Describes a user in the user pool.\n"]

type nonrec user_list = user list [@@ocaml.doc ""]

type nonrec describe_users_result = {
  users : user_list option; [@ocaml.doc "Information about users in the user pool.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_users_request = {
  authentication_type : authentication_type;
      [@ocaml.doc
        "The authentication type for the users in the user pool to describe. You must specify \
         USERPOOL.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_user_result = unit [@@ocaml.doc ""]

type nonrec disable_user_request = {
  user_name : username;
      [@ocaml.doc
        "The email address of the user.\n\n  Users' email addresses are case-sensitive.\n  \n   "]
  authentication_type : authentication_type;
      [@ocaml.doc "The authentication type for the user. You must specify USERPOOL.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_app_block_builder_app_block_result = unit [@@ocaml.doc ""]

type nonrec disassociate_app_block_builder_app_block_request = {
  app_block_arn : arn; [@ocaml.doc "The ARN of the app block.\n"]
  app_block_builder_name : name; [@ocaml.doc "The name of the app block builder.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_application_fleet_result = unit [@@ocaml.doc ""]

type nonrec disassociate_application_fleet_request = {
  fleet_name : name; [@ocaml.doc "The name of the fleet.\n"]
  application_arn : arn; [@ocaml.doc "The ARN of the application.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_application_from_entitlement_result = unit [@@ocaml.doc ""]

type nonrec disassociate_application_from_entitlement_request = {
  stack_name : name;
      [@ocaml.doc "The name of the stack with which the entitlement is associated.\n"]
  entitlement_name : name; [@ocaml.doc "The name of the entitlement.\n"]
  application_identifier : string_;
      [@ocaml.doc "The identifier of the application to remove from the entitlement.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_fleet_result = unit [@@ocaml.doc ""]

type nonrec disassociate_fleet_request = {
  fleet_name : string_; [@ocaml.doc "The name of the fleet.\n"]
  stack_name : string_; [@ocaml.doc "The name of the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_software_from_image_builder_result = unit [@@ocaml.doc ""]

type nonrec disassociate_software_from_image_builder_request = {
  image_builder_name : name; [@ocaml.doc "The name of the target image builder instance.\n"]
  software_names : string_list;
      [@ocaml.doc
        "The list of license included applications to disassociate from the image builder.\n\n\
        \ Possible values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Professional_Plus_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Professional_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Office_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2021_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Visio_2024_LTSC_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2021_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_32Bit\n\
        \            \n\
        \             }\n\
        \        {-  Microsoft_Project_2024_Standard_64Bit\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec drain_session_instance_result = unit [@@ocaml.doc ""]

type nonrec drain_session_instance_request = {
  session_id : string_; [@ocaml.doc "The identifier of the streaming session.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_user_result = unit [@@ocaml.doc ""]

type nonrec enable_user_request = {
  user_name : username;
      [@ocaml.doc
        "The email address of the user.\n\n\
        \  Users' email addresses are case-sensitive. During login, if they specify an email \
         address that doesn't use the same capitalization as the email address specified when \
         their user pool account was created, a \"user does not exist\" error message displays. \n\
        \  \n\
        \   "]
  authentication_type : authentication_type;
      [@ocaml.doc "The authentication type for the user. You must specify USERPOOL.\n"]
}
[@@ocaml.doc ""]

type nonrec entitled_application = {
  application_identifier : string_; [@ocaml.doc "The identifier of the application.\n"]
}
[@@ocaml.doc
  "The application associated to an entitlement. Access is controlled based on user attributes.\n"]

type nonrec entitled_application_list = entitled_application list [@@ocaml.doc ""]

type nonrec expire_session_result = unit [@@ocaml.doc ""]

type nonrec expire_session_request = {
  session_id : string_; [@ocaml.doc "The identifier of the streaming session.\n"]
}
[@@ocaml.doc ""]

type nonrec export_image_tasks = export_image_task list [@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec filter = {
  name : filter_name;
      [@ocaml.doc
        "The name of the filter. Valid filter names depend on the operation being performed.\n"]
  values : filter_values;
      [@ocaml.doc
        "The values for the filter. Multiple values can be specified for a single filter name.\n"]
}
[@@ocaml.doc
  "A filter for narrowing down the results when listing export image tasks. Filters allow you to \
   specify criteria such as task state or creation date.\n"]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec fleet_attribute =
  | VPC_CONFIGURATION [@ocaml.doc ""]
  | VPC_CONFIGURATION_SECURITY_GROUP_IDS [@ocaml.doc ""]
  | DOMAIN_JOIN_INFO [@ocaml.doc ""]
  | IAM_ROLE_ARN [@ocaml.doc ""]
  | USB_DEVICE_FILTER_STRINGS [@ocaml.doc ""]
  | SESSION_SCRIPT_S3_LOCATION [@ocaml.doc ""]
  | MAX_SESSIONS_PER_INSTANCE [@ocaml.doc ""]
  | VOLUME_CONFIGURATION [@ocaml.doc ""]
[@@ocaml.doc "The fleet attribute.\n"]

type nonrec fleet_attributes = fleet_attribute list [@@ocaml.doc ""]

type nonrec get_export_image_task_result = {
  export_image_task : export_image_task option;
      [@ocaml.doc
        "Information about the export image task, including its current state, created date, and \
         any error details.\n"]
}
[@@ocaml.doc ""]

type nonrec get_export_image_task_request = {
  task_id : uui_d option;
      [@ocaml.doc "The unique identifier of the export image task to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec list_associated_fleets_result = {
  names : string_list option; [@ocaml.doc "The name of the fleet.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec list_associated_fleets_request = {
  stack_name : string_; [@ocaml.doc "The name of the stack.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_associated_stacks_result = {
  names : string_list option; [@ocaml.doc "The name of the stack.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         there are no more pages, this value is null.\n"]
}
[@@ocaml.doc ""]

type nonrec list_associated_stacks_request = {
  fleet_name : string_; [@ocaml.doc "The name of the fleet.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use to retrieve the next page of results for this operation. If \
         this value is null, it retrieves the first page.\n"]
}
[@@ocaml.doc ""]

type nonrec list_entitled_applications_result = {
  entitled_applications : entitled_application_list option;
      [@ocaml.doc "The entitled applications.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec list_entitled_applications_request = {
  stack_name : name;
      [@ocaml.doc "The name of the stack with which the entitlement is associated.\n"]
  entitlement_name : name; [@ocaml.doc "The name of the entitlement.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token used to retrieve the next page of results for this operation.\n"]
  max_results : integer option; [@ocaml.doc "The maximum size of each page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_export_image_tasks_result = {
  export_image_tasks : export_image_tasks option;
      [@ocaml.doc "The list of export image tasks that match the specified criteria.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token to use for retrieving the next page of results. This field is only \
         present when there are more results available.\n"]
}
[@@ocaml.doc ""]

type nonrec list_export_image_tasks_request = {
  filters : filters option;
      [@ocaml.doc
        "Optional filters to apply when listing export image tasks. Filters help you narrow down \
         the results based on specific criteria.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of export image tasks to return in a single request. The valid range \
         is 1-500, with a default of 50.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token from a previous request. Use this to retrieve the next page of \
         results when there are more tasks than the MaxResults limit.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "The information about the tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec update_theme_for_stack_result = {
  theme : theme option;
      [@ocaml.doc " The theme object that contains the metadata of the custom branding.\n"]
}
[@@ocaml.doc ""]

type nonrec theme_attribute = FOOTER_LINKS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec theme_attributes = theme_attribute list [@@ocaml.doc ""]

type nonrec update_theme_for_stack_request = {
  stack_name : name; [@ocaml.doc "The name of the stack for the theme.\n"]
  footer_links : theme_footer_links option;
      [@ocaml.doc
        "The links that are displayed in the footer of the streaming application catalog page. \
         These links are helpful resources for users, such as the organization's IT support and \
         product marketing sites.\n"]
  title_text : theme_title_text option;
      [@ocaml.doc
        "The title that is displayed at the top of the browser tab during users' application \
         streaming sessions.\n"]
  theme_styling : theme_styling option;
      [@ocaml.doc
        "The color theme that is applied to website links, text, and buttons. These colors are \
         also applied as accents in the background for the streaming application catalog page.\n"]
  organization_logo_s3_location : s3_location option;
      [@ocaml.doc "The organization logo that appears on the streaming application catalog page.\n"]
  favicon_s3_location : s3_location option;
      [@ocaml.doc
        "The S3 location of the favicon. The favicon enables users to recognize their application \
         streaming site in a browser full of tabs or bookmarks. It is displayed at the top of the \
         browser tab for the application streaming site during users' streaming sessions.\n"]
  state : theme_state option;
      [@ocaml.doc "Specifies whether custom branding should be applied to catalog page or not.\n"]
  attributes_to_delete : theme_attributes option; [@ocaml.doc "The attributes to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec update_stack_result = {
  stack : stack option; [@ocaml.doc "Information about the stack.\n"]
}
[@@ocaml.doc ""]

type nonrec stack_attribute =
  | STORAGE_CONNECTORS [@ocaml.doc ""]
  | STORAGE_CONNECTOR_HOMEFOLDERS [@ocaml.doc ""]
  | STORAGE_CONNECTOR_GOOGLE_DRIVE [@ocaml.doc ""]
  | STORAGE_CONNECTOR_ONE_DRIVE [@ocaml.doc ""]
  | REDIRECT_URL [@ocaml.doc ""]
  | FEEDBACK_URL [@ocaml.doc ""]
  | THEME_NAME [@ocaml.doc ""]
  | USER_SETTINGS [@ocaml.doc ""]
  | EMBED_HOST_DOMAINS [@ocaml.doc ""]
  | IAM_ROLE_ARN [@ocaml.doc ""]
  | ACCESS_ENDPOINTS [@ocaml.doc ""]
  | STREAMING_EXPERIENCE_SETTINGS [@ocaml.doc ""]
  | CONTENT_REDIRECTION [@ocaml.doc ""]
  | AGENT_ACCESS_CONFIG [@ocaml.doc ""]
[@@ocaml.doc
  "The stack attributes to delete.\n\n\
  \ {ul\n\
  \       {-  STORAGE_CONNECTORS\n\
  \           \n\
  \            }\n\
  \       {-  STORAGE_CONNECTOR_HOMEFOLDERS\n\
  \           \n\
  \            }\n\
  \       {-  STORAGE_CONNECTOR_GOOGLE_DRIVE\n\
  \           \n\
  \            }\n\
  \       {-  STORAGE_CONNECTOR_ONE_DRIVE\n\
  \           \n\
  \            }\n\
  \       {-  REDIRECT_URL\n\
  \           \n\
  \            }\n\
  \       {-  FEEDBACK_URL\n\
  \           \n\
  \            }\n\
  \       {-  THEME_NAME\n\
  \           \n\
  \            }\n\
  \       {-  USER_SETTINGS\n\
  \           \n\
  \            }\n\
  \       {-  EMBED_HOST_DOMAINS\n\
  \           \n\
  \            }\n\
  \       {-  IAM_ROLE_ARN\n\
  \           \n\
  \            }\n\
  \       {-  ACCESS_ENDPOINTS\n\
  \           \n\
  \            }\n\
  \       {-  STREAMING_EXPERIENCE_SETTINGS\n\
  \           \n\
  \            }\n\
  \       {-  AGENT_ACCESS_CONFIG\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec stack_attributes = stack_attribute list [@@ocaml.doc ""]

type nonrec update_stack_request = {
  display_name : display_name option; [@ocaml.doc "The stack name to display.\n"]
  description : description option; [@ocaml.doc "The description to display.\n"]
  name : string_; [@ocaml.doc "The name of the stack.\n"]
  storage_connectors : storage_connector_list option;
      [@ocaml.doc "The storage connectors to enable.\n"]
  delete_storage_connectors : boolean_ option;
      [@ocaml.doc "Deletes the storage connectors currently enabled for the stack.\n"]
  redirect_ur_l : redirect_ur_l option;
      [@ocaml.doc "The URL that users are redirected to after their streaming session ends.\n"]
  feedback_ur_l : feedback_ur_l option;
      [@ocaml.doc
        "The URL that users are redirected to after they choose the Send Feedback link. If no URL \
         is specified, no Send Feedback link is displayed.\n"]
  attributes_to_delete : stack_attributes option; [@ocaml.doc "The stack attributes to delete.\n"]
  user_settings : user_setting_list option;
      [@ocaml.doc
        "The actions that are enabled or disabled for users during their streaming sessions. By \
         default, these actions are enabled.\n"]
  application_settings : application_settings option;
      [@ocaml.doc
        "The persistent application settings for users of a stack. When these settings are \
         enabled, changes that users make to applications and Windows settings are automatically \
         saved after each session and applied to the next session.\n"]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of interface VPC endpoint (interface endpoint) objects. Users of the stack can \
         connect to WorkSpaces Applications only through the specified endpoints.\n"]
  embed_host_domains : embed_host_domains option;
      [@ocaml.doc
        "The domains where WorkSpaces Applications streaming sessions can be embedded in an \
         iframe. You must approve the domains that you want to host embedded WorkSpaces \
         Applications streaming sessions. \n"]
  streaming_experience_settings : streaming_experience_settings option;
      [@ocaml.doc
        "The streaming protocol you want your stack to prefer. This can be UDP or TCP. Currently, \
         UDP is only supported in the Windows native client.\n"]
  content_redirection : content_redirection option; [@ocaml.doc ""]
  agent_access_config : agent_access_config_for_update option;
      [@ocaml.doc
        "The configuration for agent access on the stack. Specify this to update agent access \
         settings. To remove agent access, use AttributesToDelete with the AGENT_ACCESS_CONFIG \
         value.\n"]
}
[@@ocaml.doc ""]

type nonrec update_image_permissions_result = unit [@@ocaml.doc ""]

type nonrec update_image_permissions_request = {
  name : name; [@ocaml.doc "The name of the private image.\n"]
  shared_account_id : aws_account_id;
      [@ocaml.doc
        "The 12-digit identifier of the AWS account for which you want add or update image \
         permissions.\n"]
  image_permissions : image_permissions; [@ocaml.doc "The permissions for the image.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fleet_result = {
  fleet : fleet option; [@ocaml.doc "Information about the fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fleet_request = {
  image_name : string_ option; [@ocaml.doc "The name of the image used to create the fleet.\n"]
  image_arn : arn option; [@ocaml.doc "The ARN of the public, private, or shared image to use.\n"]
  name : name option; [@ocaml.doc "A unique name for the fleet.\n"]
  instance_type : string_ option;
      [@ocaml.doc
        "The instance type to use when launching fleet instances. The following instance types are \
         available:\n\n\
        \ {ul\n\
        \       {-  stream.standard.small\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.medium\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.compute.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.3xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.6xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.memory.z1d.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g4dn.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g5.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.16xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.12xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6.24xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6.8xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.2xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.g6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.graphics.gr6f.4xlarge\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The following instance types are available for Elastic fleets:\n\
        \   \n\
        \    {ul\n\
        \          {-  stream.standard.small\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.medium\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.large\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.xlarge\n\
        \              \n\
        \               }\n\
        \          {-  stream.standard.2xlarge\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  compute_capacity : compute_capacity option;
      [@ocaml.doc "The desired capacity for the fleet. This is not allowed for Elastic fleets.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "The VPC configuration for the fleet. This is required for Elastic fleets, but not \
         required for other fleet types. Elastic fleets require that you specify at least two \
         subnets in different availability zones. \n"]
  max_user_duration_in_seconds : integer option;
      [@ocaml.doc
        "The maximum amount of time that a streaming session can remain active, in seconds. If \
         users are still connected to a streaming instance five minutes before this limit is \
         reached, they are prompted to save any open documents before being disconnected. After \
         this time elapses, the instance is terminated and replaced by a new instance.\n\n\
        \ Specify a value between 600 and 432000.\n\
        \ "]
  disconnect_timeout_in_seconds : integer option;
      [@ocaml.doc
        "The amount of time that a streaming session remains active after users disconnect. If \
         users try to reconnect to the streaming session after a disconnection or network \
         interruption within this time interval, they are connected to their previous session. \
         Otherwise, they are connected to a new session with a new streaming instance. \n\n\
        \ Specify a value between 60 and 36000.\n\
        \ "]
  delete_vpc_config : boolean_ option;
      [@ocaml.doc "Deletes the VPC association for the specified fleet.\n"]
  description : description option; [@ocaml.doc "The description to display.\n"]
  display_name : display_name option; [@ocaml.doc "The fleet name to display.\n"]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc "Enables or disables default internet access for the fleet.\n"]
  domain_join_info : domain_join_info option;
      [@ocaml.doc
        "The name of the directory and organizational unit (OU) to use to join the fleet to a \
         Microsoft Active Directory domain. \n"]
  idle_disconnect_timeout_in_seconds : integer option;
      [@ocaml.doc
        "The amount of time that users can be idle (inactive) before they are disconnected from \
         their streaming session and the [DisconnectTimeoutInSeconds] time interval begins. Users \
         are notified before they are disconnected due to inactivity. If users try to reconnect to \
         the streaming session before the time interval specified in [DisconnectTimeoutInSeconds] \
         elapses, they are connected to their previous session. Users are considered idle when \
         they stop providing keyboard or mouse input during their streaming session. File uploads \
         and downloads, audio in, audio out, and pixels changing do not qualify as user activity. \
         If users continue to be idle after the time interval in [IdleDisconnectTimeoutInSeconds] \
         elapses, they are disconnected. \n\n\
        \ To prevent users from being disconnected due to inactivity, specify a value of 0. \
         Otherwise, specify a value between 60 and 36000. The default value is 0.\n\
        \ \n\
        \   If you enable this feature, we recommend that you specify a value that corresponds \
         exactly to a whole number of minutes (for example, 60, 120, and 180). If you don't do \
         this, the value is rounded to the nearest minute. For example, if you specify a value of \
         70, users are disconnected after 1 minute of inactivity. If you specify a value that is \
         at the midpoint between two different minutes, the value is rounded up. For example, if \
         you specify a value of 90, users are disconnected after 2 minutes of inactivity. \n\
        \   \n\
        \    "]
  attributes_to_delete : fleet_attributes option; [@ocaml.doc "The fleet attributes to delete.\n"]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to apply to the fleet. To assume a role, a \
         fleet instance calls the AWS Security Token Service (STS) [AssumeRole] API operation and \
         passes the ARN of the role to use. The operation creates a new session with temporary \
         credentials. WorkSpaces Applications retrieves the temporary credentials and creates the \
         {b appstream_machine_role} credential profile on the instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html}Using \
         an IAM Role to Grant Permissions to Applications and Scripts Running on WorkSpaces \
         Applications Streaming Instances} in the {i Amazon WorkSpaces Applications Administration \
         Guide}.\n\
        \ "]
  stream_view : stream_view option;
      [@ocaml.doc
        "The WorkSpaces Applications view that is displayed to your users when they stream from \
         the fleet. When [APP] is specified, only the windows of applications opened by users \
         display. When [DESKTOP] is specified, the standard desktop that is provided by the \
         operating system displays.\n\n\
        \ The default value is [APP].\n\
        \ "]
  platform : platform_type option;
      [@ocaml.doc
        "The platform of the fleet. WINDOWS_SERVER_2019, AMAZON_LINUX2 and UBUNTU_PRO_2404 are \
         supported for Elastic fleets. \n"]
  max_concurrent_sessions : integer option;
      [@ocaml.doc "The maximum number of concurrent sessions for a fleet.\n"]
  usb_device_filter_strings : usb_device_filter_strings option;
      [@ocaml.doc
        "The USB device filter strings that specify which USB devices a user can redirect to the \
         fleet streaming session, when using the Windows native client. This is allowed but not \
         required for Elastic fleets.\n"]
  session_script_s3_location : s3_location option;
      [@ocaml.doc
        "The S3 location of the session scripts configuration zip file. This only applies to \
         Elastic fleets. \n"]
  max_sessions_per_instance : integer option;
      [@ocaml.doc
        "The maximum number of user sessions on an instance. This only applies to multi-session \
         fleets.\n"]
  root_volume_config : volume_config option;
      [@ocaml.doc
        "The updated configuration for the root volume of fleet instances. Note that volume size \
         cannot be decreased below the image volume size.\n"]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Set to true to disable Instance Metadata Service Version 1 (IMDSv1) and enforce IMDSv2. \
         Set to false to enable both IMDSv1 and IMDSv2.\n\n\
        \  Before disabling IMDSv1, ensure your WorkSpaces Applications images are running the \
         agent version or managed image update released on or after January 16, 2024 to support \
         IMDSv2 enforcement.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec update_entitlement_result = {
  entitlement : entitlement option; [@ocaml.doc "The entitlement.\n"]
}
[@@ocaml.doc ""]

type nonrec update_entitlement_request = {
  name : name; [@ocaml.doc "The name of the entitlement.\n"]
  stack_name : name;
      [@ocaml.doc "The name of the stack with which the entitlement is associated.\n"]
  description : description option; [@ocaml.doc "The description of the entitlement.\n"]
  app_visibility : app_visibility option;
      [@ocaml.doc "Specifies whether all or only selected apps are entitled.\n"]
  attributes : entitlement_attribute_list option; [@ocaml.doc "The attributes of the entitlement.\n"]
}
[@@ocaml.doc ""]

type nonrec update_directory_config_result = {
  directory_config : directory_config option;
      [@ocaml.doc "Information about the Directory Config object.\n"]
}
[@@ocaml.doc ""]

type nonrec update_directory_config_request = {
  directory_name : directory_name; [@ocaml.doc "The name of the Directory Config object.\n"]
  organizational_unit_distinguished_names : organizational_unit_distinguished_names_list option;
      [@ocaml.doc "The distinguished names of the organizational units for computer accounts.\n"]
  service_account_credentials : service_account_credentials option;
      [@ocaml.doc
        "The credentials for the service account used by the fleet or image builder to connect to \
         the directory.\n"]
  certificate_based_auth_properties : certificate_based_auth_properties option;
      [@ocaml.doc
        "The certificate-based authentication properties used to authenticate SAML 2.0 Identity \
         Provider (IdP) user identities to Active Directory domain-joined streaming instances. \
         Fallback is turned on by default when certificate-based authentication is {b Enabled} . \
         Fallback allows users to log in using their AD domain password if certificate-based \
         authentication is unsuccessful, or to unlock a desktop lock screen. {b \
         Enabled_no_directory_login_fallback} enables certificate-based authentication, but does \
         not allow users to log in using their AD domain password. Users will be disconnected to \
         re-authenticate using certificates.\n"]
}
[@@ocaml.doc ""]

type nonrec update_application_result = { application : application option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec update_application_request = {
  name : name;
      [@ocaml.doc
        "The name of the application. This name is visible to users when display name is not \
         specified.\n"]
  display_name : display_name option;
      [@ocaml.doc
        "The display name of the application. This name is visible to users in the application \
         catalog.\n"]
  description : description option; [@ocaml.doc "The description of the application.\n"]
  icon_s3_location : s3_location option; [@ocaml.doc "The icon S3 location of the application.\n"]
  launch_path : string_ option; [@ocaml.doc "The launch path of the application.\n"]
  working_directory : string_ option; [@ocaml.doc "The working directory of the application.\n"]
  launch_parameters : string_ option; [@ocaml.doc "The launch parameters of the application.\n"]
  app_block_arn : arn option; [@ocaml.doc "The ARN of the app block.\n"]
  attributes_to_delete : application_attributes option;
      [@ocaml.doc "The attributes to delete for an application.\n"]
}
[@@ocaml.doc ""]

type nonrec update_app_block_builder_result = {
  app_block_builder : app_block_builder option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_app_block_builder_request = {
  name : name; [@ocaml.doc "The unique name for the app block builder.\n"]
  description : description option; [@ocaml.doc "The description of the app block builder.\n"]
  display_name : display_name option; [@ocaml.doc "The display name of the app block builder.\n"]
  platform : platform_type option;
      [@ocaml.doc
        "The platform of the app block builder.\n\n\
        \  [WINDOWS_SERVER_2019] is the only valid value.\n\
        \ "]
  instance_type : string_ option;
      [@ocaml.doc
        "The instance type to use when launching the app block builder. The following instance \
         types are available:\n\n\
        \ {ul\n\
        \       {-  stream.standard.small\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.medium\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.large\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.xlarge\n\
        \           \n\
        \            }\n\
        \       {-  stream.standard.2xlarge\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  vpc_config : vpc_config option;
      [@ocaml.doc
        "The VPC configuration for the app block builder.\n\n\
        \ App block builders require that you specify at least two subnets in different \
         availability zones.\n\
        \ "]
  enable_default_internet_access : boolean_object option;
      [@ocaml.doc "Enables or disables default internet access for the app block builder.\n"]
  iam_role_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to apply to the app block builder. To \
         assume a role, the app block builder calls the AWS Security Token Service (STS) \
         [AssumeRole] API operation and passes the ARN of the role to use. The operation creates a \
         new session with temporary credentials. WorkSpaces Applications retrieves the temporary \
         credentials and creates the {b appstream_machine_role} credential profile on the \
         instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/using-iam-roles-to-grant-permissions-to-applications-scripts-streaming-instances.html}Using \
         an IAM Role to Grant Permissions to Applications and Scripts Running on WorkSpaces \
         Applications Streaming Instances} in the {i Amazon WorkSpaces Applications Administration \
         Guide}.\n\
        \ "]
  access_endpoints : access_endpoint_list option;
      [@ocaml.doc
        "The list of interface VPC endpoint (interface endpoint) objects. Administrators can \
         connect to the app block builder only through the specified endpoints.\n"]
  attributes_to_delete : app_block_builder_attributes option;
      [@ocaml.doc "The attributes to delete from the app block builder.\n"]
  disable_imds_v1 : boolean_object option;
      [@ocaml.doc
        "Set to true to disable Instance Metadata Service Version 1 (IMDSv1) and enforce IMDSv2. \
         Set to false to enable both IMDSv1 and IMDSv2.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The tag keys for the tags to disassociate.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  tags : tags;
      [@ocaml.doc
        "The tags to associate. A tag is a key-value pair, and the value is optional. For example, \
         Environment=Test. If you do not specify a value, Environment=. \n\n\
        \ If you do not specify a value, the value is set to an empty string.\n\
        \ \n\
        \  Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, \
         and the following special characters: \n\
        \  \n\
        \   _ . : / = + \\ - \\@\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec stop_image_builder_result = {
  image_builder : image_builder option; [@ocaml.doc "Information about the image builder.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_image_builder_request = {
  name : string_; [@ocaml.doc "The name of the image builder.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_fleet_result = unit [@@ocaml.doc ""]

type nonrec stop_fleet_request = { name : string_ [@ocaml.doc "The name of the fleet.\n"] }
[@@ocaml.doc ""]

type nonrec stop_app_block_builder_result = {
  app_block_builder : app_block_builder option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec stop_app_block_builder_request = {
  name : name; [@ocaml.doc "The name of the app block builder.\n"]
}
[@@ocaml.doc ""]

type nonrec start_software_deployment_to_image_builder_result = unit [@@ocaml.doc ""]

type nonrec start_software_deployment_to_image_builder_request = {
  image_builder_name : name; [@ocaml.doc "The name of the target image builder instance.\n"]
  retry_failed_deployments : boolean_ option;
      [@ocaml.doc "Whether to retry previously failed license included application deployments.\n"]
}
[@@ocaml.doc ""]

type nonrec start_image_builder_result = {
  image_builder : image_builder option; [@ocaml.doc "Information about the image builder.\n"]
}
[@@ocaml.doc ""]

type nonrec start_image_builder_request = {
  name : string_; [@ocaml.doc "The name of the image builder.\n"]
  appstream_agent_version : appstream_agent_version option;
      [@ocaml.doc
        "The version of the WorkSpaces Applications agent to use for this image builder. To use \
         the latest version of the WorkSpaces Applications agent, specify \\[LATEST\\]. \n"]
}
[@@ocaml.doc ""]

type nonrec start_fleet_result = unit [@@ocaml.doc ""]

type nonrec start_fleet_request = { name : string_ [@ocaml.doc "The name of the fleet.\n"] }
[@@ocaml.doc ""]

type nonrec start_app_block_builder_result = {
  app_block_builder : app_block_builder option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec start_app_block_builder_request = {
  name : name; [@ocaml.doc "The name of the app block builder.\n"]
}
[@@ocaml.doc ""]
