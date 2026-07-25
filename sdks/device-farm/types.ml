type nonrec aws_account_number = string [@@ocaml.doc ""]

type nonrec skip_app_resign = bool [@@ocaml.doc ""]

type nonrec job_timeout_minutes = int [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec max_slot_map = (string_ * integer) list [@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec trial_minutes = {
  total : double option;
      [@ocaml.doc "The total number of free trial minutes that the account started with.\n"]
  remaining : double option;
      [@ocaml.doc "The number of free trial minutes remaining in the account.\n"]
}
[@@ocaml.doc "Represents information about free trial device minutes for an AWS account.\n"]

type nonrec device_platform = ANDROID [@ocaml.doc ""] | IOS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec purchased_devices_map = (device_platform * integer) list [@@ocaml.doc ""]

type nonrec account_settings = {
  aws_account_number : aws_account_number option;
      [@ocaml.doc "The AWS account number specified in the [AccountSettings] container.\n"]
  unmetered_devices : purchased_devices_map option;
      [@ocaml.doc "Returns the unmetered devices you have purchased or want to purchase.\n"]
  unmetered_remote_access_devices : purchased_devices_map option;
      [@ocaml.doc
        "Returns the unmetered remote access devices you have purchased or want to purchase.\n"]
  max_job_timeout_minutes : job_timeout_minutes option;
      [@ocaml.doc "The maximum number of minutes a test run executes before it times out.\n"]
  trial_minutes : trial_minutes option;
      [@ocaml.doc "Information about an AWS account's usage of free trial device minutes.\n"]
  max_slots : max_slot_map option;
      [@ocaml.doc
        "The maximum number of device slots that the AWS account can purchase. Each maximum is \
         expressed as an [offering-id:number] pair, where the [offering-id] represents one of the \
         IDs returned by the [ListOfferings] command.\n"]
  default_job_timeout_minutes : job_timeout_minutes option;
      [@ocaml.doc
        "The default number of minutes (at the account level) a test run executes before it times \
         out. The default value is 150 minutes.\n"]
  skip_app_resign : skip_app_resign option;
      [@ocaml.doc
        "When set to [true], for private devices, Device Farm does not sign your app again. For \
         public devices, Device Farm always signs your apps again.\n\n\
        \ For more information about how Device Farm re-signs your apps, see \
         {{:http://aws.amazon.com/device-farm/faqs/}Do you modify my app?} in the {i AWS Device \
         Farm FAQs}.\n\
        \ "]
}
[@@ocaml.doc "A container for account-level settings in AWS Device Farm.\n"]

type nonrec accounts_cleanup = bool [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec amazon_resource_names = amazon_resource_name list [@@ocaml.doc ""]

type nonrec amazon_role_resource_name = string [@@ocaml.doc ""]

type nonrec android_paths = string_ list [@@ocaml.doc ""]

type nonrec app_packages_cleanup = bool [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec argument_exception = {
  message : message option; [@ocaml.doc "Any additional information about the exception.\n"]
}
[@@ocaml.doc "An invalid argument was specified.\n"]

type nonrec ur_l = string [@@ocaml.doc ""]

type nonrec artifact_type =
  | UNKNOWN [@ocaml.doc ""]
  | SCREENSHOT [@ocaml.doc ""]
  | DEVICE_LOG [@ocaml.doc ""]
  | MESSAGE_LOG [@ocaml.doc ""]
  | VIDEO_LOG [@ocaml.doc ""]
  | RESULT_LOG [@ocaml.doc ""]
  | SERVICE_LOG [@ocaml.doc ""]
  | WEBKIT_LOG [@ocaml.doc ""]
  | INSTRUMENTATION_OUTPUT [@ocaml.doc ""]
  | EXERCISER_MONKEY_OUTPUT [@ocaml.doc ""]
  | CALABASH_JSON_OUTPUT [@ocaml.doc ""]
  | CALABASH_PRETTY_OUTPUT [@ocaml.doc ""]
  | CALABASH_STANDARD_OUTPUT [@ocaml.doc ""]
  | CALABASH_JAVA_XML_OUTPUT [@ocaml.doc ""]
  | AUTOMATION_OUTPUT [@ocaml.doc ""]
  | APPIUM_SERVER_OUTPUT [@ocaml.doc ""]
  | APPIUM_JAVA_OUTPUT [@ocaml.doc ""]
  | APPIUM_JAVA_XML_OUTPUT [@ocaml.doc ""]
  | APPIUM_PYTHON_OUTPUT [@ocaml.doc ""]
  | APPIUM_PYTHON_XML_OUTPUT [@ocaml.doc ""]
  | EXPLORER_EVENT_LOG [@ocaml.doc ""]
  | EXPLORER_SUMMARY_LOG [@ocaml.doc ""]
  | APPLICATION_CRASH_REPORT [@ocaml.doc ""]
  | XCTEST_LOG [@ocaml.doc ""]
  | VIDEO [@ocaml.doc ""]
  | CUSTOMER_ARTIFACT [@ocaml.doc ""]
  | CUSTOMER_ARTIFACT_LOG [@ocaml.doc ""]
  | TESTSPEC_OUTPUT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec artifact = {
  arn : amazon_resource_name option; [@ocaml.doc "The artifact's ARN.\n"]
  name : name option; [@ocaml.doc "The artifact's name.\n"]
  type_ : artifact_type option;
      [@ocaml.doc
        "The artifact's type.\n\n\
        \ Allowed values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  UNKNOWN\n\
        \            \n\
        \             }\n\
        \        {-  SCREENSHOT\n\
        \            \n\
        \             }\n\
        \        {-  DEVICE_LOG\n\
        \            \n\
        \             }\n\
        \        {-  MESSAGE_LOG\n\
        \            \n\
        \             }\n\
        \        {-  VIDEO_LOG\n\
        \            \n\
        \             }\n\
        \        {-  RESULT_LOG\n\
        \            \n\
        \             }\n\
        \        {-  SERVICE_LOG\n\
        \            \n\
        \             }\n\
        \        {-  WEBKIT_LOG\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION_OUTPUT\n\
        \            \n\
        \             }\n\
        \        {-  EXERCISER_MONKEY_OUTPUT: the artifact (log) generated by an Android fuzz test.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_SERVER_OUTPUT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_OUTPUT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_XML_OUTPUT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_OUTPUT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_XML_OUTPUT\n\
        \            \n\
        \             }\n\
        \        {-  APPLICATION_CRASH_REPORT\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_LOG\n\
        \            \n\
        \             }\n\
        \        {-  VIDEO\n\
        \            \n\
        \             }\n\
        \        {-  CUSTOMER_ARTIFACT\n\
        \            \n\
        \             }\n\
        \        {-  CUSTOMER_ARTIFACT_LOG\n\
        \            \n\
        \             }\n\
        \        {-  TESTSPEC_OUTPUT\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  extension : string_ option; [@ocaml.doc "The artifact's file extension.\n"]
  url : ur_l option;
      [@ocaml.doc
        "The presigned Amazon S3 URL that can be used with a GET request to download the \
         artifact's file.\n"]
}
[@@ocaml.doc
  "Represents the output of a test. Examples of artifacts include logs and screenshots.\n"]

type nonrec artifact_category =
  | SCREENSHOT [@ocaml.doc ""]
  | FILE [@ocaml.doc ""]
  | LOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec artifacts = artifact list [@@ocaml.doc ""]

type nonrec auxiliary_app_arn_list = amazon_resource_name list [@@ocaml.doc ""]

type nonrec billing_method = METERED [@ocaml.doc ""] | UNMETERED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec cp_u = {
  frequency : string_ option; [@ocaml.doc "The CPU's frequency.\n"]
  architecture : string_ option; [@ocaml.doc "The CPU's architecture (for example, x86 or ARM).\n"]
  clock : double option;
      [@ocaml.doc
        "The clock speed of the device's CPU, expressed in hertz (Hz). For example, a 1.2 GHz CPU \
         is expressed as 1200000000.\n"]
}
[@@ocaml.doc
  "Represents the amount of CPU that an app is using on a physical device. Does not represent \
   system-wide CPU usage.\n"]

type nonrec cannot_delete_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested object could not be deleted.\n"]

type nonrec content_type = string [@@ocaml.doc ""]

type nonrec counters = {
  total : integer option; [@ocaml.doc "The total number of entities.\n"]
  passed : integer option; [@ocaml.doc "The number of passed entities.\n"]
  failed : integer option; [@ocaml.doc "The number of failed entities.\n"]
  warned : integer option; [@ocaml.doc "The number of warned entities.\n"]
  errored : integer option; [@ocaml.doc "The number of errored entities.\n"]
  stopped : integer option; [@ocaml.doc "The number of stopped entities.\n"]
  skipped : integer option; [@ocaml.doc "The number of skipped entities.\n"]
}
[@@ocaml.doc "Represents entity counters.\n"]

type nonrec service_account_exception = {
  message : message option; [@ocaml.doc "Any additional information about the exception.\n"]
}
[@@ocaml.doc "There was a problem with the service account.\n"]

type nonrec not_found_exception = {
  message : message option; [@ocaml.doc "Any additional information about the exception.\n"]
}
[@@ocaml.doc "The specified entity was not found.\n"]

type nonrec limit_exceeded_exception = {
  message : message option; [@ocaml.doc "Any additional information about the exception.\n"]
}
[@@ocaml.doc "A limit was exceeded.\n"]

type nonrec rule_operator =
  | EQUALS [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | LESS_THAN_OR_EQUALS [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | GREATER_THAN_OR_EQUALS [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | NOT_IN [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec device_attribute =
  | ARN [@ocaml.doc ""]
  | PLATFORM [@ocaml.doc ""]
  | FORM_FACTOR [@ocaml.doc ""]
  | MANUFACTURER [@ocaml.doc ""]
  | REMOTE_ACCESS_ENABLED [@ocaml.doc ""]
  | REMOTE_DEBUG_ENABLED [@ocaml.doc ""]
  | APPIUM_VERSION [@ocaml.doc ""]
  | INSTANCE_ARN [@ocaml.doc ""]
  | INSTANCE_LABELS [@ocaml.doc ""]
  | FLEET_TYPE [@ocaml.doc ""]
  | OS_VERSION [@ocaml.doc ""]
  | MODEL [@ocaml.doc ""]
  | AVAILABILITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule = {
  attribute : device_attribute option;
      [@ocaml.doc
        "The rule's stringified attribute. For example, specify the value as [\"\\\"abc\\\"\"].\n\n\
        \ The supported operators for each attribute are provided in the following list.\n\
        \ \n\
        \   APPIUM_VERSION  The Appium version for the test.\n\
        \                   \n\
        \                    Supported operators: [CONTAINS] \n\
        \                    \n\
        \                      ARN  The Amazon Resource Name (ARN) of the device (for example, \
         [arn:aws:devicefarm:us-west-2::device:12345Example].\n\
        \                           \n\
        \                            Supported operators: [EQUALS], [IN], [NOT_IN] \n\
        \                            \n\
        \                              AVAILABILITY  The current availability of the device. Valid \
         values are AVAILABLE, HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.\n\
        \                                            \n\
        \                                             Supported operators: [EQUALS] \n\
        \                                             \n\
        \                                               FLEET_TYPE  The fleet type. Valid values \
         are PUBLIC or PRIVATE.\n\
        \                                                           \n\
        \                                                            Supported operators: [EQUALS] \n\
        \                                                            \n\
        \                                                              FORM_FACTOR  The device \
         form factor. Valid values are PHONE or TABLET.\n\
        \                                                                           \n\
        \                                                                            Supported \
         operators: [EQUALS], [IN], [NOT_IN] \n\
        \                                                                            \n\
        \                                                                              \
         INSTANCE_ARN  \n\
         The Amazon Resource Name (ARN) of the device instance.\n\n\
        \ Supported operators: [IN], [NOT_IN] \n\
        \ \n\
        \   INSTANCE_LABELS  The label of the device instance.\n\
        \                    \n\
        \                     Supported operators: [CONTAINS] \n\
        \                     \n\
        \                       MANUFACTURER  The device manufacturer (for example, Apple).\n\
        \                                     \n\
        \                                      Supported operators: [EQUALS], [IN], [NOT_IN] \n\
        \                                      \n\
        \                                        MODEL  The device model, such as Apple iPad Air 2 \
         or Google Pixel.\n\
        \                                               \n\
        \                                                Supported operators: [CONTAINS], \
         [EQUALS], [IN], [NOT_IN] \n\
        \                                                \n\
        \                                                  OS_VERSION  The operating system \
         version (for example, 10.3.2).\n\
        \                                                              \n\
        \                                                               Supported operators: \
         [EQUALS], [GREATER_THAN], [GREATER_THAN_OR_EQUALS], [IN], [LESS_THAN], \
         [LESS_THAN_OR_EQUALS], [NOT_IN] \n\
        \                                                               \n\
        \                                                                 PLATFORM  The device \
         platform. Valid values are ANDROID or IOS.\n\
        \                                                                           \n\
        \                                                                            Supported \
         operators: [EQUALS], [IN], [NOT_IN] \n\
        \                                                                            \n\
        \                                                                              \
         REMOTE_ACCESS_ENABLED  \n\
         Whether the device is enabled for remote access. Valid values are TRUE or FALSE.\n\n\
        \ Supported operators: [EQUALS] \n\
        \ \n\
        \   REMOTE_DEBUG_ENABLED  Whether the device is enabled for remote debugging. Valid values \
         are TRUE or FALSE.\n\
        \                         \n\
        \                          Supported operators: [EQUALS] \n\
        \                          \n\
        \                           Because remote debugging is \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html}no longer \
         supported}, this filter is ignored.\n\
        \                           \n\
        \                             "]
  operator : rule_operator option;
      [@ocaml.doc
        "Specifies how Device Farm compares the rule's attribute to the value. For the operators \
         that are supported by each attribute, see the attribute descriptions.\n"]
  value : string_ option; [@ocaml.doc "The rule's value.\n"]
}
[@@ocaml.doc "Represents a condition for a device pool.\n"]

type nonrec rules = rule list [@@ocaml.doc ""]

type nonrec device_pool_type = CURATED [@ocaml.doc ""] | PRIVATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec device_pool = {
  arn : amazon_resource_name option; [@ocaml.doc "The device pool's ARN.\n"]
  name : name option; [@ocaml.doc "The device pool's name.\n"]
  description : message option; [@ocaml.doc "The device pool's description.\n"]
  type_ : device_pool_type option;
      [@ocaml.doc
        "The device pool's type.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  CURATED: A device pool that is created and managed by AWS Device Farm.\n\
        \            \n\
        \             }\n\
        \        {-  PRIVATE: A device pool that is created and managed by the device pool \
         developer.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  rules : rules option; [@ocaml.doc "Information about the device pool's rules.\n"]
  max_devices : integer option;
      [@ocaml.doc
        "The number of devices that Device Farm can add to your device pool. Device Farm adds \
         devices that are available and meet the criteria that you assign for the [rules] \
         parameter. Depending on how many devices meet these constraints, your device pool might \
         contain fewer devices than the value for this parameter.\n\n\
        \ By specifying the maximum number of devices, you can control the costs that you incur by \
         running tests.\n\
        \ "]
}
[@@ocaml.doc "Represents a collection of device types.\n"]

type nonrec create_device_pool_result = {
  device_pool : device_pool option; [@ocaml.doc "The newly created device pool.\n"]
}
[@@ocaml.doc "Represents the result of a create device pool request.\n"]

type nonrec create_device_pool_request = {
  project_arn : amazon_resource_name; [@ocaml.doc "The ARN of the project for the device pool.\n"]
  name : name; [@ocaml.doc "The device pool's name.\n"]
  description : message option; [@ocaml.doc "The device pool's description.\n"]
  rules : rules; [@ocaml.doc "The device pool's rules.\n"]
  max_devices : integer option;
      [@ocaml.doc
        "The number of devices that Device Farm can add to your device pool. Device Farm adds \
         devices that are available and meet the criteria that you assign for the [rules] \
         parameter. Depending on how many devices meet these constraints, your device pool might \
         contain fewer devices than the value for this parameter.\n\n\
        \ By specifying the maximum number of devices, you can control the costs that you incur by \
         running tests.\n\
        \ "]
}
[@@ocaml.doc "Represents a request to the create device pool operation.\n"]

type nonrec package_ids = string_ list [@@ocaml.doc ""]

type nonrec instance_profile = {
  arn : amazon_resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the instance profile.\n"]
  package_cleanup : boolean_ option;
      [@ocaml.doc
        "When set to [true], Device Farm removes app packages after a test run. The default value \
         is [false] for private devices.\n"]
  exclude_app_packages_from_cleanup : package_ids option;
      [@ocaml.doc
        "An array of strings containing the list of app packages that should not be cleaned up \
         from the device after a test run completes.\n\n\
        \ The list of packages is considered only if you set [packageCleanup] to [true].\n\
        \ "]
  reboot_after_use : boolean_ option;
      [@ocaml.doc
        "When set to [true], Device Farm reboots the instance after a test run. The default value \
         is [true].\n"]
  name : name option; [@ocaml.doc "The name of the instance profile.\n"]
  description : message option; [@ocaml.doc "The description of the instance profile.\n"]
}
[@@ocaml.doc "Represents the instance profile.\n"]

type nonrec create_instance_profile_result = {
  instance_profile : instance_profile option;
      [@ocaml.doc "An object that contains information about your instance profile.\n"]
}
[@@ocaml.doc ""]

type nonrec create_instance_profile_request = {
  name : name; [@ocaml.doc "The name of your instance profile.\n"]
  description : message option; [@ocaml.doc "The description of your instance profile.\n"]
  package_cleanup : boolean_ option;
      [@ocaml.doc
        "When set to [true], Device Farm removes app packages after a test run. The default value \
         is [false] for private devices.\n"]
  exclude_app_packages_from_cleanup : package_ids option;
      [@ocaml.doc
        "An array of strings that specifies the list of app packages that should not be cleaned up \
         from the device after a test run.\n\n\
        \ The list of packages is considered only if you set [packageCleanup] to [true].\n\
        \ "]
  reboot_after_use : boolean_ option;
      [@ocaml.doc
        "When set to [true], Device Farm reboots the instance after a test run. The default value \
         is [true].\n"]
}
[@@ocaml.doc ""]

type nonrec percent_integer = int [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec network_profile_type = CURATED [@ocaml.doc ""] | PRIVATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec network_profile = {
  arn : amazon_resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the network profile.\n"]
  name : name option; [@ocaml.doc "The name of the network profile.\n"]
  description : message option; [@ocaml.doc "The description of the network profile.\n"]
  type_ : network_profile_type option;
      [@ocaml.doc "The type of network profile. Valid values are listed here.\n"]
  uplink_bandwidth_bits : long option;
      [@ocaml.doc
        "The data throughput rate in bits per second, as an integer from 0 to 104857600.\n"]
  downlink_bandwidth_bits : long option;
      [@ocaml.doc
        "The data throughput rate in bits per second, as an integer from 0 to 104857600.\n"]
  uplink_delay_ms : long option;
      [@ocaml.doc
        "Delay time for all packets to destination in milliseconds as an integer from 0 to 2000.\n"]
  downlink_delay_ms : long option;
      [@ocaml.doc
        "Delay time for all packets to destination in milliseconds as an integer from 0 to 2000.\n"]
  uplink_jitter_ms : long option;
      [@ocaml.doc
        "Time variation in the delay of received packets in milliseconds as an integer from 0 to \
         2000.\n"]
  downlink_jitter_ms : long option;
      [@ocaml.doc
        "Time variation in the delay of received packets in milliseconds as an integer from 0 to \
         2000.\n"]
  uplink_loss_percent : percent_integer option;
      [@ocaml.doc "Proportion of transmitted packets that fail to arrive from 0 to 100 percent.\n"]
  downlink_loss_percent : percent_integer option;
      [@ocaml.doc "Proportion of received packets that fail to arrive from 0 to 100 percent.\n"]
}
[@@ocaml.doc "An array of settings that describes characteristics of a network profile.\n"]

type nonrec create_network_profile_result = {
  network_profile : network_profile option;
      [@ocaml.doc "The network profile that is returned by the create network profile request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_network_profile_request = {
  project_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project for which you want to create a network \
         profile.\n"]
  name : name; [@ocaml.doc "The name for the new network profile.\n"]
  description : message option; [@ocaml.doc "The description of the network profile.\n"]
  type_ : network_profile_type option;
      [@ocaml.doc "The type of network profile to create. Valid values are listed here.\n"]
  uplink_bandwidth_bits : long option;
      [@ocaml.doc
        "The data throughput rate in bits per second, as an integer from 0 to 104857600.\n"]
  downlink_bandwidth_bits : long option;
      [@ocaml.doc
        "The data throughput rate in bits per second, as an integer from 0 to 104857600.\n"]
  uplink_delay_ms : long option;
      [@ocaml.doc
        "Delay time for all packets to destination in milliseconds as an integer from 0 to 2000.\n"]
  downlink_delay_ms : long option;
      [@ocaml.doc
        "Delay time for all packets to destination in milliseconds as an integer from 0 to 2000.\n"]
  uplink_jitter_ms : long option;
      [@ocaml.doc
        "Time variation in the delay of received packets in milliseconds as an integer from 0 to \
         2000.\n"]
  downlink_jitter_ms : long option;
      [@ocaml.doc
        "Time variation in the delay of received packets in milliseconds as an integer from 0 to \
         2000.\n"]
  uplink_loss_percent : percent_integer option;
      [@ocaml.doc "Proportion of transmitted packets that fail to arrive from 0 to 100 percent.\n"]
  downlink_loss_percent : percent_integer option;
      [@ocaml.doc "Proportion of received packets that fail to arrive from 0 to 100 percent.\n"]
}
[@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec tag_operation_exception = {
  message : exception_message option; [@ocaml.doc ""]
  resource_name : amazon_resource_name option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation was not successful. Try again.\n"]

type nonrec environment_variable_value = string [@@ocaml.doc ""]

type nonrec environment_variable_name = string [@@ocaml.doc ""]

type nonrec environment_variable = {
  name : environment_variable_name; [@ocaml.doc "The name of the environment variable.\n"]
  value : environment_variable_value; [@ocaml.doc "The value of the environment variable.\n"]
}
[@@ocaml.doc "Information about an environment variable for a project or a run.\n"]

type nonrec environment_variables = environment_variable list [@@ocaml.doc ""]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec vpc_subnet_ids = subnet_id list [@@ocaml.doc ""]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec vpc_security_group_ids = security_group_id list [@@ocaml.doc ""]

type nonrec vpc_config = {
  security_group_ids : vpc_security_group_ids;
      [@ocaml.doc "An array of one or more security groups IDs in your Amazon VPC.\n"]
  subnet_ids : vpc_subnet_ids;
      [@ocaml.doc "An array of one or more subnet IDs in your Amazon VPC.\n"]
  vpc_id : non_empty_string; [@ocaml.doc "The ID of the Amazon VPC.\n"]
}
[@@ocaml.doc
  "Contains the VPC configuration data necessary to interface with AWS Device Farm's services.\n"]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec project = {
  arn : amazon_resource_name option; [@ocaml.doc "The project's ARN.\n"]
  name : name option; [@ocaml.doc "The project's name.\n"]
  default_job_timeout_minutes : job_timeout_minutes option;
      [@ocaml.doc
        "The default number of minutes (at the project level) a test run executes before it times \
         out. The default value is 150 minutes.\n"]
  created : date_time option; [@ocaml.doc "When the project was created.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
  environment_variables : environment_variables option;
      [@ocaml.doc "Environment variables associated with the project.\n"]
  execution_role_arn : amazon_role_resource_name option;
      [@ocaml.doc "The IAM execution role associated with the project.\n"]
}
[@@ocaml.doc "Represents an operating-system neutral workspace for running and managing tests.\n"]

type nonrec create_project_result = {
  project : project option; [@ocaml.doc "The newly created project.\n"]
}
[@@ocaml.doc "Represents the result of a create project request.\n"]

type nonrec create_project_request = {
  name : name; [@ocaml.doc "The project's name.\n"]
  default_job_timeout_minutes : job_timeout_minutes option;
      [@ocaml.doc
        "Sets the execution timeout value (in minutes) for a project. All test runs in this \
         project use the specified execution timeout value unless overridden when scheduling a run.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
  environment_variables : environment_variables option;
      [@ocaml.doc
        " A set of environment variables which are used by default for all runs in the project. \
         These environment variables are applied to the test run during the execution of a test \
         spec file. \n\n\
        \  For more information about using test spec files, please see \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/custom-test-environments.html}Custom \
         test environments } in {i AWS Device Farm.} \n\
        \ "]
  execution_role_arn : amazon_role_resource_name option;
      [@ocaml.doc "An IAM role to be assumed by the test host for all runs in the project.\n"]
}
[@@ocaml.doc "Represents a request to the create project operation.\n"]

type nonrec sensitive_ur_l = string [@@ocaml.doc ""]

type nonrec remote_access_endpoints = {
  remote_driver_endpoint : sensitive_ur_l option;
      [@ocaml.doc
        "URL for controlling the device using WebDriver-compliant clients, like Appium, during the \
         remote access session.\n"]
  interactive_endpoint : sensitive_ur_l option;
      [@ocaml.doc
        "URL for viewing and interacting with the device during the remote access session.\n"]
}
[@@ocaml.doc
  "Represents the remote endpoints for viewing and controlling a device during a remote access \
   session.\n"]

type nonrec device_proxy_port = int [@@ocaml.doc ""]

type nonrec device_proxy_host = string [@@ocaml.doc ""]

type nonrec device_proxy = {
  host : device_proxy_host; [@ocaml.doc "Hostname or IPv4 address of the proxy.\n"]
  port : device_proxy_port; [@ocaml.doc "The port number on which the http/s proxy is listening.\n"]
}
[@@ocaml.doc
  "Represents the http/s proxy configuration that will be applied to a device during a run.\n"]

type nonrec interaction_mode =
  | INTERACTIVE [@ocaml.doc ""]
  | NO_VIDEO [@ocaml.doc ""]
  | VIDEO_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec device_minutes = {
  total : double option;
      [@ocaml.doc
        "When specified, represents the total minutes used by the resource to run tests.\n"]
  metered : double option;
      [@ocaml.doc
        "When specified, represents only the sum of metered minutes used by the resource to run \
         tests.\n"]
  unmetered : double option;
      [@ocaml.doc
        "When specified, represents only the sum of unmetered minutes used by the resource to run \
         tests.\n"]
}
[@@ocaml.doc
  "Represents the total (metered or unmetered) minutes used by the resource to run tests. Contains \
   the sum of minutes consumed by all children.\n"]

type nonrec device_availability =
  | TEMPORARY_NOT_AVAILABLE [@ocaml.doc ""]
  | BUSY [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | HIGHLY_AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_status =
  | IN_USE [@ocaml.doc ""]
  | PREPARING [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | NOT_AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_labels = string_ list [@@ocaml.doc ""]

type nonrec device_instance = {
  arn : amazon_resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the device instance.\n"]
  device_arn : amazon_resource_name option; [@ocaml.doc "The ARN of the device.\n"]
  labels : instance_labels option;
      [@ocaml.doc "An array of strings that describe the device instance.\n"]
  status : instance_status option;
      [@ocaml.doc "The status of the device instance. Valid values are listed here.\n"]
  udid : string_ option; [@ocaml.doc "Unique device identifier for the device instance.\n"]
  instance_profile : instance_profile option;
      [@ocaml.doc "A object that contains information about the instance profile.\n"]
}
[@@ocaml.doc "Represents the device instance.\n"]

type nonrec device_instances = device_instance list [@@ocaml.doc ""]

type nonrec resolution = {
  width : integer option; [@ocaml.doc "The screen resolution's width, expressed in pixels.\n"]
  height : integer option; [@ocaml.doc "The screen resolution's height, expressed in pixels.\n"]
}
[@@ocaml.doc
  "Represents the screen resolution of a device in height and width, expressed in pixels.\n"]

type nonrec device_form_factor = PHONE [@ocaml.doc ""] | TABLET [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec device = {
  arn : amazon_resource_name option; [@ocaml.doc "The device's ARN.\n"]
  name : name option; [@ocaml.doc "The device's display name.\n"]
  manufacturer : string_ option; [@ocaml.doc "The device's manufacturer name.\n"]
  model : string_ option; [@ocaml.doc "The device's model name.\n"]
  model_id : string_ option; [@ocaml.doc "The device's model ID.\n"]
  form_factor : device_form_factor option;
      [@ocaml.doc
        "The device's form factor.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PHONE\n\
        \            \n\
        \             }\n\
        \        {-  TABLET\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  platform : device_platform option;
      [@ocaml.doc
        "The device's platform.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  ANDROID\n\
        \            \n\
        \             }\n\
        \        {-  IOS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  os : string_ option; [@ocaml.doc "The device's operating system type.\n"]
  cpu : cp_u option; [@ocaml.doc "Information about the device's CPU.\n"]
  resolution : resolution option; [@ocaml.doc "The resolution of the device.\n"]
  heap_size : long option; [@ocaml.doc "The device's heap size, expressed in bytes.\n"]
  memory : long option; [@ocaml.doc "The device's total memory size, expressed in bytes.\n"]
  image : string_ option; [@ocaml.doc "The device's image name.\n"]
  carrier : string_ option; [@ocaml.doc "The device's carrier.\n"]
  radio : string_ option; [@ocaml.doc "The device's radio.\n"]
  remote_access_enabled : boolean_ option;
      [@ocaml.doc "Specifies whether remote access has been enabled for the specified device.\n"]
  remote_debug_enabled : boolean_ option;
      [@ocaml.doc
        "This flag is set to [true] if remote debugging is enabled for the device.\n\n\
        \ Remote debugging is \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html}no longer \
         supported}.\n\
        \ "]
  fleet_type : string_ option;
      [@ocaml.doc
        "The type of fleet to which this device belongs. Possible values are PRIVATE and PUBLIC.\n"]
  fleet_name : string_ option; [@ocaml.doc "The name of the fleet to which this device belongs.\n"]
  instances : device_instances option; [@ocaml.doc "The instances that belong to this device.\n"]
  availability : device_availability option;
      [@ocaml.doc
        "Indicates how likely a device is available for a test run. Currently available in the \
         [ListDevices] and GetDevice API methods.\n"]
}
[@@ocaml.doc "Represents a device type that an app is tested against.\n"]

type nonrec execution_result =
  | PENDING [@ocaml.doc ""]
  | PASSED [@ocaml.doc ""]
  | WARNED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SKIPPED [@ocaml.doc ""]
  | ERRORED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec execution_status =
  | PENDING [@ocaml.doc ""]
  | PENDING_CONCURRNECY [@ocaml.doc ""]
  | PENDING_DEVICE [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | SCHEDULING [@ocaml.doc ""]
  | PREPARING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec remote_access_session = {
  arn : amazon_resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the remote access session.\n"]
  name : name option; [@ocaml.doc "The name of the remote access session.\n"]
  created : date_time option;
      [@ocaml.doc "The date and time the remote access session was created.\n"]
  status : execution_status option;
      [@ocaml.doc
        "The status of the remote access session. Can be any of the following:\n\n\
        \ {ul\n\
        \       {-  PENDING.\n\
        \           \n\
        \            }\n\
        \       {-  PENDING_CONCURRENCY.\n\
        \           \n\
        \            }\n\
        \       {-  PENDING_DEVICE.\n\
        \           \n\
        \            }\n\
        \       {-  PROCESSING.\n\
        \           \n\
        \            }\n\
        \       {-  SCHEDULING.\n\
        \           \n\
        \            }\n\
        \       {-  PREPARING.\n\
        \           \n\
        \            }\n\
        \       {-  RUNNING.\n\
        \           \n\
        \            }\n\
        \       {-  COMPLETED.\n\
        \           \n\
        \            }\n\
        \       {-  STOPPING.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  result_ : execution_result option;
      [@ocaml.doc
        "The result of the remote access session. Can be any of the following:\n\n\
        \ {ul\n\
        \       {-  PENDING.\n\
        \           \n\
        \            }\n\
        \       {-  PASSED.\n\
        \           \n\
        \            }\n\
        \       {-  WARNED.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED.\n\
        \           \n\
        \            }\n\
        \       {-  SKIPPED.\n\
        \           \n\
        \            }\n\
        \       {-  ERRORED.\n\
        \           \n\
        \            }\n\
        \       {-  STOPPED.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : message option; [@ocaml.doc "A message about the remote access session.\n"]
  started : date_time option;
      [@ocaml.doc "The date and time the remote access session was started.\n"]
  stopped : date_time option;
      [@ocaml.doc "The date and time the remote access session was stopped.\n"]
  device : device option;
      [@ocaml.doc "The device (phone or tablet) used in the remote access session.\n"]
  instance_arn : amazon_resource_name option; [@ocaml.doc "The ARN of the instance.\n"]
  billing_method : billing_method option;
      [@ocaml.doc
        "The billing method of the remote access session. Possible values include [METERED] or \
         [UNMETERED]. For more information about metered devices, see \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/welcome.html#welcome-terminology}AWS \
         Device Farm terminology}.\n"]
  device_minutes : device_minutes option;
      [@ocaml.doc
        "The number of minutes a device is used in a remote access session (including setup and \
         teardown minutes).\n"]
  endpoint : string_ option;
      [@ocaml.doc
        "The endpoint for the remote access session. This field is deprecated, and is replaced by \
         the new [endpoints.interactiveEndpoint] field.\n"]
  device_udid : string_ option;
      [@ocaml.doc
        "Unique device identifier for the remote device. Only returned if remote debugging is \
         enabled for the remote access session.\n\n\
        \ Remote debugging is \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html}no longer \
         supported}.\n\
        \ "]
  interaction_mode : interaction_mode option;
      [@ocaml.doc
        "The interaction mode of the remote access session. Changing the interactive mode of \
         remote access sessions is no longer available.\n"]
  skip_app_resign : skip_app_resign option;
      [@ocaml.doc
        "When set to [true], for private devices, Device Farm does not sign your app again. For \
         public devices, Device Farm always signs your apps again.\n\n\
        \ For more information about how Device Farm re-signs your apps, see \
         {{:http://aws.amazon.com/device-farm/faqs/}Do you modify my app?} in the {i AWS Device \
         Farm FAQs}.\n\
        \ "]
  vpc_config : vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
  device_proxy : device_proxy option;
      [@ocaml.doc "The device proxy configured for the remote access session.\n"]
  app_upload : amazon_resource_name option;
      [@ocaml.doc "The ARN for the app to be installed onto your device.\n"]
  endpoints : remote_access_endpoints option; [@ocaml.doc ""]
}
[@@ocaml.doc "Represents information about the remote access session.\n"]

type nonrec create_remote_access_session_result = {
  remote_access_session : remote_access_session option;
      [@ocaml.doc
        "A container that describes the remote access session when the request to create a remote \
         access session is sent.\n"]
}
[@@ocaml.doc "Represents the server response from a request to create a remote access session.\n"]

type nonrec create_remote_access_session_configuration = {
  auxiliary_apps : auxiliary_app_arn_list option;
      [@ocaml.doc
        "A list of upload ARNs for app packages to be installed onto your device. (Maximum 3)\n"]
  billing_method : billing_method option;
      [@ocaml.doc "The billing method for the remote access session.\n"]
  vpce_configuration_arns : amazon_resource_names option;
      [@ocaml.doc "An array of ARNs included in the VPC endpoint configuration.\n"]
  device_proxy : device_proxy option;
      [@ocaml.doc
        "The device proxy to be configured on the device for the remote access session.\n"]
}
[@@ocaml.doc "Configuration settings for a remote access session, including billing method.\n"]

type nonrec create_remote_access_session_request = {
  project_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project for which you want to create a remote \
         access session.\n"]
  device_arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the device for which you want to create a remote access session.\n"]
  app_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the app to create the remote access session.\n"]
  instance_arn : amazon_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the device instance for which you want to create a \
         remote access session.\n"]
  name : name option; [@ocaml.doc "The name of the remote access session to create.\n"]
  configuration : create_remote_access_session_configuration option;
      [@ocaml.doc "The configuration information for the remote access session request.\n"]
  interaction_mode : interaction_mode option;
      [@ocaml.doc
        "The interaction mode of the remote access session. Changing the interactive mode of \
         remote access sessions is no longer available.\n"]
  skip_app_resign : boolean_ option;
      [@ocaml.doc
        "When set to [true], for private devices, Device Farm does not sign your app again. For \
         public devices, Device Farm always signs your apps again.\n\n\
        \ For more information on how Device Farm modifies your uploads during tests, see \
         {{:http://aws.amazon.com/device-farm/faqs/}Do you modify my app?} \n\
        \ "]
}
[@@ocaml.doc "Creates and submits a request to start a remote access session.\n"]

type nonrec internal_service_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An internal exception was raised in the service. Contact \
   {{:mailto:aws-devicefarm-support@amazon.com}aws-devicefarm-support\\@amazon.com} if you see \
   this error. \n"]

type nonrec subnet_ids = non_empty_string list [@@ocaml.doc ""]

type nonrec security_group_ids = non_empty_string list [@@ocaml.doc ""]

type nonrec test_grid_vpc_config = {
  security_group_ids : security_group_ids;
      [@ocaml.doc "A list of VPC security group IDs in your Amazon VPC.\n"]
  subnet_ids : subnet_ids; [@ocaml.doc "A list of VPC subnet IDs in your Amazon VPC.\n"]
  vpc_id : non_empty_string; [@ocaml.doc "The ID of the Amazon VPC.\n"]
}
[@@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]

type nonrec device_farm_arn = string [@@ocaml.doc ""]

type nonrec test_grid_project = {
  arn : device_farm_arn option; [@ocaml.doc "The ARN for the project.\n"]
  name : string_ option; [@ocaml.doc "A human-readable name for the project.\n"]
  description : string_ option; [@ocaml.doc "A human-readable description for the project.\n"]
  vpc_config : test_grid_vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
  created : date_time option; [@ocaml.doc "When the project was created.\n"]
}
[@@ocaml.doc "A Selenium testing project. Projects are used to collect and collate sessions.\n"]

type nonrec create_test_grid_project_result = {
  test_grid_project : test_grid_project option;
      [@ocaml.doc "ARN of the Selenium testing project that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_description = string [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec create_test_grid_project_request = {
  name : resource_name; [@ocaml.doc "Human-readable name of the Selenium testing project.\n"]
  description : resource_description option;
      [@ocaml.doc "Human-readable description of the project.\n"]
  vpc_config : test_grid_vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
}
[@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec create_test_grid_url_result = {
  url : sensitive_string option;
      [@ocaml.doc
        "A signed URL, expiring in [CreateTestGridUrlRequest$expiresInSeconds] seconds, to be \
         passed to a [RemoteWebDriver]. \n"]
  expires : date_time option;
      [@ocaml.doc
        "The number of seconds the URL from [CreateTestGridUrlResult$url] stays active.\n"]
}
[@@ocaml.doc ""]

type nonrec test_grid_url_expires_in_seconds_input = int [@@ocaml.doc ""]

type nonrec create_test_grid_url_request = {
  project_arn : device_farm_arn;
      [@ocaml.doc
        "ARN (from [CreateTestGridProject] or [ListTestGridProjects]) to associate with the \
         short-term URL. \n"]
  expires_in_seconds : test_grid_url_expires_in_seconds_input;
      [@ocaml.doc "Lifetime, in seconds, of the URL.\n"]
}
[@@ocaml.doc ""]

type nonrec upload_category = CURATED [@ocaml.doc ""] | PRIVATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec metadata = string [@@ocaml.doc ""]

type nonrec upload_status =
  | INITIALIZED [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec upload_type =
  | ANDROID_APP [@ocaml.doc ""]
  | IOS_APP [@ocaml.doc ""]
  | WEB_APP [@ocaml.doc ""]
  | EXTERNAL_DATA [@ocaml.doc ""]
  | APPIUM_JAVA_JUNIT_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_JAVA_TESTNG_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_PYTHON_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_NODE_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_RUBY_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_WEB_PYTHON_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_WEB_NODE_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_WEB_RUBY_TEST_PACKAGE [@ocaml.doc ""]
  | CALABASH_TEST_PACKAGE [@ocaml.doc ""]
  | INSTRUMENTATION_TEST_PACKAGE [@ocaml.doc ""]
  | UIAUTOMATION_TEST_PACKAGE [@ocaml.doc ""]
  | UIAUTOMATOR_TEST_PACKAGE [@ocaml.doc ""]
  | XCTEST_TEST_PACKAGE [@ocaml.doc ""]
  | XCTEST_UI_TEST_PACKAGE [@ocaml.doc ""]
  | APPIUM_JAVA_JUNIT_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_JAVA_TESTNG_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_PYTHON_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_NODE_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_RUBY_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_WEB_JAVA_JUNIT_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_WEB_JAVA_TESTNG_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_WEB_PYTHON_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_WEB_NODE_TEST_SPEC [@ocaml.doc ""]
  | APPIUM_WEB_RUBY_TEST_SPEC [@ocaml.doc ""]
  | INSTRUMENTATION_TEST_SPEC [@ocaml.doc ""]
  | XCTEST_UI_TEST_SPEC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec upload = {
  arn : amazon_resource_name option; [@ocaml.doc "The upload's ARN.\n"]
  name : name option; [@ocaml.doc "The upload's file name.\n"]
  created : date_time option; [@ocaml.doc "When the upload was created.\n"]
  type_ : upload_type option;
      [@ocaml.doc
        "The upload's type.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  ANDROID_APP\n\
        \            \n\
        \             }\n\
        \        {-  IOS_APP\n\
        \            \n\
        \             }\n\
        \        {-  WEB_APP\n\
        \            \n\
        \             }\n\
        \        {-  EXTERNAL_DATA\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  status : upload_status option;
      [@ocaml.doc
        "The upload's status.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        {-  INITIALIZED\n\
        \            \n\
        \             }\n\
        \        {-  PROCESSING\n\
        \            \n\
        \             }\n\
        \        {-  SUCCEEDED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  url : sensitive_ur_l option;
      [@ocaml.doc
        "The presigned Amazon S3 URL that was used to store a file using a PUT request.\n"]
  metadata : metadata option;
      [@ocaml.doc
        "The upload's metadata. For example, for Android, this contains information that is parsed \
         from the manifest and is displayed in the AWS Device Farm console after the associated \
         app is uploaded.\n"]
  content_type : content_type option;
      [@ocaml.doc "The upload's content type (for example, [application/octet-stream]).\n"]
  message : message option; [@ocaml.doc "A message about the upload's result.\n"]
  category : upload_category option;
      [@ocaml.doc
        "The upload's category. Allowed values include:\n\n\
        \ {ul\n\
        \       {-  CURATED: An upload managed by AWS Device Farm.\n\
        \           \n\
        \            }\n\
        \       {-  PRIVATE: An upload managed by the AWS Device Farm customer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "An app or a set of one or more tests to upload or that have been uploaded.\n"]

type nonrec create_upload_result = {
  upload : upload option; [@ocaml.doc "The newly created upload.\n"]
}
[@@ocaml.doc "Represents the result of a create upload request.\n"]

type nonrec create_upload_request = {
  project_arn : amazon_resource_name; [@ocaml.doc "The ARN of the project for the upload.\n"]
  name : name;
      [@ocaml.doc
        "The upload's file name. The name should not contain any forward slashes ([/]). If you are \
         uploading an iOS app, the file name must end with the [.ipa] extension. If you are \
         uploading an Android app, the file name must end with the [.apk] extension. For all \
         others, the file name must end with the [.zip] file extension.\n"]
  type_ : upload_type;
      [@ocaml.doc
        "The upload's upload type.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  ANDROID_APP\n\
        \            \n\
        \             }\n\
        \        {-  IOS_APP\n\
        \            \n\
        \             }\n\
        \        {-  WEB_APP\n\
        \            \n\
        \             }\n\
        \        {-  EXTERNAL_DATA\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    If you call [CreateUpload] with [WEB_APP] specified, AWS Device Farm throws an \
         [ArgumentException] error.\n\
        \   "]
  content_type : content_type option;
      [@ocaml.doc "The upload's content type (for example, [application/octet-stream]).\n"]
}
[@@ocaml.doc "Represents a request to the create upload operation.\n"]

type nonrec vpce_configuration_description = string [@@ocaml.doc ""]

type nonrec service_dns_name = string [@@ocaml.doc ""]

type nonrec vpce_service_name = string [@@ocaml.doc ""]

type nonrec vpce_configuration_name = string [@@ocaml.doc ""]

type nonrec vpce_configuration = {
  arn : amazon_resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the VPC endpoint configuration.\n"]
  vpce_configuration_name : vpce_configuration_name option;
      [@ocaml.doc
        "The friendly name you give to your VPC endpoint configuration to manage your \
         configurations more easily.\n"]
  vpce_service_name : vpce_service_name option;
      [@ocaml.doc
        "The name of the VPC endpoint service running in your AWS account that you want Device \
         Farm to test.\n"]
  service_dns_name : service_dns_name option;
      [@ocaml.doc
        "The DNS name that maps to the private IP address of the service you want to access.\n"]
  vpce_configuration_description : vpce_configuration_description option;
      [@ocaml.doc
        "An optional description that provides details about your VPC endpoint configuration.\n"]
}
[@@ocaml.doc "Represents an Amazon Virtual Private Cloud (VPC) endpoint configuration.\n"]

type nonrec create_vpce_configuration_result = {
  vpce_configuration : vpce_configuration option;
      [@ocaml.doc "An object that contains information about your VPC endpoint configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_vpce_configuration_request = {
  vpce_configuration_name : vpce_configuration_name;
      [@ocaml.doc
        "The friendly name you give to your VPC endpoint configuration, to manage your \
         configurations more easily.\n"]
  vpce_service_name : vpce_service_name;
      [@ocaml.doc
        "The name of the VPC endpoint service running in your AWS account that you want Device \
         Farm to test.\n"]
  service_dns_name : service_dns_name;
      [@ocaml.doc
        "The DNS name of the service running in your VPC that you want Device Farm to test.\n"]
  vpce_configuration_description : vpce_configuration_description option;
      [@ocaml.doc
        "An optional description that provides details about your VPC endpoint configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec currency_code = USD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec device_host_paths = string_ list [@@ocaml.doc ""]

type nonrec ios_paths = string_ list [@@ocaml.doc ""]

type nonrec customer_artifact_paths = {
  ios_paths : ios_paths option;
      [@ocaml.doc
        "Comma-separated list of paths on the iOS device where the artifacts generated by the \
         customer's tests are pulled from.\n"]
  android_paths : android_paths option;
      [@ocaml.doc
        "Comma-separated list of paths on the Android device where the artifacts generated by the \
         customer's tests are pulled from.\n"]
  device_host_paths : device_host_paths option;
      [@ocaml.doc
        "Comma-separated list of paths in the test execution environment where the artifacts \
         generated by the customer's tests are pulled from.\n"]
}
[@@ocaml.doc
  "A JSON object that specifies the paths where the artifacts generated by the customer's tests, \
   on the device or in the test environment, are pulled from.\n\n\
  \ Specify [deviceHostPaths] and optionally specify either [iosPaths] or [androidPaths].\n\
  \ \n\
  \  For web app tests, you can specify both [iosPaths] and [androidPaths].\n\
  \  "]

type nonrec delete_device_pool_result = unit [@@ocaml.doc ""]

type nonrec delete_device_pool_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "Represents the Amazon Resource Name (ARN) of the Device Farm device pool to delete.\n"]
}
[@@ocaml.doc "Represents a request to the delete device pool operation.\n"]

type nonrec delete_instance_profile_result = unit [@@ocaml.doc ""]

type nonrec delete_instance_profile_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the instance profile you are requesting to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_network_profile_result = unit [@@ocaml.doc ""]

type nonrec delete_network_profile_request = {
  arn : amazon_resource_name; [@ocaml.doc "The ARN of the network profile to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_project_result = unit [@@ocaml.doc ""]

type nonrec delete_project_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "Represents the Amazon Resource Name (ARN) of the Device Farm project to delete.\n"]
}
[@@ocaml.doc "Represents a request to the delete project operation.\n"]

type nonrec delete_remote_access_session_result = unit [@@ocaml.doc ""]

type nonrec delete_remote_access_session_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the session for which you want to delete remote access.\n"]
}
[@@ocaml.doc "Represents the request to delete the specified remote access session.\n"]

type nonrec delete_run_result = unit [@@ocaml.doc ""]

type nonrec delete_run_request = {
  arn : amazon_resource_name; [@ocaml.doc "The Amazon Resource Name (ARN) for the run to delete.\n"]
}
[@@ocaml.doc "Represents a request to the delete run operation.\n"]

type nonrec delete_test_grid_project_result = unit [@@ocaml.doc ""]

type nonrec delete_test_grid_project_request = {
  project_arn : device_farm_arn;
      [@ocaml.doc
        "The ARN of the project to delete, from [CreateTestGridProject] or [ListTestGridProjects].\n"]
}
[@@ocaml.doc ""]

type nonrec delete_upload_result = unit [@@ocaml.doc ""]

type nonrec delete_upload_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "Represents the Amazon Resource Name (ARN) of the Device Farm upload to delete.\n"]
}
[@@ocaml.doc "Represents a request to the delete upload operation.\n"]

type nonrec invalid_operation_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "There was an error with the update request, or you do not have sufficient permissions to update \
   this VPC endpoint configuration.\n"]

type nonrec delete_vpce_configuration_result = unit [@@ocaml.doc ""]

type nonrec delete_vpce_configuration_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the VPC endpoint configuration you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec update_vpce_configuration_result = {
  vpce_configuration : vpce_configuration option;
      [@ocaml.doc "An object that contains information about your VPC endpoint configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec update_vpce_configuration_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the VPC endpoint configuration you want to update.\n"]
  vpce_configuration_name : vpce_configuration_name option;
      [@ocaml.doc
        "The friendly name you give to your VPC endpoint configuration to manage your \
         configurations more easily.\n"]
  vpce_service_name : vpce_service_name option;
      [@ocaml.doc
        "The name of the VPC endpoint service running in your AWS account that you want Device \
         Farm to test.\n"]
  service_dns_name : service_dns_name option;
      [@ocaml.doc
        "The DNS (domain) name used to connect to your private service in your VPC. The DNS name \
         must not already be in use on the internet.\n"]
  vpce_configuration_description : vpce_configuration_description option;
      [@ocaml.doc
        "An optional description that provides details about your VPC endpoint configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec update_upload_result = {
  upload : upload option; [@ocaml.doc "A test spec uploaded to Device Farm.\n"]
}
[@@ocaml.doc ""]

type nonrec update_upload_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the uploaded test spec.\n"]
  name : name option;
      [@ocaml.doc
        "The upload's test spec file name. The name must not contain any forward slashes (/). The \
         test spec file name must end with the [.yaml] or [.yml] file extension.\n"]
  content_type : content_type option;
      [@ocaml.doc "The upload's content type (for example, [application/x-yaml]).\n"]
  edit_content : boolean_ option;
      [@ocaml.doc
        "Set to true if the YAML file has changed and must be updated. Otherwise, set to false.\n"]
}
[@@ocaml.doc ""]

type nonrec update_test_grid_project_result = {
  test_grid_project : test_grid_project option;
      [@ocaml.doc "The project, including updated information.\n"]
}
[@@ocaml.doc ""]

type nonrec update_test_grid_project_request = {
  project_arn : device_farm_arn; [@ocaml.doc "ARN of the project to update.\n"]
  name : resource_name option; [@ocaml.doc "Human-readable name for the project.\n"]
  description : resource_description option;
      [@ocaml.doc "Human-readable description for the project.\n"]
  vpc_config : test_grid_vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
}
[@@ocaml.doc ""]

type nonrec update_project_result = {
  project : project option; [@ocaml.doc "The project to update.\n"]
}
[@@ocaml.doc "Represents the result of an update project request.\n"]

type nonrec update_project_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the project whose name to update.\n"]
  name : name option;
      [@ocaml.doc "A string that represents the new name of the project that you are updating.\n"]
  default_job_timeout_minutes : job_timeout_minutes option;
      [@ocaml.doc "The number of minutes a test run in the project executes before it times out.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
  environment_variables : environment_variables option;
      [@ocaml.doc
        " A set of environment variables which are used by default for all runs in the project. \
         These environment variables are applied to the test run during the execution of a test \
         spec file. \n\n\
        \  For more information about using test spec files, please see \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/custom-test-environments.html}Custom \
         test environments } in {i AWS Device Farm.} \n\
        \ "]
  execution_role_arn : amazon_role_resource_name option;
      [@ocaml.doc "An IAM role to be assumed by the test host for all runs in the project.\n"]
}
[@@ocaml.doc "Represents a request to the update project operation.\n"]

type nonrec update_network_profile_result = {
  network_profile : network_profile option;
      [@ocaml.doc "A list of the available network profiles.\n"]
}
[@@ocaml.doc ""]

type nonrec update_network_profile_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project for which you want to update network \
         profile settings.\n"]
  name : name option;
      [@ocaml.doc "The name of the network profile about which you are returning information.\n"]
  description : message option;
      [@ocaml.doc
        "The description of the network profile about which you are returning information.\n"]
  type_ : network_profile_type option;
      [@ocaml.doc
        "The type of network profile to return information about. Valid values are listed here.\n"]
  uplink_bandwidth_bits : long option;
      [@ocaml.doc
        "The data throughput rate in bits per second, as an integer from 0 to 104857600.\n"]
  downlink_bandwidth_bits : long option;
      [@ocaml.doc
        "The data throughput rate in bits per second, as an integer from 0 to 104857600.\n"]
  uplink_delay_ms : long option;
      [@ocaml.doc
        "Delay time for all packets to destination in milliseconds as an integer from 0 to 2000.\n"]
  downlink_delay_ms : long option;
      [@ocaml.doc
        "Delay time for all packets to destination in milliseconds as an integer from 0 to 2000.\n"]
  uplink_jitter_ms : long option;
      [@ocaml.doc
        "Time variation in the delay of received packets in milliseconds as an integer from 0 to \
         2000.\n"]
  downlink_jitter_ms : long option;
      [@ocaml.doc
        "Time variation in the delay of received packets in milliseconds as an integer from 0 to \
         2000.\n"]
  uplink_loss_percent : percent_integer option;
      [@ocaml.doc "Proportion of transmitted packets that fail to arrive from 0 to 100 percent.\n"]
  downlink_loss_percent : percent_integer option;
      [@ocaml.doc "Proportion of received packets that fail to arrive from 0 to 100 percent.\n"]
}
[@@ocaml.doc ""]

type nonrec update_instance_profile_result = {
  instance_profile : instance_profile option;
      [@ocaml.doc "An object that contains information about your instance profile.\n"]
}
[@@ocaml.doc ""]

type nonrec update_instance_profile_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the instance profile.\n"]
  name : name option; [@ocaml.doc "The updated name for your instance profile.\n"]
  description : message option; [@ocaml.doc "The updated description for your instance profile.\n"]
  package_cleanup : boolean_ option;
      [@ocaml.doc
        "The updated choice for whether you want to specify package cleanup. The default value is \
         [false] for private devices.\n"]
  exclude_app_packages_from_cleanup : package_ids option;
      [@ocaml.doc
        "An array of strings that specifies the list of app packages that should not be cleaned up \
         from the device after a test run is over.\n\n\
        \ The list of packages is only considered if you set [packageCleanup] to [true].\n\
        \ "]
  reboot_after_use : boolean_ option;
      [@ocaml.doc
        "The updated choice for whether you want to reboot the device after use. The default value \
         is [true].\n"]
}
[@@ocaml.doc ""]

type nonrec update_device_pool_result = {
  device_pool : device_pool option; [@ocaml.doc "The device pool you just updated.\n"]
}
[@@ocaml.doc "Represents the result of an update device pool request.\n"]

type nonrec update_device_pool_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Device Farm device pool to update.\n"]
  name : name option;
      [@ocaml.doc "A string that represents the name of the device pool to update.\n"]
  description : message option; [@ocaml.doc "A description of the device pool to update.\n"]
  rules : rules option;
      [@ocaml.doc
        "Represents the rules to modify for the device pool. Updating rules is optional. If you \
         update rules for your request, the update replaces the existing rules.\n"]
  max_devices : integer option;
      [@ocaml.doc
        "The number of devices that Device Farm can add to your device pool. Device Farm adds \
         devices that are available and that meet the criteria that you assign for the [rules] \
         parameter. Depending on how many devices meet these constraints, your device pool might \
         contain fewer devices than the value for this parameter.\n\n\
        \ By specifying the maximum number of devices, you can control the costs that you incur by \
         running tests.\n\
        \ \n\
        \  If you use this parameter in your request, you cannot use the [clearMaxDevices] \
         parameter in the same request.\n\
        \  "]
  clear_max_devices : boolean_ option;
      [@ocaml.doc
        "Sets whether the [maxDevices] parameter applies to your device pool. If you set this \
         parameter to [true], the [maxDevices] parameter does not apply, and Device Farm does not \
         limit the number of devices that it adds to your device pool. In this case, Device Farm \
         adds all available devices that meet the criteria specified in the [rules] parameter.\n\n\
        \ If you use this parameter in your request, you cannot use the [maxDevices] parameter in \
         the same request.\n\
        \ "]
}
[@@ocaml.doc "Represents a request to the update device pool operation.\n"]

type nonrec update_device_instance_result = {
  device_instance : device_instance option;
      [@ocaml.doc "An object that contains information about your device instance.\n"]
}
[@@ocaml.doc ""]

type nonrec update_device_instance_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the device instance.\n"]
  profile_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the profile that you want to associate with the device instance.\n"]
  labels : instance_labels option;
      [@ocaml.doc "An array of strings that you want to associate with the device instance.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : device_farm_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource or resources from which to delete tags. \
         You can associate tags with the following Device Farm resources: [PROJECT], \
         [TESTGRID_PROJECT], [RUN], [NETWORK_PROFILE], [INSTANCE_PROFILE], [DEVICE_INSTANCE], \
         [SESSION], [DEVICE_POOL], [DEVICE], and [VPCE_CONFIGURATION].\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The keys of the tags to be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  message : exception_message option; [@ocaml.doc ""]
  resource_name : amazon_resource_name option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The list of tags on the repository is over the limit. The maximum number of tags that can be \
   applied to a repository is 50. \n"]

type nonrec tag_policy_exception = {
  message : exception_message option; [@ocaml.doc ""]
  resource_name : amazon_resource_name option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request doesn't comply with the AWS Identity and Access Management (IAM) tag policy. \
   Correct your request and then retry it.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "One part of a key-value pair that makes up a tag. A [key] is a general label that acts \
         like a category for more specific tag values.\n"]
  value : tag_value;
      [@ocaml.doc
        "The optional part of a key-value pair that makes up a tag. A [value] acts as a descriptor \
         in a tag category (key).\n"]
}
[@@ocaml.doc
  "The metadata that you apply to a resource to help you categorize and organize it. Each tag \
   consists of a key and an optional value, both of which you define. Tag keys can have a maximum \
   character length of 128 characters. Tag values can have a maximum length of 256 characters. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : device_farm_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource or resources to which to add tags. You can \
         associate tags with the following Device Farm resources: [PROJECT], [TESTGRID_PROJECT], \
         [RUN], [NETWORK_PROFILE], [INSTANCE_PROFILE], [DEVICE_INSTANCE], [SESSION], \
         [DEVICE_POOL], [DEVICE], and [VPCE_CONFIGURATION].\n"]
  tags : tag_list;
      [@ocaml.doc
        "The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have \
         a maximum character length of 128 characters. Tag values can have a maximum length of 256 \
         characters.\n"]
}
[@@ocaml.doc ""]

type nonrec device_filter_values = string_ list [@@ocaml.doc ""]

type nonrec device_filter_attribute =
  | ARN [@ocaml.doc ""]
  | PLATFORM [@ocaml.doc ""]
  | OS_VERSION [@ocaml.doc ""]
  | MODEL [@ocaml.doc ""]
  | AVAILABILITY [@ocaml.doc ""]
  | FORM_FACTOR [@ocaml.doc ""]
  | MANUFACTURER [@ocaml.doc ""]
  | REMOTE_ACCESS_ENABLED [@ocaml.doc ""]
  | REMOTE_DEBUG_ENABLED [@ocaml.doc ""]
  | INSTANCE_ARN [@ocaml.doc ""]
  | INSTANCE_LABELS [@ocaml.doc ""]
  | FLEET_TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec device_filter = {
  attribute : device_filter_attribute;
      [@ocaml.doc
        "The aspect of a device such as platform or model used as the selection criteria in a \
         device filter.\n\n\
        \ The supported operators for each attribute are provided in the following list.\n\
        \ \n\
        \   ARN  The Amazon Resource Name (ARN) of the device (for example, \
         [arn:aws:devicefarm:us-west-2::device:12345Example]).\n\
        \        \n\
        \         Supported operators: [EQUALS], [IN], [NOT_IN] \n\
        \         \n\
        \           PLATFORM  The device platform. Valid values are ANDROID or IOS.\n\
        \                     \n\
        \                      Supported operators: [EQUALS] \n\
        \                      \n\
        \                        OS_VERSION  The operating system version (for example, 10.3.2).\n\
        \                                    \n\
        \                                     Supported operators: [EQUALS], [GREATER_THAN], \
         [GREATER_THAN_OR_EQUALS], [IN], [LESS_THAN], [LESS_THAN_OR_EQUALS], [NOT_IN] \n\
        \                                     \n\
        \                                       MODEL  The device model (for example, iPad 5th Gen).\n\
        \                                              \n\
        \                                               Supported operators: [CONTAINS], [EQUALS], \
         [IN], [NOT_IN] \n\
        \                                               \n\
        \                                                 AVAILABILITY  The current availability \
         of the device. Valid values are AVAILABLE, HIGHLY_AVAILABLE, BUSY, or \
         TEMPORARY_NOT_AVAILABLE.\n\
        \                                                               \n\
        \                                                                Supported operators: \
         [EQUALS] \n\
        \                                                                \n\
        \                                                                  FORM_FACTOR  The device \
         form factor. Valid values are PHONE or TABLET.\n\
        \                                                                               \n\
        \                                                                                Supported \
         operators: [EQUALS] \n\
        \                                                                                \n\
        \                                                                                  \
         MANUFACTURER  \n\
         The device manufacturer (for example, Apple).\n\n\
        \ Supported operators: [EQUALS], [IN], [NOT_IN] \n\
        \ \n\
        \   REMOTE_ACCESS_ENABLED  Whether the device is enabled for remote access. Valid values \
         are TRUE or FALSE.\n\
        \                          \n\
        \                           Supported operators: [EQUALS] \n\
        \                           \n\
        \                             REMOTE_DEBUG_ENABLED  Whether the device is enabled for \
         remote debugging. Valid values are TRUE or FALSE.\n\
        \                                                   \n\
        \                                                    Supported operators: [EQUALS] \n\
        \                                                    \n\
        \                                                     Because remote debugging is \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html}no longer \
         supported}, this filter is ignored.\n\
        \                                                     \n\
        \                                                       INSTANCE_ARN  The Amazon Resource \
         Name (ARN) of the device instance.\n\
        \                                                                     \n\
        \                                                                      Supported \
         operators: [EQUALS], [IN], [NOT_IN] \n\
        \                                                                      \n\
        \                                                                        INSTANCE_LABELS  \n\
         The label of the device instance.\n\n\
        \ Supported operators: [CONTAINS] \n\
        \ \n\
        \   FLEET_TYPE  The fleet type. Valid values are PUBLIC or PRIVATE.\n\
        \               \n\
        \                Supported operators: [EQUALS] \n\
        \                \n\
        \                  "]
  operator : rule_operator;
      [@ocaml.doc
        "Specifies how Device Farm compares the filter's attribute to the value. See the attribute \
         descriptions.\n"]
  values : device_filter_values;
      [@ocaml.doc
        "An array of one or more filter values used in a device filter.\n\n\
        \  {b Operator Values} \n\
        \ \n\
        \  {ul\n\
        \        {-  The IN and NOT_IN operators can take a values array that has more than one \
         element.\n\
        \            \n\
        \             }\n\
        \        {-  The other operators require an array with a single element.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    {b Attribute Values} \n\
        \   \n\
        \    {ul\n\
        \          {-  The PLATFORM attribute can be set to ANDROID or IOS.\n\
        \              \n\
        \               }\n\
        \          {-  The AVAILABILITY attribute can be set to AVAILABLE, HIGHLY_AVAILABLE, BUSY, \
         or TEMPORARY_NOT_AVAILABLE.\n\
        \              \n\
        \               }\n\
        \          {-  The FORM_FACTOR attribute can be set to PHONE or TABLET.\n\
        \              \n\
        \               }\n\
        \          {-  The FLEET_TYPE attribute can be set to PUBLIC or PRIVATE.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc
  "Represents a device filter used to select a set of devices to be included in a test run. This \
   data structure is passed in as the [deviceSelectionConfiguration] parameter to [ScheduleRun]. \
   For an example of the JSON request syntax, see [ScheduleRun].\n\n\
  \ It is also passed in as the [filters] parameter to [ListDevices]. For an example of the JSON \
   request syntax, see [ListDevices].\n\
  \ "]

type nonrec device_filters = device_filter list [@@ocaml.doc ""]

type nonrec device_selection_result = {
  filters : device_filters option; [@ocaml.doc "The filters in a device selection result.\n"]
  matched_devices_count : integer option;
      [@ocaml.doc "The number of devices that matched the device filter selection criteria.\n"]
  max_devices : integer option;
      [@ocaml.doc
        "The maximum number of devices to be selected by a device filter and included in a test run.\n"]
}
[@@ocaml.doc
  "Contains the run results requested by the device selection configuration and how many devices \
   were returned. For an example of the JSON response syntax, see [ScheduleRun].\n"]

type nonrec location = {
  latitude : double; [@ocaml.doc "The latitude.\n"]
  longitude : double; [@ocaml.doc "The longitude.\n"]
}
[@@ocaml.doc
  "Represents a latitude and longitude pair, expressed in geographic coordinate system degrees \
   (for example, 47.6204, -122.3491).\n\n\
  \ Elevation is currently not supported.\n\
  \ "]

type nonrec radios = {
  wifi : boolean_ option;
      [@ocaml.doc "True if Wi-Fi is enabled at the beginning of the test. Otherwise, false.\n"]
  bluetooth : boolean_ option;
      [@ocaml.doc "True if Bluetooth is enabled at the beginning of the test. Otherwise, false.\n"]
  nfc : boolean_ option;
      [@ocaml.doc "True if NFC is enabled at the beginning of the test. Otherwise, false.\n"]
  gps : boolean_ option;
      [@ocaml.doc "True if GPS is enabled at the beginning of the test. Otherwise, false.\n"]
}
[@@ocaml.doc
  "Represents the set of radios and their states on a device. Examples of radios include Wi-Fi, \
   GPS, Bluetooth, and NFC.\n"]

type nonrec execution_result_code =
  | PARSING_FAILED [@ocaml.doc ""]
  | VPC_ENDPOINT_SETUP_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec test_type =
  | BUILTIN_FUZZ [@ocaml.doc ""]
  | APPIUM_JAVA_JUNIT [@ocaml.doc ""]
  | APPIUM_JAVA_TESTNG [@ocaml.doc ""]
  | APPIUM_PYTHON [@ocaml.doc ""]
  | APPIUM_NODE [@ocaml.doc ""]
  | APPIUM_RUBY [@ocaml.doc ""]
  | APPIUM_WEB_JAVA_JUNIT [@ocaml.doc ""]
  | APPIUM_WEB_JAVA_TESTNG [@ocaml.doc ""]
  | APPIUM_WEB_PYTHON [@ocaml.doc ""]
  | APPIUM_WEB_NODE [@ocaml.doc ""]
  | APPIUM_WEB_RUBY [@ocaml.doc ""]
  | INSTRUMENTATION [@ocaml.doc ""]
  | XCTEST [@ocaml.doc ""]
  | XCTEST_UI [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec run = {
  arn : amazon_resource_name option; [@ocaml.doc "The run's ARN.\n"]
  name : name option; [@ocaml.doc "The run's name.\n"]
  type_ : test_type option;
      [@ocaml.doc
        "The run's type.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  BUILTIN_FUZZ\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  platform : device_platform option;
      [@ocaml.doc
        "The run's platform.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  ANDROID\n\
        \            \n\
        \             }\n\
        \        {-  IOS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  created : date_time option; [@ocaml.doc "When the run was created.\n"]
  status : execution_status option;
      [@ocaml.doc
        "The run's status.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_CONCURRENCY\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_DEVICE\n\
        \            \n\
        \             }\n\
        \        {-  PROCESSING\n\
        \            \n\
        \             }\n\
        \        {-  SCHEDULING\n\
        \            \n\
        \             }\n\
        \        {-  PREPARING\n\
        \            \n\
        \             }\n\
        \        {-  RUNNING\n\
        \            \n\
        \             }\n\
        \        {-  COMPLETED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPING\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  result_ : execution_result option;
      [@ocaml.doc
        "The run's result.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PASSED\n\
        \            \n\
        \             }\n\
        \        {-  WARNED\n\
        \            \n\
        \             }\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        {-  SKIPPED\n\
        \            \n\
        \             }\n\
        \        {-  ERRORED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  started : date_time option; [@ocaml.doc "The run's start time.\n"]
  stopped : date_time option; [@ocaml.doc "The run's stop time.\n"]
  counters : counters option; [@ocaml.doc "The run's result counters.\n"]
  message : message option; [@ocaml.doc "A message about the run's result.\n"]
  total_jobs : integer option; [@ocaml.doc "The total number of jobs for the run.\n"]
  completed_jobs : integer option; [@ocaml.doc "The total number of completed jobs.\n"]
  billing_method : billing_method option;
      [@ocaml.doc
        "Specifies the billing method for a test run: [metered] or [unmetered]. If the parameter \
         is not specified, the default value is [metered].\n\n\
        \  If you have unmetered device slots, you must set this to [unmetered] to use them. \
         Otherwise, the run is counted toward metered device minutes.\n\
        \  \n\
        \   "]
  device_minutes : device_minutes option;
      [@ocaml.doc "Represents the total (metered or unmetered) minutes used by the test run.\n"]
  network_profile : network_profile option;
      [@ocaml.doc "The network profile being used for a test run.\n"]
  device_proxy : device_proxy option;
      [@ocaml.doc "The device proxy configured for the devices in the run.\n"]
  parsing_result_url : string_ option;
      [@ocaml.doc
        "Read-only URL for an object in an S3 bucket where you can get the parsing results of the \
         test package. If the test package doesn't parse, the reason why it doesn't parse appears \
         in the file that this URL points to.\n"]
  result_code : execution_result_code option;
      [@ocaml.doc
        "Supporting field for the result field. Set only if [result] is [SKIPPED]. \
         [PARSING_FAILED] if the result is skipped because of test package parsing failure.\n"]
  seed : integer option;
      [@ocaml.doc
        "For fuzz tests, this is a seed to use for randomizing the UI fuzz test. Using the same \
         seed value between tests ensures identical event sequences.\n"]
  app_upload : amazon_resource_name option;
      [@ocaml.doc "An app to upload or that has been uploaded.\n"]
  event_count : integer option;
      [@ocaml.doc
        "For fuzz tests, this is the number of events, between 1 and 10000, that the UI fuzz test \
         should perform.\n"]
  job_timeout_minutes : job_timeout_minutes option;
      [@ocaml.doc "The number of minutes the job executes before it times out.\n"]
  device_pool_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the device pool for the run.\n"]
  locale : string_ option; [@ocaml.doc "Information about the locale that is used for the run.\n"]
  radios : radios option; [@ocaml.doc "Information about the radio states for the run.\n"]
  location : location option;
      [@ocaml.doc "Information about the location that is used for the run.\n"]
  customer_artifact_paths : customer_artifact_paths option;
      [@ocaml.doc "Output [CustomerArtifactPaths] object for the test run.\n"]
  web_url : string_ option;
      [@ocaml.doc "The Device Farm console URL for the recording of the run.\n"]
  skip_app_resign : skip_app_resign option;
      [@ocaml.doc
        "When set to [true], for private devices, Device Farm does not sign your app again. For \
         public devices, Device Farm always signs your apps again.\n\n\
        \ For more information about how Device Farm re-signs your apps, see \
         {{:http://aws.amazon.com/device-farm/faqs/}Do you modify my app?} in the {i AWS Device \
         Farm FAQs}.\n\
        \ "]
  test_spec_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the YAML-formatted test specification for the run.\n"]
  device_selection_result : device_selection_result option;
      [@ocaml.doc "The results of a device filter used to select the devices for a test run.\n"]
  vpc_config : vpc_config option;
      [@ocaml.doc "The VPC security groups and subnets that are attached to a project.\n"]
  execution_role_arn : amazon_role_resource_name option;
      [@ocaml.doc "The IAM role associated with the run.\n"]
  environment_variables : environment_variables option;
      [@ocaml.doc "Environment variables associated with the run.\n"]
}
[@@ocaml.doc
  "Represents a test run on a set of devices with a given app package, test parameters, and so on.\n"]

type nonrec stop_run_result = { run : run option [@ocaml.doc "The run that was stopped.\n"] }
[@@ocaml.doc "Represents the results of your stop run attempt.\n"]

type nonrec stop_run_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "Represents the Amazon Resource Name (ARN) of the Device Farm run to stop.\n"]
}
[@@ocaml.doc "Represents the request to stop a specific run.\n"]

type nonrec stop_remote_access_session_result = {
  remote_access_session : remote_access_session option;
      [@ocaml.doc
        "A container that represents the metadata from the service about the remote access session \
         you are stopping.\n"]
}
[@@ocaml.doc
  "Represents the response from the server that describes the remote access session when AWS \
   Device Farm stops the session.\n"]

type nonrec stop_remote_access_session_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the remote access session to stop.\n"]
}
[@@ocaml.doc "Represents the request to stop the remote access session.\n"]

type nonrec video_capture = bool [@@ocaml.doc ""]

type nonrec job = {
  arn : amazon_resource_name option; [@ocaml.doc "The job's ARN.\n"]
  name : name option; [@ocaml.doc "The job's name.\n"]
  type_ : test_type option;
      [@ocaml.doc
        "The job's type.\n\n\
        \ Allowed values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  BUILTIN_FUZZ\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  created : date_time option; [@ocaml.doc "When the job was created.\n"]
  status : execution_status option;
      [@ocaml.doc
        "The job's status.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_CONCURRENCY\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_DEVICE\n\
        \            \n\
        \             }\n\
        \        {-  PROCESSING\n\
        \            \n\
        \             }\n\
        \        {-  SCHEDULING\n\
        \            \n\
        \             }\n\
        \        {-  PREPARING\n\
        \            \n\
        \             }\n\
        \        {-  RUNNING\n\
        \            \n\
        \             }\n\
        \        {-  COMPLETED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPING\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  result_ : execution_result option;
      [@ocaml.doc
        "The job's result.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PASSED\n\
        \            \n\
        \             }\n\
        \        {-  WARNED\n\
        \            \n\
        \             }\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        {-  SKIPPED\n\
        \            \n\
        \             }\n\
        \        {-  ERRORED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  started : date_time option; [@ocaml.doc "The job's start time.\n"]
  stopped : date_time option; [@ocaml.doc "The job's stop time.\n"]
  counters : counters option; [@ocaml.doc "The job's result counters.\n"]
  message : message option; [@ocaml.doc "A message about the job's result.\n"]
  device : device option; [@ocaml.doc "The device (phone or tablet).\n"]
  instance_arn : amazon_resource_name option; [@ocaml.doc "The ARN of the instance.\n"]
  device_minutes : device_minutes option;
      [@ocaml.doc "Represents the total (metered or unmetered) minutes used by the job.\n"]
  video_endpoint : string_ option; [@ocaml.doc "The endpoint for streaming device video.\n"]
  video_capture : video_capture option;
      [@ocaml.doc
        "This value is set to true if video capture is enabled. Otherwise, it is set to false.\n"]
}
[@@ocaml.doc "Represents a device.\n"]

type nonrec stop_job_result = { job : job option [@ocaml.doc "The job that was stopped.\n"] }
[@@ocaml.doc ""]

type nonrec stop_job_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "Represents the Amazon Resource Name (ARN) of the Device Farm job to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec idempotency_exception = {
  message : message option; [@ocaml.doc "Any additional information about the exception.\n"]
}
[@@ocaml.doc "An entity with the same name already exists.\n"]

type nonrec schedule_run_result = {
  run : run option; [@ocaml.doc "Information about the scheduled run.\n"]
}
[@@ocaml.doc "Represents the result of a schedule run request.\n"]

type nonrec execution_configuration = {
  job_timeout_minutes : job_timeout_minutes option;
      [@ocaml.doc "The number of minutes a test run executes before it times out.\n"]
  accounts_cleanup : accounts_cleanup option;
      [@ocaml.doc
        "True if account cleanup is enabled at the beginning of the test. Otherwise, false.\n"]
  app_packages_cleanup : app_packages_cleanup option;
      [@ocaml.doc
        "True if app package cleanup is enabled at the beginning of the test. Otherwise, false.\n"]
  video_capture : video_capture option;
      [@ocaml.doc
        "Set to true to enable video capture. Otherwise, set to false. The default is true.\n"]
  skip_app_resign : skip_app_resign option;
      [@ocaml.doc
        "When set to [true], for private devices, Device Farm does not sign your app again. For \
         public devices, Device Farm always signs your apps again.\n\n\
        \ For more information about how Device Farm re-signs your apps, see \
         {{:http://aws.amazon.com/device-farm/faqs/}Do you modify my app?} in the {i AWS Device \
         Farm FAQs}.\n\
        \ "]
}
[@@ocaml.doc
  "Represents configuration information about a test run, such as the execution timeout (in \
   minutes).\n"]

type nonrec schedule_run_configuration = {
  extra_data_package_arn : amazon_resource_name option;
      [@ocaml.doc
        "The ARN of the extra data for the run. The extra data is a .zip file that AWS Device Farm \
         extracts to external data for Android or the app's sandbox for iOS.\n"]
  network_profile_arn : amazon_resource_name option; [@ocaml.doc "Reserved for internal use.\n"]
  locale : string_ option; [@ocaml.doc "Information about the locale that is used for the run.\n"]
  location : location option;
      [@ocaml.doc "Information about the location that is used for the run.\n"]
  vpce_configuration_arns : amazon_resource_names option;
      [@ocaml.doc "An array of ARNs for your VPC endpoint configurations.\n"]
  device_proxy : device_proxy option;
      [@ocaml.doc "The device proxy to be configured on the device for the run.\n"]
  customer_artifact_paths : customer_artifact_paths option;
      [@ocaml.doc "Input [CustomerArtifactPaths] object for the scheduled run configuration.\n"]
  radios : radios option; [@ocaml.doc "Information about the radio states for the run.\n"]
  auxiliary_apps : amazon_resource_names option;
      [@ocaml.doc "A list of upload ARNs for app packages to be installed with your app.\n"]
  billing_method : billing_method option;
      [@ocaml.doc
        "Specifies the billing method for a test run: [metered] or [unmetered]. If the parameter \
         is not specified, the default value is [metered].\n\n\
        \  If you have purchased unmetered device slots, you must set this parameter to \
         [unmetered] to make use of them. Otherwise, your run counts against your metered time.\n\
        \  \n\
        \   "]
  environment_variables : environment_variables option;
      [@ocaml.doc "Environment variables associated with the run.\n"]
  execution_role_arn : amazon_role_resource_name option;
      [@ocaml.doc "An IAM role to be assumed by the test host for the run.\n"]
}
[@@ocaml.doc
  "Represents the settings for a run. Includes things like location, radio states, auxiliary apps, \
   and network profiles.\n"]

type nonrec test_parameters = (string_ * string_) list [@@ocaml.doc ""]

type nonrec filter = string [@@ocaml.doc ""]

type nonrec schedule_run_test = {
  type_ : test_type;
      [@ocaml.doc
        "The test's type.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  BUILTIN_FUZZ\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  test_package_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the uploaded test to be run.\n"]
  test_spec_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the YAML-formatted test specification.\n"]
  filter : filter option; [@ocaml.doc "The test's filter.\n"]
  parameters : test_parameters option;
      [@ocaml.doc
        "The test's parameters, such as test framework parameters and fixture settings. Parameters \
         are represented by name-value pairs of strings.\n\n\
        \ For all tests:\n\
        \ \n\
        \  {ul\n\
        \        {-   [app_performance_monitoring]: Performance monitoring is enabled by default. \
         Set this parameter to false to disable it.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For Appium tests (all types):\n\
        \   \n\
        \    {ul\n\
        \          {-  appium_version: The Appium version. Currently supported values are 1.6.5 \
         (and later), latest, and default.\n\
        \              \n\
        \               {ul\n\
        \                     {-  latest runs the latest Appium version supported by Device Farm \
         (1.9.1).\n\
        \                         \n\
        \                          }\n\
        \                     {-  For default, Device Farm selects a compatible version of Appium \
         for the device. The current behavior is to run 1.7.2 on Android devices and iOS 9 and \
         earlier and 1.7.2 for iOS 10 and later.\n\
        \                         \n\
        \                          }\n\
        \                     {-  This behavior is subject to change.\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          }\n\
        \   For fuzz tests (Android only):\n\
        \   \n\
        \    {ul\n\
        \          {-  event_count: The number of events, between 1 and 10000, that the UI fuzz \
         test should perform.\n\
        \              \n\
        \               }\n\
        \          {-  throttle: The time, in ms, between 0 and 1000, that the UI fuzz test should \
         wait between events.\n\
        \              \n\
        \               }\n\
        \          {-  seed: A seed to use for randomizing the UI fuzz test. Using the same seed \
         value between tests ensures identical event sequences.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   For Instrumentation:\n\
        \   \n\
        \    {ul\n\
        \          {-  filter: A test filter string. Examples:\n\
        \              \n\
        \               {ul\n\
        \                     {-  Running a single test case: [com.android.abc.Test1] \n\
        \                         \n\
        \                          }\n\
        \                     {-  Running a single test: [com.android.abc.Test1#smoke] \n\
        \                         \n\
        \                          }\n\
        \                     {-  Running multiple tests: \
         [com.android.abc.Test1,com.android.abc.Test2] \n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          }\n\
        \   For XCTest and XCTestUI:\n\
        \   \n\
        \    {ul\n\
        \          {-  filter: A test filter string. Examples:\n\
        \              \n\
        \               {ul\n\
        \                     {-  Running a single test class: [LoginTests] \n\
        \                         \n\
        \                          }\n\
        \                     {-  Running a multiple test classes: [LoginTests,SmokeTests] \n\
        \                         \n\
        \                          }\n\
        \                     {-  Running a single test: [LoginTests/testValid] \n\
        \                         \n\
        \                          }\n\
        \                     {-  Running multiple tests: \
         [LoginTests/testValid,LoginTests/testInvalid] \n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc
  "Represents test settings. This data structure is passed in as the test parameter to \
   ScheduleRun. For an example of the JSON request syntax, see [ScheduleRun].\n"]

type nonrec device_selection_configuration = {
  filters : device_filters;
      [@ocaml.doc
        "Used to dynamically select a set of devices for a test run. A filter is made up of an \
         attribute, an operator, and one or more values.\n\n\
        \ {ul\n\
        \       {-   {b Attribute} \n\
        \           \n\
        \            The aspect of a device such as platform or model used as the selection \
         criteria in a device filter.\n\
        \            \n\
        \             Allowed values include:\n\
        \             \n\
        \              {ul\n\
        \                    {-  ARN: The Amazon Resource Name (ARN) of the device (for example, \
         [arn:aws:devicefarm:us-west-2::device:12345Example]).\n\
        \                        \n\
        \                         }\n\
        \                    {-  PLATFORM: The device platform. Valid values are ANDROID or IOS.\n\
        \                        \n\
        \                         }\n\
        \                    {-  OS_VERSION: The operating system version (for example, 10.3.2).\n\
        \                        \n\
        \                         }\n\
        \                    {-  MODEL: The device model (for example, iPad 5th Gen).\n\
        \                        \n\
        \                         }\n\
        \                    {-  AVAILABILITY: The current availability of the device. Valid \
         values are AVAILABLE, HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.\n\
        \                        \n\
        \                         }\n\
        \                    {-  FORM_FACTOR: The device form factor. Valid values are PHONE or \
         TABLET.\n\
        \                        \n\
        \                         }\n\
        \                    {-  MANUFACTURER: The device manufacturer (for example, Apple).\n\
        \                        \n\
        \                         }\n\
        \                    {-  REMOTE_ACCESS_ENABLED: Whether the device is enabled for remote \
         access. Valid values are TRUE or FALSE.\n\
        \                        \n\
        \                         }\n\
        \                    {-  REMOTE_DEBUG_ENABLED: Whether the device is enabled for remote \
         debugging. Valid values are TRUE or FALSE. Because remote debugging is \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html}no longer \
         supported}, this filter is ignored.\n\
        \                        \n\
        \                         }\n\
        \                    {-  INSTANCE_ARN: The Amazon Resource Name (ARN) of the device \
         instance.\n\
        \                        \n\
        \                         }\n\
        \                    {-  INSTANCE_LABELS: The label of the device instance.\n\
        \                        \n\
        \                         }\n\
        \                    {-  FLEET_TYPE: The fleet type. Valid values are PUBLIC or PRIVATE.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \         }\n\
        \       {-   {b Operator} \n\
        \           \n\
        \            The filter operator.\n\
        \            \n\
        \             {ul\n\
        \                   {-  The EQUALS operator is available for every attribute except \
         INSTANCE_LABELS.\n\
        \                       \n\
        \                        }\n\
        \                   {-  The CONTAINS operator is available for the INSTANCE_LABELS and \
         MODEL attributes.\n\
        \                       \n\
        \                        }\n\
        \                   {-  The IN and NOT_IN operators are available for the ARN, OS_VERSION, \
         MODEL, MANUFACTURER, and INSTANCE_ARN attributes.\n\
        \                       \n\
        \                        }\n\
        \                   {-  The LESS_THAN, GREATER_THAN, LESS_THAN_OR_EQUALS, and \
         GREATER_THAN_OR_EQUALS operators are also available for the OS_VERSION attribute.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-   {b Values} \n\
        \           \n\
        \            An array of one or more filter values.\n\
        \            \n\
        \              {b Operator Values} \n\
        \             \n\
        \              {ul\n\
        \                    {-  The IN and NOT_IN operators can take a values array that has more \
         than one element.\n\
        \                        \n\
        \                         }\n\
        \                    {-  The other operators require an array with a single element.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \          {b Attribute Values} \n\
        \         \n\
        \          {ul\n\
        \                {-  The PLATFORM attribute can be set to ANDROID or IOS.\n\
        \                    \n\
        \                     }\n\
        \                {-  The AVAILABILITY attribute can be set to AVAILABLE, HIGHLY_AVAILABLE, \
         BUSY, or TEMPORARY_NOT_AVAILABLE.\n\
        \                    \n\
        \                     }\n\
        \                {-  The FORM_FACTOR attribute can be set to PHONE or TABLET.\n\
        \                    \n\
        \                     }\n\
        \                {-  The FLEET_TYPE attribute can be set to PUBLIC or PRIVATE.\n\
        \                    \n\
        \                     }\n\
        \                \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
  max_devices : integer; [@ocaml.doc "The maximum number of devices to be included in a test run.\n"]
}
[@@ocaml.doc
  "Represents the device filters used in a test run and the maximum number of devices to be \
   included in the run. It is passed in as the [deviceSelectionConfiguration] request parameter in \
   [ScheduleRun].\n"]

type nonrec schedule_run_request = {
  project_arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the project for the run to be scheduled.\n"]
  app_arn : amazon_resource_name option;
      [@ocaml.doc
        "The ARN of an application package to run tests against, created with [CreateUpload]. See \
         [ListUploads].\n"]
  device_pool_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the device pool for the run to be scheduled.\n"]
  device_selection_configuration : device_selection_configuration option;
      [@ocaml.doc
        "The filter criteria used to dynamically select a set of devices for a test run and the \
         maximum number of devices to be included in the run.\n\n\
        \ Either {b  [devicePoolArn] } or {b  [deviceSelectionConfiguration] } is required in a \
         request.\n\
        \ "]
  name : name option; [@ocaml.doc "The name for the run to be scheduled.\n"]
  test : schedule_run_test; [@ocaml.doc "Information about the test for the run to be scheduled.\n"]
  configuration : schedule_run_configuration option;
      [@ocaml.doc "Information about the settings for the run to be scheduled.\n"]
  execution_configuration : execution_configuration option;
      [@ocaml.doc
        "Specifies configuration information about a test run, such as the execution timeout (in \
         minutes).\n"]
}
[@@ocaml.doc "Represents a request to the schedule run operation.\n"]

type nonrec not_eligible_exception = {
  message : message option; [@ocaml.doc "The HTTP response code of a Not Eligible exception.\n"]
}
[@@ocaml.doc
  "Exception gets thrown when a user is not eligible to perform the specified transaction.\n"]

type nonrec monetary_amount = {
  amount : double option; [@ocaml.doc "The numerical amount of an offering or transaction.\n"]
  currency_code : currency_code option;
      [@ocaml.doc
        "The currency code of a monetary amount. For example, [USD] means U.S. dollars.\n"]
}
[@@ocaml.doc "A number that represents the monetary amount for an offering or transaction.\n"]

type nonrec offering_promotion_identifier = string [@@ocaml.doc ""]

type nonrec transaction_identifier = string [@@ocaml.doc ""]

type nonrec recurring_charge_frequency = MONTHLY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec recurring_charge = {
  cost : monetary_amount option; [@ocaml.doc "The cost of the recurring charge.\n"]
  frequency : recurring_charge_frequency option;
      [@ocaml.doc "The frequency in which charges recur.\n"]
}
[@@ocaml.doc "Specifies whether charges for devices are recurring.\n"]

type nonrec recurring_charges = recurring_charge list [@@ocaml.doc ""]

type nonrec offering_type = RECURRING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec offering_identifier = string [@@ocaml.doc ""]

type nonrec offering = {
  id : offering_identifier option; [@ocaml.doc "The ID that corresponds to a device offering.\n"]
  description : message option; [@ocaml.doc "A string that describes the offering.\n"]
  type_ : offering_type option;
      [@ocaml.doc "The type of offering (for example, [RECURRING]) for a device.\n"]
  platform : device_platform option;
      [@ocaml.doc "The platform of the device (for example, [ANDROID] or [IOS]).\n"]
  recurring_charges : recurring_charges option;
      [@ocaml.doc "Specifies whether there are recurring charges for the offering.\n"]
}
[@@ocaml.doc "Represents the metadata of a device offering.\n"]

type nonrec offering_transaction_type =
  | PURCHASE [@ocaml.doc ""]
  | RENEW [@ocaml.doc ""]
  | SYSTEM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec offering_status = {
  type_ : offering_transaction_type option;
      [@ocaml.doc "The type specified for the offering status.\n"]
  offering : offering option; [@ocaml.doc "Represents the metadata of an offering status.\n"]
  quantity : integer option; [@ocaml.doc "The number of available devices in the offering.\n"]
  effective_on : date_time option; [@ocaml.doc "The date on which the offering is effective.\n"]
}
[@@ocaml.doc "The status of the offering.\n"]

type nonrec offering_transaction = {
  offering_status : offering_status option; [@ocaml.doc "The status of an offering transaction.\n"]
  transaction_id : transaction_identifier option;
      [@ocaml.doc "The transaction ID of the offering transaction.\n"]
  offering_promotion_id : offering_promotion_identifier option;
      [@ocaml.doc "The ID that corresponds to a device offering promotion.\n"]
  created_on : date_time option;
      [@ocaml.doc "The date on which an offering transaction was created.\n"]
  cost : monetary_amount option; [@ocaml.doc "The cost of an offering transaction.\n"]
}
[@@ocaml.doc "Represents the metadata of an offering transaction.\n"]

type nonrec renew_offering_result = {
  offering_transaction : offering_transaction option;
      [@ocaml.doc "Represents the status of the offering transaction for the renewal.\n"]
}
[@@ocaml.doc "The result of a renewal offering.\n"]

type nonrec renew_offering_request = {
  offering_id : offering_identifier; [@ocaml.doc "The ID of a request to renew an offering.\n"]
  quantity : integer; [@ocaml.doc "The quantity requested in an offering renewal.\n"]
}
[@@ocaml.doc "A request that represents an offering renewal.\n"]

type nonrec purchase_offering_result = {
  offering_transaction : offering_transaction option;
      [@ocaml.doc "Represents the offering transaction for the purchase result.\n"]
}
[@@ocaml.doc "The result of the purchase offering (for example, success or failure).\n"]

type nonrec purchase_offering_request = {
  offering_id : offering_identifier; [@ocaml.doc "The ID of the offering.\n"]
  quantity : integer;
      [@ocaml.doc "The number of device slots to purchase in an offering request.\n"]
  offering_promotion_id : offering_promotion_identifier option;
      [@ocaml.doc "The ID of the offering promotion to be applied to the purchase.\n"]
}
[@@ocaml.doc "Represents a request for a purchase offering.\n"]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec vpce_configurations = vpce_configuration list [@@ocaml.doc ""]

type nonrec list_vpce_configurations_result = {
  vpce_configurations : vpce_configurations option;
      [@ocaml.doc
        "An array of [VPCEConfiguration] objects that contain information about your VPC endpoint \
         configuration.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_vpce_configurations_request = {
  max_results : integer option;
      [@ocaml.doc
        "An integer that specifies the maximum number of items you want to return in the API \
         response.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec uploads = upload list [@@ocaml.doc ""]

type nonrec list_uploads_result = {
  uploads : uploads option; [@ocaml.doc "Information about the uploads.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list uploads request.\n"]

type nonrec list_uploads_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project for which you want to list uploads.\n"]
  type_ : upload_type option;
      [@ocaml.doc
        "The type of upload.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  ANDROID_APP\n\
        \            \n\
        \             }\n\
        \        {-  IOS_APP\n\
        \            \n\
        \             }\n\
        \        {-  WEB_APP\n\
        \            \n\
        \             }\n\
        \        {-  EXTERNAL_DATA\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI_TEST_PACKAGE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-   APPIUM_RUBY_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI_TEST_SPEC\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list uploads operation.\n"]

type nonrec problem_detail = {
  arn : amazon_resource_name option; [@ocaml.doc "The problem detail's ARN.\n"]
  name : name option; [@ocaml.doc "The problem detail's name.\n"]
}
[@@ocaml.doc "Information about a problem detail.\n"]

type nonrec problem = {
  run : problem_detail option; [@ocaml.doc "Information about the associated run.\n"]
  job : problem_detail option; [@ocaml.doc "Information about the associated job.\n"]
  suite : problem_detail option; [@ocaml.doc "Information about the associated suite.\n"]
  test : problem_detail option; [@ocaml.doc "Information about the associated test.\n"]
  device : device option; [@ocaml.doc "Information about the associated device.\n"]
  result_ : execution_result option;
      [@ocaml.doc
        "The problem's result.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PASSED\n\
        \            \n\
        \             }\n\
        \        {-  WARNED\n\
        \            \n\
        \             }\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        {-  SKIPPED\n\
        \            \n\
        \             }\n\
        \        {-  ERRORED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  message : message option; [@ocaml.doc "A message about the problem's result.\n"]
}
[@@ocaml.doc "Represents a specific warning or failure.\n"]

type nonrec problems = problem list [@@ocaml.doc ""]

type nonrec unique_problem = {
  message : message option; [@ocaml.doc "A message about the unique problems' result.\n"]
  problems : problems option; [@ocaml.doc "Information about the problems.\n"]
}
[@@ocaml.doc "A collection of one or more problems, grouped by their result.\n"]

type nonrec unique_problems = unique_problem list [@@ocaml.doc ""]

type nonrec unique_problems_by_execution_result_map = (execution_result * unique_problems) list
[@@ocaml.doc ""]

type nonrec list_unique_problems_result = {
  unique_problems : unique_problems_by_execution_result_map option;
      [@ocaml.doc
        "Information about the unique problems.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PASSED\n\
        \            \n\
        \             }\n\
        \        {-  WARNED\n\
        \            \n\
        \             }\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        {-  SKIPPED\n\
        \            \n\
        \             }\n\
        \        {-  ERRORED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list unique problems request.\n"]

type nonrec list_unique_problems_request = {
  arn : amazon_resource_name; [@ocaml.doc "The unique problems' ARNs.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list unique problems operation.\n"]

type nonrec test = {
  arn : amazon_resource_name option; [@ocaml.doc "The test's ARN.\n"]
  name : name option; [@ocaml.doc "The test's name.\n"]
  type_ : test_type option;
      [@ocaml.doc
        "The test's type.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  BUILTIN_FUZZ\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  created : date_time option; [@ocaml.doc "When the test was created.\n"]
  status : execution_status option;
      [@ocaml.doc
        "The test's status.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_CONCURRENCY\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_DEVICE\n\
        \            \n\
        \             }\n\
        \        {-  PROCESSING\n\
        \            \n\
        \             }\n\
        \        {-  SCHEDULING\n\
        \            \n\
        \             }\n\
        \        {-  PREPARING\n\
        \            \n\
        \             }\n\
        \        {-  RUNNING\n\
        \            \n\
        \             }\n\
        \        {-  COMPLETED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPING\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  result_ : execution_result option;
      [@ocaml.doc
        "The test's result.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PASSED\n\
        \            \n\
        \             }\n\
        \        {-  WARNED\n\
        \            \n\
        \             }\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        {-  SKIPPED\n\
        \            \n\
        \             }\n\
        \        {-  ERRORED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  started : date_time option; [@ocaml.doc "The test's start time.\n"]
  stopped : date_time option; [@ocaml.doc "The test's stop time.\n"]
  counters : counters option; [@ocaml.doc "The test's result counters.\n"]
  message : message option; [@ocaml.doc "A message about the test's result.\n"]
  device_minutes : device_minutes option;
      [@ocaml.doc "Represents the total (metered or unmetered) minutes used by the test.\n"]
}
[@@ocaml.doc "Represents a condition that is evaluated.\n"]

type nonrec tests = test list [@@ocaml.doc ""]

type nonrec list_tests_result = {
  tests : tests option; [@ocaml.doc "Information about the tests.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list tests request.\n"]

type nonrec list_tests_request = {
  arn : amazon_resource_name; [@ocaml.doc "The test suite's Amazon Resource Name (ARN).\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list tests operation.\n"]

type nonrec test_grid_session_status =
  | ACTIVE [@ocaml.doc ""]
  | CLOSED [@ocaml.doc ""]
  | ERRORED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec test_grid_session = {
  arn : device_farm_arn option; [@ocaml.doc "The ARN of the session.\n"]
  status : test_grid_session_status option; [@ocaml.doc "The state of the session.\n"]
  created : date_time option; [@ocaml.doc "The time that the session was started.\n"]
  ended : date_time option; [@ocaml.doc "The time the session ended.\n"]
  billing_minutes : double option;
      [@ocaml.doc "The number of billed minutes that were used for this session. \n"]
  selenium_properties : string_ option;
      [@ocaml.doc "A JSON object of options and parameters passed to the Selenium WebDriver.\n"]
}
[@@ocaml.doc
  "A [TestGridSession] is a single instance of a browser launched from the URL provided by a call \
   to [CreateTestGridUrl].\n"]

type nonrec test_grid_sessions = test_grid_session list [@@ocaml.doc ""]

type nonrec list_test_grid_sessions_result = {
  test_grid_sessions : test_grid_sessions option;
      [@ocaml.doc "The sessions that match the criteria in a [ListTestGridSessionsRequest]. \n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token.\n"]
}
[@@ocaml.doc ""]

type nonrec max_page_size = int [@@ocaml.doc ""]

type nonrec list_test_grid_sessions_request = {
  project_arn : device_farm_arn; [@ocaml.doc "ARN of a [TestGridProject].\n"]
  status : test_grid_session_status option; [@ocaml.doc "Return only sessions in this state.\n"]
  creation_time_after : date_time option;
      [@ocaml.doc "Return only sessions created after this time.\n"]
  creation_time_before : date_time option;
      [@ocaml.doc "Return only sessions created before this time.\n"]
  end_time_after : date_time option;
      [@ocaml.doc "Return only sessions that ended after this time.\n"]
  end_time_before : date_time option;
      [@ocaml.doc "Return only sessions that ended before this time.\n"]
  max_result : max_page_size option; [@ocaml.doc "Return only this many results at a time.\n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token.\n"]
}
[@@ocaml.doc ""]

type nonrec test_grid_session_artifact_type =
  | UNKNOWN [@ocaml.doc ""]
  | VIDEO [@ocaml.doc ""]
  | SELENIUM_LOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec test_grid_session_artifact = {
  filename : string_ option; [@ocaml.doc "The file name of the artifact.\n"]
  type_ : test_grid_session_artifact_type option; [@ocaml.doc "The kind of artifact.\n"]
  url : sensitive_string option; [@ocaml.doc "A semi-stable URL to the content of the object.\n"]
}
[@@ocaml.doc
  "Artifacts are video and other files that are produced in the process of running a browser in an \
   automated context. \n\n\
  \  Video elements might be broken up into multiple artifacts as they grow in size during \
   creation. \n\
  \  \n\
  \   "]

type nonrec test_grid_session_artifacts = test_grid_session_artifact list [@@ocaml.doc ""]

type nonrec list_test_grid_session_artifacts_result = {
  artifacts : test_grid_session_artifacts option;
      [@ocaml.doc "A list of test grid session artifacts for a [TestGridSession].\n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token.\n"]
}
[@@ocaml.doc ""]

type nonrec test_grid_session_artifact_category = VIDEO [@ocaml.doc ""] | LOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_test_grid_session_artifacts_request = {
  session_arn : device_farm_arn; [@ocaml.doc "The ARN of a [TestGridSession]. \n"]
  type_ : test_grid_session_artifact_category option;
      [@ocaml.doc "Limit results to a specified type of artifact.\n"]
  max_result : max_page_size option;
      [@ocaml.doc "The maximum number of results to be returned by a request.\n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token.\n"]
}
[@@ocaml.doc ""]

type nonrec test_grid_session_action = {
  action : string_ option; [@ocaml.doc "The action taken by the session.\n"]
  started : date_time option; [@ocaml.doc "The time that the session invoked the action.\n"]
  duration : long option;
      [@ocaml.doc "The time, in milliseconds, that the action took to complete in the browser.\n"]
  status_code : string_ option;
      [@ocaml.doc "HTTP status code returned to the browser when the action was taken.\n"]
  request_method : string_ option;
      [@ocaml.doc "HTTP method that the browser used to make the request.\n"]
}
[@@ocaml.doc "An action taken by a [TestGridSession] browser instance.\n"]

type nonrec test_grid_session_actions = test_grid_session_action list [@@ocaml.doc ""]

type nonrec list_test_grid_session_actions_result = {
  actions : test_grid_session_actions option; [@ocaml.doc "The action taken by the session.\n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token.\n"]
}
[@@ocaml.doc ""]

type nonrec list_test_grid_session_actions_request = {
  session_arn : device_farm_arn; [@ocaml.doc "The ARN of the session to retrieve.\n"]
  max_result : max_page_size option;
      [@ocaml.doc "The maximum number of sessions to return per response.\n"]
  next_token : pagination_token option; [@ocaml.doc "Pagination token.\n"]
}
[@@ocaml.doc ""]

type nonrec test_grid_projects = test_grid_project list [@@ocaml.doc ""]

type nonrec list_test_grid_projects_result = {
  test_grid_projects : test_grid_projects option;
      [@ocaml.doc "The list of TestGridProjects, based on a [ListTestGridProjectsRequest].\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "Used for pagination. Pass into [ListTestGridProjects] to get more results in a paginated \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_test_grid_projects_request = {
  max_result : max_page_size option; [@ocaml.doc "Return no more than this number of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "From a response, used to continue a paginated listing. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc
        "The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have \
         a maximum character length of 128 characters. Tag values can have a maximum length of 256 \
         characters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : device_farm_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource or resources for which to list tags. You \
         can associate tags with the following Device Farm resources: [PROJECT], \
         [TESTGRID_PROJECT], [RUN], [NETWORK_PROFILE], [INSTANCE_PROFILE], [DEVICE_INSTANCE], \
         [SESSION], [DEVICE_POOL], [DEVICE], and [VPCE_CONFIGURATION].\n"]
}
[@@ocaml.doc ""]

type nonrec suite = {
  arn : amazon_resource_name option; [@ocaml.doc "The suite's ARN.\n"]
  name : name option; [@ocaml.doc "The suite's name.\n"]
  type_ : test_type option;
      [@ocaml.doc
        "The suite's type.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  BUILTIN_FUZZ\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  created : date_time option; [@ocaml.doc "When the suite was created.\n"]
  status : execution_status option;
      [@ocaml.doc
        "The suite's status.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_CONCURRENCY\n\
        \            \n\
        \             }\n\
        \        {-  PENDING_DEVICE\n\
        \            \n\
        \             }\n\
        \        {-  PROCESSING\n\
        \            \n\
        \             }\n\
        \        {-  SCHEDULING\n\
        \            \n\
        \             }\n\
        \        {-  PREPARING\n\
        \            \n\
        \             }\n\
        \        {-  RUNNING\n\
        \            \n\
        \             }\n\
        \        {-  COMPLETED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPING\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  result_ : execution_result option;
      [@ocaml.doc
        "The suite's result.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  PENDING\n\
        \            \n\
        \             }\n\
        \        {-  PASSED\n\
        \            \n\
        \             }\n\
        \        {-  WARNED\n\
        \            \n\
        \             }\n\
        \        {-  FAILED\n\
        \            \n\
        \             }\n\
        \        {-  SKIPPED\n\
        \            \n\
        \             }\n\
        \        {-  ERRORED\n\
        \            \n\
        \             }\n\
        \        {-  STOPPED\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  started : date_time option; [@ocaml.doc "The suite's start time.\n"]
  stopped : date_time option; [@ocaml.doc "The suite's stop time.\n"]
  counters : counters option; [@ocaml.doc "The suite's result counters.\n"]
  message : message option; [@ocaml.doc "A message about the suite's result.\n"]
  device_minutes : device_minutes option;
      [@ocaml.doc "Represents the total (metered or unmetered) minutes used by the test suite.\n"]
}
[@@ocaml.doc "Represents a collection of one or more tests.\n"]

type nonrec suites = suite list [@@ocaml.doc ""]

type nonrec list_suites_result = {
  suites : suites option; [@ocaml.doc "Information about the suites.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list suites request.\n"]

type nonrec list_suites_request = {
  arn : amazon_resource_name; [@ocaml.doc "The job's Amazon Resource Name (ARN).\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list suites operation.\n"]

type nonrec sample_type =
  | CPU [@ocaml.doc ""]
  | MEMORY [@ocaml.doc ""]
  | THREADS [@ocaml.doc ""]
  | RX_RATE [@ocaml.doc ""]
  | TX_RATE [@ocaml.doc ""]
  | RX [@ocaml.doc ""]
  | TX [@ocaml.doc ""]
  | NATIVE_FRAMES [@ocaml.doc ""]
  | NATIVE_FPS [@ocaml.doc ""]
  | NATIVE_MIN_DRAWTIME [@ocaml.doc ""]
  | NATIVE_AVG_DRAWTIME [@ocaml.doc ""]
  | NATIVE_MAX_DRAWTIME [@ocaml.doc ""]
  | OPENGL_FRAMES [@ocaml.doc ""]
  | OPENGL_FPS [@ocaml.doc ""]
  | OPENGL_MIN_DRAWTIME [@ocaml.doc ""]
  | OPENGL_AVG_DRAWTIME [@ocaml.doc ""]
  | OPENGL_MAX_DRAWTIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sample = {
  arn : amazon_resource_name option; [@ocaml.doc "The sample's ARN.\n"]
  type_ : sample_type option;
      [@ocaml.doc
        "The sample's type.\n\n\
        \ Must be one of the following values:\n\
        \ \n\
        \  {ul\n\
        \        {-  CPU: A CPU sample type. This is expressed as the app processing CPU time \
         (including child processes) as reported by process, as a percentage.\n\
        \            \n\
        \             }\n\
        \        {-  MEMORY: A memory usage sample type. This is expressed as the total \
         proportional set size of an app process, in kilobytes.\n\
        \            \n\
        \             }\n\
        \        {-  NATIVE_AVG_DRAWTIME\n\
        \            \n\
        \             }\n\
        \        {-  NATIVE_FPS\n\
        \            \n\
        \             }\n\
        \        {-  NATIVE_FRAMES\n\
        \            \n\
        \             }\n\
        \        {-  NATIVE_MAX_DRAWTIME\n\
        \            \n\
        \             }\n\
        \        {-  NATIVE_MIN_DRAWTIME\n\
        \            \n\
        \             }\n\
        \        {-  OPENGL_AVG_DRAWTIME\n\
        \            \n\
        \             }\n\
        \        {-  OPENGL_FPS\n\
        \            \n\
        \             }\n\
        \        {-  OPENGL_FRAMES\n\
        \            \n\
        \             }\n\
        \        {-  OPENGL_MAX_DRAWTIME\n\
        \            \n\
        \             }\n\
        \        {-  OPENGL_MIN_DRAWTIME\n\
        \            \n\
        \             }\n\
        \        {-  RX\n\
        \            \n\
        \             }\n\
        \        {-  RX_RATE: The total number of bytes per second (TCP and UDP) that are sent, by \
         app process.\n\
        \            \n\
        \             }\n\
        \        {-  THREADS: A threads sample type. This is expressed as the total number of \
         threads per app process.\n\
        \            \n\
        \             }\n\
        \        {-  TX\n\
        \            \n\
        \             }\n\
        \        {-  TX_RATE: The total number of bytes per second (TCP and UDP) that are \
         received, by app process.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  url : ur_l option;
      [@ocaml.doc
        "The presigned Amazon S3 URL that can be used with a GET request to download the sample's \
         file.\n"]
}
[@@ocaml.doc "Represents a sample of performance data.\n"]

type nonrec samples = sample list [@@ocaml.doc ""]

type nonrec list_samples_result = {
  samples : samples option; [@ocaml.doc "Information about the samples.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list samples request.\n"]

type nonrec list_samples_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the job used to list samples.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list samples operation.\n"]

type nonrec runs = run list [@@ocaml.doc ""]

type nonrec list_runs_result = {
  runs : runs option; [@ocaml.doc "Information about the runs.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list runs request.\n"]

type nonrec list_runs_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project for which you want to list runs.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list runs operation.\n"]

type nonrec remote_access_sessions = remote_access_session list [@@ocaml.doc ""]

type nonrec list_remote_access_sessions_result = {
  remote_access_sessions : remote_access_sessions option;
      [@ocaml.doc
        "A container that represents the metadata from the service about each remote access \
         session you are requesting.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc
  "Represents the response from the server after AWS Device Farm makes a request to return \
   information about the remote access session.\n"]

type nonrec list_remote_access_sessions_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project about which you are requesting information.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the request to return information about the remote access session.\n"]

type nonrec projects = project list [@@ocaml.doc ""]

type nonrec list_projects_result = {
  projects : projects option; [@ocaml.doc "Information about the projects.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list projects request.\n"]

type nonrec list_projects_request = {
  arn : amazon_resource_name option;
      [@ocaml.doc
        "Optional. If no Amazon Resource Name (ARN) is specified, then AWS Device Farm returns a \
         list of all projects for the AWS account. You can also specify a project ARN.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list projects operation.\n"]

type nonrec offering_transactions = offering_transaction list [@@ocaml.doc ""]

type nonrec list_offering_transactions_result = {
  offering_transactions : offering_transactions option;
      [@ocaml.doc
        "The audit log of subscriptions you have purchased and modified through AWS Device Farm.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Returns the transaction log of the specified offerings.\n"]

type nonrec list_offering_transactions_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the request to list the offering transaction history.\n"]

type nonrec offerings = offering list [@@ocaml.doc ""]

type nonrec list_offerings_result = {
  offerings : offerings option; [@ocaml.doc "A value that represents the list offering results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the return values of the list of offerings.\n"]

type nonrec list_offerings_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the request to list all offerings.\n"]

type nonrec offering_promotion = {
  id : offering_promotion_identifier option; [@ocaml.doc "The ID of the offering promotion.\n"]
  description : message option; [@ocaml.doc "A string that describes the offering promotion.\n"]
}
[@@ocaml.doc "Represents information about an offering promotion.\n"]

type nonrec offering_promotions = offering_promotion list [@@ocaml.doc ""]

type nonrec list_offering_promotions_result = {
  offering_promotions : offering_promotions option;
      [@ocaml.doc "Information about the offering promotions.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier to be used in the next call to this operation, to return the next set of \
         items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_offering_promotions_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec network_profiles = network_profile list [@@ocaml.doc ""]

type nonrec list_network_profiles_result = {
  network_profiles : network_profiles option;
      [@ocaml.doc "A list of the available network profiles.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_network_profiles_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the project for which you want to list network profiles.\n"]
  type_ : network_profile_type option;
      [@ocaml.doc
        "The type of network profile to return information about. Valid values are listed here.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec jobs = job list [@@ocaml.doc ""]

type nonrec list_jobs_result = {
  jobs : jobs option; [@ocaml.doc "Information about the jobs.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list jobs request.\n"]

type nonrec list_jobs_request = {
  arn : amazon_resource_name; [@ocaml.doc "The run's Amazon Resource Name (ARN).\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list jobs operation.\n"]

type nonrec instance_profiles = instance_profile list [@@ocaml.doc ""]

type nonrec list_instance_profiles_result = {
  instance_profiles : instance_profiles option;
      [@ocaml.doc "An object that contains information about your instance profiles.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that can be used in the next call to this operation to return the next set \
         of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_instance_profiles_request = {
  max_results : integer option;
      [@ocaml.doc
        "An integer that specifies the maximum number of items you want to return in the API \
         response.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec devices = device list [@@ocaml.doc ""]

type nonrec list_devices_result = {
  devices : devices option; [@ocaml.doc "Information about the devices.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list devices operation.\n"]

type nonrec list_devices_request = {
  arn : amazon_resource_name option; [@ocaml.doc "The Amazon Resource Name (ARN) of the project.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
  filters : device_filters option;
      [@ocaml.doc
        "Used to select a set of devices. A filter is made up of an attribute, an operator, and \
         one or more values.\n\n\
        \ {ul\n\
        \       {-  Attribute: The aspect of a device such as platform or model used as the \
         selection criteria in a device filter.\n\
        \           \n\
        \            Allowed values include:\n\
        \            \n\
        \             {ul\n\
        \                   {-  ARN: The Amazon Resource Name (ARN) of the device (for example, \
         [arn:aws:devicefarm:us-west-2::device:12345Example]).\n\
        \                       \n\
        \                        }\n\
        \                   {-  PLATFORM: The device platform. Valid values are ANDROID or IOS.\n\
        \                       \n\
        \                        }\n\
        \                   {-  OS_VERSION: The operating system version (for example, 10.3.2).\n\
        \                       \n\
        \                        }\n\
        \                   {-  MODEL: The device model (for example, iPad 5th Gen).\n\
        \                       \n\
        \                        }\n\
        \                   {-  AVAILABILITY: The current availability of the device. Valid values \
         are AVAILABLE, HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.\n\
        \                       \n\
        \                        }\n\
        \                   {-  FORM_FACTOR: The device form factor. Valid values are PHONE or \
         TABLET.\n\
        \                       \n\
        \                        }\n\
        \                   {-  MANUFACTURER: The device manufacturer (for example, Apple).\n\
        \                       \n\
        \                        }\n\
        \                   {-  REMOTE_ACCESS_ENABLED: Whether the device is enabled for remote \
         access. Valid values are TRUE or FALSE.\n\
        \                       \n\
        \                        }\n\
        \                   {-  REMOTE_DEBUG_ENABLED: Whether the device is enabled for remote \
         debugging. Valid values are TRUE or FALSE. Because remote debugging is \
         {{:https://docs.aws.amazon.com/devicefarm/latest/developerguide/history.html}no longer \
         supported}, this attribute is ignored.\n\
        \                       \n\
        \                        }\n\
        \                   {-  INSTANCE_ARN: The Amazon Resource Name (ARN) of the device instance.\n\
        \                       \n\
        \                        }\n\
        \                   {-  INSTANCE_LABELS: The label of the device instance.\n\
        \                       \n\
        \                        }\n\
        \                   {-  FLEET_TYPE: The fleet type. Valid values are PUBLIC or PRIVATE.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \        }\n\
        \         }\n\
        \       {-  Operator: The filter operator.\n\
        \           \n\
        \            {ul\n\
        \                  {-  The EQUALS operator is available for every attribute except \
         INSTANCE_LABELS.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The CONTAINS operator is available for the INSTANCE_LABELS and \
         MODEL attributes.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The IN and NOT_IN operators are available for the ARN, OS_VERSION, \
         MODEL, MANUFACTURER, and INSTANCE_ARN attributes.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The LESS_THAN, GREATER_THAN, LESS_THAN_OR_EQUALS, and \
         GREATER_THAN_OR_EQUALS operators are also available for the OS_VERSION attribute.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-  Values: An array of one or more filter values.\n\
        \           \n\
        \            {ul\n\
        \                  {-  The IN and NOT_IN operators take a values array that has one or \
         more elements.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The other operators require an array with a single element.\n\
        \                      \n\
        \                       }\n\
        \                  {-  In a request, the AVAILABILITY attribute takes the following \
         values: AVAILABLE, HIGHLY_AVAILABLE, BUSY, or TEMPORARY_NOT_AVAILABLE.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Represents the result of a list devices request.\n"]

type nonrec device_pools = device_pool list [@@ocaml.doc ""]

type nonrec list_device_pools_result = {
  device_pools : device_pools option; [@ocaml.doc "Information about the device pools.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list device pools request.\n"]

type nonrec list_device_pools_request = {
  arn : amazon_resource_name; [@ocaml.doc "The project ARN.\n"]
  type_ : device_pool_type option;
      [@ocaml.doc
        "The device pools' type.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  CURATED: A device pool that is created and managed by AWS Device Farm.\n\
        \            \n\
        \             }\n\
        \        {-  PRIVATE: A device pool that is created and managed by the device pool \
         developer.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list device pools request.\n"]

type nonrec list_device_instances_result = {
  device_instances : device_instances option;
      [@ocaml.doc "An object that contains information about your device instances.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that can be used in the next call to this operation to return the next set \
         of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_device_instances_request = {
  max_results : integer option;
      [@ocaml.doc
        "An integer that specifies the maximum number of items you want to return in the API \
         response.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_artifacts_result = {
  artifacts : artifacts option; [@ocaml.doc "Information about the artifacts.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "If the number of items that are returned is significantly large, this is an identifier \
         that is also returned. It can be used in a subsequent call to this operation to return \
         the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents the result of a list artifacts operation.\n"]

type nonrec list_artifacts_request = {
  arn : amazon_resource_name; [@ocaml.doc "The run, job, suite, or test ARN.\n"]
  type_ : artifact_category;
      [@ocaml.doc
        "The artifacts' type.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  FILE\n\
        \            \n\
        \             }\n\
        \        {-  LOG\n\
        \            \n\
        \             }\n\
        \        {-  SCREENSHOT\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Represents a request to the list artifacts operation.\n"]

type nonrec install_to_remote_access_session_result = {
  app_upload : upload option; [@ocaml.doc "An app to upload or that has been uploaded.\n"]
}
[@@ocaml.doc
  "Represents the response from the server after AWS Device Farm makes a request to install to a \
   remote access session.\n"]

type nonrec install_to_remote_access_session_request = {
  remote_access_session_arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the remote access session about which you are \
         requesting information.\n"]
  app_arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the app about which you are requesting information.\n"]
}
[@@ocaml.doc
  "Represents the request to install an Android application (in .apk format) or an iOS application \
   (in .ipa format) as part of a remote access session.\n"]

type nonrec get_vpce_configuration_result = {
  vpce_configuration : vpce_configuration option;
      [@ocaml.doc "An object that contains information about your VPC endpoint configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_vpce_configuration_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the VPC endpoint configuration you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec get_upload_result = {
  upload : upload option;
      [@ocaml.doc "An app or a set of one or more tests to upload or that have been uploaded.\n"]
}
[@@ocaml.doc "Represents the result of a get upload request.\n"]

type nonrec get_upload_request = { arn : amazon_resource_name [@ocaml.doc "The upload's ARN.\n"] }
[@@ocaml.doc "Represents a request to the get upload operation.\n"]

type nonrec get_test_grid_session_result = {
  test_grid_session : test_grid_session option;
      [@ocaml.doc "The [TestGridSession] that was requested.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec get_test_grid_session_request = {
  project_arn : device_farm_arn option;
      [@ocaml.doc
        "The ARN for the project that this session belongs to. See [CreateTestGridProject] and \
         [ListTestGridProjects].\n"]
  session_id : resource_id option; [@ocaml.doc "An ID associated with this session.\n"]
  session_arn : device_farm_arn option;
      [@ocaml.doc "An ARN that uniquely identifies a [TestGridSession].\n"]
}
[@@ocaml.doc ""]

type nonrec get_test_grid_project_result = {
  test_grid_project : test_grid_project option; [@ocaml.doc "A [TestGridProject].\n"]
}
[@@ocaml.doc ""]

type nonrec get_test_grid_project_request = {
  project_arn : device_farm_arn;
      [@ocaml.doc
        "The ARN of the Selenium testing project, from either [CreateTestGridProject] or \
         [ListTestGridProjects].\n"]
}
[@@ocaml.doc ""]

type nonrec get_test_result = {
  test : test option; [@ocaml.doc "A test condition that is evaluated.\n"]
}
[@@ocaml.doc "Represents the result of a get test request.\n"]

type nonrec get_test_request = { arn : amazon_resource_name [@ocaml.doc "The test's ARN.\n"] }
[@@ocaml.doc "Represents a request to the get test operation.\n"]

type nonrec get_suite_result = {
  suite : suite option; [@ocaml.doc "A collection of one or more tests.\n"]
}
[@@ocaml.doc "Represents the result of a get suite request.\n"]

type nonrec get_suite_request = { arn : amazon_resource_name [@ocaml.doc "The suite's ARN.\n"] }
[@@ocaml.doc "Represents a request to the get suite operation.\n"]

type nonrec get_run_result = { run : run option [@ocaml.doc "The run to get results from.\n"] }
[@@ocaml.doc "Represents the result of a get run request.\n"]

type nonrec get_run_request = { arn : amazon_resource_name [@ocaml.doc "The run's ARN.\n"] }
[@@ocaml.doc "Represents a request to the get run operation.\n"]

type nonrec get_remote_access_session_result = {
  remote_access_session : remote_access_session option;
      [@ocaml.doc "A container that lists detailed information about the remote access session.\n"]
}
[@@ocaml.doc
  "Represents the response from the server that lists detailed information about the remote access \
   session.\n"]

type nonrec get_remote_access_session_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the remote access session about which you want to get \
         session information.\n"]
}
[@@ocaml.doc
  "Represents the request to get information about the specified remote access session.\n"]

type nonrec get_project_result = {
  project : project option; [@ocaml.doc "The project to get information about.\n"]
}
[@@ocaml.doc "Represents the result of a get project request.\n"]

type nonrec get_project_request = { arn : amazon_resource_name [@ocaml.doc "The project's ARN.\n"] }
[@@ocaml.doc "Represents a request to the get project operation.\n"]

type nonrec offering_status_map = (offering_identifier * offering_status) list [@@ocaml.doc ""]

type nonrec get_offering_status_result = {
  current : offering_status_map option;
      [@ocaml.doc "When specified, gets the offering status for the current period.\n"]
  next_period : offering_status_map option;
      [@ocaml.doc "When specified, gets the offering status for the next period.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc "Returns the status result for a device offering.\n"]

type nonrec get_offering_status_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "An identifier that was returned from the previous call to this operation, which can be \
         used to return the next set of items in the list.\n"]
}
[@@ocaml.doc
  "Represents the request to retrieve the offering status for the specified customer or account.\n"]

type nonrec get_network_profile_result = {
  network_profile : network_profile option; [@ocaml.doc "The network profile.\n"]
}
[@@ocaml.doc ""]

type nonrec get_network_profile_request = {
  arn : amazon_resource_name;
      [@ocaml.doc "The ARN of the network profile to return information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_job_result = {
  job : job option; [@ocaml.doc "An object that contains information about the requested job.\n"]
}
[@@ocaml.doc "Represents the result of a get job request.\n"]

type nonrec get_job_request = { arn : amazon_resource_name [@ocaml.doc "The job's ARN.\n"] }
[@@ocaml.doc "Represents a request to the get job operation.\n"]

type nonrec get_instance_profile_result = {
  instance_profile : instance_profile option;
      [@ocaml.doc "An object that contains information about an instance profile.\n"]
}
[@@ocaml.doc ""]

type nonrec get_instance_profile_request = {
  arn : amazon_resource_name; [@ocaml.doc "The Amazon Resource Name (ARN) of an instance profile.\n"]
}
[@@ocaml.doc ""]

type nonrec incompatibility_message = {
  message : message option; [@ocaml.doc "A message about the incompatibility.\n"]
  type_ : device_attribute option;
      [@ocaml.doc
        "The type of incompatibility.\n\n\
        \ Allowed values include:\n\
        \ \n\
        \  {ul\n\
        \        {-  ARN\n\
        \            \n\
        \             }\n\
        \        {-  FORM_FACTOR (for example, phone or tablet)\n\
        \            \n\
        \             }\n\
        \        {-  MANUFACTURER\n\
        \            \n\
        \             }\n\
        \        {-  PLATFORM (for example, Android or iOS)\n\
        \            \n\
        \             }\n\
        \        {-  REMOTE_ACCESS_ENABLED\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_VERSION\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Represents information about incompatibility.\n"]

type nonrec incompatibility_messages = incompatibility_message list [@@ocaml.doc ""]

type nonrec device_pool_compatibility_result = {
  device : device option; [@ocaml.doc "The device (phone or tablet) to return information about.\n"]
  compatible : boolean_ option;
      [@ocaml.doc "Whether the result was compatible with the device pool.\n"]
  incompatibility_messages : incompatibility_messages option;
      [@ocaml.doc "Information about the compatibility.\n"]
}
[@@ocaml.doc "Represents a device pool compatibility result.\n"]

type nonrec device_pool_compatibility_results = device_pool_compatibility_result list
[@@ocaml.doc ""]

type nonrec get_device_pool_compatibility_result = {
  compatible_devices : device_pool_compatibility_results option;
      [@ocaml.doc "Information about compatible devices.\n"]
  incompatible_devices : device_pool_compatibility_results option;
      [@ocaml.doc "Information about incompatible devices.\n"]
}
[@@ocaml.doc "Represents the result of describe device pool compatibility request.\n"]

type nonrec get_device_pool_compatibility_request = {
  device_pool_arn : amazon_resource_name; [@ocaml.doc "The device pool's ARN.\n"]
  app_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the app that is associated with the specified device pool.\n"]
  test_type : test_type option;
      [@ocaml.doc
        "The test type for the specified device pool.\n\n\
        \ Allowed values include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  BUILTIN_FUZZ.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_JUNIT.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_JAVA_TESTNG.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_PYTHON.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_NODE.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_RUBY.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_JUNIT.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_JAVA_TESTNG.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_PYTHON.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_NODE.\n\
        \            \n\
        \             }\n\
        \        {-  APPIUM_WEB_RUBY.\n\
        \            \n\
        \             }\n\
        \        {-  INSTRUMENTATION.\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST.\n\
        \            \n\
        \             }\n\
        \        {-  XCTEST_UI.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  test : schedule_run_test option;
      [@ocaml.doc "Information about the uploaded test to be run against the device pool.\n"]
  configuration : schedule_run_configuration option;
      [@ocaml.doc "An object that contains information about the settings for a run.\n"]
  project_arn : amazon_resource_name option;
      [@ocaml.doc "The ARN of the project for which you want to check device pool compatibility.\n"]
}
[@@ocaml.doc "Represents a request to the get device pool compatibility operation.\n"]

type nonrec get_device_pool_result = {
  device_pool : device_pool option;
      [@ocaml.doc "An object that contains information about the requested device pool.\n"]
}
[@@ocaml.doc "Represents the result of a get device pool request.\n"]

type nonrec get_device_pool_request = {
  arn : amazon_resource_name; [@ocaml.doc "The device pool's ARN.\n"]
}
[@@ocaml.doc "Represents a request to the get device pool operation.\n"]

type nonrec get_device_instance_result = {
  device_instance : device_instance option;
      [@ocaml.doc "An object that contains information about your device instance.\n"]
}
[@@ocaml.doc ""]

type nonrec get_device_instance_request = {
  arn : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the instance you're requesting information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_device_result = {
  device : device option;
      [@ocaml.doc "An object that contains information about the requested device.\n"]
}
[@@ocaml.doc "Represents the result of a get device request.\n"]

type nonrec get_device_request = {
  arn : amazon_resource_name; [@ocaml.doc "The device type's ARN.\n"]
}
[@@ocaml.doc "Represents a request to the get device request.\n"]

type nonrec get_account_settings_result = {
  account_settings : account_settings option; [@ocaml.doc "The account settings.\n"]
}
[@@ocaml.doc
  "Represents the account settings return values from the [GetAccountSettings] request.\n"]

type nonrec get_account_settings_request = unit [@@ocaml.doc ""]
