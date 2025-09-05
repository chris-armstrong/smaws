(** 
    SSM client library built on EIO.
    
*)

(** {1:types Types} *)

type nonrec version = string[@@ocaml.doc ""]
type nonrec string_ = string[@@ocaml.doc ""]
type nonrec validation_exception =
  {
  reason_code: string_ option
    [@ocaml.doc "The reason code for the invalid request.\n"];
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The request isn't valid. Verify that you entered valid contents for the command and try again.\n"]
type nonrec valid_next_step = string[@@ocaml.doc ""]
type nonrec valid_next_step_list = valid_next_step list[@@ocaml.doc ""]
type nonrec url = string[@@ocaml.doc ""]
type nonrec update_service_setting_result = unit[@@ocaml.doc ""]
type nonrec service_setting_id = string[@@ocaml.doc ""]
type nonrec service_setting_value = string[@@ocaml.doc ""]
type nonrec update_service_setting_request =
  {
  setting_value: service_setting_value
    [@ocaml.doc
      "The new value to specify for the service setting. The following list specifies the available values for each setting.\n\n {ul\n       {-  For [/ssm/appmanager/appmanager-enabled], enter [True] or [False].\n           \n            }\n       {-  For [/ssm/automation/customer-script-log-destination], enter [CloudWatch].\n           \n            }\n       {-  For [/ssm/automation/customer-script-log-group-name], enter the name of an Amazon CloudWatch Logs log group.\n           \n            }\n       {-  For [/ssm/documents/console/public-sharing-permission], enter [Enable] or [Disable].\n           \n            }\n       {-  For [/ssm/managed-instance/activation-tier], enter [standard] or [advanced].\n           \n            }\n       {-  For [/ssm/managed-instance/default-ec2-instance-management-role], enter the name of an IAM role. \n           \n            }\n       {-   For [/ssm/opsinsights/opscenter], enter [Enabled] or [Disabled]. \n           \n            }\n       {-  For [/ssm/parameter-store/default-parameter-tier], enter [Standard], [Advanced], or [Intelligent-Tiering] \n           \n            }\n       {-  For [/ssm/parameter-store/high-throughput-enabled], enter [true] or [false].\n           \n            }\n       }\n  "];
  setting_id: service_setting_id
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service setting to update. For example, [arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled]. The setting ID can be one of the following.\n\n {ul\n       {-   [/ssm/appmanager/appmanager-enabled] \n           \n            }\n       {-   [/ssm/automation/customer-script-log-destination] \n           \n            }\n       {-   [/ssm/automation/customer-script-log-group-name] \n           \n            }\n       {-  /ssm/automation/enable-adaptive-concurrency\n           \n            }\n       {-   [/ssm/documents/console/public-sharing-permission] \n           \n            }\n       {-   [/ssm/managed-instance/activation-tier] \n           \n            }\n       {-   [/ssm/managed-instance/default-ec2-instance-management-role] \n           \n            }\n       {-   [/ssm/opsinsights/opscenter] \n           \n            }\n       {-   [/ssm/parameter-store/default-parameter-tier] \n           \n            }\n       {-   [/ssm/parameter-store/high-throughput-enabled] \n           \n            }\n       }\n    Permissions to update the [/ssm/managed-instance/default-ec2-instance-management-role] setting should only be provided to administrators. Implement least privilege access when allowing individuals to configure or modify the Default Host Management Configuration.\n    \n     "]}
[@@ocaml.doc "The request body of the UpdateServiceSetting API operation.\n"]
type nonrec too_many_updates = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "There are concurrent updates for a resource that supports one update at a time.\n"]
type nonrec service_setting_not_found =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified service setting wasn't found. Either the service name or the setting hasn't been provisioned by the Amazon Web Services service team.\n"]
type nonrec internal_server_error = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "An error occurred on the server side.\n"]
type nonrec update_resource_data_sync_result = unit[@@ocaml.doc ""]
type nonrec resource_data_sync_name = string[@@ocaml.doc ""]
type nonrec resource_data_sync_type = string[@@ocaml.doc ""]
type nonrec resource_data_sync_source_type = string[@@ocaml.doc ""]
type nonrec resource_data_sync_organization_source_type = string[@@ocaml.doc
                                                                  ""]
type nonrec resource_data_sync_organizational_unit_id = string[@@ocaml.doc
                                                                ""]
type nonrec resource_data_sync_organizational_unit =
  {
  organizational_unit_id: resource_data_sync_organizational_unit_id option
    [@ocaml.doc "The Organizations unit ID data source for the sync.\n"]}
[@@ocaml.doc
  "The Organizations organizational unit data source for the sync.\n"]
type nonrec resource_data_sync_organizational_unit_list =
  resource_data_sync_organizational_unit list[@@ocaml.doc ""]
type nonrec resource_data_sync_aws_organizations_source =
  {
  organizational_units: resource_data_sync_organizational_unit_list option
    [@ocaml.doc
      "The Organizations organization units included in the sync.\n"];
  organization_source_type: resource_data_sync_organization_source_type
    [@ocaml.doc
      "If an Amazon Web Services organization is present, this is either [OrganizationalUnits] or [EntireOrganization]. For [OrganizationalUnits], the data is aggregated from a set of organization units. For [EntireOrganization], the data is aggregated from the entire Amazon Web Services organization.\n"]}
[@@ocaml.doc
  "Information about the [AwsOrganizationsSource] resource data sync source. A sync source of this type can synchronize data from Organizations or, if an Amazon Web Services organization isn't present, from multiple Amazon Web Services Regions.\n"]
type nonrec resource_data_sync_source_region = string[@@ocaml.doc ""]
type nonrec resource_data_sync_source_region_list =
  resource_data_sync_source_region list[@@ocaml.doc ""]
type nonrec resource_data_sync_include_future_regions = bool[@@ocaml.doc ""]
type nonrec resource_data_sync_enable_all_ops_data_sources = bool[@@ocaml.doc
                                                                   ""]
type nonrec resource_data_sync_source =
  {
  enable_all_ops_data_sources:
    resource_data_sync_enable_all_ops_data_sources option
    [@ocaml.doc
      "When you create a resource data sync, if you choose one of the Organizations options, then Systems Manager automatically enables all OpsData sources in the selected Amazon Web Services Regions for all Amazon Web Services accounts in your organization (or in the selected organization units). For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  include_future_regions: resource_data_sync_include_future_regions option
    [@ocaml.doc
      "Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions when those Regions come online.\n"];
  source_regions: resource_data_sync_source_region_list
    [@ocaml.doc
      "The [SyncSource] Amazon Web Services Regions included in the resource data sync.\n"];
  aws_organizations_source:
    resource_data_sync_aws_organizations_source option
    [@ocaml.doc
      "Information about the [AwsOrganizationsSource] resource data sync source. A sync source of this type can synchronize data from Organizations.\n"];
  source_type: resource_data_sync_source_type
    [@ocaml.doc
      "The type of data source for the resource data sync. [SourceType] is either [AwsOrganizations] (if an organization is present in Organizations) or [SingleAccountMultiRegions].\n"]}
[@@ocaml.doc
  "Information about the source of the data included in the resource data sync.\n"]
type nonrec update_resource_data_sync_request =
  {
  sync_source: resource_data_sync_source
    [@ocaml.doc
      "Specify information about the data sources to synchronize.\n"];
  sync_type: resource_data_sync_type
    [@ocaml.doc
      "The type of resource data sync. The supported [SyncType] is SyncFromSource.\n"];
  sync_name: resource_data_sync_name
    [@ocaml.doc "The name of the resource data sync you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec resource_data_sync_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""];
  sync_type: resource_data_sync_type option [@ocaml.doc ""];
  sync_name: resource_data_sync_name option [@ocaml.doc ""]}[@@ocaml.doc
                                                              "The specified sync name wasn't found.\n"]
type nonrec resource_data_sync_invalid_configuration_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified sync configuration is invalid.\n"]
type nonrec resource_data_sync_conflict_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Another [UpdateResourceDataSync] request is being processed. Wait a few minutes and try again.\n"]
type nonrec baseline_id = string[@@ocaml.doc ""]
type nonrec baseline_name = string[@@ocaml.doc ""]
type nonrec operating_system =
  | AmazonLinux2023 [@ocaml.doc ""]
  | AlmaLinux [@ocaml.doc ""]
  | Rocky_Linux [@ocaml.doc ""]
  | Raspbian [@ocaml.doc ""]
  | MacOS [@ocaml.doc ""]
  | Debian [@ocaml.doc ""]
  | OracleLinux [@ocaml.doc ""]
  | CentOS [@ocaml.doc ""]
  | Suse [@ocaml.doc ""]
  | RedhatEnterpriseLinux [@ocaml.doc ""]
  | Ubuntu [@ocaml.doc ""]
  | AmazonLinux2022 [@ocaml.doc ""]
  | AmazonLinux2 [@ocaml.doc ""]
  | AmazonLinux [@ocaml.doc ""]
  | Windows [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_filter_key =
  | Version [@ocaml.doc ""]
  | Security [@ocaml.doc ""]
  | Severity [@ocaml.doc ""]
  | Release [@ocaml.doc ""]
  | Repository [@ocaml.doc ""]
  | Priority [@ocaml.doc ""]
  | Section [@ocaml.doc ""]
  | PatchId [@ocaml.doc ""]
  | Name [@ocaml.doc ""]
  | MsrcSeverity [@ocaml.doc ""]
  | Epoch [@ocaml.doc ""]
  | CVEId [@ocaml.doc ""]
  | Classification [@ocaml.doc ""]
  | ProductFamily [@ocaml.doc ""]
  | Product [@ocaml.doc ""]
  | PatchSet [@ocaml.doc ""]
  | BugzillaId [@ocaml.doc ""]
  | AdvisoryId [@ocaml.doc ""]
  | Arch [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_filter_value = string[@@ocaml.doc ""]
type nonrec patch_filter_value_list = patch_filter_value list[@@ocaml.doc ""]
type nonrec patch_filter =
  {
  values: patch_filter_value_list
    [@ocaml.doc
      "The value for the filter key.\n\n Run the [DescribePatchProperties] command to view lists of valid values for each key based on operating system type.\n "];
  key: patch_filter_key
    [@ocaml.doc
      "The key for the filter.\n\n Run the [DescribePatchProperties] command to view lists of valid keys for each operating system type.\n "]}
[@@ocaml.doc
  " Defines which patches should be included in a patch baseline.\n\n A patch filter consists of a key and a set of values. The filter key is a patch property. For example, the available filter keys for [WINDOWS] are [PATCH_SET], [PRODUCT], [PRODUCT_FAMILY], [CLASSIFICATION], and [MSRC_SEVERITY].\n \n  The filter values define a matching criterion for the patch property indicated by the key. For example, if the filter key is [PRODUCT] and the filter values are [\\[\"Office\n    2013\", \"Office 2016\"\\]], then the filter accepts all patches where product name is either \"Office 2013\" or \"Office 2016\". The filter values can be exact values for the patch property given as a key, or a wildcard (*), which matches all values.\n  \n   You can view lists of valid values for the patch properties by running the [DescribePatchProperties] command. For information about which patch properties can be used with each major operating system, see [DescribePatchProperties].\n   "]
type nonrec patch_filter_list = patch_filter list[@@ocaml.doc ""]
type nonrec patch_filter_group =
  {
  patch_filters: patch_filter_list
    [@ocaml.doc "The set of patch filters that make up the group.\n"]}
[@@ocaml.doc "A set of patch filters, typically used for approval rules.\n"]
type nonrec patch_compliance_level =
  | Unspecified [@ocaml.doc ""]
  | Informational [@ocaml.doc ""]
  | Low [@ocaml.doc ""]
  | Medium [@ocaml.doc ""]
  | High [@ocaml.doc ""]
  | Critical [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec approve_after_days = int[@@ocaml.doc ""]
type nonrec patch_string_date_time = string[@@ocaml.doc ""]
type nonrec boolean_ = bool[@@ocaml.doc ""]
type nonrec patch_rule =
  {
  enable_non_security: boolean_ option
    [@ocaml.doc
      "For managed nodes identified by the approval rule filters, enables a patch baseline to apply non-security updates available in the specified repository. The default value is [false]. Applies to Linux managed nodes only.\n"];
  approve_until_date: patch_string_date_time option
    [@ocaml.doc
      "The cutoff date for auto approval of released patches. Any patches released on or before this date are installed automatically.\n\n Enter dates in the format [YYYY-MM-DD]. For example, [2024-12-31].\n \n  This parameter is marked as [Required: No], but your request must include a value for either [ApproveUntilDate] or [ApproveAfterDays].\n  \n   Not supported for Debian Server or Ubuntu Server.\n   \n     Use caution when setting this value for Windows Server patch baselines. Because patch updates that are replaced by later updates are removed, setting too broad a value for this parameter can result in crucial patches not being installed. For more information, see the {b Windows Server} tab in the topic {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-selecting-patches.html}How security patches are selected} in the {i Amazon Web Services Systems Manager User Guide}.\n     \n      "];
  approve_after_days: approve_after_days option
    [@ocaml.doc
      "The number of days after the release date of each patch matched by the rule that the patch is marked as approved in the patch baseline. For example, a value of [7] means that patches are approved seven days after they are released.\n\n This parameter is marked as [Required: No], but your request must include a value for either [ApproveAfterDays] or [ApproveUntilDate].\n \n  Not supported for Debian Server or Ubuntu Server.\n  \n    Use caution when setting this value for Windows Server patch baselines. Because patch updates that are replaced by later updates are removed, setting too broad a value for this parameter can result in crucial patches not being installed. For more information, see the {b Windows Server} tab in the topic {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-selecting-patches.html}How security patches are selected} in the {i Amazon Web Services Systems Manager User Guide}.\n    \n     "];
  compliance_level: patch_compliance_level option
    [@ocaml.doc
      "A compliance severity level for all approved patches in a patch baseline.\n"];
  patch_filter_group: patch_filter_group
    [@ocaml.doc
      "The patch filter group that defines the criteria for the rule.\n"]}
[@@ocaml.doc "Defines an approval rule for a patch baseline.\n"]
type nonrec patch_rule_list = patch_rule list[@@ocaml.doc ""]
type nonrec patch_rule_group =
  {
  patch_rules: patch_rule_list
    [@ocaml.doc "The rules that make up the rule group.\n"]}[@@ocaml.doc
                                                              "A set of rules defining the approval rules for a patch baseline.\n"]
type nonrec patch_id = string[@@ocaml.doc ""]
type nonrec patch_id_list = patch_id list[@@ocaml.doc ""]
type nonrec patch_action =
  | Block [@ocaml.doc ""]
  | AllowAsDependency [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec baseline_description = string[@@ocaml.doc ""]
type nonrec patch_source_name = string[@@ocaml.doc ""]
type nonrec patch_source_product = string[@@ocaml.doc ""]
type nonrec patch_source_product_list = patch_source_product list[@@ocaml.doc
                                                                   ""]
type nonrec patch_source_configuration = string[@@ocaml.doc ""]
type nonrec patch_source =
  {
  configuration: patch_source_configuration
    [@ocaml.doc
      "The value of the yum repo configuration. For example:\n\n  [\\[main\\]] \n \n   [name=MyCustomRepository] \n  \n    [baseurl=https://my-custom-repository] \n   \n     [enabled=1] \n    \n      For information about other options available for your yum repository configuration, see {{:https://man7.org/linux/man-pages/man5/dnf.conf.5.html}dnf.conf(5)}.\n      \n       "];
  products: patch_source_product_list
    [@ocaml.doc
      "The specific operating system versions a patch repository applies to, such as \"Ubuntu16.04\", \"AmazonLinux2016.09\", \"RedhatEnterpriseLinux7.2\" or \"Suse12.7\". For lists of supported product values, see [PatchFilter].\n"];
  name: patch_source_name
    [@ocaml.doc "The name specified to identify the patch source.\n"]}
[@@ocaml.doc
  "Information about the patches to use to update the managed nodes, including target operating systems and source repository. Applies to Linux managed nodes only.\n"]
type nonrec patch_source_list = patch_source list[@@ocaml.doc ""]
type nonrec patch_compliance_status =
  | NonCompliant [@ocaml.doc ""]
  | Compliant [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_patch_baseline_result =
  {
  available_security_updates_compliance_status:
    patch_compliance_status option
    [@ocaml.doc
      "Indicates the compliance status of managed nodes for which security-related patches are available but were not approved. This preference is specified when the [CreatePatchBaseline] or [UpdatePatchBaseline] commands are run.\n\n Applies to Windows Server managed nodes only.\n "];
  sources: patch_source_list option
    [@ocaml.doc
      "Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.\n"];
  description: baseline_description option
    [@ocaml.doc "A description of the patch baseline.\n"];
  modified_date: date_time option
    [@ocaml.doc "The date when the patch baseline was last modified.\n"];
  created_date: date_time option
    [@ocaml.doc "The date when the patch baseline was created.\n"];
  rejected_patches_action: patch_action option
    [@ocaml.doc
      "The action specified to take on patches included in the [RejectedPatches] list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.\n"];
  rejected_patches: patch_id_list option
    [@ocaml.doc "A list of explicitly rejected patches for the baseline.\n"];
  approved_patches_enable_non_security: boolean_ option
    [@ocaml.doc
      "Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.\n"];
  approved_patches_compliance_level: patch_compliance_level option
    [@ocaml.doc
      "The compliance severity level assigned to the patch baseline after the update completed.\n"];
  approved_patches: patch_id_list option
    [@ocaml.doc "A list of explicitly approved patches for the baseline.\n"];
  approval_rules: patch_rule_group option
    [@ocaml.doc "A set of rules used to include patches in the baseline.\n"];
  global_filters: patch_filter_group option
    [@ocaml.doc
      "A set of global filters used to exclude patches from the baseline.\n"];
  operating_system: operating_system option
    [@ocaml.doc
      "The operating system rule used by the updated patch baseline.\n"];
  name: baseline_name option [@ocaml.doc "The name of the patch baseline.\n"];
  baseline_id: baseline_id option
    [@ocaml.doc "The ID of the deleted patch baseline.\n"]}[@@ocaml.doc ""]
type nonrec update_patch_baseline_request =
  {
  replace: boolean_ option
    [@ocaml.doc
      "If True, then all fields that are required by the [CreatePatchBaseline] operation are also required for this API request. Optional fields that aren't specified are set to null.\n"];
  available_security_updates_compliance_status:
    patch_compliance_status option
    [@ocaml.doc
      "Indicates the status to be assigned to security patches that are available but not approved because they don't meet the installation criteria specified in the patch baseline.\n\n Example scenario: Security patches that you might want installed can be skipped if you have specified a long period to wait after a patch is released before installation. If an update to the patch is released during your specified waiting period, the waiting period for installing the patch starts over. If the waiting period is too long, multiple versions of the patch could be released but never installed.\n \n  Supported for Windows Server managed nodes only.\n  "];
  sources: patch_source_list option
    [@ocaml.doc
      "Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.\n"];
  description: baseline_description option
    [@ocaml.doc "A description of the patch baseline.\n"];
  rejected_patches_action: patch_action option
    [@ocaml.doc
      "The action for Patch Manager to take on patches included in the [RejectedPackages] list.\n\n  ALLOW_AS_DEPENDENCY   {b Linux and macOS}: A package in the rejected patches list is installed only if it is a dependency of another package. It is considered compliant with the patch baseline, and its status is reported as [INSTALLED_OTHER]. This is the default action if no option is specified.\n                       \n                         {b Windows Server}: Windows Server doesn't support the concept of package dependencies. If a package in the rejected patches list and already installed on the node, its status is reported as [INSTALLED_OTHER]. Any package not already installed on the node is skipped. This is the default action if no option is specified.\n                        \n                          BLOCK   {b All OSs}: Packages in the rejected patches list, and packages that include them as dependencies, aren't installed by Patch Manager under any circumstances. If a package was installed before it was added to the rejected patches list, or is installed outside of Patch Manager afterward, it's considered noncompliant with the patch baseline and its status is reported as [INSTALLED_REJECTED].\n                                 \n                                   "];
  rejected_patches: patch_id_list option
    [@ocaml.doc
      "A list of explicitly rejected patches for the baseline.\n\n For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}Package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  approved_patches_enable_non_security: boolean_ option
    [@ocaml.doc
      "Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.\n"];
  approved_patches_compliance_level: patch_compliance_level option
    [@ocaml.doc
      "Assigns a new compliance severity level to an existing patch baseline.\n"];
  approved_patches: patch_id_list option
    [@ocaml.doc
      "A list of explicitly approved patches for the baseline.\n\n For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}Package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  approval_rules: patch_rule_group option
    [@ocaml.doc "A set of rules used to include patches in the baseline.\n"];
  global_filters: patch_filter_group option
    [@ocaml.doc
      "A set of global filters used to include patches in the baseline.\n\n  The [GlobalFilters] parameter can be configured only by using the CLI or an Amazon Web Services SDK. It can't be configured from the Patch Manager console, and its value isn't displayed in the console.\n  \n   "];
  name: baseline_name option [@ocaml.doc "The name of the patch baseline.\n"];
  baseline_id: baseline_id
    [@ocaml.doc "The ID of the patch baseline to update.\n"]}[@@ocaml.doc ""]
type nonrec does_not_exist_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Error returned when the ID specified for a resource, such as a maintenance window or patch baseline, doesn't exist.\n\n For information about resource quotas in Amazon Web Services Systems Manager, see {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#limits_ssm}Systems Manager service quotas} in the {i Amazon Web Services General Reference}.\n "]
type nonrec ops_metadata_arn = string[@@ocaml.doc ""]
type nonrec update_ops_metadata_result =
  {
  ops_metadata_arn: ops_metadata_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the OpsMetadata Object that was updated.\n"]}
[@@ocaml.doc ""]
type nonrec metadata_value_string = string[@@ocaml.doc ""]
type nonrec metadata_value =
  {
  value: metadata_value_string option
    [@ocaml.doc
      "Metadata value to assign to an Application Manager application.\n"]}
[@@ocaml.doc "Metadata to assign to an Application Manager application.\n"]
type nonrec metadata_key = string[@@ocaml.doc ""]
type nonrec metadata_map = (metadata_key * metadata_value) list[@@ocaml.doc
                                                                 ""]
type nonrec metadata_keys_to_delete_list = metadata_key list[@@ocaml.doc ""]
type nonrec update_ops_metadata_request =
  {
  keys_to_delete: metadata_keys_to_delete_list option
    [@ocaml.doc
      "The metadata keys to delete from the OpsMetadata object. \n"];
  metadata_to_update: metadata_map option
    [@ocaml.doc "Metadata to add to an OpsMetadata object.\n"];
  ops_metadata_arn: ops_metadata_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the OpsMetadata Object to update.\n"]}
[@@ocaml.doc ""]
type nonrec ops_metadata_too_many_updates_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The system is processing too many concurrent updates. Wait a few moments and try again.\n"]
type nonrec ops_metadata_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The OpsMetadata object doesn't exist. \n"]
type nonrec ops_metadata_key_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The OpsMetadata object exceeds the maximum number of OpsMetadata keys that you can assign to an application in Application Manager.\n"]
type nonrec ops_metadata_invalid_argument_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "One of the arguments passed is invalid. \n"]
type nonrec update_ops_item_response = unit[@@ocaml.doc ""]
type nonrec ops_item_description = string[@@ocaml.doc ""]
type nonrec ops_item_data_value_string = string[@@ocaml.doc ""]
type nonrec ops_item_data_type =
  | STRING [@ocaml.doc ""]
  | SEARCHABLE_STRING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_data_value =
  {
  type_: ops_item_data_type option
    [@ocaml.doc
      "The type of key-value pair. Valid types include [SearchableString] and [String].\n"];
  value: ops_item_data_value_string option
    [@ocaml.doc "The value of the OperationalData key.\n"]}[@@ocaml.doc
                                                             "An object that defines the value of the key and its type in the OperationalData map.\n"]
type nonrec ops_item_data_key = string[@@ocaml.doc ""]
type nonrec ops_item_operational_data =
  (ops_item_data_key * ops_item_data_value) list[@@ocaml.doc ""]
type nonrec ops_item_ops_data_keys_list = string_ list[@@ocaml.doc ""]
type nonrec ops_item_notification =
  {
  arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where notifications are sent when this OpsItem is edited or changed.\n"]}
[@@ocaml.doc "A notification about the OpsItem.\n"]
type nonrec ops_item_notifications = ops_item_notification list[@@ocaml.doc
                                                                 ""]
type nonrec ops_item_priority = int[@@ocaml.doc ""]
type nonrec related_ops_item =
  {
  ops_item_id: string_
    [@ocaml.doc "The ID of an OpsItem related to the current OpsItem.\n"]}
[@@ocaml.doc
  "An OpsItems that shares something in common with the current OpsItem. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.\n"]
type nonrec related_ops_items = related_ops_item list[@@ocaml.doc ""]
type nonrec ops_item_status =
  | CLOSED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | REVOKED [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | PENDING_APPROVAL [@ocaml.doc ""]
  | CHANGE_CALENDAR_OVERRIDE_REJECTED [@ocaml.doc ""]
  | CHANGE_CALENDAR_OVERRIDE_APPROVED [@ocaml.doc ""]
  | PENDING_CHANGE_CALENDAR_OVERRIDE [@ocaml.doc ""]
  | RUNBOOK_IN_PROGRESS [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
  | COMPLETED_WITH_FAILURE [@ocaml.doc ""]
  | COMPLETED_WITH_SUCCESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | RESOLVED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_id = string[@@ocaml.doc ""]
type nonrec ops_item_title = string[@@ocaml.doc ""]
type nonrec ops_item_category = string[@@ocaml.doc ""]
type nonrec ops_item_severity = string[@@ocaml.doc ""]
type nonrec ops_item_arn = string[@@ocaml.doc ""]
type nonrec update_ops_item_request =
  {
  ops_item_arn: ops_item_arn option
    [@ocaml.doc "The OpsItem Amazon Resource Name (ARN).\n"];
  planned_end_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  planned_start_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  actual_end_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  actual_start_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  severity: ops_item_severity option
    [@ocaml.doc "Specify a new severity for an OpsItem.\n"];
  category: ops_item_category option
    [@ocaml.doc "Specify a new category for an OpsItem.\n"];
  title: ops_item_title option
    [@ocaml.doc
      "A short heading that describes the nature of the OpsItem and the impacted resource.\n"];
  ops_item_id: ops_item_id [@ocaml.doc "The ID of the OpsItem.\n"];
  status: ops_item_status option
    [@ocaml.doc
      "The OpsItem status. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html}Editing OpsItem details} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  related_ops_items: related_ops_items option
    [@ocaml.doc
      "One or more OpsItems that share something in common with the current OpsItems. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.\n"];
  priority: ops_item_priority option
    [@ocaml.doc
      "The importance of this OpsItem in relation to other OpsItems in the system.\n"];
  notifications: ops_item_notifications option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.\n"];
  operational_data_to_delete: ops_item_ops_data_keys_list option
    [@ocaml.doc
      "Keys that you want to remove from the OperationalData map.\n"];
  operational_data: ops_item_operational_data option
    [@ocaml.doc
      "Add new keys or edit existing key-value pairs of the OperationalData map in the OpsItem object.\n\n Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.\n \n   Operational data keys {i can't} begin with the following: [amazon], [aws], [amzn], [ssm], [/amazon], [/aws], [/amzn], [/ssm].\n   \n     You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the [DescribeOpsItems] API operation) can view and search on the specified data. Operational data that isn't searchable is only viewable by users who have access to the OpsItem (as provided by the [GetOpsItem] API operation).\n     \n      Use the [/aws/resources] key in OperationalData to specify a related resource in the request. Use the [/aws/automations] key in OperationalData to associate an Automation runbook with the OpsItem. To view Amazon Web Services CLI example commands that use these keys, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html}Creating OpsItems manually} in the {i Amazon Web Services Systems Manager User Guide}.\n      "];
  description: ops_item_description option
    [@ocaml.doc
      "User-defined text that contains information about the OpsItem, in Markdown format. \n"]}
[@@ocaml.doc ""]
type nonrec ops_item_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified OpsItem ID doesn't exist. Verify the ID and try again.\n"]
type nonrec ops_item_parameter_names_list = string_ list[@@ocaml.doc ""]
type nonrec integer = int[@@ocaml.doc ""]
type nonrec ops_item_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""];
  limit_type: string_ option [@ocaml.doc ""];
  limit: integer option [@ocaml.doc ""];
  resource_types: ops_item_parameter_names_list option [@ocaml.doc ""]}
[@@ocaml.doc "The request caused OpsItems to exceed one or more quotas.\n"]
type nonrec ops_item_invalid_parameter_exception =
  {
  message: string_ option [@ocaml.doc ""];
  parameter_names: ops_item_parameter_names_list option [@ocaml.doc ""]}
[@@ocaml.doc
  "A specified parameter argument isn't valid. Verify the available arguments and try again.\n"]
type nonrec ops_item_conflict_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified OpsItem is in the process of being deleted.\n"]
type nonrec ops_item_already_exists_exception =
  {
  ops_item_id: string_ option [@ocaml.doc ""];
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The OpsItem already exists.\n"]
type nonrec ops_item_access_denied_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You don't have permission to view OpsItems in the specified account. Verify that your account is configured either as a Systems Manager delegated administrator or that you are logged into the Organizations management account.\n"]
type nonrec update_managed_instance_role_result = unit[@@ocaml.doc ""]
type nonrec managed_instance_id = string[@@ocaml.doc ""]
type nonrec iam_role = string[@@ocaml.doc ""]
type nonrec update_managed_instance_role_request =
  {
  iam_role: iam_role
    [@ocaml.doc
      "The name of the Identity and Access Management (IAM) role that you want to assign to the managed node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems Manager service principal [ssm.amazonaws.com]. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-service-role.html}Create the IAM service role required for Systems Manager in hybrid and multicloud environments} in the {i Amazon Web Services Systems Manager User Guide}.\n\n  You can't specify an IAM service-linked role for this parameter. You must create a unique role.\n  \n   "];
  instance_id: managed_instance_id
    [@ocaml.doc
      "The ID of the managed node where you want to update the role.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_instance_id = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The following problems can cause this exception:\n\n {ul\n       {-  You don't have permission to access the managed node.\n           \n            }\n       {-  Amazon Web Services Systems Manager Agent (SSM Agent) isn't running. Verify that SSM Agent is running.\n           \n            }\n       {-  SSM Agent isn't registered with the SSM endpoint. Try reinstalling SSM Agent.\n           \n            }\n       {-  The managed node isn't in a valid state. Valid states are: [Running], [Pending], [Stopped], and [Stopping]. Invalid states are: [Shutting-down] and [Terminated].\n           \n            }\n       }\n  "]
type nonrec maintenance_window_id = string[@@ocaml.doc ""]
type nonrec maintenance_window_task_id = string[@@ocaml.doc ""]
type nonrec target_key = string[@@ocaml.doc ""]
type nonrec target_value = string[@@ocaml.doc ""]
type nonrec target_values = target_value list[@@ocaml.doc ""]
type nonrec target =
  {
  values: target_values option
    [@ocaml.doc
      "User-defined criteria that maps to [Key]. For example, if you specified [tag:ServerRole], you could specify [value:WebServer] to run a command on instances that include EC2 tags of [ServerRole,WebServer]. \n\n Depending on the type of target, the maximum number of values for a key might be lower than the global maximum of 50.\n "];
  key: target_key option
    [@ocaml.doc
      "User-defined criteria for sending commands that target managed nodes that meet the criteria.\n"]}
[@@ocaml.doc
  "An array of search criteria that targets managed nodes using a key-value pair that you specify.\n\n   One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n    Supported formats include the following.\n    \n      {b For all Systems Manager tools:} \n     \n      {ul\n            {-   [Key=tag-key,Values=tag-value-1,tag-value-2] \n                \n                 }\n            }\n    {b For Automation and Change Manager:} \n   \n    {ul\n          {-   [Key=tag:tag-key,Values=tag-value] \n              \n               }\n          {-   [Key=ResourceGroup,Values=resource-group-name] \n              \n               }\n          {-   [Key=ParameterValues,Values=value-1,value-2,value-3] \n              \n               }\n          {-  To target all instances in the Amazon Web Services Region:\n              \n               {ul\n                     {-   [Key=AWS::EC2::Instance,Values=*] \n                         \n                          }\n                     {-   [Key=InstanceIds,Values=*] \n                         \n                          }\n                     \n           }\n            }\n          }\n    {b For Run Command and Maintenance Windows:} \n   \n    {ul\n          {-   [Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3] \n              \n               }\n          {-   [Key=tag:tag-key,Values=tag-value-1,tag-value-2] \n              \n               }\n          {-   [Key=resource-groups:Name,Values=resource-group-name] \n              \n               }\n          {-  Additionally, Maintenance Windows support targeting resource types:\n              \n               {ul\n                     {-   [Key=resource-groups:ResourceTypeFilters,Values=resource-type-1,resource-type-2] \n                         \n                          }\n                     \n           }\n            }\n          }\n    {b For State Manager:} \n   \n    {ul\n          {-   [Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3] \n              \n               }\n          {-   [Key=tag:tag-key,Values=tag-value-1,tag-value-2] \n              \n               }\n          {-  To target all instances in the Amazon Web Services Region:\n              \n               {ul\n                     {-   [Key=InstanceIds,Values=*] \n                         \n                          }\n                     \n           }\n            }\n          }\n   For more information about how to send commands that target managed nodes using [Key,Value] parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-targeting}Targeting multiple managed nodes} in the {i Amazon Web Services Systems Manager User Guide}.\n   "]
type nonrec targets = target list[@@ocaml.doc ""]
type nonrec maintenance_window_task_arn = string[@@ocaml.doc ""]
type nonrec service_role = string[@@ocaml.doc ""]
type nonrec maintenance_window_task_parameter_value = string[@@ocaml.doc ""]
type nonrec maintenance_window_task_parameter_value_list =
  maintenance_window_task_parameter_value list[@@ocaml.doc ""]
type nonrec maintenance_window_task_parameter_value_expression =
  {
  values: maintenance_window_task_parameter_value_list option
    [@ocaml.doc
      "This field contains an array of 0 or more strings, each 1 to 255 characters in length.\n"]}
[@@ocaml.doc "Defines the values for a task parameter.\n"]
type nonrec maintenance_window_task_parameter_name = string[@@ocaml.doc ""]
type nonrec maintenance_window_task_parameters =
  (maintenance_window_task_parameter_name *
    maintenance_window_task_parameter_value_expression) list[@@ocaml.doc ""]
type nonrec comment = string[@@ocaml.doc ""]
type nonrec cloud_watch_log_group_name = string[@@ocaml.doc ""]
type nonrec cloud_watch_output_enabled = bool[@@ocaml.doc ""]
type nonrec cloud_watch_output_config =
  {
  cloud_watch_output_enabled: cloud_watch_output_enabled option
    [@ocaml.doc
      "Enables Systems Manager to send command output to CloudWatch Logs.\n"];
  cloud_watch_log_group_name: cloud_watch_log_group_name option
    [@ocaml.doc
      "The name of the CloudWatch Logs log group where you want to send command output. If you don't specify a group name, Amazon Web Services Systems Manager automatically creates a log group for you. The log group uses the following naming format:\n\n  \n {[\n aws/ssm/{i SystemsManagerDocumentName} \n ]}\n  \n "]}
[@@ocaml.doc
  "Configuration options for sending command output to Amazon CloudWatch Logs.\n"]
type nonrec document_hash = string[@@ocaml.doc ""]
type nonrec document_hash_type =
  | SHA1 [@ocaml.doc ""]
  | SHA256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_version = string[@@ocaml.doc ""]
type nonrec notification_arn = string[@@ocaml.doc ""]
type nonrec notification_event =
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec notification_event_list = notification_event list[@@ocaml.doc ""]
type nonrec notification_type =
  | Invocation [@ocaml.doc ""]
  | Command [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec notification_config =
  {
  notification_type: notification_type option
    [@ocaml.doc
      "The type of notification.\n\n {ul\n       {-   [Command]: Receive notification when the status of a command changes.\n           \n            }\n       {-   [Invocation]: For commands sent to multiple managed nodes, receive notification on a per-node basis when the status of a command changes. \n           \n            }\n       }\n  "];
  notification_events: notification_event_list option
    [@ocaml.doc
      "The different events for which you can receive notifications. To learn more about these events, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html}Monitoring Systems Manager status changes using Amazon SNS notifications} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  notification_arn: notification_arn option
    [@ocaml.doc
      "An Amazon Resource Name (ARN) for an Amazon Simple Notification Service (Amazon SNS) topic. Run Command pushes notifications about command status changes to this topic.\n"]}
[@@ocaml.doc "Configurations for sending notifications.\n"]
type nonrec s3_bucket_name = string[@@ocaml.doc ""]
type nonrec s3_key_prefix = string[@@ocaml.doc ""]
type nonrec parameter_value = string[@@ocaml.doc ""]
type nonrec parameter_value_list = parameter_value list[@@ocaml.doc ""]
type nonrec parameter_name = string[@@ocaml.doc ""]
type nonrec parameters = (parameter_name * parameter_value_list) list
[@@ocaml.doc ""]
type nonrec timeout_seconds = int[@@ocaml.doc ""]
type nonrec maintenance_window_run_command_parameters =
  {
  timeout_seconds: timeout_seconds option
    [@ocaml.doc
      "If this time is reached and the command hasn't already started running, it doesn't run.\n"];
  service_role_arn: service_role option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].\n\n However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up Maintenance Windows} in the in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  parameters: parameters option
    [@ocaml.doc "The parameters for the [RUN_COMMAND] task execution.\n"];
  output_s3_key_prefix: s3_key_prefix option
    [@ocaml.doc "The S3 bucket subfolder.\n"];
  output_s3_bucket_name: s3_bucket_name option
    [@ocaml.doc
      "The name of the Amazon Simple Storage Service (Amazon S3) bucket.\n"];
  notification_config: notification_config option
    [@ocaml.doc
      "Configurations for sending notifications about command status changes on a per-managed node basis.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The Amazon Web Services Systems Manager document (SSM document) version to use in the request. You can specify [$DEFAULT], [$LATEST], or a specific version number. If you run commands by using the Amazon Web Services CLI, then you must escape the first two options by using a backslash. If you specify a version number, then you don't need to use the backslash. For example:\n\n  [--document-version \"\\$DEFAULT\"] \n \n   [--document-version \"\\$LATEST\"] \n  \n    [--document-version \"3\"] \n   "];
  document_hash_type: document_hash_type option
    [@ocaml.doc "SHA-256 or SHA-1. SHA-1 hashes have been deprecated.\n"];
  document_hash: document_hash option
    [@ocaml.doc
      "The SHA-256 or SHA-1 hash created by the system when the document was created. SHA-1 hashes have been deprecated.\n"];
  cloud_watch_output_config: cloud_watch_output_config option [@ocaml.doc ""];
  comment: comment option
    [@ocaml.doc "Information about the commands to run.\n"]}[@@ocaml.doc
                                                              "The parameters for a [RUN_COMMAND] task type.\n\n For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].\n \n    [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n   \n     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n    \n     For [RUN_COMMAND] tasks, Systems Manager uses specified values for [TaskParameters] and [LoggingInfo] only if no values are specified for [TaskInvocationParameters]. \n     \n      "]
type nonrec automation_parameter_value = string[@@ocaml.doc ""]
type nonrec automation_parameter_value_list = automation_parameter_value list
[@@ocaml.doc ""]
type nonrec automation_parameter_key = string[@@ocaml.doc ""]
type nonrec automation_parameter_map =
  (automation_parameter_key * automation_parameter_value_list) list[@@ocaml.doc
                                                                    ""]
type nonrec maintenance_window_automation_parameters =
  {
  parameters: automation_parameter_map option
    [@ocaml.doc
      "The parameters for the [AUTOMATION] task.\n\n For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].\n \n    [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n   \n     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n    \n     For [AUTOMATION] task types, Amazon Web Services Systems Manager ignores any values specified for these parameters.\n     \n      "];
  document_version: document_version option
    [@ocaml.doc
      "The version of an Automation runbook to use during task execution.\n"]}
[@@ocaml.doc "The parameters for an [AUTOMATION] task type.\n"]
type nonrec maintenance_window_step_functions_input = string[@@ocaml.doc ""]
type nonrec maintenance_window_step_functions_name = string[@@ocaml.doc ""]
type nonrec maintenance_window_step_functions_parameters =
  {
  name: maintenance_window_step_functions_name option
    [@ocaml.doc "The name of the [STEP_FUNCTIONS] task.\n"];
  input: maintenance_window_step_functions_input option
    [@ocaml.doc "The inputs for the [STEP_FUNCTIONS] task.\n"]}[@@ocaml.doc
                                                                 "The parameters for a [STEP_FUNCTIONS] task.\n\n For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].\n \n    [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n   \n     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n    \n     For Step Functions tasks, Systems Manager ignores any values specified for [TaskParameters] and [LoggingInfo].\n     \n      "]
type nonrec maintenance_window_lambda_client_context = string[@@ocaml.doc ""]
type nonrec maintenance_window_lambda_qualifier = string[@@ocaml.doc ""]
type nonrec maintenance_window_lambda_payload = bytes[@@ocaml.doc ""]
type nonrec maintenance_window_lambda_parameters =
  {
  payload: maintenance_window_lambda_payload option
    [@ocaml.doc "JSON to provide to your Lambda function as input.\n"];
  qualifier: maintenance_window_lambda_qualifier option
    [@ocaml.doc
      "(Optional) Specify an Lambda function version or alias name. If you specify a function version, the operation uses the qualified function Amazon Resource Name (ARN) to invoke a specific Lambda function. If you specify an alias name, the operation uses the alias ARN to invoke the Lambda function version to which the alias points.\n"];
  client_context: maintenance_window_lambda_client_context option
    [@ocaml.doc
      "Pass client-specific information to the Lambda function that you are invoking. You can then process the client information in your Lambda function as you choose through the context variable.\n"]}
[@@ocaml.doc
  "The parameters for a [LAMBDA] task type.\n\n For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].\n \n    [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n   \n     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n    \n     For Lambda tasks, Systems Manager ignores any values specified for TaskParameters and LoggingInfo.\n     \n      "]
type nonrec maintenance_window_task_invocation_parameters =
  {
  lambda: maintenance_window_lambda_parameters option
    [@ocaml.doc "The parameters for a [LAMBDA] task type.\n"];
  step_functions: maintenance_window_step_functions_parameters option
    [@ocaml.doc "The parameters for a [STEP_FUNCTIONS] task type.\n"];
  automation: maintenance_window_automation_parameters option
    [@ocaml.doc "The parameters for an [AUTOMATION] task type.\n"];
  run_command: maintenance_window_run_command_parameters option
    [@ocaml.doc "The parameters for a [RUN_COMMAND] task type.\n"]}[@@ocaml.doc
                                                                    "The parameters for task execution.\n"]
type nonrec maintenance_window_task_priority = int[@@ocaml.doc ""]
type nonrec max_concurrency = string[@@ocaml.doc ""]
type nonrec max_errors = string[@@ocaml.doc ""]
type nonrec s3_region = string[@@ocaml.doc ""]
type nonrec logging_info =
  {
  s3_region: s3_region
    [@ocaml.doc
      "The Amazon Web Services Region where the S3 bucket is located.\n"];
  s3_key_prefix: s3_key_prefix option
    [@ocaml.doc "(Optional) The S3 bucket subfolder. \n"];
  s3_bucket_name: s3_bucket_name
    [@ocaml.doc
      "The name of an S3 bucket where execution logs are stored.\n"]}
[@@ocaml.doc
  "Information about an Amazon Simple Storage Service (Amazon S3) bucket to write managed node-level logs to.\n\n   [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "]
type nonrec maintenance_window_name = string[@@ocaml.doc ""]
type nonrec maintenance_window_description = string[@@ocaml.doc ""]
type nonrec maintenance_window_task_cutoff_behavior =
  | CancelTask [@ocaml.doc ""]
  | ContinueTask [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec alarm_name = string[@@ocaml.doc ""]
type nonrec alarm =
  {
  name: alarm_name [@ocaml.doc "The name of your CloudWatch alarm.\n"]}
[@@ocaml.doc "A CloudWatch alarm you apply to an automation or command.\n"]
type nonrec alarm_list = alarm list[@@ocaml.doc ""]
type nonrec alarm_configuration =
  {
  alarms: alarm_list
    [@ocaml.doc
      "The name of the CloudWatch alarm specified in the configuration.\n"];
  ignore_poll_alarm_failure: boolean_ option
    [@ocaml.doc
      "When this value is {i true}, your automation or command continues to run in cases where we can\226\128\153t retrieve alarm status information from CloudWatch. In cases where we successfully retrieve an alarm status of OK or INSUFFICIENT_DATA, the automation or command continues to run, regardless of this value. Default is {i false}.\n"]}
[@@ocaml.doc
  "The details for the CloudWatch alarm you want to apply to an automation or command.\n"]
type nonrec update_maintenance_window_task_result =
  {
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm you applied to your maintenance window task.\n"];
  cutoff_behavior: maintenance_window_task_cutoff_behavior option
    [@ocaml.doc
      "The specification for whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached. \n"];
  description: maintenance_window_description option
    [@ocaml.doc "The updated task description.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The updated task name.\n"];
  logging_info: logging_info option
    [@ocaml.doc
      "The updated logging information in Amazon S3.\n\n   [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  max_errors: max_errors option
    [@ocaml.doc "The updated [MaxErrors] value.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc "The updated [MaxConcurrency] value.\n"];
  priority: maintenance_window_task_priority option
    [@ocaml.doc "The updated priority value.\n"];
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option
    [@ocaml.doc "The updated parameter values.\n"];
  task_parameters: maintenance_window_task_parameters option
    [@ocaml.doc
      "The updated parameter values.\n\n   [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  service_role_arn: service_role option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].\n\n However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up Maintenance Windows} in the in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  task_arn: maintenance_window_task_arn option
    [@ocaml.doc "The updated task ARN value.\n"];
  targets: targets option [@ocaml.doc "The updated target values.\n"];
  window_task_id: maintenance_window_task_id option
    [@ocaml.doc "The task ID of the maintenance window that was updated.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the maintenance window that was updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_maintenance_window_task_request =
  {
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The CloudWatch alarm you want to apply to your maintenance window task.\n"];
  cutoff_behavior: maintenance_window_task_cutoff_behavior option
    [@ocaml.doc
      "Indicates whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached. \n\n {ul\n       {-   [CONTINUE_TASK]: When the cutoff time is reached, any tasks that are running continue. The default value.\n           \n            }\n       {-   [CANCEL_TASK]:\n           \n            {ul\n                  {-  For Automation, Lambda, Step Functions tasks: When the cutoff time is reached, any task invocations that are already running continue, but no new task invocations are started.\n                      \n                       }\n                  {-  For Run Command tasks: When the cutoff time is reached, the system sends a [CancelCommand] operation that attempts to cancel the command associated with the task. However, there is no guarantee that the command will be terminated and the underlying process stopped.\n                      \n                       }\n                  \n        }\n         The status for tasks that are not completed is [TIMED_OUT].\n         \n          }\n       }\n  "];
  replace: boolean_ option
    [@ocaml.doc
      "If True, then all fields that are required by the [RegisterTaskWithMaintenanceWindow] operation are also required for this API request. Optional fields that aren't specified are set to null.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "The new task description to specify.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The new task name to specify.\n"];
  logging_info: logging_info option
    [@ocaml.doc
      "The new logging location in Amazon S3 to specify.\n\n   [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  max_errors: max_errors option
    [@ocaml.doc
      "The new [MaxErrors] value to specify. [MaxErrors] is the maximum number of errors that are allowed before the task stops being scheduled.\n\n  Although this element is listed as \"Required: No\", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.\n  \n   For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.\n   \n    "];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The new [MaxConcurrency] value you want to specify. [MaxConcurrency] is the number of targets that are allowed to run this task, in parallel.\n\n  Although this element is listed as \"Required: No\", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.\n  \n   For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.\n   \n    "];
  priority: maintenance_window_task_priority option
    [@ocaml.doc
      "The new task priority to specify. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.\n"];
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option
    [@ocaml.doc
      "The parameters that the task should use during execution. Populate only the fields that match the task type. All other fields should be empty.\n\n  When you update a maintenance window task that has options specified in [TaskInvocationParameters], you must provide again all the [TaskInvocationParameters] values that you want to retain. The values you don't specify again are removed. For example, suppose that when you registered a Run Command task, you specified [TaskInvocationParameters] values for [Comment], [NotificationConfig], and [OutputS3BucketName]. If you update the maintenance window task and specify only a different [OutputS3BucketName] value, the values for [Comment] and [NotificationConfig] are removed.\n  \n   "];
  task_parameters: maintenance_window_task_parameters option
    [@ocaml.doc
      "The parameters to modify.\n\n   [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n    The map has the following format:\n    \n     Key: string, between 1 and 255 characters\n     \n      Value: an array of strings, each string is between 1 and 255 characters\n      "];
  service_role_arn: service_role option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].\n\n However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up Maintenance Windows} in the in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  task_arn: maintenance_window_task_arn option
    [@ocaml.doc "The task ARN to modify.\n"];
  targets: targets option
    [@ocaml.doc
      "The targets (either managed nodes or tags) to modify. Managed nodes are specified using the format [Key=instanceids,Values=instanceID_1,instanceID_2]. Tags are specified using the format [ Key=tag_name,Values=tag_value]. \n\n  One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n   "];
  window_task_id: maintenance_window_task_id
    [@ocaml.doc "The task ID to modify.\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The maintenance window ID that contains the task to modify.\n"]}
[@@ocaml.doc ""]
type nonrec maintenance_window_target_id = string[@@ocaml.doc ""]
type nonrec owner_information = string[@@ocaml.doc ""]
type nonrec update_maintenance_window_target_result =
  {
  description: maintenance_window_description option
    [@ocaml.doc "The updated description.\n"];
  name: maintenance_window_name option [@ocaml.doc "The updated name.\n"];
  owner_information: owner_information option
    [@ocaml.doc "The updated owner.\n"];
  targets: targets option [@ocaml.doc "The updated targets.\n"];
  window_target_id: maintenance_window_target_id option
    [@ocaml.doc "The target ID specified in the update request.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc
      "The maintenance window ID specified in the update request.\n"]}
[@@ocaml.doc ""]
type nonrec update_maintenance_window_target_request =
  {
  replace: boolean_ option
    [@ocaml.doc
      "If [True], then all fields that are required by the [RegisterTargetWithMaintenanceWindow] operation are also required for this API request. Optional fields that aren't specified are set to null.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "An optional description for the update.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "A name for the update.\n"];
  owner_information: owner_information option
    [@ocaml.doc
      "User-provided value that will be included in any Amazon CloudWatch Events events raised while running tasks for these targets in this maintenance window.\n"];
  targets: targets option [@ocaml.doc "The targets to add or replace.\n"];
  window_target_id: maintenance_window_target_id
    [@ocaml.doc "The target ID to modify.\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The maintenance window ID with which to modify the target.\n"]}
[@@ocaml.doc ""]
type nonrec maintenance_window_string_date_time = string[@@ocaml.doc ""]
type nonrec maintenance_window_schedule = string[@@ocaml.doc ""]
type nonrec maintenance_window_timezone = string[@@ocaml.doc ""]
type nonrec maintenance_window_offset = int[@@ocaml.doc ""]
type nonrec maintenance_window_duration_hours = int[@@ocaml.doc ""]
type nonrec maintenance_window_cutoff = int[@@ocaml.doc ""]
type nonrec maintenance_window_allow_unassociated_targets = bool[@@ocaml.doc
                                                                  ""]
type nonrec maintenance_window_enabled = bool[@@ocaml.doc ""]
type nonrec update_maintenance_window_result =
  {
  enabled: maintenance_window_enabled option
    [@ocaml.doc "Whether the maintenance window is enabled.\n"];
  allow_unassociated_targets:
    maintenance_window_allow_unassociated_targets option
    [@ocaml.doc
      "Whether targets must be registered with the maintenance window before tasks can be defined for those targets.\n"];
  cutoff: maintenance_window_cutoff option
    [@ocaml.doc
      "The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.\n"];
  duration: maintenance_window_duration_hours option
    [@ocaml.doc "The duration of the maintenance window in hours.\n"];
  schedule_offset: maintenance_window_offset option
    [@ocaml.doc
      "The number of days to wait to run a maintenance window after the scheduled cron expression date and time.\n"];
  schedule_timezone: maintenance_window_timezone option
    [@ocaml.doc
      "The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \"Asia/Seoul\". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.\n"];
  schedule: maintenance_window_schedule option
    [@ocaml.doc
      "The schedule of the maintenance window in the form of a cron or rate expression.\n"];
  end_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive. The maintenance window won't run after this specified time.\n"];
  start_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active. The maintenance window won't run before this specified time.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "An optional description of the update.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The name of the maintenance window.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the created maintenance window.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec update_maintenance_window_request =
  {
  replace: boolean_ option
    [@ocaml.doc
      "If [True], then all fields that are required by the [CreateMaintenanceWindow] operation are also required for this API request. Optional fields that aren't specified are set to null. \n"];
  enabled: maintenance_window_enabled option
    [@ocaml.doc "Whether the maintenance window is enabled.\n"];
  allow_unassociated_targets:
    maintenance_window_allow_unassociated_targets option
    [@ocaml.doc
      "Whether targets must be registered with the maintenance window before tasks can be defined for those targets.\n"];
  cutoff: maintenance_window_cutoff option
    [@ocaml.doc
      "The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.\n"];
  duration: maintenance_window_duration_hours option
    [@ocaml.doc "The duration of the maintenance window in hours.\n"];
  schedule_offset: maintenance_window_offset option
    [@ocaml.doc
      "The number of days to wait after the date and time specified by a cron expression before running the maintenance window.\n\n For example, the following cron expression schedules a maintenance window to run the third Tuesday of every month at 11:30 PM.\n \n   [cron(30 23 ? * TUE#3 *)] \n  \n   If the schedule offset is [2], the maintenance window won't run until two days later.\n   "];
  schedule_timezone: maintenance_window_timezone option
    [@ocaml.doc
      "The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \"Asia/Seoul\". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.\n"];
  schedule: maintenance_window_schedule option
    [@ocaml.doc
      "The schedule of the maintenance window in the form of a cron or rate expression.\n"];
  end_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become inactive. [EndDate] allows you to set a date and time in the future when the maintenance window will no longer run.\n"];
  start_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become active. [StartDate] allows you to delay activation of the maintenance window until the specified future date.\n\n  When using a rate schedule, if you provide a start date that occurs in the past, the current date and time are used as the start date. \n  \n   "];
  description: maintenance_window_description option
    [@ocaml.doc "An optional description for the update request.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The name of the maintenance window.\n"];
  window_id: maintenance_window_id
    [@ocaml.doc "The ID of the maintenance window to update.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec document_sha1 = string[@@ocaml.doc ""]
type nonrec document_ar_n = string[@@ocaml.doc ""]
type nonrec document_display_name = string[@@ocaml.doc ""]
type nonrec document_version_name = string[@@ocaml.doc ""]
type nonrec document_owner = string[@@ocaml.doc ""]
type nonrec document_status =
  | Failed [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Updating [@ocaml.doc ""]
  | Active [@ocaml.doc ""]
  | Creating [@ocaml.doc ""][@@ocaml.doc "The status of a document.\n"]
type nonrec document_status_information = string[@@ocaml.doc ""]
type nonrec description_in_document = string[@@ocaml.doc ""]
type nonrec document_parameter_name = string[@@ocaml.doc ""]
type nonrec document_parameter_type =
  | StringList [@ocaml.doc ""]
  | String [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_parameter_descrption = string[@@ocaml.doc ""]
type nonrec document_parameter_default_value = string[@@ocaml.doc ""]
type nonrec document_parameter =
  {
  default_value: document_parameter_default_value option
    [@ocaml.doc
      "If specified, the default values for the parameters. Parameters without a default value are required. Parameters with a default value are optional.\n"];
  description: document_parameter_descrption option
    [@ocaml.doc
      "A description of what the parameter does, how to use it, the default value, and whether or not the parameter is optional.\n"];
  type_: document_parameter_type option
    [@ocaml.doc
      "The type of parameter. The type can be either String or StringList.\n"];
  name: document_parameter_name option
    [@ocaml.doc "The name of the parameter.\n"]}[@@ocaml.doc
                                                  "Parameters specified in a Systems Manager document that run on the server when the command is run. \n"]
type nonrec document_parameter_list = document_parameter list[@@ocaml.doc ""]
type nonrec platform_type =
  | MACOS [@ocaml.doc ""]
  | LINUX [@ocaml.doc ""]
  | WINDOWS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec platform_type_list = platform_type list[@@ocaml.doc ""]
type nonrec document_type =
  | AutoApprovalPolicy [@ocaml.doc ""]
  | ManualApprovalPolicy [@ocaml.doc ""]
  | QuickSetup [@ocaml.doc ""]
  | ConformancePackTemplate [@ocaml.doc ""]
  | CloudFormation [@ocaml.doc ""]
  | ProblemAnalysisTemplate [@ocaml.doc ""]
  | ProblemAnalysis [@ocaml.doc ""]
  | ChangeTemplate [@ocaml.doc ""]
  | ChangeCalendar [@ocaml.doc ""]
  | DeploymentStrategy [@ocaml.doc ""]
  | ApplicationConfigurationSchema [@ocaml.doc ""]
  | ApplicationConfiguration [@ocaml.doc ""]
  | Package [@ocaml.doc ""]
  | Session [@ocaml.doc ""]
  | Automation [@ocaml.doc ""]
  | Policy [@ocaml.doc ""]
  | Command [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_schema_version = string[@@ocaml.doc ""]
type nonrec document_format =
  | TEXT [@ocaml.doc ""]
  | JSON [@ocaml.doc ""]
  | YAML [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec target_type = string[@@ocaml.doc ""]
type nonrec tag_key = string[@@ocaml.doc ""]
type nonrec tag_value = string[@@ocaml.doc ""]
type nonrec tag =
  {
  value: tag_value [@ocaml.doc "The value of the tag.\n"];
  key: tag_key [@ocaml.doc "The name of the tag.\n"]}[@@ocaml.doc
                                                       "Metadata that you assign to your Amazon Web Services resources. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. In Amazon Web Services Systems Manager, you can apply tags to Systems Manager documents (SSM documents), managed nodes, maintenance windows, parameters, patch baselines, OpsItems, and OpsMetadata.\n"]
type nonrec tag_list = tag list[@@ocaml.doc ""]
type nonrec attachment_name = string[@@ocaml.doc ""]
type nonrec attachment_information =
  {
  name: attachment_name option [@ocaml.doc "The name of the attachment.\n"]}
[@@ocaml.doc "An attribute of an attachment, such as the attachment name.\n"]
type nonrec attachment_information_list = attachment_information list
[@@ocaml.doc ""]
type nonrec require_type = string[@@ocaml.doc ""]
type nonrec document_requires =
  {
  version_name: document_version_name option
    [@ocaml.doc
      "An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.\n"];
  require_type: require_type option
    [@ocaml.doc "The document type of the required SSM document.\n"];
  version: document_version option
    [@ocaml.doc "The document version required by the current document.\n"];
  name: document_ar_n
    [@ocaml.doc
      "The name of the required SSM document. The name can be an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc "An SSM document required by the current document.\n"]
type nonrec document_requires_list = document_requires list[@@ocaml.doc ""]
type nonrec document_author = string[@@ocaml.doc ""]
type nonrec review_status =
  | REJECTED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | NOT_REVIEWED [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec reviewer = string[@@ocaml.doc ""]
type nonrec review_information =
  {
  reviewer: reviewer option
    [@ocaml.doc
      "The reviewer assigned to take action on the document review request.\n"];
  status: review_status option
    [@ocaml.doc "The current status of the document review request.\n"];
  reviewed_time: date_time option
    [@ocaml.doc
      "The time that the reviewer took action on the document review request.\n"]}
[@@ocaml.doc "Information about the result of a document review request.\n"]
type nonrec review_information_list = review_information list[@@ocaml.doc ""]
type nonrec category = string[@@ocaml.doc ""]
type nonrec category_list = category list[@@ocaml.doc ""]
type nonrec category_enum_list = category list[@@ocaml.doc ""]
type nonrec document_description =
  {
  category_enum: category_enum_list option
    [@ocaml.doc "The value that identifies a document's category.\n"];
  category: category_list option
    [@ocaml.doc
      "The classification of a document to help you identify and categorize its use.\n"];
  review_status: review_status option
    [@ocaml.doc "The current status of the review.\n"];
  pending_review_version: document_version option
    [@ocaml.doc
      "The version of the document that is currently under review.\n"];
  approved_version: document_version option
    [@ocaml.doc
      "The version of the document currently approved for use in the organization.\n"];
  review_information: review_information_list option
    [@ocaml.doc "Details about the review of a document.\n"];
  author: document_author option
    [@ocaml.doc "The user in your organization who created the document.\n"];
  requires: document_requires_list option
    [@ocaml.doc
      "A list of SSM documents required by a document. For example, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document.\n"];
  attachments_information: attachment_information_list option
    [@ocaml.doc
      "Details about the document attachments, including names, locations, sizes, and so on.\n"];
  tags: tag_list option
    [@ocaml.doc
      "The tags, or metadata, that have been applied to the document.\n"];
  target_type: target_type option
    [@ocaml.doc
      "The target type which defines the kinds of resources the document can run on. For example, [/AWS::EC2::Instance]. For a list of valid resource types, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}. \n"];
  document_format: document_format option
    [@ocaml.doc "The document format, either JSON or YAML.\n"];
  default_version: document_version option
    [@ocaml.doc "The default version.\n"];
  latest_version: document_version option
    [@ocaml.doc "The latest version of the document.\n"];
  schema_version: document_schema_version option
    [@ocaml.doc "The schema version.\n"];
  document_type: document_type option [@ocaml.doc "The type of document.\n"];
  platform_types: platform_type_list option
    [@ocaml.doc
      "The list of operating system (OS) platforms compatible with this SSM document. \n"];
  parameters: document_parameter_list option
    [@ocaml.doc "A description of the parameters for a document.\n"];
  description: description_in_document option
    [@ocaml.doc "A description of the document. \n"];
  document_version: document_version option
    [@ocaml.doc "The document version.\n"];
  status_information: document_status_information option
    [@ocaml.doc
      "A message returned by Amazon Web Services Systems Manager that explains the [Status] value. For example, a [Failed] status might be explained by the [StatusInformation] message, \"The specified S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct.\"\n"];
  status: document_status option
    [@ocaml.doc "The status of the SSM document.\n"];
  created_date: date_time option
    [@ocaml.doc "The date when the document was created.\n"];
  owner: document_owner option
    [@ocaml.doc "The Amazon Web Services user that created the document.\n"];
  version_name: document_version_name option
    [@ocaml.doc
      "The version of the artifact associated with the document.\n"];
  display_name: document_display_name option
    [@ocaml.doc
      "The friendly name of the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].\n"];
  name: document_ar_n option [@ocaml.doc "The name of the SSM document.\n"];
  hash_type: document_hash_type option
    [@ocaml.doc
      "The hash type of the document. Valid values include [Sha256] or [Sha1].\n\n  Sha1 hashes have been deprecated.\n  \n   "];
  hash: document_hash option
    [@ocaml.doc
      "The Sha256 or Sha1 hash created by the system when the document was created. \n\n  Sha1 hashes have been deprecated.\n  \n   "];
  sha1: document_sha1 option
    [@ocaml.doc
      "The SHA1 hash of the document, which you can use for verification.\n"]}
[@@ocaml.doc
  "Describes an Amazon Web Services Systems Manager document (SSM document). \n"]
type nonrec update_document_result =
  {
  document_description: document_description option
    [@ocaml.doc "A description of the document that was updated.\n"]}
[@@ocaml.doc ""]
type nonrec document_content = string[@@ocaml.doc ""]
type nonrec attachments_source_key =
  | AttachmentReference [@ocaml.doc ""]
  | S3FileUrl [@ocaml.doc ""]
  | SourceUrl [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attachments_source_value = string[@@ocaml.doc ""]
type nonrec attachments_source_values = attachments_source_value list
[@@ocaml.doc ""]
type nonrec attachment_identifier = string[@@ocaml.doc ""]
type nonrec attachments_source =
  {
  name: attachment_identifier option
    [@ocaml.doc "The name of the document attachment file.\n"];
  values: attachments_source_values option
    [@ocaml.doc
      "The value of a key-value pair that identifies the location of an attachment to a document. The format for {b Value} depends on the type of key you specify.\n\n {ul\n       {-  For the key {i SourceUrl}, the value is an S3 bucket location. For example:\n           \n             [\"Values\": \\[ \"s3://amzn-s3-demo-bucket/my-prefix\" \\]] \n            \n             }\n       {-  For the key {i S3FileUrl}, the value is a file in an S3 bucket. For example:\n           \n             [\"Values\": \\[ \"s3://amzn-s3-demo-bucket/my-prefix/my-file.py\" \\]] \n            \n             }\n       {-  For the key {i AttachmentReference}, the value is constructed from the name of another SSM document in your account, a version number of that document, and a file attached to that document version that you want to reuse. For example:\n           \n             [\"Values\": \\[ \"MyOtherDocument/3/my-other-file.py\" \\]] \n            \n             However, if the SSM document is shared with you from another account, the full SSM document ARN must be specified instead of the document name only. For example:\n             \n               [\"Values\": \\[\n      \"arn:aws:ssm:us-east-2:111122223333:document/OtherAccountDocument/3/their-file.py\"\n      \\]] \n              \n               }\n       }\n  "];
  key: attachments_source_key option
    [@ocaml.doc
      "The key of a key-value pair that identifies the location of an attachment to a document.\n"]}
[@@ocaml.doc
  "Identifying information about a document attachment, including the file name and a key-value pair that identifies the location of an attachment to a document.\n"]
type nonrec attachments_source_list = attachments_source list[@@ocaml.doc ""]
type nonrec document_name = string[@@ocaml.doc ""]
type nonrec update_document_request =
  {
  target_type: target_type option
    [@ocaml.doc "Specify a new target type for the document.\n"];
  document_format: document_format option
    [@ocaml.doc
      "Specify the document format for the new document version. Systems Manager supports JSON and YAML documents. JSON is the default format.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of the document that you want to update. Currently, Systems Manager supports updating only the latest version of the document. You can specify the version number of the latest version or use the [$LATEST] variable.\n\n  If you change a document version for a State Manager association, Systems Manager immediately runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.\n  \n   "];
  version_name: document_version_name option
    [@ocaml.doc
      "An optional field specifying the version of the artifact you are updating with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.\n"];
  display_name: document_display_name option
    [@ocaml.doc
      "The friendly name of the SSM document that you want to update. This value can differ for each version of the document. If you don't specify a value for this parameter in your request, the existing value is applied to the new document version.\n"];
  name: document_name
    [@ocaml.doc "The name of the SSM document that you want to update.\n"];
  attachments: attachments_source_list option
    [@ocaml.doc
      "A list of key-value pairs that describe attachments to a version of a document.\n"];
  content: document_content [@ocaml.doc "A valid JSON or YAML string.\n"]}
[@@ocaml.doc ""]
type nonrec update_document_metadata_response = unit[@@ocaml.doc ""]
type nonrec document_review_action =
  | Reject [@ocaml.doc ""]
  | Approve [@ocaml.doc ""]
  | UpdateReview [@ocaml.doc ""]
  | SendForReview [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_review_comment_type =
  | Comment [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_review_comment = string[@@ocaml.doc ""]
type nonrec document_review_comment_source =
  {
  content: document_review_comment option
    [@ocaml.doc
      "The content of a comment entered by a user who requests a review of a new document version, or who reviews the new version.\n"];
  type_: document_review_comment_type option
    [@ocaml.doc
      "The type of information added to a review request. Currently, only the value [Comment] is supported.\n"]}
[@@ocaml.doc
  "Information about comments added to a document review request.\n"]
type nonrec document_review_comment_list =
  document_review_comment_source list[@@ocaml.doc ""]
type nonrec document_reviews =
  {
  comment: document_review_comment_list option
    [@ocaml.doc
      "A comment entered by a user in your organization about the document review request.\n"];
  action: document_review_action
    [@ocaml.doc
      "The action to take on a document approval review request.\n"]}
[@@ocaml.doc "Information about a document approval review.\n"]
type nonrec update_document_metadata_request =
  {
  document_reviews: document_reviews
    [@ocaml.doc "The change template review details to update.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of a change template in which to update approval metadata.\n"];
  name: document_name
    [@ocaml.doc
      "The name of the change template for which a version's metadata is to be updated.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_document_version =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The document version isn't valid or doesn't exist.\n"]
type nonrec invalid_document_operation =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You attempted to delete a document while it is still shared. You must stop sharing the document before you can delete it.\n"]
type nonrec invalid_document =
  {
  message: string_ option
    [@ocaml.doc
      "The SSM document doesn't exist or the document isn't available to the user. This exception can be issued by various API operations. \n"]}
[@@ocaml.doc "The specified SSM document doesn't exist.\n"]
type nonrec document_default_version_description =
  {
  default_version_name: document_version_name option
    [@ocaml.doc
      "The default version of the artifact associated with the document.\n"];
  default_version: document_version option
    [@ocaml.doc "The default version of the document.\n"];
  name: document_name option [@ocaml.doc "The name of the document.\n"]}
[@@ocaml.doc "A default version of a document.\n"]
type nonrec update_document_default_version_result =
  {
  description: document_default_version_description option
    [@ocaml.doc
      "The description of a custom document that you want to set as the default version.\n"]}
[@@ocaml.doc ""]
type nonrec document_version_number = string[@@ocaml.doc ""]
type nonrec update_document_default_version_request =
  {
  document_version: document_version_number
    [@ocaml.doc
      "The version of a custom document that you want to set as the default version.\n"];
  name: document_name
    [@ocaml.doc
      "The name of a custom document that you want to set as the default version.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_document_schema_version =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The version of the document schema isn't supported.\n"]
type nonrec max_document_size_exceeded =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The size limit of a document is 64 KB.\n"]
type nonrec invalid_document_content =
  {
  message: string_ option
    [@ocaml.doc "A description of the validation error.\n"]}[@@ocaml.doc
                                                              "The content for the document isn't valid.\n"]
type nonrec duplicate_document_version_name =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The version name has already been used in this document. Specify a different version name, and then try again.\n"]
type nonrec duplicate_document_content =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The content of the association document matches another document. Change the content of the document and try again.\n"]
type nonrec document_version_limit_exceeded =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The document has too many versions. Delete one or more document versions and try again.\n"]
type nonrec instance_id = string[@@ocaml.doc ""]
type nonrec association_version = string[@@ocaml.doc ""]
type nonrec association_status_name =
  | Failed [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec status_message = string[@@ocaml.doc ""]
type nonrec status_additional_info = string[@@ocaml.doc ""]
type nonrec association_status =
  {
  additional_info: status_additional_info option
    [@ocaml.doc "A user-defined string.\n"];
  message: status_message [@ocaml.doc "The reason for the status.\n"];
  name: association_status_name [@ocaml.doc "The status.\n"];
  date: date_time [@ocaml.doc "The date when the status changed.\n"]}
[@@ocaml.doc "Describes an association status.\n"]
type nonrec status_name = string[@@ocaml.doc ""]
type nonrec instance_count = int[@@ocaml.doc ""]
type nonrec association_status_aggregated_count =
  (status_name * instance_count) list[@@ocaml.doc ""]
type nonrec association_overview =
  {
  association_status_aggregated_count:
    association_status_aggregated_count option
    [@ocaml.doc
      "Returns the number of targets for the association status. For example, if you created an association with two managed nodes, and one of them was successful, this would return the count of managed nodes by status.\n"];
  detailed_status: status_name option
    [@ocaml.doc "A detailed status of the association.\n"];
  status: status_name option
    [@ocaml.doc
      "The status of the association. Status can be: Pending, Success, or Failed.\n"]}
[@@ocaml.doc "Information about the association.\n"]
type nonrec automation_target_parameter_name = string[@@ocaml.doc ""]
type nonrec association_id = string[@@ocaml.doc ""]
type nonrec schedule_expression = string[@@ocaml.doc ""]
type nonrec s3_output_location =
  {
  output_s3_key_prefix: s3_key_prefix option
    [@ocaml.doc "The S3 bucket subfolder.\n"];
  output_s3_bucket_name: s3_bucket_name option
    [@ocaml.doc "The name of the S3 bucket.\n"];
  output_s3_region: s3_region option
    [@ocaml.doc "The Amazon Web Services Region of the S3 bucket.\n"]}
[@@ocaml.doc
  "An S3 bucket where you want to store the results of this request.\n"]
type nonrec instance_association_output_location =
  {
  s3_location: s3_output_location option
    [@ocaml.doc
      "An S3 bucket where you want to store the results of this request.\n"]}
[@@ocaml.doc
  "An S3 bucket where you want to store the results of this request.\n\n For the minimal permissions required to enable Amazon S3 output for an association, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-associations-creating.html#state-manager-associations-console}Create an association (console)} in the {i Systems Manager User Guide}. \n "]
type nonrec association_name = string[@@ocaml.doc ""]
type nonrec association_compliance_severity =
  | Unspecified [@ocaml.doc ""]
  | Low [@ocaml.doc ""]
  | Medium [@ocaml.doc ""]
  | High [@ocaml.doc ""]
  | Critical [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec association_sync_compliance =
  | Manual [@ocaml.doc ""]
  | Auto [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec apply_only_at_cron_interval = bool[@@ocaml.doc ""]
type nonrec calendar_name_or_ar_n = string[@@ocaml.doc ""]
type nonrec calendar_name_or_arn_list = calendar_name_or_ar_n list[@@ocaml.doc
                                                                    ""]
type nonrec account = string[@@ocaml.doc ""]
type nonrec accounts = account list[@@ocaml.doc ""]
type nonrec region = string[@@ocaml.doc ""]
type nonrec regions = region list[@@ocaml.doc ""]
type nonrec execution_role_name = string[@@ocaml.doc ""]
type nonrec exclude_account = string[@@ocaml.doc ""]
type nonrec exclude_accounts = exclude_account list[@@ocaml.doc ""]
type nonrec target_location =
  {
  targets_max_errors: max_errors option
    [@ocaml.doc
      "The maximum number of errors that are allowed before the system stops running the automation on additional targets. This [TargetsMaxErrors] parameter takes precedence over the [StartAutomationExecution:MaxErrors] parameter if both are supplied.\n"];
  targets_max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run this task in parallel. This [TargetsMaxConcurrency] takes precedence over the [StartAutomationExecution:MaxConcurrency] parameter if both are supplied.\n"];
  targets: targets option
    [@ocaml.doc
      "A list of key-value mappings to target resources. If you specify values for this data type, you must also specify a value for [TargetParameterName].\n\n This [Targets] parameter takes precedence over the [StartAutomationExecution:Targets] parameter if both are supplied.\n "];
  exclude_accounts: exclude_accounts option
    [@ocaml.doc
      "Amazon Web Services accounts or organizational units to exclude as expanded targets.\n"];
  include_child_organization_units: boolean_ option
    [@ocaml.doc
      "Indicates whether to include child organizational units (OUs) that are children of the targeted OUs. The default is [false].\n"];
  target_location_alarm_configuration: alarm_configuration option
    [@ocaml.doc ""];
  execution_role_name: execution_role_name option
    [@ocaml.doc
      "The Automation execution role used by the currently running Automation. If not specified, the default value is [AWS-SystemsManager-AutomationExecutionRole].\n"];
  target_location_max_errors: max_errors option
    [@ocaml.doc
      "The maximum number of errors allowed before the system stops queueing additional Automation executions for the currently running Automation.\n"];
  target_location_max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of Amazon Web Services Regions and Amazon Web Services accounts allowed to run the Automation concurrently.\n"];
  regions: regions option
    [@ocaml.doc
      "The Amazon Web Services Regions targeted by the current Automation execution.\n"];
  accounts: accounts option
    [@ocaml.doc
      "The Amazon Web Services accounts targeted by the current Automation execution.\n"]}
[@@ocaml.doc
  "The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the current Automation execution.\n"]
type nonrec target_locations = target_location list[@@ocaml.doc ""]
type nonrec schedule_offset = int[@@ocaml.doc ""]
type nonrec duration = int[@@ocaml.doc ""]
type nonrec target_map_value = string[@@ocaml.doc ""]
type nonrec target_map_value_list = target_map_value list[@@ocaml.doc ""]
type nonrec target_map_key = string[@@ocaml.doc ""]
type nonrec target_map = (target_map_key * target_map_value_list) list
[@@ocaml.doc ""]
type nonrec target_maps = target_map list[@@ocaml.doc ""]
type nonrec external_alarm_state =
  | ALARM [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec alarm_state_information =
  {
  state: external_alarm_state
    [@ocaml.doc "The state of your CloudWatch alarm.\n"];
  name: alarm_name [@ocaml.doc "The name of your CloudWatch alarm.\n"]}
[@@ocaml.doc "The details about the state of your CloudWatch alarm.\n"]
type nonrec alarm_state_information_list = alarm_state_information list
[@@ocaml.doc ""]
type nonrec association_description =
  {
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc
      "The CloudWatch alarm that was invoked during the association.\n"];
  alarm_configuration: alarm_configuration option [@ocaml.doc ""];
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  duration: duration option
    [@ocaml.doc
      "The number of hours that an association can run on specified targets. After the resulting cutoff time passes, associations that are currently running are cancelled, and no pending executions are started on remaining targets.\n"];
  schedule_offset: schedule_offset option
    [@ocaml.doc
      "Number of days to wait after the scheduled day to run an association.\n"];
  target_locations: target_locations option
    [@ocaml.doc
      "The combination of Amazon Web Services Regions and Amazon Web Services accounts where you want to run the association.\n"];
  calendar_names: calendar_name_or_arn_list option
    [@ocaml.doc
      "The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations are gated under. The associations only run when that change calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  apply_only_at_cron_interval: apply_only_at_cron_interval option
    [@ocaml.doc
      "By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it. This parameter isn't supported for rate expressions.\n"];
  sync_compliance: association_sync_compliance option
    [@ocaml.doc
      "The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].\n\n In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.\n \n  By default, all associations use [AUTO] mode.\n  "];
  compliance_severity: association_compliance_severity option
    [@ocaml.doc "The severity level that is assigned to the association.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.\n\n If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].\n "];
  max_errors: max_errors option
    [@ocaml.doc
      "The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.\n\n Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.\n "];
  association_name: association_name option
    [@ocaml.doc "The association name.\n"];
  last_successful_execution_date: date_time option
    [@ocaml.doc
      "The last date on which the association was successfully run.\n"];
  last_execution_date: date_time option
    [@ocaml.doc "The date on which the association was last run.\n"];
  output_location: instance_association_output_location option
    [@ocaml.doc
      "An S3 bucket where you want to store the output details of the request.\n"];
  schedule_expression: schedule_expression option
    [@ocaml.doc
      "A cron expression that specifies a schedule when the association runs.\n"];
  targets: targets option
    [@ocaml.doc "The managed nodes targeted by the request. \n"];
  association_id: association_id option [@ocaml.doc "The association ID.\n"];
  parameters: parameters option
    [@ocaml.doc "A description of the parameters for a document. \n"];
  automation_target_parameter_name: automation_target_parameter_name option
    [@ocaml.doc
      "Choose the parameter that will define how your automation will branch out. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a tool in Amazon Web Services Systems Manager.\n"];
  document_version: document_version option
    [@ocaml.doc "The document version.\n"];
  overview: association_overview option
    [@ocaml.doc "Information about the association.\n"];
  status: association_status option [@ocaml.doc "The association status.\n"];
  last_update_association_date: date_time option
    [@ocaml.doc "The date when the association was last updated.\n"];
  date: date_time option
    [@ocaml.doc "The date when the association was made.\n"];
  association_version: association_version option
    [@ocaml.doc "The association version.\n"];
  instance_id: instance_id option [@ocaml.doc "The managed node ID.\n"];
  name: document_ar_n option [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc "Describes the parameters for a document.\n"]
type nonrec update_association_status_result =
  {
  association_description: association_description option
    [@ocaml.doc "Information about the association.\n"]}[@@ocaml.doc ""]
type nonrec update_association_status_request =
  {
  association_status: association_status
    [@ocaml.doc "The association status.\n"];
  instance_id: instance_id [@ocaml.doc "The managed node ID.\n"];
  name: document_ar_n [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc ""]
type nonrec status_unchanged = unit[@@ocaml.doc ""]
type nonrec association_does_not_exist =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified association doesn't exist.\n"]
type nonrec update_association_result =
  {
  association_description: association_description option
    [@ocaml.doc "The description of the association that was updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_association_request =
  {
  alarm_configuration: alarm_configuration option [@ocaml.doc ""];
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  duration: duration option
    [@ocaml.doc
      "The number of hours the association can run before it is canceled. Duration applies to associations that are currently running, and any pending and in progress commands on all targets. If a target was taken offline for the association to run, it is made available again immediately, without a reboot. \n\n The [Duration] parameter applies only when both these conditions are true:\n \n  {ul\n        {-  The association for which you specify a duration is cancelable according to the parameters of the SSM command document or Automation runbook associated with this execution. \n            \n             }\n        {-  The command specifies the \n            {[\n             {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_UpdateAssociation.html#systemsmanager-UpdateAssociation-request-ApplyOnlyAtCronInterval}ApplyOnlyAtCronInterval} \n            ]}\n             parameter, which means that the association doesn't run immediately after it is updated, but only according to the specified schedule.\n            \n             }\n        }\n  "];
  schedule_offset: schedule_offset option
    [@ocaml.doc
      "Number of days to wait after the scheduled day to run an association. For example, if you specified a cron schedule of [cron(0 0 ? * THU#2 *)], you could specify an offset of 3 to run the association each Sunday after the second Thursday of the month. For more information about cron schedules for associations, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/reference-cron-and-rate-expressions.html}Reference: Cron and rate expressions for Systems Manager} in the {i Amazon Web Services Systems Manager User Guide}. \n\n  To use offsets, you must specify the [ApplyOnlyAtCronInterval] parameter. This option tells the system not to run an association immediately after you create it. \n  \n   "];
  target_locations: target_locations option
    [@ocaml.doc
      "A location is a combination of Amazon Web Services Regions and Amazon Web Services accounts where you want to run the association. Use this action to update an association in multiple Regions and multiple accounts.\n"];
  calendar_names: calendar_name_or_arn_list option
    [@ocaml.doc
      "The names or Amazon Resource Names (ARNs) of the Change Calendar type documents you want to gate your associations under. The associations only run when that change calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  apply_only_at_cron_interval: apply_only_at_cron_interval option
    [@ocaml.doc
      "By default, when you update an association, the system runs it immediately after it is updated and then according to the schedule you specified. Specify [true] for [ApplyOnlyAtCronInterval] if you want the association to run only according to the schedule you specified.\n\n If you chose this option when you created an association and later you edit that association or you make changes to the Automation runbook or SSM document on which that association is based, State Manager applies the association at the next specified cron interval. For example, if you chose the [Latest] version of an SSM document when you created an association and you edit the association by choosing a different document version on the Documents page, State Manager applies the association at the next specified cron interval if you previously set [ApplyOnlyAtCronInterval] to [true]. If this option wasn't selected, State Manager immediately runs the association.\n \n  For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#state-manager-about-scheduling}Understanding when associations are applied to resources} and {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#runbook-target-updates}About target updates with Automation runbooks} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n   This parameter isn't supported for rate expressions.\n   \n    You can reset this parameter. To do so, specify the [no-apply-only-at-cron-interval] parameter when you update the association from the command line. This parameter forces the association to run immediately after updating it and according to the interval specified.\n    "];
  sync_compliance: association_sync_compliance option
    [@ocaml.doc
      "The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].\n\n In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.\n \n  By default, all associations use [AUTO] mode.\n  "];
  compliance_severity: association_compliance_severity option
    [@ocaml.doc "The severity level to assign to the association.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.\n\n If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].\n "];
  max_errors: max_errors option
    [@ocaml.doc
      "The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.\n\n Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.\n "];
  automation_target_parameter_name: automation_target_parameter_name option
    [@ocaml.doc
      "Choose the parameter that will define how your automation will branch out. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a tool in Amazon Web Services Systems Manager.\n"];
  association_version: association_version option
    [@ocaml.doc
      "This parameter is provided for concurrency control purposes. You must specify the latest association version in the service. If you want to ensure that this request succeeds, either specify [$LATEST], or omit this parameter.\n"];
  association_name: association_name option
    [@ocaml.doc "The name of the association that you want to update.\n"];
  targets: targets option [@ocaml.doc "The targets of the association.\n"];
  name: document_ar_n option
    [@ocaml.doc
      "The name of the SSM Command document or Automation runbook that contains the configuration information for the managed node.\n\n You can specify Amazon Web Services-predefined documents, documents you created, or a document that is shared with you from another account.\n \n  For Systems Manager document (SSM document) that are shared with you from other Amazon Web Services accounts, you must specify the complete SSM document ARN, in the following format:\n  \n    \n   {[\n   arn:aws:ssm:{i region}:{i account-id}:document/{i document-name} \n   ]}\n    \n   \n    For example:\n    \n      [arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document] \n     \n      For Amazon Web Services-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, [AWS-ApplyPatchBaseline] or [My-Document].\n      "];
  output_location: instance_association_output_location option
    [@ocaml.doc
      "An S3 bucket where you want to store the results of this request.\n"];
  schedule_expression: schedule_expression option
    [@ocaml.doc
      "The cron expression used to schedule the association that you want to update.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The document version you want update for the association. \n\n  State Manager doesn't support running associations that use a new version of a document if that document is shared from another account. State Manager always runs the [default] version of a document if shared from another account, even though the Systems Manager console shows that a new version was processed. If you want to run an association using a new version of a document shared form another account, you must set the document version to [default].\n  \n   "];
  parameters: parameters option
    [@ocaml.doc
      "The parameters you want to update for the association. If you create a parameter using Parameter Store, a tool in Amazon Web Services Systems Manager, you can reference the parameter using [{{ssm:parameter-name}}].\n"];
  association_id: association_id
    [@ocaml.doc "The ID of the association you want to update. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec invalid_update = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The update isn't valid.\n"]
type nonrec invalid_target_maps = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "TargetMap parameter isn't valid.\n"]
type nonrec invalid_target = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The target isn't valid or doesn't exist. It might not be configured for Systems Manager or you might not have permission to perform the operation.\n"]
type nonrec invalid_schedule = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The schedule is invalid. Verify your cron or rate expression and try again.\n"]
type nonrec invalid_parameters = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You must specify values for all required parameters in the Amazon Web Services Systems Manager document (SSM document). You can only supply values to parameters defined in the SSM document.\n"]
type nonrec invalid_output_location = unit[@@ocaml.doc ""]
type nonrec invalid_association_version =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The version you specified isn't valid. Use ListAssociationVersions to view all versions of an association according to the association ID. Or, use the [$LATEST] parameter to view the latest version of the association.\n"]
type nonrec association_version_limit_exceeded =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You have reached the maximum number versions allowed for an association. Each association has a limit of 1,000 versions. \n"]
type nonrec unsupported_platform_type =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The document doesn't support the platform type of the given managed node IDs. For example, you sent an document for a Windows managed node to a Linux node.\n"]
type nonrec unsupported_parameter_type =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The parameter type isn't supported.\n"]
type nonrec unsupported_operation_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "This operation is not supported for the current account. You must first enable the Systems Manager integrated experience in your account.\n"]
type nonrec unsupported_operating_system =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The operating systems you specified isn't supported, or the operation isn't supported for the operating system.\n"]
type nonrec unsupported_inventory_schema_version_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Inventory item type schema version has to match supported versions in the service. Check output of GetInventorySchema to see the available schema version for each type.\n"]
type nonrec inventory_item_type_name = string[@@ocaml.doc ""]
type nonrec unsupported_inventory_item_context_exception =
  {
  message: string_ option [@ocaml.doc ""];
  type_name: inventory_item_type_name option [@ocaml.doc ""]}[@@ocaml.doc
                                                               "The [Context] attribute that you specified for the [InventoryItem] isn't allowed for this inventory type. You can only use the [Context] attribute with inventory types like [AWS:ComplianceItem].\n"]
type nonrec unsupported_feature_required_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Patching for applications released by Microsoft is only available on EC2 instances and advanced instances. To patch applications released by Microsoft on on-premises servers and VMs, you must enable advanced instances. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances-advanced.html}Turning on the advanced-instances tier} in the {i Amazon Web Services Systems Manager User Guide}.\n"]
type nonrec unsupported_calendar_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The calendar entry contained in the specified SSM document isn't supported.\n"]
type nonrec parameter_label = string[@@ocaml.doc ""]
type nonrec parameter_label_list = parameter_label list[@@ocaml.doc ""]
type nonrec unlabel_parameter_version_result =
  {
  invalid_labels: parameter_label_list option
    [@ocaml.doc
      "The labels that aren't attached to the given parameter version.\n"];
  removed_labels: parameter_label_list option
    [@ocaml.doc "A list of all labels deleted from the parameter.\n"]}
[@@ocaml.doc ""]
type nonrec ps_parameter_name = string[@@ocaml.doc ""]
type nonrec ps_parameter_version = int[@@ocaml.doc ""]
type nonrec unlabel_parameter_version_request =
  {
  labels: parameter_label_list
    [@ocaml.doc
      "One or more labels to delete from the specified parameter version.\n"];
  parameter_version: ps_parameter_version
    [@ocaml.doc
      "The specific version of the parameter which you want to delete one or more labels from. If it isn't present, the call will fail.\n"];
  name: ps_parameter_name
    [@ocaml.doc
      "The name of the parameter from which you want to delete one or more labels.\n\n  You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec parameter_version_not_found =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified parameter version wasn't found. Verify the parameter name and version, and try again.\n"]
type nonrec parameter_not_found = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The parameter couldn't be found. Verify the name and try again.\n\n  For the [DeleteParameter] and [GetParameter] actions, if the specified parameter doesn't exist, the [ParameterNotFound] exception is {i not} recorded in CloudTrail event logs.\n  \n   "]
type nonrec uui_d = string[@@ocaml.doc ""]
type nonrec total_size_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The size of inventory data has exceeded the total size limit for the resource.\n"]
type nonrec total_count = int[@@ocaml.doc ""]
type nonrec too_many_tags_error = unit[@@ocaml.doc ""]
type nonrec token_value = string[@@ocaml.doc ""]
type nonrec throttling_exception =
  {
  service_code: string_ option
    [@ocaml.doc
      "The code for the Amazon Web Services service that owns the quota.\n"];
  quota_code: string_ option
    [@ocaml.doc
      "The quota code recognized by the Amazon Web Services Service Quotas service.\n"];
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "The request or operation couldn't be performed because the service is throttling requests.\n"]
type nonrec session_id = string[@@ocaml.doc ""]
type nonrec terminate_session_response =
  {
  session_id: session_id option
    [@ocaml.doc "The ID of the session that has been terminated.\n"]}
[@@ocaml.doc ""]
type nonrec terminate_session_request =
  {
  session_id: session_id [@ocaml.doc "The ID of the session to terminate.\n"]}
[@@ocaml.doc ""]
type nonrec target_preview =
  {
  target_type: string_ option
    [@ocaml.doc
      "A type of resource that was included in the execution preview.\n"];
  count: integer option
    [@ocaml.doc
      "The number of resources of a certain type included in an execution preview.\n"]}
[@@ocaml.doc
  "Information about the resources that would be included in the actual runbook execution, if it were to be run.\n"]
type nonrec target_preview_list = target_preview list[@@ocaml.doc ""]
type nonrec target_parameter_list = parameter_value list[@@ocaml.doc ""]
type nonrec target_not_connected = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified target managed node for the session isn't fully configured for use with Session Manager. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-getting-started.html}Setting up Session Manager} in the {i Amazon Web Services Systems Manager User Guide}. This error is also returned if you attempt to start a session on a managed node that is located in a different account or Region\n"]
type nonrec target_locations_ur_l = string[@@ocaml.doc ""]
type nonrec target_in_use_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You specified the [Safe] option for the DeregisterTargetFromMaintenanceWindow operation, but the target is still referenced in a task.\n"]
type nonrec target_count = int[@@ocaml.doc ""]
type nonrec sub_type_count_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The sub-type count exceeded the limit for the inventory type.\n"]
type nonrec string_list = string_ list[@@ocaml.doc ""]
type nonrec string_date_time = string[@@ocaml.doc ""]
type nonrec string1to256 = string[@@ocaml.doc ""]
type nonrec stream_url = string[@@ocaml.doc ""]
type nonrec stop_type =
  | CANCEL [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stop_automation_execution_result = unit[@@ocaml.doc ""]
type nonrec automation_execution_id = string[@@ocaml.doc ""]
type nonrec stop_automation_execution_request =
  {
  type_: stop_type option
    [@ocaml.doc
      "The stop request type. Valid types include the following: Cancel and Complete. The default type is Cancel.\n"];
  automation_execution_id: automation_execution_id
    [@ocaml.doc "The execution ID of the Automation to stop.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec invalid_automation_status_update_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified update status operation isn't valid.\n"]
type nonrec automation_execution_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "There is no automation execution information for the requested automation execution ID.\n"]
type nonrec impact_type =
  | UNDETERMINED [@ocaml.doc ""]
  | NON_MUTATING [@ocaml.doc ""]
  | MUTATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec step_preview_map = (impact_type * integer) list[@@ocaml.doc ""]
type nonrec automation_action_name = string[@@ocaml.doc ""]
type nonrec long = int[@@ocaml.doc ""]
type nonrec automation_execution_status =
  | EXITED [@ocaml.doc ""]
  | COMPLETED_WITH_FAILURE [@ocaml.doc ""]
  | COMPLETED_WITH_SUCCESS [@ocaml.doc ""]
  | CHANGE_CALENDAR_OVERRIDE_REJECTED [@ocaml.doc ""]
  | CHANGE_CALENDAR_OVERRIDE_APPROVED [@ocaml.doc ""]
  | PENDING_CHANGE_CALENDAR_OVERRIDE [@ocaml.doc ""]
  | RUNBOOK_INPROGRESS [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | PENDING_APPROVAL [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | TIMEDOUT [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | WAITING [@ocaml.doc ""]
  | INPROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec normal_string_map = (string_ * string_) list[@@ocaml.doc ""]
type nonrec failure_details =
  {
  details: automation_parameter_map option
    [@ocaml.doc "Detailed information about the Automation step failure.\n"];
  failure_type: string_ option
    [@ocaml.doc
      "The type of Automation failure. Failure types include the following: Action, Permission, Throttling, Verification, Internal.\n"];
  failure_stage: string_ option
    [@ocaml.doc
      "The stage of the Automation execution when the failure occurred. The stages include the following: InputValidation, PreVerification, Invocation, PostVerification.\n"]}
[@@ocaml.doc "Information about an Automation failure.\n"]
type nonrec parent_step_details =
  {
  iterator_value: string_ option
    [@ocaml.doc "The current value of the specified iterator in the loop.\n"];
  iteration: integer option
    [@ocaml.doc
      "The current repetition of the loop represented by an integer.\n"];
  action: automation_action_name option
    [@ocaml.doc "The name of the automation action.\n"];
  step_name: string_ option [@ocaml.doc "The name of the step.\n"];
  step_execution_id: string_ option
    [@ocaml.doc "The unique ID of a step execution.\n"]}[@@ocaml.doc
                                                          "A detailed status of the parent step.\n"]
type nonrec step_execution =
  {
  parent_step_details: parent_step_details option
    [@ocaml.doc "Information about the parent step.\n"];
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc
      "The CloudWatch alarms that were invoked by the automation.\n"];
  target_location: target_location option
    [@ocaml.doc
      "The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the current Automation execution.\n"];
  targets: targets option
    [@ocaml.doc "The targets for the step execution.\n"];
  valid_next_steps: valid_next_step_list option
    [@ocaml.doc
      "Strategies used when step fails, we support Continue and Abort. Abort will fail the automation when the step fails. Continue will ignore the failure of current step and allow automation to run the next step. With conditional branching, we add step:stepName to support the automation to go to another specific step.\n"];
  is_critical: boolean_ option
    [@ocaml.doc
      "The flag which can be used to help decide whether the failure of current step leads to the Automation failure.\n"];
  next_step: string_ option
    [@ocaml.doc "The next step after the step succeeds.\n"];
  is_end: boolean_ option
    [@ocaml.doc
      "The flag which can be used to end automation no matter whether the step succeeds or fails.\n"];
  overridden_parameters: automation_parameter_map option
    [@ocaml.doc
      "A user-specified list of parameters to override when running a step.\n"];
  step_execution_id: string_ option
    [@ocaml.doc "The unique ID of a step execution.\n"];
  failure_details: failure_details option
    [@ocaml.doc "Information about the Automation failure.\n"];
  failure_message: string_ option
    [@ocaml.doc
      "If a step failed, this message explains why the execution failed.\n"];
  response: string_ option
    [@ocaml.doc
      "A message associated with the response code for an execution.\n"];
  outputs: automation_parameter_map option
    [@ocaml.doc "Returned values from the execution of the step.\n"];
  inputs: normal_string_map option
    [@ocaml.doc
      "Fully-resolved values passed into the step before execution.\n"];
  response_code: string_ option
    [@ocaml.doc "The response code returned by the execution of the step.\n"];
  step_status: automation_execution_status option
    [@ocaml.doc "The execution status for this step.\n"];
  execution_end_time: date_time option
    [@ocaml.doc
      "If a step has finished execution, this contains the time the execution ended. If the step hasn't yet concluded, this field isn't populated.\n"];
  execution_start_time: date_time option
    [@ocaml.doc
      "If a step has begun execution, this contains the time the step started. If the step is in Pending status, this field isn't populated.\n"];
  max_attempts: integer option
    [@ocaml.doc
      "The maximum number of tries to run the action of the step. The default value is [1].\n"];
  on_failure: string_ option
    [@ocaml.doc
      "The action to take if the step fails. The default value is [Abort].\n"];
  timeout_seconds: long option
    [@ocaml.doc "The timeout seconds of the step.\n"];
  action: automation_action_name option
    [@ocaml.doc
      "The action this step performs. The action determines the behavior of the step.\n"];
  step_name: string_ option [@ocaml.doc "The name of this execution step.\n"]}
[@@ocaml.doc
  "Detailed information about an the execution state of an Automation step.\n"]
type nonrec step_execution_list = step_execution list[@@ocaml.doc ""]
type nonrec step_execution_filter_value = string[@@ocaml.doc ""]
type nonrec step_execution_filter_value_list =
  step_execution_filter_value list[@@ocaml.doc ""]
type nonrec step_execution_filter_key =
  | PARENT_STEP_ITERATOR_VALUE [@ocaml.doc ""]
  | PARENT_STEP_ITERATION [@ocaml.doc ""]
  | PARENT_STEP_EXECUTION_ID [@ocaml.doc ""]
  | ACTION [@ocaml.doc ""]
  | STEP_NAME [@ocaml.doc ""]
  | STEP_EXECUTION_ID [@ocaml.doc ""]
  | STEP_EXECUTION_STATUS [@ocaml.doc ""]
  | START_TIME_AFTER [@ocaml.doc ""]
  | START_TIME_BEFORE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec step_execution_filter =
  {
  values: step_execution_filter_value_list
    [@ocaml.doc "The values of the filter key.\n"];
  key: step_execution_filter_key
    [@ocaml.doc "One or more keys to limit the results.\n"]}[@@ocaml.doc
                                                              "A filter to limit the amount of step execution information returned by the call.\n"]
type nonrec step_execution_filter_list = step_execution_filter list[@@ocaml.doc
                                                                    ""]
type nonrec status_details = string[@@ocaml.doc ""]
type nonrec start_session_response =
  {
  stream_url: stream_url option
    [@ocaml.doc
      "A URL back to SSM Agent on the managed node that the Session Manager client uses to send commands and receive output from the node. Format: \n{[\nwss://ssmmessages.{b region}.amazonaws.com/v1/data-channel/{b session-id}?stream=(input|output)\n]}\n \n\n  {b region} represents the Region identifier for an Amazon Web Services Region supported by Amazon Web Services Systems Manager, such as [us-east-2] for the US East (Ohio) Region. For a list of supported {b region} values, see the {b Region} column in {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region}Systems Manager service endpoints} in the {i Amazon Web Services General Reference}.\n \n   {b session-id} represents the ID of a Session Manager session, such as [1a2b3c4dEXAMPLE].\n  "];
  token_value: token_value option
    [@ocaml.doc
      "An encrypted token value containing session and caller information. This token is used to authenticate the connection to the managed node, and is valid only long enough to ensure the connection is successful. Never share your session's token.\n"];
  session_id: session_id option [@ocaml.doc "The ID of the session.\n"]}
[@@ocaml.doc ""]
type nonrec session_target = string[@@ocaml.doc ""]
type nonrec session_reason = string[@@ocaml.doc ""]
type nonrec session_manager_parameter_value = string[@@ocaml.doc ""]
type nonrec session_manager_parameter_value_list =
  session_manager_parameter_value list[@@ocaml.doc ""]
type nonrec session_manager_parameter_name = string[@@ocaml.doc ""]
type nonrec session_manager_parameters =
  (session_manager_parameter_name * session_manager_parameter_value_list)
    list[@@ocaml.doc ""]
type nonrec start_session_request =
  {
  parameters: session_manager_parameters option
    [@ocaml.doc
      "The values you want to specify for the parameters defined in the Session document. For more information about these parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-create-preferences-cli.html}Create a Session Manager preferences document} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  reason: session_reason option
    [@ocaml.doc
      "The reason for connecting to the instance. This value is included in the details for the Amazon CloudWatch Events event created when you start the session.\n"];
  document_name: document_ar_n option
    [@ocaml.doc
      "The name of the SSM document you want to use to define the type of session, input parameters, or preferences for the session. For example, [SSM-SessionManagerRunShell]. You can call the [GetDocument] API to verify the document exists before attempting to start a session. If no document name is provided, a shell to the managed node is launched by default. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-sessions-start.html}Start a session} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  target: session_target
    [@ocaml.doc "The managed node to connect to for the session.\n"]}
[@@ocaml.doc ""]
type nonrec execution_preview_id = string[@@ocaml.doc ""]
type nonrec start_execution_preview_response =
  {
  execution_preview_id: execution_preview_id option
    [@ocaml.doc "The ID of the execution preview generated by the system.\n"]}
[@@ocaml.doc ""]
type nonrec automation_execution_inputs =
  {
  target_locations_ur_l: target_locations_ur_l option
    [@ocaml.doc
      "A publicly accessible URL for a file that contains the [TargetLocations] body. Currently, only files in presigned Amazon S3 buckets are supported.\n"];
  target_locations: target_locations option
    [@ocaml.doc
      "Information about the Amazon Web Services Regions and Amazon Web Services accounts targeted by the Automation execution preview operation.\n"];
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  targets: targets option
    [@ocaml.doc
      "Information about the resources that would be included in the actual runbook execution, if it were to be run. Both Targets and TargetMaps can't be specified together.\n"];
  target_parameter_name: automation_parameter_key option
    [@ocaml.doc
      "The name of the parameter used as the target resource for the rate-controlled execution. Required if you specify targets.\n"];
  parameters: automation_parameter_map option
    [@ocaml.doc
      "Information about parameters that can be specified for the preview operation. \n"]}
[@@ocaml.doc
  "Information about the optional inputs that can be specified for an automation execution preview.\n"]
type nonrec execution_inputs =
  | Automation of automation_execution_inputs
  [@ocaml.doc
    "Information about the optional inputs that can be specified for an automation execution preview.\n"]
[@@ocaml.doc "Information about the inputs for an execution preview.\n"]
type nonrec start_execution_preview_request =
  {
  execution_inputs: execution_inputs option
    [@ocaml.doc
      "Information about the inputs that can be specified for the preview operation. \n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of the Automation runbook to run. The default value is [$DEFAULT].\n"];
  document_name: document_name
    [@ocaml.doc
      "The name of the Automation runbook to run. The result of the execution preview indicates what the impact would be of running this runbook.\n"]}
[@@ocaml.doc ""]
type nonrec start_change_request_execution_result =
  {
  automation_execution_id: automation_execution_id option
    [@ocaml.doc
      "The unique ID of a runbook workflow operation. (A runbook workflow is a type of Automation operation.) \n"]}
[@@ocaml.doc ""]
type nonrec change_request_name = string[@@ocaml.doc ""]
type nonrec idempotency_token = string[@@ocaml.doc ""]
type nonrec runbook =
  {
  target_locations: target_locations option
    [@ocaml.doc
      "Information about the Amazon Web Services Regions and Amazon Web Services accounts targeted by the current Runbook operation.\n"];
  max_errors: max_errors option
    [@ocaml.doc
      "The [MaxErrors] value specified by the user when the execution started, indicating the maximum number of errors that can occur during the operation before the updates are stopped or rolled back.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The [MaxConcurrency] value specified by the user when the operation started, indicating the maximum number of resources that the runbook operation can run on at the same time.\n"];
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of runbook parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  targets: targets option
    [@ocaml.doc
      "A key-value mapping to target resources that the runbook operation performs tasks on. Required if you specify [TargetParameterName].\n"];
  target_parameter_name: automation_parameter_key option
    [@ocaml.doc
      "The name of the parameter used as the target resource for the rate-controlled runbook workflow. Required if you specify [Targets]. \n"];
  parameters: automation_parameter_map option
    [@ocaml.doc
      "The key-value map of execution parameters, which were supplied when calling [StartChangeRequestExecution].\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of the Automation runbook used in a runbook workflow.\n"];
  document_name: document_ar_n
    [@ocaml.doc
      "The name of the Automation runbook used in a runbook workflow.\n"]}
[@@ocaml.doc
  "Information about an Automation runbook used in a runbook workflow in Change Manager.\n\n  The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.\n  \n   "]
type nonrec runbooks = runbook list[@@ocaml.doc ""]
type nonrec change_details_value = string[@@ocaml.doc ""]
type nonrec start_change_request_execution_request =
  {
  change_details: change_details_value option
    [@ocaml.doc
      "User-provided details about the change. If no details are provided, content specified in the {b Template information} section of the associated change template is added.\n"];
  scheduled_end_time: date_time option
    [@ocaml.doc
      "The time that the requester expects the runbook workflow related to the change request to complete. The time is an estimate only that the requester provides for reviewers.\n"];
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. You can specify a maximum of five tags for a change request. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a change request to identify an environment or target Amazon Web Services Region. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=Environment,Value=Production] \n           \n            }\n       {-   [Key=Region,Value=us-east-2] \n           \n            }\n       }\n    The [Array Members] maximum value is reported as 1000. This number includes capacity reserved for internal operations. When calling the [StartChangeRequestExecution] action, you can specify a maximum of 5 tags. You can, however, use the [AddTagsToResource] action to add up to a total of 50 tags to an existing change request configuration.\n    \n     "];
  runbooks: runbooks
    [@ocaml.doc
      "Information about the Automation runbooks that are run during the runbook workflow.\n\n  The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.\n  \n   "];
  auto_approve: boolean_ option
    [@ocaml.doc
      "Indicates whether the change request can be approved automatically without the need for manual approvals.\n\n If [AutoApprovable] is enabled in a change template, then setting [AutoApprove] to [true] in [StartChangeRequestExecution] creates a change request that bypasses approver review.\n \n   Change Calendar restrictions are not bypassed in this scenario. If the state of an associated calendar is [CLOSED], change freeze approvers must still grant permission for this change request to run. If they don't, the change won't be processed until the calendar state is again [OPEN]. \n   \n    "];
  client_token: idempotency_token option
    [@ocaml.doc
      "The user-provided idempotency token. The token must be unique, is case insensitive, enforces the UUID format, and can't be reused.\n"];
  change_request_name: change_request_name option
    [@ocaml.doc
      "The name of the change request associated with the runbook workflow to be run.\n"];
  parameters: automation_parameter_map option
    [@ocaml.doc
      "A key-value map of parameters that match the declared parameters in the change template document.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of the change template document to run during the runbook workflow.\n"];
  document_name: document_ar_n
    [@ocaml.doc
      "The name of the change template document to run during the runbook workflow.\n"];
  scheduled_time: date_time option
    [@ocaml.doc
      "The date and time specified in the change request to run the Automation runbooks.\n\n  The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec invalid_automation_execution_parameters_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The supplied parameters for invoking the specified Automation runbook are incorrect. For example, they may not match the set of parameters permitted for the specified Automation document.\n"]
type nonrec idempotent_parameter_mismatch =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Error returned when an idempotent operation is retried and the parameters don't match the original call to the API with the same idempotency token. \n"]
type nonrec automation_execution_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The number of simultaneously running Automation executions exceeded the allowable limit.\n"]
type nonrec automation_definition_version_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "An Automation runbook with the specified name and version couldn't be found.\n"]
type nonrec automation_definition_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "An Automation runbook with the specified name couldn't be found.\n"]
type nonrec automation_definition_not_approved_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Indicates that the Change Manager change template used in the change request was rejected or is still in a pending state.\n"]
type nonrec start_automation_execution_result =
  {
  automation_execution_id: automation_execution_id option
    [@ocaml.doc "The unique ID of a newly scheduled automation execution.\n"]}
[@@ocaml.doc ""]
type nonrec execution_mode =
  | Interactive [@ocaml.doc ""]
  | Auto [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec start_automation_execution_request =
  {
  target_locations_ur_l: target_locations_ur_l option
    [@ocaml.doc
      "Specify a publicly accessible URL for a file that contains the [TargetLocations] body. Currently, only files in presigned Amazon S3 buckets are supported. \n"];
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The CloudWatch alarm you want to apply to your automation.\n"];
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. You can specify a maximum of five tags for an automation. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an automation to identify an environment or operating system. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=environment,Value=test] \n           \n            }\n       {-   [Key=OS,Value=Windows] \n           \n            }\n       }\n    The [Array Members] maximum value is reported as 1000. This number includes capacity reserved for internal operations. When calling the [StartAutomationExecution] action, you can specify a maximum of 5 tags. You can, however, use the [AddTagsToResource] action to add up to a total of 50 tags to an existing automation configuration.\n    \n     "];
  target_locations: target_locations option
    [@ocaml.doc
      "A location is a combination of Amazon Web Services Regions and/or Amazon Web Services accounts where you want to run the automation. Use this operation to start an automation in multiple Amazon Web Services Regions and multiple Amazon Web Services accounts. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html}Running automations in multiple Amazon Web Services Regions and accounts} in the {i Amazon Web Services Systems Manager User Guide}. \n"];
  max_errors: max_errors option
    [@ocaml.doc
      "The number of errors that are allowed before the system stops running the automation on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops running the automation when the fourth error is received. If you specify 0, then the system stops running the automation on additional targets after the first error result is returned. If you run an automation on 50 resources and set max-errors to 10%, then the system stops running the automation on additional targets when the sixth error is received.\n\n Executions that are already running an automation when max-errors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set max-concurrency to 1 so the executions proceed one at a time.\n \n  If this parameter and the [TargetLocation:TargetsMaxErrors] parameter are both supplied, [TargetLocation:TargetsMaxErrors] takes precedence.\n  "];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run this task in parallel. You can specify a number, such as 10, or a percentage, such as 10%. The default value is [10].\n\n If both this parameter and the [TargetLocation:TargetsMaxConcurrency] are supplied, [TargetLocation:TargetsMaxConcurrency] takes precedence.\n "];
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  targets: targets option
    [@ocaml.doc
      "A key-value mapping to target resources. Required if you specify TargetParameterName.\n\n If both this parameter and the [TargetLocation:Targets] parameter are supplied, [TargetLocation:Targets] takes precedence.\n "];
  target_parameter_name: automation_parameter_key option
    [@ocaml.doc
      "The name of the parameter used as the target resource for the rate-controlled execution. Required if you specify targets.\n"];
  mode: execution_mode option
    [@ocaml.doc
      "The execution mode of the automation. Valid modes include the following: Auto and Interactive. The default mode is Auto.\n"];
  client_token: idempotency_token option
    [@ocaml.doc
      "User-provided idempotency token. The token must be unique, is case insensitive, enforces the UUID format, and can't be reused.\n"];
  parameters: automation_parameter_map option
    [@ocaml.doc
      "A key-value map of execution parameters, which match the declared parameters in the Automation runbook.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of the Automation runbook to use for this execution.\n"];
  document_name: document_ar_n
    [@ocaml.doc
      "The name of the SSM document to run. This can be a public document or a custom document. To run a shared document belonging to another account, specify the document ARN. For more information about how to use shared documents, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-ssm-sharing.html}Sharing SSM documents} in the {i Amazon Web Services Systems Manager User Guide}.\n"]}
[@@ocaml.doc ""]
type nonrec start_associations_once_result = unit[@@ocaml.doc ""]
type nonrec association_id_list = association_id list[@@ocaml.doc ""]
type nonrec start_associations_once_request =
  {
  association_ids: association_id_list
    [@ocaml.doc
      "The association IDs that you want to run immediately and only one time.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_association = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The association isn't valid or doesn't exist. \n"]
type nonrec access_request_id = string[@@ocaml.doc ""]
type nonrec start_access_request_response =
  {
  access_request_id: access_request_id option
    [@ocaml.doc "The ID of the access request.\n"]}[@@ocaml.doc ""]
type nonrec start_access_request_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "Key-value pairs of metadata you want to assign to the access request.\n"];
  targets: targets [@ocaml.doc "The node you are requesting access to.\n"];
  reason: string1to256
    [@ocaml.doc
      "A brief description explaining why you are requesting access to the node.\n"]}
[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception =
  {
  service_code: string_
    [@ocaml.doc
      "The code for the Amazon Web Services service that owns the quota.\n"];
  quota_code: string_
    [@ocaml.doc
      "The quota code recognized by the Amazon Web Services Service Quotas service.\n"];
  resource_type: string_ option
    [@ocaml.doc
      "The resource type of the resource referenced in the failed request.\n"];
  resource_id: string_ option
    [@ocaml.doc
      "The unique ID of the resource referenced in the failed request.\n"];
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "The request exceeds the service quota. Service quotas, also referred to as limits, are the maximum number of service resources or operations for your Amazon Web Services account.\n"]
type nonrec resource_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified parameter to be shared could not be found.\n"]
type nonrec access_denied_exception = {
  message: string_ [@ocaml.doc ""]}[@@ocaml.doc
                                     "The requester doesn't have permissions to perform the requested operation.\n"]
type nonrec standard_output_content = string[@@ocaml.doc ""]
type nonrec standard_error_content = string[@@ocaml.doc ""]
type nonrec source_type =
  | AWS_SSM_MANAGEDINSTANCE [@ocaml.doc ""]
  | AWS_IOT_THING [@ocaml.doc ""]
  | AWS_EC2_INSTANCE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec source_id = string[@@ocaml.doc ""]
type nonrec snapshot_id = string[@@ocaml.doc ""]
type nonrec snapshot_download_url = string[@@ocaml.doc ""]
type nonrec signal_type =
  | REVOKE [@ocaml.doc ""]
  | RESUME [@ocaml.doc ""]
  | STOP_STEP [@ocaml.doc ""]
  | START_STEP [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
  | APPROVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec shared_document_version = string[@@ocaml.doc ""]
type nonrec compliance_summary_count = int[@@ocaml.doc ""]
type nonrec severity_summary =
  {
  unspecified_count: compliance_summary_count option
    [@ocaml.doc
      "The total number of resources or compliance items that have a severity level of unspecified. Unspecified severity is determined by the organization that published the compliance items.\n"];
  informational_count: compliance_summary_count option
    [@ocaml.doc
      "The total number of resources or compliance items that have a severity level of informational. Informational severity is determined by the organization that published the compliance items.\n"];
  low_count: compliance_summary_count option
    [@ocaml.doc
      "The total number of resources or compliance items that have a severity level of low. Low severity is determined by the organization that published the compliance items.\n"];
  medium_count: compliance_summary_count option
    [@ocaml.doc
      "The total number of resources or compliance items that have a severity level of medium. Medium severity is determined by the organization that published the compliance items.\n"];
  high_count: compliance_summary_count option
    [@ocaml.doc
      "The total number of resources or compliance items that have a severity level of high. High severity is determined by the organization that published the compliance items.\n"];
  critical_count: compliance_summary_count option
    [@ocaml.doc
      "The total number of resources or compliance items that have a severity level of [Critical]. Critical severity is determined by the organization that published the compliance items.\n"]}
[@@ocaml.doc
  "The number of managed nodes found for each patch severity level defined in the request filter.\n"]
type nonrec session_token_type = string[@@ocaml.doc ""]
type nonrec session_status =
  | FAILED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | DISCONNECTED [@ocaml.doc ""]
  | CONNECTING [@ocaml.doc ""]
  | CONNECTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec session_state =
  | HISTORY [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec session_owner = string[@@ocaml.doc ""]
type nonrec session_max_results = int[@@ocaml.doc ""]
type nonrec session_manager_s3_output_url = string[@@ocaml.doc ""]
type nonrec session_manager_cloud_watch_output_url = string[@@ocaml.doc ""]
type nonrec session_manager_output_url =
  {
  cloud_watch_output_url: session_manager_cloud_watch_output_url option
    [@ocaml.doc "Reserved for future use.\n"];
  s3_output_url: session_manager_s3_output_url option
    [@ocaml.doc "Reserved for future use.\n"]}[@@ocaml.doc
                                                "Reserved for future use.\n"]
type nonrec session_details = string[@@ocaml.doc ""]
type nonrec max_session_duration = string[@@ocaml.doc ""]
type nonrec access_type =
  | JUSTINTIME [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec session =
  {
  access_type: access_type option
    [@ocaml.doc
      " [Standard] access type is the default for Session Manager sessions. [JustInTime] is the access type for {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-just-in-time-node-access.html}Just-in-time node access}. \n"];
  max_session_duration: max_session_duration option
    [@ocaml.doc "The maximum duration of a session before it terminates.\n"];
  output_url: session_manager_output_url option
    [@ocaml.doc "Reserved for future use.\n"];
  details: session_details option [@ocaml.doc "Reserved for future use.\n"];
  reason: session_reason option
    [@ocaml.doc "The reason for connecting to the instance.\n"];
  owner: session_owner option
    [@ocaml.doc
      "The ID of the Amazon Web Services user that started the session.\n"];
  document_name: document_name option
    [@ocaml.doc
      "The name of the Session Manager SSM document used to define the parameters and plugin settings for the session. For example, [SSM-SessionManagerRunShell].\n"];
  end_date: date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, when the session was terminated.\n"];
  start_date: date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, when the session began.\n"];
  status: session_status option
    [@ocaml.doc
      "The status of the session. For example, \"Connected\" or \"Terminated\".\n"];
  target: session_target option
    [@ocaml.doc
      "The managed node that the Session Manager session connected to.\n"];
  session_id: session_id option [@ocaml.doc "The ID of the session.\n"]}
[@@ocaml.doc
  "Information about a Session Manager connection to a managed node.\n"]
type nonrec session_list = session list[@@ocaml.doc ""]
type nonrec session_filter_value = string[@@ocaml.doc ""]
type nonrec session_filter_key =
  | ACCESS_TYPE [@ocaml.doc ""]
  | SESSION_ID [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | OWNER [@ocaml.doc ""]
  | TARGET_ID [@ocaml.doc ""]
  | INVOKED_BEFORE [@ocaml.doc ""]
  | INVOKED_AFTER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec session_filter =
  {
  value: session_filter_value
    [@ocaml.doc
      "The filter value. Valid values for each filter key are as follows:\n\n {ul\n       {-  InvokedAfter: Specify a timestamp to limit your results. For example, specify 2024-08-29T00:00:00Z to see sessions that started August 29, 2024, and later.\n           \n            }\n       {-  InvokedBefore: Specify a timestamp to limit your results. For example, specify 2024-08-29T00:00:00Z to see sessions that started before August 29, 2024.\n           \n            }\n       {-  Target: Specify a managed node to which session connections have been made.\n           \n            }\n       {-  Owner: Specify an Amazon Web Services user to see a list of sessions started by that user.\n           \n            }\n       {-  Status: Specify a valid session status to see a list of all sessions with that status. Status values you can specify include:\n           \n            {ul\n                  {-  Connected\n                      \n                       }\n                  {-  Connecting\n                      \n                       }\n                  {-  Disconnected\n                      \n                       }\n                  {-  Terminated\n                      \n                       }\n                  {-  Terminating\n                      \n                       }\n                  {-  Failed\n                      \n                       }\n                  \n        }\n         }\n       {-  SessionId: Specify a session ID to return details about the session.\n           \n            }\n       }\n  "];
  key: session_filter_key [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                                                    "Describes a filter for Session Manager information.\n"]
type nonrec session_filter_list = session_filter list[@@ocaml.doc ""]
type nonrec service_setting =
  {
  status: string_ option
    [@ocaml.doc
      "The status of the service setting. The value can be Default, Customized or PendingUpdate.\n\n {ul\n       {-  Default: The current setting uses a default value provisioned by the Amazon Web Services service team.\n           \n            }\n       {-  Customized: The current setting use a custom value specified by the customer.\n           \n            }\n       {-  PendingUpdate: The current setting uses a default or custom value, but a setting change request is pending approval.\n           \n            }\n       }\n  "];
  ar_n: string_ option [@ocaml.doc "The ARN of the service setting.\n"];
  last_modified_user: string_ option
    [@ocaml.doc
      "The ARN of the last modified user. This field is populated only if the setting value was overwritten.\n"];
  last_modified_date: date_time option
    [@ocaml.doc "The last time the service setting was modified.\n"];
  setting_value: service_setting_value option
    [@ocaml.doc "The value of the service setting.\n"];
  setting_id: service_setting_id option
    [@ocaml.doc "The ID of the service setting.\n"]}[@@ocaml.doc
                                                      "The service setting data structure.\n\n  [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of \"false\". This means the user can't use this feature unless they change the setting to \"true\" and intentionally opt in for a paid feature.\n \n  Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [UpdateServiceSetting] API operation to change the default setting. Or, use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.\n  "]
type nonrec command_id = string[@@ocaml.doc ""]
type nonrec instance_id_list = instance_id list[@@ocaml.doc ""]
type nonrec command_status =
  | CANCELLING [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec completed_count = int[@@ocaml.doc ""]
type nonrec error_count = int[@@ocaml.doc ""]
type nonrec delivery_timed_out_count = int[@@ocaml.doc ""]
type nonrec command =
  {
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc "The CloudWatch alarm that was invoked by the command.\n"];
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm applied to your command.\n"];
  timeout_seconds: timeout_seconds option
    [@ocaml.doc "The [TimeoutSeconds] value specified for a command.\n"];
  cloud_watch_output_config: cloud_watch_output_config option
    [@ocaml.doc
      "Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send the command output.\n"];
  notification_config: notification_config option
    [@ocaml.doc
      "Configurations for sending notifications about command status changes. \n"];
  service_role: service_role option
    [@ocaml.doc
      "The Identity and Access Management (IAM) service role that Run Command, a tool in Amazon Web Services Systems Manager, uses to act on your behalf when sending notifications about command status changes. \n"];
  delivery_timed_out_count: delivery_timed_out_count option
    [@ocaml.doc
      "The number of targets for which the status is Delivery Timed Out.\n"];
  error_count: error_count option
    [@ocaml.doc
      "The number of targets for which the status is Failed or Execution Timed Out.\n"];
  completed_count: completed_count option
    [@ocaml.doc
      "The number of targets for which the command invocation reached a terminal state. Terminal states include the following: Success, Failed, Execution Timed Out, Delivery Timed Out, Cancelled, Terminated, or Undeliverable.\n"];
  target_count: target_count option
    [@ocaml.doc "The number of targets for the command.\n"];
  max_errors: max_errors option
    [@ocaml.doc
      "The maximum number of errors allowed before the system stops sending the command to additional targets. You can specify a number of errors, such as 10, or a percentage or errors, such as 10%. The default value is [0]. For more information about how to use [MaxErrors], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html}Amazon Web Services Systems Manager Run Command} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of managed nodes that are allowed to run the command at the same time. You can specify a number of managed nodes, such as 10, or a percentage of nodes, such as 10%. The default value is 50. For more information about how to use [MaxConcurrency], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html}Amazon Web Services Systems Manager Run Command} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  output_s3_key_prefix: s3_key_prefix option
    [@ocaml.doc
      "The S3 directory path inside the bucket where the responses to the command executions should be stored. This was requested when issuing the command.\n"];
  output_s3_bucket_name: s3_bucket_name option
    [@ocaml.doc
      "The S3 bucket where the responses to the command executions should be stored. This was requested when issuing the command.\n"];
  output_s3_region: s3_region option
    [@ocaml.doc
      "(Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the Amazon Web Services Region of the S3 bucket.\n"];
  status_details: status_details option
    [@ocaml.doc
      "A detailed status of the command execution. [StatusDetails] includes more information than [Status] because it includes states resulting from error and concurrency control parameters. [StatusDetails] can show different results than Status. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. StatusDetails can be one of the following values:\n\n {ul\n       {-  Pending: The command hasn't been sent to any managed nodes.\n           \n            }\n       {-  In Progress: The command has been sent to at least one managed node but hasn't reached a final state on all managed nodes.\n           \n            }\n       {-  Success: The command successfully ran on all invocations. This is a terminal state.\n           \n            }\n       {-  Delivery Timed Out: The value of MaxErrors or more command invocations shows a status of Delivery Timed Out. This is a terminal state.\n           \n            }\n       {-  Execution Timed Out: The value of MaxErrors or more command invocations shows a status of Execution Timed Out. This is a terminal state.\n           \n            }\n       {-  Failed: The value of MaxErrors or more command invocations shows a status of Failed. This is a terminal state.\n           \n            }\n       {-  Incomplete: The command was attempted on all managed nodes and one or more invocations doesn't have a value of Success but not enough invocations failed for the status to be Failed. This is a terminal state.\n           \n            }\n       {-  Cancelled: The command was terminated before it was completed. This is a terminal state.\n           \n            }\n       {-  Rate Exceeded: The number of managed nodes targeted by the command exceeded the account limit for pending invocations. The system has canceled the command before running it on any managed node. This is a terminal state.\n           \n            }\n       {-  Delayed: The system attempted to send the command to the managed node but wasn't successful. The system retries again.\n           \n            }\n       }\n  "];
  status: command_status option [@ocaml.doc "The status of the command.\n"];
  requested_date_time: date_time option
    [@ocaml.doc "The date and time the command was requested.\n"];
  targets: targets option
    [@ocaml.doc
      "An array of search criteria that targets managed nodes using a Key,Value combination that you specify. Targets is required if you don't provide one or more managed node IDs in the call.\n"];
  instance_ids: instance_id_list option
    [@ocaml.doc
      "The managed node IDs against which this command was requested.\n"];
  parameters: parameters option
    [@ocaml.doc
      "The parameter values to be inserted in the document when running the command.\n"];
  expires_after: date_time option
    [@ocaml.doc
      "If a command expires, it changes status to [DeliveryTimedOut] for all invocations that have the status [InProgress], [Pending], or [Delayed]. [ExpiresAfter] is calculated based on the total timeout for the overall command. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html?icmpid=docs_ec2_console#monitor-about-status-timeouts}Understanding command timeout values} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  comment: comment option
    [@ocaml.doc
      "User-specified information about the command, such as a brief description of what the command should do.\n"];
  document_version: document_version option
    [@ocaml.doc "The Systems Manager document (SSM document) version.\n"];
  document_name: document_name option
    [@ocaml.doc "The name of the document requested for execution.\n"];
  command_id: command_id option
    [@ocaml.doc "A unique identifier for this command.\n"]}[@@ocaml.doc
                                                             "Describes a command request.\n"]
type nonrec send_command_result =
  {
  command: command option
    [@ocaml.doc
      "The request as it was received by Systems Manager. Also provides the command ID which can be used future references to this request.\n"]}
[@@ocaml.doc ""]
type nonrec send_command_request =
  {
  alarm_configuration: alarm_configuration option
    [@ocaml.doc "The CloudWatch alarm you want to apply to your command.\n"];
  cloud_watch_output_config: cloud_watch_output_config option
    [@ocaml.doc
      "Enables Amazon Web Services Systems Manager to send Run Command output to Amazon CloudWatch Logs. Run Command is a tool in Amazon Web Services Systems Manager.\n"];
  notification_config: notification_config option
    [@ocaml.doc "Configurations for sending notifications.\n"];
  service_role_arn: service_role option
    [@ocaml.doc
      "The ARN of the Identity and Access Management (IAM) service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for Run Command commands.\n\n This role must provide the [sns:Publish] permission for your notification topic. For information about creating and using this service role, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html}Monitoring Systems Manager status changes using Amazon SNS notifications} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  max_errors: max_errors option
    [@ocaml.doc
      "The maximum number of errors allowed without the command failing. When the command fails one more time beyond the value of [MaxErrors], the systems stops sending the command to additional targets. You can specify a number like 10 or a percentage like 10%. The default value is [0]. For more information about how to use [MaxErrors], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-maxerrors}Using error controls} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "(Optional) The maximum number of managed nodes that are allowed to run the command at the same time. You can specify a number such as 10 or a percentage such as 10%. The default value is [50]. For more information about how to use [MaxConcurrency], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-velocity}Using concurrency controls} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  output_s3_key_prefix: s3_key_prefix option
    [@ocaml.doc
      "The directory structure within the S3 bucket where the responses should be stored.\n"];
  output_s3_bucket_name: s3_bucket_name option
    [@ocaml.doc
      "The name of the S3 bucket where command execution responses should be stored.\n"];
  output_s3_region: s3_region option
    [@ocaml.doc
      "(Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the Amazon Web Services Region of the S3 bucket.\n"];
  parameters: parameters option
    [@ocaml.doc
      "The required and optional parameters specified in the document being run.\n"];
  comment: comment option
    [@ocaml.doc
      "User-specified information about the command, such as a brief description of what the command should do.\n"];
  timeout_seconds: timeout_seconds option
    [@ocaml.doc
      "If this time is reached and the command hasn't already started running, it won't run.\n"];
  document_hash_type: document_hash_type option
    [@ocaml.doc
      "Sha256 or Sha1.\n\n  Sha1 hashes have been deprecated.\n  \n   "];
  document_hash: document_hash option
    [@ocaml.doc
      "The Sha256 or Sha1 hash created by the system when the document was created. \n\n  Sha1 hashes have been deprecated.\n  \n   "];
  document_version: document_version option
    [@ocaml.doc
      "The SSM document version to use in the request. You can specify $DEFAULT, $LATEST, or a specific version number. If you run commands by using the Command Line Interface (Amazon Web Services CLI), then you must escape the first two options by using a backslash. If you specify a version number, then you don't need to use the backslash. For example:\n\n --document-version \"\\$DEFAULT\"\n \n  --document-version \"\\$LATEST\"\n  \n   --document-version \"3\"\n   "];
  document_name: document_ar_n
    [@ocaml.doc
      "The name of the Amazon Web Services Systems Manager document (SSM document) to run. This can be a public document or a custom document. To run a shared document belonging to another account, specify the document Amazon Resource Name (ARN). For more information about how to use shared documents, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-using-shared.html}Sharing SSM documents} in the {i Amazon Web Services Systems Manager User Guide}.\n\n  If you specify a document name or ARN that hasn't been shared with your account, you receive an [InvalidDocument] error. \n  \n   "];
  targets: targets option
    [@ocaml.doc
      "An array of search criteria that targets managed nodes using a [Key,Value] combination that you specify. Specifying targets is most useful when you want to send a command to a large number of managed nodes at once. Using [Targets], which accepts tag key-value pairs to identify managed nodes, you can send a command to tens, hundreds, or thousands of nodes at once.\n\n To send a command to a smaller number of managed nodes, you can use the [InstanceIds] option instead.\n \n  For more information about how to use targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html}Run commands at scale} in the {i Amazon Web Services Systems Manager User Guide}.\n  "];
  instance_ids: instance_id_list option
    [@ocaml.doc
      "The IDs of the managed nodes where the command should run. Specifying managed node IDs is most useful when you are targeting a limited number of managed nodes, though you can specify up to 50 IDs.\n\n To target a larger number of managed nodes, or if you prefer not to list individual node IDs, we recommend using the [Targets] option instead. Using [Targets], which accepts tag key-value pairs to identify the managed nodes to send commands to, you can a send command to tens, hundreds, or thousands of nodes at once.\n \n  For more information about how to use targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html}Run commands at scale} in the {i Amazon Web Services Systems Manager User Guide}.\n  "]}
[@@ocaml.doc ""]
type nonrec invalid_role = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The role name can't contain invalid characters. Also verify that you specified an IAM role for notifications that includes the required trust policy. For information about configuring the IAM role for Run Command notifications, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html}Monitoring Systems Manager status changes using Amazon SNS notifications} in the {i Amazon Web Services Systems Manager User Guide}.\n"]
type nonrec invalid_output_folder = unit[@@ocaml.doc ""]
type nonrec invalid_notification_config =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "One or more configuration items isn't valid. Verify that a valid Amazon Resource Name (ARN) was provided for an Amazon Simple Notification Service topic.\n"]
type nonrec duplicate_instance_id = unit[@@ocaml.doc ""]
type nonrec send_automation_signal_result = unit[@@ocaml.doc ""]
type nonrec send_automation_signal_request =
  {
  payload: automation_parameter_map option
    [@ocaml.doc
      "The data sent with the signal. The data schema depends on the type of signal used in the request.\n\n For [Approve] and [Reject] signal types, the payload is an optional comment that you can send with the signal type. For example:\n \n   [Comment=\"Looks good\"] \n  \n   For [StartStep] and [Resume] signal types, you must send the name of the Automation step to start or resume as the payload. For example:\n   \n     [StepName=\"step1\"] \n    \n     For the [StopStep] signal type, you must send the step execution ID as the payload. For example:\n     \n       [StepExecutionId=\"97fff367-fc5a-4299-aed8-0123456789ab\"] \n      "];
  signal_type: signal_type
    [@ocaml.doc "The type of signal to send to an Automation execution. \n"];
  automation_execution_id: automation_execution_id
    [@ocaml.doc
      "The unique identifier for an existing Automation execution that you want to send the signal to.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_automation_signal_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The signal isn't valid for the current Automation execution.\n"]
type nonrec automation_step_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified step name and execution ID don't exist. Verify the information and try again.\n"]
type nonrec scheduled_window_execution =
  {
  execution_time: maintenance_window_string_date_time option
    [@ocaml.doc
      "The time, in ISO-8601 Extended format, that the maintenance window is scheduled to be run.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The name of the maintenance window to be run.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the maintenance window to be run.\n"]}[@@ocaml.doc
                                                                   "Information about a scheduled execution for a maintenance window.\n"]
type nonrec scheduled_window_execution_list = scheduled_window_execution list
[@@ocaml.doc ""]
type nonrec s3_output_url =
  {
  output_url: url option
    [@ocaml.doc
      "A URL for an S3 bucket where you want to store the results of this request.\n"]}
[@@ocaml.doc
  "A URL for the Amazon Web Services Systems Manager (Systems Manager) bucket where you want to store the results of this request.\n"]
type nonrec resume_session_response =
  {
  stream_url: stream_url option
    [@ocaml.doc
      "A URL back to SSM Agent on the managed node that the Session Manager client uses to send commands and receive output from the managed node. Format: \n{[\nwss://ssmmessages.{b region}.amazonaws.com/v1/data-channel/{b session-id}?stream=(input|output)\n]}\n.\n\n  {b region} represents the Region identifier for an Amazon Web Services Region supported by Amazon Web Services Systems Manager, such as [us-east-2] for the US East (Ohio) Region. For a list of supported {b region} values, see the {b Region} column in {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region}Systems Manager service endpoints} in the {i Amazon Web Services General Reference}.\n \n   {b session-id} represents the ID of a Session Manager session, such as [1a2b3c4dEXAMPLE].\n  "];
  token_value: token_value option
    [@ocaml.doc
      "An encrypted token value containing session and caller information. Used to authenticate the connection to the managed node.\n"];
  session_id: session_id option [@ocaml.doc "The ID of the session.\n"]}
[@@ocaml.doc ""]
type nonrec resume_session_request =
  {
  session_id: session_id
    [@ocaml.doc "The ID of the disconnected session to resume.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec result_attribute =
  {
  type_name: inventory_item_type_name
    [@ocaml.doc
      "Name of the inventory item type. Valid value: [AWS:InstanceInformation]. Default Value: [AWS:InstanceInformation].\n"]}
[@@ocaml.doc "The inventory item result attribute.\n"]
type nonrec result_attribute_list = result_attribute list[@@ocaml.doc ""]
type nonrec response_code = int[@@ocaml.doc ""]
type nonrec resource_type_for_tagging =
  | ASSOCIATION [@ocaml.doc ""]
  | AUTOMATION [@ocaml.doc ""]
  | OPSMETADATA [@ocaml.doc ""]
  | OPS_ITEM [@ocaml.doc ""]
  | PATCH_BASELINE [@ocaml.doc ""]
  | PARAMETER [@ocaml.doc ""]
  | MAINTENANCE_WINDOW [@ocaml.doc ""]
  | MANAGED_INSTANCE [@ocaml.doc ""]
  | DOCUMENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_type =
  | EC2_INSTANCE [@ocaml.doc ""]
  | MANAGED_INSTANCE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_policy_parameter_names_list = string_ list[@@ocaml.doc
                                                                 ""]
type nonrec resource_policy_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "No policies with the specified policy ID and hash could be found.\n"]
type nonrec resource_policy_max_results = int[@@ocaml.doc ""]
type nonrec resource_policy_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""];
  limit_type: string_ option [@ocaml.doc ""];
  limit: integer option [@ocaml.doc ""]}[@@ocaml.doc
                                          "The [PutResourcePolicy] API action enforces two limits. A policy can't be greater than 1024 bytes in size. And only one policy can be attached to [OpsItemGroup]. Verify these limits and try again.\n"]
type nonrec resource_policy_invalid_parameter_exception =
  {
  message: string_ option [@ocaml.doc ""];
  parameter_names: resource_policy_parameter_names_list option
    [@ocaml.doc ""]}[@@ocaml.doc
                      "One or more parameters specified for the call aren't valid. Verify the parameters and their values and try again.\n"]
type nonrec resource_policy_conflict_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The hash provided in the call doesn't match the stored hash. This exception is thrown when trying to update an obsolete policy version or when multiple requests to update a policy are sent.\n"]
type nonrec resource_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Error returned when the caller has exceeded the default resource quotas. For example, too many maintenance windows or patch baselines have been created.\n\n For information about resource quotas in Systems Manager, see {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#limits_ssm}Systems Manager service quotas} in the {i Amazon Web Services General Reference}.\n "]
type nonrec resource_in_use_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Error returned if an attempt is made to delete a patch baseline that is registered for a patch group.\n"]
type nonrec resource_id = string[@@ocaml.doc ""]
type nonrec resource_data_sync_state = string[@@ocaml.doc ""]
type nonrec resource_data_sync_source_with_state =
  {
  enable_all_ops_data_sources:
    resource_data_sync_enable_all_ops_data_sources option
    [@ocaml.doc
      "When you create a resource data sync, if you choose one of the Organizations options, then Systems Manager automatically enables all OpsData sources in the selected Amazon Web Services Regions for all Amazon Web Services accounts in your organization (or in the selected organization units). For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  state: resource_data_sync_state option
    [@ocaml.doc
      "The data type name for including resource data sync state. There are four sync states:\n\n  [OrganizationNotExists]: Your organization doesn't exist.\n \n   [NoPermissions]: The system can't locate the service-linked role. This role is automatically created when a user creates a resource data sync in Explorer.\n  \n    [InvalidOrganizationalUnit]: You specified or selected an invalid unit in the resource data sync configuration.\n   \n     [TrustedAccessDisabled]: You disabled Systems Manager access in the organization in Organizations.\n    "];
  include_future_regions: resource_data_sync_include_future_regions option
    [@ocaml.doc
      "Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions when those Regions come online.\n"];
  source_regions: resource_data_sync_source_region_list option
    [@ocaml.doc
      "The [SyncSource] Amazon Web Services Regions included in the resource data sync.\n"];
  aws_organizations_source:
    resource_data_sync_aws_organizations_source option
    [@ocaml.doc
      "The field name in [SyncSource] for the [ResourceDataSyncAwsOrganizationsSource] type.\n"];
  source_type: resource_data_sync_source_type option
    [@ocaml.doc
      "The type of data source for the resource data sync. [SourceType] is either [AwsOrganizations] (if an organization is present in Organizations) or [singleAccountMultiRegions].\n"]}
[@@ocaml.doc
  "The data type name for including resource data sync state. There are four sync states:\n\n  [OrganizationNotExists] (Your organization doesn't exist)\n \n   [NoPermissions] (The system can't locate the service-linked role. This role is automatically created when a user creates a resource data sync in Amazon Web Services Systems Manager Explorer.)\n  \n    [InvalidOrganizationalUnit] (You specified or selected an invalid unit in the resource data sync configuration.)\n   \n     [TrustedAccessDisabled] (You disabled Systems Manager access in the organization in Organizations.)\n    "]
type nonrec resource_data_sync_s3_region = string[@@ocaml.doc ""]
type nonrec resource_data_sync_s3_prefix = string[@@ocaml.doc ""]
type nonrec resource_data_sync_s3_format =
  | JSON_SERDE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_data_sync_s3_bucket_name = string[@@ocaml.doc ""]
type nonrec resource_data_sync_awskms_key_ar_n = string[@@ocaml.doc ""]
type nonrec resource_data_sync_destination_data_sharing_type = string
[@@ocaml.doc ""]
type nonrec resource_data_sync_destination_data_sharing =
  {
  destination_data_sharing_type:
    resource_data_sync_destination_data_sharing_type option
    [@ocaml.doc "The sharing data type. Only [Organization] is supported.\n"]}
[@@ocaml.doc
  "Synchronize Amazon Web Services Systems Manager Inventory data from multiple Amazon Web Services accounts defined in Organizations to a centralized Amazon S3 bucket. Data is synchronized to individual key prefixes in the central bucket. Each key prefix represents a different Amazon Web Services account ID.\n"]
type nonrec resource_data_sync_s3_destination =
  {
  destination_data_sharing:
    resource_data_sync_destination_data_sharing option
    [@ocaml.doc
      "Enables destination data sharing. By default, this field is [null].\n"];
  awskms_key_ar_n: resource_data_sync_awskms_key_ar_n option
    [@ocaml.doc
      "The ARN of an encryption key for a destination in Amazon S3. Must belong to the same Region as the destination S3 bucket.\n"];
  region: resource_data_sync_s3_region
    [@ocaml.doc
      "The Amazon Web Services Region with the S3 bucket targeted by the resource data sync.\n"];
  sync_format: resource_data_sync_s3_format
    [@ocaml.doc
      "A supported sync format. The following format is currently supported: JsonSerDe\n"];
  prefix: resource_data_sync_s3_prefix option
    [@ocaml.doc "An Amazon S3 prefix for the bucket.\n"];
  bucket_name: resource_data_sync_s3_bucket_name
    [@ocaml.doc
      "The name of the S3 bucket where the aggregated data is stored.\n"]}
[@@ocaml.doc
  "Information about the target S3 bucket for the resource data sync.\n"]
type nonrec resource_data_sync_last_modified_time =
  Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec last_resource_data_sync_time = Smaws_Lib.CoreTypes.Timestamp.t
[@@ocaml.doc ""]
type nonrec last_successful_resource_data_sync_time =
  Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec last_resource_data_sync_status =
  | INPROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESSFUL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_data_sync_created_time = Smaws_Lib.CoreTypes.Timestamp.t
[@@ocaml.doc ""]
type nonrec last_resource_data_sync_message = string[@@ocaml.doc ""]
type nonrec resource_data_sync_item =
  {
  last_sync_status_message: last_resource_data_sync_message option
    [@ocaml.doc "The status message details reported by the last sync.\n"];
  sync_created_time: resource_data_sync_created_time option
    [@ocaml.doc "The date and time the configuration was created (UTC).\n"];
  last_status: last_resource_data_sync_status option
    [@ocaml.doc "The status reported by the last sync.\n"];
  sync_last_modified_time: resource_data_sync_last_modified_time option
    [@ocaml.doc "The date and time the resource data sync was changed. \n"];
  last_successful_sync_time: last_successful_resource_data_sync_time option
    [@ocaml.doc
      "The last time the sync operations returned a status of [SUCCESSFUL] (UTC).\n"];
  last_sync_time: last_resource_data_sync_time option
    [@ocaml.doc "The last time the configuration attempted to sync (UTC).\n"];
  s3_destination: resource_data_sync_s3_destination option
    [@ocaml.doc "Configuration information for the target S3 bucket.\n"];
  sync_source: resource_data_sync_source_with_state option
    [@ocaml.doc
      "Information about the source where the data was synchronized. \n"];
  sync_type: resource_data_sync_type option
    [@ocaml.doc
      "The type of resource data sync. If [SyncType] is [SyncToDestination], then the resource data sync synchronizes data to an S3 bucket. If the [SyncType] is [SyncFromSource] then the resource data sync synchronizes data from Organizations or from multiple Amazon Web Services Regions.\n"];
  sync_name: resource_data_sync_name option
    [@ocaml.doc "The name of the resource data sync.\n"]}[@@ocaml.doc
                                                           "Information about a resource data sync configuration, including its current status and last successful sync.\n"]
type nonrec resource_data_sync_item_list = resource_data_sync_item list
[@@ocaml.doc ""]
type nonrec resource_data_sync_count_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You have exceeded the allowed maximum sync configurations.\n"]
type nonrec resource_data_sync_already_exists_exception =
  {
  sync_name: resource_data_sync_name option [@ocaml.doc ""]}[@@ocaml.doc
                                                              "A sync configuration with the same name already exists.\n"]
type nonrec resource_count_by_status = string[@@ocaml.doc ""]
type nonrec resource_count = int[@@ocaml.doc ""]
type nonrec compliance_type_name = string[@@ocaml.doc ""]
type nonrec compliance_resource_type = string[@@ocaml.doc ""]
type nonrec compliance_resource_id = string[@@ocaml.doc ""]
type nonrec compliance_status =
  | NonCompliant [@ocaml.doc ""]
  | Compliant [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec compliance_severity =
  | Unspecified [@ocaml.doc ""]
  | Informational [@ocaml.doc ""]
  | Low [@ocaml.doc ""]
  | Medium [@ocaml.doc ""]
  | High [@ocaml.doc ""]
  | Critical [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec compliance_execution_id = string[@@ocaml.doc ""]
type nonrec compliance_execution_type = string[@@ocaml.doc ""]
type nonrec compliance_execution_summary =
  {
  execution_type: compliance_execution_type option
    [@ocaml.doc
      "The type of execution. For example, [Command] is a valid execution type.\n"];
  execution_id: compliance_execution_id option
    [@ocaml.doc
      "An ID created by the system when [PutComplianceItems] was called. For example, [CommandID] is a valid execution ID. You can use this ID in subsequent calls.\n"];
  execution_time: date_time
    [@ocaml.doc
      "The time the execution ran as a datetime object that is saved in the following format: [yyyy-MM-dd'T'HH:mm:ss'Z'] \n"]}
[@@ocaml.doc
  "A summary of the call execution that includes an execution ID, the type of execution (for example, [Command]), and the date/time of the execution using a datetime object that is saved in the following format: [yyyy-MM-dd'T'HH:mm:ss'Z'] \n"]
type nonrec compliant_summary =
  {
  severity_summary: severity_summary option
    [@ocaml.doc "A summary of the compliance severity by compliance type.\n"];
  compliant_count: compliance_summary_count option
    [@ocaml.doc "The total number of resources that are compliant.\n"]}
[@@ocaml.doc
  "A summary of resources that are compliant. The summary is organized according to the resource count for each compliance type.\n"]
type nonrec non_compliant_summary =
  {
  severity_summary: severity_summary option
    [@ocaml.doc
      "A summary of the non-compliance severity by compliance type\n"];
  non_compliant_count: compliance_summary_count option
    [@ocaml.doc
      "The total number of compliance items that aren't compliant.\n"]}
[@@ocaml.doc
  "A summary of resources that aren't compliant. The summary is organized according to resource type.\n"]
type nonrec resource_compliance_summary_item =
  {
  non_compliant_summary: non_compliant_summary option
    [@ocaml.doc "A list of items that aren't compliant for the resource.\n"];
  compliant_summary: compliant_summary option
    [@ocaml.doc "A list of items that are compliant for the resource.\n"];
  execution_summary: compliance_execution_summary option
    [@ocaml.doc "Information about the execution.\n"];
  overall_severity: compliance_severity option
    [@ocaml.doc
      "The highest severity item found for the resource. The resource is compliant for this item.\n"];
  status: compliance_status option
    [@ocaml.doc "The compliance status for the resource.\n"];
  resource_id: compliance_resource_id option
    [@ocaml.doc "The resource ID.\n"];
  resource_type: compliance_resource_type option
    [@ocaml.doc "The resource type.\n"];
  compliance_type: compliance_type_name option
    [@ocaml.doc "The compliance type.\n"]}[@@ocaml.doc
                                            "Compliance summary information for a specific resource. \n"]
type nonrec resource_compliance_summary_item_list =
  resource_compliance_summary_item list[@@ocaml.doc ""]
type nonrec resource_arn_string = string[@@ocaml.doc ""]
type nonrec resolved_targets =
  {
  truncated: boolean_ option
    [@ocaml.doc
      "A boolean value indicating whether the resolved target list is truncated.\n"];
  parameter_values: target_parameter_list option
    [@ocaml.doc
      "A list of parameter values sent to targets that resolved during the Automation execution.\n"]}
[@@ocaml.doc
  "Information about targets that resolved during the Automation execution.\n"]
type nonrec reset_service_setting_result =
  {
  service_setting: service_setting option
    [@ocaml.doc
      "The current, effective service setting after calling the ResetServiceSetting API operation.\n"]}
[@@ocaml.doc "The result body of the ResetServiceSetting API operation.\n"]
type nonrec reset_service_setting_request =
  {
  setting_id: service_setting_id
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service setting to reset. The setting ID can be one of the following.\n\n {ul\n       {-   [/ssm/appmanager/appmanager-enabled] \n           \n            }\n       {-   [/ssm/automation/customer-script-log-destination] \n           \n            }\n       {-   [/ssm/automation/customer-script-log-group-name] \n           \n            }\n       {-  /ssm/automation/enable-adaptive-concurrency\n           \n            }\n       {-   [/ssm/documents/console/public-sharing-permission] \n           \n            }\n       {-   [/ssm/managed-instance/activation-tier] \n           \n            }\n       {-   [/ssm/managed-instance/default-ec2-instance-management-role] \n           \n            }\n       {-   [/ssm/opsinsights/opscenter] \n           \n            }\n       {-   [/ssm/parameter-store/default-parameter-tier] \n           \n            }\n       {-   [/ssm/parameter-store/high-throughput-enabled] \n           \n            }\n       }\n  "]}
[@@ocaml.doc "The request body of the ResetServiceSetting API operation.\n"]
type nonrec remove_tags_from_resource_result = unit[@@ocaml.doc ""]
type nonrec key_list = tag_key list[@@ocaml.doc ""]
type nonrec remove_tags_from_resource_request =
  {
  tag_keys: key_list
    [@ocaml.doc
      "Tag keys that you want to remove from the specified resource.\n"];
  resource_id: resource_id
    [@ocaml.doc
      "The ID of the resource from which you want to remove tags. For example:\n\n ManagedInstance: mi-012345abcde\n \n  MaintenanceWindow: mw-012345abcde\n  \n    [Automation]: [example-c160-4567-8519-012345abcde] \n   \n    PatchBaseline: pb-012345abcde\n    \n     OpsMetadata object: [ResourceID] for tagging is created from the Amazon Resource Name (ARN) for the object. Specifically, [ResourceID] is created from the strings that come after the word [opsmetadata] in the ARN. For example, an OpsMetadata object with an ARN of [arn:aws:ssm:us-east-2:1234567890:opsmetadata/aws/ssm/MyGroup/appmanager] has a [ResourceID] of either [aws/ssm/MyGroup/appmanager] or [/aws/ssm/MyGroup/appmanager].\n     \n      For the Document and Parameter values, use the name of the resource.\n      \n        The [ManagedInstance] type for this API operation is only for on-premises managed nodes. Specify the name of the managed node in the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.\n        \n         "];
  resource_type: resource_type_for_tagging
    [@ocaml.doc
      "The type of resource from which you want to remove a tag.\n\n  The [ManagedInstance] type for this API operation is only for on-premises managed nodes. Specify the name of the managed node in the following format: \n  {[\n  mi-{i ID_number} \n  ]}\n  . For example, [mi-1a2b3c4d5e6f].\n  \n   "]}
[@@ocaml.doc ""]
type nonrec invalid_resource_type = unit[@@ocaml.doc ""]
type nonrec invalid_resource_id = unit[@@ocaml.doc ""]
type nonrec remaining_count = int[@@ocaml.doc ""]
type nonrec registrations_count = int[@@ocaml.doc ""]
type nonrec registration_metadata_value = string[@@ocaml.doc ""]
type nonrec registration_metadata_key = string[@@ocaml.doc ""]
type nonrec registration_metadata_item =
  {
  value: registration_metadata_value
    [@ocaml.doc "Reserved for internal use.\n"];
  key: registration_metadata_key [@ocaml.doc "Reserved for internal use.\n"]}
[@@ocaml.doc "Reserved for internal use.\n"]
type nonrec registration_metadata_list = registration_metadata_item list
[@@ocaml.doc ""]
type nonrec registration_limit = int[@@ocaml.doc ""]
type nonrec register_task_with_maintenance_window_result =
  {
  window_task_id: maintenance_window_task_id option
    [@ocaml.doc "The ID of the task in the maintenance window.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec maintenance_window_task_type =
  | Lambda [@ocaml.doc ""]
  | StepFunctions [@ocaml.doc ""]
  | Automation [@ocaml.doc ""]
  | RunCommand [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec client_token = string[@@ocaml.doc ""]
type nonrec register_task_with_maintenance_window_request =
  {
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The CloudWatch alarm you want to apply to your maintenance window task.\n"];
  cutoff_behavior: maintenance_window_task_cutoff_behavior option
    [@ocaml.doc
      "Indicates whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached. \n\n {ul\n       {-   [CONTINUE_TASK]: When the cutoff time is reached, any tasks that are running continue. The default value.\n           \n            }\n       {-   [CANCEL_TASK]:\n           \n            {ul\n                  {-  For Automation, Lambda, Step Functions tasks: When the cutoff time is reached, any task invocations that are already running continue, but no new task invocations are started.\n                      \n                       }\n                  {-  For Run Command tasks: When the cutoff time is reached, the system sends a [CancelCommand] operation that attempts to cancel the command associated with the task. However, there is no guarantee that the command will be terminated and the underlying process stopped.\n                      \n                       }\n                  \n        }\n         The status for tasks that are not completed is [TIMED_OUT].\n         \n          }\n       }\n  "];
  client_token: client_token option
    [@ocaml.doc "User-provided idempotency token.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "An optional description for the task.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "An optional name for the task.\n"];
  logging_info: logging_info option
    [@ocaml.doc
      "A structure containing information about an Amazon Simple Storage Service (Amazon S3) bucket to write managed node-level logs to. \n\n   [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  max_errors: max_errors option
    [@ocaml.doc
      "The maximum number of errors allowed before this task stops being scheduled.\n\n  Although this element is listed as \"Required: No\", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.\n  \n   For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.\n   \n    "];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets this task can be run for, in parallel.\n\n  Although this element is listed as \"Required: No\", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.\n  \n   For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.\n   \n    "];
  priority: maintenance_window_task_priority option
    [@ocaml.doc
      "The priority of the task in the maintenance window, the lower the number the higher the priority. Tasks in a maintenance window are scheduled in priority order with tasks that have the same priority scheduled in parallel.\n"];
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option
    [@ocaml.doc
      "The parameters that the task should use during execution. Populate only the fields that match the task type. All other fields should be empty. \n"];
  task_parameters: maintenance_window_task_parameters option
    [@ocaml.doc
      "The parameters that should be passed to the task when it is run.\n\n   [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  task_type: maintenance_window_task_type
    [@ocaml.doc "The type of task being registered.\n"];
  service_role_arn: service_role option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].\n\n However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up Maintenance Windows} in the in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  task_arn: maintenance_window_task_arn
    [@ocaml.doc "The ARN of the task to run.\n"];
  targets: targets option
    [@ocaml.doc
      "The targets (either managed nodes or maintenance window targets).\n\n  One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n    Specify managed nodes using the following format: \n    \n      \n     {[\n     Key=InstanceIds,Values=,\n     ]}\n      \n     \n      Specify maintenance window targets using the following format:\n      \n        \n       {[\n       Key=WindowTargetIds,Values=,\n       ]}\n        \n       "];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window the task should be added to.\n"]}
[@@ocaml.doc ""]
type nonrec feature_not_available_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You attempted to register a [LAMBDA] or [STEP_FUNCTIONS] task in a region where the corresponding service isn't available. \n"]
type nonrec register_target_with_maintenance_window_result =
  {
  window_target_id: maintenance_window_target_id option
    [@ocaml.doc
      "The ID of the target definition in this maintenance window.\n"]}
[@@ocaml.doc ""]
type nonrec maintenance_window_resource_type =
  | ResourceGroup [@ocaml.doc ""]
  | Instance [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec register_target_with_maintenance_window_request =
  {
  client_token: client_token option
    [@ocaml.doc "User-provided idempotency token.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "An optional description for the target.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "An optional name for the target.\n"];
  owner_information: owner_information option
    [@ocaml.doc
      "User-provided value that will be included in any Amazon CloudWatch Events events raised while running tasks for these targets in this maintenance window.\n"];
  targets: targets
    [@ocaml.doc
      "The targets to register with the maintenance window. In other words, the managed nodes to run commands on when the maintenance window runs.\n\n  If a single maintenance window task is registered with multiple targets, its task invocations occur sequentially and not in parallel. If your task must run on multiple targets at the same time, register a task for each target individually and assign each task the same priority level.\n  \n    You can specify targets using managed node IDs, resource group names, or tags that have been applied to managed nodes.\n    \n      {b Example 1}: Specify managed node IDs\n     \n       \n      {[\n      Key=InstanceIds,Values=,,\n      ]}\n       \n      \n        {b Example 2}: Use tag key-pairs applied to managed nodes\n       \n         \n        {[\n        Key=tag:,Values=,\n        ]}\n         \n        \n          {b Example 3}: Use tag-keys applied to managed nodes\n         \n           \n          {[\n          Key=tag-key,Values=,\n          ]}\n           \n          \n            {b Example 4}: Use resource group names\n           \n             \n            {[\n            Key=resource-groups:Name,Values=\n            ]}\n             \n            \n              {b Example 5}: Use filters for resource group types\n             \n               \n              {[\n              Key=resource-groups:ResourceTypeFilters,Values=,\n              ]}\n               \n              \n                For [Key=resource-groups:ResourceTypeFilters], specify resource types in the following format\n                \n                  [Key=resource-groups:ResourceTypeFilters,Values=AWS::EC2::INSTANCE,AWS::EC2::VPC] \n                 \n                   For more information about these examples formats, including the best use case for each one, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html}Examples: Register targets with a maintenance window} in the {i Amazon Web Services Systems Manager User Guide}.\n                   "];
  resource_type: maintenance_window_resource_type
    [@ocaml.doc
      "The type of target being registered with the maintenance window.\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window the target should be registered with.\n"]}
[@@ocaml.doc ""]
type nonrec patch_group = string[@@ocaml.doc ""]
type nonrec register_patch_baseline_for_patch_group_result =
  {
  patch_group: patch_group option
    [@ocaml.doc
      "The name of the patch group registered with the patch baseline.\n"];
  baseline_id: baseline_id option
    [@ocaml.doc
      "The ID of the patch baseline the patch group was registered with.\n"]}
[@@ocaml.doc ""]
type nonrec register_patch_baseline_for_patch_group_request =
  {
  patch_group: patch_group
    [@ocaml.doc
      "The name of the patch group to be registered with the patch baseline.\n"];
  baseline_id: baseline_id
    [@ocaml.doc
      "The ID of the patch baseline to register with the patch group.\n"]}
[@@ocaml.doc ""]
type nonrec already_exists_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Error returned if an attempt is made to register a patch group with a patch baseline that is already registered with a different patch baseline.\n"]
type nonrec register_default_patch_baseline_result =
  {
  baseline_id: baseline_id option
    [@ocaml.doc "The ID of the default patch baseline.\n"]}[@@ocaml.doc ""]
type nonrec register_default_patch_baseline_request =
  {
  baseline_id: baseline_id
    [@ocaml.doc
      "The ID of the patch baseline that should be the default patch baseline.\n"]}
[@@ocaml.doc ""]
type nonrec region_list = region list[@@ocaml.doc ""]
type nonrec reboot_option =
  | NO_REBOOT [@ocaml.doc ""]
  | REBOOT_IF_NEEDED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec policy_id = string[@@ocaml.doc ""]
type nonrec policy_hash = string[@@ocaml.doc ""]
type nonrec put_resource_policy_response =
  {
  policy_hash: policy_hash option
    [@ocaml.doc "ID of the current policy version.\n"];
  policy_id: policy_id option
    [@ocaml.doc
      "The policy ID. To update a policy, you must specify [PolicyId] and [PolicyHash].\n"]}
[@@ocaml.doc ""]
type nonrec policy = string[@@ocaml.doc ""]
type nonrec put_resource_policy_request =
  {
  policy_hash: policy_hash option
    [@ocaml.doc
      "ID of the current policy version. The hash helps to prevent a situation where multiple users attempt to overwrite a policy. You must provide this hash when updating or deleting a policy.\n"];
  policy_id: policy_id option [@ocaml.doc "The policy ID.\n"];
  policy: policy
    [@ocaml.doc "A policy you want to associate with a resource.\n"];
  resource_arn: resource_arn_string
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the resource to which you want to attach a policy.\n"]}
[@@ocaml.doc ""]
type nonrec malformed_resource_policy_document_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified policy document is malformed or invalid, or excessive [PutResourcePolicy] or [DeleteResourcePolicy] calls have been made.\n"]
type nonrec parameter_tier =
  | INTELLIGENT_TIERING [@ocaml.doc ""]
  | ADVANCED [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec put_parameter_result =
  {
  tier: parameter_tier option
    [@ocaml.doc "The tier assigned to the parameter.\n"];
  version: ps_parameter_version option
    [@ocaml.doc
      "The new version number of a parameter. If you edit a parameter value, Parameter Store automatically creates a new version and assigns this new version a unique ID. You can reference a parameter version ID in API operations or in Systems Manager documents (SSM documents). By default, if you don't specify a specific version, the system returns the latest parameter value when a parameter is called.\n"]}
[@@ocaml.doc ""]
type nonrec parameter_description = string[@@ocaml.doc ""]
type nonrec ps_parameter_value = string[@@ocaml.doc ""]
type nonrec parameter_type =
  | SECURE_STRING [@ocaml.doc ""]
  | STRING_LIST [@ocaml.doc ""]
  | STRING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec parameter_key_id = string[@@ocaml.doc ""]
type nonrec allowed_pattern = string[@@ocaml.doc ""]
type nonrec parameter_policies = string[@@ocaml.doc ""]
type nonrec parameter_data_type = string[@@ocaml.doc ""]
type nonrec put_parameter_request =
  {
  data_type: parameter_data_type option
    [@ocaml.doc
      "The data type for a [String] parameter. Supported data types include plain text and Amazon Machine Image (AMI) IDs.\n\n  {b The following data type values are supported.} \n \n  {ul\n        {-   [text] \n            \n             }\n        {-   [aws:ec2:image] \n            \n             }\n        {-   [aws:ssm:integration] \n            \n             }\n        }\n   When you create a [String] parameter and specify [aws:ec2:image], Amazon Web Services Systems Manager validates the parameter value is in the required format, such as [ami-12345abcdeEXAMPLE], and that the specified AMI is available in your Amazon Web Services account.\n   \n     If the action is successful, the service sends back an HTTP 200 response which indicates a successful [PutParameter] call for all cases except for data type [aws:ec2:image]. If you call [PutParameter] with [aws:ec2:image] data type, a successful HTTP 200 response does not guarantee that your parameter was successfully created or updated. The [aws:ec2:image] value is validated asynchronously, and the [PutParameter] call returns before the validation is complete. If you submit an invalid AMI value, the PutParameter operation will return success, but the asynchronous validation will fail and the parameter will not be created or updated. To monitor whether your [aws:ec2:image] parameters are created successfully, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-cwe.html}Setting up notifications or trigger actions based on Parameter Store events}. For more information about AMI format validation , see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-ec2-aliases.html}Native parameter support for Amazon Machine Image IDs}. \n     \n      "];
  policies: parameter_policies option
    [@ocaml.doc
      "One or more policies to apply to a parameter. This operation takes a JSON array. Parameter Store, a tool in Amazon Web Services Systems Manager supports the following policy types:\n\n Expiration: This policy deletes the parameter after it expires. When you create the policy, you specify the expiration date. You can update the expiration date and time by updating the policy. Updating the {i parameter} doesn't affect the expiration date and time. When the expiration time is reached, Parameter Store deletes the parameter.\n \n  ExpirationNotification: This policy initiates an event in Amazon CloudWatch Events that notifies you about the expiration. By using this policy, you can receive notification before or after the expiration time is reached, in units of days or hours.\n  \n   NoChangeNotification: This policy initiates a CloudWatch Events event if a parameter hasn't been modified for a specified period of time. This policy type is useful when, for example, a secret needs to be changed within a period of time, but it hasn't been changed.\n   \n    All existing policies are preserved until you send new policies or an empty policy. For more information about parameter policies, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html}Assigning parameter policies}. \n    "];
  tier: parameter_tier option
    [@ocaml.doc
      "The parameter tier to assign to a parameter.\n\n Parameter Store offers a standard tier and an advanced tier for parameters. Standard parameters have a content size limit of 4 KB and can't be configured to use parameter policies. You can create a maximum of 10,000 standard parameters for each Region in an Amazon Web Services account. Standard parameters are offered at no additional cost. \n \n  Advanced parameters have a content size limit of 8 KB and can be configured to use parameter policies. You can create a maximum of 100,000 advanced parameters for each Region in an Amazon Web Services account. Advanced parameters incur a charge. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html}Managing parameter tiers} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n   You can change a standard parameter to an advanced parameter any time. But you can't revert an advanced parameter to a standard parameter. Reverting an advanced parameter to a standard parameter would result in data loss because the system would truncate the size of the parameter from 8 KB to 4 KB. Reverting would also remove any policies attached to the parameter. Lastly, advanced parameters use a different form of encryption than standard parameters. \n   \n    If you no longer need an advanced parameter, or if you no longer want to incur charges for an advanced parameter, you must delete it and recreate it as a new standard parameter. \n    \n      {b Using the Default Tier Configuration} \n     \n      In [PutParameter] requests, you can specify the tier to create the parameter in. Whenever you specify a tier in the request, Parameter Store creates or updates the parameter according to that request. However, if you don't specify a tier in a request, Parameter Store assigns the tier based on the current Parameter Store default tier configuration.\n      \n       The default tier when you begin using Parameter Store is the standard-parameter tier. If you use the advanced-parameter tier, you can specify one of the following as the default:\n       \n        {ul\n              {-   {b Advanced}: With this option, Parameter Store evaluates all requests as advanced parameters. \n                  \n                   }\n              {-   {b Intelligent-Tiering}: With this option, Parameter Store evaluates each request to determine if the parameter is standard or advanced. \n                  \n                   If the request doesn't include any options that require an advanced parameter, the parameter is created in the standard-parameter tier. If one or more options requiring an advanced parameter are included in the request, Parameter Store create a parameter in the advanced-parameter tier.\n                   \n                    This approach helps control your parameter-related costs by always creating standard parameters unless an advanced parameter is necessary. \n                    \n                     }\n              }\n   Options that require an advanced parameter include the following:\n   \n    {ul\n          {-  The content size of the parameter is more than 4 KB.\n              \n               }\n          {-  The parameter uses a parameter policy.\n              \n               }\n          {-  More than 10,000 parameters already exist in your Amazon Web Services account in the current Amazon Web Services Region.\n              \n               }\n          }\n   For more information about configuring the default tier option, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html#ps-default-tier}Specifying a default parameter tier} in the {i Amazon Web Services Systems Manager User Guide}.\n   "];
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a Systems Manager parameter to identify the type of resource to which it applies, the environment, or the type of configuration data referenced by the parameter. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=Resource,Value=S3bucket] \n           \n            }\n       {-   [Key=OS,Value=Windows] \n           \n            }\n       {-   [Key=ParameterType,Value=LicenseKey] \n           \n            }\n       }\n    To add tags to an existing Systems Manager parameter, use the [AddTagsToResource] operation.\n    \n     "];
  allowed_pattern: allowed_pattern option
    [@ocaml.doc
      "A regular expression used to validate the parameter value. For example, for String types with values restricted to numbers, you can specify the following: AllowedPattern=^\\d+$ \n"];
  overwrite: boolean_ option
    [@ocaml.doc
      "Overwrite an existing parameter. The default value is [false].\n"];
  key_id: parameter_key_id option
    [@ocaml.doc
      "The Key Management Service (KMS) ID that you want to use to encrypt a parameter. Use a custom key for better security. Required for parameters that use the [SecureString] data type.\n\n If you don't specify a key ID, the system uses the default key associated with your Amazon Web Services account, which is not as secure as using a custom key.\n \n  {ul\n        {-  To use a custom KMS key, choose the [SecureString] data type with the [Key ID] parameter.\n            \n             }\n        }\n  "];
  type_: parameter_type option
    [@ocaml.doc
      "The type of parameter that you want to create.\n\n   [SecureString] isn't currently supported for CloudFormation templates.\n  \n    Items in a [StringList] must be separated by a comma (,). You can't use other punctuation or special character to escape items in the list. If you have a parameter value that requires a comma, then use the [String] data type.\n    \n      Specifying a parameter type isn't required when updating a parameter. You must specify a parameter type when creating a parameter.\n      \n       "];
  value: ps_parameter_value
    [@ocaml.doc
      "The parameter value that you want to add to the system. Standard parameters have a value limit of 4 KB. Advanced parameters have a value limit of 8 KB.\n\n  Parameters can't be referenced or nested in the values of other parameters. You can't include values wrapped in double brackets [{{}}] or \n  {[\n  \\{\\{ssm:{i parameter-name}\\}\\}\n  ]}\n   in a parameter value.\n  \n   "];
  description: parameter_description option
    [@ocaml.doc
      "Information about the parameter that you want to add to the system. Optional but recommended.\n\n  Don't enter personally identifiable information in this field.\n  \n   "];
  name: ps_parameter_name
    [@ocaml.doc
      "The fully qualified name of the parameter that you want to create or update.\n\n  You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.\n  \n    The fully qualified name includes the complete hierarchy of the parameter path and name. For parameters in a hierarchy, you must include a leading forward slash character (/) when you create or reference a parameter. For example: [/Dev/DBServer/MySQL/db-string13] \n    \n     Naming Constraints:\n     \n      {ul\n            {-  Parameter names are case sensitive.\n                \n                 }\n            {-  A parameter name must be unique within an Amazon Web Services Region\n                \n                 }\n            {-  A parameter name can't be prefixed with \"[aws]\" or \"[ssm]\" (case-insensitive).\n                \n                 }\n            {-  Parameter names can include only the following symbols and letters: [a-zA-Z0-9_.-] \n                \n                 In addition, the slash character ( / ) is used to delineate hierarchies in parameter names. For example: [/Dev/Production/East/Project-ABC/MyParameter] \n                 \n                  }\n            {-  A parameter name can't include spaces.\n                \n                 }\n            {-  Parameter hierarchies are limited to a maximum depth of fifteen levels.\n                \n                 }\n            }\n   For additional information about valid values for parameter names, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-su-create.html}Creating Systems Manager parameters} in the {i Amazon Web Services Systems Manager User Guide}.\n   \n     The reported maximum length of 2048 characters for a parameter name includes 1037 characters that are reserved for internal use by Systems Manager. The maximum length for a parameter name that you specify is 1011 characters.\n     \n      This count of 1011 characters includes the characters in the ARN that precede the name you specify. This ARN length will vary depending on your partition and Region. For example, the following 45 characters count toward the 1011 character maximum for a parameter created in the US East (Ohio) Region: [arn:aws:ssm:us-east-2:111122223333:parameter/].\n      \n       "]}
[@@ocaml.doc ""]
type nonrec policies_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You specified more than the maximum number of allowed policies for the parameter. The maximum is 10.\n"]
type nonrec parameter_pattern_mismatch_exception =
  {
  message: string_ option [@ocaml.doc "The parameter name isn't valid.\n"]}
[@@ocaml.doc "The parameter name isn't valid.\n"]
type nonrec parameter_max_version_limit_exceeded =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Parameter Store retains the 100 most recently created versions of a parameter. After this number of versions has been created, Parameter Store deletes the oldest version when a new one is created. However, if the oldest version has a {i label} attached to it, Parameter Store won't delete the version and instead presents this error message:\n\n  \n {[\n An error occurred (ParameterMaxVersionLimitExceeded) when calling the PutParameter operation: You attempted to create a new version of {i parameter-name} by calling the PutParameter API with the overwrite flag. Version {i version-number}, the oldest version, can't be deleted because it has a label associated with it. Move the label to another version of the parameter, and try again.\n ]}\n  \n \n  This safeguard is to prevent parameter versions with mission critical labels assigned to them from being deleted. To continue creating new parameters, first move the label from the oldest version of the parameter to a newer one for use in your operations. For information about moving parameter labels, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html#sysman-paramstore-labels-console-move}Move a parameter label (console)} or {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html#sysman-paramstore-labels-cli-move}Move a parameter label (CLI)} in the {i Amazon Web Services Systems Manager User Guide}. \n  "]
type nonrec parameter_limit_exceeded =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You have exceeded the number of parameters for this Amazon Web Services account. Delete one or more parameters and try again.\n"]
type nonrec parameter_already_exists =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The parameter already exists. You can't create duplicate parameters.\n"]
type nonrec invalid_policy_type_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The policy type isn't supported. Parameter Store supports the following policy types: Expiration, ExpirationNotification, and NoChangeNotification.\n"]
type nonrec invalid_policy_attribute_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "A policy attribute or its value is invalid. \n"]
type nonrec invalid_key_id = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The query key ID isn't valid.\n"]
type nonrec invalid_allowed_pattern_exception =
  {
  message: string_ option
    [@ocaml.doc
      "The request doesn't meet the regular expression requirement.\n"]}
[@@ocaml.doc
  "The request doesn't meet the regular expression requirement.\n"]
type nonrec incompatible_policy_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "There is a conflict in the policies specified for this parameter. You can't, for example, specify two Expiration policies for a parameter. Review your policies, and try again.\n"]
type nonrec hierarchy_type_mismatch_exception =
  {
  message: string_ option
    [@ocaml.doc
      "Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't change a parameter from a [String] type to a [SecureString] type. You must create a new, unique parameter.\n"]}
[@@ocaml.doc
  "Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't change a parameter from a [String] type to a [SecureString] type. You must create a new, unique parameter.\n"]
type nonrec hierarchy_level_limit_exceeded_exception =
  {
  message: string_ option
    [@ocaml.doc
      "A hierarchy can have a maximum of 15 levels. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-su-create.html#sysman-parameter-name-constraints}About requirements and constraints for parameter names} in the {i Amazon Web Services Systems Manager User Guide}. \n"]}
[@@ocaml.doc
  "A hierarchy can have a maximum of 15 levels. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html}Requirements and constraints for parameter names} in the {i Amazon Web Services Systems Manager User Guide}. \n"]
type nonrec put_inventory_message = string[@@ocaml.doc ""]
type nonrec put_inventory_result =
  {
  message: put_inventory_message option
    [@ocaml.doc "Information about the request.\n"]}[@@ocaml.doc ""]
type nonrec inventory_item_schema_version = string[@@ocaml.doc ""]
type nonrec inventory_item_capture_time = string[@@ocaml.doc ""]
type nonrec inventory_item_content_hash = string[@@ocaml.doc ""]
type nonrec attribute_value = string[@@ocaml.doc ""]
type nonrec attribute_name = string[@@ocaml.doc ""]
type nonrec inventory_item_entry = (attribute_name * attribute_value) list
[@@ocaml.doc ""]
type nonrec inventory_item_entry_list = inventory_item_entry list[@@ocaml.doc
                                                                   ""]
type nonrec inventory_item_content_context =
  (attribute_name * attribute_value) list[@@ocaml.doc ""]
type nonrec inventory_item =
  {
  context: inventory_item_content_context option
    [@ocaml.doc
      "A map of associated properties for a specified inventory type. For example, with this attribute, you can specify the [ExecutionId], [ExecutionType], [ComplianceType] properties of the [AWS:ComplianceItem] type.\n"];
  content: inventory_item_entry_list option
    [@ocaml.doc "The inventory data of the inventory type.\n"];
  content_hash: inventory_item_content_hash option
    [@ocaml.doc
      "MD5 hash of the inventory item type contents. The content hash is used to determine whether to update inventory information. The PutInventory API doesn't update the inventory item type contents if the MD5 hash hasn't changed since last update. \n"];
  capture_time: inventory_item_capture_time
    [@ocaml.doc "The time the inventory information was collected.\n"];
  schema_version: inventory_item_schema_version
    [@ocaml.doc "The schema version for the inventory item.\n"];
  type_name: inventory_item_type_name
    [@ocaml.doc
      "The name of the inventory type. Default inventory item type names start with [AWS]. Custom inventory type names will start with Custom. Default inventory item types include the following: [AWS:AWSComponent], [AWS:Application], [AWS:InstanceInformation], [AWS:Network], and [AWS:WindowsUpdate].\n"]}
[@@ocaml.doc
  "Information collected from managed nodes based on your inventory policy document\n"]
type nonrec inventory_item_list = inventory_item list[@@ocaml.doc ""]
type nonrec put_inventory_request =
  {
  items: inventory_item_list
    [@ocaml.doc
      "The inventory items that you want to add or update on managed nodes.\n"];
  instance_id: instance_id
    [@ocaml.doc
      "An managed node ID where you want to add or update inventory items.\n"]}
[@@ocaml.doc ""]
type nonrec item_size_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""];
  type_name: inventory_item_type_name option [@ocaml.doc ""]}[@@ocaml.doc
                                                               "The inventory item size has exceeded the size limit.\n"]
type nonrec item_content_mismatch_exception =
  {
  message: string_ option [@ocaml.doc ""];
  type_name: inventory_item_type_name option [@ocaml.doc ""]}[@@ocaml.doc
                                                               "The inventory item has invalid content. \n"]
type nonrec invalid_type_name_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The parameter type name isn't valid.\n"]
type nonrec invalid_item_content_exception =
  {
  message: string_ option [@ocaml.doc ""];
  type_name: inventory_item_type_name option [@ocaml.doc ""]}[@@ocaml.doc
                                                               "One or more content items isn't valid.\n"]
type nonrec invalid_inventory_item_context_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You specified invalid keys or values in the [Context] attribute for [InventoryItem]. Verify the keys and values, and try again.\n"]
type nonrec custom_schema_count_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You have exceeded the limit for custom schemas. Delete one or more custom schemas and try again.\n"]
type nonrec put_compliance_items_result = unit[@@ocaml.doc ""]
type nonrec compliance_item_id = string[@@ocaml.doc ""]
type nonrec compliance_item_title = string[@@ocaml.doc ""]
type nonrec compliance_item_details = (attribute_name * attribute_value) list
[@@ocaml.doc ""]
type nonrec compliance_item_entry =
  {
  details: compliance_item_details option
    [@ocaml.doc
      "A \"Key\": \"Value\" tag combination for the compliance item.\n"];
  status: compliance_status
    [@ocaml.doc
      "The status of the compliance item. An item is either COMPLIANT or NON_COMPLIANT.\n"];
  severity: compliance_severity
    [@ocaml.doc
      "The severity of the compliance status. Severity can be one of the following: Critical, High, Medium, Low, Informational, Unspecified.\n"];
  title: compliance_item_title option
    [@ocaml.doc
      "The title of the compliance item. For example, if the compliance item is a Windows patch, the title could be the title of the KB article for the patch; for example: Security Update for Active Directory Federation Services. \n"];
  id: compliance_item_id option
    [@ocaml.doc
      "The compliance item ID. For example, if the compliance item is a Windows patch, the ID could be the number of the KB article.\n"]}
[@@ocaml.doc "Information about a compliance item.\n"]
type nonrec compliance_item_entry_list = compliance_item_entry list[@@ocaml.doc
                                                                    ""]
type nonrec compliance_item_content_hash = string[@@ocaml.doc ""]
type nonrec compliance_upload_type =
  | Partial [@ocaml.doc ""]
  | Complete [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec put_compliance_items_request =
  {
  upload_type: compliance_upload_type option
    [@ocaml.doc
      "The mode for uploading compliance items. You can specify [COMPLETE] or [PARTIAL]. In [COMPLETE] mode, the system overwrites all existing compliance information for the resource. You must provide a full list of compliance items each time you send the request.\n\n In [PARTIAL] mode, the system overwrites compliance information for a specific association. The association must be configured with [SyncCompliance] set to [MANUAL]. By default, all requests use [COMPLETE] mode.\n \n   This attribute is only valid for association compliance.\n   \n    "];
  item_content_hash: compliance_item_content_hash option
    [@ocaml.doc
      "MD5 or SHA-256 content hash. The content hash is used to determine if existing information should be overwritten or ignored. If the content hashes match, the request to put compliance information is ignored.\n"];
  items: compliance_item_entry_list
    [@ocaml.doc
      "Information about the compliance as defined by the resource type. For example, for a patch compliance type, [Items] includes information about the PatchSeverity, Classification, and so on.\n"];
  execution_summary: compliance_execution_summary
    [@ocaml.doc
      "A summary of the call execution that includes an execution ID, the type of execution (for example, [Command]), and the date/time of the execution using a datetime object that is saved in the following format: [yyyy-MM-dd'T'HH:mm:ss'Z'] \n"];
  compliance_type: compliance_type_name
    [@ocaml.doc
      "Specify the compliance type. For example, specify Association (for a State Manager association), Patch, or Custom:[string].\n"];
  resource_type: compliance_resource_type
    [@ocaml.doc
      "Specify the type of resource. [ManagedInstance] is currently the only supported resource type.\n"];
  resource_id: compliance_resource_id
    [@ocaml.doc
      "Specify an ID for this resource. For a managed node, this is the node ID.\n"]}
[@@ocaml.doc ""]
type nonrec compliance_type_count_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You specified too many custom compliance types. You can specify a maximum of 10 different types. \n"]
type nonrec progress_counters =
  {
  timed_out_steps: integer option
    [@ocaml.doc
      "The total number of steps that timed out in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.\n"];
  cancelled_steps: integer option
    [@ocaml.doc
      "The total number of steps that the system cancelled in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.\n"];
  failed_steps: integer option
    [@ocaml.doc
      "The total number of steps that failed to run in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.\n"];
  success_steps: integer option
    [@ocaml.doc
      "The total number of steps that successfully completed in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.\n"];
  total_steps: integer option
    [@ocaml.doc
      "The total number of steps run in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.\n"]}
[@@ocaml.doc
  "An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager console for a multi-Region and multi-account Automation execution.\n"]
type nonrec product = string[@@ocaml.doc ""]
type nonrec platform_version = string[@@ocaml.doc ""]
type nonrec platform_name = string[@@ocaml.doc ""]
type nonrec ping_status =
  | INACTIVE [@ocaml.doc ""]
  | CONNECTION_LOST [@ocaml.doc ""]
  | ONLINE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_version = string[@@ocaml.doc ""]
type nonrec patch_vendor = string[@@ocaml.doc ""]
type nonrec patch_unreported_not_applicable_count = int[@@ocaml.doc ""]
type nonrec patch_title = string[@@ocaml.doc ""]
type nonrec patch_deployment_status =
  | ExplicitRejected [@ocaml.doc ""]
  | ExplicitApproved [@ocaml.doc ""]
  | PendingApproval [@ocaml.doc ""]
  | Approved [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_status =
  {
  approval_date: date_time option
    [@ocaml.doc
      "The date the patch was approved (or will be approved if the status is [PENDING_APPROVAL]).\n"];
  compliance_level: patch_compliance_level option
    [@ocaml.doc "The compliance severity level for a patch.\n"];
  deployment_status: patch_deployment_status option
    [@ocaml.doc "The approval status of a patch.\n"]}[@@ocaml.doc
                                                       "Information about the approval status of a patch.\n"]
type nonrec patch_severity = string[@@ocaml.doc ""]
type nonrec patch_set =
  | Application [@ocaml.doc ""]
  | Os [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_security_non_compliant_count = int[@@ocaml.doc ""]
type nonrec patch_repository = string[@@ocaml.doc ""]
type nonrec patch_release = string[@@ocaml.doc ""]
type nonrec patch_property_entry = (attribute_name * attribute_value) list
[@@ocaml.doc ""]
type nonrec patch_property =
  | PatchSeverity [@ocaml.doc ""]
  | PatchPriority [@ocaml.doc ""]
  | PatchMsrcSeverity [@ocaml.doc ""]
  | PatchClassification [@ocaml.doc ""]
  | PatchProductFamily [@ocaml.doc ""]
  | Product [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_properties_list = patch_property_entry list[@@ocaml.doc ""]
type nonrec patch_product_family = string[@@ocaml.doc ""]
type nonrec patch_product = string[@@ocaml.doc ""]
type nonrec patch_other_non_compliant_count = int[@@ocaml.doc ""]
type nonrec patch_orchestrator_filter_value = string[@@ocaml.doc ""]
type nonrec patch_orchestrator_filter_values =
  patch_orchestrator_filter_value list[@@ocaml.doc ""]
type nonrec patch_orchestrator_filter_key = string[@@ocaml.doc ""]
type nonrec patch_orchestrator_filter =
  {
  values: patch_orchestrator_filter_values option
    [@ocaml.doc "The value for the filter.\n"];
  key: patch_orchestrator_filter_key option
    [@ocaml.doc "The key for the filter.\n"]}[@@ocaml.doc
                                               "Defines a filter used in Patch Manager APIs. Supported filter keys depend on the API operation that includes the filter. Patch Manager API operations that use [PatchOrchestratorFilter] include the following:\n\n {ul\n       {-   [DescribeAvailablePatches] \n           \n            }\n       {-   [DescribeInstancePatches] \n           \n            }\n       {-   [DescribePatchBaselines] \n           \n            }\n       {-   [DescribePatchGroups] \n           \n            }\n       }\n  "]
type nonrec patch_orchestrator_filter_list = patch_orchestrator_filter list
[@@ocaml.doc ""]
type nonrec patch_operation_type =
  | INSTALL [@ocaml.doc ""]
  | SCAN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_not_applicable_count = int[@@ocaml.doc ""]
type nonrec patch_name = string[@@ocaml.doc ""]
type nonrec patch_msrc_severity = string[@@ocaml.doc ""]
type nonrec patch_msrc_number = string[@@ocaml.doc ""]
type nonrec patch_missing_count = int[@@ocaml.doc ""]
type nonrec patch_description = string[@@ocaml.doc ""]
type nonrec patch_content_url = string[@@ocaml.doc ""]
type nonrec patch_classification = string[@@ocaml.doc ""]
type nonrec patch_kb_number = string[@@ocaml.doc ""]
type nonrec patch_language = string[@@ocaml.doc ""]
type nonrec patch_advisory_id = string[@@ocaml.doc ""]
type nonrec patch_advisory_id_list = patch_advisory_id list[@@ocaml.doc ""]
type nonrec patch_bugzilla_id = string[@@ocaml.doc ""]
type nonrec patch_bugzilla_id_list = patch_bugzilla_id list[@@ocaml.doc ""]
type nonrec patch_cve_id = string[@@ocaml.doc ""]
type nonrec patch_cve_id_list = patch_cve_id list[@@ocaml.doc ""]
type nonrec patch_epoch = int[@@ocaml.doc ""]
type nonrec patch_arch = string[@@ocaml.doc ""]
type nonrec patch =
  {
  repository: patch_repository option
    [@ocaml.doc
      "The source patch repository for the operating system and version, such as [trusty-security] for Ubuntu Server 14.04 LTE and [focal-security] for Ubuntu Server 20.04 LTE. Applies to Linux-based managed nodes only.\n"];
  severity: patch_severity option
    [@ocaml.doc
      "The severity level of the patch. For example, [CRITICAL] or [MODERATE].\n"];
  arch: patch_arch option
    [@ocaml.doc
      "The architecture of the patch. For example, in [example-pkg-0.710.10-2.7.abcd.x86_64], the architecture is indicated by [x86_64]. Applies to Linux-based managed nodes only.\n"];
  release: patch_release option
    [@ocaml.doc
      "The particular release of a patch. For example, in [pkg-example-EE-20180914-2.2.amzn1.noarch], the release is [2.amaz1]. Applies to Linux-based managed nodes only.\n"];
  version: patch_version option
    [@ocaml.doc
      "The version number of the patch. For example, in [example-pkg-1.710.10-2.7.abcd.x86_64], the version number is indicated by [-1]. Applies to Linux-based managed nodes only.\n"];
  epoch: patch_epoch option
    [@ocaml.doc
      "The epoch of the patch. For example in [pkg-example-EE-20180914-2.2.amzn1.noarch], the epoch value is [20180914-2]. Applies to Linux-based managed nodes only.\n"];
  name: patch_name option
    [@ocaml.doc
      "The name of the patch. Applies to Linux-based managed nodes only.\n"];
  cve_ids: patch_cve_id_list option
    [@ocaml.doc
      "The Common Vulnerabilities and Exposures (CVE) ID of the patch. For example, [CVE-2011-3192]. Applies to Linux-based managed nodes only.\n"];
  bugzilla_ids: patch_bugzilla_id_list option
    [@ocaml.doc
      "The Bugzilla ID of the patch. For example, [1600646]. Applies to Linux-based managed nodes only.\n"];
  advisory_ids: patch_advisory_id_list option
    [@ocaml.doc
      "The Advisory ID of the patch. For example, [RHSA-2020:3779]. Applies to Linux-based managed nodes only.\n"];
  language: patch_language option
    [@ocaml.doc "The language of the patch if it's language-specific.\n"];
  msrc_number: patch_msrc_number option
    [@ocaml.doc
      "The ID of the Microsoft Security Response Center (MSRC) bulletin the patch is related to. For example, [MS14-045]. Applies to Windows patches only.\n"];
  kb_number: patch_kb_number option
    [@ocaml.doc
      "The Microsoft Knowledge Base ID of the patch. Applies to Windows patches only.\n"];
  msrc_severity: patch_msrc_severity option
    [@ocaml.doc
      "The severity of the patch, such as [Critical], [Important], or [Moderate]. Applies to Windows patches only.\n"];
  classification: patch_classification option
    [@ocaml.doc
      "The classification of the patch. For example, [SecurityUpdates], [Updates], or [CriticalUpdates].\n"];
  product: patch_product option
    [@ocaml.doc
      "The specific product the patch is applicable for. For example, [WindowsServer2016] or [AmazonLinux2018.03].\n"];
  product_family: patch_product_family option
    [@ocaml.doc
      "The product family the patch is applicable for. For example, [Windows] or [Amazon Linux 2].\n"];
  vendor: patch_vendor option
    [@ocaml.doc "The name of the vendor providing the patch.\n"];
  content_url: patch_content_url option
    [@ocaml.doc
      "The URL where more information can be obtained about the patch.\n"];
  description: patch_description option
    [@ocaml.doc "The description of the patch.\n"];
  title: patch_title option [@ocaml.doc "The title of the patch.\n"];
  release_date: date_time option
    [@ocaml.doc "The date the patch was released.\n"];
  id: patch_id option
    [@ocaml.doc
      "The ID of the patch. Applies to Windows patches only.\n\n  This ID isn't the same as the Microsoft Knowledge Base ID.\n  \n   "]}
[@@ocaml.doc "Represents metadata about a patch.\n"]
type nonrec patch_list = patch list[@@ocaml.doc ""]
type nonrec patch_installed_rejected_count = int[@@ocaml.doc ""]
type nonrec patch_installed_pending_reboot_count = int[@@ocaml.doc ""]
type nonrec patch_installed_other_count = int[@@ocaml.doc ""]
type nonrec patch_installed_count = int[@@ocaml.doc ""]
type nonrec default_baseline = bool[@@ocaml.doc ""]
type nonrec patch_baseline_identity =
  {
  default_baseline: default_baseline option
    [@ocaml.doc
      "Indicates whether this is the default baseline. Amazon Web Services Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.\n"];
  baseline_description: baseline_description option
    [@ocaml.doc "The description of the patch baseline.\n"];
  operating_system: operating_system option
    [@ocaml.doc
      "Defines the operating system the patch baseline applies to. The default value is [WINDOWS]. \n"];
  baseline_name: baseline_name option
    [@ocaml.doc "The name of the patch baseline.\n"];
  baseline_id: baseline_id option
    [@ocaml.doc "The ID of the patch baseline.\n"]}[@@ocaml.doc
                                                     "Defines the basic information about a patch baseline.\n"]
type nonrec patch_group_patch_baseline_mapping =
  {
  baseline_identity: patch_baseline_identity option
    [@ocaml.doc "The patch baseline the patch group is registered with.\n"];
  patch_group: patch_group option
    [@ocaml.doc
      "The name of the patch group registered with the patch baseline.\n"]}
[@@ocaml.doc
  "The mapping between a patch group and the patch baseline the patch group is registered with.\n"]
type nonrec patch_group_patch_baseline_mapping_list =
  patch_group_patch_baseline_mapping list[@@ocaml.doc ""]
type nonrec patch_group_list = patch_group list[@@ocaml.doc ""]
type nonrec patch_failed_count = int[@@ocaml.doc ""]
type nonrec patch_critical_non_compliant_count = int[@@ocaml.doc ""]
type nonrec patch_compliance_max_results = int[@@ocaml.doc ""]
type nonrec patch_compliance_data_state =
  | AvailableSecurityUpdate [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | NotApplicable [@ocaml.doc ""]
  | Missing [@ocaml.doc ""]
  | InstalledRejected [@ocaml.doc ""]
  | InstalledPendingReboot [@ocaml.doc ""]
  | InstalledOther [@ocaml.doc ""]
  | Installed [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec patch_cve_ids = string[@@ocaml.doc ""]
type nonrec patch_compliance_data =
  {
  cve_ids: patch_cve_ids option
    [@ocaml.doc
      "The IDs of one or more Common Vulnerabilities and Exposure (CVE) issues that are resolved by the patch.\n\n  Currently, CVE ID values are reported only for patches with a status of [Missing] or [Failed].\n  \n   "];
  installed_time: date_time
    [@ocaml.doc
      "The date/time the patch was installed on the managed node. Not all operating systems provide this level of information.\n"];
  state: patch_compliance_data_state
    [@ocaml.doc
      "The state of the patch on the managed node, such as INSTALLED or FAILED.\n\n For descriptions of each patch state, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/compliance-about.html#compliance-monitor-patch}About patch compliance} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  severity: patch_severity
    [@ocaml.doc
      "The severity of the patch such as [Critical], [Important], and [Moderate].\n"];
  classification: patch_classification
    [@ocaml.doc
      "The classification of the patch, such as [SecurityUpdates], [Updates], and [CriticalUpdates].\n"];
  kb_id: patch_kb_number
    [@ocaml.doc "The operating system-specific ID of the patch.\n"];
  title: patch_title [@ocaml.doc "The title of the patch.\n"]}[@@ocaml.doc
                                                                "Information about the state of a patch on a particular managed node as it relates to the patch baseline used to patch the node.\n"]
type nonrec patch_compliance_data_list = patch_compliance_data list[@@ocaml.doc
                                                                    ""]
type nonrec patch_baseline_max_results = int[@@ocaml.doc ""]
type nonrec patch_baseline_identity_list = patch_baseline_identity list
[@@ocaml.doc ""]
type nonrec patch_available_security_update_count = int[@@ocaml.doc ""]
type nonrec parameters_filter_value = string[@@ocaml.doc ""]
type nonrec parameters_filter_value_list = parameters_filter_value list
[@@ocaml.doc ""]
type nonrec parameters_filter_key =
  | KEY_ID [@ocaml.doc ""]
  | TYPE [@ocaml.doc ""]
  | NAME [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec parameters_filter =
  {
  values: parameters_filter_value_list [@ocaml.doc "The filter values.\n"];
  key: parameters_filter_key [@ocaml.doc "The name of the filter.\n"]}
[@@ocaml.doc
  "This data type is deprecated. Instead, use [ParameterStringFilter].\n"]
type nonrec parameters_filter_list = parameters_filter list[@@ocaml.doc ""]
type nonrec parameter_version_label_limit_exceeded =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "A parameter version can have a maximum of ten labels.\n"]
type nonrec parameter_string_query_option = string[@@ocaml.doc ""]
type nonrec parameter_string_filter_value = string[@@ocaml.doc ""]
type nonrec parameter_string_filter_value_list =
  parameter_string_filter_value list[@@ocaml.doc ""]
type nonrec parameter_string_filter_key = string[@@ocaml.doc ""]
type nonrec parameter_string_filter =
  {
  values: parameter_string_filter_value_list option
    [@ocaml.doc "The value you want to search for.\n"];
  option_: parameter_string_query_option option
    [@ocaml.doc
      "For all filters used with [DescribeParameters], valid options include [Equals] and [BeginsWith]. The [Name] filter additionally supports the [Contains] option. (Exception: For filters using the key [Path], valid options include [Recursive] and [OneLevel].)\n\n For filters used with [GetParametersByPath], valid options include [Equals] and [BeginsWith]. (Exception: For filters using [Label] as the Key name, the only valid option is [Equals].)\n "];
  key: parameter_string_filter_key
    [@ocaml.doc
      "The name of the filter.\n\n The [ParameterStringFilter] object is used by the [DescribeParameters] and [GetParametersByPath] API operations. However, not all of the pattern values listed for [Key] can be used with both operations.\n \n  For [DescribeParameters], all of the listed patterns are valid except [Label].\n  \n   For [GetParametersByPath], the following patterns listed for [Key] aren't valid: [tag], [DataType], [Name], [Path], and [Tier].\n   \n    For examples of Amazon Web Services CLI commands demonstrating valid parameter filter constructions, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-search.html}Searching for Systems Manager parameters} in the {i Amazon Web Services Systems Manager User Guide}.\n    "]}
[@@ocaml.doc
  "One or more filters. Use a filter to return a more specific list of results.\n"]
type nonrec parameter_string_filter_list = parameter_string_filter list
[@@ocaml.doc ""]
type nonrec parameter_inline_policy =
  {
  policy_status: string_ option
    [@ocaml.doc
      "The status of the policy. Policies report the following statuses: Pending (the policy hasn't been enforced or applied yet), Finished (the policy was applied), Failed (the policy wasn't applied), or InProgress (the policy is being applied now). \n"];
  policy_type: string_ option
    [@ocaml.doc
      "The type of policy. Parameter Store, a tool in Amazon Web Services Systems Manager, supports the following policy types: Expiration, ExpirationNotification, and NoChangeNotification. \n"];
  policy_text: string_ option [@ocaml.doc "The JSON text of the policy.\n"]}
[@@ocaml.doc "One or more policies assigned to a parameter.\n"]
type nonrec parameter_policy_list = parameter_inline_policy list[@@ocaml.doc
                                                                  ""]
type nonrec parameter_name_list = ps_parameter_name list[@@ocaml.doc ""]
type nonrec parameter_metadata =
  {
  data_type: parameter_data_type option
    [@ocaml.doc
      "The data type of the parameter, such as [text] or [aws:ec2:image]. The default is [text].\n"];
  policies: parameter_policy_list option
    [@ocaml.doc "A list of policies associated with a parameter.\n"];
  tier: parameter_tier option [@ocaml.doc "The parameter tier.\n"];
  version: ps_parameter_version option
    [@ocaml.doc "The parameter version.\n"];
  allowed_pattern: allowed_pattern option
    [@ocaml.doc
      "A parameter name can include only the following letters and symbols.\n\n a-zA-Z0-9_.-\n "];
  description: parameter_description option
    [@ocaml.doc "Description of the parameter actions.\n"];
  last_modified_user: string_ option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the Amazon Web Services user who last changed the parameter.\n"];
  last_modified_date: date_time option
    [@ocaml.doc "Date the parameter was last changed or updated.\n"];
  key_id: parameter_key_id option
    [@ocaml.doc
      "The alias of the Key Management Service (KMS) key used to encrypt the parameter. Applies to [SecureString] parameters only.\n"];
  type_: parameter_type option
    [@ocaml.doc
      "The type of parameter. Valid parameter types include the following: [String], [StringList], and [SecureString].\n"];
  ar_n: string_ option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the parameter.\n"];
  name: ps_parameter_name option [@ocaml.doc "The parameter name.\n"]}
[@@ocaml.doc
  "Metadata includes information like the Amazon Resource Name (ARN) of the last user to update the parameter and the date and time the parameter was last used.\n"]
type nonrec parameter_metadata_list = parameter_metadata list[@@ocaml.doc ""]
type nonrec ps_parameter_selector = string[@@ocaml.doc ""]
type nonrec parameter =
  {
  data_type: parameter_data_type option
    [@ocaml.doc
      "The data type of the parameter, such as [text] or [aws:ec2:image]. The default is [text].\n"];
  ar_n: string_ option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the parameter.\n"];
  last_modified_date: date_time option
    [@ocaml.doc
      "Date the parameter was last changed or updated and the parameter version was created.\n"];
  source_result: string_ option
    [@ocaml.doc
      "Applies to parameters that reference information in other Amazon Web Services services. [SourceResult] is the raw result or response from the source.\n"];
  selector: ps_parameter_selector option
    [@ocaml.doc
      "Either the version number or the label used to retrieve the parameter value. Specify selectors by using one of the following formats:\n\n parameter_name:version\n \n  parameter_name:label\n  "];
  version: ps_parameter_version option
    [@ocaml.doc "The parameter version.\n"];
  value: ps_parameter_value option
    [@ocaml.doc
      "The parameter value.\n\n  If type is [StringList], the system returns a comma-separated string with no spaces between commas in the [Value] field.\n  \n   "];
  type_: parameter_type option
    [@ocaml.doc
      "The type of parameter. Valid values include the following: [String], [StringList], and [SecureString].\n\n  If type is [StringList], the system returns a comma-separated string with no spaces between commas in the [Value] field.\n  \n   "];
  name: ps_parameter_name option [@ocaml.doc "The name of the parameter.\n"]}
[@@ocaml.doc
  "An Amazon Web Services Systems Manager parameter in Parameter Store.\n"]
type nonrec parameter_list = parameter list[@@ocaml.doc ""]
type nonrec parameter_history =
  {
  data_type: parameter_data_type option
    [@ocaml.doc
      "The data type of the parameter, such as [text] or [aws:ec2:image]. The default is [text].\n"];
  policies: parameter_policy_list option
    [@ocaml.doc
      "Information about the policies assigned to a parameter.\n\n  {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html}Assigning parameter policies} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  tier: parameter_tier option [@ocaml.doc "The parameter tier.\n"];
  labels: parameter_label_list option
    [@ocaml.doc "Labels assigned to the parameter version.\n"];
  version: ps_parameter_version option
    [@ocaml.doc "The parameter version.\n"];
  allowed_pattern: allowed_pattern option
    [@ocaml.doc
      "Parameter names can include the following letters and symbols.\n\n a-zA-Z0-9_.-\n "];
  value: ps_parameter_value option [@ocaml.doc "The parameter value.\n"];
  description: parameter_description option
    [@ocaml.doc "Information about the parameter.\n"];
  last_modified_user: string_ option
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the Amazon Web Services user who last changed the parameter.\n"];
  last_modified_date: date_time option
    [@ocaml.doc "Date the parameter was last changed or updated.\n"];
  key_id: parameter_key_id option
    [@ocaml.doc
      "The alias of the Key Management Service (KMS) key used to encrypt the parameter. Applies to [SecureString] parameters only\n"];
  type_: parameter_type option [@ocaml.doc "The type of parameter used.\n"];
  name: ps_parameter_name option [@ocaml.doc "The name of the parameter.\n"]}
[@@ocaml.doc "Information about parameter usage.\n"]
type nonrec parameter_history_list = parameter_history list[@@ocaml.doc ""]
type nonrec output_source_type = string[@@ocaml.doc ""]
type nonrec output_source_id = string[@@ocaml.doc ""]
type nonrec output_source =
  {
  output_source_type: output_source_type option
    [@ocaml.doc
      "The type of source where the association execution details are stored, for example, Amazon S3.\n"];
  output_source_id: output_source_id option
    [@ocaml.doc
      "The ID of the output source, for example the URL of an S3 bucket.\n"]}
[@@ocaml.doc
  "Information about the source where the association execution details are stored.\n"]
type nonrec ops_data_type_name = string[@@ocaml.doc ""]
type nonrec ops_result_attribute =
  {
  type_name: ops_data_type_name
    [@ocaml.doc
      "Name of the data type. Valid value: [AWS:OpsItem], [AWS:EC2InstanceInformation], [AWS:OpsItemTrendline], or [AWS:ComplianceSummary].\n"]}
[@@ocaml.doc "The OpsItem data type to return.\n"]
type nonrec ops_result_attribute_list = ops_result_attribute list[@@ocaml.doc
                                                                   ""]
type nonrec ops_metadata_resource_id = string[@@ocaml.doc ""]
type nonrec ops_metadata =
  {
  creation_date: date_time option
    [@ocaml.doc "The date the OpsMetadata objects was created.\n"];
  last_modified_user: string_ option
    [@ocaml.doc "The user name who last updated the OpsMetadata object.\n"];
  last_modified_date: date_time option
    [@ocaml.doc "The date the OpsMetadata object was last updated.\n"];
  ops_metadata_arn: ops_metadata_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the OpsMetadata Object or blob.\n"];
  resource_id: ops_metadata_resource_id option
    [@ocaml.doc "The ID of the Application Manager application.\n"]}[@@ocaml.doc
                                                                    "Operational metadata for an application in Application Manager.\n"]
type nonrec ops_metadata_list = ops_metadata list[@@ocaml.doc ""]
type nonrec ops_metadata_limit_exceeded_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "Your account reached the maximum number of OpsMetadata objects allowed by Application Manager. The maximum is 200 OpsMetadata objects. Delete one or more OpsMetadata object and try again.\n"]
type nonrec ops_metadata_filter_value = string[@@ocaml.doc ""]
type nonrec ops_metadata_filter_value_list = ops_metadata_filter_value list
[@@ocaml.doc ""]
type nonrec ops_metadata_filter_key = string[@@ocaml.doc ""]
type nonrec ops_metadata_filter =
  {
  values: ops_metadata_filter_value_list [@ocaml.doc "A filter value.\n"];
  key: ops_metadata_filter_key [@ocaml.doc "A filter key.\n"]}[@@ocaml.doc
                                                                "A filter to limit the number of OpsMetadata objects displayed.\n"]
type nonrec ops_metadata_filter_list = ops_metadata_filter list[@@ocaml.doc
                                                                 ""]
type nonrec ops_metadata_already_exists_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "An OpsMetadata object already exists for the selected resource.\n"]
type nonrec ops_item_type = string[@@ocaml.doc ""]
type nonrec ops_item_source = string[@@ocaml.doc ""]
type nonrec ops_item_summary =
  {
  planned_end_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  planned_start_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  actual_end_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  actual_start_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  ops_item_type: ops_item_type option
    [@ocaml.doc
      "The type of OpsItem. Systems Manager supports the following types of OpsItems:\n\n {ul\n       {-   [/aws/issue] \n           \n            This type of OpsItem is used for default OpsItems created by OpsCenter. \n            \n             }\n       {-   [/aws/changerequest] \n           \n            This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change requests. \n            \n             }\n       {-   [/aws/insight] \n           \n            This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems. \n            \n             }\n       }\n  "];
  severity: ops_item_severity option
    [@ocaml.doc "A list of OpsItems by severity.\n"];
  category: ops_item_category option
    [@ocaml.doc "A list of OpsItems by category.\n"];
  operational_data: ops_item_operational_data option
    [@ocaml.doc
      "Operational data is custom data that provides useful reference details about the OpsItem. \n"];
  title: ops_item_title option
    [@ocaml.doc
      "A short heading that describes the nature of the OpsItem and the impacted resource.\n"];
  ops_item_id: ops_item_id option [@ocaml.doc "The ID of the OpsItem.\n"];
  status: ops_item_status option [@ocaml.doc "The OpsItem status.\n"];
  source: ops_item_source option
    [@ocaml.doc "The impacted Amazon Web Services resource.\n"];
  priority: ops_item_priority option
    [@ocaml.doc
      "The importance of this OpsItem in relation to other OpsItems in the system.\n"];
  last_modified_time: date_time option
    [@ocaml.doc "The date and time the OpsItem was last updated.\n"];
  last_modified_by: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.\n"];
  created_time: date_time option
    [@ocaml.doc "The date and time the OpsItem was created.\n"];
  created_by: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.\n"]}
[@@ocaml.doc "A count of OpsItems.\n"]
type nonrec ops_item_summaries = ops_item_summary list[@@ocaml.doc ""]
type nonrec ops_item_related_items_max_results = int[@@ocaml.doc ""]
type nonrec ops_item_related_items_filter_key =
  | RESOURCE_URI [@ocaml.doc ""]
  | ASSOCIATION_ID [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_related_items_filter_value = string[@@ocaml.doc ""]
type nonrec ops_item_related_items_filter_values =
  ops_item_related_items_filter_value list[@@ocaml.doc ""]
type nonrec ops_item_related_items_filter_operator =
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_related_items_filter =
  {
  operator: ops_item_related_items_filter_operator
    [@ocaml.doc
      "The operator used by the filter call. The only supported operator is [EQUAL].\n"];
  values: ops_item_related_items_filter_values
    [@ocaml.doc "The values for the filter.\n"];
  key: ops_item_related_items_filter_key
    [@ocaml.doc
      "The name of the filter key. Supported values include [ResourceUri], [ResourceType], or [AssociationId].\n"]}
[@@ocaml.doc
  "Describes a filter for a specific list of related-item resources. \n"]
type nonrec ops_item_related_items_filters =
  ops_item_related_items_filter list[@@ocaml.doc ""]
type nonrec ops_item_related_item_association_id = string[@@ocaml.doc ""]
type nonrec ops_item_related_item_association_resource_type = string[@@ocaml.doc
                                                                    ""]
type nonrec ops_item_related_item_association_type = string[@@ocaml.doc ""]
type nonrec ops_item_related_item_association_resource_uri = string[@@ocaml.doc
                                                                    ""]
type nonrec ops_item_identity =
  {
  arn: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem event.\n"]}
[@@ocaml.doc
  "Information about the user or resource that created an OpsItem event.\n"]
type nonrec ops_item_related_item_summary =
  {
  last_modified_time: date_time option
    [@ocaml.doc "The time the related-item association was last updated.\n"];
  last_modified_by: ops_item_identity option [@ocaml.doc ""];
  created_time: date_time option
    [@ocaml.doc "The time the related-item association was created.\n"];
  created_by: ops_item_identity option [@ocaml.doc ""];
  resource_uri: ops_item_related_item_association_resource_uri option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the related-item resource.\n"];
  association_type: ops_item_related_item_association_type option
    [@ocaml.doc "The association type.\n"];
  resource_type: ops_item_related_item_association_resource_type option
    [@ocaml.doc "The resource type.\n"];
  association_id: ops_item_related_item_association_id option
    [@ocaml.doc "The association ID.\n"];
  ops_item_id: ops_item_id option [@ocaml.doc "The OpsItem ID.\n"]}[@@ocaml.doc
                                                                    "Summary information about related-item resources for an OpsItem.\n"]
type nonrec ops_item_related_item_summaries =
  ops_item_related_item_summary list[@@ocaml.doc ""]
type nonrec ops_item_related_item_association_not_found_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The association wasn't found using the parameters you specified in the call. Verify the information and try again.\n"]
type nonrec ops_item_related_item_already_exists_exception =
  {
  ops_item_id: ops_item_id option [@ocaml.doc ""];
  resource_uri: ops_item_related_item_association_resource_uri option
    [@ocaml.doc ""];
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The Amazon Resource Name (ARN) is already associated with the OpsItem.\n"]
type nonrec ops_item_max_results = int[@@ocaml.doc ""]
type nonrec ops_item_filter_key =
  | ACCOUNT_ID [@ocaml.doc ""]
  | INSIGHT_TYPE [@ocaml.doc ""]
  | CHANGE_REQUEST_TARGETS_RESOURCE_GROUP [@ocaml.doc ""]
  | CHANGE_REQUEST_TEMPLATE [@ocaml.doc ""]
  | CHANGE_REQUEST_APPROVER_NAME [@ocaml.doc ""]
  | CHANGE_REQUEST_APPROVER_ARN [@ocaml.doc ""]
  | CHANGE_REQUEST_REQUESTER_NAME [@ocaml.doc ""]
  | CHANGE_REQUEST_REQUESTER_ARN [@ocaml.doc ""]
  | ACCESS_REQUEST_TARGET_RESOURCE_ID [@ocaml.doc ""]
  | ACCESS_REQUEST_IS_REPLICA [@ocaml.doc ""]
  | ACCESS_REQUEST_SOURCE_REGION [@ocaml.doc ""]
  | ACCESS_REQUEST_SOURCE_OPS_ITEM_ID [@ocaml.doc ""]
  | ACCESS_REQUEST_SOURCE_ACCOUNT_ID [@ocaml.doc ""]
  | ACCESS_REQUEST_APPROVER_ID [@ocaml.doc ""]
  | ACCESS_REQUEST_APPROVER_ARN [@ocaml.doc ""]
  | ACCESS_REQUEST_REQUESTER_ID [@ocaml.doc ""]
  | ACCESS_REQUEST_REQUESTER_ARN [@ocaml.doc ""]
  | OPSITEM_TYPE [@ocaml.doc ""]
  | SEVERITY [@ocaml.doc ""]
  | CATEGORY [@ocaml.doc ""]
  | AUTOMATION_ID [@ocaml.doc ""]
  | RESOURCE_ID [@ocaml.doc ""]
  | OPERATIONAL_DATA_VALUE [@ocaml.doc ""]
  | OPERATIONAL_DATA_KEY [@ocaml.doc ""]
  | OPERATIONAL_DATA [@ocaml.doc ""]
  | PLANNED_END_TIME [@ocaml.doc ""]
  | PLANNED_START_TIME [@ocaml.doc ""]
  | ACTUAL_END_TIME [@ocaml.doc ""]
  | ACTUAL_START_TIME [@ocaml.doc ""]
  | LAST_MODIFIED_TIME [@ocaml.doc ""]
  | CREATED_TIME [@ocaml.doc ""]
  | OPSITEM_ID [@ocaml.doc ""]
  | TITLE [@ocaml.doc ""]
  | PRIORITY [@ocaml.doc ""]
  | SOURCE [@ocaml.doc ""]
  | CREATED_BY [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_filter_value = string[@@ocaml.doc ""]
type nonrec ops_item_filter_values = ops_item_filter_value list[@@ocaml.doc
                                                                 ""]
type nonrec ops_item_filter_operator =
  | LESS_THAN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_filter =
  {
  operator: ops_item_filter_operator
    [@ocaml.doc "The operator used by the filter call.\n"];
  values: ops_item_filter_values [@ocaml.doc "The filter value.\n"];
  key: ops_item_filter_key [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                                                    "Describes an OpsItem filter.\n"]
type nonrec ops_item_filters = ops_item_filter list[@@ocaml.doc ""]
type nonrec ops_item_event_summary =
  {
  created_time: date_time option
    [@ocaml.doc "The date and time the OpsItem event was created.\n"];
  created_by: ops_item_identity option
    [@ocaml.doc
      "Information about the user or resource that created the OpsItem event.\n"];
  detail: string_ option
    [@ocaml.doc "Specific information about the OpsItem event.\n"];
  detail_type: string_ option
    [@ocaml.doc "The type of information provided as a detail.\n"];
  source: string_ option [@ocaml.doc "The source of the OpsItem event.\n"];
  event_id: string_ option [@ocaml.doc "The ID of the OpsItem event.\n"];
  ops_item_id: string_ option [@ocaml.doc "The ID of the OpsItem.\n"]}
[@@ocaml.doc
  "Summary information about an OpsItem event or that associated an OpsItem with a related item.\n"]
type nonrec ops_item_event_summaries = ops_item_event_summary list[@@ocaml.doc
                                                                    ""]
type nonrec ops_item_event_max_results = int[@@ocaml.doc ""]
type nonrec ops_item_event_filter_key =
  | OPSITEM_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_event_filter_value = string[@@ocaml.doc ""]
type nonrec ops_item_event_filter_values = ops_item_event_filter_value list
[@@ocaml.doc ""]
type nonrec ops_item_event_filter_operator =
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_item_event_filter =
  {
  operator: ops_item_event_filter_operator
    [@ocaml.doc
      "The operator used by the filter call. Currently, the only supported value is [Equal].\n"];
  values: ops_item_event_filter_values
    [@ocaml.doc
      "The values for the filter, consisting of one or more OpsItem IDs.\n"];
  key: ops_item_event_filter_key
    [@ocaml.doc
      "The name of the filter key. Currently, the only supported value is [OpsItemId].\n"]}
[@@ocaml.doc
  "Describes a filter for a specific list of OpsItem events. You can filter event information by using tags. You specify tags by using a key-value pair mapping. \n"]
type nonrec ops_item_event_filters = ops_item_event_filter list[@@ocaml.doc
                                                                 ""]
type nonrec ops_item_account_id = string[@@ocaml.doc ""]
type nonrec ops_item =
  {
  ops_item_arn: ops_item_arn option
    [@ocaml.doc "The OpsItem Amazon Resource Name (ARN).\n"];
  planned_end_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  planned_start_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  actual_end_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  actual_start_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  severity: ops_item_severity option
    [@ocaml.doc
      "The severity of the OpsItem. Severity options range from 1 to 4.\n"];
  category: ops_item_category option
    [@ocaml.doc
      "An OpsItem category. Category options include: Availability, Cost, Performance, Recovery, Security.\n"];
  operational_data: ops_item_operational_data option
    [@ocaml.doc
      "Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.\n\n  Operational data keys {i can't} begin with the following: [amazon], [aws], [amzn], [ssm], [/amazon], [/aws], [/amzn], [/ssm].\n  \n    You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the [DescribeOpsItems] API operation) can view and search on the specified data. Operational data that isn't searchable is only viewable by users who have access to the OpsItem (as provided by the [GetOpsItem] API operation).\n    \n     Use the [/aws/resources] key in OperationalData to specify a related resource in the request. Use the [/aws/automations] key in OperationalData to associate an Automation runbook with the OpsItem. To view Amazon Web Services CLI example commands that use these keys, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html}Creating OpsItems manually} in the {i Amazon Web Services Systems Manager User Guide}.\n     "];
  source: ops_item_source option
    [@ocaml.doc
      "The origin of the OpsItem, such as Amazon EC2 or Systems Manager. The impacted resource is a subset of source.\n"];
  title: ops_item_title option
    [@ocaml.doc
      "A short heading that describes the nature of the OpsItem and the impacted resource.\n"];
  version: string_ option
    [@ocaml.doc
      "The version of this OpsItem. Each time the OpsItem is edited the version number increments by one.\n"];
  ops_item_id: ops_item_id option [@ocaml.doc "The ID of the OpsItem.\n"];
  status: ops_item_status option
    [@ocaml.doc
      "The OpsItem status. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html}Editing OpsItem details} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  related_ops_items: related_ops_items option
    [@ocaml.doc
      "One or more OpsItems that share something in common with the current OpsItem. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.\n"];
  priority: ops_item_priority option
    [@ocaml.doc
      "The importance of this OpsItem in relation to other OpsItems in the system.\n"];
  notifications: ops_item_notifications option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where notifications are sent when this OpsItem is edited or changed.\n"];
  last_modified_time: date_time option
    [@ocaml.doc "The date and time the OpsItem was last updated.\n"];
  last_modified_by: string_ option
    [@ocaml.doc
      "The ARN of the Amazon Web Services account that last updated the OpsItem.\n"];
  description: ops_item_description option
    [@ocaml.doc "The OpsItem description.\n"];
  created_time: date_time option
    [@ocaml.doc "The date and time the OpsItem was created.\n"];
  ops_item_type: ops_item_type option
    [@ocaml.doc
      "The type of OpsItem. Systems Manager supports the following types of OpsItems:\n\n {ul\n       {-   [/aws/issue] \n           \n            This type of OpsItem is used for default OpsItems created by OpsCenter. \n            \n             }\n       {-   [/aws/changerequest] \n           \n            This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change requests. \n            \n             }\n       {-   [/aws/insight] \n           \n            This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems. \n            \n             }\n       }\n  "];
  created_by: string_ option
    [@ocaml.doc
      "The ARN of the Amazon Web Services account that created the OpsItem.\n"]}
[@@ocaml.doc
  "Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational work items (OpsItems) impacting the performance and health of their Amazon Web Services resources. OpsCenter is integrated with Amazon EventBridge and Amazon CloudWatch. This means you can configure these services to automatically create an OpsItem in OpsCenter when a CloudWatch alarm enters the ALARM state or when EventBridge processes an event from any Amazon Web Services service that publishes events. Configuring Amazon CloudWatch alarms and EventBridge events to automatically create OpsItems allows you to quickly diagnose and remediate issues with Amazon Web Services resources from a single console.\n\n To help you diagnose issues, each OpsItem includes contextually relevant information such as the name and ID of the Amazon Web Services resource that generated the OpsItem, alarm or event details, alarm history, and an alarm timeline graph. For the Amazon Web Services resource, OpsCenter aggregates information from Config, CloudTrail logs, and EventBridge, so you don't have to navigate across multiple console pages during your investigation. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n "]
type nonrec ops_filter_value = string[@@ocaml.doc ""]
type nonrec ops_filter_value_list = ops_filter_value list[@@ocaml.doc ""]
type nonrec ops_filter_operator_type =
  | EXISTS [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | BEGIN_WITH [@ocaml.doc ""]
  | NOT_EQUAL [@ocaml.doc ""]
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ops_filter_key = string[@@ocaml.doc ""]
type nonrec ops_filter =
  {
  type_: ops_filter_operator_type option [@ocaml.doc "The type of filter.\n"];
  values: ops_filter_value_list [@ocaml.doc "The filter value.\n"];
  key: ops_filter_key [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                                                 "A filter for viewing OpsData summaries.\n"]
type nonrec ops_filter_list = ops_filter list[@@ocaml.doc ""]
type nonrec ops_entity_id = string[@@ocaml.doc ""]
type nonrec ops_entity_item_capture_time = string[@@ocaml.doc ""]
type nonrec ops_entity_item_entry = (attribute_name * attribute_value) list
[@@ocaml.doc ""]
type nonrec ops_entity_item_entry_list = ops_entity_item_entry list[@@ocaml.doc
                                                                    ""]
type nonrec ops_entity_item =
  {
  content: ops_entity_item_entry_list option
    [@ocaml.doc "The details of an OpsData summary.\n"];
  capture_time: ops_entity_item_capture_time option
    [@ocaml.doc "The time the OpsData was captured.\n"]}[@@ocaml.doc
                                                          "The OpsData summary.\n"]
type nonrec ops_entity_item_key = string[@@ocaml.doc ""]
type nonrec ops_entity_item_map =
  (ops_entity_item_key * ops_entity_item) list[@@ocaml.doc ""]
type nonrec ops_entity =
  {
  data: ops_entity_item_map option
    [@ocaml.doc "The data returned by the query.\n"];
  id: ops_entity_id option [@ocaml.doc "The query ID.\n"]}[@@ocaml.doc
                                                            "The result of the query.\n"]
type nonrec ops_entity_list = ops_entity list[@@ocaml.doc ""]
type nonrec ops_data_attribute_name = string[@@ocaml.doc ""]
type nonrec ops_aggregator_value = string[@@ocaml.doc ""]
type nonrec ops_aggregator_value_key = string[@@ocaml.doc ""]
type nonrec ops_aggregator_value_map =
  (ops_aggregator_value_key * ops_aggregator_value) list[@@ocaml.doc ""]
type nonrec ops_aggregator_type = string[@@ocaml.doc ""]
type ops_aggregator =
  {
  aggregators: ops_aggregator_list option
    [@ocaml.doc "A nested aggregator for viewing counts of OpsData.\n"];
  filters: ops_filter_list option [@ocaml.doc "The aggregator filters.\n"];
  values: ops_aggregator_value_map option
    [@ocaml.doc "The aggregator value.\n"];
  attribute_name: ops_data_attribute_name option
    [@ocaml.doc
      "The name of an OpsData attribute on which to limit the count of OpsData.\n"];
  type_name: ops_data_type_name option
    [@ocaml.doc "The data type name to use for viewing counts of OpsData.\n"];
  aggregator_type: ops_aggregator_type option
    [@ocaml.doc
      "Either a [Range] or [Count] aggregator for limiting an OpsData summary.\n"]}
[@@ocaml.doc
  "One or more aggregators for viewing counts of OpsData using different dimensions such as [Source], [CreatedTime], or [Source and CreatedTime], to name a few.\n"]
and ops_aggregator_list = ops_aggregator list[@@ocaml.doc ""]
type nonrec node_type_name =
  | INSTANCE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec agent_type = string[@@ocaml.doc ""]
type nonrec agent_version = string[@@ocaml.doc ""]
type nonrec computer_name = string[@@ocaml.doc ""]
type nonrec instance_status = string[@@ocaml.doc ""]
type nonrec ip_address = string[@@ocaml.doc ""]
type nonrec managed_status =
  | UNMANAGED [@ocaml.doc ""]
  | MANAGED [@ocaml.doc ""]
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_info =
  {
  resource_type: resource_type option
    [@ocaml.doc
      "The type of instance, either an EC2 instance or another supported machine type in a hybrid fleet.\n"];
  platform_version: platform_version option
    [@ocaml.doc
      "The version of the OS platform running on your managed node. \n"];
  platform_name: platform_name option
    [@ocaml.doc
      "The name of the operating system platform running on your managed node.\n"];
  platform_type: platform_type option
    [@ocaml.doc "The operating system platform type of the managed node.\n"];
  managed_status: managed_status option
    [@ocaml.doc
      "Indicates whether the node is managed by Systems Manager.\n"];
  ip_address: ip_address option
    [@ocaml.doc "The IP address of the managed node.\n"];
  instance_status: instance_status option
    [@ocaml.doc "The current status of the managed node.\n"];
  computer_name: computer_name option
    [@ocaml.doc "The fully qualified host name of the managed node.\n"];
  agent_version: agent_version option
    [@ocaml.doc "The version number of the agent installed on the node.\n"];
  agent_type: agent_type option
    [@ocaml.doc "The type of agent installed on the node.\n"]}[@@ocaml.doc
                                                                "Details about a specific managed node.\n"]
type nonrec node_type =
  | Instance of instance_info
  [@ocaml.doc "Information about a specific managed node.\n"][@@ocaml.doc
                                                               "Information about a managed node's type.\n"]
type nonrec node_summary = (attribute_name * attribute_value) list[@@ocaml.doc
                                                                    ""]
type nonrec node_summary_list = node_summary list[@@ocaml.doc ""]
type nonrec node_region = string[@@ocaml.doc ""]
type nonrec node_account_id = string[@@ocaml.doc ""]
type nonrec node_organizational_unit_id = string[@@ocaml.doc ""]
type nonrec node_organizational_unit_path = string[@@ocaml.doc ""]
type nonrec node_owner_info =
  {
  organizational_unit_path: node_organizational_unit_path option
    [@ocaml.doc
      "The path for the organizational unit (OU) that owns the managed node. The path for the OU is built using the IDs of the organization, root, and all OUs in the path down to and including the OU. For example:\n\n  [o-a1b2c3d4e5/r-f6g7h8i9j0example/ou-ghi0-awsccccc/ou-jkl0-awsddddd/] \n "];
  organizational_unit_id: node_organizational_unit_id option
    [@ocaml.doc
      "The ID of the organization unit (OU) that the account is part of.\n"];
  account_id: node_account_id option
    [@ocaml.doc
      "The ID of the Amazon Web Services account that owns the managed node.\n"]}
[@@ocaml.doc "Information about ownership of a managed node.\n"]
type nonrec node_capture_time = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc
                                                                 ""]
type nonrec node_id = string[@@ocaml.doc ""]
type nonrec node =
  {
  node_type: node_type option
    [@ocaml.doc "Information about the type of node.\n"];
  region: node_region option
    [@ocaml.doc
      "The Amazon Web Services Region that a managed node was created in or assigned to.\n"];
  owner: node_owner_info option
    [@ocaml.doc "Information about the ownership of the managed node.\n"];
  id: node_id option [@ocaml.doc "The ID of the managed node.\n"];
  capture_time: node_capture_time option
    [@ocaml.doc
      "The UTC timestamp for when the managed node data was last captured.\n"]}
[@@ocaml.doc "Details about an individual managed node.\n"]
type nonrec node_list = node list[@@ocaml.doc ""]
type nonrec node_filter_value = string[@@ocaml.doc ""]
type nonrec node_filter_value_list = node_filter_value list[@@ocaml.doc ""]
type nonrec node_filter_operator_type =
  | BEGIN_WITH [@ocaml.doc ""]
  | NOT_EQUAL [@ocaml.doc ""]
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec node_filter_key =
  | ACCOUNT_ID [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | ORGANIZATIONAL_UNIT_PATH [@ocaml.doc ""]
  | ORGANIZATIONAL_UNIT_ID [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""]
  | PLATFORM_VERSION [@ocaml.doc ""]
  | PLATFORM_TYPE [@ocaml.doc ""]
  | PLATFORM_NAME [@ocaml.doc ""]
  | MANAGED_STATUS [@ocaml.doc ""]
  | IP_ADDRESS [@ocaml.doc ""]
  | INSTANCE_STATUS [@ocaml.doc ""]
  | INSTANCE_ID [@ocaml.doc ""]
  | COMPUTER_NAME [@ocaml.doc ""]
  | AGENT_VERSION [@ocaml.doc ""]
  | AGENT_TYPE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec node_filter =
  {
  type_: node_filter_operator_type option
    [@ocaml.doc "The type of filter operator.\n"];
  values: node_filter_value_list
    [@ocaml.doc
      "A filter value supported by the specified key. For example, for the key [PlatformType], supported values include [Linux] and [Windows].\n"];
  key: node_filter_key [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                                                  "The filters for the operation.\n"]
type nonrec node_filter_list = node_filter list[@@ocaml.doc ""]
type nonrec node_attribute_name =
  | RESOURCE_TYPE [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | PLATFORM_VERSION [@ocaml.doc ""]
  | PLATFORM_TYPE [@ocaml.doc ""]
  | PLATFORM_NAME [@ocaml.doc ""]
  | AGENT_VERSION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec node_aggregator_type =
  | COUNT [@ocaml.doc ""][@@ocaml.doc ""]
type node_aggregator =
  {
  aggregators: node_aggregator_list option
    [@ocaml.doc
      "Information about aggregators used to refine a node summary.\n"];
  attribute_name: node_attribute_name
    [@ocaml.doc
      "The name of a node attribute on which to limit the count of nodes.\n"];
  type_name: node_type_name
    [@ocaml.doc
      "The data type name to use for viewing counts of nodes. Currently, only [Instance] is supported.\n"];
  aggregator_type: node_aggregator_type
    [@ocaml.doc
      "The aggregator type for limiting a node summary. Currently, only [Count] is supported.\n"]}
[@@ocaml.doc
  "One or more aggregators for viewing counts of nodes using different dimensions.\n"]
and node_aggregator_list = node_aggregator list[@@ocaml.doc ""]
type nonrec next_token = string[@@ocaml.doc ""]
type nonrec modify_document_permission_response = unit[@@ocaml.doc ""]
type nonrec document_permission_type =
  | SHARE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec account_id = string[@@ocaml.doc ""]
type nonrec account_id_list = account_id list[@@ocaml.doc ""]
type nonrec modify_document_permission_request =
  {
  shared_document_version: shared_document_version option
    [@ocaml.doc
      "(Optional) The version of the document to share. If it isn't specified, the system choose the [Default] version to share.\n"];
  account_ids_to_remove: account_id_list option
    [@ocaml.doc
      "The Amazon Web Services users that should no longer have access to the document. The Amazon Web Services user can either be a group of account IDs or {i All}. This action has a higher priority than [AccountIdsToAdd]. If you specify an ID to add and the same ID to remove, the system removes access to the document. You must specify a value for this parameter or the [AccountIdsToAdd] parameter.\n"];
  account_ids_to_add: account_id_list option
    [@ocaml.doc
      "The Amazon Web Services users that should have access to the document. The account IDs can either be a group of account IDs or {i All}. You must specify a value for this parameter or the [AccountIdsToRemove] parameter.\n"];
  permission_type: document_permission_type
    [@ocaml.doc
      "The permission type for the document. The permission type can be {i Share}.\n"];
  name: document_name
    [@ocaml.doc "The name of the document that you want to share.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_permission_type =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The permission type isn't supported. {i Share} is the only supported permission type.\n"]
type nonrec document_permission_limit =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The document can't be shared with more Amazon Web Services accounts. You can specify a maximum of 20 accounts per API operation to share a private document.\n\n By default, you can share a private document with a maximum of 1,000 accounts and publicly share up to five documents.\n \n  If you need to increase the quota for privately or publicly shared Systems Manager documents, contact Amazon Web Services Support.\n  "]
type nonrec document_limit_exceeded =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "You can have at most 500 active SSM documents.\n"]
type nonrec max_results_ec2_compatible = int[@@ocaml.doc ""]
type nonrec max_results = int[@@ocaml.doc ""]
type nonrec maintenance_window_identity_for_target =
  {
  name: maintenance_window_name option
    [@ocaml.doc "The name of the maintenance window.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the maintenance window.\n"]}[@@ocaml.doc
                                                         "The maintenance window to which the specified target belongs.\n"]
type nonrec maintenance_windows_for_target_list =
  maintenance_window_identity_for_target list[@@ocaml.doc ""]
type nonrec maintenance_window_task_target_id = string[@@ocaml.doc ""]
type nonrec maintenance_window_task_parameters_list =
  maintenance_window_task_parameters list[@@ocaml.doc ""]
type nonrec maintenance_window_task =
  {
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm applied to your maintenance window task.\n"];
  cutoff_behavior: maintenance_window_task_cutoff_behavior option
    [@ocaml.doc
      "The specification for whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached. \n"];
  description: maintenance_window_description option
    [@ocaml.doc "A description of the task.\n"];
  name: maintenance_window_name option [@ocaml.doc "The task name.\n"];
  max_errors: max_errors option
    [@ocaml.doc
      "The maximum number of errors allowed before this task stops being scheduled.\n\n  Although this element is listed as \"Required: No\", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.\n  \n   For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.\n   \n    "];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets this task can be run for, in parallel.\n\n  Although this element is listed as \"Required: No\", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.\n  \n   For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.\n   \n    "];
  service_role_arn: service_role option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].\n\n However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up Maintenance Windows} in the in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  logging_info: logging_info option
    [@ocaml.doc
      "Information about an S3 bucket to write task-level logs to.\n\n   [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  priority: maintenance_window_task_priority option
    [@ocaml.doc
      "The priority of the task in the maintenance window. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.\n"];
  task_parameters: maintenance_window_task_parameters option
    [@ocaml.doc
      "The parameters that should be passed to the task when it is run.\n\n   [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  targets: targets option
    [@ocaml.doc
      "The targets (either managed nodes or tags). Managed nodes are specified using \n{[\nKey=instanceids,Values=,\n]}\n. Tags are specified using \n{[\nKey=,Values=\n]}\n.\n"];
  type_: maintenance_window_task_type option
    [@ocaml.doc "The type of task.\n"];
  task_arn: maintenance_window_task_arn option
    [@ocaml.doc
      "The resource that the task uses during execution. For [RUN_COMMAND] and [AUTOMATION] task types, [TaskArn] is the Amazon Web Services Systems Manager (SSM document) name or ARN. For [LAMBDA] tasks, it's the function name or ARN. For [STEP_FUNCTIONS] tasks, it's the state machine ARN.\n"];
  window_task_id: maintenance_window_task_id option
    [@ocaml.doc "The task ID.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc
      "The ID of the maintenance window where the task is registered.\n"]}
[@@ocaml.doc "Information about a task defined for a maintenance window.\n"]
type nonrec maintenance_window_task_list = maintenance_window_task list
[@@ocaml.doc ""]
type nonrec maintenance_window_target =
  {
  description: maintenance_window_description option
    [@ocaml.doc "A description for the target.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The name for the maintenance window target.\n"];
  owner_information: owner_information option
    [@ocaml.doc
      "A user-provided value that will be included in any Amazon CloudWatch Events events that are raised while running tasks for these targets in this maintenance window.\n"];
  targets: targets option
    [@ocaml.doc
      "The targets, either managed nodes or tags.\n\n Specify managed nodes using the following format:\n \n   \n  {[\n  Key=instanceids,Values=,\n  ]}\n   \n  \n   Tags are specified using the following format:\n   \n     \n    {[\n    Key=,Values=\n    ]}\n    .\n    "];
  resource_type: maintenance_window_resource_type option
    [@ocaml.doc
      "The type of target that is being registered with the maintenance window.\n"];
  window_target_id: maintenance_window_target_id option
    [@ocaml.doc "The ID of the target.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc
      "The ID of the maintenance window to register the target with.\n"]}
[@@ocaml.doc "The target registered with the maintenance window.\n"]
type nonrec maintenance_window_target_list = maintenance_window_target list
[@@ocaml.doc ""]
type nonrec maintenance_window_search_max_results = int[@@ocaml.doc ""]
type nonrec maintenance_window_max_results = int[@@ocaml.doc ""]
type nonrec maintenance_window_identity =
  {
  next_execution_time: maintenance_window_string_date_time option
    [@ocaml.doc
      "The next time the maintenance window will actually run, taking into account any specified times for the maintenance window to become active or inactive.\n"];
  start_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active.\n"];
  end_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive.\n"];
  schedule_offset: maintenance_window_offset option
    [@ocaml.doc
      "The number of days to wait to run a maintenance window after the scheduled cron expression date and time.\n"];
  schedule_timezone: maintenance_window_timezone option
    [@ocaml.doc
      "The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format.\n"];
  schedule: maintenance_window_schedule option
    [@ocaml.doc
      "The schedule of the maintenance window in the form of a cron or rate expression.\n"];
  cutoff: maintenance_window_cutoff option
    [@ocaml.doc
      "The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.\n"];
  duration: maintenance_window_duration_hours option
    [@ocaml.doc "The duration of the maintenance window in hours.\n"];
  enabled: maintenance_window_enabled option
    [@ocaml.doc "Indicates whether the maintenance window is enabled.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "A description of the maintenance window.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The name of the maintenance window.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the maintenance window.\n"]}[@@ocaml.doc
                                                         "Information about the maintenance window.\n"]
type nonrec maintenance_window_identity_list =
  maintenance_window_identity list[@@ocaml.doc ""]
type nonrec maintenance_window_filter_value = string[@@ocaml.doc ""]
type nonrec maintenance_window_filter_values =
  maintenance_window_filter_value list[@@ocaml.doc ""]
type nonrec maintenance_window_filter_key = string[@@ocaml.doc ""]
type nonrec maintenance_window_filter =
  {
  values: maintenance_window_filter_values option
    [@ocaml.doc "The filter values.\n"];
  key: maintenance_window_filter_key option
    [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                               "Filter used in the request. Supported filter keys depend on the API operation that includes the filter. API operations that use [MaintenanceWindowFilter>] include the following:\n\n {ul\n       {-   [DescribeMaintenanceWindowExecutions] \n           \n            }\n       {-   [DescribeMaintenanceWindowExecutionTaskInvocations] \n           \n            }\n       {-   [DescribeMaintenanceWindowExecutionTasks] \n           \n            }\n       {-   [DescribeMaintenanceWindows] \n           \n            }\n       {-   [DescribeMaintenanceWindowTargets] \n           \n            }\n       {-   [DescribeMaintenanceWindowTasks] \n           \n            }\n       }\n  "]
type nonrec maintenance_window_filter_list = maintenance_window_filter list
[@@ocaml.doc ""]
type nonrec maintenance_window_execution_task_invocation_parameters = string
[@@ocaml.doc ""]
type nonrec maintenance_window_execution_id = string[@@ocaml.doc ""]
type nonrec maintenance_window_execution_task_id = string[@@ocaml.doc ""]
type nonrec maintenance_window_execution_task_invocation_id = string[@@ocaml.doc
                                                                    ""]
type nonrec maintenance_window_execution_task_execution_id = string[@@ocaml.doc
                                                                    ""]
type nonrec maintenance_window_execution_status =
  | SkippedOverlapping [@ocaml.doc ""]
  | Cancelled [@ocaml.doc ""]
  | Cancelling [@ocaml.doc ""]
  | TimedOut [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec maintenance_window_execution_status_details = string[@@ocaml.doc
                                                                  ""]
type nonrec maintenance_window_execution_task_invocation_identity =
  {
  window_target_id: maintenance_window_task_target_id option
    [@ocaml.doc
      "The ID of the target definition in this maintenance window the invocation was performed for.\n"];
  owner_information: owner_information option
    [@ocaml.doc
      "User-provided value that was specified when the target was registered with the maintenance window. This was also included in any Amazon CloudWatch Events events raised during the task invocation.\n"];
  end_time: date_time option
    [@ocaml.doc "The time the invocation finished.\n"];
  start_time: date_time option
    [@ocaml.doc "The time the invocation started.\n"];
  status_details: maintenance_window_execution_status_details option
    [@ocaml.doc
      "The details explaining the status of the task invocation. Not available for all status values. \n"];
  status: maintenance_window_execution_status option
    [@ocaml.doc "The status of the task invocation.\n"];
  parameters: maintenance_window_execution_task_invocation_parameters option
    [@ocaml.doc
      "The parameters that were provided for the invocation when it was run.\n"];
  task_type: maintenance_window_task_type option
    [@ocaml.doc "The task type.\n"];
  execution_id: maintenance_window_execution_task_execution_id option
    [@ocaml.doc
      "The ID of the action performed in the service that actually handled the task invocation. If the task type is [RUN_COMMAND], this value is the command ID.\n"];
  invocation_id: maintenance_window_execution_task_invocation_id option
    [@ocaml.doc "The ID of the task invocation.\n"];
  task_execution_id: maintenance_window_execution_task_id option
    [@ocaml.doc
      "The ID of the specific task execution in the maintenance window execution.\n"];
  window_execution_id: maintenance_window_execution_id option
    [@ocaml.doc
      "The ID of the maintenance window execution that ran the task.\n"]}
[@@ocaml.doc
  "Describes the information about a task invocation for a particular target as part of a task execution performed as part of a maintenance window execution.\n"]
type nonrec maintenance_window_execution_task_invocation_identity_list =
  maintenance_window_execution_task_invocation_identity list[@@ocaml.doc ""]
type nonrec maintenance_window_execution_task_identity =
  {
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc
      "The CloudWatch alarm that was invoked by the maintenance window task.\n"];
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm applied to your maintenance window task.\n"];
  task_type: maintenance_window_task_type option
    [@ocaml.doc "The type of task that ran.\n"];
  task_arn: maintenance_window_task_arn option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the task that ran.\n"];
  end_time: date_time option
    [@ocaml.doc "The time the task execution finished.\n"];
  start_time: date_time option
    [@ocaml.doc "The time the task execution started.\n"];
  status_details: maintenance_window_execution_status_details option
    [@ocaml.doc
      "The details explaining the status of the task execution. Not available for all status values.\n"];
  status: maintenance_window_execution_status option
    [@ocaml.doc "The status of the task execution.\n"];
  task_execution_id: maintenance_window_execution_task_id option
    [@ocaml.doc
      "The ID of the specific task execution in the maintenance window execution.\n"];
  window_execution_id: maintenance_window_execution_id option
    [@ocaml.doc
      "The ID of the maintenance window execution that ran the task.\n"]}
[@@ocaml.doc
  "Information about a task execution performed as part of a maintenance window execution.\n"]
type nonrec maintenance_window_execution_task_identity_list =
  maintenance_window_execution_task_identity list[@@ocaml.doc ""]
type nonrec maintenance_window_execution_task_id_list =
  maintenance_window_execution_task_id list[@@ocaml.doc ""]
type nonrec maintenance_window_execution =
  {
  end_time: date_time option
    [@ocaml.doc "The time the execution finished.\n"];
  start_time: date_time option
    [@ocaml.doc "The time the execution started.\n"];
  status_details: maintenance_window_execution_status_details option
    [@ocaml.doc
      "The details explaining the status. Not available for all status values.\n"];
  status: maintenance_window_execution_status option
    [@ocaml.doc "The status of the execution.\n"];
  window_execution_id: maintenance_window_execution_id option
    [@ocaml.doc "The ID of the maintenance window execution.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the maintenance window.\n"]}[@@ocaml.doc
                                                         "Describes the information about an execution of a maintenance window. \n"]
type nonrec maintenance_window_execution_list =
  maintenance_window_execution list[@@ocaml.doc ""]
type nonrec list_tags_for_resource_result =
  {
  tag_list: tag_list option [@ocaml.doc "A list of tags.\n"]}[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_id: resource_id
    [@ocaml.doc
      "The resource ID for which you want to see a list of tags.\n"];
  resource_type: resource_type_for_tagging
    [@ocaml.doc "Returns a list of tags for a specific resource type.\n"]}
[@@ocaml.doc ""]
type nonrec list_resource_data_sync_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  resource_data_sync_items: resource_data_sync_item_list option
    [@ocaml.doc
      "A list of your current resource data sync configurations and their statuses.\n"]}
[@@ocaml.doc ""]
type nonrec list_resource_data_sync_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  sync_type: resource_data_sync_type option
    [@ocaml.doc
      "View a list of resource data syncs according to the sync type. Specify [SyncToDestination] to view resource data syncs that synchronize data to an Amazon S3 bucket. Specify [SyncFromSource] to view resource data syncs from Organizations or from multiple Amazon Web Services Regions.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_next_token = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified token isn't valid.\n"]
type nonrec list_resource_compliance_summaries_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  resource_compliance_summary_items:
    resource_compliance_summary_item_list option
    [@ocaml.doc
      "A summary count for specified or targeted managed nodes. Summary count includes information about compliant and non-compliant State Manager associations, patch status, or custom items according to the filter criteria that you specify. \n"]}
[@@ocaml.doc ""]
type nonrec compliance_string_filter_key = string[@@ocaml.doc ""]
type nonrec compliance_filter_value = string[@@ocaml.doc ""]
type nonrec compliance_string_filter_value_list =
  compliance_filter_value list[@@ocaml.doc ""]
type nonrec compliance_query_operator_type =
  | GreaterThan [@ocaml.doc ""]
  | LessThan [@ocaml.doc ""]
  | BeginWith [@ocaml.doc ""]
  | NotEqual [@ocaml.doc ""]
  | Equal [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec compliance_string_filter =
  {
  type_: compliance_query_operator_type option
    [@ocaml.doc
      "The type of comparison that should be performed for the value: Equal, NotEqual, BeginWith, LessThan, or GreaterThan.\n"];
  values: compliance_string_filter_value_list option
    [@ocaml.doc "The value for which to search.\n"];
  key: compliance_string_filter_key option
    [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                               "One or more filters. Use a filter to return a more specific list of results.\n"]
type nonrec compliance_string_filter_list = compliance_string_filter list
[@@ocaml.doc ""]
type nonrec list_resource_compliance_summaries_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  filters: compliance_string_filter_list option
    [@ocaml.doc
      "One or more filters. Use a filter to return a more specific list of results.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_filter = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The filter name isn't valid. Verify that you entered the correct name and try again.\n"]
type nonrec list_ops_metadata_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  ops_metadata_list: ops_metadata_list option
    [@ocaml.doc "Returns a list of OpsMetadata objects.\n"]}[@@ocaml.doc ""]
type nonrec list_ops_metadata_max_results = int[@@ocaml.doc ""]
type nonrec list_ops_metadata_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results.\n"];
  max_results: list_ops_metadata_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: ops_metadata_filter_list option
    [@ocaml.doc
      "One or more filters to limit the number of OpsMetadata objects returned by the call.\n"]}
[@@ocaml.doc ""]
type nonrec list_ops_item_related_items_response =
  {
  summaries: ops_item_related_item_summaries option
    [@ocaml.doc
      "A list of related-item resources for the specified OpsItem.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"]}
[@@ocaml.doc ""]
type nonrec list_ops_item_related_items_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: ops_item_related_items_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: ops_item_related_items_filters option
    [@ocaml.doc
      "One or more OpsItem filters. Use a filter to return a more specific list of results. \n"];
  ops_item_id: ops_item_id option
    [@ocaml.doc
      "The ID of the OpsItem for which you want to list all related-item resources.\n"]}
[@@ocaml.doc ""]
type nonrec list_ops_item_events_response =
  {
  summaries: ops_item_event_summaries option
    [@ocaml.doc "A list of event information for the specified OpsItems.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results. \n"]}
[@@ocaml.doc ""]
type nonrec list_ops_item_events_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  max_results: ops_item_event_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results. \n"];
  filters: ops_item_event_filters option
    [@ocaml.doc
      "One or more OpsItem filters. Use a filter to return a more specific list of results. \n"]}
[@@ocaml.doc ""]
type nonrec list_nodes_summary_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  summary: node_summary_list option
    [@ocaml.doc
      "A collection of objects reporting information about your managed nodes, such as the count of nodes by operating system.\n"]}
[@@ocaml.doc ""]
type nonrec list_nodes_summary_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.) The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  aggregators: node_aggregator_list
    [@ocaml.doc
      "Specify one or more aggregators to return a count of managed nodes that match that expression. For example, a count of managed nodes by operating system.\n"];
  filters: node_filter_list option
    [@ocaml.doc
      "One or more filters. Use a filter to generate a summary that matches your specified filter criteria.\n"];
  sync_name: resource_data_sync_name option
    [@ocaml.doc
      "The name of the Amazon Web Services managed resource data sync to retrieve information about.\n\n For cross-account/cross-Region configurations, this parameter is required, and the name of the supported resource data sync is [AWS-QuickSetup-ManagedNode].\n \n  For single account/single-Region configurations, the parameter is not required.\n  "]}
[@@ocaml.doc ""]
type nonrec invalid_aggregator_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified aggregator isn't valid for the group type. Verify that the aggregator you provided is supported.\n"]
type nonrec list_nodes_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  nodes: node_list option
    [@ocaml.doc
      "A list of managed nodes that match the specified filter criteria.\n"]}
[@@ocaml.doc ""]
type nonrec list_nodes_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  filters: node_filter_list option
    [@ocaml.doc
      "One or more filters. Use a filter to return a more specific list of managed nodes.\n"];
  sync_name: resource_data_sync_name option
    [@ocaml.doc
      "The name of the Amazon Web Services managed resource data sync to retrieve information about.\n\n For cross-account/cross-Region configurations, this parameter is required, and the name of the supported resource data sync is [AWS-QuickSetup-ManagedNode].\n \n  For single account/single-Region configurations, the parameter is not required.\n  "]}
[@@ocaml.doc ""]
type nonrec list_inventory_entries_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  entries: inventory_item_entry_list option
    [@ocaml.doc "A list of inventory items on the managed nodes.\n"];
  capture_time: inventory_item_capture_time option
    [@ocaml.doc
      "The time that inventory information was collected for the managed nodes.\n"];
  schema_version: inventory_item_schema_version option
    [@ocaml.doc "The inventory schema version used by the managed nodes.\n"];
  instance_id: instance_id option
    [@ocaml.doc
      "The managed node ID targeted by the request to query inventory information.\n"];
  type_name: inventory_item_type_name option
    [@ocaml.doc "The type of inventory item returned by the request.\n"]}
[@@ocaml.doc ""]
type nonrec inventory_filter_key = string[@@ocaml.doc ""]
type nonrec inventory_filter_value = string[@@ocaml.doc ""]
type nonrec inventory_filter_value_list = inventory_filter_value list
[@@ocaml.doc ""]
type nonrec inventory_query_operator_type =
  | EXISTS [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | BEGIN_WITH [@ocaml.doc ""]
  | NOT_EQUAL [@ocaml.doc ""]
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec inventory_filter =
  {
  type_: inventory_query_operator_type option
    [@ocaml.doc
      "The type of filter.\n\n  The [Exists] filter must be used with aggregators. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-aggregate.html}Aggregating inventory data} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n   "];
  values: inventory_filter_value_list
    [@ocaml.doc
      "Inventory filter values. Example: inventory filter where managed node IDs are specified as values [Key=AWS:InstanceInformation.InstanceId,Values= i-a12b3c4d5e6g,\n    i-1a2b3c4d5e6,Type=Equal]. \n"];
  key: inventory_filter_key [@ocaml.doc "The name of the filter key.\n"]}
[@@ocaml.doc
  "One or more filters. Use a filter to return a more specific list of results.\n"]
type nonrec inventory_filter_list = inventory_filter list[@@ocaml.doc ""]
type nonrec list_inventory_entries_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  filters: inventory_filter_list option
    [@ocaml.doc
      "One or more filters. Use a filter to return a more specific list of results.\n"];
  type_name: inventory_item_type_name
    [@ocaml.doc
      "The type of inventory item for which you want information.\n"];
  instance_id: instance_id
    [@ocaml.doc
      "The managed node ID for which you want inventory information.\n"]}
[@@ocaml.doc ""]
type nonrec document_identifier =
  {
  author: document_author option
    [@ocaml.doc "The user in your organization who created the document.\n"];
  review_status: review_status option
    [@ocaml.doc "The current status of a document review.\n"];
  requires: document_requires_list option
    [@ocaml.doc
      "A list of SSM documents required by a document. For example, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document.\n"];
  tags: tag_list option
    [@ocaml.doc
      "The tags, or metadata, that have been applied to the document.\n"];
  target_type: target_type option
    [@ocaml.doc
      "The target type which defines the kinds of resources the document can run on. For example, [/AWS::EC2::Instance]. For a list of valid resource types, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}. \n"];
  document_format: document_format option
    [@ocaml.doc "The document format, either JSON or YAML.\n"];
  schema_version: document_schema_version option
    [@ocaml.doc "The schema version.\n"];
  document_type: document_type option [@ocaml.doc "The document type.\n"];
  document_version: document_version option
    [@ocaml.doc "The document version.\n"];
  platform_types: platform_type_list option
    [@ocaml.doc "The operating system platform. \n"];
  version_name: document_version_name option
    [@ocaml.doc
      "An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.\n"];
  owner: document_owner option
    [@ocaml.doc "The Amazon Web Services user that created the document.\n"];
  display_name: document_display_name option
    [@ocaml.doc
      "An optional field where you can specify a friendly name for the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].\n"];
  created_date: date_time option
    [@ocaml.doc "The date the SSM document was created.\n"];
  name: document_ar_n option [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc "Describes the name of a SSM document.\n"]
type nonrec document_identifier_list = document_identifier list[@@ocaml.doc
                                                                 ""]
type nonrec list_documents_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  document_identifiers: document_identifier_list option
    [@ocaml.doc "The names of the SSM documents.\n"]}[@@ocaml.doc ""]
type nonrec document_filter_key =
  | DocumentType [@ocaml.doc ""]
  | PlatformTypes [@ocaml.doc ""]
  | Owner [@ocaml.doc ""]
  | Name [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_filter_value = string[@@ocaml.doc ""]
type nonrec document_filter =
  {
  value: document_filter_value [@ocaml.doc "The value of the filter.\n"];
  key: document_filter_key [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                                                    "This data type is deprecated. Instead, use [DocumentKeyValuesFilter].\n"]
type nonrec document_filter_list = document_filter list[@@ocaml.doc ""]
type nonrec document_key_values_filter_key = string[@@ocaml.doc ""]
type nonrec document_key_values_filter_value = string[@@ocaml.doc ""]
type nonrec document_key_values_filter_values =
  document_key_values_filter_value list[@@ocaml.doc ""]
type nonrec document_key_values_filter =
  {
  values: document_key_values_filter_values option
    [@ocaml.doc "The value for the filter key.\n"];
  key: document_key_values_filter_key option
    [@ocaml.doc "The name of the filter key.\n"]}[@@ocaml.doc
                                                   "One or more filters. Use a filter to return a more specific list of documents.\n\n For keys, you can specify one or more tags that have been applied to a document. \n \n  You can also use Amazon Web Services-provided keys, some of which have specific allowed values. These keys and their associated values are as follows:\n  \n    DocumentType  {ul\n                        {-   [ApplicationConfiguration] \n                            \n                             }\n                        {-   [ApplicationConfigurationSchema] \n                            \n                             }\n                        {-   [Automation] \n                            \n                             }\n                        {-   [ChangeCalendar] \n                            \n                             }\n                        {-   [Command] \n                            \n                             }\n                        {-   [Package] \n                            \n                             }\n                        {-   [Policy] \n                            \n                             }\n                        {-   [Session] \n                            \n                             }\n                        }\n    Owner  Note that only one [Owner] can be specified in a request. For example: [Key=Owner,Values=Self].\n           \n            {ul\n                  {-   [Amazon] \n                      \n                       }\n                  {-   [Private] \n                      \n                       }\n                  {-   [Public] \n                      \n                       }\n                  {-   [Self] \n                      \n                       }\n                  {-   [ThirdParty] \n                      \n                       }\n                  }  PlatformTypes  {ul\n                                          {-   [Linux] \n                                              \n                                               }\n                                          {-   [Windows] \n                                              \n                                               }\n                                          }\n      [Name] is another Amazon Web Services-provided key. If you use [Name] as a key, you can use a name prefix to return a list of documents. For example, in the Amazon Web Services CLI, to return a list of all documents that begin with [Te], run the following command:\n     \n       [aws ssm list-documents --filters Key=Name,Values=Te] \n      \n       You can also use the [TargetType] Amazon Web Services-provided key. For a list of valid resource type values that can be used with this key, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}.\n       \n        If you specify more than two keys, only documents that are identified by all the tags are returned in the results. If you specify more than two values for a key, documents that are identified by any of the values are returned in the results.\n        \n         To specify a custom key-value pair, use the format [Key=tag:tagName,Values=valueName].\n         \n          For example, if you created a key called region and are using the Amazon Web Services CLI to call the [list-documents] command: \n          \n            [aws ssm list-documents --filters Key=tag:region,Values=east,west\n    Key=Owner,Values=Self] \n           "]
type nonrec document_key_values_filter_list = document_key_values_filter list
[@@ocaml.doc ""]
type nonrec list_documents_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: document_key_values_filter_list option
    [@ocaml.doc
      "One or more [DocumentKeyValuesFilter] objects. Use a filter to return a more specific list of results. For keys, you can specify one or more key-value pair tags that have been applied to a document. Other valid keys include [Owner], [Name], [PlatformTypes], [DocumentType], and [TargetType]. For example, to return documents you own use [Key=Owner,Values=Self]. To specify a custom key-value pair, use the format [Key=tag:tagName,Values=valueName].\n\n  This API operation only supports filtering documents by using a single tag key and one or more tag values. For example: [Key=tag:tagName,Values=valueName1,valueName2] \n  \n   "];
  document_filter_list: document_filter_list option
    [@ocaml.doc "This data type is deprecated. Instead, use [Filters].\n"]}
[@@ocaml.doc ""]
type nonrec invalid_filter_key = unit[@@ocaml.doc ""]
type nonrec document_version_info =
  {
  review_status: review_status option
    [@ocaml.doc
      "The current status of the approval review for the latest version of the document.\n"];
  status_information: document_status_information option
    [@ocaml.doc
      "A message returned by Amazon Web Services Systems Manager that explains the [Status] value. For example, a [Failed] status might be explained by the [StatusInformation] message, \"The specified S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct.\"\n"];
  status: document_status option
    [@ocaml.doc
      "The status of the SSM document, such as [Creating], [Active], [Failed], and [Deleting].\n"];
  document_format: document_format option
    [@ocaml.doc "The document format, either JSON or YAML.\n"];
  is_default_version: boolean_ option
    [@ocaml.doc "An identifier for the default version of the document.\n"];
  created_date: date_time option
    [@ocaml.doc "The date the document was created.\n"];
  version_name: document_version_name option
    [@ocaml.doc
      "The version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.\n"];
  document_version: document_version option
    [@ocaml.doc "The document version.\n"];
  display_name: document_display_name option
    [@ocaml.doc
      "The friendly name of the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].\n"];
  name: document_name option [@ocaml.doc "The document name.\n"]}[@@ocaml.doc
                                                                   "Version information about the document.\n"]
type nonrec document_version_list = document_version_info list[@@ocaml.doc
                                                                ""]
type nonrec list_document_versions_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  document_versions: document_version_list option
    [@ocaml.doc "The document versions.\n"]}[@@ocaml.doc ""]
type nonrec list_document_versions_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  name: document_ar_n
    [@ocaml.doc
      "The name of the document. You can specify an Amazon Resource Name (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec document_reviewer_response_source =
  {
  reviewer: reviewer option
    [@ocaml.doc
      "The user in your organization assigned to review a document request.\n"];
  comment: document_review_comment_list option
    [@ocaml.doc
      "The comment entered by a reviewer as part of their document review response.\n"];
  review_status: review_status option
    [@ocaml.doc
      "The current review status of a new custom SSM document created by a member of your organization, or of the latest version of an existing SSM document.\n\n Only one version of a document can be in the APPROVED state at a time. When a new version is approved, the status of the previous version changes to REJECTED.\n \n  Only one version of a document can be in review, or PENDING, at a time.\n  "];
  updated_time: date_time option
    [@ocaml.doc
      "The date and time that a reviewer last updated a response to a document review request.\n"];
  create_time: date_time option
    [@ocaml.doc
      "The date and time that a reviewer entered a response to a document review request.\n"]}
[@@ocaml.doc
  "Information about a reviewer's response to a document review request.\n"]
type nonrec document_reviewer_response_list =
  document_reviewer_response_source list[@@ocaml.doc ""]
type nonrec document_metadata_response_info =
  {
  reviewer_response: document_reviewer_response_list option
    [@ocaml.doc
      "Details about a reviewer's response to a document review request.\n"]}
[@@ocaml.doc "Details about the response to a document review request.\n"]
type nonrec list_document_metadata_history_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  metadata: document_metadata_response_info option
    [@ocaml.doc
      "Information about the response to the change template approval request.\n"];
  author: document_author option
    [@ocaml.doc
      "The user ID of the person in the organization who requested the review of the change template.\n"];
  document_version: document_version option
    [@ocaml.doc "The version of the change template.\n"];
  name: document_name option
    [@ocaml.doc "The name of the change template.\n"]}[@@ocaml.doc ""]
type nonrec document_metadata_enum =
  | DocumentReviews [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_document_metadata_history_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  metadata: document_metadata_enum
    [@ocaml.doc
      "The type of data for which details are being requested. Currently, the only supported value is [DocumentReviews].\n"];
  document_version: document_version option
    [@ocaml.doc "The version of the change template.\n"];
  name: document_name [@ocaml.doc "The name of the change template.\n"]}
[@@ocaml.doc ""]
type nonrec compliance_summary_item =
  {
  non_compliant_summary: non_compliant_summary option
    [@ocaml.doc
      "A list of NON_COMPLIANT items for the specified compliance type.\n"];
  compliant_summary: compliant_summary option
    [@ocaml.doc
      "A list of COMPLIANT items for the specified compliance type.\n"];
  compliance_type: compliance_type_name option
    [@ocaml.doc
      "The type of compliance item. For example, the compliance type can be Association, Patch, or Custom:string.\n"]}
[@@ocaml.doc "A summary of compliance information by compliance type.\n"]
type nonrec compliance_summary_item_list = compliance_summary_item list
[@@ocaml.doc ""]
type nonrec list_compliance_summaries_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  compliance_summary_items: compliance_summary_item_list option
    [@ocaml.doc
      "A list of compliant and non-compliant summary counts based on compliance types. For example, this call returns State Manager associations, patches, or custom compliance types according to the filter criteria that you specified.\n"]}
[@@ocaml.doc ""]
type nonrec list_compliance_summaries_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. Currently, you can specify null or 50. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  filters: compliance_string_filter_list option
    [@ocaml.doc
      "One or more compliance or inventory filters. Use a filter to return a more specific list of results.\n"]}
[@@ocaml.doc ""]
type nonrec compliance_item =
  {
  details: compliance_item_details option
    [@ocaml.doc
      "A \"Key\": \"Value\" tag combination for the compliance item.\n"];
  execution_summary: compliance_execution_summary option
    [@ocaml.doc
      "A summary for the compliance item. The summary includes an execution ID, the execution type (for example, command), and the execution time.\n"];
  severity: compliance_severity option
    [@ocaml.doc
      "The severity of the compliance status. Severity can be one of the following: Critical, High, Medium, Low, Informational, Unspecified.\n"];
  status: compliance_status option
    [@ocaml.doc
      "The status of the compliance item. An item is either COMPLIANT, NON_COMPLIANT, or an empty string (for Windows patches that aren't applicable).\n"];
  title: compliance_item_title option
    [@ocaml.doc
      "A title for the compliance item. For example, if the compliance item is a Windows patch, the title could be the title of the KB article for the patch; for example: Security Update for Active Directory Federation Services.\n"];
  id: compliance_item_id option
    [@ocaml.doc
      "An ID for the compliance item. For example, if the compliance item is a Windows patch, the ID could be the number of the KB article; for example: KB4010320.\n"];
  resource_id: compliance_resource_id option
    [@ocaml.doc
      "An ID for the resource. For a managed node, this is the node ID.\n"];
  resource_type: compliance_resource_type option
    [@ocaml.doc
      "The type of resource. [ManagedInstance] is currently the only supported resource type.\n"];
  compliance_type: compliance_type_name option
    [@ocaml.doc
      "The compliance type. For example, Association (for a State Manager association), Patch, or Custom:[string] are all valid compliance types.\n"]}
[@@ocaml.doc
  "Information about the compliance as defined by the resource type. For example, for a patch resource type, [Items] includes information about the PatchSeverity, Classification, and so on.\n"]
type nonrec compliance_item_list = compliance_item list[@@ocaml.doc ""]
type nonrec list_compliance_items_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  compliance_items: compliance_item_list option
    [@ocaml.doc
      "A list of compliance information for the specified resource ID. \n"]}
[@@ocaml.doc ""]
type nonrec compliance_resource_id_list = compliance_resource_id list
[@@ocaml.doc ""]
type nonrec compliance_resource_type_list = compliance_resource_type list
[@@ocaml.doc ""]
type nonrec list_compliance_items_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  resource_types: compliance_resource_type_list option
    [@ocaml.doc
      "The type of resource from which to get compliance information. Currently, the only supported resource type is [ManagedInstance].\n"];
  resource_ids: compliance_resource_id_list option
    [@ocaml.doc
      "The ID for the resources from which to get compliance information. Currently, you can only specify one resource ID.\n"];
  filters: compliance_string_filter_list option
    [@ocaml.doc
      "One or more compliance filters. Use a filter to return a more specific list of results.\n"]}
[@@ocaml.doc ""]
type nonrec command_list = command list[@@ocaml.doc ""]
type nonrec list_commands_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "(Optional) The token for the next set of items to return. (You received this token from a previous call.)\n"];
  commands: command_list option
    [@ocaml.doc "(Optional) The list of commands requested by the user. \n"]}
[@@ocaml.doc ""]
type nonrec command_max_results = int[@@ocaml.doc ""]
type nonrec command_filter_key =
  | DOCUMENT_NAME [@ocaml.doc ""]
  | EXECUTION_STAGE [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | INVOKED_BEFORE [@ocaml.doc ""]
  | INVOKED_AFTER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec command_filter_value = string[@@ocaml.doc ""]
type nonrec command_filter =
  {
  value: command_filter_value
    [@ocaml.doc
      "The filter value. Valid values for each filter key are as follows:\n\n {ul\n       {-   {b InvokedAfter}: Specify a timestamp to limit your results. For example, specify [2024-07-07T00:00:00Z] to see a list of command executions occurring July 7, 2021, and later.\n           \n            }\n       {-   {b InvokedBefore}: Specify a timestamp to limit your results. For example, specify [2024-07-07T00:00:00Z] to see a list of command executions from before July 7, 2021.\n           \n            }\n       {-   {b Status}: Specify a valid command status to see a list of all command executions with that status. The status choices depend on the API you call.\n           \n            The status values you can specify for [ListCommands] are:\n            \n             {ul\n                   {-   [Pending] \n                       \n                        }\n                   {-   [InProgress] \n                       \n                        }\n                   {-   [Success] \n                       \n                        }\n                   {-   [Cancelled] \n                       \n                        }\n                   {-   [Failed] \n                       \n                        }\n                   {-   [TimedOut] (this includes both Delivery and Execution time outs) \n                       \n                        }\n                   {-   [AccessDenied] \n                       \n                        }\n                   {-   [DeliveryTimedOut] \n                       \n                        }\n                   {-   [ExecutionTimedOut] \n                       \n                        }\n                   {-   [Incomplete] \n                       \n                        }\n                   {-   [NoInstancesInTag] \n                       \n                        }\n                   {-   [LimitExceeded] \n                       \n                        }\n                   \n        }\n         The status values you can specify for [ListCommandInvocations] are:\n         \n          {ul\n                {-   [Pending] \n                    \n                     }\n                {-   [InProgress] \n                    \n                     }\n                {-   [Delayed] \n                    \n                     }\n                {-   [Success] \n                    \n                     }\n                {-   [Cancelled] \n                    \n                     }\n                {-   [Failed] \n                    \n                     }\n                {-   [TimedOut] (this includes both Delivery and Execution time outs) \n                    \n                     }\n                {-   [AccessDenied] \n                    \n                     }\n                {-   [DeliveryTimedOut] \n                    \n                     }\n                {-   [ExecutionTimedOut] \n                    \n                     }\n                {-   [Undeliverable] \n                    \n                     }\n                {-   [InvalidPlatform] \n                    \n                     }\n                {-   [Terminated] \n                    \n                     }\n                \n        }\n         }\n       {-   {b DocumentName}: Specify name of the Amazon Web Services Systems Manager document (SSM document) for which you want to see command execution results. For example, specify [AWS-RunPatchBaseline] to see command executions that used this SSM document to perform security patching operations on managed nodes. \n           \n            }\n       {-   {b ExecutionStage}: Specify one of the following values ([ListCommands] operations only):\n           \n            {ul\n                  {-   [Executing]: Returns a list of command executions that are currently still running.\n                      \n                       }\n                  {-   [Complete]: Returns a list of command executions that have already completed. \n                      \n                       }\n                  \n        }\n         }\n       }\n  "];
  key: command_filter_key
    [@ocaml.doc
      "The name of the filter.\n\n  The [ExecutionStage] filter can't be used with the [ListCommandInvocations] operation, only with [ListCommands].\n  \n   "]}
[@@ocaml.doc
  "Describes a command filter.\n\n  A managed node ID can't be specified when a command status is [Pending] because the command hasn't run on the node yet.\n  \n   "]
type nonrec command_filter_list = command_filter list[@@ocaml.doc ""]
type nonrec list_commands_request =
  {
  filters: command_filter_list option
    [@ocaml.doc
      "(Optional) One or more filters. Use a filter to return a more specific list of results. \n"];
  next_token: next_token option
    [@ocaml.doc
      "(Optional) The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: command_max_results option
    [@ocaml.doc
      "(Optional) The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  instance_id: instance_id option
    [@ocaml.doc
      "(Optional) Lists commands issued against this managed node ID.\n\n  You can't specify a managed node ID in the same command that you specify [Status] = [Pending]. This is because the command hasn't reached the managed node yet.\n  \n   "];
  command_id: command_id option
    [@ocaml.doc
      "(Optional) If provided, lists only the specified command.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_command_id = unit[@@ocaml.doc ""]
type nonrec instance_tag_name = string[@@ocaml.doc ""]
type nonrec command_invocation_status =
  | CANCELLING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | DELAYED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec invocation_trace_output = string[@@ocaml.doc ""]
type nonrec command_plugin_name = string[@@ocaml.doc ""]
type nonrec command_plugin_status =
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec command_plugin_output = string[@@ocaml.doc ""]
type nonrec command_plugin =
  {
  output_s3_key_prefix: s3_key_prefix option
    [@ocaml.doc
      "The S3 directory path inside the bucket where the responses to the command executions should be stored. This was requested when issuing the command. For example, in the following response:\n\n  [amzn-s3-demo-bucket/my-prefix/i-02573cafcfEXAMPLE/awsrunShellScript] \n \n   [amzn-s3-demo-bucket] is the name of the S3 bucket;\n  \n    [my-prefix] is the name of the S3 prefix;\n   \n     [i-02573cafcfEXAMPLE] is the managed node ID;\n    \n      [awsrunShellScript] is the name of the plugin.\n     "];
  output_s3_bucket_name: s3_bucket_name option
    [@ocaml.doc
      "The S3 bucket where the responses to the command executions should be stored. This was requested when issuing the command. For example, in the following response:\n\n  [amzn-s3-demo-bucket/my-prefix/i-02573cafcfEXAMPLE/awsrunShellScript] \n \n   [amzn-s3-demo-bucket] is the name of the S3 bucket;\n  \n    [my-prefix] is the name of the S3 prefix;\n   \n     [i-02573cafcfEXAMPLE] is the managed node ID;\n    \n      [awsrunShellScript] is the name of the plugin.\n     "];
  output_s3_region: s3_region option
    [@ocaml.doc
      "(Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Amazon Web Services Systems Manager automatically determines the S3 bucket region.\n"];
  standard_error_url: url option
    [@ocaml.doc
      "The URL for the complete text written by the plugin to stderr. If execution isn't yet complete, then this string is empty.\n"];
  standard_output_url: url option
    [@ocaml.doc
      "The URL for the complete text written by the plugin to stdout in Amazon S3. If the S3 bucket for the command wasn't specified, then this string is empty.\n"];
  output: command_plugin_output option
    [@ocaml.doc "Output of the plugin execution.\n"];
  response_finish_date_time: date_time option
    [@ocaml.doc
      "The time the plugin stopped running. Could stop prematurely if, for example, a cancel command was sent. \n"];
  response_start_date_time: date_time option
    [@ocaml.doc "The time the plugin started running. \n"];
  response_code: response_code option
    [@ocaml.doc
      "A numeric response code generated after running the plugin. \n"];
  status_details: status_details option
    [@ocaml.doc
      "A detailed status of the plugin execution. [StatusDetails] includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. StatusDetails can be one of the following values:\n\n {ul\n       {-  Pending: The command hasn't been sent to the managed node.\n           \n            }\n       {-  In Progress: The command has been sent to the managed node but hasn't reached a terminal state.\n           \n            }\n       {-  Success: The execution of the command or plugin was successfully completed. This is a terminal state.\n           \n            }\n       {-  Delivery Timed Out: The command wasn't delivered to the managed node before the delivery timeout expired. Delivery timeouts don't count against the parent command's [MaxErrors] limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.\n           \n            }\n       {-  Execution Timed Out: Command execution started on the managed node, but the execution wasn't complete before the execution timeout expired. Execution timeouts count against the [MaxErrors] limit of the parent command. This is a terminal state.\n           \n            }\n       {-  Failed: The command wasn't successful on the managed node. For a plugin, this indicates that the result code wasn't zero. For a command invocation, this indicates that the result code for one or more plugins wasn't zero. Invocation failures count against the MaxErrors limit of the parent command. This is a terminal state.\n           \n            }\n       {-  Cancelled: The command was terminated before it was completed. This is a terminal state.\n           \n            }\n       {-  Undeliverable: The command can't be delivered to the managed node. The managed node might not exist, or it might not be responding. Undeliverable invocations don't count against the parent command's MaxErrors limit, and they don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.\n           \n            }\n       {-  Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal state.\n           \n            }\n       }\n  "];
  status: command_plugin_status option
    [@ocaml.doc
      "The status of this plugin. You can run a document with multiple plugins.\n"];
  name: command_plugin_name option
    [@ocaml.doc
      "The name of the plugin. Must be one of the following: [aws:updateAgent], [aws:domainjoin], [aws:applications], [aws:runPowerShellScript], [aws:psmodule], [aws:cloudWatch], [aws:runShellScript], or [aws:updateSSMAgent]. \n"]}
[@@ocaml.doc "Describes plugin details.\n"]
type nonrec command_plugin_list = command_plugin list[@@ocaml.doc ""]
type nonrec command_invocation =
  {
  cloud_watch_output_config: cloud_watch_output_config option
    [@ocaml.doc
      "Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send the command output.\n"];
  notification_config: notification_config option
    [@ocaml.doc
      "Configurations for sending notifications about command status changes on a per managed node basis.\n"];
  service_role: service_role option
    [@ocaml.doc
      "The Identity and Access Management (IAM) service role that Run Command, a tool in Amazon Web Services Systems Manager, uses to act on your behalf when sending notifications about command status changes on a per managed node basis.\n"];
  command_plugins: command_plugin_list option
    [@ocaml.doc "Plugins processed by the command.\n"];
  standard_error_url: url option
    [@ocaml.doc
      "The URL to the plugin's StdErr file in Amazon Simple Storage Service (Amazon S3), if the S3 bucket was defined for the parent command. For an invocation, [StandardErrorUrl] is populated if there is just one plugin defined for the command, and the S3 bucket was defined for the command.\n"];
  standard_output_url: url option
    [@ocaml.doc
      "The URL to the plugin's StdOut file in Amazon Simple Storage Service (Amazon S3), if the S3 bucket was defined for the parent command. For an invocation, [StandardOutputUrl] is populated if there is just one plugin defined for the command, and the S3 bucket was defined for the command.\n"];
  trace_output: invocation_trace_output option
    [@ocaml.doc " Gets the trace output sent by the agent. \n"];
  status_details: status_details option
    [@ocaml.doc
      "A detailed status of the command execution for each invocation (each managed node targeted by the command). StatusDetails includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. StatusDetails can be one of the following values:\n\n {ul\n       {-  Pending: The command hasn't been sent to the managed node.\n           \n            }\n       {-  In Progress: The command has been sent to the managed node but hasn't reached a terminal state.\n           \n            }\n       {-  Success: The execution of the command or plugin was successfully completed. This is a terminal state.\n           \n            }\n       {-  Delivery Timed Out: The command wasn't delivered to the managed node before the delivery timeout expired. Delivery timeouts don't count against the parent command's [MaxErrors] limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.\n           \n            }\n       {-  Execution Timed Out: Command execution started on the managed node, but the execution wasn't complete before the execution timeout expired. Execution timeouts count against the [MaxErrors] limit of the parent command. This is a terminal state.\n           \n            }\n       {-  Failed: The command wasn't successful on the managed node. For a plugin, this indicates that the result code wasn't zero. For a command invocation, this indicates that the result code for one or more plugins wasn't zero. Invocation failures count against the [MaxErrors] limit of the parent command. This is a terminal state.\n           \n            }\n       {-  Cancelled: The command was terminated before it was completed. This is a terminal state.\n           \n            }\n       {-  Undeliverable: The command can't be delivered to the managed node. The managed node might not exist or might not be responding. Undeliverable invocations don't count against the parent command's MaxErrors limit and don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.\n           \n            }\n       {-  Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal state.\n           \n            }\n       {-  Delayed: The system attempted to send the command to the managed node but wasn't successful. The system retries again.\n           \n            }\n       }\n  "];
  status: command_invocation_status option
    [@ocaml.doc
      "Whether or not the invocation succeeded, failed, or is pending.\n"];
  requested_date_time: date_time option
    [@ocaml.doc
      "The time and date the request was sent to this managed node.\n"];
  document_version: document_version option
    [@ocaml.doc "The Systems Manager document (SSM document) version.\n"];
  document_name: document_name option
    [@ocaml.doc "The document name that was requested for execution.\n"];
  comment: comment option
    [@ocaml.doc
      "User-specified information about the command, such as a brief description of what the command should do.\n"];
  instance_name: instance_tag_name option
    [@ocaml.doc "The fully qualified host name of the managed node.\n"];
  instance_id: instance_id option
    [@ocaml.doc
      "The managed node ID in which this invocation was requested.\n"];
  command_id: command_id option
    [@ocaml.doc "The command against which this invocation was requested.\n"]}
[@@ocaml.doc
  "An invocation is a copy of a command sent to a specific managed node. A command can apply to one or more managed nodes. A command invocation applies to one managed node. For example, if a user runs [SendCommand] against three managed nodes, then a command invocation is created for each requested managed node ID. A command invocation returns status and detail information about a command you ran. \n"]
type nonrec command_invocation_list = command_invocation list[@@ocaml.doc ""]
type nonrec list_command_invocations_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "(Optional) The token for the next set of items to return. (You received this token from a previous call.)\n"];
  command_invocations: command_invocation_list option
    [@ocaml.doc "(Optional) A list of all invocations. \n"]}[@@ocaml.doc ""]
type nonrec list_command_invocations_request =
  {
  details: boolean_ option
    [@ocaml.doc
      "(Optional) If set this returns the response of the command executions and any command output. The default value is [false]. \n"];
  filters: command_filter_list option
    [@ocaml.doc
      "(Optional) One or more filters. Use a filter to return a more specific list of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "(Optional) The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: command_max_results option
    [@ocaml.doc
      "(Optional) The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  instance_id: instance_id option
    [@ocaml.doc
      "(Optional) The command execution details for a specific managed node ID.\n"];
  command_id: command_id option
    [@ocaml.doc "(Optional) The invocations for a specific command ID.\n"]}
[@@ocaml.doc ""]
type nonrec association =
  {
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  duration: duration option
    [@ocaml.doc
      "The number of hours that an association can run on specified targets. After the resulting cutoff time passes, associations that are currently running are cancelled, and no pending executions are started on remaining targets.\n"];
  schedule_offset: schedule_offset option
    [@ocaml.doc
      "Number of days to wait after the scheduled day to run an association.\n"];
  association_name: association_name option
    [@ocaml.doc "The association name.\n"];
  schedule_expression: schedule_expression option
    [@ocaml.doc
      "A cron expression that specifies a schedule when the association runs. The schedule runs in Coordinated Universal Time (UTC).\n"];
  overview: association_overview option
    [@ocaml.doc "Information about the association.\n"];
  last_execution_date: date_time option
    [@ocaml.doc "The date on which the association was last run.\n"];
  targets: targets option
    [@ocaml.doc
      "The managed nodes targeted by the request to create an association. You can target all managed nodes in an Amazon Web Services account by specifying the [InstanceIds] key with a value of [*].\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of the document used in the association. If you change a document version for a State Manager association, Systems Manager immediately runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.\n\n  State Manager doesn't support running associations that use a new version of a document if that document is shared from another account. State Manager always runs the [default] version of a document if shared from another account, even though the Systems Manager console shows that a new version was processed. If you want to run an association using a new version of a document shared form another account, you must set the document version to [default].\n  \n   "];
  association_version: association_version option
    [@ocaml.doc "The association version.\n"];
  association_id: association_id option
    [@ocaml.doc
      "The ID created by the system when you create an association. An association is a binding between a document and a set of targets with a schedule.\n"];
  instance_id: instance_id option [@ocaml.doc "The managed node ID.\n"];
  name: document_ar_n option [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc
  "Describes an association of a Amazon Web Services Systems Manager document (SSM document) and a managed node.\n"]
type nonrec association_list = association list[@@ocaml.doc ""]
type nonrec list_associations_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  associations: association_list option [@ocaml.doc "The associations.\n"]}
[@@ocaml.doc ""]
type nonrec association_filter_key =
  | ResourceGroupName [@ocaml.doc ""]
  | AssociationName [@ocaml.doc ""]
  | LastExecutedAfter [@ocaml.doc ""]
  | LastExecutedBefore [@ocaml.doc ""]
  | Status [@ocaml.doc ""]
  | AssociationId [@ocaml.doc ""]
  | Name [@ocaml.doc ""]
  | InstanceId [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec association_filter_value = string[@@ocaml.doc ""]
type nonrec association_filter =
  {
  value: association_filter_value [@ocaml.doc "The filter value.\n"];
  key: association_filter_key
    [@ocaml.doc
      "The name of the filter.\n\n   [InstanceId] has been deprecated.\n  \n   "]}
[@@ocaml.doc "Describes a filter.\n"]
type nonrec association_filter_list = association_filter list[@@ocaml.doc ""]
type nonrec list_associations_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  association_filter_list: association_filter_list option
    [@ocaml.doc
      "One or more filters. Use a filter to return a more specific list of results.\n\n  Filtering associations using the [InstanceID] attribute only returns legacy associations created using the [InstanceID] attribute. Associations targeting the managed node that are part of the Target Attributes [ResourceGroup] or [Tags] aren't returned.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec association_version_info =
  {
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  duration: duration option
    [@ocaml.doc
      "The number of hours that an association can run on specified targets. After the resulting cutoff time passes, associations that are currently running are cancelled, and no pending executions are started on remaining targets.\n"];
  schedule_offset: schedule_offset option
    [@ocaml.doc
      "Number of days to wait after the scheduled day to run an association.\n"];
  target_locations: target_locations option
    [@ocaml.doc
      "The combination of Amazon Web Services Regions and Amazon Web Services accounts where you wanted to run the association when this association version was created.\n"];
  calendar_names: calendar_name_or_arn_list option
    [@ocaml.doc
      "The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations are gated under. The associations for this version only run when that Change Calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  apply_only_at_cron_interval: apply_only_at_cron_interval option
    [@ocaml.doc
      "By default, when you create new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it. This parameter isn't supported for rate expressions.\n"];
  sync_compliance: association_sync_compliance option
    [@ocaml.doc
      "The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].\n\n In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.\n \n  By default, all associations use [AUTO] mode.\n  "];
  compliance_severity: association_compliance_severity option
    [@ocaml.doc "The severity level that is assigned to the association.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.\n\n If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].\n "];
  max_errors: max_errors option
    [@ocaml.doc
      "The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.\n\n Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.\n "];
  association_name: association_name option
    [@ocaml.doc
      "The name specified for the association version when the association version was created.\n"];
  output_location: instance_association_output_location option
    [@ocaml.doc
      "The location in Amazon S3 specified for the association when the association version was created.\n"];
  schedule_expression: schedule_expression option
    [@ocaml.doc
      "The cron or rate schedule specified for the association when the association version was created.\n"];
  targets: targets option
    [@ocaml.doc
      "The targets specified for the association when the association version was created. \n"];
  parameters: parameters option
    [@ocaml.doc
      "Parameters specified when the association version was created.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of an Amazon Web Services Systems Manager document (SSM document) used when the association version was created.\n"];
  name: document_ar_n option
    [@ocaml.doc "The name specified when the association was created.\n"];
  created_date: date_time option
    [@ocaml.doc "The date the association version was created.\n"];
  association_version: association_version option
    [@ocaml.doc "The association version.\n"];
  association_id: association_id option
    [@ocaml.doc
      "The ID created by the system when the association was created.\n"]}
[@@ocaml.doc "Information about the association version.\n"]
type nonrec association_version_list = association_version_info list[@@ocaml.doc
                                                                    ""]
type nonrec list_association_versions_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  association_versions: association_version_list option
    [@ocaml.doc
      "Information about all versions of the association for the specified association ID.\n"]}
[@@ocaml.doc ""]
type nonrec list_association_versions_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  association_id: association_id
    [@ocaml.doc
      "The association ID for which you want to view all versions.\n"]}
[@@ocaml.doc ""]
type nonrec label_parameter_version_result =
  {
  parameter_version: ps_parameter_version option
    [@ocaml.doc "The version of the parameter that has been labeled.\n"];
  invalid_labels: parameter_label_list option
    [@ocaml.doc
      "The label doesn't meet the requirements. For information about parameter label requirements, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html}Working with parameter labels} in the {i Amazon Web Services Systems Manager User Guide}.\n"]}
[@@ocaml.doc ""]
type nonrec label_parameter_version_request =
  {
  labels: parameter_label_list
    [@ocaml.doc
      "One or more labels to attach to the specified parameter version.\n"];
  parameter_version: ps_parameter_version option
    [@ocaml.doc
      "The specific version of the parameter on which you want to attach one or more labels. If no version is specified, the system attaches the label to the latest version.\n"];
  name: ps_parameter_name
    [@ocaml.doc
      "The parameter name on which you want to attach one or more labels.\n\n  You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec key_name = string[@@ocaml.doc ""]
type nonrec is_sub_type_schema = bool[@@ocaml.doc ""]
type nonrec invocation_does_not_exist = unit[@@ocaml.doc ""]
type nonrec inventory_type_display_name = string[@@ocaml.doc ""]
type nonrec inventory_schema_delete_option =
  | DELETE_SCHEMA [@ocaml.doc ""]
  | DISABLE_SCHEMA [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec inventory_result_item =
  {
  content: inventory_item_entry_list
    [@ocaml.doc
      "Contains all the inventory data of the item type. Results include attribute names and values. \n"];
  content_hash: inventory_item_content_hash option
    [@ocaml.doc
      "MD5 hash of the inventory item type contents. The content hash is used to determine whether to update inventory information. The PutInventory API doesn't update the inventory item type contents if the MD5 hash hasn't changed since last update. \n"];
  capture_time: inventory_item_capture_time option
    [@ocaml.doc "The time inventory item data was captured.\n"];
  schema_version: inventory_item_schema_version
    [@ocaml.doc "The schema version for the inventory result item/\n"];
  type_name: inventory_item_type_name
    [@ocaml.doc "The name of the inventory result item type.\n"]}[@@ocaml.doc
                                                                   "The inventory result item.\n"]
type nonrec inventory_result_item_key = string[@@ocaml.doc ""]
type nonrec inventory_result_item_map =
  (inventory_result_item_key * inventory_result_item) list[@@ocaml.doc ""]
type nonrec inventory_result_entity_id = string[@@ocaml.doc ""]
type nonrec inventory_result_entity =
  {
  data: inventory_result_item_map option
    [@ocaml.doc "The data section in the inventory result entity JSON.\n"];
  id: inventory_result_entity_id option
    [@ocaml.doc
      "ID of the inventory result entity. For example, for managed node inventory the result will be the managed node ID. For EC2 instance inventory, the result will be the instance ID. \n"]}
[@@ocaml.doc "Inventory query results.\n"]
type nonrec inventory_result_entity_list = inventory_result_entity list
[@@ocaml.doc ""]
type nonrec inventory_item_type_name_filter = string[@@ocaml.doc ""]
type nonrec inventory_item_attribute_name = string[@@ocaml.doc ""]
type nonrec inventory_attribute_data_type =
  | NUMBER [@ocaml.doc ""]
  | STRING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec inventory_item_attribute =
  {
  data_type: inventory_attribute_data_type
    [@ocaml.doc "The data type of the inventory item attribute. \n"];
  name: inventory_item_attribute_name
    [@ocaml.doc "Name of the inventory item attribute.\n"]}[@@ocaml.doc
                                                             "Attributes are the entries within the inventory item content. It contains name and value.\n"]
type nonrec inventory_item_attribute_list = inventory_item_attribute list
[@@ocaml.doc ""]
type nonrec inventory_item_schema =
  {
  display_name: inventory_type_display_name option
    [@ocaml.doc
      "The alias name of the inventory type. The alias name is used for display purposes.\n"];
  attributes: inventory_item_attribute_list
    [@ocaml.doc
      "The schema attributes for inventory. This contains data type and attribute name.\n"];
  version: inventory_item_schema_version option
    [@ocaml.doc "The schema version for the inventory item.\n"];
  type_name: inventory_item_type_name
    [@ocaml.doc
      "The name of the inventory type. Default inventory item type names start with Amazon Web Services. Custom inventory type names will start with Custom. Default inventory item types include the following: [AWS:AWSComponent], [AWS:Application], [AWS:InstanceInformation], [AWS:Network], and [AWS:WindowsUpdate].\n"]}
[@@ocaml.doc
  "The inventory item schema definition. Users can use this to compose inventory query filters.\n"]
type nonrec inventory_item_schema_result_list = inventory_item_schema list
[@@ocaml.doc ""]
type nonrec inventory_group_name = string[@@ocaml.doc ""]
type nonrec inventory_group =
  {
  filters: inventory_filter_list
    [@ocaml.doc
      "Filters define the criteria for the group. The [matchingCount] field displays the number of resources that match the criteria. The [notMatchingCount] field displays the number of resources that don't match the criteria. \n"];
  name: inventory_group_name [@ocaml.doc "The name of the group.\n"]}
[@@ocaml.doc
  "A user-defined set of one or more filters on which to aggregate inventory data. Groups return a count of resources that match and don't match the specified criteria.\n"]
type nonrec inventory_group_list = inventory_group list[@@ocaml.doc ""]
type nonrec inventory_deletion_start_time = Smaws_Lib.CoreTypes.Timestamp.t
[@@ocaml.doc ""]
type nonrec inventory_deletion_status =
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec inventory_deletion_last_status_message = string[@@ocaml.doc ""]
type nonrec inventory_deletion_summary_item =
  {
  remaining_count: remaining_count option
    [@ocaml.doc "The remaining number of items to delete.\n"];
  count: resource_count option
    [@ocaml.doc "A count of the number of deleted items.\n"];
  version: inventory_item_schema_version option
    [@ocaml.doc "The inventory type version.\n"]}[@@ocaml.doc
                                                   "Either a count, remaining count, or a version number in a delete inventory summary.\n"]
type nonrec inventory_deletion_summary_items =
  inventory_deletion_summary_item list[@@ocaml.doc ""]
type nonrec inventory_deletion_summary =
  {
  summary_items: inventory_deletion_summary_items option
    [@ocaml.doc "A list of counts and versions for deleted items.\n"];
  remaining_count: remaining_count option
    [@ocaml.doc "Remaining number of items to delete.\n"];
  total_count: total_count option
    [@ocaml.doc
      "The total number of items to delete. This count doesn't change during the delete operation.\n"]}
[@@ocaml.doc "Information about the delete operation.\n"]
type nonrec inventory_deletion_last_status_update_time =
  Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec inventory_deletion_status_item =
  {
  last_status_update_time: inventory_deletion_last_status_update_time option
    [@ocaml.doc "The UTC timestamp of when the last status report.\n"];
  deletion_summary: inventory_deletion_summary option
    [@ocaml.doc
      "Information about the delete operation. For more information about this summary, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-custom.html#delete-custom-inventory}Understanding the delete inventory summary} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  last_status_message: inventory_deletion_last_status_message option
    [@ocaml.doc "Information about the status.\n"];
  last_status: inventory_deletion_status option
    [@ocaml.doc
      "The status of the operation. Possible values are InProgress and Complete.\n"];
  deletion_start_time: inventory_deletion_start_time option
    [@ocaml.doc "The UTC timestamp when the delete operation started.\n"];
  type_name: inventory_item_type_name option
    [@ocaml.doc "The name of the inventory data type.\n"];
  deletion_id: uui_d option
    [@ocaml.doc
      "The deletion ID returned by the [DeleteInventory] operation.\n"]}
[@@ocaml.doc
  "Status information returned by the [DeleteInventory] operation.\n"]
type nonrec inventory_deletions_list = inventory_deletion_status_item list
[@@ocaml.doc ""]
type nonrec inventory_aggregator_expression = string[@@ocaml.doc ""]
type inventory_aggregator =
  {
  groups: inventory_group_list option
    [@ocaml.doc
      "A user-defined set of one or more filters on which to aggregate inventory data. Groups return a count of resources that match and don't match the specified criteria.\n"];
  aggregators: inventory_aggregator_list option
    [@ocaml.doc
      "Nested aggregators to further refine aggregation for an inventory type.\n"];
  expression: inventory_aggregator_expression option
    [@ocaml.doc "The inventory type and attribute name for aggregation.\n"]}
[@@ocaml.doc
  "Specifies the inventory type and attribute for the aggregation execution.\n"]
and inventory_aggregator_list = inventory_aggregator list[@@ocaml.doc ""]
type nonrec invalid_tag = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified tag key or value isn't valid.\n"]
type nonrec invalid_result_attribute_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified inventory item result attribute isn't valid.\n"]
type nonrec invalid_plugin_name = unit[@@ocaml.doc ""]
type nonrec invalid_option_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The delete inventory option specified isn't valid. Verify the option and try again.\n"]
type nonrec invalid_inventory_request_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The request isn't valid.\n"]
type nonrec invalid_inventory_group_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified inventory group isn't valid.\n"]
type nonrec invalid_instance_property_filter_value =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified filter value isn't valid.\n"]
type nonrec invalid_instance_information_filter_value =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified filter value isn't valid.\n"]
type nonrec invalid_filter_value = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The filter value isn't valid. Verify the value and try again.\n"]
type nonrec invalid_filter_option =
  {
  message: string_ option
    [@ocaml.doc
      "The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter, valid options are Recursive and OneLevel.\n"]}
[@@ocaml.doc
  "The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter, valid options are Recursive and OneLevel.\n"]
type nonrec invalid_document_type = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The SSM document type isn't valid. Valid document types are described in the [DocumentType] property.\n"]
type nonrec invalid_deletion_id_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The ID specified for the delete operation doesn't exist or isn't valid. Verify the ID and try again.\n"]
type nonrec invalid_delete_inventory_parameters_exception =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "One or more of the parameters specified for the delete operation isn't valid. Verify all parameters and try again.\n"]
type nonrec invalid_activation_id = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The activation ID isn't valid. Verify that you entered the correct ActivationId or ActivationCode and try again.\n"]
type nonrec invalid_activation = {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The activation isn't valid. The activation might have been deleted, or the ActivationId and the ActivationCode don't match.\n"]
type nonrec instances_count = int[@@ocaml.doc ""]
type nonrec instance_type = string[@@ocaml.doc ""]
type nonrec instance_state = string[@@ocaml.doc ""]
type nonrec instance_role = string[@@ocaml.doc ""]
type nonrec instance_property_string_filter_key = string[@@ocaml.doc ""]
type nonrec instance_property_filter_value = string[@@ocaml.doc ""]
type nonrec instance_property_filter_value_set =
  instance_property_filter_value list[@@ocaml.doc ""]
type nonrec instance_property_filter_operator =
  | GREATER_THAN [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | BEGIN_WITH [@ocaml.doc ""]
  | NOT_EQUAL [@ocaml.doc ""]
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_property_string_filter =
  {
  operator: instance_property_filter_operator option
    [@ocaml.doc "The operator used by the filter call.\n"];
  values: instance_property_filter_value_set
    [@ocaml.doc "The filter key name to describe your managed nodes.\n"];
  key: instance_property_string_filter_key
    [@ocaml.doc "The filter key name to describe your managed nodes.\n"]}
[@@ocaml.doc
  "The filters to describe or get information about your managed nodes.\n"]
type nonrec instance_property_string_filter_list =
  instance_property_string_filter list[@@ocaml.doc ""]
type nonrec instance_property_filter_key =
  | ASSOCIATION_STATUS [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""]
  | IAM_ROLE [@ocaml.doc ""]
  | ACTIVATION_IDS [@ocaml.doc ""]
  | DOCUMENT_NAME [@ocaml.doc ""]
  | PLATFORM_TYPES [@ocaml.doc ""]
  | PING_STATUS [@ocaml.doc ""]
  | AGENT_VERSION [@ocaml.doc ""]
  | INSTANCE_IDS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_property_filter =
  {
  value_set: instance_property_filter_value_set
    [@ocaml.doc "The filter values.\n"];
  key: instance_property_filter_key [@ocaml.doc "The name of the filter.\n"]}
[@@ocaml.doc
  "Describes a filter for a specific list of managed nodes. You can filter node information by using tags. You specify tags by using a key-value mapping.\n"]
type nonrec instance_property_filter_list = instance_property_filter list
[@@ocaml.doc ""]
type nonrec instance_name = string[@@ocaml.doc ""]
type nonrec architecture = string[@@ocaml.doc ""]
type nonrec activation_id = string[@@ocaml.doc ""]
type nonrec instance_association_status_aggregated_count =
  (status_name * instance_count) list[@@ocaml.doc ""]
type nonrec instance_aggregated_association_overview =
  {
  instance_association_status_aggregated_count:
    instance_association_status_aggregated_count option
    [@ocaml.doc "The number of associations for the managed nodes.\n"];
  detailed_status: status_name option
    [@ocaml.doc
      "Detailed status information about the aggregated associations.\n"]}
[@@ocaml.doc "Status information about the aggregated associations.\n"]
type nonrec instance_property =
  {
  source_type: source_type option
    [@ocaml.doc "The type of the source resource.\n"];
  source_id: source_id option [@ocaml.doc "The ID of the source resource.\n"];
  association_overview: instance_aggregated_association_overview option
    [@ocaml.doc ""];
  last_successful_association_execution_date: date_time option
    [@ocaml.doc "The last date the association was successfully run.\n"];
  last_association_execution_date: date_time option
    [@ocaml.doc "The date the association was last run.\n"];
  association_status: status_name option
    [@ocaml.doc
      "The status of the State Manager association applied to the managed node.\n"];
  computer_name: computer_name option
    [@ocaml.doc "The fully qualified host name of the managed node.\n"];
  resource_type: string_ option [@ocaml.doc "The type of managed node.\n"];
  registration_date: date_time option
    [@ocaml.doc "The date the node was registered with Systems Manager.\n"];
  iam_role: iam_role option
    [@ocaml.doc
      "The IAM role used in the hybrid activation to register the node with Systems Manager.\n"];
  activation_id: activation_id option
    [@ocaml.doc
      "The activation ID created by Systems Manager when the server or virtual machine (VM) was registered\n"];
  platform_version: platform_version option
    [@ocaml.doc
      "The version of the OS platform running on your managed node.\n"];
  platform_name: platform_name option
    [@ocaml.doc
      "The name of the operating system platform running on your managed node.\n"];
  platform_type: platform_type option
    [@ocaml.doc
      "The operating system platform type of the managed node. For example, Windows Server or Amazon Linux 2.\n"];
  agent_version: version option
    [@ocaml.doc "The version of SSM Agent running on your managed node.\n"];
  last_ping_date_time: date_time option
    [@ocaml.doc
      "The date and time when the SSM Agent last pinged the Systems Manager service.\n"];
  ping_status: ping_status option
    [@ocaml.doc "Connection status of the SSM Agent on the managed node.\n"];
  launch_time: date_time option
    [@ocaml.doc "The timestamp for when the node was launched.\n"];
  ip_address: ip_address option
    [@ocaml.doc
      "The public IPv4 address assigned to the node. If a public IPv4 address isn't assigned to the node, this value is blank.\n"];
  architecture: architecture option
    [@ocaml.doc "The CPU architecture of the node. For example, [x86_64].\n"];
  instance_state: instance_state option
    [@ocaml.doc "The current state of the node.\n"];
  key_name: key_name option
    [@ocaml.doc
      "The name of the key pair associated with the node. If a key pair isnt't associated with the node, this value is blank.\n"];
  instance_role: instance_role option
    [@ocaml.doc
      "The instance profile attached to the node. If an instance profile isn't attached to the node, this value is blank.\n"];
  instance_type: instance_type option
    [@ocaml.doc
      "The instance type of the managed node. For example, t3.large.\n"];
  instance_id: instance_id option
    [@ocaml.doc "The ID of the managed node.\n"];
  name: instance_name option
    [@ocaml.doc
      "The value of the EC2 [Name] tag associated with the node. If a [Name] tag hasn't been applied to the node, this value is blank.\n"]}
[@@ocaml.doc "An object containing various properties of a managed node.\n"]
type nonrec instance_properties = instance_property list[@@ocaml.doc ""]
type nonrec install_override_list = string[@@ocaml.doc ""]
type nonrec instance_patch_state =
  {
  other_non_compliant_count: patch_other_non_compliant_count option
    [@ocaml.doc
      "The number of patches per node that are specified as other than [Critical] or [Security] but aren't compliant with the patch baseline. The status of these managed nodes is [NON_COMPLIANT].\n"];
  security_non_compliant_count: patch_security_non_compliant_count option
    [@ocaml.doc
      "The number of patches per node that are specified as [Security] in a patch advisory aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].\n"];
  critical_non_compliant_count: patch_critical_non_compliant_count option
    [@ocaml.doc
      "The number of patches per node that are specified as [Critical] for compliance reporting in the patch baseline aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].\n"];
  reboot_option: reboot_option option
    [@ocaml.doc
      "Indicates the reboot option specified in the patch baseline.\n\n  Reboot options apply to [Install] operations only. Reboots aren't attempted for Patch Manager [Scan] operations.\n  \n    {ul\n          {-   [RebootIfNeeded]: Patch Manager tries to reboot the managed node if it installed any patches, or if any patches are detected with a status of [InstalledPendingReboot].\n              \n               }\n          {-   [NoReboot]: Patch Manager attempts to install missing packages without trying to reboot the system. Patches installed with this option are assigned a status of [InstalledPendingReboot]. These patches might not be in effect until a reboot is performed.\n              \n               }\n          }\n  "];
  last_no_reboot_install_operation_time: date_time option
    [@ocaml.doc
      "The time of the last attempt to patch the managed node with [NoReboot] specified as the reboot option.\n"];
  operation: patch_operation_type
    [@ocaml.doc
      "The type of patching operation that was performed: or \n\n {ul\n       {-   [SCAN] assesses the patch compliance state.\n           \n            }\n       {-   [INSTALL] installs missing patches.\n           \n            }\n       }\n  "];
  operation_end_time: date_time
    [@ocaml.doc
      "The time the most recent patching operation completed on the managed node.\n"];
  operation_start_time: date_time
    [@ocaml.doc
      "The time the most recent patching operation was started on the managed node.\n"];
  available_security_update_count:
    patch_available_security_update_count option
    [@ocaml.doc
      "The number of security-related patches that are available but not approved because they didn't meet the patch baseline requirements. For example, an updated version of a patch might have been released before the specified auto-approval period was over.\n\n Applies to Windows Server managed nodes only.\n "];
  not_applicable_count: patch_not_applicable_count option
    [@ocaml.doc
      "The number of patches from the patch baseline that aren't applicable for the managed node and therefore aren't installed on the node. This number may be truncated if the list of patch names is very large. The number of patches beyond this limit are reported in [UnreportedNotApplicableCount].\n"];
  unreported_not_applicable_count:
    patch_unreported_not_applicable_count option
    [@ocaml.doc
      "The number of patches beyond the supported limit of [NotApplicableCount] that aren't reported by name to Inventory. Inventory is a tool in Amazon Web Services Systems Manager.\n"];
  failed_count: patch_failed_count option
    [@ocaml.doc
      "The number of patches from the patch baseline that were attempted to be installed during the last patching operation, but failed to install.\n"];
  missing_count: patch_missing_count option
    [@ocaml.doc
      "The number of patches from the patch baseline that are applicable for the managed node but aren't currently installed.\n"];
  installed_rejected_count: patch_installed_rejected_count option
    [@ocaml.doc
      "The number of patches installed on a managed node that are specified in a [RejectedPatches] list. Patches with a status of [InstalledRejected] were typically installed before they were added to a [RejectedPatches] list.\n\n  If [ALLOW_AS_DEPENDENCY] is the specified option for [RejectedPatchesAction], the value of [InstalledRejectedCount] will always be [0] (zero).\n  \n   "];
  installed_pending_reboot_count: patch_installed_pending_reboot_count option
    [@ocaml.doc
      "The number of patches installed by Patch Manager since the last time the managed node was rebooted.\n"];
  installed_other_count: patch_installed_other_count option
    [@ocaml.doc
      "The number of patches not specified in the patch baseline that are installed on the managed node.\n"];
  installed_count: patch_installed_count option
    [@ocaml.doc
      "The number of patches from the patch baseline that are installed on the managed node.\n"];
  owner_information: owner_information option
    [@ocaml.doc
      "Placeholder information. This field will always be empty in the current release of the service.\n"];
  install_override_list: install_override_list option
    [@ocaml.doc
      "An https URL or an Amazon Simple Storage Service (Amazon S3) path-style URL to a list of patches to be installed. This patch installation list, which you maintain in an S3 bucket in YAML format and specify in the SSM document [AWS-RunPatchBaseline], overrides the patches specified by the default patch baseline.\n\n For more information about the [InstallOverrideList] parameter, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-about-aws-runpatchbaseline.html}SSM Command document for patching: [AWS-RunPatchBaseline] } in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  snapshot_id: snapshot_id option
    [@ocaml.doc
      "The ID of the patch baseline snapshot used during the patching operation when this compliance data was collected.\n"];
  baseline_id: baseline_id
    [@ocaml.doc
      "The ID of the patch baseline used to patch the managed node.\n"];
  patch_group: patch_group
    [@ocaml.doc "The name of the patch group the managed node belongs to.\n"];
  instance_id: instance_id
    [@ocaml.doc
      "The ID of the managed node the high-level patch compliance information was collected for.\n"]}
[@@ocaml.doc
  "Defines the high-level patch compliance state for a managed node, providing information about the number of installed, missing, not applicable, and failed patches along with metadata about the operation when this information was gathered for the managed node.\n"]
type nonrec instance_patch_states_list = instance_patch_state list[@@ocaml.doc
                                                                    ""]
type nonrec instance_patch_state_operator_type =
  | GREATER_THAN [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | NOT_EQUAL [@ocaml.doc ""]
  | EQUAL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_patch_state_list = instance_patch_state list[@@ocaml.doc
                                                                   ""]
type nonrec instance_patch_state_filter_value = string[@@ocaml.doc ""]
type nonrec instance_patch_state_filter_values =
  instance_patch_state_filter_value list[@@ocaml.doc ""]
type nonrec instance_patch_state_filter_key = string[@@ocaml.doc ""]
type nonrec instance_patch_state_filter =
  {
  type_: instance_patch_state_operator_type
    [@ocaml.doc
      "The type of comparison that should be performed for the value.\n"];
  values: instance_patch_state_filter_values
    [@ocaml.doc
      "The value for the filter. Must be an integer greater than or equal to 0.\n"];
  key: instance_patch_state_filter_key
    [@ocaml.doc
      "The key for the filter. Supported values include the following:\n\n {ul\n       {-   [InstalledCount] \n           \n            }\n       {-   [InstalledOtherCount] \n           \n            }\n       {-   [InstalledPendingRebootCount] \n           \n            }\n       {-   [InstalledRejectedCount] \n           \n            }\n       {-   [MissingCount] \n           \n            }\n       {-   [FailedCount] \n           \n            }\n       {-   [UnreportedNotApplicableCount] \n           \n            }\n       {-   [NotApplicableCount] \n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Defines a filter used in [DescribeInstancePatchStatesForPatchGroup] to scope down the information returned by the API.\n\n  {b Example}: To filter for all managed nodes in a patch group having more than three patches with a [FailedCount] status, use the following for the filter:\n \n  {ul\n        {-  Value for [Key]: [FailedCount] \n            \n             }\n        {-  Value for [Type]: [GreaterThan] \n            \n             }\n        {-  Value for [Values]: [3] \n            \n             }\n        }\n  "]
type nonrec instance_patch_state_filter_list =
  instance_patch_state_filter list[@@ocaml.doc ""]
type nonrec instance_information_string_filter_key = string[@@ocaml.doc ""]
type nonrec instance_information_filter_value = string[@@ocaml.doc ""]
type nonrec instance_information_filter_value_set =
  instance_information_filter_value list[@@ocaml.doc ""]
type nonrec instance_information_string_filter =
  {
  values: instance_information_filter_value_set
    [@ocaml.doc "The filter values.\n"];
  key: instance_information_string_filter_key
    [@ocaml.doc
      "The filter key name to describe your managed nodes.\n\n Valid filter key values: ActivationIds | AgentVersion | AssociationStatus | IamRole | InstanceIds | PingStatus | PlatformType | ResourceType | SourceIds | SourceTypes | \"tag-key\" | \"tag:[{keyname}] \n \n  {ul\n        {-  Valid values for the [AssociationStatus] filter key: Success | Pending | Failed\n            \n             }\n        {-  Valid values for the [PingStatus] filter key: Online | ConnectionLost | Inactive (deprecated)\n            \n             }\n        {-  Valid values for the [PlatformType] filter key: Windows | Linux | MacOS\n            \n             }\n        {-  Valid values for the [ResourceType] filter key: EC2Instance | ManagedInstance\n            \n             }\n        {-  Valid values for the [SourceType] filter key: AWS::EC2::Instance | AWS::SSM::ManagedInstance | AWS::IoT::Thing\n            \n             }\n        {-  Valid tag examples: [Key=tag-key,Values=Purpose] | [Key=tag:Purpose,Values=Test].\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "The filters to describe or get information about your managed nodes.\n"]
type nonrec instance_information_string_filter_list =
  instance_information_string_filter list[@@ocaml.doc ""]
type nonrec instance_information =
  {
  source_type: source_type option
    [@ocaml.doc
      "The type of the source resource. For IoT Greengrass devices, [SourceType] is [AWS::IoT::Thing]. \n"];
  source_id: source_id option
    [@ocaml.doc
      "The ID of the source resource. For IoT Greengrass devices, [SourceId] is the Thing name. \n"];
  association_overview: instance_aggregated_association_overview option
    [@ocaml.doc "Information about the association.\n"];
  last_successful_association_execution_date: date_time option
    [@ocaml.doc "The last date the association was successfully run.\n"];
  last_association_execution_date: date_time option
    [@ocaml.doc "The date the association was last run.\n"];
  association_status: status_name option
    [@ocaml.doc "The status of the association.\n"];
  computer_name: computer_name option
    [@ocaml.doc "The fully qualified host name of the managed node.\n"];
  ip_address: ip_address option
    [@ocaml.doc "The IP address of the managed node.\n"];
  name: string_ option
    [@ocaml.doc
      "The name assigned to an on-premises server, edge device, or virtual machine (VM) when it is activated as a Systems Manager managed node. The name is specified as the [DefaultInstanceName] property using the [CreateActivation] command. It is applied to the managed node by specifying the Activation Code and Activation ID when you install SSM Agent on the node, as explained in {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-ssm-agent-install-linux.html}How to install SSM Agent on hybrid Linux nodes} and {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-ssm-agent-install-windows.html}How to install SSM Agent on hybrid Windows Server nodes}. To retrieve the [Name] tag of an EC2 instance, use the Amazon EC2 [DescribeInstances] operation. For information, see {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html}DescribeInstances} in the {i Amazon EC2 API Reference} or {{:https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html}describe-instances} in the {i Amazon Web Services CLI Command Reference}.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The type of instance. Instances are either EC2 instances or managed instances. \n"];
  registration_date: date_time option
    [@ocaml.doc
      "The date the server or VM was registered with Amazon Web Services as a managed node.\n"];
  iam_role: iam_role option
    [@ocaml.doc
      "The role assigned to an Amazon EC2 instance configured with a Systems Manager Quick Setup host management configuration or the role assigned to an on-premises managed node.\n\n  This call doesn't return the IAM role for {i unmanaged} Amazon EC2 instances (instances not configured for Systems Manager). To retrieve the role for an unmanaged instance, use the Amazon EC2 [DescribeInstances] operation. For information, see {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html}DescribeInstances} in the {i Amazon EC2 API Reference} or {{:https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html}describe-instances} in the {i Amazon Web Services CLI Command Reference}.\n "];
  activation_id: activation_id option
    [@ocaml.doc
      "The activation ID created by Amazon Web Services Systems Manager when the server or virtual machine (VM) was registered.\n"];
  platform_version: string_ option
    [@ocaml.doc
      "The version of the OS platform running on your managed node. \n"];
  platform_name: string_ option
    [@ocaml.doc
      "The name of the operating system platform running on your managed node. \n"];
  platform_type: platform_type option
    [@ocaml.doc "The operating system platform type.\n"];
  is_latest_version: boolean_ option
    [@ocaml.doc
      "Indicates whether the latest version of SSM Agent is running on your Linux managed node. This field doesn't indicate whether or not the latest version is installed on Windows managed nodes, because some older versions of Windows Server use the EC2Config service to process Systems Manager requests.\n"];
  agent_version: version option
    [@ocaml.doc
      "The version of SSM Agent running on your Linux managed node. \n"];
  last_ping_date_time: date_time option
    [@ocaml.doc
      "The date and time when the agent last pinged the Systems Manager service. \n"];
  ping_status: ping_status option
    [@ocaml.doc
      "Connection status of SSM Agent. \n\n  The status [Inactive] has been deprecated and is no longer in use.\n  \n   "];
  instance_id: instance_id option [@ocaml.doc "The managed node ID. \n"]}
[@@ocaml.doc "Describes a filter for a specific list of managed nodes. \n"]
type nonrec instance_information_list = instance_information list[@@ocaml.doc
                                                                   ""]
type nonrec instance_information_filter_key =
  | ASSOCIATION_STATUS [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""]
  | IAM_ROLE [@ocaml.doc ""]
  | ACTIVATION_IDS [@ocaml.doc ""]
  | PLATFORM_TYPES [@ocaml.doc ""]
  | PING_STATUS [@ocaml.doc ""]
  | AGENT_VERSION [@ocaml.doc ""]
  | INSTANCE_IDS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_information_filter =
  {
  value_set: instance_information_filter_value_set
    [@ocaml.doc "The filter values.\n"];
  key: instance_information_filter_key
    [@ocaml.doc "The name of the filter. \n"]}[@@ocaml.doc
                                                "Describes a filter for a specific list of managed nodes. You can filter node information by using tags. You specify tags by using a key-value mapping.\n\n Use this operation instead of the [DescribeInstanceInformationRequest$InstanceInformationFilterList] method. The [InstanceInformationFilterList] method is a legacy method and doesn't support tags. \n "]
type nonrec instance_information_filter_list =
  instance_information_filter list[@@ocaml.doc ""]
type nonrec instance_association_execution_summary = string[@@ocaml.doc ""]
type nonrec agent_error_code = string[@@ocaml.doc ""]
type nonrec instance_association_output_url =
  {
  s3_output_url: s3_output_url option
    [@ocaml.doc
      "The URL of S3 bucket where you want to store the results of this request.\n"]}
[@@ocaml.doc
  "The URL of S3 bucket where you want to store the results of this request.\n"]
type nonrec instance_association_status_info =
  {
  association_name: association_name option
    [@ocaml.doc "The name of the association applied to the managed node.\n"];
  output_url: instance_association_output_url option
    [@ocaml.doc
      "A URL for an S3 bucket where you want to store the results of this request.\n"];
  error_code: agent_error_code option
    [@ocaml.doc
      "An error code returned by the request to create the association.\n"];
  execution_summary: instance_association_execution_summary option
    [@ocaml.doc "Summary information about association execution.\n"];
  detailed_status: status_name option
    [@ocaml.doc "Detailed status information about the association.\n"];
  status: status_name option
    [@ocaml.doc "Status information about the association.\n"];
  execution_date: date_time option
    [@ocaml.doc "The date the association ran. \n"];
  instance_id: instance_id option
    [@ocaml.doc "The managed node ID where the association was created.\n"];
  association_version: association_version option
    [@ocaml.doc
      "The version of the association applied to the managed node.\n"];
  document_version: document_version option
    [@ocaml.doc "The association document versions.\n"];
  name: document_ar_n option [@ocaml.doc "The name of the association.\n"];
  association_id: association_id option [@ocaml.doc "The association ID.\n"]}
[@@ocaml.doc "Status information about the association.\n"]
type nonrec instance_association_status_infos =
  instance_association_status_info list[@@ocaml.doc ""]
type nonrec instance_association =
  {
  association_version: association_version option
    [@ocaml.doc
      "Version information for the association on the managed node.\n"];
  content: document_content option
    [@ocaml.doc
      "The content of the association document for the managed nodes.\n"];
  instance_id: instance_id option [@ocaml.doc "The managed node ID.\n"];
  association_id: association_id option [@ocaml.doc "The association ID.\n"]}
[@@ocaml.doc "One or more association documents on the managed node. \n"]
type nonrec instance_association_list = instance_association list[@@ocaml.doc
                                                                   ""]
type nonrec iso8601_string = string[@@ocaml.doc ""]
type nonrec get_service_setting_result =
  {
  service_setting: service_setting option
    [@ocaml.doc "The query result of the current service setting.\n"]}
[@@ocaml.doc
  "The query result body of the GetServiceSetting API operation.\n"]
type nonrec get_service_setting_request =
  {
  setting_id: service_setting_id
    [@ocaml.doc
      "The ID of the service setting to get. The setting ID can be one of the following.\n\n {ul\n       {-   [/ssm/appmanager/appmanager-enabled] \n           \n            }\n       {-   [/ssm/automation/customer-script-log-destination] \n           \n            }\n       {-   [/ssm/automation/customer-script-log-group-name] \n           \n            }\n       {-  /ssm/automation/enable-adaptive-concurrency\n           \n            }\n       {-   [/ssm/documents/console/public-sharing-permission] \n           \n            }\n       {-   [/ssm/managed-instance/activation-tier] \n           \n            }\n       {-   [/ssm/managed-instance/default-ec2-instance-management-role] \n           \n            }\n       {-   [/ssm/opsinsights/opscenter] \n           \n            }\n       {-   [/ssm/parameter-store/default-parameter-tier] \n           \n            }\n       {-   [/ssm/parameter-store/high-throughput-enabled] \n           \n            }\n       }\n  "]}
[@@ocaml.doc "The request body of the GetServiceSetting API operation.\n"]
type nonrec get_resource_policies_response_entry =
  {
  policy: policy option
    [@ocaml.doc
      "A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. Currently, [OpsItemGroup] is the only resource that supports Systems Manager resource policies. The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).\n"];
  policy_hash: policy_hash option
    [@ocaml.doc
      "ID of the current policy version. The hash helps to prevent a situation where multiple users attempt to overwrite a policy. You must provide this hash when updating or deleting a policy.\n"];
  policy_id: policy_id option [@ocaml.doc "A policy ID.\n"]}[@@ocaml.doc
                                                              "A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. Currently, [OpsItemGroup] is the only resource that supports Systems Manager resource policies. The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).\n"]
type nonrec get_resource_policies_response_entries =
  get_resource_policies_response_entry list[@@ocaml.doc ""]
type nonrec get_resource_policies_response =
  {
  policies: get_resource_policies_response_entries option
    [@ocaml.doc "An array of the [Policy] object.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"]}
[@@ocaml.doc ""]
type nonrec get_resource_policies_request =
  {
  max_results: resource_policy_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: string_ option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results.\n"];
  resource_arn: resource_arn_string
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the resource to which the policies are attached.\n"]}
[@@ocaml.doc ""]
type nonrec get_patch_baseline_result =
  {
  available_security_updates_compliance_status:
    patch_compliance_status option
    [@ocaml.doc
      "Indicates the compliance status of managed nodes for which security-related patches are available but were not approved. This preference is specified when the [CreatePatchBaseline] or [UpdatePatchBaseline] commands are run.\n\n Applies to Windows Server managed nodes only.\n "];
  sources: patch_source_list option
    [@ocaml.doc
      "Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.\n"];
  description: baseline_description option
    [@ocaml.doc "A description of the patch baseline.\n"];
  modified_date: date_time option
    [@ocaml.doc "The date the patch baseline was last modified.\n"];
  created_date: date_time option
    [@ocaml.doc "The date the patch baseline was created.\n"];
  patch_groups: patch_group_list option
    [@ocaml.doc "Patch groups included in the patch baseline.\n"];
  rejected_patches_action: patch_action option
    [@ocaml.doc
      "The action specified to take on patches included in the [RejectedPatches] list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.\n"];
  rejected_patches: patch_id_list option
    [@ocaml.doc "A list of explicitly rejected patches for the baseline.\n"];
  approved_patches_enable_non_security: boolean_ option
    [@ocaml.doc
      "Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.\n"];
  approved_patches_compliance_level: patch_compliance_level option
    [@ocaml.doc
      "Returns the specified compliance severity level for approved patches in the patch baseline.\n"];
  approved_patches: patch_id_list option
    [@ocaml.doc "A list of explicitly approved patches for the baseline.\n"];
  approval_rules: patch_rule_group option
    [@ocaml.doc "A set of rules used to include patches in the baseline.\n"];
  global_filters: patch_filter_group option
    [@ocaml.doc
      "A set of global filters used to exclude patches from the baseline.\n"];
  operating_system: operating_system option
    [@ocaml.doc
      "Returns the operating system specified for the patch baseline.\n"];
  name: baseline_name option [@ocaml.doc "The name of the patch baseline.\n"];
  baseline_id: baseline_id option
    [@ocaml.doc "The ID of the retrieved patch baseline.\n"]}[@@ocaml.doc ""]
type nonrec get_patch_baseline_request =
  {
  baseline_id: baseline_id
    [@ocaml.doc
      "The ID of the patch baseline to retrieve.\n\n  To retrieve information about an Amazon Web Services managed patch baseline, specify the full Amazon Resource Name (ARN) of the baseline. For example, for the baseline [AWS-AmazonLinuxDefaultPatchBaseline], specify [arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0e392de35e7c563b7] instead of [pb-0e392de35e7c563b7].\n  \n   "]}
[@@ocaml.doc ""]
type nonrec get_patch_baseline_for_patch_group_result =
  {
  operating_system: operating_system option
    [@ocaml.doc
      "The operating system rule specified for patch groups using the patch baseline.\n"];
  patch_group: patch_group option
    [@ocaml.doc "The name of the patch group.\n"];
  baseline_id: baseline_id option
    [@ocaml.doc
      "The ID of the patch baseline that should be used for the patch group.\n"]}
[@@ocaml.doc ""]
type nonrec get_patch_baseline_for_patch_group_request =
  {
  operating_system: operating_system option
    [@ocaml.doc
      "Returns the operating system rule specified for patch groups using the patch baseline.\n"];
  patch_group: patch_group
    [@ocaml.doc
      "The name of the patch group whose patch baseline should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec get_parameters_result =
  {
  invalid_parameters: parameter_name_list option
    [@ocaml.doc
      "A list of parameters that aren't formatted correctly or don't run during an execution.\n"];
  parameters: parameter_list option
    [@ocaml.doc "A list of details for a parameter.\n"]}[@@ocaml.doc ""]
type nonrec get_parameters_request =
  {
  with_decryption: boolean_ option
    [@ocaml.doc
      "Return decrypted secure string value. Return decrypted values for secure string parameters. This flag is ignored for [String] and [StringList] parameter types.\n"];
  names: parameter_name_list
    [@ocaml.doc
      "The names or Amazon Resource Names (ARNs) of the parameters that you want to query. For parameters shared with you from another account, you must use the full ARNs.\n\n To query by parameter label, use [\"Name\": \"name:label\"]. To query by parameter version, use [\"Name\": \"name:version\"].\n \n   The results for [GetParameters] requests are listed in alphabetical order in query responses.\n   \n     For information about shared parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.\n     "]}
[@@ocaml.doc ""]
type nonrec get_parameters_by_path_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  parameters: parameter_list option
    [@ocaml.doc "A list of parameters found in the specified hierarchy.\n"]}
[@@ocaml.doc ""]
type nonrec get_parameters_by_path_max_results = int[@@ocaml.doc ""]
type nonrec get_parameters_by_path_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  max_results: get_parameters_by_path_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  with_decryption: boolean_ option
    [@ocaml.doc
      "Retrieve all parameters in a hierarchy with their value decrypted.\n"];
  parameter_filters: parameter_string_filter_list option
    [@ocaml.doc
      "Filters to limit the request results.\n\n  The following [Key] values are supported for [GetParametersByPath]: [Type], [KeyId], and [Label].\n  \n   The following [Key] values aren't supported for [GetParametersByPath]: [tag], [DataType], [Name], [Path], and [Tier].\n   \n    "];
  recursive: boolean_ option
    [@ocaml.doc
      "Retrieve all parameters within a hierarchy.\n\n  If a user has access to a path, then the user can access all levels of that path. For example, if a user has permission to access path [/a], then the user can also access [/a/b]. Even if a user has explicitly been denied access in IAM for parameter [/a/b], they can still call the GetParametersByPath API operation recursively for [/a] and view [/a/b].\n  \n   "];
  path: ps_parameter_name
    [@ocaml.doc
      "The hierarchy for the parameter. Hierarchies start with a forward slash (/). The hierarchy is the parameter name except the last part of the parameter. For the API call to succeed, the last part of the parameter name can't be in the path. A parameter name hierarchy can have a maximum of 15 levels. Here is an example of a hierarchy: [/Finance/Prod/IAD/WinServ2016/license33 ] \n"]}
[@@ocaml.doc ""]
type nonrec get_parameter_result =
  {
  parameter: parameter option [@ocaml.doc "Information about a parameter.\n"]}
[@@ocaml.doc ""]
type nonrec get_parameter_request =
  {
  with_decryption: boolean_ option
    [@ocaml.doc
      "Return decrypted values for secure string parameters. This flag is ignored for [String] and [StringList] parameter types.\n"];
  name: ps_parameter_name
    [@ocaml.doc
      "The name or Amazon Resource Name (ARN) of the parameter that you want to query. For parameters shared with you from another account, you must use the full ARN.\n\n To query by parameter label, use [\"Name\": \"name:label\"]. To query by parameter version, use [\"Name\": \"name:version\"].\n \n  For more information about shared parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.\n  "]}
[@@ocaml.doc ""]
type nonrec get_parameter_history_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  parameters: parameter_history_list option
    [@ocaml.doc "A list of parameters returned by the request.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_parameter_history_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  with_decryption: boolean_ option
    [@ocaml.doc
      "Return decrypted values for secure string parameters. This flag is ignored for [String] and [StringList] parameter types.\n"];
  name: ps_parameter_name
    [@ocaml.doc
      "The name or Amazon Resource Name (ARN) of the parameter for which you want to review history. For parameters shared with you from another account, you must use the full ARN.\n"]}
[@@ocaml.doc ""]
type nonrec get_ops_summary_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  entities: ops_entity_list option
    [@ocaml.doc "The list of aggregated details and filtered OpsData.\n"]}
[@@ocaml.doc ""]
type nonrec get_ops_summary_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  result_attributes: ops_result_attribute_list option
    [@ocaml.doc "The OpsData data type to return.\n"];
  aggregators: ops_aggregator_list option
    [@ocaml.doc
      "Optional aggregators that return counts of OpsData based on one or more expressions.\n"];
  filters: ops_filter_list option
    [@ocaml.doc
      "Optional filters used to scope down the returned OpsData. \n"];
  sync_name: resource_data_sync_name option
    [@ocaml.doc "Specify the name of a resource data sync to get.\n"]}
[@@ocaml.doc ""]
type nonrec get_ops_metadata_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  metadata: metadata_map option
    [@ocaml.doc "OpsMetadata for an Application Manager application.\n"];
  resource_id: ops_metadata_resource_id option
    [@ocaml.doc "The resource ID of the Application Manager application.\n"]}
[@@ocaml.doc ""]
type nonrec get_ops_metadata_max_results = int[@@ocaml.doc ""]
type nonrec get_ops_metadata_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results.\n"];
  max_results: get_ops_metadata_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  ops_metadata_arn: ops_metadata_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an OpsMetadata Object to view.\n"]}
[@@ocaml.doc ""]
type nonrec get_ops_item_response =
  {
  ops_item: ops_item option [@ocaml.doc "The OpsItem.\n"]}[@@ocaml.doc ""]
type nonrec get_ops_item_request =
  {
  ops_item_arn: ops_item_arn option
    [@ocaml.doc "The OpsItem Amazon Resource Name (ARN).\n"];
  ops_item_id: ops_item_id
    [@ocaml.doc "The ID of the OpsItem that you want to get.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec get_maintenance_window_task_result =
  {
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm you applied to your maintenance window task.\n"];
  cutoff_behavior: maintenance_window_task_cutoff_behavior option
    [@ocaml.doc
      "The action to take on tasks when the maintenance window cutoff time is reached. [CONTINUE_TASK] means that tasks continue to run. For Automation, Lambda, Step Functions tasks, [CANCEL_TASK] means that currently running task invocations continue, but no new task invocations are started. For Run Command tasks, [CANCEL_TASK] means the system attempts to stop the task by sending a [CancelCommand] operation.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "The retrieved task description.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The retrieved task name.\n"];
  logging_info: logging_info option
    [@ocaml.doc
      "The location in Amazon Simple Storage Service (Amazon S3) where the task results are logged.\n\n   [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  max_errors: max_errors option
    [@ocaml.doc
      "The maximum number of errors allowed before the task stops being scheduled.\n\n  For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. This value doesn't affect the running of your task and can be ignored.\n  \n   "];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run this task in parallel.\n\n  For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. This value doesn't affect the running of your task and can be ignored.\n  \n   "];
  priority: maintenance_window_task_priority option
    [@ocaml.doc
      "The priority of the task when it runs. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.\n"];
  task_invocation_parameters:
    maintenance_window_task_invocation_parameters option
    [@ocaml.doc "The parameters to pass to the task when it runs.\n"];
  task_parameters: maintenance_window_task_parameters option
    [@ocaml.doc
      "The parameters to pass to the task when it runs.\n\n   [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n   "];
  task_type: maintenance_window_task_type option
    [@ocaml.doc "The type of task to run.\n"];
  service_role_arn: service_role option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].\n\n However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up Maintenance Windows} in the in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  task_arn: maintenance_window_task_arn option
    [@ocaml.doc
      "The resource that the task used during execution. For [RUN_COMMAND] and [AUTOMATION] task types, the value of [TaskArn] is the SSM document name/ARN. For [LAMBDA] tasks, the value is the function name/ARN. For [STEP_FUNCTIONS] tasks, the value is the state machine ARN.\n"];
  targets: targets option
    [@ocaml.doc "The targets where the task should run.\n"];
  window_task_id: maintenance_window_task_id option
    [@ocaml.doc "The retrieved maintenance window task ID.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The retrieved maintenance window ID.\n"]}[@@ocaml.doc ""]
type nonrec get_maintenance_window_task_request =
  {
  window_task_id: maintenance_window_task_id
    [@ocaml.doc "The maintenance window task ID to retrieve.\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The maintenance window ID that includes the task to retrieve.\n"]}
[@@ocaml.doc ""]
type nonrec get_maintenance_window_result =
  {
  modified_date: date_time option
    [@ocaml.doc "The date the maintenance window was last modified.\n"];
  created_date: date_time option
    [@ocaml.doc "The date the maintenance window was created.\n"];
  enabled: maintenance_window_enabled option
    [@ocaml.doc "Indicates whether the maintenance window is enabled.\n"];
  allow_unassociated_targets:
    maintenance_window_allow_unassociated_targets option
    [@ocaml.doc
      "Whether targets must be registered with the maintenance window before tasks can be defined for those targets.\n"];
  cutoff: maintenance_window_cutoff option
    [@ocaml.doc
      "The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.\n"];
  duration: maintenance_window_duration_hours option
    [@ocaml.doc "The duration of the maintenance window in hours.\n"];
  next_execution_time: maintenance_window_string_date_time option
    [@ocaml.doc
      "The next time the maintenance window will actually run, taking into account any specified times for the maintenance window to become active or inactive.\n"];
  schedule_offset: maintenance_window_offset option
    [@ocaml.doc
      "The number of days to wait to run a maintenance window after the scheduled cron expression date and time.\n"];
  schedule_timezone: maintenance_window_timezone option
    [@ocaml.doc
      "The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \"Asia/Seoul\". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.\n"];
  schedule: maintenance_window_schedule option
    [@ocaml.doc
      "The schedule of the maintenance window in the form of a cron or rate expression.\n"];
  end_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive. The maintenance window won't run after this specified time.\n"];
  start_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active. The maintenance window won't run before this specified time.\n"];
  description: maintenance_window_description option
    [@ocaml.doc "The description of the maintenance window.\n"];
  name: maintenance_window_name option
    [@ocaml.doc "The name of the maintenance window.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the created maintenance window.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec get_maintenance_window_request =
  {
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window for which you want to retrieve information.\n"]}
[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_result =
  {
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc
      "The CloudWatch alarms that were invoked by the maintenance window task.\n"];
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm you applied to your maintenance window task.\n"];
  end_time: date_time option
    [@ocaml.doc "The time the task execution completed.\n"];
  start_time: date_time option
    [@ocaml.doc "The time the task execution started.\n"];
  status_details: maintenance_window_execution_status_details option
    [@ocaml.doc
      "The details explaining the status. Not available for all status values.\n"];
  status: maintenance_window_execution_status option
    [@ocaml.doc "The status of the task.\n"];
  max_errors: max_errors option
    [@ocaml.doc
      "The defined maximum number of task execution errors allowed before scheduling of the task execution would have been stopped.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The defined maximum number of task executions that could be run in parallel.\n"];
  priority: maintenance_window_task_priority option
    [@ocaml.doc "The priority of the task.\n"];
  task_parameters: maintenance_window_task_parameters_list option
    [@ocaml.doc
      "The parameters passed to the task when it was run.\n\n   [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].\n  \n    The map has the following format:\n    \n     {ul\n           {-   [Key]: string, between 1 and 255 characters\n               \n                }\n           {-   [Value]: an array of strings, each between 1 and 255 characters\n               \n                }\n           }\n  "];
  type_: maintenance_window_task_type option
    [@ocaml.doc "The type of task that was run.\n"];
  service_role: service_role option
    [@ocaml.doc "The role that was assumed when running the task.\n"];
  task_arn: maintenance_window_task_arn option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the task that ran.\n"];
  task_execution_id: maintenance_window_execution_task_id option
    [@ocaml.doc
      "The ID of the specific task execution in the maintenance window task that was retrieved.\n"];
  window_execution_id: maintenance_window_execution_id option
    [@ocaml.doc
      "The ID of the maintenance window execution that includes the task.\n"]}
[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_request =
  {
  task_id: maintenance_window_execution_task_id
    [@ocaml.doc
      "The ID of the specific task execution in the maintenance window task that should be retrieved.\n"];
  window_execution_id: maintenance_window_execution_id
    [@ocaml.doc
      "The ID of the maintenance window execution that includes the task.\n"]}
[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_invocation_result =
  {
  window_target_id: maintenance_window_task_target_id option
    [@ocaml.doc "The maintenance window target ID.\n"];
  owner_information: owner_information option
    [@ocaml.doc
      "User-provided value to be included in any Amazon CloudWatch Events or Amazon EventBridge events raised while running tasks for these targets in this maintenance window.\n"];
  end_time: date_time option
    [@ocaml.doc "The time that the task finished running on the target.\n"];
  start_time: date_time option
    [@ocaml.doc "The time that the task started running on the target.\n"];
  status_details: maintenance_window_execution_status_details option
    [@ocaml.doc
      "The details explaining the status. Details are only available for certain status values.\n"];
  status: maintenance_window_execution_status option
    [@ocaml.doc "The task status for an invocation.\n"];
  parameters: maintenance_window_execution_task_invocation_parameters option
    [@ocaml.doc "The parameters used at the time that the task ran.\n"];
  task_type: maintenance_window_task_type option
    [@ocaml.doc "Retrieves the task type for a maintenance window.\n"];
  execution_id: maintenance_window_execution_task_execution_id option
    [@ocaml.doc "The execution ID.\n"];
  invocation_id: maintenance_window_execution_task_invocation_id option
    [@ocaml.doc "The invocation ID.\n"];
  task_execution_id: maintenance_window_execution_task_id option
    [@ocaml.doc "The task execution ID.\n"];
  window_execution_id: maintenance_window_execution_id option
    [@ocaml.doc "The maintenance window execution ID.\n"]}[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_task_invocation_request =
  {
  invocation_id: maintenance_window_execution_task_invocation_id
    [@ocaml.doc "The invocation ID to retrieve.\n"];
  task_id: maintenance_window_execution_task_id
    [@ocaml.doc
      "The ID of the specific task in the maintenance window task that should be retrieved. \n"];
  window_execution_id: maintenance_window_execution_id
    [@ocaml.doc
      "The ID of the maintenance window execution for which the task is a part.\n"]}
[@@ocaml.doc ""]
type nonrec get_maintenance_window_execution_result =
  {
  end_time: date_time option
    [@ocaml.doc "The time the maintenance window finished running.\n"];
  start_time: date_time option
    [@ocaml.doc "The time the maintenance window started running.\n"];
  status_details: maintenance_window_execution_status_details option
    [@ocaml.doc
      "The details explaining the status. Not available for all status values.\n"];
  status: maintenance_window_execution_status option
    [@ocaml.doc "The status of the maintenance window execution.\n"];
  task_ids: maintenance_window_execution_task_id_list option
    [@ocaml.doc
      "The ID of the task executions from the maintenance window execution.\n"];
  window_execution_id: maintenance_window_execution_id option
    [@ocaml.doc "The ID of the maintenance window execution.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec get_maintenance_window_execution_request =
  {
  window_execution_id: maintenance_window_execution_id
    [@ocaml.doc
      "The ID of the maintenance window execution that includes the task.\n"]}
[@@ocaml.doc ""]
type nonrec get_inventory_schema_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  schemas: inventory_item_schema_result_list option
    [@ocaml.doc "Inventory schemas returned by the request.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_inventory_schema_max_results = int[@@ocaml.doc ""]
type nonrec aggregator_schema_only = bool[@@ocaml.doc ""]
type nonrec get_inventory_schema_request =
  {
  sub_type: is_sub_type_schema option
    [@ocaml.doc
      "Returns the sub-type schema for a specified inventory type.\n"];
  aggregator: aggregator_schema_only option
    [@ocaml.doc
      "Returns inventory schemas that support aggregation. For example, this call returns the [AWS:InstanceInformation] type, because it supports aggregation based on the [PlatformName], [PlatformType], and [PlatformVersion] attributes.\n"];
  max_results: get_inventory_schema_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  type_name: inventory_item_type_name_filter option
    [@ocaml.doc "The type of inventory item to return.\n"]}[@@ocaml.doc ""]
type nonrec get_inventory_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  entities: inventory_result_entity_list option
    [@ocaml.doc
      "Collection of inventory entities such as a collection of managed node inventory. \n"]}
[@@ocaml.doc ""]
type nonrec get_inventory_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  result_attributes: result_attribute_list option
    [@ocaml.doc "The list of inventory item types to return.\n"];
  aggregators: inventory_aggregator_list option
    [@ocaml.doc
      "Returns counts of inventory types based on one or more expressions. For example, if you aggregate by using an expression that uses the [AWS:InstanceInformation.PlatformType] type, you can see a count of how many Windows and Linux managed nodes exist in your inventoried fleet.\n"];
  filters: inventory_filter_list option
    [@ocaml.doc
      "One or more filters. Use a filter to return a more specific list of results.\n"]}
[@@ocaml.doc ""]
type nonrec execution_preview_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec automation_execution_preview =
  {
  total_accounts: integer option
    [@ocaml.doc
      "Information about the Amazon Web Services accounts that were included in the execution preview.\n"];
  target_previews: target_preview_list option
    [@ocaml.doc
      "Information that provides a preview of what the impact of running the specified Automation runbook would be.\n"];
  regions: region_list option
    [@ocaml.doc
      "Information about the Amazon Web Services Regions targeted by the execution preview.\n"];
  step_previews: step_preview_map option
    [@ocaml.doc
      "Information about the type of impact a runbook step would have on a resource.\n\n {ul\n       {-   [Mutating]: The runbook step would make changes to the targets through actions that create, modify, or delete resources.\n           \n            }\n       {-   [Non_Mutating]: The runbook step would retrieve data about resources but not make changes to them. This category generally includes [Describe*], [List*], [Get*], and similar read-only API actions.\n           \n            }\n       {-   [Undetermined]: An undetermined step invokes executions performed by another orchestration service like Lambda, Step Functions, or Amazon Web Services Systems Manager Run Command. An undetermined step might also call a third-party API. Systems Manager Automation doesn't know the outcome of the orchestration processes or third-party API executions, so the results of the steps are undetermined.\n           \n            }\n       }\n  "]}
[@@ocaml.doc "Information about the results of the execution preview.\n"]
type nonrec execution_preview =
  | Automation of automation_execution_preview
  [@ocaml.doc
    "Information about the changes that would be made if an Automation workflow were run.\n"]
[@@ocaml.doc
  "Information about the changes that would be made if an execution were run.\n"]
type nonrec get_execution_preview_response =
  {
  execution_preview: execution_preview option [@ocaml.doc ""];
  status_message: string_ option
    [@ocaml.doc
      "Supplemental information about the current status of the execution preview.\n"];
  status: execution_preview_status option
    [@ocaml.doc "The current status of the execution preview operation.\n"];
  ended_at: date_time option
    [@ocaml.doc
      "A UTC timestamp indicating when the execution preview operation ended.\n"];
  execution_preview_id: execution_preview_id option
    [@ocaml.doc "The generated ID for the existing execution preview.\n"]}
[@@ocaml.doc ""]
type nonrec get_execution_preview_request =
  {
  execution_preview_id: execution_preview_id
    [@ocaml.doc "The ID of the existing execution preview.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec content_length = int[@@ocaml.doc ""]
type nonrec attachment_hash = string[@@ocaml.doc ""]
type nonrec attachment_hash_type =
  | SHA256 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attachment_url = string[@@ocaml.doc ""]
type nonrec attachment_content =
  {
  url: attachment_url option
    [@ocaml.doc "The URL location of the attachment content.\n"];
  hash_type: attachment_hash_type option
    [@ocaml.doc "The hash algorithm used to calculate the hash value.\n"];
  hash: attachment_hash option
    [@ocaml.doc "The cryptographic hash value of the document content.\n"];
  size: content_length option
    [@ocaml.doc "The size of an attachment in bytes.\n"];
  name: attachment_name option [@ocaml.doc "The name of an attachment.\n"]}
[@@ocaml.doc
  "A structure that includes attributes that describe a document attachment.\n"]
type nonrec attachment_content_list = attachment_content list[@@ocaml.doc ""]
type nonrec get_document_result =
  {
  review_status: review_status option
    [@ocaml.doc
      "The current review status of a new custom Systems Manager document (SSM document) created by a member of your organization, or of the latest version of an existing SSM document.\n\n Only one version of an SSM document can be in the APPROVED state at a time. When a new version is approved, the status of the previous version changes to REJECTED.\n \n  Only one version of an SSM document can be in review, or PENDING, at a time.\n  "];
  attachments_content: attachment_content_list option
    [@ocaml.doc
      "A description of the document attachments, including names, locations, sizes, and so on.\n"];
  requires: document_requires_list option
    [@ocaml.doc
      "A list of SSM documents required by a document. For example, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document.\n"];
  document_format: document_format option
    [@ocaml.doc "The document format, either JSON or YAML.\n"];
  document_type: document_type option [@ocaml.doc "The document type.\n"];
  content: document_content option
    [@ocaml.doc "The contents of the SSM document.\n"];
  status_information: document_status_information option
    [@ocaml.doc
      "A message returned by Amazon Web Services Systems Manager that explains the [Status] value. For example, a [Failed] status might be explained by the [StatusInformation] message, \"The specified S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct.\"\n"];
  status: document_status option
    [@ocaml.doc
      "The status of the SSM document, such as [Creating], [Active], [Updating], [Failed], and [Deleting].\n"];
  document_version: document_version option
    [@ocaml.doc "The document version.\n"];
  version_name: document_version_name option
    [@ocaml.doc
      "The version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.\n"];
  display_name: document_display_name option
    [@ocaml.doc
      "The friendly name of the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].\n"];
  created_date: date_time option
    [@ocaml.doc "The date the SSM document was created.\n"];
  name: document_ar_n option [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc ""]
type nonrec get_document_request =
  {
  document_format: document_format option
    [@ocaml.doc
      "Returns the document in the specified format. The document format can be either JSON or YAML. JSON is the default format.\n"];
  document_version: document_version option
    [@ocaml.doc "The document version for which you want information.\n"];
  version_name: document_version_name option
    [@ocaml.doc
      "An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document and can't be changed.\n"];
  name: document_ar_n [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc ""]
type nonrec get_deployable_patch_snapshot_for_instance_result =
  {
  product: product option
    [@ocaml.doc
      "Returns the specific operating system (for example Windows Server 2012 or Amazon Linux 2015.09) on the managed node for the specified patch snapshot.\n"];
  snapshot_download_url: snapshot_download_url option
    [@ocaml.doc
      "A pre-signed Amazon Simple Storage Service (Amazon S3) URL that can be used to download the patch snapshot.\n"];
  snapshot_id: snapshot_id option
    [@ocaml.doc "The user-defined snapshot ID.\n"];
  instance_id: instance_id option [@ocaml.doc "The managed node ID.\n"]}
[@@ocaml.doc ""]
type nonrec baseline_override =
  {
  available_security_updates_compliance_status:
    patch_compliance_status option
    [@ocaml.doc
      "Indicates whether managed nodes for which there are available security-related patches that have not been approved by the baseline are being defined as [COMPLIANT] or [NON_COMPLIANT]. This option is specified when the [CreatePatchBaseline] or [UpdatePatchBaseline] commands are run.\n\n Applies to Windows Server managed nodes only.\n "];
  sources: patch_source_list option
    [@ocaml.doc
      "Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.\n"];
  approved_patches_enable_non_security: boolean_ option
    [@ocaml.doc
      "Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.\n"];
  rejected_patches_action: patch_action option
    [@ocaml.doc
      "The action for Patch Manager to take on patches included in the [RejectedPackages] list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.\n"];
  rejected_patches: patch_id_list option
    [@ocaml.doc
      "A list of explicitly rejected patches for the baseline.\n\n For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}Package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  approved_patches_compliance_level: patch_compliance_level option
    [@ocaml.doc
      "Defines the compliance level for approved patches. When an approved patch is reported as missing, this value describes the severity of the compliance violation.\n"];
  approved_patches: patch_id_list option
    [@ocaml.doc
      "A list of explicitly approved patches for the baseline.\n\n For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}Package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  approval_rules: patch_rule_group option [@ocaml.doc ""];
  global_filters: patch_filter_group option [@ocaml.doc ""];
  operating_system: operating_system option
    [@ocaml.doc
      "The operating system rule used by the patch baseline override.\n"]}
[@@ocaml.doc
  "Defines the basic information about a patch baseline override.\n"]
type nonrec get_deployable_patch_snapshot_for_instance_request =
  {
  baseline_override: baseline_override option
    [@ocaml.doc
      "Defines the basic information about a patch baseline override.\n"];
  snapshot_id: snapshot_id
    [@ocaml.doc
      "The snapshot ID provided by the user when running [AWS-RunPatchBaseline].\n"];
  instance_id: instance_id
    [@ocaml.doc
      "The ID of the managed node for which the appropriate patch snapshot should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec get_default_patch_baseline_result =
  {
  operating_system: operating_system option
    [@ocaml.doc "The operating system for the returned patch baseline. \n"];
  baseline_id: baseline_id option
    [@ocaml.doc "The ID of the default patch baseline.\n"]}[@@ocaml.doc ""]
type nonrec get_default_patch_baseline_request =
  {
  operating_system: operating_system option
    [@ocaml.doc
      "Returns the default patch baseline for the specified operating system.\n"]}
[@@ocaml.doc ""]
type nonrec connection_status =
  | NOT_CONNECTED [@ocaml.doc ""]
  | CONNECTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_connection_status_response =
  {
  status: connection_status option
    [@ocaml.doc "The status of the connection to the managed node.\n"];
  target: session_target option
    [@ocaml.doc "The ID of the managed node to check connection status. \n"]}
[@@ocaml.doc ""]
type nonrec get_connection_status_request =
  {
  target: session_target [@ocaml.doc "The managed node ID.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec get_command_invocation_result =
  {
  cloud_watch_output_config: cloud_watch_output_config option
    [@ocaml.doc
      "Amazon CloudWatch Logs information where Systems Manager sent the command output.\n"];
  standard_error_url: url option
    [@ocaml.doc
      "The URL for the complete text written by the plugin to [stderr]. If the command hasn't finished running, then this string is empty.\n"];
  standard_error_content: standard_error_content option
    [@ocaml.doc
      "The first 8,000 characters written by the plugin to [stderr]. If the command hasn't finished running, then this string is empty.\n"];
  standard_output_url: url option
    [@ocaml.doc
      "The URL for the complete text written by the plugin to [stdout] in Amazon Simple Storage Service (Amazon S3). If an S3 bucket wasn't specified, then this string is empty.\n"];
  standard_output_content: standard_output_content option
    [@ocaml.doc
      "The first 24,000 characters written by the plugin to [stdout]. If the command hasn't finished running, if [ExecutionStatus] is neither Succeeded nor Failed, then this string is empty.\n"];
  status_details: status_details option
    [@ocaml.doc
      "A detailed status of the command execution for an invocation. [StatusDetails] includes more information than [Status] because it includes states resulting from error and concurrency control parameters. [StatusDetails] can show different results than [Status]. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. [StatusDetails] can be one of the following values:\n\n {ul\n       {-  Pending: The command hasn't been sent to the managed node.\n           \n            }\n       {-  In Progress: The command has been sent to the managed node but hasn't reached a terminal state.\n           \n            }\n       {-  Delayed: The system attempted to send the command to the target, but the target wasn't available. The managed node might not be available because of network issues, because the node was stopped, or for similar reasons. The system will try to send the command again.\n           \n            }\n       {-  Success: The command or plugin ran successfully. This is a terminal state.\n           \n            }\n       {-  Delivery Timed Out: The command wasn't delivered to the managed node before the delivery timeout expired. Delivery timeouts don't count against the parent command's [MaxErrors] limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.\n           \n            }\n       {-  Execution Timed Out: The command started to run on the managed node, but the execution wasn't complete before the timeout expired. Execution timeouts count against the [MaxErrors] limit of the parent command. This is a terminal state.\n           \n            }\n       {-  Failed: The command wasn't run successfully on the managed node. For a plugin, this indicates that the result code wasn't zero. For a command invocation, this indicates that the result code for one or more plugins wasn't zero. Invocation failures count against the [MaxErrors] limit of the parent command. This is a terminal state.\n           \n            }\n       {-  Cancelled: The command was terminated before it was completed. This is a terminal state.\n           \n            }\n       {-  Undeliverable: The command can't be delivered to the managed node. The node might not exist or might not be responding. Undeliverable invocations don't count against the parent command's [MaxErrors] limit and don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.\n           \n            }\n       {-  Terminated: The parent command exceeded its [MaxErrors] limit and subsequent command invocations were canceled by the system. This is a terminal state.\n           \n            }\n       }\n  "];
  status: command_invocation_status option
    [@ocaml.doc
      "The status of this invocation plugin. This status can be different than [StatusDetails].\n"];
  execution_end_date_time: string_date_time option
    [@ocaml.doc
      "The date and time the plugin finished running. Date and time are written in ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI command uses the [InvokedAfter] filter.\n\n  [aws ssm list-commands --filters key=InvokedAfter,value=2017-06-07T00:00:00Z] \n \n  If the plugin hasn't started to run, the string is empty.\n  "];
  execution_elapsed_time: string_date_time option
    [@ocaml.doc "Duration since [ExecutionStartDateTime].\n"];
  execution_start_date_time: string_date_time option
    [@ocaml.doc
      "The date and time the plugin started running. Date and time are written in ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI command uses the [InvokedBefore] filter.\n\n  [aws ssm list-commands --filters key=InvokedBefore,value=2017-06-07T00:00:00Z] \n \n  If the plugin hasn't started to run, the string is empty.\n  "];
  response_code: response_code option
    [@ocaml.doc
      "The error level response code for the plugin script. If the response code is [-1], then the command hasn't started running on the managed node, or it wasn't received by the node.\n"];
  plugin_name: command_plugin_name option
    [@ocaml.doc
      "The name of the plugin, or {i step name}, for which details are reported. For example, [aws:RunShellScript] is a plugin.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The Systems Manager document (SSM document) version used in the request.\n"];
  document_name: document_name option
    [@ocaml.doc
      "The name of the document that was run. For example, [AWS-RunShellScript].\n"];
  comment: comment option [@ocaml.doc "The comment text for the command.\n"];
  instance_id: instance_id option
    [@ocaml.doc
      "The ID of the managed node targeted by the command. A {i managed node} can be an Amazon Elastic Compute Cloud (Amazon EC2) instance, edge device, or on-premises server or VM in your hybrid environment that is configured for Amazon Web Services Systems Manager.\n"];
  command_id: command_id option
    [@ocaml.doc "The parent command ID of the invocation plugin.\n"]}
[@@ocaml.doc ""]
type nonrec get_command_invocation_request =
  {
  plugin_name: command_plugin_name option
    [@ocaml.doc
      "The name of the step for which you want detailed results. If the document contains only one step, you can omit the name and details for that step. If the document contains more than one step, you must specify the name of the step for which you want to view details. Be sure to specify the name of the step, not the name of a plugin like [aws:RunShellScript].\n\n To find the [PluginName], check the document content and find the name of the step you want details for. Alternatively, use [ListCommandInvocations] with the [CommandId] and [Details] parameters. The [PluginName] is the [Name] attribute of the [CommandPlugin] object in the [CommandPlugins] list.\n "];
  instance_id: instance_id
    [@ocaml.doc
      "(Required) The ID of the managed node targeted by the command. A {i managed node} can be an Amazon Elastic Compute Cloud (Amazon EC2) instance, edge device, and on-premises server or VM in your hybrid environment that is configured for Amazon Web Services Systems Manager.\n"];
  command_id: command_id
    [@ocaml.doc
      "(Required) The parent command ID of the invocation plugin.\n"]}
[@@ocaml.doc ""]
type nonrec calendar_state =
  | CLOSED [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_calendar_state_response =
  {
  next_transition_time: iso8601_string option
    [@ocaml.doc
      "The time, as an {{:https://en.wikipedia.org/wiki/ISO_8601}ISO 8601} string, that the calendar state will change. If the current calendar state is [OPEN], [NextTransitionTime] indicates when the calendar state changes to [CLOSED], and vice-versa.\n"];
  at_time: iso8601_string option
    [@ocaml.doc
      "The time, as an {{:https://en.wikipedia.org/wiki/ISO_8601}ISO 8601} string, that you specified in your command. If you don't specify a time, [GetCalendarState] uses the current time.\n"];
  state: calendar_state option
    [@ocaml.doc
      "The state of the calendar. An [OPEN] calendar indicates that actions are allowed to proceed, and a [CLOSED] calendar indicates that actions aren't allowed to proceed.\n"]}
[@@ocaml.doc ""]
type nonrec get_calendar_state_request =
  {
  at_time: iso8601_string option
    [@ocaml.doc
      "(Optional) The specific time for which you want to get calendar state information, in {{:https://en.wikipedia.org/wiki/ISO_8601}ISO 8601} format. If you don't specify a value or [AtTime], the current time is used.\n"];
  calendar_names: calendar_name_or_arn_list
    [@ocaml.doc
      "The names of Amazon Resource Names (ARNs) of the Systems Manager documents (SSM documents) that represent the calendar entries for which you want to get the state.\n"]}
[@@ocaml.doc ""]
type nonrec automation_subtype =
  | AccessRequest [@ocaml.doc ""]
  | ChangeRequest [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec automation_execution =
  {
  variables: automation_parameter_map option
    [@ocaml.doc "Variables defined for the automation.\n"];
  change_request_name: change_request_name option
    [@ocaml.doc "The name of the Change Manager change request.\n"];
  association_id: string_ option
    [@ocaml.doc
      "The ID of a State Manager association used in the Automation operation.\n"];
  ops_item_id: string_ option
    [@ocaml.doc
      "The ID of an OpsItem that is created to represent a Change Manager change request.\n"];
  runbooks: runbooks option
    [@ocaml.doc
      "Information about the Automation runbooks that are run as part of a runbook workflow.\n\n  The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.\n  \n   "];
  scheduled_time: date_time option
    [@ocaml.doc
      "The date and time the Automation operation is scheduled to start.\n"];
  automation_subtype: automation_subtype option
    [@ocaml.doc
      "The subtype of the Automation operation. Currently, the only supported value is [ChangeRequest].\n"];
  target_locations_ur_l: target_locations_ur_l option
    [@ocaml.doc
      "A publicly accessible URL for a file that contains the [TargetLocations] body. Currently, only files in presigned Amazon S3 buckets are supported\n"];
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc "The CloudWatch alarm that was invoked by the automation.\n"];
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm applied to your automation.\n"];
  progress_counters: progress_counters option
    [@ocaml.doc
      "An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager console for a multi-Region and multi-account Automation execution.\n"];
  target_locations: target_locations option
    [@ocaml.doc
      "The combination of Amazon Web Services Regions and/or Amazon Web Services accounts where you want to run the Automation.\n"];
  target: string_ option [@ocaml.doc "The target of the execution.\n"];
  max_errors: max_errors option
    [@ocaml.doc
      "The MaxErrors value specified by the user when the execution started.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The [MaxConcurrency] value specified by the user when the execution started.\n"];
  resolved_targets: resolved_targets option
    [@ocaml.doc
      "A list of resolved targets in the rate control execution.\n"];
  target_maps: target_maps option
    [@ocaml.doc
      "The specified key-value mapping of document parameters to target resources.\n"];
  targets: targets option [@ocaml.doc "The specified targets.\n"];
  target_parameter_name: automation_parameter_key option
    [@ocaml.doc "The parameter name.\n"];
  current_action: string_ option
    [@ocaml.doc "The action of the step that is currently running.\n"];
  current_step_name: string_ option
    [@ocaml.doc "The name of the step that is currently running.\n"];
  executed_by: string_ option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the user who ran the automation.\n"];
  parent_automation_execution_id: automation_execution_id option
    [@ocaml.doc "The AutomationExecutionId of the parent automation.\n"];
  mode: execution_mode option [@ocaml.doc "The automation execution mode.\n"];
  failure_message: string_ option
    [@ocaml.doc
      "A message describing why an execution has failed, if the status is set to Failed.\n"];
  outputs: automation_parameter_map option
    [@ocaml.doc
      "The list of execution outputs as defined in the Automation runbook.\n"];
  parameters: automation_parameter_map option
    [@ocaml.doc
      "The key-value map of execution parameters, which were supplied when calling [StartAutomationExecution].\n"];
  step_executions_truncated: boolean_ option
    [@ocaml.doc
      "A boolean value that indicates if the response contains the full list of the Automation step executions. If true, use the DescribeAutomationStepExecutions API operation to get the full list of step executions.\n"];
  step_executions: step_execution_list option
    [@ocaml.doc
      "A list of details about the current state of all steps that comprise an execution. An Automation runbook contains a list of steps that are run in order.\n"];
  automation_execution_status: automation_execution_status option
    [@ocaml.doc "The execution status of the Automation.\n"];
  execution_end_time: date_time option
    [@ocaml.doc "The time the execution finished.\n"];
  execution_start_time: date_time option
    [@ocaml.doc "The time the execution started.\n"];
  document_version: document_version option
    [@ocaml.doc "The version of the document to use during execution.\n"];
  document_name: document_name option
    [@ocaml.doc
      "The name of the Automation runbook used during the execution.\n"];
  automation_execution_id: automation_execution_id option
    [@ocaml.doc "The execution ID.\n"]}[@@ocaml.doc
                                         "Detailed information about the current state of an individual Automation execution.\n"]
type nonrec get_automation_execution_result =
  {
  automation_execution: automation_execution option
    [@ocaml.doc
      "Detailed information about the current state of an automation execution.\n"]}
[@@ocaml.doc ""]
type nonrec get_automation_execution_request =
  {
  automation_execution_id: automation_execution_id
    [@ocaml.doc
      "The unique identifier for an existing automation execution to examine. The execution ID is returned by StartAutomationExecution when the execution of an Automation runbook is initiated.\n"]}
[@@ocaml.doc ""]
type nonrec access_key_id_type = string[@@ocaml.doc ""]
type nonrec access_key_secret_type = string[@@ocaml.doc ""]
type nonrec credentials =
  {
  expiration_time: date_time
    [@ocaml.doc "The datetime on which the current credentials expire.\n"];
  session_token: session_token_type
    [@ocaml.doc
      "The token that users must pass to the service API to use the temporary credentials.\n"];
  secret_access_key: access_key_secret_type
    [@ocaml.doc "The secret access key that can be used to sign requests.\n"];
  access_key_id: access_key_id_type
    [@ocaml.doc
      "The access key ID that identifies the temporary security credentials.\n"]}
[@@ocaml.doc
  "The temporary security credentials, which include an access key ID, a secret access key, and a security (or session) token.\n"]
type nonrec access_request_status =
  | PENDING [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | REVOKED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_access_token_response =
  {
  access_request_status: access_request_status option
    [@ocaml.doc "The status of the access request.\n"];
  credentials: credentials option
    [@ocaml.doc
      "The temporary security credentials which can be used to start just-in-time node access sessions.\n"]}
[@@ocaml.doc ""]
type nonrec get_access_token_request =
  {
  access_request_id: access_request_id
    [@ocaml.doc "The ID of a just-in-time node access request.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec fault =
  | Unknown [@ocaml.doc ""]
  | Server [@ocaml.doc ""]
  | Client [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec create_association_batch_request_entry =
  {
  alarm_configuration: alarm_configuration option [@ocaml.doc ""];
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  duration: duration option
    [@ocaml.doc
      "The number of hours the association can run before it is canceled. Duration applies to associations that are currently running, and any pending and in progress commands on all targets. If a target was taken offline for the association to run, it is made available again immediately, without a reboot. \n\n The [Duration] parameter applies only when both these conditions are true:\n \n  {ul\n        {-  The association for which you specify a duration is cancelable according to the parameters of the SSM command document or Automation runbook associated with this execution. \n            \n             }\n        {-  The command specifies the \n            {[\n             {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_CreateAssociationBatchRequestEntry.html#systemsmanager-Type-CreateAssociationBatchRequestEntry-ApplyOnlyAtCronInterval}ApplyOnlyAtCronInterval} \n            ]}\n             parameter, which means that the association doesn't run immediately after it is created, but only according to the specified schedule.\n            \n             }\n        }\n  "];
  schedule_offset: schedule_offset option
    [@ocaml.doc
      "Number of days to wait after the scheduled day to run an association.\n"];
  target_locations: target_locations option
    [@ocaml.doc
      "Use this action to create an association in multiple Regions and multiple accounts.\n"];
  calendar_names: calendar_name_or_arn_list option
    [@ocaml.doc
      "The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations are gated under. The associations only run when that Change Calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  apply_only_at_cron_interval: apply_only_at_cron_interval option
    [@ocaml.doc
      "By default, when you create a new association, the system runs it immediately after it is created and then according to the schedule you specified and when target changes are detected. Specify [true] for [ApplyOnlyAtCronInterval] if you want the association to run only according to the schedule you specified.\n\n For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#state-manager-about-scheduling}Understanding when associations are applied to resources} and {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#runbook-target-updates}>About target updates with Automation runbooks} in the {i Amazon Web Services Systems Manager User Guide}.\n \n  This parameter isn't supported for rate expressions.\n  "];
  sync_compliance: association_sync_compliance option
    [@ocaml.doc
      "The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT]. \n\n In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a tool in Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.\n \n  By default, all associations use [AUTO] mode.\n  "];
  compliance_severity: association_compliance_severity option
    [@ocaml.doc "The severity level to assign to the association.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.\n\n If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].\n "];
  max_errors: max_errors option
    [@ocaml.doc
      "The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.\n\n Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.\n "];
  association_name: association_name option
    [@ocaml.doc "Specify a descriptive name for the association.\n"];
  output_location: instance_association_output_location option
    [@ocaml.doc
      "An S3 bucket where you want to store the results of this request.\n"];
  schedule_expression: schedule_expression option
    [@ocaml.doc
      "A cron expression that specifies a schedule when the association runs.\n"];
  targets: targets option
    [@ocaml.doc "The managed nodes targeted by the request.\n"];
  document_version: document_version option
    [@ocaml.doc "The document version.\n"];
  automation_target_parameter_name: automation_target_parameter_name option
    [@ocaml.doc
      "Specify the target for the association. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a tool in Amazon Web Services Systems Manager.\n"];
  parameters: parameters option
    [@ocaml.doc "A description of the parameters for a document. \n"];
  instance_id: instance_id option
    [@ocaml.doc
      "The managed node ID.\n\n   [InstanceId] has been deprecated. To specify a managed node ID for an association, use the [Targets] parameter. Requests that include the parameter [InstanceID] with Systems Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if you use the parameter [InstanceId], you can't use the parameters [AssociationName], [DocumentVersion], [MaxErrors], [MaxConcurrency], [OutputLocation], or [ScheduleExpression]. To use these parameters, you must use the [Targets] parameter.\n  \n   "];
  name: document_ar_n
    [@ocaml.doc
      "The name of the SSM document that contains the configuration information for the managed node. You can specify Command or Automation runbooks.\n\n You can specify Amazon Web Services-predefined documents, documents you created, or a document that is shared with you from another account.\n \n  For SSM documents that are shared with you from other Amazon Web Services accounts, you must specify the complete SSM document ARN, in the following format:\n  \n    \n   {[\n   arn:aws:ssm:{i region}:{i account-id}:document/{i document-name} \n   ]}\n    \n   \n    For example:\n    \n      [arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document] \n     \n      For Amazon Web Services-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, [AWS-ApplyPatchBaseline] or [My-Document].\n      "]}
[@@ocaml.doc
  "Describes the association of a Amazon Web Services Systems Manager document (SSM document) and a managed node.\n"]
type nonrec batch_error_message = string[@@ocaml.doc ""]
type nonrec failed_create_association =
  {
  fault: fault option [@ocaml.doc "The source of the failure.\n"];
  message: batch_error_message option
    [@ocaml.doc "A description of the failure.\n"];
  entry: create_association_batch_request_entry option
    [@ocaml.doc "The association.\n"]}[@@ocaml.doc
                                        "Describes a failed association.\n"]
type nonrec failed_create_association_list = failed_create_association list
[@@ocaml.doc ""]
type nonrec expiration_date = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec effective_patch =
  {
  patch_status: patch_status option
    [@ocaml.doc
      "The status of the patch in a patch baseline. This includes information about whether the patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and the date the patch was or will be approved.\n"];
  patch: patch option
    [@ocaml.doc
      "Provides metadata for a patch, including information such as the KB ID, severity, classification and a URL for where more information can be obtained about the patch.\n"]}
[@@ocaml.doc
  "The [EffectivePatch] structure defines metadata about a patch along with the approval state of the patch in a particular patch baseline. The approval state includes information about whether the patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and the date the patch was or will be approved.\n"]
type nonrec effective_patch_list = effective_patch list[@@ocaml.doc ""]
type nonrec effective_instance_association_max_results = int[@@ocaml.doc ""]
type nonrec dry_run = bool[@@ocaml.doc ""]
type nonrec document_permission_max_results = int[@@ocaml.doc ""]
type nonrec document_already_exists =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified document already exists.\n"]
type nonrec disassociate_ops_item_related_item_response = unit[@@ocaml.doc
                                                                ""]
type nonrec disassociate_ops_item_related_item_request =
  {
  association_id: ops_item_related_item_association_id
    [@ocaml.doc
      "The ID of the association for which you want to delete an association between the OpsItem and a related item.\n"];
  ops_item_id: ops_item_id
    [@ocaml.doc
      "The ID of the OpsItem for which you want to delete an association between the OpsItem and a related item.\n"]}
[@@ocaml.doc ""]
type nonrec describe_sessions_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  sessions: session_list option
    [@ocaml.doc "A list of sessions meeting the request parameters.\n"]}
[@@ocaml.doc ""]
type nonrec describe_sessions_request =
  {
  filters: session_filter_list option
    [@ocaml.doc
      "One or more filters to limit the type of sessions returned by the request.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: session_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  state: session_state
    [@ocaml.doc
      "The session status to retrieve a list of sessions for. For example, \"Active\".\n"]}
[@@ocaml.doc ""]
type nonrec describe_patch_properties_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You use this token in the next call.)\n"];
  properties: patch_properties_list option
    [@ocaml.doc
      "A list of the properties for patches matching the filter request parameters.\n"]}
[@@ocaml.doc ""]
type nonrec describe_patch_properties_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  patch_set: patch_set option
    [@ocaml.doc
      "Indicates whether to list patches for the Windows operating system or for applications released by Microsoft. Not applicable for the Linux or macOS operating systems.\n"];
  property: patch_property
    [@ocaml.doc
      "The patch property for which you want to view patch details. \n"];
  operating_system: operating_system
    [@ocaml.doc "The operating system type for which to list patches.\n"]}
[@@ocaml.doc ""]
type nonrec describe_patch_groups_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  mappings: patch_group_patch_baseline_mapping_list option
    [@ocaml.doc
      "Each entry in the array contains:\n\n {ul\n       {-   [PatchGroup]: string (between 1 and 256 characters. Regex: [^(\\[\\p{L}\\p{Z}\\p{N}_.:/=+\\-@\\]*)$)] \n           \n            }\n       {-   [PatchBaselineIdentity]: A [PatchBaselineIdentity] element.\n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec describe_patch_groups_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  filters: patch_orchestrator_filter_list option
    [@ocaml.doc
      "Each element in the array is a structure containing a key-value pair.\n\n Supported keys for [DescribePatchGroups] include the following:\n \n  {ul\n        {-   {b  [NAME_PREFIX] } \n            \n             Sample values: [AWS-] | [My-].\n             \n              }\n        {-   {b  [OPERATING_SYSTEM] } \n            \n             Sample values: [AMAZON_LINUX] | [SUSE] | [WINDOWS] \n             \n              }\n        }\n  "];
  max_results: patch_baseline_max_results option
    [@ocaml.doc "The maximum number of patch groups to return (per page).\n"]}
[@@ocaml.doc ""]
type nonrec describe_patch_group_state_result =
  {
  instances_with_available_security_updates: integer option
    [@ocaml.doc
      "The number of managed nodes for which security-related patches are available but not approved because because they didn't meet the patch baseline requirements. For example, an updated version of a patch might have been released before the specified auto-approval period was over.\n\n Applies to Windows Server managed nodes only.\n "];
  instances_with_other_non_compliant_patches: instances_count option
    [@ocaml.doc
      "The number of managed nodes with patches installed that are specified as other than [Critical] or [Security] but aren't compliant with the patch baseline. The status of these managed nodes is [NON_COMPLIANT].\n"];
  instances_with_security_non_compliant_patches: instances_count option
    [@ocaml.doc
      "The number of managed nodes where patches that are specified as [Security] in a patch advisory aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].\n"];
  instances_with_critical_non_compliant_patches: instances_count option
    [@ocaml.doc
      "The number of managed nodes where patches that are specified as [Critical] for compliance reporting in the patch baseline aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].\n"];
  instances_with_unreported_not_applicable_patches: integer option
    [@ocaml.doc
      "The number of managed nodes with [NotApplicable] patches beyond the supported limit, which aren't reported by name to Inventory. Inventory is a tool in Amazon Web Services Systems Manager.\n"];
  instances_with_not_applicable_patches: integer option
    [@ocaml.doc
      "The number of managed nodes with patches that aren't applicable.\n"];
  instances_with_failed_patches: integer option
    [@ocaml.doc
      "The number of managed nodes with patches from the patch baseline that failed to install.\n"];
  instances_with_missing_patches: integer option
    [@ocaml.doc
      "The number of managed nodes with missing patches from the patch baseline.\n"];
  instances_with_installed_rejected_patches: instances_count option
    [@ocaml.doc
      "The number of managed nodes with patches installed that are specified in a [RejectedPatches] list. Patches with a status of [INSTALLED_REJECTED] were typically installed before they were added to a [RejectedPatches] list.\n\n  If [ALLOW_AS_DEPENDENCY] is the specified option for [RejectedPatchesAction], the value of [InstancesWithInstalledRejectedPatches] will always be [0] (zero).\n  \n   "];
  instances_with_installed_pending_reboot_patches: instances_count option
    [@ocaml.doc
      "The number of managed nodes with patches installed by Patch Manager that haven't been rebooted after the patch installation. The status of these managed nodes is [NON_COMPLIANT].\n"];
  instances_with_installed_other_patches: integer option
    [@ocaml.doc
      "The number of managed nodes with patches installed that aren't defined in the patch baseline.\n"];
  instances_with_installed_patches: integer option
    [@ocaml.doc "The number of managed nodes with installed patches.\n"];
  instances: integer option
    [@ocaml.doc "The number of managed nodes in the patch group.\n"]}
[@@ocaml.doc ""]
type nonrec describe_patch_group_state_request =
  {
  patch_group: patch_group
    [@ocaml.doc
      "The name of the patch group whose patch snapshot should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_patch_baselines_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  baseline_identities: patch_baseline_identity_list option
    [@ocaml.doc "An array of [PatchBaselineIdentity] elements.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_patch_baselines_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: patch_baseline_max_results option
    [@ocaml.doc
      "The maximum number of patch baselines to return (per page).\n"];
  filters: patch_orchestrator_filter_list option
    [@ocaml.doc
      "Each element in the array is a structure containing a key-value pair.\n\n Supported keys for [DescribePatchBaselines] include the following:\n \n  {ul\n        {-   {b  [NAME_PREFIX] } \n            \n             Sample values: [AWS-] | [My-] \n             \n              }\n        {-   {b  [OWNER] } \n            \n             Sample values: [AWS] | [Self] \n             \n              }\n        {-   {b  [OPERATING_SYSTEM] } \n            \n             Sample values: [AMAZON_LINUX] | [SUSE] | [WINDOWS] \n             \n              }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec describe_parameters_result =
  {
  next_token: next_token option
    [@ocaml.doc "The token to use when requesting the next set of items.\n"];
  parameters: parameter_metadata_list option
    [@ocaml.doc "Parameters returned by the request.\n"]}[@@ocaml.doc ""]
type nonrec describe_parameters_request =
  {
  shared: boolean_ option
    [@ocaml.doc
      "Lists parameters that are shared with you.\n\n  By default when using this option, the command returns parameters that have been shared using a standard Resource Access Manager Resource Share. In order for a parameter that was shared using the [PutResourcePolicy] command to be returned, the associated [RAM Resource Share Created From Policy] must have been promoted to a standard Resource Share using the RAM {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html}PromoteResourceShareCreatedFromPolicy} API operation.\n  \n   For more information about sharing parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.\n   \n    "];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  parameter_filters: parameter_string_filter_list option
    [@ocaml.doc "Filters to limit the request results.\n"];
  filters: parameters_filter_list option
    [@ocaml.doc
      "This data type is deprecated. Instead, use [ParameterFilters].\n"]}
[@@ocaml.doc ""]
type nonrec describe_ops_items_response =
  {
  ops_item_summaries: ops_item_summaries option
    [@ocaml.doc "A list of OpsItems.\n"];
  next_token: string_ option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"]}
[@@ocaml.doc ""]
type nonrec describe_ops_items_request =
  {
  next_token: string_ option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results.\n"];
  max_results: ops_item_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  ops_item_filters: ops_item_filters option
    [@ocaml.doc
      "One or more filters to limit the response.\n\n {ul\n       {-  Key: CreatedTime\n           \n            Operations: GreaterThan, LessThan\n            \n             }\n       {-  Key: LastModifiedBy\n           \n            Operations: Contains, Equals\n            \n             }\n       {-  Key: LastModifiedTime\n           \n            Operations: GreaterThan, LessThan\n            \n             }\n       {-  Key: Priority\n           \n            Operations: Equals\n            \n             }\n       {-  Key: Source\n           \n            Operations: Contains, Equals\n            \n             }\n       {-  Key: Status\n           \n            Operations: Equals\n            \n             }\n       {-  Key: Title*\n           \n            Operations: Equals,Contains\n            \n             }\n       {-  Key: OperationalData**\n           \n            Operations: Equals\n            \n             }\n       {-  Key: OperationalDataKey\n           \n            Operations: Equals\n            \n             }\n       {-  Key: OperationalDataValue\n           \n            Operations: Equals, Contains\n            \n             }\n       {-  Key: OpsItemId\n           \n            Operations: Equals\n            \n             }\n       {-  Key: ResourceId\n           \n            Operations: Contains\n            \n             }\n       {-  Key: AutomationId\n           \n            Operations: Equals\n            \n             }\n       {-  Key: AccountId\n           \n            Operations: Equals\n            \n             }\n       }\n   *The Equals operator for Title matches the first 100 characters. If you specify more than 100 characters, they system returns an error that the filter value exceeds the length limit.\n   \n    **If you filter the response by using the OperationalData operator, specify a key-value pair by using the following JSON format: \\{\"key\":\"key_name\",\"value\":\"a_value\"\\}\n    "]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_windows_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  window_identities: maintenance_window_identity_list option
    [@ocaml.doc "Information about the maintenance windows.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_maintenance_windows_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: maintenance_window_filter_list option
    [@ocaml.doc
      "Optional filters used to narrow down the scope of the returned maintenance windows. Supported filter keys are [Name] and [Enabled]. For example, [Name=MyMaintenanceWindow] and [Enabled=True].\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_windows_for_target_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You use this token in the next call.)\n"];
  window_identities: maintenance_windows_for_target_list option
    [@ocaml.doc
      "Information about the maintenance window targets and tasks a managed node is associated with.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_windows_for_target_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_search_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  resource_type: maintenance_window_resource_type
    [@ocaml.doc
      "The type of resource you want to retrieve information about. For example, [INSTANCE].\n"];
  targets: targets
    [@ocaml.doc
      "The managed node ID or key-value pair to retrieve information about.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_tasks_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  tasks: maintenance_window_task_list option
    [@ocaml.doc "Information about the tasks in the maintenance window.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_tasks_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: maintenance_window_filter_list option
    [@ocaml.doc
      "Optional filters used to narrow down the scope of the returned tasks. The supported filter keys are [WindowTaskId], [TaskArn], [Priority], and [TaskType].\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window whose tasks should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_targets_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  targets: maintenance_window_target_list option
    [@ocaml.doc "Information about the targets in the maintenance window.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_targets_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: maintenance_window_filter_list option
    [@ocaml.doc
      "Optional filters that can be used to narrow down the scope of the returned window targets. The supported filter keys are [Type], [WindowTargetId], and [OwnerInformation].\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window whose targets should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_schedule_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You use this token in the next call.)\n"];
  scheduled_window_executions: scheduled_window_execution_list option
    [@ocaml.doc
      "Information about maintenance window executions scheduled for the specified time range.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_schedule_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_search_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: patch_orchestrator_filter_list option
    [@ocaml.doc
      "Filters used to limit the range of results. For example, you can limit maintenance window executions to only those scheduled before or after a certain date and time.\n"];
  resource_type: maintenance_window_resource_type option
    [@ocaml.doc
      "The type of resource you want to retrieve information about. For example, [INSTANCE].\n"];
  targets: targets option
    [@ocaml.doc
      "The managed node ID or key-value pair to retrieve information about.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc
      "The ID of the maintenance window to retrieve information about.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_executions_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  window_executions: maintenance_window_execution_list option
    [@ocaml.doc "Information about the maintenance window executions.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_executions_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: maintenance_window_filter_list option
    [@ocaml.doc
      "Each entry in the array is a structure containing:\n\n {ul\n       {-  Key. A string between 1 and 128 characters. Supported keys include [ExecutedBefore] and [ExecutedAfter].\n           \n            }\n       {-  Values. An array of strings, each between 1 and 256 characters. Supported values are date/time strings in a valid ISO 8601 date/time format, such as [2024-11-04T05:00:00Z].\n           \n            }\n       }\n  "];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window whose executions should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_tasks_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  window_execution_task_identities:
    maintenance_window_execution_task_identity_list option
    [@ocaml.doc "Information about the task executions.\n"]}[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_tasks_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: maintenance_window_filter_list option
    [@ocaml.doc
      "Optional filters used to scope down the returned tasks. The supported filter key is [STATUS] with the corresponding values [PENDING], [IN_PROGRESS], [SUCCESS], [FAILED], [TIMED_OUT], [CANCELLING], and [CANCELLED].\n"];
  window_execution_id: maintenance_window_execution_id
    [@ocaml.doc
      "The ID of the maintenance window execution whose task executions should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_task_invocations_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  window_execution_task_invocation_identities:
    maintenance_window_execution_task_invocation_identity_list option
    [@ocaml.doc
      "Information about the task invocation results per invocation.\n"]}
[@@ocaml.doc ""]
type nonrec describe_maintenance_window_execution_task_invocations_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: maintenance_window_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: maintenance_window_filter_list option
    [@ocaml.doc
      "Optional filters used to scope down the returned task invocations. The supported filter key is [STATUS] with the corresponding values [PENDING], [IN_PROGRESS], [SUCCESS], [FAILED], [TIMED_OUT], [CANCELLING], and [CANCELLED].\n"];
  task_id: maintenance_window_execution_task_id
    [@ocaml.doc
      "The ID of the specific task in the maintenance window task that should be retrieved.\n"];
  window_execution_id: maintenance_window_execution_id
    [@ocaml.doc
      "The ID of the maintenance window execution the task is part of.\n"]}
[@@ocaml.doc ""]
type nonrec describe_inventory_deletions_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  inventory_deletions: inventory_deletions_list option
    [@ocaml.doc "A list of status items for deleted inventory.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_inventory_deletions_request =
  {
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  deletion_id: uui_d option
    [@ocaml.doc
      "Specify the delete inventory ID for which you want information. This ID was returned by the [DeleteInventory] operation.\n"]}
[@@ocaml.doc ""]
type nonrec describe_instance_properties_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of properties to return. Use this token to get the next set of results.\n"];
  instance_properties: instance_properties option
    [@ocaml.doc "Properties for the managed instances.\n"]}[@@ocaml.doc ""]
type nonrec describe_instance_properties_max_results = int[@@ocaml.doc ""]
type nonrec describe_instance_properties_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token provided by a previous request to use to return the next set of properties.\n"];
  max_results: describe_instance_properties_max_results option
    [@ocaml.doc
      "The maximum number of items to return for the call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters_with_operator: instance_property_string_filter_list option
    [@ocaml.doc "The request filters to use with the operator.\n"];
  instance_property_filter_list: instance_property_filter_list option
    [@ocaml.doc "An array of instance property filters.\n"]}[@@ocaml.doc ""]
type nonrec describe_instance_patches_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  patches: patch_compliance_data_list option
    [@ocaml.doc
      "Each entry in the array is a structure containing:\n\n {ul\n       {-  Title (string)\n           \n            }\n       {-  KBId (string)\n           \n            }\n       {-  Classification (string)\n           \n            }\n       {-  Severity (string)\n           \n            }\n       {-  State (string, such as \"INSTALLED\" or \"FAILED\")\n           \n            }\n       {-  InstalledTime (DateTime)\n           \n            }\n       {-  InstalledBy (string)\n           \n            }\n       }\n  "]}
[@@ocaml.doc ""]
type nonrec describe_instance_patches_request =
  {
  max_results: patch_compliance_max_results option
    [@ocaml.doc "The maximum number of patches to return (per page).\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  filters: patch_orchestrator_filter_list option
    [@ocaml.doc
      "Each element in the array is a structure containing a key-value pair.\n\n Supported keys for [DescribeInstancePatches]include the following:\n \n  {ul\n        {-   {b  [Classification] } \n            \n             Sample values: [Security] | [SecurityUpdates] \n             \n              }\n        {-   {b  [KBId] } \n            \n             Sample values: [KB4480056] | [java-1.7.0-openjdk.x86_64] \n             \n              }\n        {-   {b  [Severity] } \n            \n             Sample values: [Important] | [Medium] | [Low] \n             \n              }\n        {-   {b  [State] } \n            \n             Sample values: [Installed] | [InstalledOther] | [InstalledPendingReboot] \n             \n              For lists of all [State] values, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-compliance-states.html}Patch compliance state values} in the {i Amazon Web Services Systems Manager User Guide}.\n              \n               }\n        }\n  "];
  instance_id: instance_id
    [@ocaml.doc
      "The ID of the managed node whose patch state information should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  instance_patch_states: instance_patch_state_list option
    [@ocaml.doc
      "The high-level patch state for the requested managed nodes.\n"]}
[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_request =
  {
  max_results: patch_compliance_max_results option
    [@ocaml.doc
      "The maximum number of managed nodes to return (per page).\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  instance_ids: instance_id_list
    [@ocaml.doc
      "The ID of the managed node for which patch state information should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_for_patch_group_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  instance_patch_states: instance_patch_states_list option
    [@ocaml.doc
      "The high-level patch state for the requested managed nodes. \n"]}
[@@ocaml.doc ""]
type nonrec describe_instance_patch_states_for_patch_group_request =
  {
  max_results: patch_compliance_max_results option
    [@ocaml.doc "The maximum number of patches to return (per page).\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  filters: instance_patch_state_filter_list option
    [@ocaml.doc
      "Each entry in the array is a structure containing:\n\n {ul\n       {-  Key (string between 1 and 200 characters)\n           \n            }\n       {-  Values (array containing a single string)\n           \n            }\n       {-  Type (string \"Equal\", \"NotEqual\", \"LessThan\", \"GreaterThan\")\n           \n            }\n       }\n  "];
  patch_group: patch_group
    [@ocaml.doc
      "The name of the patch group for which the patch state information should be retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_instance_information_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty. \n"];
  instance_information_list: instance_information_list option
    [@ocaml.doc "The managed node information list.\n"]}[@@ocaml.doc ""]
type nonrec describe_instance_information_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results_ec2_compatible option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results. The default value is 10 items. \n"];
  filters: instance_information_string_filter_list option
    [@ocaml.doc
      "One or more filters. Use a filter to return a more specific list of managed nodes. You can filter based on tags applied to your managed nodes. Tag filters can't be combined with other filter types. Use this [Filters] data type instead of [InstanceInformationFilterList], which is deprecated.\n"];
  instance_information_filter_list: instance_information_filter_list option
    [@ocaml.doc
      "This is a legacy method. We recommend that you don't use this method. Instead, use the [Filters] data type. [Filters] enables you to return node information by filtering based on tags applied to managed nodes.\n\n  Attempting to use [InstanceInformationFilterList] and [Filters] leads to an exception error. \n  \n   "]}
[@@ocaml.doc ""]
type nonrec describe_instance_associations_status_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  instance_association_status_infos: instance_association_status_infos option
    [@ocaml.doc "Status information about the association.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_instance_associations_status_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  instance_id: instance_id
    [@ocaml.doc
      "The managed node IDs for which you want association status information.\n"]}
[@@ocaml.doc ""]
type nonrec describe_effective_patches_for_patch_baseline_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  effective_patches: effective_patch_list option
    [@ocaml.doc "An array of patches and patch status.\n"]}[@@ocaml.doc ""]
type nonrec describe_effective_patches_for_patch_baseline_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: patch_baseline_max_results option
    [@ocaml.doc "The maximum number of patches to return (per page).\n"];
  baseline_id: baseline_id
    [@ocaml.doc
      "The ID of the patch baseline to retrieve the effective patches for.\n"]}
[@@ocaml.doc ""]
type nonrec describe_effective_instance_associations_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  associations: instance_association_list option
    [@ocaml.doc "The associations for the requested managed node.\n"]}
[@@ocaml.doc ""]
type nonrec describe_effective_instance_associations_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: effective_instance_association_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  instance_id: instance_id
    [@ocaml.doc
      "The managed node ID for which you want to view all associations.\n"]}
[@@ocaml.doc ""]
type nonrec describe_document_result =
  {
  document: document_description option
    [@ocaml.doc "Information about the SSM document.\n"]}[@@ocaml.doc ""]
type nonrec describe_document_request =
  {
  version_name: document_version_name option
    [@ocaml.doc
      "An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The document version for which you want information. Can be a specific version or the default version.\n"];
  name: document_ar_n
    [@ocaml.doc
      "The name of the SSM document.\n\n  If you're calling a shared SSM document from a different Amazon Web Services account, [Name] is the full Amazon Resource Name (ARN) of the document.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec account_sharing_info =
  {
  shared_document_version: shared_document_version option
    [@ocaml.doc
      "The version of the current document shared with the account.\n"];
  account_id: account_id option
    [@ocaml.doc
      "The Amazon Web Services account ID where the current document is shared.\n"]}
[@@ocaml.doc
  "Information includes the Amazon Web Services account ID where the current document is shared and the version shared with that account.\n"]
type nonrec account_sharing_info_list = account_sharing_info list[@@ocaml.doc
                                                                   ""]
type nonrec describe_document_permission_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  account_sharing_info_list: account_sharing_info_list option
    [@ocaml.doc
      "A list of Amazon Web Services accounts where the current document is shared and the version shared with each account.\n"];
  account_ids: account_id_list option
    [@ocaml.doc
      "The account IDs that have permission to use this document. The ID can be either an Amazon Web Services account number or [all].\n"]}
[@@ocaml.doc ""]
type nonrec describe_document_permission_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: document_permission_max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  permission_type: document_permission_type
    [@ocaml.doc
      "The permission type for the document. The permission type can be {i Share}.\n"];
  name: document_name
    [@ocaml.doc "The name of the document for which you are the owner. \n"]}
[@@ocaml.doc ""]
type nonrec describe_available_patches_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  patches: patch_list option
    [@ocaml.doc
      "An array of patches. Each entry in the array is a patch structure.\n"]}
[@@ocaml.doc ""]
type nonrec describe_available_patches_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: patch_baseline_max_results option
    [@ocaml.doc "The maximum number of patches to return (per page).\n"];
  filters: patch_orchestrator_filter_list option
    [@ocaml.doc
      "Each element in the array is a structure containing a key-value pair.\n\n  {b Windows Server} \n \n  Supported keys for Windows Server managed node patches include the following:\n  \n   {ul\n         {-   {b  [PATCH_SET] } \n             \n              Sample values: [OS] | [APPLICATION] \n              \n               }\n         {-   {b  [PRODUCT] } \n             \n              Sample values: [WindowsServer2012] | [Office 2010] | [MicrosoftDefenderAntivirus] \n              \n               }\n         {-   {b  [PRODUCT_FAMILY] } \n             \n              Sample values: [Windows] | [Office] \n              \n               }\n         {-   {b  [MSRC_SEVERITY] } \n             \n              Sample values: [ServicePacks] | [Important] | [Moderate] \n              \n               }\n         {-   {b  [CLASSIFICATION] } \n             \n              Sample values: [ServicePacks] | [SecurityUpdates] | [DefinitionUpdates] \n              \n               }\n         {-   {b  [PATCH_ID] } \n             \n              Sample values: [KB123456] | [KB4516046] \n              \n               }\n         }\n    {b Linux} \n   \n     When specifying filters for Linux patches, you must specify a key-pair for [PRODUCT]. For example, using the Command Line Interface (CLI), the following command fails:\n     \n       [aws ssm describe-available-patches --filters Key=CVE_ID,Values=CVE-2018-3615] \n      \n       However, the following command succeeds:\n       \n         [aws ssm describe-available-patches --filters Key=PRODUCT,Values=AmazonLinux2018.03\n     Key=CVE_ID,Values=CVE-2018-3615] \n        \n          Supported keys for Linux managed node patches include the following:\n          \n           {ul\n                 {-   {b  [PRODUCT] } \n                     \n                      Sample values: [AmazonLinux2018.03] | [AmazonLinux2.0] \n                      \n                       }\n                 {-   {b  [NAME] } \n                     \n                      Sample values: [kernel-headers] | [samba-python] | [php] \n                      \n                       }\n                 {-   {b  [SEVERITY] } \n                     \n                      Sample values: [Critical] | [Important] | [Medium] | [Low] \n                      \n                       }\n                 {-   {b  [EPOCH] } \n                     \n                      Sample values: [0] | [1] \n                      \n                       }\n                 {-   {b  [VERSION] } \n                     \n                      Sample values: [78.6.1] | [4.10.16] \n                      \n                       }\n                 {-   {b  [RELEASE] } \n                     \n                      Sample values: [9.56.amzn1] | [1.amzn2] \n                      \n                       }\n                 {-   {b  [ARCH] } \n                     \n                      Sample values: [i686] | [x86_64] \n                      \n                       }\n                 {-   {b  [REPOSITORY] } \n                     \n                      Sample values: [Core] | [Updates] \n                      \n                       }\n                 {-   {b  [ADVISORY_ID] } \n                     \n                      Sample values: [ALAS-2018-1058] | [ALAS2-2021-1594] \n                      \n                       }\n                 {-   {b  [CVE_ID] } \n                     \n                      Sample values: [CVE-2018-3615] | [CVE-2020-1472] \n                      \n                       }\n                 {-   {b  [BUGZILLA_ID] } \n                     \n                      Sample values: [1463241] \n                      \n                       }\n                 }\n  "]}
[@@ocaml.doc ""]
type nonrec describe_automation_step_executions_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  step_executions: step_execution_list option
    [@ocaml.doc
      "A list of details about the current state of all steps that make up an execution.\n"]}
[@@ocaml.doc ""]
type nonrec describe_automation_step_executions_request =
  {
  reverse_order: boolean_ option
    [@ocaml.doc
      "Indicates whether to list step executions in reverse order by start time. The default value is 'false'.\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  filters: step_execution_filter_list option
    [@ocaml.doc
      "One or more filters to limit the number of step executions returned by the request.\n"];
  automation_execution_id: automation_execution_id
    [@ocaml.doc
      "The Automation execution ID for which you want step execution descriptions.\n"]}
[@@ocaml.doc ""]
type nonrec automation_type =
  | Local [@ocaml.doc ""]
  | CrossAccount [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec automation_execution_metadata =
  {
  change_request_name: change_request_name option
    [@ocaml.doc "The name of the Change Manager change request.\n"];
  association_id: string_ option
    [@ocaml.doc
      "The ID of a State Manager association used in the Automation operation.\n"];
  ops_item_id: string_ option
    [@ocaml.doc
      "The ID of an OpsItem that is created to represent a Change Manager change request.\n"];
  runbooks: runbooks option
    [@ocaml.doc
      "Information about the Automation runbooks that are run during a runbook workflow in Change Manager.\n\n  The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.\n  \n   "];
  scheduled_time: date_time option
    [@ocaml.doc
      "The date and time the Automation operation is scheduled to start.\n"];
  automation_subtype: automation_subtype option
    [@ocaml.doc
      "The subtype of the Automation operation. Currently, the only supported value is [ChangeRequest].\n"];
  target_locations_ur_l: target_locations_ur_l option
    [@ocaml.doc
      "A publicly accessible URL for a file that contains the [TargetLocations] body. Currently, only files in presigned Amazon S3 buckets are supported\n"];
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc "The CloudWatch alarm that was invoked by the automation.\n"];
  alarm_configuration: alarm_configuration option
    [@ocaml.doc
      "The details for the CloudWatch alarm applied to your automation.\n"];
  automation_type: automation_type option
    [@ocaml.doc
      "Use this filter with [DescribeAutomationExecutions]. Specify either Local or CrossAccount. CrossAccount is an Automation that runs in multiple Amazon Web Services Regions and Amazon Web Services accounts. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html}Running automations in multiple Amazon Web Services Regions and accounts} in the {i Amazon Web Services Systems Manager User Guide}. \n"];
  target: string_ option
    [@ocaml.doc
      "The list of execution outputs as defined in the Automation runbook.\n"];
  max_errors: max_errors option
    [@ocaml.doc
      "The [MaxErrors] value specified by the user when starting the automation.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The [MaxConcurrency] value specified by the user when starting the automation.\n"];
  resolved_targets: resolved_targets option
    [@ocaml.doc "A list of targets that resolved during the execution.\n"];
  target_maps: target_maps option
    [@ocaml.doc
      "The specified key-value mapping of document parameters to target resources.\n"];
  targets: targets option
    [@ocaml.doc
      "The targets defined by the user when starting the automation.\n"];
  target_parameter_name: automation_parameter_key option
    [@ocaml.doc
      "The list of execution outputs as defined in the Automation runbook.\n"];
  failure_message: string_ option
    [@ocaml.doc
      "The list of execution outputs as defined in the Automation runbook.\n"];
  current_action: string_ option
    [@ocaml.doc "The action of the step that is currently running.\n"];
  current_step_name: string_ option
    [@ocaml.doc "The name of the step that is currently running.\n"];
  parent_automation_execution_id: automation_execution_id option
    [@ocaml.doc "The execution ID of the parent automation.\n"];
  mode: execution_mode option [@ocaml.doc "The Automation execution mode.\n"];
  outputs: automation_parameter_map option
    [@ocaml.doc
      "The list of execution outputs as defined in the Automation runbook.\n"];
  log_file: string_ option
    [@ocaml.doc "An S3 bucket where execution information is stored.\n"];
  executed_by: string_ option
    [@ocaml.doc "The IAM role ARN of the user who ran the automation.\n"];
  execution_end_time: date_time option
    [@ocaml.doc
      "The time the execution finished. This isn't populated if the execution is still in progress.\n"];
  execution_start_time: date_time option
    [@ocaml.doc "The time the execution started.\n"];
  automation_execution_status: automation_execution_status option
    [@ocaml.doc "The status of the execution.\n"];
  document_version: document_version option
    [@ocaml.doc "The document version used during the execution.\n"];
  document_name: document_name option
    [@ocaml.doc
      "The name of the Automation runbook used during execution.\n"];
  automation_execution_id: automation_execution_id option
    [@ocaml.doc "The execution ID.\n"]}[@@ocaml.doc
                                         "Details about a specific Automation execution.\n"]
type nonrec automation_execution_metadata_list =
  automation_execution_metadata list[@@ocaml.doc ""]
type nonrec describe_automation_executions_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.\n"];
  automation_execution_metadata_list:
    automation_execution_metadata_list option
    [@ocaml.doc
      "The list of details about each automation execution which has occurred which matches the filter specification, if any.\n"]}
[@@ocaml.doc ""]
type nonrec automation_execution_filter_key =
  | OPS_ITEM_ID [@ocaml.doc ""]
  | AUTOMATION_SUBTYPE [@ocaml.doc ""]
  | TARGET_RESOURCE_GROUP [@ocaml.doc ""]
  | TAG_KEY [@ocaml.doc ""]
  | AUTOMATION_TYPE [@ocaml.doc ""]
  | START_TIME_AFTER [@ocaml.doc ""]
  | START_TIME_BEFORE [@ocaml.doc ""]
  | CURRENT_ACTION [@ocaml.doc ""]
  | PARENT_EXECUTION_ID [@ocaml.doc ""]
  | EXECUTION_ID [@ocaml.doc ""]
  | EXECUTION_STATUS [@ocaml.doc ""]
  | DOCUMENT_NAME_PREFIX [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec automation_execution_filter_value = string[@@ocaml.doc ""]
type nonrec automation_execution_filter_value_list =
  automation_execution_filter_value list[@@ocaml.doc ""]
type nonrec automation_execution_filter =
  {
  values: automation_execution_filter_value_list
    [@ocaml.doc
      "The values used to limit the execution information associated with the filter's key.\n"];
  key: automation_execution_filter_key
    [@ocaml.doc "One or more keys to limit the results.\n"]}[@@ocaml.doc
                                                              "A filter used to match specific automation executions. This is used to limit the scope of Automation execution information returned.\n"]
type nonrec automation_execution_filter_list =
  automation_execution_filter list[@@ocaml.doc ""]
type nonrec describe_automation_executions_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. (You received this token from a previous call.)\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: automation_execution_filter_list option
    [@ocaml.doc
      "Filters used to limit the scope of executions that are requested.\n"]}
[@@ocaml.doc ""]
type nonrec describe_association_result =
  {
  association_description: association_description option
    [@ocaml.doc "Information about the association.\n"]}[@@ocaml.doc ""]
type nonrec describe_association_request =
  {
  association_version: association_version option
    [@ocaml.doc
      "Specify the association version to retrieve. To view the latest version, either specify [$LATEST] for this parameter, or omit this parameter. To view a list of all associations for a managed node, use [ListAssociations]. To get a list of versions for a specific association, use [ListAssociationVersions]. \n"];
  association_id: association_id option
    [@ocaml.doc "The association ID for which you want information.\n"];
  instance_id: instance_id option [@ocaml.doc "The managed node ID.\n"];
  name: document_ar_n option [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc ""]
type nonrec association_execution_id = string[@@ocaml.doc ""]
type nonrec association_execution =
  {
  triggered_alarms: alarm_state_information_list option
    [@ocaml.doc
      "The CloudWatch alarms that were invoked by the association.\n"];
  alarm_configuration: alarm_configuration option [@ocaml.doc ""];
  resource_count_by_status: resource_count_by_status option
    [@ocaml.doc
      "An aggregate status of the resources in the execution based on the status type.\n"];
  last_execution_date: date_time option
    [@ocaml.doc "The date of the last execution.\n"];
  created_time: date_time option
    [@ocaml.doc "The time the execution started.\n"];
  detailed_status: status_name option
    [@ocaml.doc "Detailed status information about the execution.\n"];
  status: status_name option
    [@ocaml.doc "The status of the association execution.\n"];
  execution_id: association_execution_id option
    [@ocaml.doc "The execution ID for the association.\n"];
  association_version: association_version option
    [@ocaml.doc "The association version.\n"];
  association_id: association_id option [@ocaml.doc "The association ID.\n"]}
[@@ocaml.doc "Includes information about the specified association.\n"]
type nonrec association_executions_list = association_execution list[@@ocaml.doc
                                                                    ""]
type nonrec describe_association_executions_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  association_executions: association_executions_list option
    [@ocaml.doc
      "A list of the executions for the specified association ID.\n"]}
[@@ocaml.doc ""]
type nonrec association_execution_filter_key =
  | CreatedTime [@ocaml.doc ""]
  | Status [@ocaml.doc ""]
  | ExecutionId [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec association_execution_filter_value = string[@@ocaml.doc ""]
type nonrec association_filter_operator_type =
  | GreaterThan [@ocaml.doc ""]
  | LessThan [@ocaml.doc ""]
  | Equal [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec association_execution_filter =
  {
  type_: association_filter_operator_type
    [@ocaml.doc "The filter type specified in the request.\n"];
  value: association_execution_filter_value
    [@ocaml.doc "The value specified for the key.\n"];
  key: association_execution_filter_key
    [@ocaml.doc "The key value used in the request.\n"]}[@@ocaml.doc
                                                          "Filters used in the request.\n"]
type nonrec association_execution_filter_list =
  association_execution_filter list[@@ocaml.doc ""]
type nonrec describe_association_executions_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: association_execution_filter_list option
    [@ocaml.doc
      "Filters for the request. You can specify the following filters and values.\n\n ExecutionId (EQUAL)\n \n  Status (EQUAL)\n  \n   CreatedTime (EQUAL, GREATER_THAN, LESS_THAN)\n   "];
  association_id: association_id
    [@ocaml.doc
      "The association ID for which you want to view execution history details.\n"]}
[@@ocaml.doc ""]
type nonrec association_resource_id = string[@@ocaml.doc ""]
type nonrec association_resource_type = string[@@ocaml.doc ""]
type nonrec association_execution_target =
  {
  output_source: output_source option
    [@ocaml.doc "The location where the association details are saved.\n"];
  last_execution_date: date_time option
    [@ocaml.doc "The date of the last execution.\n"];
  detailed_status: status_name option
    [@ocaml.doc "Detailed information about the execution status.\n"];
  status: status_name option
    [@ocaml.doc "The association execution status.\n"];
  resource_type: association_resource_type option
    [@ocaml.doc "The resource type, for example, EC2.\n"];
  resource_id: association_resource_id option
    [@ocaml.doc
      "The resource ID, for example, the managed node ID where the association ran.\n"];
  execution_id: association_execution_id option
    [@ocaml.doc "The execution ID.\n"];
  association_version: association_version option
    [@ocaml.doc "The association version.\n"];
  association_id: association_id option [@ocaml.doc "The association ID.\n"]}
[@@ocaml.doc
  "Includes information about the specified association execution.\n"]
type nonrec association_execution_targets_list =
  association_execution_target list[@@ocaml.doc ""]
type nonrec describe_association_execution_targets_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results.\n"];
  association_execution_targets: association_execution_targets_list option
    [@ocaml.doc "Information about the execution.\n"]}[@@ocaml.doc ""]
type nonrec association_execution_targets_filter_key =
  | ResourceType [@ocaml.doc ""]
  | ResourceId [@ocaml.doc ""]
  | Status [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec association_execution_targets_filter_value = string[@@ocaml.doc
                                                                 ""]
type nonrec association_execution_targets_filter =
  {
  value: association_execution_targets_filter_value
    [@ocaml.doc "The value specified for the key.\n"];
  key: association_execution_targets_filter_key
    [@ocaml.doc "The key value used in the request.\n"]}[@@ocaml.doc
                                                          "Filters for the association execution.\n"]
type nonrec association_execution_targets_filter_list =
  association_execution_targets_filter list[@@ocaml.doc ""]
type nonrec describe_association_execution_targets_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: association_execution_targets_filter_list option
    [@ocaml.doc
      "Filters for the request. You can specify the following filters and values.\n\n Status (EQUAL)\n \n  ResourceId (EQUAL)\n  \n   ResourceType (EQUAL)\n   "];
  execution_id: association_execution_id
    [@ocaml.doc "The execution ID for which you want to view details.\n"];
  association_id: association_id
    [@ocaml.doc
      "The association ID that includes the execution for which you want to view details.\n"]}
[@@ocaml.doc ""]
type nonrec association_execution_does_not_exist =
  {
  message: string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                            "The specified execution ID doesn't exist. Verify the ID number and try again.\n"]
type nonrec activation_description = string[@@ocaml.doc ""]
type nonrec default_instance_name = string[@@ocaml.doc ""]
type nonrec created_date = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec activation =
  {
  tags: tag_list option [@ocaml.doc "Tags assigned to the activation.\n"];
  created_date: created_date option
    [@ocaml.doc "The date the activation was created.\n"];
  expired: boolean_ option
    [@ocaml.doc "Whether or not the activation is expired.\n"];
  expiration_date: expiration_date option
    [@ocaml.doc
      "The date when this activation can no longer be used to register managed nodes.\n"];
  registrations_count: registrations_count option
    [@ocaml.doc
      "The number of managed nodes already registered with this activation.\n"];
  registration_limit: registration_limit option
    [@ocaml.doc
      "The maximum number of managed nodes that can be registered using this activation.\n"];
  iam_role: iam_role option
    [@ocaml.doc
      "The Identity and Access Management (IAM) role to assign to the managed node.\n"];
  default_instance_name: default_instance_name option
    [@ocaml.doc "A name for the managed node when it is created.\n"];
  description: activation_description option
    [@ocaml.doc "A user defined description of the activation.\n"];
  activation_id: activation_id option
    [@ocaml.doc
      "The ID created by Systems Manager when you submitted the activation.\n"]}
[@@ocaml.doc
  "An activation registers one or more on-premises servers or virtual machines (VMs) with Amazon Web Services so that you can configure those servers or VMs using Run Command. A server or VM that has been registered with Amazon Web Services Systems Manager is called a managed node.\n"]
type nonrec activation_list = activation list[@@ocaml.doc ""]
type nonrec describe_activations_result =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token for the next set of items to return. Use this token to get the next set of results. \n"];
  activation_list: activation_list option
    [@ocaml.doc
      "A list of activations for your Amazon Web Services account.\n"]}
[@@ocaml.doc ""]
type nonrec describe_activations_filter_keys =
  | IAM_ROLE [@ocaml.doc ""]
  | DEFAULT_INSTANCE_NAME [@ocaml.doc ""]
  | ACTIVATION_IDS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec describe_activations_filter =
  {
  filter_values: string_list option [@ocaml.doc "The filter values.\n"];
  filter_key: describe_activations_filter_keys option
    [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                               "Filter for the DescribeActivation API.\n"]
type nonrec describe_activations_filter_list =
  describe_activations_filter list[@@ocaml.doc ""]
type nonrec describe_activations_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "A token to start the list. Use this token to get the next set of results. \n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.\n"];
  filters: describe_activations_filter_list option
    [@ocaml.doc "A filter to view information about your activations.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_task_from_maintenance_window_result =
  {
  window_task_id: maintenance_window_task_id option
    [@ocaml.doc "The ID of the task removed from the maintenance window.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc
      "The ID of the maintenance window the task was removed from.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_task_from_maintenance_window_request =
  {
  window_task_id: maintenance_window_task_id
    [@ocaml.doc
      "The ID of the task to remove from the maintenance window.\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window the task should be removed from.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_target_from_maintenance_window_result =
  {
  window_target_id: maintenance_window_target_id option
    [@ocaml.doc "The ID of the removed target definition.\n"];
  window_id: maintenance_window_id option
    [@ocaml.doc
      "The ID of the maintenance window the target was removed from.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_target_from_maintenance_window_request =
  {
  safe: boolean_ option
    [@ocaml.doc
      "The system checks if the target is being referenced by a task. If the target is being referenced, the system returns an error and doesn't deregister the target from the maintenance window.\n"];
  window_target_id: maintenance_window_target_id
    [@ocaml.doc "The ID of the target definition to remove.\n"];
  window_id: maintenance_window_id
    [@ocaml.doc
      "The ID of the maintenance window the target should be removed from.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_patch_baseline_for_patch_group_result =
  {
  patch_group: patch_group option
    [@ocaml.doc
      "The name of the patch group deregistered from the patch baseline.\n"];
  baseline_id: baseline_id option
    [@ocaml.doc
      "The ID of the patch baseline the patch group was deregistered from.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_patch_baseline_for_patch_group_request =
  {
  patch_group: patch_group
    [@ocaml.doc
      "The name of the patch group that should be deregistered from the patch baseline.\n"];
  baseline_id: baseline_id
    [@ocaml.doc
      "The ID of the patch baseline to deregister the patch group from.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_managed_instance_result = unit[@@ocaml.doc ""]
type nonrec deregister_managed_instance_request =
  {
  instance_id: managed_instance_id
    [@ocaml.doc
      "The ID assigned to the managed node when you registered it using the activation process. \n"]}
[@@ocaml.doc ""]
type nonrec delete_resource_policy_response = unit[@@ocaml.doc ""]
type nonrec delete_resource_policy_request =
  {
  policy_hash: policy_hash
    [@ocaml.doc
      "ID of the current policy version. The hash helps to prevent multiple calls from attempting to overwrite a policy.\n"];
  policy_id: policy_id [@ocaml.doc "The policy ID.\n"];
  resource_arn: resource_arn_string
    [@ocaml.doc
      "Amazon Resource Name (ARN) of the resource to which the policies are attached.\n"]}
[@@ocaml.doc ""]
type nonrec delete_resource_data_sync_result = unit[@@ocaml.doc ""]
type nonrec delete_resource_data_sync_request =
  {
  sync_type: resource_data_sync_type option
    [@ocaml.doc "Specify the type of resource data sync to delete.\n"];
  sync_name: resource_data_sync_name
    [@ocaml.doc "The name of the configuration to delete.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec delete_patch_baseline_result =
  {
  baseline_id: baseline_id option
    [@ocaml.doc "The ID of the deleted patch baseline.\n"]}[@@ocaml.doc ""]
type nonrec delete_patch_baseline_request =
  {
  baseline_id: baseline_id
    [@ocaml.doc "The ID of the patch baseline to delete.\n"]}[@@ocaml.doc ""]
type nonrec delete_parameters_result =
  {
  invalid_parameters: parameter_name_list option
    [@ocaml.doc
      "The names of parameters that weren't deleted because the parameters aren't valid.\n"];
  deleted_parameters: parameter_name_list option
    [@ocaml.doc "The names of the deleted parameters.\n"]}[@@ocaml.doc ""]
type nonrec delete_parameters_request =
  {
  names: parameter_name_list
    [@ocaml.doc
      "The names of the parameters to delete. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.\n\n  You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec delete_parameter_result = unit[@@ocaml.doc ""]
type nonrec delete_parameter_request =
  {
  name: ps_parameter_name
    [@ocaml.doc
      "The name of the parameter to delete.\n\n  You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec delete_ops_metadata_result = unit[@@ocaml.doc ""]
type nonrec delete_ops_metadata_request =
  {
  ops_metadata_arn: ops_metadata_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an OpsMetadata Object to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_ops_item_response = unit[@@ocaml.doc ""]
type nonrec delete_ops_item_request =
  {
  ops_item_id: ops_item_id
    [@ocaml.doc "The ID of the OpsItem that you want to delete.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_maintenance_window_result =
  {
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the deleted maintenance window.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec delete_maintenance_window_request =
  {
  window_id: maintenance_window_id
    [@ocaml.doc "The ID of the maintenance window to delete.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec delete_inventory_result =
  {
  deletion_summary: inventory_deletion_summary option
    [@ocaml.doc
      "A summary of the delete operation. For more information about this summary, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-custom.html#delete-custom-inventory-summary}Deleting custom inventory} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  type_name: inventory_item_type_name option
    [@ocaml.doc
      "The name of the inventory data type specified in the request.\n"];
  deletion_id: uui_d option
    [@ocaml.doc
      "Every [DeleteInventory] operation is assigned a unique ID. This option returns a unique ID. You can use this ID to query the status of a delete operation. This option is useful for ensuring that a delete operation has completed before you begin other operations. \n"]}
[@@ocaml.doc ""]
type nonrec delete_inventory_request =
  {
  client_token: uui_d option
    [@ocaml.doc "User-provided idempotency token.\n"];
  dry_run: dry_run option
    [@ocaml.doc
      "Use this option to view a summary of the deletion request without deleting any data or the data type. This option is useful when you only want to understand what will be deleted. Once you validate that the data to be deleted is what you intend to delete, you can run the same command without specifying the [DryRun] option.\n"];
  schema_delete_option: inventory_schema_delete_option option
    [@ocaml.doc
      "Use the [SchemaDeleteOption] to delete a custom inventory type (schema). If you don't choose this option, the system only deletes existing inventory data associated with the custom inventory type. Choose one of the following options:\n\n DisableSchema: If you choose this option, the system ignores all inventory data for the specified version, and any earlier versions. To enable this schema again, you must call the [PutInventory] operation for a version greater than the disabled version.\n \n  DeleteSchema: This option deletes the specified custom type from the Inventory service. You can recreate the schema later, if you want.\n  "];
  type_name: inventory_item_type_name
    [@ocaml.doc
      "The name of the custom inventory type for which you want to delete either all previously collected data or the inventory type itself. \n"]}
[@@ocaml.doc ""]
type nonrec delete_document_result = unit[@@ocaml.doc ""]
type nonrec delete_document_request =
  {
  force: boolean_ option
    [@ocaml.doc
      "Some SSM document types require that you specify a [Force] flag before you can delete the document. For example, you must specify a [Force] flag to delete a document of type [ApplicationConfigurationSchema]. You can restrict access to the [Force] flag in an Identity and Access Management (IAM) policy.\n"];
  version_name: document_version_name option
    [@ocaml.doc
      "The version name of the document that you want to delete. If not provided, all versions of the document are deleted.\n"];
  document_version: document_version option
    [@ocaml.doc
      "The version of the document that you want to delete. If not provided, all versions of the document are deleted.\n"];
  name: document_name [@ocaml.doc "The name of the document.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec associated_instances = unit[@@ocaml.doc ""]
type nonrec delete_association_result = unit[@@ocaml.doc ""]
type nonrec delete_association_request =
  {
  association_id: association_id option
    [@ocaml.doc "The association ID that you want to delete.\n"];
  instance_id: instance_id option
    [@ocaml.doc
      "The managed node ID.\n\n   [InstanceId] has been deprecated. To specify a managed node ID for an association, use the [Targets] parameter. Requests that include the parameter [InstanceID] with Systems Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if you use the parameter [InstanceId], you can't use the parameters [AssociationName], [DocumentVersion], [MaxErrors], [MaxConcurrency], [OutputLocation], or [ScheduleExpression]. To use these parameters, you must use the [Targets] parameter.\n  \n   "];
  name: document_ar_n option [@ocaml.doc "The name of the SSM document.\n"]}
[@@ocaml.doc ""]
type nonrec delete_activation_result = unit[@@ocaml.doc ""]
type nonrec delete_activation_request =
  {
  activation_id: activation_id
    [@ocaml.doc "The ID of the activation that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec create_resource_data_sync_result = unit[@@ocaml.doc ""]
type nonrec create_resource_data_sync_request =
  {
  sync_source: resource_data_sync_source option
    [@ocaml.doc
      "Specify information about the data sources to synchronize. This parameter is required if the [SyncType] value is SyncFromSource.\n"];
  sync_type: resource_data_sync_type option
    [@ocaml.doc
      "Specify [SyncToDestination] to create a resource data sync that synchronizes data to an S3 bucket for Inventory. If you specify [SyncToDestination], you must provide a value for [S3Destination]. Specify [SyncFromSource] to synchronize data from a single account and multiple Regions, or multiple Amazon Web Services accounts and Amazon Web Services Regions, as listed in Organizations for Explorer. If you specify [SyncFromSource], you must provide a value for [SyncSource]. The default value is [SyncToDestination].\n"];
  s3_destination: resource_data_sync_s3_destination option
    [@ocaml.doc
      "Amazon S3 configuration details for the sync. This parameter is required if the [SyncType] value is SyncToDestination.\n"];
  sync_name: resource_data_sync_name
    [@ocaml.doc "A name for the configuration.\n"]}[@@ocaml.doc ""]
type nonrec create_patch_baseline_result =
  {
  baseline_id: baseline_id option
    [@ocaml.doc "The ID of the created patch baseline.\n"]}[@@ocaml.doc ""]
type nonrec create_patch_baseline_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a patch baseline to identify the severity level of patches it specifies and the operating system family it applies to. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=PatchSeverity,Value=Critical] \n           \n            }\n       {-   [Key=OS,Value=Windows] \n           \n            }\n       }\n    To add tags to an existing patch baseline, use the [AddTagsToResource] operation.\n    \n     "];
  client_token: client_token option
    [@ocaml.doc "User-provided idempotency token.\n"];
  available_security_updates_compliance_status:
    patch_compliance_status option
    [@ocaml.doc
      "Indicates the status you want to assign to security patches that are available but not approved because they don't meet the installation criteria specified in the patch baseline.\n\n Example scenario: Security patches that you might want installed can be skipped if you have specified a long period to wait after a patch is released before installation. If an update to the patch is released during your specified waiting period, the waiting period for installing the patch starts over. If the waiting period is too long, multiple versions of the patch could be released but never installed.\n \n  Supported for Windows Server managed nodes only.\n  "];
  sources: patch_source_list option
    [@ocaml.doc
      "Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.\n"];
  description: baseline_description option
    [@ocaml.doc "A description of the patch baseline.\n"];
  rejected_patches_action: patch_action option
    [@ocaml.doc
      "The action for Patch Manager to take on patches included in the [RejectedPackages] list.\n\n  ALLOW_AS_DEPENDENCY   {b Linux and macOS}: A package in the rejected patches list is installed only if it is a dependency of another package. It is considered compliant with the patch baseline, and its status is reported as [INSTALLED_OTHER]. This is the default action if no option is specified.\n                       \n                         {b Windows Server}: Windows Server doesn't support the concept of package dependencies. If a package in the rejected patches list and already installed on the node, its status is reported as [INSTALLED_OTHER]. Any package not already installed on the node is skipped. This is the default action if no option is specified.\n                        \n                          BLOCK   {b All OSs}: Packages in the rejected patches list, and packages that include them as dependencies, aren't installed by Patch Manager under any circumstances. If a package was installed before it was added to the rejected patches list, or is installed outside of Patch Manager afterward, it's considered noncompliant with the patch baseline and its status is reported as [INSTALLED_REJECTED].\n                                 \n                                   "];
  rejected_patches: patch_id_list option
    [@ocaml.doc
      "A list of explicitly rejected patches for the baseline.\n\n For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}Package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  approved_patches_enable_non_security: boolean_ option
    [@ocaml.doc
      "Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.\n"];
  approved_patches_compliance_level: patch_compliance_level option
    [@ocaml.doc
      "Defines the compliance level for approved patches. When an approved patch is reported as missing, this value describes the severity of the compliance violation. The default value is [UNSPECIFIED].\n"];
  approved_patches: patch_id_list option
    [@ocaml.doc
      "A list of explicitly approved patches for the baseline.\n\n For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}Package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.\n "];
  approval_rules: patch_rule_group option
    [@ocaml.doc "A set of rules used to include patches in the baseline.\n"];
  global_filters: patch_filter_group option
    [@ocaml.doc
      "A set of global filters used to include patches in the baseline.\n\n  The [GlobalFilters] parameter can be configured only by using the CLI or an Amazon Web Services SDK. It can't be configured from the Patch Manager console, and its value isn't displayed in the console.\n  \n   "];
  name: baseline_name [@ocaml.doc "The name of the patch baseline.\n"];
  operating_system: operating_system option
    [@ocaml.doc
      "Defines the operating system the patch baseline applies to. The default value is [WINDOWS].\n"]}
[@@ocaml.doc ""]
type nonrec create_ops_metadata_result =
  {
  ops_metadata_arn: ops_metadata_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the OpsMetadata Object or blob created by the call.\n"]}
[@@ocaml.doc ""]
type nonrec create_ops_metadata_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. You can specify a maximum of five tags for an OpsMetadata object. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an OpsMetadata object to identify an environment or target Amazon Web Services Region. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=Environment,Value=Production] \n           \n            }\n       {-   [Key=Region,Value=us-east-2] \n           \n            }\n       }\n  "];
  metadata: metadata_map option
    [@ocaml.doc "Metadata for a new Application Manager application. \n"];
  resource_id: ops_metadata_resource_id
    [@ocaml.doc "A resource ID for a new Application Manager application.\n"]}
[@@ocaml.doc ""]
type nonrec create_ops_item_response =
  {
  ops_item_arn: ops_item_arn option
    [@ocaml.doc "The OpsItem Amazon Resource Name (ARN).\n"];
  ops_item_id: string_ option [@ocaml.doc "The ID of the OpsItem.\n"]}
[@@ocaml.doc ""]
type nonrec create_ops_item_request =
  {
  account_id: ops_item_account_id option
    [@ocaml.doc
      "The target Amazon Web Services account where you want to create an OpsItem. To make this call, your account must be configured to work with OpsItems across accounts. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  planned_end_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  planned_start_time: date_time option
    [@ocaml.doc
      "The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].\n"];
  actual_end_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  actual_start_time: date_time option
    [@ocaml.doc
      "The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].\n"];
  severity: ops_item_severity option
    [@ocaml.doc "Specify a severity to assign to an OpsItem.\n"];
  category: ops_item_category option
    [@ocaml.doc "Specify a category to assign to an OpsItem. \n"];
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource.\n\n Tags use a key-value pair. For example:\n \n   [Key=Department,Value=Finance] \n  \n    To add tags to a new OpsItem, a user must have IAM permissions for both the [ssm:CreateOpsItems] operation and the [ssm:AddTagsToResource] operation. To add tags to an existing OpsItem, use the [AddTagsToResource] operation.\n    \n     "];
  title: ops_item_title
    [@ocaml.doc
      "A short heading that describes the nature of the OpsItem and the impacted resource.\n"];
  source: ops_item_source
    [@ocaml.doc
      "The origin of the OpsItem, such as Amazon EC2 or Systems Manager.\n\n  The source name can't contain the following strings: [aws], [amazon], and [amzn]. \n  \n   "];
  related_ops_items: related_ops_items option
    [@ocaml.doc
      "One or more OpsItems that share something in common with the current OpsItems. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.\n"];
  priority: ops_item_priority option
    [@ocaml.doc
      "The importance of this OpsItem in relation to other OpsItems in the system.\n"];
  notifications: ops_item_notifications option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.\n"];
  operational_data: ops_item_operational_data option
    [@ocaml.doc
      "Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.\n\n  Operational data keys {i can't} begin with the following: [amazon], [aws], [amzn], [ssm], [/amazon], [/aws], [/amzn], [/ssm].\n  \n    You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the [DescribeOpsItems] API operation) can view and search on the specified data. Operational data that isn't searchable is only viewable by users who have access to the OpsItem (as provided by the [GetOpsItem] API operation).\n    \n     Use the [/aws/resources] key in OperationalData to specify a related resource in the request. Use the [/aws/automations] key in OperationalData to associate an Automation runbook with the OpsItem. To view Amazon Web Services CLI example commands that use these keys, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html}Create OpsItems manually} in the {i Amazon Web Services Systems Manager User Guide}.\n     "];
  ops_item_type: ops_item_type option
    [@ocaml.doc
      "The type of OpsItem to create. Systems Manager supports the following types of OpsItems:\n\n {ul\n       {-   [/aws/issue] \n           \n            This type of OpsItem is used for default OpsItems created by OpsCenter. \n            \n             }\n       {-   [/aws/changerequest] \n           \n            This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change requests. \n            \n             }\n       {-   [/aws/insight] \n           \n            This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems. \n            \n             }\n       }\n  "];
  description: ops_item_description
    [@ocaml.doc
      "User-defined text that contains information about the OpsItem, in Markdown format. \n\n  Provide enough information so that users viewing this OpsItem for the first time understand the issue. \n  \n   "]}
[@@ocaml.doc ""]
type nonrec create_maintenance_window_result =
  {
  window_id: maintenance_window_id option
    [@ocaml.doc "The ID of the created maintenance window.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec create_maintenance_window_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a maintenance window to identify the type of tasks it will run, the types of targets, and the environment it will run in. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=TaskType,Value=AgentUpdate] \n           \n            }\n       {-   [Key=OS,Value=Windows] \n           \n            }\n       {-   [Key=Environment,Value=Production] \n           \n            }\n       }\n    To add tags to an existing maintenance window, use the [AddTagsToResource] operation.\n    \n     "];
  client_token: client_token option
    [@ocaml.doc "User-provided idempotency token.\n"];
  allow_unassociated_targets: maintenance_window_allow_unassociated_targets
    [@ocaml.doc
      "Enables a maintenance window task to run on managed nodes, even if you haven't registered those nodes as targets. If enabled, then you must specify the unregistered managed nodes (by node ID) when you register a task with the maintenance window.\n\n If you don't enable this option, then you must specify previously-registered targets when you register a task with the maintenance window.\n "];
  cutoff: maintenance_window_cutoff
    [@ocaml.doc
      "The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.\n"];
  duration: maintenance_window_duration_hours
    [@ocaml.doc "The duration of the maintenance window in hours.\n"];
  schedule_offset: maintenance_window_offset option
    [@ocaml.doc
      "The number of days to wait after the date and time specified by a cron expression before running the maintenance window.\n\n For example, the following cron expression schedules a maintenance window to run on the third Tuesday of every month at 11:30 PM.\n \n   [cron(30 23 ? * TUE#3 *)] \n  \n   If the schedule offset is [2], the maintenance window won't run until two days later.\n   "];
  schedule_timezone: maintenance_window_timezone option
    [@ocaml.doc
      "The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \"Asia/Seoul\". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.\n"];
  schedule: maintenance_window_schedule
    [@ocaml.doc
      "The schedule of the maintenance window in the form of a cron or rate expression.\n"];
  end_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become inactive. [EndDate] allows you to set a date and time in the future when the maintenance window will no longer run.\n"];
  start_date: maintenance_window_string_date_time option
    [@ocaml.doc
      "The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become active. [StartDate] allows you to delay activation of the maintenance window until the specified future date.\n\n  When using a rate schedule, if you provide a start date that occurs in the past, the current date and time are used as the start date. \n  \n   "];
  description: maintenance_window_description option
    [@ocaml.doc
      "An optional description for the maintenance window. We recommend specifying a description to help you organize your maintenance windows. \n"];
  name: maintenance_window_name
    [@ocaml.doc "The name of the maintenance window.\n"]}[@@ocaml.doc ""]
type nonrec create_document_result =
  {
  document_description: document_description option
    [@ocaml.doc "Information about the SSM document.\n"]}[@@ocaml.doc ""]
type nonrec create_document_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an SSM document to identify the types of targets or the environment where it will run. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=OS,Value=Windows] \n           \n            }\n       {-   [Key=Environment,Value=Production] \n           \n            }\n       }\n    To add tags to an existing SSM document, use the [AddTagsToResource] operation.\n    \n     "];
  target_type: target_type option
    [@ocaml.doc
      "Specify a target type to define the kinds of resources the document can run on. For example, to run a document on EC2 instances, specify the following value: [/AWS::EC2::Instance]. If you specify a value of '/' the document can run on all types of resources. If you don't specify a value, the document can't run on any resources. For a list of valid resource types, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}. \n"];
  document_format: document_format option
    [@ocaml.doc
      "Specify the document format for the request. The document format can be JSON, YAML, or TEXT. JSON is the default format.\n"];
  document_type: document_type option
    [@ocaml.doc
      "The type of document to create.\n\n  The [DeploymentStrategy] document type is an internal-use-only document type reserved for AppConfig.\n  \n   "];
  version_name: document_version_name option
    [@ocaml.doc
      "An optional field specifying the version of the artifact you are creating with the document. For example, [Release12.1]. This value is unique across all versions of a document, and can't be changed.\n"];
  display_name: document_display_name option
    [@ocaml.doc
      "An optional field where you can specify a friendly name for the SSM document. This value can differ for each version of the document. You can update this value at a later time using the [UpdateDocument] operation.\n"];
  name: document_name
    [@ocaml.doc
      "A name for the SSM document.\n\n  You can't use the following strings as document name prefixes. These are reserved by Amazon Web Services for use as document name prefixes:\n  \n   {ul\n         {-   [aws] \n             \n              }\n         {-   [amazon] \n             \n              }\n         {-   [amzn] \n             \n              }\n         {-   [AWSEC2] \n             \n              }\n         {-   [AWSConfigRemediation] \n             \n              }\n         {-   [AWSSupport] \n             \n              }\n         }\n   "];
  attachments: attachments_source_list option
    [@ocaml.doc
      "A list of key-value pairs that describe attachments to a version of a document.\n"];
  requires: document_requires_list option
    [@ocaml.doc
      "A list of SSM documents required by a document. This parameter is used exclusively by AppConfig. When a user creates an AppConfig configuration in an SSM document, the user must also specify a required document for validation purposes. In this case, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document for validation purposes. For more information, see {{:https://docs.aws.amazon.com/appconfig/latest/userguide/what-is-appconfig.html}What is AppConfig?} in the {i AppConfig User Guide}.\n"];
  content: document_content
    [@ocaml.doc
      "The content for the new SSM document in JSON or YAML format. The content of the document must not exceed 64KB. This quota also includes the content specified for input parameters at runtime. We recommend storing the contents for your new document in an external JSON or YAML file and referencing the file in a command.\n\n For examples, see the following topics in the {i Amazon Web Services Systems Manager User Guide}.\n \n  {ul\n        {-   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-console}Create an SSM document (console)} \n            \n             }\n        {-   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-document-cli}Create an SSM document (command line)} \n            \n             }\n        {-   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-document-api}Create an SSM document (API)} \n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec create_association_result =
  {
  association_description: association_description option
    [@ocaml.doc "Information about the association.\n"]}[@@ocaml.doc ""]
type nonrec create_association_request =
  {
  alarm_configuration: alarm_configuration option [@ocaml.doc ""];
  tags: tag_list option
    [@ocaml.doc
      "Adds or overwrites one or more tags for a State Manager association. {i Tags} are metadata that you can assign to your Amazon Web Services resources. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. \n"];
  target_maps: target_maps option
    [@ocaml.doc
      "A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.\n"];
  duration: duration option
    [@ocaml.doc
      "The number of hours the association can run before it is canceled. Duration applies to associations that are currently running, and any pending and in progress commands on all targets. If a target was taken offline for the association to run, it is made available again immediately, without a reboot. \n\n The [Duration] parameter applies only when both these conditions are true:\n \n  {ul\n        {-  The association for which you specify a duration is cancelable according to the parameters of the SSM command document or Automation runbook associated with this execution. \n            \n             }\n        {-  The command specifies the \n            {[\n             {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_CreateAssociation.html#systemsmanager-CreateAssociation-request-ApplyOnlyAtCronInterval}ApplyOnlyAtCronInterval} \n            ]}\n             parameter, which means that the association doesn't run immediately after it is created, but only according to the specified schedule.\n            \n             }\n        }\n  "];
  schedule_offset: schedule_offset option
    [@ocaml.doc
      "Number of days to wait after the scheduled day to run an association. For example, if you specified a cron schedule of [cron(0 0 ? * THU#2 *)], you could specify an offset of 3 to run the association each Sunday after the second Thursday of the month. For more information about cron schedules for associations, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/reference-cron-and-rate-expressions.html}Reference: Cron and rate expressions for Systems Manager} in the {i Amazon Web Services Systems Manager User Guide}. \n\n  To use offsets, you must specify the [ApplyOnlyAtCronInterval] parameter. This option tells the system not to run an association immediately after you create it. \n  \n   "];
  target_locations: target_locations option
    [@ocaml.doc
      "A location is a combination of Amazon Web Services Regions and Amazon Web Services accounts where you want to run the association. Use this action to create an association in multiple Regions and multiple accounts.\n"];
  calendar_names: calendar_name_or_arn_list option
    [@ocaml.doc
      "The names of Amazon Resource Names (ARNs) of the Change Calendar type documents you want to gate your associations under. The associations only run when that change calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  apply_only_at_cron_interval: apply_only_at_cron_interval option
    [@ocaml.doc
      "By default, when you create a new association, the system runs it immediately after it is created and then according to the schedule you specified and when target changes are detected. Specify [true] for [ApplyOnlyAtCronInterval]if you want the association to run only according to the schedule you specified.\n\n For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#state-manager-about-scheduling}Understanding when associations are applied to resources} and {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-about.html#runbook-target-updates}>About target updates with Automation runbooks} in the {i Amazon Web Services Systems Manager User Guide}.\n \n  This parameter isn't supported for rate expressions.\n  "];
  sync_compliance: association_sync_compliance option
    [@ocaml.doc
      "The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].\n\n In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager. It is managed by your direct call to the [PutComplianceItems] API operation.\n \n  By default, all associations use [AUTO] mode.\n  "];
  compliance_severity: association_compliance_severity option
    [@ocaml.doc "The severity level to assign to the association.\n"];
  max_concurrency: max_concurrency option
    [@ocaml.doc
      "The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.\n\n If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].\n "];
  max_errors: max_errors option
    [@ocaml.doc
      "The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.\n\n Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.\n "];
  automation_target_parameter_name: automation_target_parameter_name option
    [@ocaml.doc
      "Choose the parameter that will define how your automation will branch out. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a tool in Amazon Web Services Systems Manager.\n"];
  association_name: association_name option
    [@ocaml.doc "Specify a descriptive name for the association.\n"];
  output_location: instance_association_output_location option
    [@ocaml.doc
      "An Amazon Simple Storage Service (Amazon S3) bucket where you want to store the output details of the request.\n"];
  schedule_expression: schedule_expression option
    [@ocaml.doc
      "A cron expression when the association will be applied to the targets.\n"];
  targets: targets option
    [@ocaml.doc
      "The targets for the association. You can target managed nodes by using tags, Amazon Web Services resource groups, all managed nodes in an Amazon Web Services account, or individual managed node IDs. You can target all managed nodes in an Amazon Web Services account by specifying the [InstanceIds] key with a value of [*]. For more information about choosing targets for an association, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-state-manager-targets-and-rate-controls.html}Understanding targets and rate controls in State Manager associations} in the {i Amazon Web Services Systems Manager User Guide}.\n"];
  parameters: parameters option
    [@ocaml.doc
      "The parameters for the runtime configuration of the document.\n"];
  instance_id: instance_id option
    [@ocaml.doc
      "The managed node ID.\n\n   [InstanceId] has been deprecated. To specify a managed node ID for an association, use the [Targets] parameter. Requests that include the parameter [InstanceID] with Systems Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if you use the parameter [InstanceId], you can't use the parameters [AssociationName], [DocumentVersion], [MaxErrors], [MaxConcurrency], [OutputLocation], or [ScheduleExpression]. To use these parameters, you must use the [Targets] parameter.\n  \n   "];
  document_version: document_version option
    [@ocaml.doc
      "The document version you want to associate with the targets. Can be a specific version or the default version.\n\n  State Manager doesn't support running associations that use a new version of a document if that document is shared from another account. State Manager always runs the [default] version of a document if shared from another account, even though the Systems Manager console shows that a new version was processed. If you want to run an association using a new version of a document shared form another account, you must set the document version to [default].\n  \n   "];
  name: document_ar_n
    [@ocaml.doc
      "The name of the SSM Command document or Automation runbook that contains the configuration information for the managed node.\n\n You can specify Amazon Web Services-predefined documents, documents you created, or a document that is shared with you from another Amazon Web Services account.\n \n  For Systems Manager documents (SSM documents) that are shared with you from other Amazon Web Services accounts, you must specify the complete SSM document ARN, in the following format:\n  \n    \n   {[\n   arn:{i partition}:ssm:{i region}:{i account-id}:document/{i document-name} \n   ]}\n    \n   \n    For example:\n    \n      [arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document] \n     \n      For Amazon Web Services-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, [AWS-ApplyPatchBaseline] or [My-Document].\n      "]}
[@@ocaml.doc ""]
type nonrec association_description_list = association_description list
[@@ocaml.doc ""]
type nonrec create_association_batch_result =
  {
  failed: failed_create_association_list option
    [@ocaml.doc "Information about the associations that failed.\n"];
  successful: association_description_list option
    [@ocaml.doc "Information about the associations that succeeded.\n"]}
[@@ocaml.doc ""]
type nonrec create_association_batch_request_entries =
  create_association_batch_request_entry list[@@ocaml.doc ""]
type nonrec create_association_batch_request =
  {
  entries: create_association_batch_request_entries
    [@ocaml.doc "One or more associations.\n"]}[@@ocaml.doc ""]
type nonrec association_limit_exceeded = unit[@@ocaml.doc ""]
type nonrec association_already_exists = unit[@@ocaml.doc ""]
type nonrec activation_code = string[@@ocaml.doc ""]
type nonrec create_activation_result =
  {
  activation_code: activation_code option
    [@ocaml.doc
      "The code the system generates when it processes the activation. The activation code functions like a password to validate the activation ID. \n"];
  activation_id: activation_id option
    [@ocaml.doc
      "The ID number generated by the system when it processed the activation. The activation ID functions like a user name.\n"]}
[@@ocaml.doc ""]
type nonrec create_activation_request =
  {
  registration_metadata: registration_metadata_list option
    [@ocaml.doc "Reserved for internal use.\n"];
  tags: tag_list option
    [@ocaml.doc
      "Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an activation to identify which servers or virtual machines (VMs) in your on-premises environment you intend to activate. In this case, you could specify the following key-value pairs:\n\n {ul\n       {-   [Key=OS,Value=Windows] \n           \n            }\n       {-   [Key=Environment,Value=Production] \n           \n            }\n       }\n    When you install SSM Agent on your on-premises servers and VMs, you specify an activation ID and code. When you specify the activation ID and code, tags assigned to the activation are automatically applied to the on-premises servers or VMs.\n    \n      You can't add tags to or delete tags from an existing activation. You can tag your on-premises servers, edge devices, and VMs after they connect to Systems Manager for the first time and are assigned a managed node ID. This means they are listed in the Amazon Web Services Systems Manager console with an ID that is prefixed with \"mi-\". For information about how to add tags to your managed nodes, see [AddTagsToResource]. For information about how to remove tags from your managed nodes, see [RemoveTagsFromResource].\n      "];
  expiration_date: expiration_date option
    [@ocaml.doc
      "The date by which this activation request should expire, in timestamp format, such as \"2024-07-07T00:00:00\". You can specify a date up to 30 days in advance. If you don't provide an expiration date, the activation code expires in 24 hours.\n"];
  registration_limit: registration_limit option
    [@ocaml.doc
      "Specify the maximum number of managed nodes you want to register. The default value is [1].\n"];
  iam_role: iam_role
    [@ocaml.doc
      "The name of the Identity and Access Management (IAM) role that you want to assign to the managed node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems Manager service principal [ssm.amazonaws.com]. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/hybrid-multicloud-service-role.html}Create the IAM service role required for Systems Manager in a hybrid and multicloud environments} in the {i Amazon Web Services Systems Manager User Guide}.\n\n  You can't specify an IAM service-linked role for this parameter. You must create a unique role.\n  \n   "];
  default_instance_name: default_instance_name option
    [@ocaml.doc
      "The name of the registered, managed node as it will appear in the Amazon Web Services Systems Manager console or when you use the Amazon Web Services command line tools to list Systems Manager resources.\n\n  Don't enter personally identifiable information in this field.\n  \n   "];
  description: activation_description option
    [@ocaml.doc
      "A user-defined description of the resource that you want to register with Systems Manager. \n\n  Don't enter personally identifiable information in this field.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec cancel_maintenance_window_execution_result =
  {
  window_execution_id: maintenance_window_execution_id option
    [@ocaml.doc
      "The ID of the maintenance window execution that has been stopped.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_maintenance_window_execution_request =
  {
  window_execution_id: maintenance_window_execution_id
    [@ocaml.doc "The ID of the maintenance window execution to stop.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_command_result = unit[@@ocaml.doc ""]
type nonrec cancel_command_request =
  {
  instance_ids: instance_id_list option
    [@ocaml.doc
      "(Optional) A list of managed node IDs on which you want to cancel the command. If not provided, the command is canceled on every node on which it was requested.\n"];
  command_id: command_id
    [@ocaml.doc "The ID of the command you want to cancel.\n"]}[@@ocaml.doc
                                                                 "\n"]
type nonrec associate_ops_item_related_item_response =
  {
  association_id: ops_item_related_item_association_id option
    [@ocaml.doc "The association ID.\n"]}[@@ocaml.doc ""]
type nonrec associate_ops_item_related_item_request =
  {
  resource_uri: ops_item_related_item_association_resource_uri
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Amazon Web Services resource that you want to associate with the OpsItem.\n"];
  resource_type: ops_item_related_item_association_resource_type
    [@ocaml.doc
      "The type of resource that you want to associate with an OpsItem. OpsCenter supports the following types:\n\n  [AWS::SSMIncidents::IncidentRecord]: an Incident Manager incident. \n \n   [AWS::SSM::Document]: a Systems Manager (SSM) document.\n  "];
  association_type: ops_item_related_item_association_type
    [@ocaml.doc
      "The type of association that you want to create between an OpsItem and a resource. OpsCenter supports [IsParentOf] and [RelatesTo] association types.\n"];
  ops_item_id: ops_item_id
    [@ocaml.doc
      "The ID of the OpsItem to which you want to associate a resource as a related item.\n"]}
[@@ocaml.doc ""]
type nonrec add_tags_to_resource_result = unit[@@ocaml.doc ""]
type nonrec add_tags_to_resource_request =
  {
  tags: tag_list
    [@ocaml.doc
      "One or more tags. The value parameter is required.\n\n  Don't enter personally identifiable information in this field.\n  \n   "];
  resource_id: resource_id
    [@ocaml.doc
      "The resource ID you want to tag.\n\n Use the ID of the resource. Here are some examples:\n \n   [MaintenanceWindow]: [mw-012345abcde] \n  \n    [PatchBaseline]: [pb-012345abcde] \n   \n     [Automation]: [example-c160-4567-8519-012345abcde] \n    \n      [OpsMetadata] object: [ResourceID] for tagging is created from the Amazon Resource Name (ARN) for the object. Specifically, [ResourceID] is created from the strings that come after the word [opsmetadata] in the ARN. For example, an OpsMetadata object with an ARN of [arn:aws:ssm:us-east-2:1234567890:opsmetadata/aws/ssm/MyGroup/appmanager] has a [ResourceID] of either [aws/ssm/MyGroup/appmanager] or [/aws/ssm/MyGroup/appmanager].\n     \n      For the [Document] and [Parameter] values, use the name of the resource. If you're tagging a shared document, you must use the full ARN of the document.\n      \n        [ManagedInstance]: [mi-012345abcde] \n       \n         The [ManagedInstance] type for this API operation is only for on-premises managed nodes. You must specify the name of the managed node in the following format: \n         {[\n         mi-{i ID_number} \n         ]}\n         . For example, [mi-1a2b3c4d5e6f].\n         \n          "];
  resource_type: resource_type_for_tagging
    [@ocaml.doc
      "Specifies the type of resource you are tagging.\n\n  The [ManagedInstance] type for this API operation is for on-premises managed nodes. You must specify the name of the managed node in the following format: \n  {[\n  mi-{i ID_number} \n  ]}\n  . For example, [mi-1a2b3c4d5e6f].\n  \n   "]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_update_service_setting_request :
  setting_value:service_setting_value ->
    setting_id:service_setting_id -> unit -> update_service_setting_request
val make_resource_data_sync_organizational_unit :
  ?organizational_unit_id:resource_data_sync_organizational_unit_id ->
    unit -> resource_data_sync_organizational_unit
val make_resource_data_sync_aws_organizations_source :
  ?organizational_units:resource_data_sync_organizational_unit_list ->
    organization_source_type:resource_data_sync_organization_source_type ->
      unit -> resource_data_sync_aws_organizations_source
val make_resource_data_sync_source :
  ?enable_all_ops_data_sources:resource_data_sync_enable_all_ops_data_sources
    ->
    ?include_future_regions:resource_data_sync_include_future_regions ->
      ?aws_organizations_source:resource_data_sync_aws_organizations_source
        ->
        source_regions:resource_data_sync_source_region_list ->
          source_type:resource_data_sync_source_type ->
            unit -> resource_data_sync_source
val make_update_resource_data_sync_request :
  sync_source:resource_data_sync_source ->
    sync_type:resource_data_sync_type ->
      sync_name:resource_data_sync_name ->
        unit -> update_resource_data_sync_request
val make_patch_filter :
  values:patch_filter_value_list ->
    key:patch_filter_key -> unit -> patch_filter
val make_patch_filter_group :
  patch_filters:patch_filter_list -> unit -> patch_filter_group
val make_patch_rule :
  ?enable_non_security:boolean_ ->
    ?approve_until_date:patch_string_date_time ->
      ?approve_after_days:approve_after_days ->
        ?compliance_level:patch_compliance_level ->
          patch_filter_group:patch_filter_group -> unit -> patch_rule
val make_patch_rule_group :
  patch_rules:patch_rule_list -> unit -> patch_rule_group
val make_patch_source :
  configuration:patch_source_configuration ->
    products:patch_source_product_list ->
      name:patch_source_name -> unit -> patch_source
val make_update_patch_baseline_request :
  ?replace:boolean_ ->
    ?available_security_updates_compliance_status:patch_compliance_status ->
      ?sources:patch_source_list ->
        ?description:baseline_description ->
          ?rejected_patches_action:patch_action ->
            ?rejected_patches:patch_id_list ->
              ?approved_patches_enable_non_security:boolean_ ->
                ?approved_patches_compliance_level:patch_compliance_level ->
                  ?approved_patches:patch_id_list ->
                    ?approval_rules:patch_rule_group ->
                      ?global_filters:patch_filter_group ->
                        ?name:baseline_name ->
                          baseline_id:baseline_id ->
                            unit -> update_patch_baseline_request
val make_metadata_value :
  ?value:metadata_value_string -> unit -> metadata_value
val make_update_ops_metadata_request :
  ?keys_to_delete:metadata_keys_to_delete_list ->
    ?metadata_to_update:metadata_map ->
      ops_metadata_arn:ops_metadata_arn ->
        unit -> update_ops_metadata_request
val make_update_ops_item_response : unit -> unit
val make_ops_item_data_value :
  ?type_:ops_item_data_type ->
    ?value:ops_item_data_value_string -> unit -> ops_item_data_value
val make_ops_item_notification :
  ?arn:string_ -> unit -> ops_item_notification
val make_related_ops_item : ops_item_id:string_ -> unit -> related_ops_item
val make_update_ops_item_request :
  ?ops_item_arn:ops_item_arn ->
    ?planned_end_time:date_time ->
      ?planned_start_time:date_time ->
        ?actual_end_time:date_time ->
          ?actual_start_time:date_time ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?title:ops_item_title ->
                  ?status:ops_item_status ->
                    ?related_ops_items:related_ops_items ->
                      ?priority:ops_item_priority ->
                        ?notifications:ops_item_notifications ->
                          ?operational_data_to_delete:ops_item_ops_data_keys_list
                            ->
                            ?operational_data:ops_item_operational_data ->
                              ?description:ops_item_description ->
                                ops_item_id:ops_item_id ->
                                  unit -> update_ops_item_request
val make_update_managed_instance_role_request :
  iam_role:iam_role ->
    instance_id:managed_instance_id ->
      unit -> update_managed_instance_role_request
val make_target : ?values:target_values -> ?key:target_key -> unit -> target
val make_maintenance_window_task_parameter_value_expression :
  ?values:maintenance_window_task_parameter_value_list ->
    unit -> maintenance_window_task_parameter_value_expression
val make_cloud_watch_output_config :
  ?cloud_watch_output_enabled:cloud_watch_output_enabled ->
    ?cloud_watch_log_group_name:cloud_watch_log_group_name ->
      unit -> cloud_watch_output_config
val make_notification_config :
  ?notification_type:notification_type ->
    ?notification_events:notification_event_list ->
      ?notification_arn:notification_arn -> unit -> notification_config
val make_maintenance_window_run_command_parameters :
  ?timeout_seconds:timeout_seconds ->
    ?service_role_arn:service_role ->
      ?parameters:parameters ->
        ?output_s3_key_prefix:s3_key_prefix ->
          ?output_s3_bucket_name:s3_bucket_name ->
            ?notification_config:notification_config ->
              ?document_version:document_version ->
                ?document_hash_type:document_hash_type ->
                  ?document_hash:document_hash ->
                    ?cloud_watch_output_config:cloud_watch_output_config ->
                      ?comment:comment ->
                        unit -> maintenance_window_run_command_parameters
val make_maintenance_window_automation_parameters :
  ?parameters:automation_parameter_map ->
    ?document_version:document_version ->
      unit -> maintenance_window_automation_parameters
val make_maintenance_window_step_functions_parameters :
  ?name:maintenance_window_step_functions_name ->
    ?input:maintenance_window_step_functions_input ->
      unit -> maintenance_window_step_functions_parameters
val make_maintenance_window_lambda_parameters :
  ?payload:maintenance_window_lambda_payload ->
    ?qualifier:maintenance_window_lambda_qualifier ->
      ?client_context:maintenance_window_lambda_client_context ->
        unit -> maintenance_window_lambda_parameters
val make_maintenance_window_task_invocation_parameters :
  ?lambda:maintenance_window_lambda_parameters ->
    ?step_functions:maintenance_window_step_functions_parameters ->
      ?automation:maintenance_window_automation_parameters ->
        ?run_command:maintenance_window_run_command_parameters ->
          unit -> maintenance_window_task_invocation_parameters
val make_logging_info :
  ?s3_key_prefix:s3_key_prefix ->
    s3_region:s3_region ->
      s3_bucket_name:s3_bucket_name -> unit -> logging_info
val make_alarm : name:alarm_name -> unit -> alarm
val make_alarm_configuration :
  ?ignore_poll_alarm_failure:boolean_ ->
    alarms:alarm_list -> unit -> alarm_configuration
val make_update_maintenance_window_task_request :
  ?alarm_configuration:alarm_configuration ->
    ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
      ?replace:boolean_ ->
        ?description:maintenance_window_description ->
          ?name:maintenance_window_name ->
            ?logging_info:logging_info ->
              ?max_errors:max_errors ->
                ?max_concurrency:max_concurrency ->
                  ?priority:maintenance_window_task_priority ->
                    ?task_invocation_parameters:maintenance_window_task_invocation_parameters
                      ->
                      ?task_parameters:maintenance_window_task_parameters ->
                        ?service_role_arn:service_role ->
                          ?task_arn:maintenance_window_task_arn ->
                            ?targets:targets ->
                              window_task_id:maintenance_window_task_id ->
                                window_id:maintenance_window_id ->
                                  unit ->
                                    update_maintenance_window_task_request
val make_update_maintenance_window_target_request :
  ?replace:boolean_ ->
    ?description:maintenance_window_description ->
      ?name:maintenance_window_name ->
        ?owner_information:owner_information ->
          ?targets:targets ->
            window_target_id:maintenance_window_target_id ->
              window_id:maintenance_window_id ->
                unit -> update_maintenance_window_target_request
val make_update_maintenance_window_request :
  ?replace:boolean_ ->
    ?enabled:maintenance_window_enabled ->
      ?allow_unassociated_targets:maintenance_window_allow_unassociated_targets
        ->
        ?cutoff:maintenance_window_cutoff ->
          ?duration:maintenance_window_duration_hours ->
            ?schedule_offset:maintenance_window_offset ->
              ?schedule_timezone:maintenance_window_timezone ->
                ?schedule:maintenance_window_schedule ->
                  ?end_date:maintenance_window_string_date_time ->
                    ?start_date:maintenance_window_string_date_time ->
                      ?description:maintenance_window_description ->
                        ?name:maintenance_window_name ->
                          window_id:maintenance_window_id ->
                            unit -> update_maintenance_window_request
val make_document_parameter :
  ?default_value:document_parameter_default_value ->
    ?description:document_parameter_descrption ->
      ?type_:document_parameter_type ->
        ?name:document_parameter_name -> unit -> document_parameter
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_attachment_information :
  ?name:attachment_name -> unit -> attachment_information
val make_document_requires :
  ?version_name:document_version_name ->
    ?require_type:require_type ->
      ?version:document_version ->
        name:document_ar_n -> unit -> document_requires
val make_review_information :
  ?reviewer:reviewer ->
    ?status:review_status ->
      ?reviewed_time:date_time -> unit -> review_information
val make_document_description :
  ?category_enum:category_enum_list ->
    ?category:category_list ->
      ?review_status:review_status ->
        ?pending_review_version:document_version ->
          ?approved_version:document_version ->
            ?review_information:review_information_list ->
              ?author:document_author ->
                ?requires:document_requires_list ->
                  ?attachments_information:attachment_information_list ->
                    ?tags:tag_list ->
                      ?target_type:target_type ->
                        ?document_format:document_format ->
                          ?default_version:document_version ->
                            ?latest_version:document_version ->
                              ?schema_version:document_schema_version ->
                                ?document_type:document_type ->
                                  ?platform_types:platform_type_list ->
                                    ?parameters:document_parameter_list ->
                                      ?description:description_in_document ->
                                        ?document_version:document_version ->
                                          ?status_information:document_status_information
                                            ->
                                            ?status:document_status ->
                                              ?created_date:date_time ->
                                                ?owner:document_owner ->
                                                  ?version_name:document_version_name
                                                    ->
                                                    ?display_name:document_display_name
                                                      ->
                                                      ?name:document_ar_n ->
                                                        ?hash_type:document_hash_type
                                                          ->
                                                          ?hash:document_hash
                                                            ->
                                                            ?sha1:document_sha1
                                                              ->
                                                              unit ->
                                                                document_description
val make_attachments_source :
  ?name:attachment_identifier ->
    ?values:attachments_source_values ->
      ?key:attachments_source_key -> unit -> attachments_source
val make_update_document_request :
  ?target_type:target_type ->
    ?document_format:document_format ->
      ?document_version:document_version ->
        ?version_name:document_version_name ->
          ?display_name:document_display_name ->
            ?attachments:attachments_source_list ->
              name:document_name ->
                content:document_content -> unit -> update_document_request
val make_update_document_metadata_response : unit -> unit
val make_document_review_comment_source :
  ?content:document_review_comment ->
    ?type_:document_review_comment_type ->
      unit -> document_review_comment_source
val make_document_reviews :
  ?comment:document_review_comment_list ->
    action:document_review_action -> unit -> document_reviews
val make_update_document_metadata_request :
  ?document_version:document_version ->
    document_reviews:document_reviews ->
      name:document_name -> unit -> update_document_metadata_request
val make_document_default_version_description :
  ?default_version_name:document_version_name ->
    ?default_version:document_version ->
      ?name:document_name -> unit -> document_default_version_description
val make_update_document_default_version_request :
  document_version:document_version_number ->
    name:document_name -> unit -> update_document_default_version_request
val make_association_status :
  ?additional_info:status_additional_info ->
    message:status_message ->
      name:association_status_name ->
        date:date_time -> unit -> association_status
val make_association_overview :
  ?association_status_aggregated_count:association_status_aggregated_count ->
    ?detailed_status:status_name ->
      ?status:status_name -> unit -> association_overview
val make_s3_output_location :
  ?output_s3_key_prefix:s3_key_prefix ->
    ?output_s3_bucket_name:s3_bucket_name ->
      ?output_s3_region:s3_region -> unit -> s3_output_location
val make_instance_association_output_location :
  ?s3_location:s3_output_location ->
    unit -> instance_association_output_location
val make_target_location :
  ?targets_max_errors:max_errors ->
    ?targets_max_concurrency:max_concurrency ->
      ?targets:targets ->
        ?exclude_accounts:exclude_accounts ->
          ?include_child_organization_units:boolean_ ->
            ?target_location_alarm_configuration:alarm_configuration ->
              ?execution_role_name:execution_role_name ->
                ?target_location_max_errors:max_errors ->
                  ?target_location_max_concurrency:max_concurrency ->
                    ?regions:regions ->
                      ?accounts:accounts -> unit -> target_location
val make_alarm_state_information :
  state:external_alarm_state ->
    name:alarm_name -> unit -> alarm_state_information
val make_association_description :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?target_maps:target_maps ->
        ?duration:duration ->
          ?schedule_offset:schedule_offset ->
            ?target_locations:target_locations ->
              ?calendar_names:calendar_name_or_arn_list ->
                ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                  ?sync_compliance:association_sync_compliance ->
                    ?compliance_severity:association_compliance_severity ->
                      ?max_concurrency:max_concurrency ->
                        ?max_errors:max_errors ->
                          ?association_name:association_name ->
                            ?last_successful_execution_date:date_time ->
                              ?last_execution_date:date_time ->
                                ?output_location:instance_association_output_location
                                  ->
                                  ?schedule_expression:schedule_expression ->
                                    ?targets:targets ->
                                      ?association_id:association_id ->
                                        ?parameters:parameters ->
                                          ?automation_target_parameter_name:automation_target_parameter_name
                                            ->
                                            ?document_version:document_version
                                              ->
                                              ?overview:association_overview
                                                ->
                                                ?status:association_status ->
                                                  ?last_update_association_date:date_time
                                                    ->
                                                    ?date:date_time ->
                                                      ?association_version:association_version
                                                        ->
                                                        ?instance_id:instance_id
                                                          ->
                                                          ?name:document_ar_n
                                                            ->
                                                            unit ->
                                                              association_description
val make_update_association_status_request :
  association_status:association_status ->
    instance_id:instance_id ->
      name:document_ar_n -> unit -> update_association_status_request
val make_update_association_request :
  ?alarm_configuration:alarm_configuration ->
    ?target_maps:target_maps ->
      ?duration:duration ->
        ?schedule_offset:schedule_offset ->
          ?target_locations:target_locations ->
            ?calendar_names:calendar_name_or_arn_list ->
              ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                ?sync_compliance:association_sync_compliance ->
                  ?compliance_severity:association_compliance_severity ->
                    ?max_concurrency:max_concurrency ->
                      ?max_errors:max_errors ->
                        ?automation_target_parameter_name:automation_target_parameter_name
                          ->
                          ?association_version:association_version ->
                            ?association_name:association_name ->
                              ?targets:targets ->
                                ?name:document_ar_n ->
                                  ?output_location:instance_association_output_location
                                    ->
                                    ?schedule_expression:schedule_expression
                                      ->
                                      ?document_version:document_version ->
                                        ?parameters:parameters ->
                                          association_id:association_id ->
                                            unit ->
                                              update_association_request
val make_unlabel_parameter_version_request :
  labels:parameter_label_list ->
    parameter_version:ps_parameter_version ->
      name:ps_parameter_name -> unit -> unlabel_parameter_version_request
val make_terminate_session_response :
  ?session_id:session_id -> unit -> terminate_session_response
val make_terminate_session_request :
  session_id:session_id -> unit -> terminate_session_request
val make_target_preview :
  ?target_type:string_ -> ?count:integer -> unit -> target_preview
val make_stop_automation_execution_request :
  ?type_:stop_type ->
    automation_execution_id:automation_execution_id ->
      unit -> stop_automation_execution_request
val make_failure_details :
  ?details:automation_parameter_map ->
    ?failure_type:string_ ->
      ?failure_stage:string_ -> unit -> failure_details
val make_parent_step_details :
  ?iterator_value:string_ ->
    ?iteration:integer ->
      ?action:automation_action_name ->
        ?step_name:string_ ->
          ?step_execution_id:string_ -> unit -> parent_step_details
val make_step_execution :
  ?parent_step_details:parent_step_details ->
    ?triggered_alarms:alarm_state_information_list ->
      ?target_location:target_location ->
        ?targets:targets ->
          ?valid_next_steps:valid_next_step_list ->
            ?is_critical:boolean_ ->
              ?next_step:string_ ->
                ?is_end:boolean_ ->
                  ?overridden_parameters:automation_parameter_map ->
                    ?step_execution_id:string_ ->
                      ?failure_details:failure_details ->
                        ?failure_message:string_ ->
                          ?response:string_ ->
                            ?outputs:automation_parameter_map ->
                              ?inputs:normal_string_map ->
                                ?response_code:string_ ->
                                  ?step_status:automation_execution_status ->
                                    ?execution_end_time:date_time ->
                                      ?execution_start_time:date_time ->
                                        ?max_attempts:integer ->
                                          ?on_failure:string_ ->
                                            ?timeout_seconds:long ->
                                              ?action:automation_action_name
                                                ->
                                                ?step_name:string_ ->
                                                  unit -> step_execution
val make_step_execution_filter :
  values:step_execution_filter_value_list ->
    key:step_execution_filter_key -> unit -> step_execution_filter
val make_start_session_response :
  ?stream_url:stream_url ->
    ?token_value:token_value ->
      ?session_id:session_id -> unit -> start_session_response
val make_start_session_request :
  ?parameters:session_manager_parameters ->
    ?reason:session_reason ->
      ?document_name:document_ar_n ->
        target:session_target -> unit -> start_session_request
val make_start_execution_preview_response :
  ?execution_preview_id:execution_preview_id ->
    unit -> start_execution_preview_response
val make_automation_execution_inputs :
  ?target_locations_ur_l:target_locations_ur_l ->
    ?target_locations:target_locations ->
      ?target_maps:target_maps ->
        ?targets:targets ->
          ?target_parameter_name:automation_parameter_key ->
            ?parameters:automation_parameter_map ->
              unit -> automation_execution_inputs
val make_start_execution_preview_request :
  ?execution_inputs:execution_inputs ->
    ?document_version:document_version ->
      document_name:document_name -> unit -> start_execution_preview_request
val make_runbook :
  ?target_locations:target_locations ->
    ?max_errors:max_errors ->
      ?max_concurrency:max_concurrency ->
        ?target_maps:target_maps ->
          ?targets:targets ->
            ?target_parameter_name:automation_parameter_key ->
              ?parameters:automation_parameter_map ->
                ?document_version:document_version ->
                  document_name:document_ar_n -> unit -> runbook
val make_start_change_request_execution_request :
  ?change_details:change_details_value ->
    ?scheduled_end_time:date_time ->
      ?tags:tag_list ->
        ?auto_approve:boolean_ ->
          ?client_token:idempotency_token ->
            ?change_request_name:change_request_name ->
              ?parameters:automation_parameter_map ->
                ?document_version:document_version ->
                  ?scheduled_time:date_time ->
                    runbooks:runbooks ->
                      document_name:document_ar_n ->
                        unit -> start_change_request_execution_request
val make_start_automation_execution_request :
  ?target_locations_ur_l:target_locations_ur_l ->
    ?alarm_configuration:alarm_configuration ->
      ?tags:tag_list ->
        ?target_locations:target_locations ->
          ?max_errors:max_errors ->
            ?max_concurrency:max_concurrency ->
              ?target_maps:target_maps ->
                ?targets:targets ->
                  ?target_parameter_name:automation_parameter_key ->
                    ?mode:execution_mode ->
                      ?client_token:idempotency_token ->
                        ?parameters:automation_parameter_map ->
                          ?document_version:document_version ->
                            document_name:document_ar_n ->
                              unit -> start_automation_execution_request
val make_start_associations_once_request :
  association_ids:association_id_list ->
    unit -> start_associations_once_request
val make_start_access_request_response :
  ?access_request_id:access_request_id ->
    unit -> start_access_request_response
val make_start_access_request_request :
  ?tags:tag_list ->
    targets:targets ->
      reason:string1to256 -> unit -> start_access_request_request
val make_severity_summary :
  ?unspecified_count:compliance_summary_count ->
    ?informational_count:compliance_summary_count ->
      ?low_count:compliance_summary_count ->
        ?medium_count:compliance_summary_count ->
          ?high_count:compliance_summary_count ->
            ?critical_count:compliance_summary_count ->
              unit -> severity_summary
val make_session_manager_output_url :
  ?cloud_watch_output_url:session_manager_cloud_watch_output_url ->
    ?s3_output_url:session_manager_s3_output_url ->
      unit -> session_manager_output_url
val make_session :
  ?access_type:access_type ->
    ?max_session_duration:max_session_duration ->
      ?output_url:session_manager_output_url ->
        ?details:session_details ->
          ?reason:session_reason ->
            ?owner:session_owner ->
              ?document_name:document_name ->
                ?end_date:date_time ->
                  ?start_date:date_time ->
                    ?status:session_status ->
                      ?target:session_target ->
                        ?session_id:session_id -> unit -> session
val make_session_filter :
  value:session_filter_value ->
    key:session_filter_key -> unit -> session_filter
val make_service_setting :
  ?status:string_ ->
    ?ar_n:string_ ->
      ?last_modified_user:string_ ->
        ?last_modified_date:date_time ->
          ?setting_value:service_setting_value ->
            ?setting_id:service_setting_id -> unit -> service_setting
val make_command :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?timeout_seconds:timeout_seconds ->
        ?cloud_watch_output_config:cloud_watch_output_config ->
          ?notification_config:notification_config ->
            ?service_role:service_role ->
              ?delivery_timed_out_count:delivery_timed_out_count ->
                ?error_count:error_count ->
                  ?completed_count:completed_count ->
                    ?target_count:target_count ->
                      ?max_errors:max_errors ->
                        ?max_concurrency:max_concurrency ->
                          ?output_s3_key_prefix:s3_key_prefix ->
                            ?output_s3_bucket_name:s3_bucket_name ->
                              ?output_s3_region:s3_region ->
                                ?status_details:status_details ->
                                  ?status:command_status ->
                                    ?requested_date_time:date_time ->
                                      ?targets:targets ->
                                        ?instance_ids:instance_id_list ->
                                          ?parameters:parameters ->
                                            ?expires_after:date_time ->
                                              ?comment:comment ->
                                                ?document_version:document_version
                                                  ->
                                                  ?document_name:document_name
                                                    ->
                                                    ?command_id:command_id ->
                                                      unit -> command
val make_send_command_request :
  ?alarm_configuration:alarm_configuration ->
    ?cloud_watch_output_config:cloud_watch_output_config ->
      ?notification_config:notification_config ->
        ?service_role_arn:service_role ->
          ?max_errors:max_errors ->
            ?max_concurrency:max_concurrency ->
              ?output_s3_key_prefix:s3_key_prefix ->
                ?output_s3_bucket_name:s3_bucket_name ->
                  ?output_s3_region:s3_region ->
                    ?parameters:parameters ->
                      ?comment:comment ->
                        ?timeout_seconds:timeout_seconds ->
                          ?document_hash_type:document_hash_type ->
                            ?document_hash:document_hash ->
                              ?document_version:document_version ->
                                ?targets:targets ->
                                  ?instance_ids:instance_id_list ->
                                    document_name:document_ar_n ->
                                      unit -> send_command_request
val make_send_automation_signal_request :
  ?payload:automation_parameter_map ->
    signal_type:signal_type ->
      automation_execution_id:automation_execution_id ->
        unit -> send_automation_signal_request
val make_scheduled_window_execution :
  ?execution_time:maintenance_window_string_date_time ->
    ?name:maintenance_window_name ->
      ?window_id:maintenance_window_id -> unit -> scheduled_window_execution
val make_s3_output_url : ?output_url:url -> unit -> s3_output_url
val make_resume_session_response :
  ?stream_url:stream_url ->
    ?token_value:token_value ->
      ?session_id:session_id -> unit -> resume_session_response
val make_resume_session_request :
  session_id:session_id -> unit -> resume_session_request
val make_result_attribute :
  type_name:inventory_item_type_name -> unit -> result_attribute
val make_resource_data_sync_source_with_state :
  ?enable_all_ops_data_sources:resource_data_sync_enable_all_ops_data_sources
    ->
    ?state:resource_data_sync_state ->
      ?include_future_regions:resource_data_sync_include_future_regions ->
        ?source_regions:resource_data_sync_source_region_list ->
          ?aws_organizations_source:resource_data_sync_aws_organizations_source
            ->
            ?source_type:resource_data_sync_source_type ->
              unit -> resource_data_sync_source_with_state
val make_resource_data_sync_destination_data_sharing :
  ?destination_data_sharing_type:resource_data_sync_destination_data_sharing_type
    -> unit -> resource_data_sync_destination_data_sharing
val make_resource_data_sync_s3_destination :
  ?destination_data_sharing:resource_data_sync_destination_data_sharing ->
    ?awskms_key_ar_n:resource_data_sync_awskms_key_ar_n ->
      ?prefix:resource_data_sync_s3_prefix ->
        region:resource_data_sync_s3_region ->
          sync_format:resource_data_sync_s3_format ->
            bucket_name:resource_data_sync_s3_bucket_name ->
              unit -> resource_data_sync_s3_destination
val make_resource_data_sync_item :
  ?last_sync_status_message:last_resource_data_sync_message ->
    ?sync_created_time:resource_data_sync_created_time ->
      ?last_status:last_resource_data_sync_status ->
        ?sync_last_modified_time:resource_data_sync_last_modified_time ->
          ?last_successful_sync_time:last_successful_resource_data_sync_time
            ->
            ?last_sync_time:last_resource_data_sync_time ->
              ?s3_destination:resource_data_sync_s3_destination ->
                ?sync_source:resource_data_sync_source_with_state ->
                  ?sync_type:resource_data_sync_type ->
                    ?sync_name:resource_data_sync_name ->
                      unit -> resource_data_sync_item
val make_compliance_execution_summary :
  ?execution_type:compliance_execution_type ->
    ?execution_id:compliance_execution_id ->
      execution_time:date_time -> unit -> compliance_execution_summary
val make_compliant_summary :
  ?severity_summary:severity_summary ->
    ?compliant_count:compliance_summary_count -> unit -> compliant_summary
val make_non_compliant_summary :
  ?severity_summary:severity_summary ->
    ?non_compliant_count:compliance_summary_count ->
      unit -> non_compliant_summary
val make_resource_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
    ?compliant_summary:compliant_summary ->
      ?execution_summary:compliance_execution_summary ->
        ?overall_severity:compliance_severity ->
          ?status:compliance_status ->
            ?resource_id:compliance_resource_id ->
              ?resource_type:compliance_resource_type ->
                ?compliance_type:compliance_type_name ->
                  unit -> resource_compliance_summary_item
val make_resolved_targets :
  ?truncated:boolean_ ->
    ?parameter_values:target_parameter_list -> unit -> resolved_targets
val make_reset_service_setting_request :
  setting_id:service_setting_id -> unit -> reset_service_setting_request
val make_remove_tags_from_resource_request :
  tag_keys:key_list ->
    resource_id:resource_id ->
      resource_type:resource_type_for_tagging ->
        unit -> remove_tags_from_resource_request
val make_registration_metadata_item :
  value:registration_metadata_value ->
    key:registration_metadata_key -> unit -> registration_metadata_item
val make_register_task_with_maintenance_window_request :
  ?alarm_configuration:alarm_configuration ->
    ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
      ?client_token:client_token ->
        ?description:maintenance_window_description ->
          ?name:maintenance_window_name ->
            ?logging_info:logging_info ->
              ?max_errors:max_errors ->
                ?max_concurrency:max_concurrency ->
                  ?priority:maintenance_window_task_priority ->
                    ?task_invocation_parameters:maintenance_window_task_invocation_parameters
                      ->
                      ?task_parameters:maintenance_window_task_parameters ->
                        ?service_role_arn:service_role ->
                          ?targets:targets ->
                            task_type:maintenance_window_task_type ->
                              task_arn:maintenance_window_task_arn ->
                                window_id:maintenance_window_id ->
                                  unit ->
                                    register_task_with_maintenance_window_request
val make_register_target_with_maintenance_window_request :
  ?client_token:client_token ->
    ?description:maintenance_window_description ->
      ?name:maintenance_window_name ->
        ?owner_information:owner_information ->
          targets:targets ->
            resource_type:maintenance_window_resource_type ->
              window_id:maintenance_window_id ->
                unit -> register_target_with_maintenance_window_request
val make_register_patch_baseline_for_patch_group_request :
  patch_group:patch_group ->
    baseline_id:baseline_id ->
      unit -> register_patch_baseline_for_patch_group_request
val make_register_default_patch_baseline_request :
  baseline_id:baseline_id -> unit -> register_default_patch_baseline_request
val make_put_resource_policy_response :
  ?policy_hash:policy_hash ->
    ?policy_id:policy_id -> unit -> put_resource_policy_response
val make_put_resource_policy_request :
  ?policy_hash:policy_hash ->
    ?policy_id:policy_id ->
      policy:policy ->
        resource_arn:resource_arn_string ->
          unit -> put_resource_policy_request
val make_put_parameter_request :
  ?data_type:parameter_data_type ->
    ?policies:parameter_policies ->
      ?tier:parameter_tier ->
        ?tags:tag_list ->
          ?allowed_pattern:allowed_pattern ->
            ?overwrite:boolean_ ->
              ?key_id:parameter_key_id ->
                ?type_:parameter_type ->
                  ?description:parameter_description ->
                    value:ps_parameter_value ->
                      name:ps_parameter_name -> unit -> put_parameter_request
val make_inventory_item :
  ?context:inventory_item_content_context ->
    ?content:inventory_item_entry_list ->
      ?content_hash:inventory_item_content_hash ->
        capture_time:inventory_item_capture_time ->
          schema_version:inventory_item_schema_version ->
            type_name:inventory_item_type_name -> unit -> inventory_item
val make_put_inventory_request :
  items:inventory_item_list ->
    instance_id:instance_id -> unit -> put_inventory_request
val make_compliance_item_entry :
  ?details:compliance_item_details ->
    ?title:compliance_item_title ->
      ?id:compliance_item_id ->
        status:compliance_status ->
          severity:compliance_severity -> unit -> compliance_item_entry
val make_put_compliance_items_request :
  ?upload_type:compliance_upload_type ->
    ?item_content_hash:compliance_item_content_hash ->
      items:compliance_item_entry_list ->
        execution_summary:compliance_execution_summary ->
          compliance_type:compliance_type_name ->
            resource_type:compliance_resource_type ->
              resource_id:compliance_resource_id ->
                unit -> put_compliance_items_request
val make_progress_counters :
  ?timed_out_steps:integer ->
    ?cancelled_steps:integer ->
      ?failed_steps:integer ->
        ?success_steps:integer ->
          ?total_steps:integer -> unit -> progress_counters
val make_patch_status :
  ?approval_date:date_time ->
    ?compliance_level:patch_compliance_level ->
      ?deployment_status:patch_deployment_status -> unit -> patch_status
val make_patch_orchestrator_filter :
  ?values:patch_orchestrator_filter_values ->
    ?key:patch_orchestrator_filter_key -> unit -> patch_orchestrator_filter
val make_patch :
  ?repository:patch_repository ->
    ?severity:patch_severity ->
      ?arch:patch_arch ->
        ?release:patch_release ->
          ?version:patch_version ->
            ?epoch:patch_epoch ->
              ?name:patch_name ->
                ?cve_ids:patch_cve_id_list ->
                  ?bugzilla_ids:patch_bugzilla_id_list ->
                    ?advisory_ids:patch_advisory_id_list ->
                      ?language:patch_language ->
                        ?msrc_number:patch_msrc_number ->
                          ?kb_number:patch_kb_number ->
                            ?msrc_severity:patch_msrc_severity ->
                              ?classification:patch_classification ->
                                ?product:patch_product ->
                                  ?product_family:patch_product_family ->
                                    ?vendor:patch_vendor ->
                                      ?content_url:patch_content_url ->
                                        ?description:patch_description ->
                                          ?title:patch_title ->
                                            ?release_date:date_time ->
                                              ?id:patch_id -> unit -> patch
val make_patch_baseline_identity :
  ?default_baseline:default_baseline ->
    ?baseline_description:baseline_description ->
      ?operating_system:operating_system ->
        ?baseline_name:baseline_name ->
          ?baseline_id:baseline_id -> unit -> patch_baseline_identity
val make_patch_group_patch_baseline_mapping :
  ?baseline_identity:patch_baseline_identity ->
    ?patch_group:patch_group -> unit -> patch_group_patch_baseline_mapping
val make_patch_compliance_data :
  ?cve_ids:patch_cve_ids ->
    installed_time:date_time ->
      state:patch_compliance_data_state ->
        severity:patch_severity ->
          classification:patch_classification ->
            kb_id:patch_kb_number ->
              title:patch_title -> unit -> patch_compliance_data
val make_parameters_filter :
  values:parameters_filter_value_list ->
    key:parameters_filter_key -> unit -> parameters_filter
val make_parameter_string_filter :
  ?values:parameter_string_filter_value_list ->
    ?option_:parameter_string_query_option ->
      key:parameter_string_filter_key -> unit -> parameter_string_filter
val make_parameter_inline_policy :
  ?policy_status:string_ ->
    ?policy_type:string_ ->
      ?policy_text:string_ -> unit -> parameter_inline_policy
val make_parameter_metadata :
  ?data_type:parameter_data_type ->
    ?policies:parameter_policy_list ->
      ?tier:parameter_tier ->
        ?version:ps_parameter_version ->
          ?allowed_pattern:allowed_pattern ->
            ?description:parameter_description ->
              ?last_modified_user:string_ ->
                ?last_modified_date:date_time ->
                  ?key_id:parameter_key_id ->
                    ?type_:parameter_type ->
                      ?ar_n:string_ ->
                        ?name:ps_parameter_name -> unit -> parameter_metadata
val make_parameter :
  ?data_type:parameter_data_type ->
    ?ar_n:string_ ->
      ?last_modified_date:date_time ->
        ?source_result:string_ ->
          ?selector:ps_parameter_selector ->
            ?version:ps_parameter_version ->
              ?value:ps_parameter_value ->
                ?type_:parameter_type ->
                  ?name:ps_parameter_name -> unit -> parameter
val make_parameter_history :
  ?data_type:parameter_data_type ->
    ?policies:parameter_policy_list ->
      ?tier:parameter_tier ->
        ?labels:parameter_label_list ->
          ?version:ps_parameter_version ->
            ?allowed_pattern:allowed_pattern ->
              ?value:ps_parameter_value ->
                ?description:parameter_description ->
                  ?last_modified_user:string_ ->
                    ?last_modified_date:date_time ->
                      ?key_id:parameter_key_id ->
                        ?type_:parameter_type ->
                          ?name:ps_parameter_name ->
                            unit -> parameter_history
val make_output_source :
  ?output_source_type:output_source_type ->
    ?output_source_id:output_source_id -> unit -> output_source
val make_ops_result_attribute :
  type_name:ops_data_type_name -> unit -> ops_result_attribute
val make_ops_metadata :
  ?creation_date:date_time ->
    ?last_modified_user:string_ ->
      ?last_modified_date:date_time ->
        ?ops_metadata_arn:ops_metadata_arn ->
          ?resource_id:ops_metadata_resource_id -> unit -> ops_metadata
val make_ops_metadata_filter :
  values:ops_metadata_filter_value_list ->
    key:ops_metadata_filter_key -> unit -> ops_metadata_filter
val make_ops_item_summary :
  ?planned_end_time:date_time ->
    ?planned_start_time:date_time ->
      ?actual_end_time:date_time ->
        ?actual_start_time:date_time ->
          ?ops_item_type:ops_item_type ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?operational_data:ops_item_operational_data ->
                  ?title:ops_item_title ->
                    ?ops_item_id:ops_item_id ->
                      ?status:ops_item_status ->
                        ?source:ops_item_source ->
                          ?priority:ops_item_priority ->
                            ?last_modified_time:date_time ->
                              ?last_modified_by:string_ ->
                                ?created_time:date_time ->
                                  ?created_by:string_ ->
                                    unit -> ops_item_summary
val make_ops_item_related_items_filter :
  operator:ops_item_related_items_filter_operator ->
    values:ops_item_related_items_filter_values ->
      key:ops_item_related_items_filter_key ->
        unit -> ops_item_related_items_filter
val make_ops_item_identity : ?arn:string_ -> unit -> ops_item_identity
val make_ops_item_related_item_summary :
  ?last_modified_time:date_time ->
    ?last_modified_by:ops_item_identity ->
      ?created_time:date_time ->
        ?created_by:ops_item_identity ->
          ?resource_uri:ops_item_related_item_association_resource_uri ->
            ?association_type:ops_item_related_item_association_type ->
              ?resource_type:ops_item_related_item_association_resource_type
                ->
                ?association_id:ops_item_related_item_association_id ->
                  ?ops_item_id:ops_item_id ->
                    unit -> ops_item_related_item_summary
val make_ops_item_filter :
  operator:ops_item_filter_operator ->
    values:ops_item_filter_values ->
      key:ops_item_filter_key -> unit -> ops_item_filter
val make_ops_item_event_summary :
  ?created_time:date_time ->
    ?created_by:ops_item_identity ->
      ?detail:string_ ->
        ?detail_type:string_ ->
          ?source:string_ ->
            ?event_id:string_ ->
              ?ops_item_id:string_ -> unit -> ops_item_event_summary
val make_ops_item_event_filter :
  operator:ops_item_event_filter_operator ->
    values:ops_item_event_filter_values ->
      key:ops_item_event_filter_key -> unit -> ops_item_event_filter
val make_ops_item :
  ?ops_item_arn:ops_item_arn ->
    ?planned_end_time:date_time ->
      ?planned_start_time:date_time ->
        ?actual_end_time:date_time ->
          ?actual_start_time:date_time ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?operational_data:ops_item_operational_data ->
                  ?source:ops_item_source ->
                    ?title:ops_item_title ->
                      ?version:string_ ->
                        ?ops_item_id:ops_item_id ->
                          ?status:ops_item_status ->
                            ?related_ops_items:related_ops_items ->
                              ?priority:ops_item_priority ->
                                ?notifications:ops_item_notifications ->
                                  ?last_modified_time:date_time ->
                                    ?last_modified_by:string_ ->
                                      ?description:ops_item_description ->
                                        ?created_time:date_time ->
                                          ?ops_item_type:ops_item_type ->
                                            ?created_by:string_ ->
                                              unit -> ops_item
val make_ops_filter :
  ?type_:ops_filter_operator_type ->
    values:ops_filter_value_list -> key:ops_filter_key -> unit -> ops_filter
val make_ops_entity_item :
  ?content:ops_entity_item_entry_list ->
    ?capture_time:ops_entity_item_capture_time -> unit -> ops_entity_item
val make_ops_entity :
  ?data:ops_entity_item_map -> ?id:ops_entity_id -> unit -> ops_entity
val make_ops_aggregator :
  ?aggregators:ops_aggregator_list ->
    ?filters:ops_filter_list ->
      ?values:ops_aggregator_value_map ->
        ?attribute_name:ops_data_attribute_name ->
          ?type_name:ops_data_type_name ->
            ?aggregator_type:ops_aggregator_type -> unit -> ops_aggregator
val make_instance_info :
  ?resource_type:resource_type ->
    ?platform_version:platform_version ->
      ?platform_name:platform_name ->
        ?platform_type:platform_type ->
          ?managed_status:managed_status ->
            ?ip_address:ip_address ->
              ?instance_status:instance_status ->
                ?computer_name:computer_name ->
                  ?agent_version:agent_version ->
                    ?agent_type:agent_type -> unit -> instance_info
val make_node_owner_info :
  ?organizational_unit_path:node_organizational_unit_path ->
    ?organizational_unit_id:node_organizational_unit_id ->
      ?account_id:node_account_id -> unit -> node_owner_info
val make_node :
  ?node_type:node_type ->
    ?region:node_region ->
      ?owner:node_owner_info ->
        ?id:node_id -> ?capture_time:node_capture_time -> unit -> node
val make_node_filter :
  ?type_:node_filter_operator_type ->
    values:node_filter_value_list ->
      key:node_filter_key -> unit -> node_filter
val make_node_aggregator :
  ?aggregators:node_aggregator_list ->
    attribute_name:node_attribute_name ->
      type_name:node_type_name ->
        aggregator_type:node_aggregator_type -> unit -> node_aggregator
val make_modify_document_permission_response : unit -> unit
val make_modify_document_permission_request :
  ?shared_document_version:shared_document_version ->
    ?account_ids_to_remove:account_id_list ->
      ?account_ids_to_add:account_id_list ->
        permission_type:document_permission_type ->
          name:document_name -> unit -> modify_document_permission_request
val make_maintenance_window_identity_for_target :
  ?name:maintenance_window_name ->
    ?window_id:maintenance_window_id ->
      unit -> maintenance_window_identity_for_target
val make_maintenance_window_task :
  ?alarm_configuration:alarm_configuration ->
    ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
      ?description:maintenance_window_description ->
        ?name:maintenance_window_name ->
          ?max_errors:max_errors ->
            ?max_concurrency:max_concurrency ->
              ?service_role_arn:service_role ->
                ?logging_info:logging_info ->
                  ?priority:maintenance_window_task_priority ->
                    ?task_parameters:maintenance_window_task_parameters ->
                      ?targets:targets ->
                        ?type_:maintenance_window_task_type ->
                          ?task_arn:maintenance_window_task_arn ->
                            ?window_task_id:maintenance_window_task_id ->
                              ?window_id:maintenance_window_id ->
                                unit -> maintenance_window_task
val make_maintenance_window_target :
  ?description:maintenance_window_description ->
    ?name:maintenance_window_name ->
      ?owner_information:owner_information ->
        ?targets:targets ->
          ?resource_type:maintenance_window_resource_type ->
            ?window_target_id:maintenance_window_target_id ->
              ?window_id:maintenance_window_id ->
                unit -> maintenance_window_target
val make_maintenance_window_identity :
  ?next_execution_time:maintenance_window_string_date_time ->
    ?start_date:maintenance_window_string_date_time ->
      ?end_date:maintenance_window_string_date_time ->
        ?schedule_offset:maintenance_window_offset ->
          ?schedule_timezone:maintenance_window_timezone ->
            ?schedule:maintenance_window_schedule ->
              ?cutoff:maintenance_window_cutoff ->
                ?duration:maintenance_window_duration_hours ->
                  ?enabled:maintenance_window_enabled ->
                    ?description:maintenance_window_description ->
                      ?name:maintenance_window_name ->
                        ?window_id:maintenance_window_id ->
                          unit -> maintenance_window_identity
val make_maintenance_window_filter :
  ?values:maintenance_window_filter_values ->
    ?key:maintenance_window_filter_key -> unit -> maintenance_window_filter
val make_maintenance_window_execution_task_invocation_identity :
  ?window_target_id:maintenance_window_task_target_id ->
    ?owner_information:owner_information ->
      ?end_time:date_time ->
        ?start_time:date_time ->
          ?status_details:maintenance_window_execution_status_details ->
            ?status:maintenance_window_execution_status ->
              ?parameters:maintenance_window_execution_task_invocation_parameters
                ->
                ?task_type:maintenance_window_task_type ->
                  ?execution_id:maintenance_window_execution_task_execution_id
                    ->
                    ?invocation_id:maintenance_window_execution_task_invocation_id
                      ->
                      ?task_execution_id:maintenance_window_execution_task_id
                        ->
                        ?window_execution_id:maintenance_window_execution_id
                          ->
                          unit ->
                            maintenance_window_execution_task_invocation_identity
val make_maintenance_window_execution_task_identity :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?task_type:maintenance_window_task_type ->
        ?task_arn:maintenance_window_task_arn ->
          ?end_time:date_time ->
            ?start_time:date_time ->
              ?status_details:maintenance_window_execution_status_details ->
                ?status:maintenance_window_execution_status ->
                  ?task_execution_id:maintenance_window_execution_task_id ->
                    ?window_execution_id:maintenance_window_execution_id ->
                      unit -> maintenance_window_execution_task_identity
val make_maintenance_window_execution :
  ?end_time:date_time ->
    ?start_time:date_time ->
      ?status_details:maintenance_window_execution_status_details ->
        ?status:maintenance_window_execution_status ->
          ?window_execution_id:maintenance_window_execution_id ->
            ?window_id:maintenance_window_id ->
              unit -> maintenance_window_execution
val make_list_tags_for_resource_request :
  resource_id:resource_id ->
    resource_type:resource_type_for_tagging ->
      unit -> list_tags_for_resource_request
val make_list_resource_data_sync_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?sync_type:resource_data_sync_type ->
        unit -> list_resource_data_sync_request
val make_compliance_string_filter :
  ?type_:compliance_query_operator_type ->
    ?values:compliance_string_filter_value_list ->
      ?key:compliance_string_filter_key -> unit -> compliance_string_filter
val make_list_resource_compliance_summaries_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:compliance_string_filter_list ->
        unit -> list_resource_compliance_summaries_request
val make_list_ops_metadata_request :
  ?next_token:next_token ->
    ?max_results:list_ops_metadata_max_results ->
      ?filters:ops_metadata_filter_list -> unit -> list_ops_metadata_request
val make_list_ops_item_related_items_response :
  ?summaries:ops_item_related_item_summaries ->
    ?next_token:string_ -> unit -> list_ops_item_related_items_response
val make_list_ops_item_related_items_request :
  ?next_token:string_ ->
    ?max_results:ops_item_related_items_max_results ->
      ?filters:ops_item_related_items_filters ->
        ?ops_item_id:ops_item_id ->
          unit -> list_ops_item_related_items_request
val make_list_ops_item_events_response :
  ?summaries:ops_item_event_summaries ->
    ?next_token:string_ -> unit -> list_ops_item_events_response
val make_list_ops_item_events_request :
  ?next_token:string_ ->
    ?max_results:ops_item_event_max_results ->
      ?filters:ops_item_event_filters -> unit -> list_ops_item_events_request
val make_list_nodes_summary_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:node_filter_list ->
        ?sync_name:resource_data_sync_name ->
          aggregators:node_aggregator_list ->
            unit -> list_nodes_summary_request
val make_list_nodes_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:node_filter_list ->
        ?sync_name:resource_data_sync_name -> unit -> list_nodes_request
val make_inventory_filter :
  ?type_:inventory_query_operator_type ->
    values:inventory_filter_value_list ->
      key:inventory_filter_key -> unit -> inventory_filter
val make_list_inventory_entries_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:inventory_filter_list ->
        type_name:inventory_item_type_name ->
          instance_id:instance_id -> unit -> list_inventory_entries_request
val make_document_identifier :
  ?author:document_author ->
    ?review_status:review_status ->
      ?requires:document_requires_list ->
        ?tags:tag_list ->
          ?target_type:target_type ->
            ?document_format:document_format ->
              ?schema_version:document_schema_version ->
                ?document_type:document_type ->
                  ?document_version:document_version ->
                    ?platform_types:platform_type_list ->
                      ?version_name:document_version_name ->
                        ?owner:document_owner ->
                          ?display_name:document_display_name ->
                            ?created_date:date_time ->
                              ?name:document_ar_n ->
                                unit -> document_identifier
val make_document_filter :
  value:document_filter_value ->
    key:document_filter_key -> unit -> document_filter
val make_document_key_values_filter :
  ?values:document_key_values_filter_values ->
    ?key:document_key_values_filter_key -> unit -> document_key_values_filter
val make_list_documents_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:document_key_values_filter_list ->
        ?document_filter_list:document_filter_list ->
          unit -> list_documents_request
val make_document_version_info :
  ?review_status:review_status ->
    ?status_information:document_status_information ->
      ?status:document_status ->
        ?document_format:document_format ->
          ?is_default_version:boolean_ ->
            ?created_date:date_time ->
              ?version_name:document_version_name ->
                ?document_version:document_version ->
                  ?display_name:document_display_name ->
                    ?name:document_name -> unit -> document_version_info
val make_list_document_versions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      name:document_ar_n -> unit -> list_document_versions_request
val make_document_reviewer_response_source :
  ?reviewer:reviewer ->
    ?comment:document_review_comment_list ->
      ?review_status:review_status ->
        ?updated_time:date_time ->
          ?create_time:date_time -> unit -> document_reviewer_response_source
val make_document_metadata_response_info :
  ?reviewer_response:document_reviewer_response_list ->
    unit -> document_metadata_response_info
val make_list_document_metadata_history_response :
  ?next_token:next_token ->
    ?metadata:document_metadata_response_info ->
      ?author:document_author ->
        ?document_version:document_version ->
          ?name:document_name ->
            unit -> list_document_metadata_history_response
val make_list_document_metadata_history_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?document_version:document_version ->
        metadata:document_metadata_enum ->
          name:document_name ->
            unit -> list_document_metadata_history_request
val make_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
    ?compliant_summary:compliant_summary ->
      ?compliance_type:compliance_type_name ->
        unit -> compliance_summary_item
val make_list_compliance_summaries_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:compliance_string_filter_list ->
        unit -> list_compliance_summaries_request
val make_compliance_item :
  ?details:compliance_item_details ->
    ?execution_summary:compliance_execution_summary ->
      ?severity:compliance_severity ->
        ?status:compliance_status ->
          ?title:compliance_item_title ->
            ?id:compliance_item_id ->
              ?resource_id:compliance_resource_id ->
                ?resource_type:compliance_resource_type ->
                  ?compliance_type:compliance_type_name ->
                    unit -> compliance_item
val make_list_compliance_items_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?resource_types:compliance_resource_type_list ->
        ?resource_ids:compliance_resource_id_list ->
          ?filters:compliance_string_filter_list ->
            unit -> list_compliance_items_request
val make_command_filter :
  value:command_filter_value ->
    key:command_filter_key -> unit -> command_filter
val make_list_commands_request :
  ?filters:command_filter_list ->
    ?next_token:next_token ->
      ?max_results:command_max_results ->
        ?instance_id:instance_id ->
          ?command_id:command_id -> unit -> list_commands_request
val make_command_plugin :
  ?output_s3_key_prefix:s3_key_prefix ->
    ?output_s3_bucket_name:s3_bucket_name ->
      ?output_s3_region:s3_region ->
        ?standard_error_url:url ->
          ?standard_output_url:url ->
            ?output:command_plugin_output ->
              ?response_finish_date_time:date_time ->
                ?response_start_date_time:date_time ->
                  ?response_code:response_code ->
                    ?status_details:status_details ->
                      ?status:command_plugin_status ->
                        ?name:command_plugin_name -> unit -> command_plugin
val make_command_invocation :
  ?cloud_watch_output_config:cloud_watch_output_config ->
    ?notification_config:notification_config ->
      ?service_role:service_role ->
        ?command_plugins:command_plugin_list ->
          ?standard_error_url:url ->
            ?standard_output_url:url ->
              ?trace_output:invocation_trace_output ->
                ?status_details:status_details ->
                  ?status:command_invocation_status ->
                    ?requested_date_time:date_time ->
                      ?document_version:document_version ->
                        ?document_name:document_name ->
                          ?comment:comment ->
                            ?instance_name:instance_tag_name ->
                              ?instance_id:instance_id ->
                                ?command_id:command_id ->
                                  unit -> command_invocation
val make_list_command_invocations_request :
  ?details:boolean_ ->
    ?filters:command_filter_list ->
      ?next_token:next_token ->
        ?max_results:command_max_results ->
          ?instance_id:instance_id ->
            ?command_id:command_id ->
              unit -> list_command_invocations_request
val make_association :
  ?target_maps:target_maps ->
    ?duration:duration ->
      ?schedule_offset:schedule_offset ->
        ?association_name:association_name ->
          ?schedule_expression:schedule_expression ->
            ?overview:association_overview ->
              ?last_execution_date:date_time ->
                ?targets:targets ->
                  ?document_version:document_version ->
                    ?association_version:association_version ->
                      ?association_id:association_id ->
                        ?instance_id:instance_id ->
                          ?name:document_ar_n -> unit -> association
val make_association_filter :
  value:association_filter_value ->
    key:association_filter_key -> unit -> association_filter
val make_list_associations_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?association_filter_list:association_filter_list ->
        unit -> list_associations_request
val make_association_version_info :
  ?target_maps:target_maps ->
    ?duration:duration ->
      ?schedule_offset:schedule_offset ->
        ?target_locations:target_locations ->
          ?calendar_names:calendar_name_or_arn_list ->
            ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
              ?sync_compliance:association_sync_compliance ->
                ?compliance_severity:association_compliance_severity ->
                  ?max_concurrency:max_concurrency ->
                    ?max_errors:max_errors ->
                      ?association_name:association_name ->
                        ?output_location:instance_association_output_location
                          ->
                          ?schedule_expression:schedule_expression ->
                            ?targets:targets ->
                              ?parameters:parameters ->
                                ?document_version:document_version ->
                                  ?name:document_ar_n ->
                                    ?created_date:date_time ->
                                      ?association_version:association_version
                                        ->
                                        ?association_id:association_id ->
                                          unit -> association_version_info
val make_list_association_versions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      association_id:association_id ->
        unit -> list_association_versions_request
val make_label_parameter_version_request :
  ?parameter_version:ps_parameter_version ->
    labels:parameter_label_list ->
      name:ps_parameter_name -> unit -> label_parameter_version_request
val make_inventory_result_item :
  ?content_hash:inventory_item_content_hash ->
    ?capture_time:inventory_item_capture_time ->
      content:inventory_item_entry_list ->
        schema_version:inventory_item_schema_version ->
          type_name:inventory_item_type_name -> unit -> inventory_result_item
val make_inventory_result_entity :
  ?data:inventory_result_item_map ->
    ?id:inventory_result_entity_id -> unit -> inventory_result_entity
val make_inventory_item_attribute :
  data_type:inventory_attribute_data_type ->
    name:inventory_item_attribute_name -> unit -> inventory_item_attribute
val make_inventory_item_schema :
  ?display_name:inventory_type_display_name ->
    ?version:inventory_item_schema_version ->
      attributes:inventory_item_attribute_list ->
        type_name:inventory_item_type_name -> unit -> inventory_item_schema
val make_inventory_group :
  filters:inventory_filter_list ->
    name:inventory_group_name -> unit -> inventory_group
val make_inventory_deletion_summary_item :
  ?remaining_count:remaining_count ->
    ?count:resource_count ->
      ?version:inventory_item_schema_version ->
        unit -> inventory_deletion_summary_item
val make_inventory_deletion_summary :
  ?summary_items:inventory_deletion_summary_items ->
    ?remaining_count:remaining_count ->
      ?total_count:total_count -> unit -> inventory_deletion_summary
val make_inventory_deletion_status_item :
  ?last_status_update_time:inventory_deletion_last_status_update_time ->
    ?deletion_summary:inventory_deletion_summary ->
      ?last_status_message:inventory_deletion_last_status_message ->
        ?last_status:inventory_deletion_status ->
          ?deletion_start_time:inventory_deletion_start_time ->
            ?type_name:inventory_item_type_name ->
              ?deletion_id:uui_d -> unit -> inventory_deletion_status_item
val make_inventory_aggregator :
  ?groups:inventory_group_list ->
    ?aggregators:inventory_aggregator_list ->
      ?expression:inventory_aggregator_expression ->
        unit -> inventory_aggregator
val make_instance_property_string_filter :
  ?operator:instance_property_filter_operator ->
    values:instance_property_filter_value_set ->
      key:instance_property_string_filter_key ->
        unit -> instance_property_string_filter
val make_instance_property_filter :
  value_set:instance_property_filter_value_set ->
    key:instance_property_filter_key -> unit -> instance_property_filter
val make_instance_aggregated_association_overview :
  ?instance_association_status_aggregated_count:instance_association_status_aggregated_count
    ->
    ?detailed_status:status_name ->
      unit -> instance_aggregated_association_overview
val make_instance_property :
  ?source_type:source_type ->
    ?source_id:source_id ->
      ?association_overview:instance_aggregated_association_overview ->
        ?last_successful_association_execution_date:date_time ->
          ?last_association_execution_date:date_time ->
            ?association_status:status_name ->
              ?computer_name:computer_name ->
                ?resource_type:string_ ->
                  ?registration_date:date_time ->
                    ?iam_role:iam_role ->
                      ?activation_id:activation_id ->
                        ?platform_version:platform_version ->
                          ?platform_name:platform_name ->
                            ?platform_type:platform_type ->
                              ?agent_version:version ->
                                ?last_ping_date_time:date_time ->
                                  ?ping_status:ping_status ->
                                    ?launch_time:date_time ->
                                      ?ip_address:ip_address ->
                                        ?architecture:architecture ->
                                          ?instance_state:instance_state ->
                                            ?key_name:key_name ->
                                              ?instance_role:instance_role ->
                                                ?instance_type:instance_type
                                                  ->
                                                  ?instance_id:instance_id ->
                                                    ?name:instance_name ->
                                                      unit ->
                                                        instance_property
val make_instance_patch_state :
  ?other_non_compliant_count:patch_other_non_compliant_count ->
    ?security_non_compliant_count:patch_security_non_compliant_count ->
      ?critical_non_compliant_count:patch_critical_non_compliant_count ->
        ?reboot_option:reboot_option ->
          ?last_no_reboot_install_operation_time:date_time ->
            ?available_security_update_count:patch_available_security_update_count
              ->
              ?not_applicable_count:patch_not_applicable_count ->
                ?unreported_not_applicable_count:patch_unreported_not_applicable_count
                  ->
                  ?failed_count:patch_failed_count ->
                    ?missing_count:patch_missing_count ->
                      ?installed_rejected_count:patch_installed_rejected_count
                        ->
                        ?installed_pending_reboot_count:patch_installed_pending_reboot_count
                          ->
                          ?installed_other_count:patch_installed_other_count
                            ->
                            ?installed_count:patch_installed_count ->
                              ?owner_information:owner_information ->
                                ?install_override_list:install_override_list
                                  ->
                                  ?snapshot_id:snapshot_id ->
                                    operation:patch_operation_type ->
                                      operation_end_time:date_time ->
                                        operation_start_time:date_time ->
                                          baseline_id:baseline_id ->
                                            patch_group:patch_group ->
                                              instance_id:instance_id ->
                                                unit -> instance_patch_state
val make_instance_patch_state_filter :
  type_:instance_patch_state_operator_type ->
    values:instance_patch_state_filter_values ->
      key:instance_patch_state_filter_key ->
        unit -> instance_patch_state_filter
val make_instance_information_string_filter :
  values:instance_information_filter_value_set ->
    key:instance_information_string_filter_key ->
      unit -> instance_information_string_filter
val make_instance_information :
  ?source_type:source_type ->
    ?source_id:source_id ->
      ?association_overview:instance_aggregated_association_overview ->
        ?last_successful_association_execution_date:date_time ->
          ?last_association_execution_date:date_time ->
            ?association_status:status_name ->
              ?computer_name:computer_name ->
                ?ip_address:ip_address ->
                  ?name:string_ ->
                    ?resource_type:resource_type ->
                      ?registration_date:date_time ->
                        ?iam_role:iam_role ->
                          ?activation_id:activation_id ->
                            ?platform_version:string_ ->
                              ?platform_name:string_ ->
                                ?platform_type:platform_type ->
                                  ?is_latest_version:boolean_ ->
                                    ?agent_version:version ->
                                      ?last_ping_date_time:date_time ->
                                        ?ping_status:ping_status ->
                                          ?instance_id:instance_id ->
                                            unit -> instance_information
val make_instance_information_filter :
  value_set:instance_information_filter_value_set ->
    key:instance_information_filter_key ->
      unit -> instance_information_filter
val make_instance_association_output_url :
  ?s3_output_url:s3_output_url -> unit -> instance_association_output_url
val make_instance_association_status_info :
  ?association_name:association_name ->
    ?output_url:instance_association_output_url ->
      ?error_code:agent_error_code ->
        ?execution_summary:instance_association_execution_summary ->
          ?detailed_status:status_name ->
            ?status:status_name ->
              ?execution_date:date_time ->
                ?instance_id:instance_id ->
                  ?association_version:association_version ->
                    ?document_version:document_version ->
                      ?name:document_ar_n ->
                        ?association_id:association_id ->
                          unit -> instance_association_status_info
val make_instance_association :
  ?association_version:association_version ->
    ?content:document_content ->
      ?instance_id:instance_id ->
        ?association_id:association_id -> unit -> instance_association
val make_get_service_setting_request :
  setting_id:service_setting_id -> unit -> get_service_setting_request
val make_get_resource_policies_response_entry :
  ?policy:policy ->
    ?policy_hash:policy_hash ->
      ?policy_id:policy_id -> unit -> get_resource_policies_response_entry
val make_get_resource_policies_response :
  ?policies:get_resource_policies_response_entries ->
    ?next_token:string_ -> unit -> get_resource_policies_response
val make_get_resource_policies_request :
  ?max_results:resource_policy_max_results ->
    ?next_token:string_ ->
      resource_arn:resource_arn_string ->
        unit -> get_resource_policies_request
val make_get_patch_baseline_request :
  baseline_id:baseline_id -> unit -> get_patch_baseline_request
val make_get_patch_baseline_for_patch_group_request :
  ?operating_system:operating_system ->
    patch_group:patch_group ->
      unit -> get_patch_baseline_for_patch_group_request
val make_get_parameters_request :
  ?with_decryption:boolean_ ->
    names:parameter_name_list -> unit -> get_parameters_request
val make_get_parameters_by_path_request :
  ?next_token:next_token ->
    ?max_results:get_parameters_by_path_max_results ->
      ?with_decryption:boolean_ ->
        ?parameter_filters:parameter_string_filter_list ->
          ?recursive:boolean_ ->
            path:ps_parameter_name -> unit -> get_parameters_by_path_request
val make_get_parameter_request :
  ?with_decryption:boolean_ ->
    name:ps_parameter_name -> unit -> get_parameter_request
val make_get_parameter_history_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?with_decryption:boolean_ ->
        name:ps_parameter_name -> unit -> get_parameter_history_request
val make_get_ops_summary_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?result_attributes:ops_result_attribute_list ->
        ?aggregators:ops_aggregator_list ->
          ?filters:ops_filter_list ->
            ?sync_name:resource_data_sync_name ->
              unit -> get_ops_summary_request
val make_get_ops_metadata_request :
  ?next_token:next_token ->
    ?max_results:get_ops_metadata_max_results ->
      ops_metadata_arn:ops_metadata_arn -> unit -> get_ops_metadata_request
val make_get_ops_item_response :
  ?ops_item:ops_item -> unit -> get_ops_item_response
val make_get_ops_item_request :
  ?ops_item_arn:ops_item_arn ->
    ops_item_id:ops_item_id -> unit -> get_ops_item_request
val make_get_maintenance_window_task_request :
  window_task_id:maintenance_window_task_id ->
    window_id:maintenance_window_id ->
      unit -> get_maintenance_window_task_request
val make_get_maintenance_window_request :
  window_id:maintenance_window_id -> unit -> get_maintenance_window_request
val make_get_maintenance_window_execution_task_request :
  task_id:maintenance_window_execution_task_id ->
    window_execution_id:maintenance_window_execution_id ->
      unit -> get_maintenance_window_execution_task_request
val make_get_maintenance_window_execution_task_invocation_request :
  invocation_id:maintenance_window_execution_task_invocation_id ->
    task_id:maintenance_window_execution_task_id ->
      window_execution_id:maintenance_window_execution_id ->
        unit -> get_maintenance_window_execution_task_invocation_request
val make_get_maintenance_window_execution_request :
  window_execution_id:maintenance_window_execution_id ->
    unit -> get_maintenance_window_execution_request
val make_get_inventory_schema_request :
  ?sub_type:is_sub_type_schema ->
    ?aggregator:aggregator_schema_only ->
      ?max_results:get_inventory_schema_max_results ->
        ?next_token:next_token ->
          ?type_name:inventory_item_type_name_filter ->
            unit -> get_inventory_schema_request
val make_get_inventory_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?result_attributes:result_attribute_list ->
        ?aggregators:inventory_aggregator_list ->
          ?filters:inventory_filter_list -> unit -> get_inventory_request
val make_automation_execution_preview :
  ?total_accounts:integer ->
    ?target_previews:target_preview_list ->
      ?regions:region_list ->
        ?step_previews:step_preview_map ->
          unit -> automation_execution_preview
val make_get_execution_preview_response :
  ?execution_preview:execution_preview ->
    ?status_message:string_ ->
      ?status:execution_preview_status ->
        ?ended_at:date_time ->
          ?execution_preview_id:execution_preview_id ->
            unit -> get_execution_preview_response
val make_get_execution_preview_request :
  execution_preview_id:execution_preview_id ->
    unit -> get_execution_preview_request
val make_attachment_content :
  ?url:attachment_url ->
    ?hash_type:attachment_hash_type ->
      ?hash:attachment_hash ->
        ?size:content_length ->
          ?name:attachment_name -> unit -> attachment_content
val make_get_document_request :
  ?document_format:document_format ->
    ?document_version:document_version ->
      ?version_name:document_version_name ->
        name:document_ar_n -> unit -> get_document_request
val make_baseline_override :
  ?available_security_updates_compliance_status:patch_compliance_status ->
    ?sources:patch_source_list ->
      ?approved_patches_enable_non_security:boolean_ ->
        ?rejected_patches_action:patch_action ->
          ?rejected_patches:patch_id_list ->
            ?approved_patches_compliance_level:patch_compliance_level ->
              ?approved_patches:patch_id_list ->
                ?approval_rules:patch_rule_group ->
                  ?global_filters:patch_filter_group ->
                    ?operating_system:operating_system ->
                      unit -> baseline_override
val make_get_deployable_patch_snapshot_for_instance_request :
  ?baseline_override:baseline_override ->
    snapshot_id:snapshot_id ->
      instance_id:instance_id ->
        unit -> get_deployable_patch_snapshot_for_instance_request
val make_get_default_patch_baseline_request :
  ?operating_system:operating_system ->
    unit -> get_default_patch_baseline_request
val make_get_connection_status_response :
  ?status:connection_status ->
    ?target:session_target -> unit -> get_connection_status_response
val make_get_connection_status_request :
  target:session_target -> unit -> get_connection_status_request
val make_get_command_invocation_request :
  ?plugin_name:command_plugin_name ->
    instance_id:instance_id ->
      command_id:command_id -> unit -> get_command_invocation_request
val make_get_calendar_state_response :
  ?next_transition_time:iso8601_string ->
    ?at_time:iso8601_string ->
      ?state:calendar_state -> unit -> get_calendar_state_response
val make_get_calendar_state_request :
  ?at_time:iso8601_string ->
    calendar_names:calendar_name_or_arn_list ->
      unit -> get_calendar_state_request
val make_automation_execution :
  ?variables:automation_parameter_map ->
    ?change_request_name:change_request_name ->
      ?association_id:string_ ->
        ?ops_item_id:string_ ->
          ?runbooks:runbooks ->
            ?scheduled_time:date_time ->
              ?automation_subtype:automation_subtype ->
                ?target_locations_ur_l:target_locations_ur_l ->
                  ?triggered_alarms:alarm_state_information_list ->
                    ?alarm_configuration:alarm_configuration ->
                      ?progress_counters:progress_counters ->
                        ?target_locations:target_locations ->
                          ?target:string_ ->
                            ?max_errors:max_errors ->
                              ?max_concurrency:max_concurrency ->
                                ?resolved_targets:resolved_targets ->
                                  ?target_maps:target_maps ->
                                    ?targets:targets ->
                                      ?target_parameter_name:automation_parameter_key
                                        ->
                                        ?current_action:string_ ->
                                          ?current_step_name:string_ ->
                                            ?executed_by:string_ ->
                                              ?parent_automation_execution_id:automation_execution_id
                                                ->
                                                ?mode:execution_mode ->
                                                  ?failure_message:string_ ->
                                                    ?outputs:automation_parameter_map
                                                      ->
                                                      ?parameters:automation_parameter_map
                                                        ->
                                                        ?step_executions_truncated:boolean_
                                                          ->
                                                          ?step_executions:step_execution_list
                                                            ->
                                                            ?automation_execution_status:automation_execution_status
                                                              ->
                                                              ?execution_end_time:date_time
                                                                ->
                                                                ?execution_start_time:date_time
                                                                  ->
                                                                  ?document_version:document_version
                                                                    ->
                                                                    ?document_name:document_name
                                                                    ->
                                                                    ?automation_execution_id:automation_execution_id
                                                                    ->
                                                                    unit ->
                                                                    automation_execution
val make_get_automation_execution_request :
  automation_execution_id:automation_execution_id ->
    unit -> get_automation_execution_request
val make_credentials :
  expiration_time:date_time ->
    session_token:session_token_type ->
      secret_access_key:access_key_secret_type ->
        access_key_id:access_key_id_type -> unit -> credentials
val make_get_access_token_response :
  ?access_request_status:access_request_status ->
    ?credentials:credentials -> unit -> get_access_token_response
val make_get_access_token_request :
  access_request_id:access_request_id -> unit -> get_access_token_request
val make_create_association_batch_request_entry :
  ?alarm_configuration:alarm_configuration ->
    ?target_maps:target_maps ->
      ?duration:duration ->
        ?schedule_offset:schedule_offset ->
          ?target_locations:target_locations ->
            ?calendar_names:calendar_name_or_arn_list ->
              ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                ?sync_compliance:association_sync_compliance ->
                  ?compliance_severity:association_compliance_severity ->
                    ?max_concurrency:max_concurrency ->
                      ?max_errors:max_errors ->
                        ?association_name:association_name ->
                          ?output_location:instance_association_output_location
                            ->
                            ?schedule_expression:schedule_expression ->
                              ?targets:targets ->
                                ?document_version:document_version ->
                                  ?automation_target_parameter_name:automation_target_parameter_name
                                    ->
                                    ?parameters:parameters ->
                                      ?instance_id:instance_id ->
                                        name:document_ar_n ->
                                          unit ->
                                            create_association_batch_request_entry
val make_failed_create_association :
  ?fault:fault ->
    ?message:batch_error_message ->
      ?entry:create_association_batch_request_entry ->
        unit -> failed_create_association
val make_effective_patch :
  ?patch_status:patch_status -> ?patch:patch -> unit -> effective_patch
val make_disassociate_ops_item_related_item_response : unit -> unit
val make_disassociate_ops_item_related_item_request :
  association_id:ops_item_related_item_association_id ->
    ops_item_id:ops_item_id ->
      unit -> disassociate_ops_item_related_item_request
val make_describe_sessions_response :
  ?next_token:next_token ->
    ?sessions:session_list -> unit -> describe_sessions_response
val make_describe_sessions_request :
  ?filters:session_filter_list ->
    ?next_token:next_token ->
      ?max_results:session_max_results ->
        state:session_state -> unit -> describe_sessions_request
val make_describe_patch_properties_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?patch_set:patch_set ->
        property:patch_property ->
          operating_system:operating_system ->
            unit -> describe_patch_properties_request
val make_describe_patch_groups_request :
  ?next_token:next_token ->
    ?filters:patch_orchestrator_filter_list ->
      ?max_results:patch_baseline_max_results ->
        unit -> describe_patch_groups_request
val make_describe_patch_group_state_request :
  patch_group:patch_group -> unit -> describe_patch_group_state_request
val make_describe_patch_baselines_request :
  ?next_token:next_token ->
    ?max_results:patch_baseline_max_results ->
      ?filters:patch_orchestrator_filter_list ->
        unit -> describe_patch_baselines_request
val make_describe_parameters_request :
  ?shared:boolean_ ->
    ?next_token:next_token ->
      ?max_results:max_results ->
        ?parameter_filters:parameter_string_filter_list ->
          ?filters:parameters_filter_list ->
            unit -> describe_parameters_request
val make_describe_ops_items_response :
  ?ops_item_summaries:ops_item_summaries ->
    ?next_token:string_ -> unit -> describe_ops_items_response
val make_describe_ops_items_request :
  ?next_token:string_ ->
    ?max_results:ops_item_max_results ->
      ?ops_item_filters:ops_item_filters ->
        unit -> describe_ops_items_request
val make_describe_maintenance_windows_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        unit -> describe_maintenance_windows_request
val make_describe_maintenance_windows_for_target_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_search_max_results ->
      resource_type:maintenance_window_resource_type ->
        targets:targets ->
          unit -> describe_maintenance_windows_for_target_request
val make_describe_maintenance_window_tasks_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_id:maintenance_window_id ->
          unit -> describe_maintenance_window_tasks_request
val make_describe_maintenance_window_targets_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_id:maintenance_window_id ->
          unit -> describe_maintenance_window_targets_request
val make_describe_maintenance_window_schedule_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_search_max_results ->
      ?filters:patch_orchestrator_filter_list ->
        ?resource_type:maintenance_window_resource_type ->
          ?targets:targets ->
            ?window_id:maintenance_window_id ->
              unit -> describe_maintenance_window_schedule_request
val make_describe_maintenance_window_executions_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_id:maintenance_window_id ->
          unit -> describe_maintenance_window_executions_request
val make_describe_maintenance_window_execution_tasks_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_execution_id:maintenance_window_execution_id ->
          unit -> describe_maintenance_window_execution_tasks_request
val make_describe_maintenance_window_execution_task_invocations_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        task_id:maintenance_window_execution_task_id ->
          window_execution_id:maintenance_window_execution_id ->
            unit ->
              describe_maintenance_window_execution_task_invocations_request
val make_describe_inventory_deletions_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?deletion_id:uui_d -> unit -> describe_inventory_deletions_request
val make_describe_instance_properties_request :
  ?next_token:next_token ->
    ?max_results:describe_instance_properties_max_results ->
      ?filters_with_operator:instance_property_string_filter_list ->
        ?instance_property_filter_list:instance_property_filter_list ->
          unit -> describe_instance_properties_request
val make_describe_instance_patches_request :
  ?max_results:patch_compliance_max_results ->
    ?next_token:next_token ->
      ?filters:patch_orchestrator_filter_list ->
        instance_id:instance_id -> unit -> describe_instance_patches_request
val make_describe_instance_patch_states_request :
  ?max_results:patch_compliance_max_results ->
    ?next_token:next_token ->
      instance_ids:instance_id_list ->
        unit -> describe_instance_patch_states_request
val make_describe_instance_patch_states_for_patch_group_request :
  ?max_results:patch_compliance_max_results ->
    ?next_token:next_token ->
      ?filters:instance_patch_state_filter_list ->
        patch_group:patch_group ->
          unit -> describe_instance_patch_states_for_patch_group_request
val make_describe_instance_information_request :
  ?next_token:next_token ->
    ?max_results:max_results_ec2_compatible ->
      ?filters:instance_information_string_filter_list ->
        ?instance_information_filter_list:instance_information_filter_list ->
          unit -> describe_instance_information_request
val make_describe_instance_associations_status_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      instance_id:instance_id ->
        unit -> describe_instance_associations_status_request
val make_describe_effective_patches_for_patch_baseline_request :
  ?next_token:next_token ->
    ?max_results:patch_baseline_max_results ->
      baseline_id:baseline_id ->
        unit -> describe_effective_patches_for_patch_baseline_request
val make_describe_effective_instance_associations_request :
  ?next_token:next_token ->
    ?max_results:effective_instance_association_max_results ->
      instance_id:instance_id ->
        unit -> describe_effective_instance_associations_request
val make_describe_document_request :
  ?version_name:document_version_name ->
    ?document_version:document_version ->
      name:document_ar_n -> unit -> describe_document_request
val make_account_sharing_info :
  ?shared_document_version:shared_document_version ->
    ?account_id:account_id -> unit -> account_sharing_info
val make_describe_document_permission_response :
  ?next_token:next_token ->
    ?account_sharing_info_list:account_sharing_info_list ->
      ?account_ids:account_id_list ->
        unit -> describe_document_permission_response
val make_describe_document_permission_request :
  ?next_token:next_token ->
    ?max_results:document_permission_max_results ->
      permission_type:document_permission_type ->
        name:document_name -> unit -> describe_document_permission_request
val make_describe_available_patches_request :
  ?next_token:next_token ->
    ?max_results:patch_baseline_max_results ->
      ?filters:patch_orchestrator_filter_list ->
        unit -> describe_available_patches_request
val make_describe_automation_step_executions_request :
  ?reverse_order:boolean_ ->
    ?max_results:max_results ->
      ?next_token:next_token ->
        ?filters:step_execution_filter_list ->
          automation_execution_id:automation_execution_id ->
            unit -> describe_automation_step_executions_request
val make_automation_execution_metadata :
  ?change_request_name:change_request_name ->
    ?association_id:string_ ->
      ?ops_item_id:string_ ->
        ?runbooks:runbooks ->
          ?scheduled_time:date_time ->
            ?automation_subtype:automation_subtype ->
              ?target_locations_ur_l:target_locations_ur_l ->
                ?triggered_alarms:alarm_state_information_list ->
                  ?alarm_configuration:alarm_configuration ->
                    ?automation_type:automation_type ->
                      ?target:string_ ->
                        ?max_errors:max_errors ->
                          ?max_concurrency:max_concurrency ->
                            ?resolved_targets:resolved_targets ->
                              ?target_maps:target_maps ->
                                ?targets:targets ->
                                  ?target_parameter_name:automation_parameter_key
                                    ->
                                    ?failure_message:string_ ->
                                      ?current_action:string_ ->
                                        ?current_step_name:string_ ->
                                          ?parent_automation_execution_id:automation_execution_id
                                            ->
                                            ?mode:execution_mode ->
                                              ?outputs:automation_parameter_map
                                                ->
                                                ?log_file:string_ ->
                                                  ?executed_by:string_ ->
                                                    ?execution_end_time:date_time
                                                      ->
                                                      ?execution_start_time:date_time
                                                        ->
                                                        ?automation_execution_status:automation_execution_status
                                                          ->
                                                          ?document_version:document_version
                                                            ->
                                                            ?document_name:document_name
                                                              ->
                                                              ?automation_execution_id:automation_execution_id
                                                                ->
                                                                unit ->
                                                                  automation_execution_metadata
val make_automation_execution_filter :
  values:automation_execution_filter_value_list ->
    key:automation_execution_filter_key ->
      unit -> automation_execution_filter
val make_describe_automation_executions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:automation_execution_filter_list ->
        unit -> describe_automation_executions_request
val make_describe_association_request :
  ?association_version:association_version ->
    ?association_id:association_id ->
      ?instance_id:instance_id ->
        ?name:document_ar_n -> unit -> describe_association_request
val make_association_execution :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?resource_count_by_status:resource_count_by_status ->
        ?last_execution_date:date_time ->
          ?created_time:date_time ->
            ?detailed_status:status_name ->
              ?status:status_name ->
                ?execution_id:association_execution_id ->
                  ?association_version:association_version ->
                    ?association_id:association_id ->
                      unit -> association_execution
val make_association_execution_filter :
  type_:association_filter_operator_type ->
    value:association_execution_filter_value ->
      key:association_execution_filter_key ->
        unit -> association_execution_filter
val make_describe_association_executions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:association_execution_filter_list ->
        association_id:association_id ->
          unit -> describe_association_executions_request
val make_association_execution_target :
  ?output_source:output_source ->
    ?last_execution_date:date_time ->
      ?detailed_status:status_name ->
        ?status:status_name ->
          ?resource_type:association_resource_type ->
            ?resource_id:association_resource_id ->
              ?execution_id:association_execution_id ->
                ?association_version:association_version ->
                  ?association_id:association_id ->
                    unit -> association_execution_target
val make_association_execution_targets_filter :
  value:association_execution_targets_filter_value ->
    key:association_execution_targets_filter_key ->
      unit -> association_execution_targets_filter
val make_describe_association_execution_targets_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:association_execution_targets_filter_list ->
        execution_id:association_execution_id ->
          association_id:association_id ->
            unit -> describe_association_execution_targets_request
val make_activation :
  ?tags:tag_list ->
    ?created_date:created_date ->
      ?expired:boolean_ ->
        ?expiration_date:expiration_date ->
          ?registrations_count:registrations_count ->
            ?registration_limit:registration_limit ->
              ?iam_role:iam_role ->
                ?default_instance_name:default_instance_name ->
                  ?description:activation_description ->
                    ?activation_id:activation_id -> unit -> activation
val make_describe_activations_filter :
  ?filter_values:string_list ->
    ?filter_key:describe_activations_filter_keys ->
      unit -> describe_activations_filter
val make_describe_activations_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:describe_activations_filter_list ->
        unit -> describe_activations_request
val make_deregister_task_from_maintenance_window_request :
  window_task_id:maintenance_window_task_id ->
    window_id:maintenance_window_id ->
      unit -> deregister_task_from_maintenance_window_request
val make_deregister_target_from_maintenance_window_request :
  ?safe:boolean_ ->
    window_target_id:maintenance_window_target_id ->
      window_id:maintenance_window_id ->
        unit -> deregister_target_from_maintenance_window_request
val make_deregister_patch_baseline_for_patch_group_request :
  patch_group:patch_group ->
    baseline_id:baseline_id ->
      unit -> deregister_patch_baseline_for_patch_group_request
val make_deregister_managed_instance_request :
  instance_id:managed_instance_id ->
    unit -> deregister_managed_instance_request
val make_delete_resource_policy_response : unit -> unit
val make_delete_resource_policy_request :
  policy_hash:policy_hash ->
    policy_id:policy_id ->
      resource_arn:resource_arn_string ->
        unit -> delete_resource_policy_request
val make_delete_resource_data_sync_request :
  ?sync_type:resource_data_sync_type ->
    sync_name:resource_data_sync_name ->
      unit -> delete_resource_data_sync_request
val make_delete_patch_baseline_request :
  baseline_id:baseline_id -> unit -> delete_patch_baseline_request
val make_delete_parameters_request :
  names:parameter_name_list -> unit -> delete_parameters_request
val make_delete_parameter_request :
  name:ps_parameter_name -> unit -> delete_parameter_request
val make_delete_ops_metadata_request :
  ops_metadata_arn:ops_metadata_arn -> unit -> delete_ops_metadata_request
val make_delete_ops_item_response : unit -> unit
val make_delete_ops_item_request :
  ops_item_id:ops_item_id -> unit -> delete_ops_item_request
val make_delete_maintenance_window_request :
  window_id:maintenance_window_id ->
    unit -> delete_maintenance_window_request
val make_delete_inventory_request :
  ?client_token:uui_d ->
    ?dry_run:dry_run ->
      ?schema_delete_option:inventory_schema_delete_option ->
        type_name:inventory_item_type_name ->
          unit -> delete_inventory_request
val make_delete_document_request :
  ?force:boolean_ ->
    ?version_name:document_version_name ->
      ?document_version:document_version ->
        name:document_name -> unit -> delete_document_request
val make_delete_association_request :
  ?association_id:association_id ->
    ?instance_id:instance_id ->
      ?name:document_ar_n -> unit -> delete_association_request
val make_delete_activation_request :
  activation_id:activation_id -> unit -> delete_activation_request
val make_create_resource_data_sync_request :
  ?sync_source:resource_data_sync_source ->
    ?sync_type:resource_data_sync_type ->
      ?s3_destination:resource_data_sync_s3_destination ->
        sync_name:resource_data_sync_name ->
          unit -> create_resource_data_sync_request
val make_create_patch_baseline_request :
  ?tags:tag_list ->
    ?client_token:client_token ->
      ?available_security_updates_compliance_status:patch_compliance_status
        ->
        ?sources:patch_source_list ->
          ?description:baseline_description ->
            ?rejected_patches_action:patch_action ->
              ?rejected_patches:patch_id_list ->
                ?approved_patches_enable_non_security:boolean_ ->
                  ?approved_patches_compliance_level:patch_compliance_level
                    ->
                    ?approved_patches:patch_id_list ->
                      ?approval_rules:patch_rule_group ->
                        ?global_filters:patch_filter_group ->
                          ?operating_system:operating_system ->
                            name:baseline_name ->
                              unit -> create_patch_baseline_request
val make_create_ops_metadata_request :
  ?tags:tag_list ->
    ?metadata:metadata_map ->
      resource_id:ops_metadata_resource_id ->
        unit -> create_ops_metadata_request
val make_create_ops_item_response :
  ?ops_item_arn:ops_item_arn ->
    ?ops_item_id:string_ -> unit -> create_ops_item_response
val make_create_ops_item_request :
  ?account_id:ops_item_account_id ->
    ?planned_end_time:date_time ->
      ?planned_start_time:date_time ->
        ?actual_end_time:date_time ->
          ?actual_start_time:date_time ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?tags:tag_list ->
                  ?related_ops_items:related_ops_items ->
                    ?priority:ops_item_priority ->
                      ?notifications:ops_item_notifications ->
                        ?operational_data:ops_item_operational_data ->
                          ?ops_item_type:ops_item_type ->
                            title:ops_item_title ->
                              source:ops_item_source ->
                                description:ops_item_description ->
                                  unit -> create_ops_item_request
val make_create_maintenance_window_request :
  ?tags:tag_list ->
    ?client_token:client_token ->
      ?schedule_offset:maintenance_window_offset ->
        ?schedule_timezone:maintenance_window_timezone ->
          ?end_date:maintenance_window_string_date_time ->
            ?start_date:maintenance_window_string_date_time ->
              ?description:maintenance_window_description ->
                allow_unassociated_targets:maintenance_window_allow_unassociated_targets
                  ->
                  cutoff:maintenance_window_cutoff ->
                    duration:maintenance_window_duration_hours ->
                      schedule:maintenance_window_schedule ->
                        name:maintenance_window_name ->
                          unit -> create_maintenance_window_request
val make_create_document_request :
  ?tags:tag_list ->
    ?target_type:target_type ->
      ?document_format:document_format ->
        ?document_type:document_type ->
          ?version_name:document_version_name ->
            ?display_name:document_display_name ->
              ?attachments:attachments_source_list ->
                ?requires:document_requires_list ->
                  name:document_name ->
                    content:document_content ->
                      unit -> create_document_request
val make_create_association_request :
  ?alarm_configuration:alarm_configuration ->
    ?tags:tag_list ->
      ?target_maps:target_maps ->
        ?duration:duration ->
          ?schedule_offset:schedule_offset ->
            ?target_locations:target_locations ->
              ?calendar_names:calendar_name_or_arn_list ->
                ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                  ?sync_compliance:association_sync_compliance ->
                    ?compliance_severity:association_compliance_severity ->
                      ?max_concurrency:max_concurrency ->
                        ?max_errors:max_errors ->
                          ?automation_target_parameter_name:automation_target_parameter_name
                            ->
                            ?association_name:association_name ->
                              ?output_location:instance_association_output_location
                                ->
                                ?schedule_expression:schedule_expression ->
                                  ?targets:targets ->
                                    ?parameters:parameters ->
                                      ?instance_id:instance_id ->
                                        ?document_version:document_version ->
                                          name:document_ar_n ->
                                            unit ->
                                              create_association_request
val make_create_association_batch_request :
  entries:create_association_batch_request_entries ->
    unit -> create_association_batch_request
val make_create_activation_request :
  ?registration_metadata:registration_metadata_list ->
    ?tags:tag_list ->
      ?expiration_date:expiration_date ->
        ?registration_limit:registration_limit ->
          ?default_instance_name:default_instance_name ->
            ?description:activation_description ->
              iam_role:iam_role -> unit -> create_activation_request
val make_cancel_maintenance_window_execution_request :
  window_execution_id:maintenance_window_execution_id ->
    unit -> cancel_maintenance_window_execution_request
val make_cancel_command_request :
  ?instance_ids:instance_id_list ->
    command_id:command_id -> unit -> cancel_command_request
val make_associate_ops_item_related_item_response :
  ?association_id:ops_item_related_item_association_id ->
    unit -> associate_ops_item_related_item_response
val make_associate_ops_item_related_item_request :
  resource_uri:ops_item_related_item_association_resource_uri ->
    resource_type:ops_item_related_item_association_resource_type ->
      association_type:ops_item_related_item_association_type ->
        ops_item_id:ops_item_id ->
          unit -> associate_ops_item_related_item_request
val make_add_tags_to_resource_request :
  tags:tag_list ->
    resource_id:resource_id ->
      resource_type:resource_type_for_tagging ->
        unit -> add_tags_to_resource_request(** {1:operations Operations} *)

module AddTagsToResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_resource_request ->
        (add_tags_to_resource_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id 
          | `InvalidResourceType of invalid_resource_type 
          | `TooManyTagsError of too_many_tags_error 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Adds or overwrites one or more tags for the specified resource. {i Tags} are metadata that you can assign to your automations, documents, managed nodes, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed nodes that helps you track each node's owner and stack level. For example:\n\n {ul\n       {-   [Key=Owner,Value=DbAdmin] \n           \n            }\n       {-   [Key=Owner,Value=SysAdmin] \n           \n            }\n       {-   [Key=Owner,Value=Dev] \n           \n            }\n       {-   [Key=Stack,Value=Production] \n           \n            }\n       {-   [Key=Stack,Value=Pre-Production] \n           \n            }\n       {-   [Key=Stack,Value=Test] \n           \n            }\n       }\n   Most resources can have a maximum of 50 tags. Automations can have a maximum of 5 tags.\n   \n    We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to and are interpreted strictly as a string of characters.\n    \n     For more information about using tags with Amazon Elastic Compute Cloud (Amazon EC2) instances, see {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html}Tag your Amazon EC2 resources} in the {i Amazon EC2 User Guide}.\n     "]
module AssociateOpsItemRelatedItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_ops_item_related_item_request ->
        (associate_ops_item_related_item_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemConflictException of ops_item_conflict_exception 
          | `OpsItemInvalidParameterException of
              ops_item_invalid_parameter_exception 
          | `OpsItemLimitExceededException of
              ops_item_limit_exceeded_exception 
          | `OpsItemNotFoundException of ops_item_not_found_exception 
          | `OpsItemRelatedItemAlreadyExistsException of
              ops_item_related_item_already_exists_exception ])
          result
end[@@ocaml.doc
     "Associates a related item to a Systems Manager OpsCenter OpsItem. For example, you can associate an Incident Manager incident or analysis with an OpsItem. Incident Manager and OpsCenter are tools in Amazon Web Services Systems Manager.\n"]
module CancelCommand :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_command_request ->
        (cancel_command_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DuplicateInstanceId of duplicate_instance_id 
          | `InternalServerError of internal_server_error 
          | `InvalidCommandId of invalid_command_id 
          | `InvalidInstanceId of invalid_instance_id ]) result
end[@@ocaml.doc
     "Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.\n"]
module CancelMaintenanceWindowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_maintenance_window_execution_request ->
        (cancel_maintenance_window_execution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Stops a maintenance window execution that is already in progress and cancels any tasks in the window that haven't already starting running. Tasks already in progress will continue to completion.\n"]
module CreateActivation :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_activation_request ->
        (create_activation_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidParameters of invalid_parameters ]) result
end[@@ocaml.doc
     "Generates an activation code and activation ID you can use to register your on-premises servers, edge devices, or virtual machine (VM) with Amazon Web Services Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager tools. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises machines using Systems Manager, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-hybrid-multicloud.html}Using Amazon Web Services Systems Manager in hybrid and multicloud environments} in the {i Amazon Web Services Systems Manager User Guide}. \n\n  Amazon Elastic Compute Cloud (Amazon EC2) instances, edge devices, and on-premises servers and VMs that are configured for Systems Manager are all called {i managed nodes}.\n  \n   "]
module CreateAssociation :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_association_request ->
        (create_association_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationAlreadyExists of association_already_exists 
          | `AssociationLimitExceeded of association_limit_exceeded 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentVersion of invalid_document_version 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidOutputLocation of invalid_output_location 
          | `InvalidParameters of invalid_parameters 
          | `InvalidSchedule of invalid_schedule 
          | `InvalidTag of invalid_tag  | `InvalidTarget of invalid_target 
          | `InvalidTargetMaps of invalid_target_maps 
          | `UnsupportedPlatformType of unsupported_platform_type ]) result
end[@@ocaml.doc
     "A State Manager association defines the state that you want to maintain on your managed nodes. For example, an association can specify that anti-virus software must be installed and running on your managed nodes, or that certain ports must be closed. For static targets, the association specifies a schedule for when the configuration is reapplied. For dynamic targets, such as an Amazon Web Services resource group or an Amazon Web Services autoscaling group, State Manager, a tool in Amazon Web Services Systems Manager applies the configuration when new managed nodes are added to the group. The association also specifies actions to take when applying the configuration. For example, an association for anti-virus software might run once a day. If the software isn't installed, then State Manager installs it. If the software is installed, but the service isn't running, then the association might instruct State Manager to start the service. \n"]
module CreateAssociationBatch :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_association_batch_request ->
        (create_association_batch_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationLimitExceeded of association_limit_exceeded 
          | `DuplicateInstanceId of duplicate_instance_id 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentVersion of invalid_document_version 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidOutputLocation of invalid_output_location 
          | `InvalidParameters of invalid_parameters 
          | `InvalidSchedule of invalid_schedule 
          | `InvalidTarget of invalid_target 
          | `InvalidTargetMaps of invalid_target_maps 
          | `UnsupportedPlatformType of unsupported_platform_type ]) result
end[@@ocaml.doc
     "Associates the specified Amazon Web Services Systems Manager document (SSM document) with the specified managed nodes or targets.\n\n When you associate a document with one or more managed nodes using IDs or tags, Amazon Web Services Systems Manager Agent (SSM Agent) running on the managed node processes the document and configures the node as specified.\n \n  If you associate a document with a managed node that already has an associated document, the system returns the AssociationAlreadyExists exception.\n  "]
module CreateDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_document_request ->
        (create_document_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DocumentAlreadyExists of document_already_exists 
          | `DocumentLimitExceeded of document_limit_exceeded 
          | `InternalServerError of internal_server_error 
          | `InvalidDocumentContent of invalid_document_content 
          | `InvalidDocumentSchemaVersion of invalid_document_schema_version 
          | `MaxDocumentSizeExceeded of max_document_size_exceeded 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Creates a Amazon Web Services Systems Manager (SSM document). An SSM document defines the actions that Systems Manager performs on your managed nodes. For more information about SSM documents, including information about supported schemas, features, and syntax, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents.html}Amazon Web Services Systems Manager Documents} in the {i Amazon Web Services Systems Manager User Guide}.\n"]
module CreateMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_maintenance_window_request ->
        (create_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `IdempotentParameterMismatch of idempotent_parameter_mismatch 
          | `InternalServerError of internal_server_error 
          | `ResourceLimitExceededException of
              resource_limit_exceeded_exception ])
          result
end[@@ocaml.doc
     "Creates a new maintenance window.\n\n  The value you specify for [Duration] determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.\n  \n   "]
module CreateOpsItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_ops_item_request ->
        (create_ops_item_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemAccessDeniedException of ops_item_access_denied_exception 
          | `OpsItemAlreadyExistsException of
              ops_item_already_exists_exception 
          | `OpsItemInvalidParameterException of
              ops_item_invalid_parameter_exception 
          | `OpsItemLimitExceededException of
              ops_item_limit_exceeded_exception ])
          result
end[@@ocaml.doc
     "Creates a new OpsItem. You must have permission in Identity and Access Management (IAM) to create a new OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n "]
module CreateOpsMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_ops_metadata_request ->
        (create_ops_metadata_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsMetadataAlreadyExistsException of
              ops_metadata_already_exists_exception 
          | `OpsMetadataInvalidArgumentException of
              ops_metadata_invalid_argument_exception 
          | `OpsMetadataLimitExceededException of
              ops_metadata_limit_exceeded_exception 
          | `OpsMetadataTooManyUpdatesException of
              ops_metadata_too_many_updates_exception ])
          result
end[@@ocaml.doc
     "If you create a new application in Application Manager, Amazon Web Services Systems Manager calls this API operation to specify information about the new application, including the application type.\n"]
module CreatePatchBaseline :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_patch_baseline_request ->
        (create_patch_baseline_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `IdempotentParameterMismatch of idempotent_parameter_mismatch 
          | `InternalServerError of internal_server_error 
          | `ResourceLimitExceededException of
              resource_limit_exceeded_exception ])
          result
end[@@ocaml.doc
     "Creates a patch baseline.\n\n  For information about valid key-value pairs in [PatchFilters] for each supported operating system type, see [PatchFilter].\n  \n   "]
module CreateResourceDataSync :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_resource_data_sync_request ->
        (create_resource_data_sync_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceDataSyncAlreadyExistsException of
              resource_data_sync_already_exists_exception 
          | `ResourceDataSyncCountExceededException of
              resource_data_sync_count_exceeded_exception 
          | `ResourceDataSyncInvalidConfigurationException of
              resource_data_sync_invalid_configuration_exception ])
          result
end[@@ocaml.doc
     "A resource data sync helps you view data from multiple sources in a single location. Amazon Web Services Systems Manager offers two types of resource data sync: [SyncToDestination] and [SyncFromSource].\n\n You can configure Systems Manager Inventory to use the [SyncToDestination] type to synchronize Inventory data from multiple Amazon Web Services Regions to a single Amazon Simple Storage Service (Amazon S3) bucket. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-create-resource-data-sync.html}Creating a resource data sync for Inventory} in the {i Amazon Web Services Systems Manager User Guide}.\n \n  You can configure Systems Manager Explorer to use the [SyncFromSource] type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple Amazon Web Services Regions to a single Amazon S3 bucket. This type can synchronize OpsItems and OpsData from multiple Amazon Web Services accounts and Amazon Web Services Regions or [EntireOrganization] by using Organizations. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n   A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the [ListResourceDataSync].\n   \n     By default, data isn't encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy. \n     \n      "]
module DeleteActivation :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activation_request ->
        (delete_activation_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidActivation of invalid_activation 
          | `InvalidActivationId of invalid_activation_id 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Deletes an activation. You aren't required to delete an activation. If you delete an activation, you can no longer use it to register additional managed nodes. Deleting an activation doesn't de-register managed nodes. You must manually de-register managed nodes.\n"]
module DeleteAssociation :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_association_request ->
        (delete_association_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidInstanceId of invalid_instance_id 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Disassociates the specified Amazon Web Services Systems Manager document (SSM document) from the specified managed node. If you created the association by using the [Targets] parameter, then you must delete the association by using the association ID.\n\n When you disassociate a document from a managed node, it doesn't change the configuration of the node. To change the configuration state of a managed node after you disassociate a document, you must create a new document with the desired configuration and associate it with the node.\n "]
module DeleteDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_document_request ->
        (delete_document_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociatedInstances of associated_instances 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentOperation of invalid_document_operation 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Deletes the Amazon Web Services Systems Manager document (SSM document) and all managed node associations to the document.\n\n Before you delete the document, we recommend that you use [DeleteAssociation] to disassociate all managed nodes that are associated with the document.\n "]
module DeleteInventory :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_inventory_request ->
        (delete_inventory_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDeleteInventoryParametersException of
              invalid_delete_inventory_parameters_exception 
          | `InvalidInventoryRequestException of
              invalid_inventory_request_exception 
          | `InvalidOptionException of invalid_option_exception 
          | `InvalidTypeNameException of invalid_type_name_exception ])
          result
end[@@ocaml.doc
     "Delete a custom inventory type or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.\n"]
module DeleteMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_maintenance_window_request ->
        (delete_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc "Deletes a maintenance window.\n"]
module DeleteOpsItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ops_item_request ->
        (delete_ops_item_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemInvalidParameterException of
              ops_item_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Delete an OpsItem. You must have permission in Identity and Access Management (IAM) to delete an OpsItem. \n\n  Note the following important information about this operation.\n  \n   {ul\n         {-  Deleting an OpsItem is irreversible. You can't restore a deleted OpsItem.\n             \n              }\n         {-  This operation uses an {i eventual consistency model}, which means the system can take a few minutes to complete this operation. If you delete an OpsItem and immediately call, for example, [GetOpsItem], the deleted OpsItem might still appear in the response. \n             \n              }\n         {-  This operation is idempotent. The system doesn't throw an exception if you repeatedly call this operation for the same OpsItem. If the first call is successful, all additional calls return the same successful response as the first call.\n             \n              }\n         {-  This operation doesn't support cross-account calls. A delegated administrator or management account can't delete OpsItems in other accounts, even if OpsCenter has been set up for cross-account administration. For more information about cross-account administration, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setting-up-cross-account.html}Setting up OpsCenter to centrally manage OpsItems across accounts} in the {i Systems Manager User Guide}.\n             \n              }\n         }\n   "]
module DeleteOpsMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ops_metadata_request ->
        (delete_ops_metadata_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsMetadataInvalidArgumentException of
              ops_metadata_invalid_argument_exception 
          | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ])
          result
end[@@ocaml.doc "Delete OpsMetadata related to an application.\n"]
module DeleteParameter :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_parameter_request ->
        (delete_parameter_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ParameterNotFound of parameter_not_found ]) result
end[@@ocaml.doc
     "Delete a parameter from the system. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.\n"]
module DeleteParameters :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_parameters_request ->
        (delete_parameters_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Delete a list of parameters. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.\n"]
module DeletePatchBaseline :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_patch_baseline_request ->
        (delete_patch_baseline_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc "Deletes a patch baseline.\n"]
module DeleteResourceDataSync :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_data_sync_request ->
        (delete_resource_data_sync_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceDataSyncInvalidConfigurationException of
              resource_data_sync_invalid_configuration_exception 
          | `ResourceDataSyncNotFoundException of
              resource_data_sync_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes a resource data sync configuration. After the configuration is deleted, changes to data on managed nodes are no longer synced to or from the target. Deleting a sync configuration doesn't delete data.\n"]
module DeleteResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_request ->
        (delete_resource_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `MalformedResourcePolicyDocumentException of
              malformed_resource_policy_document_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourcePolicyConflictException of
              resource_policy_conflict_exception 
          | `ResourcePolicyInvalidParameterException of
              resource_policy_invalid_parameter_exception 
          | `ResourcePolicyNotFoundException of
              resource_policy_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes a Systems Manager resource policy. A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. The following resources support Systems Manager resource policies.\n\n {ul\n       {-   [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).\n           \n            }\n       {-   [Parameter] - The resource policy is used to share a parameter with other accounts using Resource Access Manager (RAM). For more information about cross-account sharing of parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.\n           \n            }\n       }\n  "]
module DeregisterManagedInstance :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_managed_instance_request ->
        (deregister_managed_instance_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidInstanceId of invalid_instance_id ]) result
end[@@ocaml.doc
     "Removes the server or virtual machine from the list of registered servers.\n\n If you want to reregister an on-premises server, edge device, or VM, you must use a different Activation Code and Activation ID than used to register the machine previously. The Activation Code and Activation ID must not have already been used on the maximum number of activations specified when they were created. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/fleet-manager-deregister-hybrid-nodes.html}Deregistering managed nodes in a hybrid and multicloud environment} in the {i Amazon Web Services Systems Manager User Guide}.\n "]
module DeregisterPatchBaselineForPatchGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_patch_baseline_for_patch_group_request ->
        (deregister_patch_baseline_for_patch_group_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id ]) result
end[@@ocaml.doc "Removes a patch group from a patch baseline.\n"]
module DeregisterTargetFromMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_target_from_maintenance_window_request ->
        (deregister_target_from_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error 
          | `TargetInUseException of target_in_use_exception ]) result
end[@@ocaml.doc "Removes a target from a maintenance window.\n"]
module DeregisterTaskFromMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_task_from_maintenance_window_request ->
        (deregister_task_from_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc "Removes a task from a maintenance window.\n"]
module DescribeActivations :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activations_request ->
        (describe_activations_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Describes details about the activation, such as the date and time the activation was created, its expiration date, the Identity and Access Management (IAM) role assigned to the managed nodes in the activation, and the number of nodes registered by using this activation.\n"]
module DescribeAssociation :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_request ->
        (describe_association_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `InternalServerError of internal_server_error 
          | `InvalidAssociationVersion of invalid_association_version 
          | `InvalidDocument of invalid_document 
          | `InvalidInstanceId of invalid_instance_id ]) result
end[@@ocaml.doc
     "Describes the association for the specified target or managed node. If you created the association by using the [Targets] parameter, then you must retrieve the association by using the association ID.\n"]
module DescribeAssociationExecutionTargets :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_execution_targets_request ->
        (describe_association_execution_targets_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `AssociationExecutionDoesNotExist of
              association_execution_does_not_exist 
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Views information about a specific execution of a specific association.\n"]
module DescribeAssociationExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_executions_request ->
        (describe_association_executions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc "Views all executions for a specific association ID. \n"]
module DescribeAutomationExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_automation_executions_request ->
        (describe_automation_executions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidFilterValue of invalid_filter_value 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Provides details about all active and terminated Automation executions.\n"]
module DescribeAutomationStepExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_automation_step_executions_request ->
        (describe_automation_step_executions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AutomationExecutionNotFoundException of
              automation_execution_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidFilterValue of invalid_filter_value 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Information about all active and terminated step executions in an Automation workflow.\n"]
module DescribeAvailablePatches :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_available_patches_request ->
        (describe_available_patches_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Lists all patches eligible to be included in a patch baseline.\n\n  Currently, [DescribeAvailablePatches] supports only the Amazon Linux 1, Amazon Linux 2, and Windows Server operating systems.\n  \n   "]
module DescribeDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_document_request ->
        (describe_document_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentVersion of invalid_document_version ]) result
end[@@ocaml.doc
     "Describes the specified Amazon Web Services Systems Manager document (SSM document).\n"]
module DescribeDocumentPermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_document_permission_request ->
        (describe_document_permission_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentOperation of invalid_document_operation 
          | `InvalidNextToken of invalid_next_token 
          | `InvalidPermissionType of invalid_permission_type ]) result
end[@@ocaml.doc
     "Describes the permissions for a Amazon Web Services Systems Manager document (SSM document). If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's Amazon Web Services account ID) or publicly ({i All}). \n"]
module DescribeEffectiveInstanceAssociations :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_effective_instance_associations_request ->
        (describe_effective_instance_associations_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc "All associations for the managed nodes.\n"]
module DescribeEffectivePatchesForPatchBaseline :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_effective_patches_for_patch_baseline_request ->
        (describe_effective_patches_for_patch_baseline_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id 
          | `UnsupportedOperatingSystem of unsupported_operating_system ])
          result
end[@@ocaml.doc
     "Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Applies to patch baselines for Windows only.\n"]
module DescribeInstanceAssociationsStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_associations_status_request ->
        (describe_instance_associations_status_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc "The status of the associations for the managed nodes.\n"]
module DescribeInstanceInformation :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_information_request ->
        (describe_instance_information_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidInstanceInformationFilterValue of
              invalid_instance_information_filter_value 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Provides information about one or more of your managed nodes, including the operating system platform, SSM Agent version, association status, and IP address. This operation does not return information for nodes that are either Stopped or Terminated.\n\n If you specify one or more node IDs, the operation returns information for those managed nodes. If you don't specify node IDs, it returns information for all your managed nodes. If you specify a node ID that isn't valid or a node that you don't own, you receive an error.\n \n   The [IamRole] field returned for this API operation is the role assigned to an Amazon EC2 instance configured with a Systems Manager Quick Setup host management configuration or the role assigned to an on-premises managed node.\n   \n    "]
module DescribeInstancePatchStates :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patch_states_request ->
        (describe_instance_patch_states_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Retrieves the high-level patch state of one or more managed nodes.\n"]
module DescribeInstancePatchStatesForPatchGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patch_states_for_patch_group_request ->
        (describe_instance_patch_states_for_patch_group_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Retrieves the high-level patch state for the managed nodes in the specified patch group.\n"]
module DescribeInstancePatches :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patches_request ->
        (describe_instance_patches_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Retrieves information about the patches on the specified managed node and their state relative to the patch baseline being used for the node.\n"]
module DescribeInstanceProperties :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_properties_request ->
        (describe_instance_properties_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidActivationId of invalid_activation_id 
          | `InvalidDocument of invalid_document 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidInstancePropertyFilterValue of
              invalid_instance_property_filter_value 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "An API operation used by the Systems Manager console to display information about Systems Manager managed nodes.\n"]
module DescribeInventoryDeletions :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_inventory_deletions_request ->
        (describe_inventory_deletions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDeletionIdException of invalid_deletion_id_exception 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc "Describes a specific delete inventory operation.\n"]
module DescribeMaintenanceWindowExecutionTaskInvocations :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_execution_task_invocations_request ->
        (describe_maintenance_window_execution_task_invocations_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.\n"]
module DescribeMaintenanceWindowExecutionTasks :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_execution_tasks_request ->
        (describe_maintenance_window_execution_tasks_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "For a given maintenance window execution, lists the tasks that were run.\n"]
module DescribeMaintenanceWindowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_executions_request ->
        (describe_maintenance_window_executions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.\n"]
module DescribeMaintenanceWindowSchedule :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_schedule_request ->
        (describe_maintenance_window_schedule_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves information about upcoming executions of a maintenance window.\n"]
module DescribeMaintenanceWindowTargets :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_targets_request ->
        (describe_maintenance_window_targets_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Lists the targets registered with the maintenance window.\n"]
module DescribeMaintenanceWindowTasks :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_tasks_request ->
        (describe_maintenance_window_tasks_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Lists the tasks in a maintenance window.\n\n  For maintenance window tasks without a specified target, you can't supply values for [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. These values don't affect the running of your task and can be ignored.\n  \n   "]
module DescribeMaintenanceWindows :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_windows_request ->
        (describe_maintenance_windows_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves the maintenance windows in an Amazon Web Services account.\n"]
module DescribeMaintenanceWindowsForTarget :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_windows_for_target_request ->
        (describe_maintenance_windows_for_target_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves information about the maintenance window targets or tasks that a managed node is associated with.\n"]
module DescribeOpsItems :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_ops_items_request ->
        (describe_ops_items_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Query a set of OpsItems. You must have permission in Identity and Access Management (IAM) to query a list of OpsItems. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n "]
module DescribeParameters :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_parameters_request ->
        (describe_parameters_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidFilterOption of invalid_filter_option 
          | `InvalidFilterValue of invalid_filter_value 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Lists the parameters in your Amazon Web Services account or the parameters shared with you when you enable the {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html#systemsmanager-DescribeParameters-request-Shared}Shared} option.\n\n Request results are returned on a best-effort basis. If you specify [MaxResults] in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of [MaxResults]. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call to get the next set of results.\n \n   If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also update the key alias the parameter uses to reference KMS. Otherwise, [DescribeParameters] retrieves whatever the original key alias was referencing.\n   \n    "]
module DescribePatchBaselines :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_baselines_request ->
        (describe_patch_baselines_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Lists the patch baselines in your Amazon Web Services account.\n"]
module DescribePatchGroupState :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_group_state_request ->
        (describe_patch_group_state_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Returns high-level aggregated patch compliance state information for a patch group.\n"]
module DescribePatchGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_groups_request ->
        (describe_patch_groups_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Lists all patch groups that have been registered with patch baselines.\n"]
module DescribePatchProperties :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_properties_request ->
        (describe_patch_properties_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for operations such as [CreatePatchBaseline], [UpdatePatchBaseline], [DescribeAvailablePatches], and [DescribePatchBaselines].\n\n The following section lists the properties that can be used in filters for each major operating system type:\n \n   AMAZON_LINUX  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n                 \n                   AMAZON_LINUX_2  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n                                   \n                                     AMAZON_LINUX_2023  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n                                                        \n                                                          CENTOS  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n                                                                  \n                                                                    DEBIAN  Valid properties: [PRODUCT] | [PRIORITY] \n                                                                            \n                                                                              MACOS  \nValid properties: [PRODUCT] | [CLASSIFICATION] \n\n  ORACLE_LINUX  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n                \n                  REDHAT_ENTERPRISE_LINUX  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n                                           \n                                             SUSE  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n                                                   \n                                                     UBUNTU  Valid properties: [PRODUCT] | [PRIORITY] \n                                                             \n                                                               WINDOWS  Valid properties: [PRODUCT] | [PRODUCT_FAMILY] | [CLASSIFICATION] | [MSRC_SEVERITY] \n                                                                        \n                                                                          "]
module DescribeSessions :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_sessions_request ->
        (describe_sessions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.\n"]
module DisassociateOpsItemRelatedItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_ops_item_related_item_request ->
        (disassociate_ops_item_related_item_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemConflictException of ops_item_conflict_exception 
          | `OpsItemInvalidParameterException of
              ops_item_invalid_parameter_exception 
          | `OpsItemNotFoundException of ops_item_not_found_exception 
          | `OpsItemRelatedItemAssociationNotFoundException of
              ops_item_related_item_association_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes the association between an OpsItem and a related item. For example, this API operation can delete an Incident Manager incident from an OpsItem. Incident Manager is a tool in Amazon Web Services Systems Manager.\n"]
module GetAccessToken :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_token_request ->
        (get_access_token_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns a credentials set to be used with just-in-time node access.\n"]
module GetAutomationExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_automation_execution_request ->
        (get_automation_execution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AutomationExecutionNotFoundException of
              automation_execution_not_found_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Get detailed information about a particular Automation execution.\n"]
module GetCalendarState :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_calendar_state_request ->
        (get_calendar_state_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentType of invalid_document_type 
          | `UnsupportedCalendarException of unsupported_calendar_exception ])
          result
end[@@ocaml.doc
     "Gets the state of a Amazon Web Services Systems Manager change calendar at the current time or a specified time. If you specify a time, [GetCalendarState] returns the state of the calendar at that specific time, and returns the next time that the change calendar state will transition. If you don't specify a time, [GetCalendarState] uses the current time. Change Calendar entries have two possible states: [OPEN] or [CLOSED].\n\n If you specify more than one calendar in a request, the command returns the status of [OPEN] only if all calendars in the request are open. If one or more calendars in the request are closed, the status returned is [CLOSED].\n \n  For more information about Change Calendar, a tool in Amazon Web Services Systems Manager, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.\n  "]
module GetCommandInvocation :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_command_invocation_request ->
        (get_command_invocation_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidCommandId of invalid_command_id 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidPluginName of invalid_plugin_name 
          | `InvocationDoesNotExist of invocation_does_not_exist ]) result
end[@@ocaml.doc
     "Returns detailed information about command execution for an invocation or plugin. The Run Command API follows an eventual consistency model, due to the distributed nature of the system supporting the API. This means that the result of an API command you run that affects your resources might not be immediately visible to all subsequent commands you run. You should keep this in mind when you carry out an API command that immediately follows a previous API command.\n\n  [GetCommandInvocation] only gives the execution status of a plugin in a document. To get the command execution status on a specific managed node, use [ListCommandInvocations]. To get the command execution status across managed nodes, use [ListCommands].\n "]
module GetConnectionStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_connection_status_request ->
        (get_connection_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves the Session Manager connection status for a managed node to determine whether it is running and ready to receive Session Manager connections.\n"]
module GetDefaultPatchBaseline :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_default_patch_baseline_request ->
        (get_default_patch_baseline_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves the default patch baseline. Amazon Web Services Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.\n\n If you don't specify an operating system value, the default patch baseline for Windows is returned.\n "]
module GetDeployablePatchSnapshotForInstance :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_deployable_patch_snapshot_for_instance_request ->
        (get_deployable_patch_snapshot_for_instance_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `UnsupportedFeatureRequiredException of
              unsupported_feature_required_exception 
          | `UnsupportedOperatingSystem of unsupported_operating_system ])
          result
end[@@ocaml.doc
     "Retrieves the current snapshot for the patch baseline the managed node uses. This API is primarily used by the [AWS-RunPatchBaseline] Systems Manager document (SSM document).\n\n  If you run the command locally, such as with the Command Line Interface (CLI), the system attempts to use your local Amazon Web Services credentials and the operation fails. To avoid this, you can run the command in the Amazon Web Services Systems Manager console. Use Run Command, a tool in Amazon Web Services Systems Manager, with an SSM document that enables you to target a managed node with a script or command. For example, run the command using the [AWS-RunShellScript] document or the [AWS-RunPowerShellScript] document.\n  \n   "]
module GetDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_document_request ->
        (get_document_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentVersion of invalid_document_version ]) result
end[@@ocaml.doc
     "Gets the contents of the specified Amazon Web Services Systems Manager document (SSM document).\n"]
module GetExecutionPreview :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_execution_preview_request ->
        (get_execution_preview_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Initiates the process of retrieving an existing preview that shows the effects that running a specified Automation runbook would have on the targeted resources.\n"]
module GetInventory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_inventory_request ->
        (get_inventory_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidAggregatorException of invalid_aggregator_exception 
          | `InvalidFilter of invalid_filter 
          | `InvalidInventoryGroupException of
              invalid_inventory_group_exception 
          | `InvalidNextToken of invalid_next_token 
          | `InvalidResultAttributeException of
              invalid_result_attribute_exception 
          | `InvalidTypeNameException of invalid_type_name_exception ])
          result
end[@@ocaml.doc
     "Query inventory information. This includes managed node status, such as [Stopped] or [Terminated].\n"]
module GetInventorySchema :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_inventory_schema_request ->
        (get_inventory_schema_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token 
          | `InvalidTypeNameException of invalid_type_name_exception ])
          result
end[@@ocaml.doc
     "Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.\n"]
module GetMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_request ->
        (get_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc "Retrieves a maintenance window.\n"]
module GetMaintenanceWindowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_request ->
        (get_maintenance_window_execution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves details about a specific a maintenance window execution.\n"]
module GetMaintenanceWindowExecutionTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_task_request ->
        (get_maintenance_window_execution_task_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves the details about a specific task run as part of a maintenance window execution.\n"]
module GetMaintenanceWindowExecutionTaskInvocation :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_task_invocation_request ->
        (get_maintenance_window_execution_task_invocation_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves information about a specific task running on a specific target.\n"]
module GetMaintenanceWindowTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_task_request ->
        (get_maintenance_window_task_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves the details of a maintenance window task.\n\n  For maintenance window tasks without a specified target, you can't supply values for [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. These values don't affect the running of your task and can be ignored.\n  \n    To retrieve a list of tasks in a maintenance window, instead use the [DescribeMaintenanceWindowTasks] command.\n    "]
module GetOpsItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_item_request ->
        (get_ops_item_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemAccessDeniedException of ops_item_access_denied_exception 
          | `OpsItemNotFoundException of ops_item_not_found_exception ])
          result
end[@@ocaml.doc
     "Get information about an OpsItem by using the ID. You must have permission in Identity and Access Management (IAM) to view information about an OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n "]
module GetOpsMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_metadata_request ->
        (get_ops_metadata_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsMetadataInvalidArgumentException of
              ops_metadata_invalid_argument_exception 
          | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ])
          result
end[@@ocaml.doc
     "View operational metadata related to an application in Application Manager.\n"]
module GetOpsSummary :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_summary_request ->
        (get_ops_summary_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidAggregatorException of invalid_aggregator_exception 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token 
          | `InvalidTypeNameException of invalid_type_name_exception 
          | `ResourceDataSyncNotFoundException of
              resource_data_sync_not_found_exception ])
          result
end[@@ocaml.doc
     "View a summary of operations metadata (OpsData) based on specified filters and aggregators. OpsData can include information about Amazon Web Services Systems Manager OpsCenter operational workitems (OpsItems) as well as information about any Amazon Web Services resource or service configured to report OpsData to Amazon Web Services Systems Manager Explorer. \n"]
module GetParameter :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameter_request ->
        (get_parameter_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidKeyId of invalid_key_id 
          | `ParameterNotFound of parameter_not_found 
          | `ParameterVersionNotFound of parameter_version_not_found ])
          result
end[@@ocaml.doc
     "Get information about a single parameter by specifying the parameter name.\n\n  To get information about more than one parameter at a time, use the [GetParameters] operation.\n  \n   "]
module GetParameterHistory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameter_history_request ->
        (get_parameter_history_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidKeyId of invalid_key_id 
          | `InvalidNextToken of invalid_next_token 
          | `ParameterNotFound of parameter_not_found ]) result
end[@@ocaml.doc
     "Retrieves the history of all changes to a parameter.\n\n  If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also update the key alias the parameter uses to reference KMS. Otherwise, [GetParameterHistory] retrieves whatever the original key alias was referencing.\n  \n   "]
module GetParameters :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_request ->
        (get_parameters_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidKeyId of invalid_key_id ]) result
end[@@ocaml.doc
     "Get information about one or more parameters by specifying multiple parameter names.\n\n  To get information about a single parameter, you can use the [GetParameter] operation instead.\n  \n   "]
module GetParametersByPath :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_by_path_request ->
        (get_parameters_by_path_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidFilterOption of invalid_filter_option 
          | `InvalidFilterValue of invalid_filter_value 
          | `InvalidKeyId of invalid_key_id 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Retrieve information about one or more parameters under a specified level in a hierarchy. \n\n Request results are returned on a best-effort basis. If you specify [MaxResults] in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of [MaxResults]. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call to get the next set of results.\n "]
module GetPatchBaseline :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_patch_baseline_request ->
        (get_patch_baseline_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id ]) result
end[@@ocaml.doc "Retrieves information about a patch baseline.\n"]
module GetPatchBaselineForPatchGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_patch_baseline_for_patch_group_request ->
        (get_patch_baseline_for_patch_group_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Retrieves the patch baseline that should be used for the specified patch group.\n"]
module GetResourcePolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policies_request ->
        (get_resource_policies_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourcePolicyInvalidParameterException of
              resource_policy_invalid_parameter_exception ])
          result
end[@@ocaml.doc "Returns an array of the [Policy] object.\n"]
module GetServiceSetting :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_setting_request ->
        (get_service_setting_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ServiceSettingNotFound of service_setting_not_found ]) result
end[@@ocaml.doc
     " [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of [false]. This means the user can't use this feature unless they change the setting to [true] and intentionally opt in for a paid feature.\n\n Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [UpdateServiceSetting] API operation to change the default setting. Or use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.\n \n  Query the current service setting for the Amazon Web Services account. \n  "]
module LabelParameterVersion :
sig
  val request :
    Smaws_Lib.Context.t ->
      label_parameter_version_request ->
        (label_parameter_version_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ParameterNotFound of parameter_not_found 
          | `ParameterVersionLabelLimitExceeded of
              parameter_version_label_limit_exceeded 
          | `ParameterVersionNotFound of parameter_version_not_found 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Amazon Web Services Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions. \n\n Parameter labels have the following requirements and restrictions.\n \n  {ul\n        {-  A version of a parameter can have a maximum of 10 labels.\n            \n             }\n        {-  You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.\n            \n             }\n        {-  You can move a label from one version of a parameter to another.\n            \n             }\n        {-  You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.\n            \n             }\n        {-  If you no longer want to use a parameter label, then you can either delete it or move it to a different version of a parameter.\n            \n             }\n        {-  A label can have a maximum of 100 characters.\n            \n             }\n        {-  Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).\n            \n             }\n        {-  Labels can't begin with a number, \"[aws]\" or \"[ssm]\" (not case sensitive). If a label fails to meet these requirements, then the label isn't associated with a parameter and the system displays it in the list of InvalidLabels.\n            \n             }\n        }\n  "]
module ListAssociationVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_association_versions_request ->
        (list_association_versions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Retrieves all versions of an association for a specific association ID.\n"]
module ListAssociations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_associations_request ->
        (list_associations_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Returns all State Manager associations in the current Amazon Web Services account and Amazon Web Services Region. You can limit the results to a specific State Manager association document or managed node by specifying a filter. State Manager is a tool in Amazon Web Services Systems Manager.\n"]
module ListCommandInvocations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_command_invocations_request ->
        (list_command_invocations_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidCommandId of invalid_command_id 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "An invocation is copy of a command sent to a specific managed node. A command can apply to one or more managed nodes. A command invocation applies to one managed node. For example, if a user runs [SendCommand] against three managed nodes, then a command invocation is created for each requested managed node ID. [ListCommandInvocations] provide status about command execution.\n"]
module ListCommands :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_commands_request ->
        (list_commands_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidCommandId of invalid_command_id 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Lists the commands requested by users of the Amazon Web Services account.\n"]
module ListComplianceItems :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_items_request ->
        (list_compliance_items_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token 
          | `InvalidResourceId of invalid_resource_id 
          | `InvalidResourceType of invalid_resource_type ]) result
end[@@ocaml.doc
     "For a specified resource ID, this API operation returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.\n"]
module ListComplianceSummaries :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_summaries_request ->
        (list_compliance_summaries_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.\n"]
module ListDocumentMetadataHistory :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_document_metadata_history_request ->
        (list_document_metadata_history_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentVersion of invalid_document_version 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Information about approval reviews for a version of a change template in Change Manager.\n"]
module ListDocumentVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_document_versions_request ->
        (list_document_versions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc "List all versions for a document.\n"]
module ListDocuments :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_documents_request ->
        (list_documents_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilterKey of invalid_filter_key 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Returns all Systems Manager (SSM) documents in the current Amazon Web Services account and Amazon Web Services Region. You can limit the results of this request by using a filter.\n"]
module ListInventoryEntries :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_inventory_entries_request ->
        (list_inventory_entries_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidNextToken of invalid_next_token 
          | `InvalidTypeNameException of invalid_type_name_exception ])
          result
end[@@ocaml.doc "A list of inventory items returned by the request.\n"]
module ListNodes :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_nodes_request ->
        (list_nodes_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token 
          | `ResourceDataSyncNotFoundException of
              resource_data_sync_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Takes in filters and returns a list of managed nodes matching the filter criteria.\n"]
module ListNodesSummary :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_nodes_summary_request ->
        (list_nodes_summary_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidAggregatorException of invalid_aggregator_exception 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token 
          | `ResourceDataSyncNotFoundException of
              resource_data_sync_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Generates a summary of managed instance/node metadata based on the filters and aggregators you specify. Results are grouped by the input aggregator you specify.\n"]
module ListOpsItemEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_item_events_request ->
        (list_ops_item_events_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemInvalidParameterException of
              ops_item_invalid_parameter_exception 
          | `OpsItemLimitExceededException of
              ops_item_limit_exceeded_exception 
          | `OpsItemNotFoundException of ops_item_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns a list of all OpsItem events in the current Amazon Web Services Region and Amazon Web Services account. You can limit the results to events associated with specific OpsItems by specifying a filter.\n"]
module ListOpsItemRelatedItems :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_item_related_items_request ->
        (list_ops_item_related_items_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemInvalidParameterException of
              ops_item_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Lists all related-item resources associated with a Systems Manager OpsCenter OpsItem. OpsCenter is a tool in Amazon Web Services Systems Manager.\n"]
module ListOpsMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_metadata_request ->
        (list_ops_metadata_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsMetadataInvalidArgumentException of
              ops_metadata_invalid_argument_exception ])
          result
end[@@ocaml.doc
     "Amazon Web Services Systems Manager calls this API operation when displaying all Application Manager OpsMetadata objects or blobs.\n"]
module ListResourceComplianceSummaries :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_compliance_summaries_request ->
        (list_resource_compliance_summaries_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidFilter of invalid_filter 
          | `InvalidNextToken of invalid_next_token ]) result
end[@@ocaml.doc
     "Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.\n"]
module ListResourceDataSync :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_data_sync_request ->
        (list_resource_data_sync_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidNextToken of invalid_next_token 
          | `ResourceDataSyncInvalidConfigurationException of
              resource_data_sync_invalid_configuration_exception ])
          result
end[@@ocaml.doc
     "Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.\n\n The number of sync configurations might be too large to return using a single call to [ListResourceDataSync]. You can limit the number of sync configurations returned by using the [MaxResults] parameter. To determine whether there are more sync configurations to list, check the value of [NextToken] in the output. If there are more sync configurations to list, you can request them by specifying the [NextToken] returned in the call to the parameter of a subsequent call. \n "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id 
          | `InvalidResourceType of invalid_resource_type ]) result
end[@@ocaml.doc
     "Returns a list of the tags assigned to the specified resource.\n\n For information about the ID format for each supported resource type, see [AddTagsToResource].\n "]
module ModifyDocumentPermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      modify_document_permission_request ->
        (modify_document_permission_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DocumentLimitExceeded of document_limit_exceeded 
          | `DocumentPermissionLimit of document_permission_limit 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidPermissionType of invalid_permission_type ]) result
end[@@ocaml.doc
     "Shares a Amazon Web Services Systems Manager document (SSM document)publicly or privately. If you share a document privately, you must specify the Amazon Web Services user IDs for those people who can use the document. If you share a document publicly, you must specify {i All} as the account ID.\n"]
module PutComplianceItems :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_compliance_items_request ->
        (put_compliance_items_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ComplianceTypeCountLimitExceededException of
              compliance_type_count_limit_exceeded_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidItemContentException of invalid_item_content_exception 
          | `InvalidResourceId of invalid_resource_id 
          | `InvalidResourceType of invalid_resource_type 
          | `ItemSizeLimitExceededException of
              item_size_limit_exceeded_exception 
          | `TotalSizeLimitExceededException of
              total_size_limit_exceeded_exception ])
          result
end[@@ocaml.doc
     "Registers a compliance type and other compliance details on a designated resource. This operation lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.\n\n ComplianceType can be one of the following:\n \n  {ul\n        {-  ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.\n            \n             }\n        {-  ExecutionType: Specify patch, association, or Custom:[string].\n            \n             }\n        {-  ExecutionTime. The time the patch, association, or custom compliance item was applied to the managed node.\n            \n             }\n        {-  Id: The patch, association, or custom compliance ID.\n            \n             }\n        {-  Title: A title.\n            \n             }\n        {-  Status: The status of the compliance item. For example, [approved] for patches, or [Failed] for associations.\n            \n             }\n        {-  Severity: A patch severity. For example, [Critical].\n            \n             }\n        {-  DocumentName: An SSM document name. For example, [AWS-RunPatchBaseline].\n            \n             }\n        {-  DocumentVersion: An SSM document version number. For example, 4.\n            \n             }\n        {-  Classification: A patch classification. For example, [security updates].\n            \n             }\n        {-  PatchBaselineId: A patch baseline ID.\n            \n             }\n        {-  PatchSeverity: A patch severity. For example, [Critical].\n            \n             }\n        {-  PatchState: A patch state. For example, [InstancesWithFailedPatches].\n            \n             }\n        {-  PatchGroup: The name of a patch group.\n            \n             }\n        {-  InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: [yyyy-MM-dd'T'HH:mm:ss'Z'] \n            \n             }\n        }\n  "]
module PutInventory :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_inventory_request ->
        (put_inventory_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CustomSchemaCountLimitExceededException of
              custom_schema_count_limit_exceeded_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidInventoryItemContextException of
              invalid_inventory_item_context_exception 
          | `InvalidItemContentException of invalid_item_content_exception 
          | `InvalidTypeNameException of invalid_type_name_exception 
          | `ItemContentMismatchException of item_content_mismatch_exception 
          | `ItemSizeLimitExceededException of
              item_size_limit_exceeded_exception 
          | `SubTypeCountLimitExceededException of
              sub_type_count_limit_exceeded_exception 
          | `TotalSizeLimitExceededException of
              total_size_limit_exceeded_exception 
          | `UnsupportedInventoryItemContextException of
              unsupported_inventory_item_context_exception 
          | `UnsupportedInventorySchemaVersionException of
              unsupported_inventory_schema_version_exception ])
          result
end[@@ocaml.doc
     "Bulk update custom inventory items on one or more managed nodes. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.\n"]
module PutParameter :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_parameter_request ->
        (put_parameter_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `HierarchyLevelLimitExceededException of
              hierarchy_level_limit_exceeded_exception 
          | `HierarchyTypeMismatchException of
              hierarchy_type_mismatch_exception 
          | `IncompatiblePolicyException of incompatible_policy_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidAllowedPatternException of
              invalid_allowed_pattern_exception 
          | `InvalidKeyId of invalid_key_id 
          | `InvalidPolicyAttributeException of
              invalid_policy_attribute_exception 
          | `InvalidPolicyTypeException of invalid_policy_type_exception 
          | `ParameterAlreadyExists of parameter_already_exists 
          | `ParameterLimitExceeded of parameter_limit_exceeded 
          | `ParameterMaxVersionLimitExceeded of
              parameter_max_version_limit_exceeded 
          | `ParameterPatternMismatchException of
              parameter_pattern_mismatch_exception 
          | `PoliciesLimitExceededException of
              policies_limit_exceeded_exception 
          | `TooManyUpdates of too_many_updates 
          | `UnsupportedParameterType of unsupported_parameter_type ]) result
end[@@ocaml.doc "Create or update a parameter in Parameter Store.\n"]
module PutResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_request ->
        (put_resource_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `MalformedResourcePolicyDocumentException of
              malformed_resource_policy_document_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourcePolicyConflictException of
              resource_policy_conflict_exception 
          | `ResourcePolicyInvalidParameterException of
              resource_policy_invalid_parameter_exception 
          | `ResourcePolicyLimitExceededException of
              resource_policy_limit_exceeded_exception 
          | `ResourcePolicyNotFoundException of
              resource_policy_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates or updates a Systems Manager resource policy. A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. The following resources support Systems Manager resource policies.\n\n {ul\n       {-   [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).\n           \n            }\n       {-   [Parameter] - The resource policy is used to share a parameter with other accounts using Resource Access Manager (RAM). \n           \n            To share a parameter, it must be in the advanced parameter tier. For information about parameter tiers, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html}Managing parameter tiers}. For information about changing an existing standard parameter to an advanced parameter, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html#parameter-store-advanced-parameters-enabling}Changing a standard parameter to an advanced parameter}.\n            \n             To share a [SecureString] parameter, it must be encrypted with a customer managed key, and you must share the key separately through Key Management Service. Amazon Web Services managed keys cannot be shared. Parameters encrypted with the default Amazon Web Services managed key can be updated to use a customer managed key instead. For KMS key definitions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html}KMS concepts} in the {i Key Management Service Developer Guide}.\n             \n               While you can share a parameter using the Systems Manager [PutResourcePolicy] operation, we recommend using Resource Access Manager (RAM) instead. This is because using [PutResourcePolicy] requires the extra step of promoting the parameter to a standard RAM Resource Share using the RAM {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html}PromoteResourceShareCreatedFromPolicy} API operation. Otherwise, the parameter won't be returned by the Systems Manager {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html}DescribeParameters} API operation using the [--shared] option.\n               \n                For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html#share}Sharing a parameter} in the {i Amazon Web Services Systems Manager User Guide} \n                \n                  }\n       }\n  "]
module RegisterDefaultPatchBaseline :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_default_patch_baseline_request ->
        (register_default_patch_baseline_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id ]) result
end[@@ocaml.doc
     "Defines the default patch baseline for the relevant operating system.\n\n To reset the Amazon Web Services-predefined patch baseline as the default, specify the full patch baseline Amazon Resource Name (ARN) as the baseline ID value. For example, for CentOS, specify [arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed] instead of [pb-0574b43a65ea646ed].\n "]
module RegisterPatchBaselineForPatchGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_patch_baseline_for_patch_group_request ->
        (register_patch_baseline_for_patch_group_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AlreadyExistsException of already_exists_exception 
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id 
          | `ResourceLimitExceededException of
              resource_limit_exceeded_exception ])
          result
end[@@ocaml.doc "Registers a patch baseline for a patch group.\n"]
module RegisterTargetWithMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_target_with_maintenance_window_request ->
        (register_target_with_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `IdempotentParameterMismatch of idempotent_parameter_mismatch 
          | `InternalServerError of internal_server_error 
          | `ResourceLimitExceededException of
              resource_limit_exceeded_exception ])
          result
end[@@ocaml.doc "Registers a target with a maintenance window.\n"]
module RegisterTaskWithMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_task_with_maintenance_window_request ->
        (register_task_with_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `FeatureNotAvailableException of feature_not_available_exception 
          | `IdempotentParameterMismatch of idempotent_parameter_mismatch 
          | `InternalServerError of internal_server_error 
          | `ResourceLimitExceededException of
              resource_limit_exceeded_exception ])
          result
end[@@ocaml.doc "Adds a new task to a maintenance window.\n"]
module RemoveTagsFromResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_resource_request ->
        (remove_tags_from_resource_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidResourceId of invalid_resource_id 
          | `InvalidResourceType of invalid_resource_type 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc "Removes tag keys from the specified resource.\n"]
module ResetServiceSetting :
sig
  val request :
    Smaws_Lib.Context.t ->
      reset_service_setting_request ->
        (reset_service_setting_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ServiceSettingNotFound of service_setting_not_found 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     " [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of \"false\". This means the user can't use this feature unless they change the setting to \"true\" and intentionally opt in for a paid feature.\n\n Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [GetServiceSetting] API operation to view the current value. Use the [UpdateServiceSetting] API operation to change the default setting. \n \n  Reset the service setting for the account to the default value as provisioned by the Amazon Web Services service team. \n  "]
module ResumeSession :
sig
  val request :
    Smaws_Lib.Context.t ->
      resume_session_request ->
        (resume_session_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Reconnects a session to a managed node after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.\n\n  This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It isn't intended for any other use.\n  \n   "]
module SendAutomationSignal :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_automation_signal_request ->
        (send_automation_signal_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AutomationExecutionNotFoundException of
              automation_execution_not_found_exception 
          | `AutomationStepNotFoundException of
              automation_step_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidAutomationSignalException of
              invalid_automation_signal_exception ])
          result
end[@@ocaml.doc
     "Sends a signal to an Automation execution to change the current behavior or status of the execution. \n"]
module SendCommand :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_command_request ->
        (send_command_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DuplicateInstanceId of duplicate_instance_id 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentVersion of invalid_document_version 
          | `InvalidInstanceId of invalid_instance_id 
          | `InvalidNotificationConfig of invalid_notification_config 
          | `InvalidOutputFolder of invalid_output_folder 
          | `InvalidParameters of invalid_parameters 
          | `InvalidRole of invalid_role 
          | `MaxDocumentSizeExceeded of max_document_size_exceeded 
          | `UnsupportedPlatformType of unsupported_platform_type ]) result
end[@@ocaml.doc "Runs commands on one or more managed nodes.\n"]
module StartAccessRequest :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_access_request_request ->
        (start_access_request_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Starts the workflow for just-in-time node access sessions.\n"]
module StartAssociationsOnce :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_associations_once_request ->
        (start_associations_once_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `InvalidAssociation of invalid_association ]) result
end[@@ocaml.doc
     "Runs an association immediately and only one time. This operation can be helpful when troubleshooting associations.\n"]
module StartAutomationExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_automation_execution_request ->
        (start_automation_execution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AutomationDefinitionNotFoundException of
              automation_definition_not_found_exception 
          | `AutomationDefinitionVersionNotFoundException of
              automation_definition_version_not_found_exception 
          | `AutomationExecutionLimitExceededException of
              automation_execution_limit_exceeded_exception 
          | `IdempotentParameterMismatch of idempotent_parameter_mismatch 
          | `InternalServerError of internal_server_error 
          | `InvalidAutomationExecutionParametersException of
              invalid_automation_execution_parameters_exception 
          | `InvalidTarget of invalid_target ]) result
end[@@ocaml.doc "Initiates execution of an Automation runbook.\n"]
module StartChangeRequestExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_change_request_execution_request ->
        (start_change_request_execution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AutomationDefinitionNotApprovedException of
              automation_definition_not_approved_exception 
          | `AutomationDefinitionNotFoundException of
              automation_definition_not_found_exception 
          | `AutomationDefinitionVersionNotFoundException of
              automation_definition_version_not_found_exception 
          | `AutomationExecutionLimitExceededException of
              automation_execution_limit_exceeded_exception 
          | `IdempotentParameterMismatch of idempotent_parameter_mismatch 
          | `InternalServerError of internal_server_error 
          | `InvalidAutomationExecutionParametersException of
              invalid_automation_execution_parameters_exception ])
          result
end[@@ocaml.doc
     "Creates a change request for Change Manager. The Automation runbooks specified in the change request run only after all required approvals for the change request have been received.\n"]
module StartExecutionPreview :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_execution_preview_request ->
        (start_execution_preview_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Initiates the process of creating a preview showing the effects that running a specified Automation runbook would have on the targeted resources.\n"]
module StartSession :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_session_request ->
        (start_session_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `TargetNotConnected of target_not_connected ]) result
end[@@ocaml.doc
     "Initiates a connection to a target (for example, a managed node) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.\n\n  Amazon Web Services CLI usage: [start-session] is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html}Install the Session Manager plugin for the Amazon Web Services CLI} in the {i Amazon Web Services Systems Manager User Guide}.\n  \n   Amazon Web Services Tools for PowerShell usage: Start-SSMSession isn't currently supported by Amazon Web Services Tools for PowerShell on Windows local machines.\n   \n    "]
module StopAutomationExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_automation_execution_request ->
        (stop_automation_execution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AutomationExecutionNotFoundException of
              automation_execution_not_found_exception 
          | `InternalServerError of internal_server_error 
          | `InvalidAutomationStatusUpdateException of
              invalid_automation_status_update_exception ])
          result
end[@@ocaml.doc "Stop an Automation that is currently running.\n"]
module TerminateSession :
sig
  val request :
    Smaws_Lib.Context.t ->
      terminate_session_request ->
        (terminate_session_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the managed node. A terminated session can't be resumed.\n"]
module UnlabelParameterVersion :
sig
  val request :
    Smaws_Lib.Context.t ->
      unlabel_parameter_version_request ->
        (unlabel_parameter_version_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ParameterNotFound of parameter_not_found 
          | `ParameterVersionNotFound of parameter_version_not_found 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc "Remove a label or labels from a parameter.\n"]
module UpdateAssociation :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_association_request ->
        (update_association_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `AssociationVersionLimitExceeded of
              association_version_limit_exceeded 
          | `InternalServerError of internal_server_error 
          | `InvalidAssociationVersion of invalid_association_version 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentVersion of invalid_document_version 
          | `InvalidOutputLocation of invalid_output_location 
          | `InvalidParameters of invalid_parameters 
          | `InvalidSchedule of invalid_schedule 
          | `InvalidTarget of invalid_target 
          | `InvalidTargetMaps of invalid_target_maps 
          | `InvalidUpdate of invalid_update 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon Simple Storage Service (Amazon S3) output. When you call [UpdateAssociation], the system removes all optional parameters from the request and overwrites the association with null values for those parameters. This is by design. You must specify all optional parameters in the call, even if you are not changing the parameters. This includes the [Name] parameter. Before calling this API action, we recommend that you call the [DescribeAssociation] API operation and make a note of all optional parameters required for your [UpdateAssociation] call.\n\n In order to call this API operation, a user, group, or role must be granted permission to call the [DescribeAssociation] API operation. If you don't have permission to call [DescribeAssociation], then you receive the following error: \n {[\n An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User:  isn't authorized to perform: ssm:DescribeAssociation on resource: \n ]}\n  \n \n   When you update an association, the association immediately runs against the specified targets. You can add the [ApplyOnlyAtCronInterval] parameter to run the association during the next schedule run.\n   \n    "]
module UpdateAssociationStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_association_status_request ->
        (update_association_status_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AssociationDoesNotExist of association_does_not_exist 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidInstanceId of invalid_instance_id 
          | `StatusUnchanged of status_unchanged 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Updates the status of the Amazon Web Services Systems Manager document (SSM document) associated with the specified managed node.\n\n  [UpdateAssociationStatus] is primarily used by the Amazon Web Services Systems Manager Agent (SSM Agent) to report status updates about your associations and is only used for associations created with the [InstanceId] legacy parameter.\n "]
module UpdateDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_request ->
        (update_document_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DocumentVersionLimitExceeded of document_version_limit_exceeded 
          | `DuplicateDocumentContent of duplicate_document_content 
          | `DuplicateDocumentVersionName of duplicate_document_version_name 
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentContent of invalid_document_content 
          | `InvalidDocumentOperation of invalid_document_operation 
          | `InvalidDocumentSchemaVersion of invalid_document_schema_version 
          | `InvalidDocumentVersion of invalid_document_version 
          | `MaxDocumentSizeExceeded of max_document_size_exceeded ]) result
end[@@ocaml.doc "Updates one or more values for an SSM document.\n"]
module UpdateDocumentDefaultVersion :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_default_version_request ->
        (update_document_default_version_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentSchemaVersion of invalid_document_schema_version 
          | `InvalidDocumentVersion of invalid_document_version ]) result
end[@@ocaml.doc
     "Set the default version of a document. \n\n  If you change a document version for a State Manager association, Systems Manager immediately runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.\n  \n   "]
module UpdateDocumentMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_metadata_request ->
        (update_document_metadata_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidDocument of invalid_document 
          | `InvalidDocumentOperation of invalid_document_operation 
          | `InvalidDocumentVersion of invalid_document_version 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     "Updates information related to approval reviews for a specific version of a change template in Change Manager.\n"]
module UpdateMaintenanceWindow :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_request ->
        (update_maintenance_window_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Updates an existing maintenance window. Only specified parameters are modified.\n\n  The value you specify for [Duration] determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.\n  \n   "]
module UpdateMaintenanceWindowTarget :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_target_request ->
        (update_maintenance_window_target_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Modifies the target of an existing maintenance window. You can change the following:\n\n {ul\n       {-  Name\n           \n            }\n       {-  Description\n           \n            }\n       {-  Owner\n           \n            }\n       {-  IDs for an ID target\n           \n            }\n       {-  Tags for a Tag target\n           \n            }\n       {-  From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see [Target].\n           \n            }\n       }\n    If a parameter is null, then the corresponding field isn't modified.\n    \n     "]
module UpdateMaintenanceWindowTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_task_request ->
        (update_maintenance_window_task_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:\n\n {ul\n       {-   [TaskARN]. For example, you can change a [RUN_COMMAND] task from [AWS-RunPowerShellScript] to [AWS-RunShellScript].\n           \n            }\n       {-   [ServiceRoleArn] \n           \n            }\n       {-   [TaskInvocationParameters] \n           \n            }\n       {-   [Priority] \n           \n            }\n       {-   [MaxConcurrency] \n           \n            }\n       {-   [MaxErrors] \n           \n            }\n       }\n    One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.\n    \n      If the value for a parameter in [UpdateMaintenanceWindowTask] is null, then the corresponding field isn't modified. If you set [Replace] to true, then all fields required by the [RegisterTaskWithMaintenanceWindow] operation are required for this request. Optional fields that aren't specified are set to null.\n      \n        When you update a maintenance window task that has options specified in [TaskInvocationParameters], you must provide again all the [TaskInvocationParameters] values that you want to retain. The values you don't specify again are removed. For example, suppose that when you registered a Run Command task, you specified [TaskInvocationParameters] values for [Comment], [NotificationConfig], and [OutputS3BucketName]. If you update the maintenance window task and specify only a different [OutputS3BucketName] value, the values for [Comment] and [NotificationConfig] are removed.\n        \n         "]
module UpdateManagedInstanceRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_managed_instance_role_request ->
        (update_managed_instance_role_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `InvalidInstanceId of invalid_instance_id ]) result
end[@@ocaml.doc
     "Changes the Identity and Access Management (IAM) role that is assigned to the on-premises server, edge device, or virtual machines (VM). IAM roles are first assigned to these hybrid nodes during the activation process. For more information, see [CreateActivation].\n"]
module UpdateOpsItem :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_ops_item_request ->
        (update_ops_item_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsItemAccessDeniedException of ops_item_access_denied_exception 
          | `OpsItemAlreadyExistsException of
              ops_item_already_exists_exception 
          | `OpsItemConflictException of ops_item_conflict_exception 
          | `OpsItemInvalidParameterException of
              ops_item_invalid_parameter_exception 
          | `OpsItemLimitExceededException of
              ops_item_limit_exceeded_exception 
          | `OpsItemNotFoundException of ops_item_not_found_exception ])
          result
end[@@ocaml.doc
     "Edit or change an OpsItem. You must have permission in Identity and Access Management (IAM) to update an OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n "]
module UpdateOpsMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_ops_metadata_request ->
        (update_ops_metadata_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `OpsMetadataInvalidArgumentException of
              ops_metadata_invalid_argument_exception 
          | `OpsMetadataKeyLimitExceededException of
              ops_metadata_key_limit_exceeded_exception 
          | `OpsMetadataNotFoundException of ops_metadata_not_found_exception 
          | `OpsMetadataTooManyUpdatesException of
              ops_metadata_too_many_updates_exception ])
          result
end[@@ocaml.doc
     "Amazon Web Services Systems Manager calls this API operation when you edit OpsMetadata in Application Manager.\n"]
module UpdatePatchBaseline :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_patch_baseline_request ->
        (update_patch_baseline_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DoesNotExistException of does_not_exist_exception 
          | `InternalServerError of internal_server_error ]) result
end[@@ocaml.doc
     "Modifies an existing patch baseline. Fields not specified in the request are left unchanged.\n\n  For information about valid key-value pairs in [PatchFilters] for each supported operating system type, see [PatchFilter].\n  \n   "]
module UpdateResourceDataSync :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_resource_data_sync_request ->
        (update_resource_data_sync_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceDataSyncConflictException of
              resource_data_sync_conflict_exception 
          | `ResourceDataSyncInvalidConfigurationException of
              resource_data_sync_invalid_configuration_exception 
          | `ResourceDataSyncNotFoundException of
              resource_data_sync_not_found_exception ])
          result
end[@@ocaml.doc
     "Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the [Include only the current account] option, you can't edit that sync later and choose the [Include all accounts from my Organizations\n    configuration] option. Instead, you must delete the first resource data sync, and create a new one.\n\n  This API operation only supports a resource data sync that was created with a SyncFromSource [SyncType].\n  \n   "]
module UpdateServiceSetting :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_setting_request ->
        (update_service_setting_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ServiceSettingNotFound of service_setting_not_found 
          | `TooManyUpdates of too_many_updates ]) result
end[@@ocaml.doc
     " [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of \"false\". This means the user can't use this feature unless they change the setting to \"true\" and intentionally opt in for a paid feature.\n\n Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [GetServiceSetting] API operation to view the current value. Or, use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.\n \n  Update the service setting for the account. \n  "]