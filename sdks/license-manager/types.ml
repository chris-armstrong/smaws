type nonrec message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The provided input is not valid. Try your request again.\n"]

type nonrec server_internal_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The server experienced an internal error. Try again.\n"]

type nonrec rate_limit_exceeded_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "Too many requests have been submitted. Try again after a brief wait.\n"]

type nonrec invalid_parameter_value_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "One or more parameter values are not valid.\n"]

type nonrec conflict_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "There was a conflict processing the request. Try your request again.\n"]

type nonrec authorization_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The Amazon Web Services user account does not have permission to perform the action. Check the \
   IAM policy associated with this account.\n"]

type nonrec access_denied_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "Access to resource denied.\n"]

type nonrec update_service_settings_response = unit [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec string_list = string_ list [@@ocaml.doc ""]

type nonrec box_boolean = bool [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec organization_configuration = {
  enable_integration : boolean_; [@ocaml.doc "Enables Organizations integration.\n"]
}
[@@ocaml.doc "Configuration information for Organizations.\n"]

type nonrec update_service_settings_request = {
  s3_bucket_arn : string_ option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the Amazon S3 bucket where the License Manager information \
         is stored.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the Amazon SNS topic used for License Manager alerts.\n"]
  organization_configuration : organization_configuration option;
      [@ocaml.doc "Enables integration with Organizations for cross-account discovery.\n"]
  enable_cross_accounts_discovery : box_boolean option;
      [@ocaml.doc "Activates cross-account discovery.\n"]
  enabled_discovery_source_regions : string_list option;
      [@ocaml.doc "Cross region discovery enabled source regions.\n"]
}
[@@ocaml.doc ""]

type nonrec license_usage_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have enough licenses available to support a new resource launch.\n"]

type nonrec invalid_resource_state_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "License Manager cannot allocate a license to a resource because of its state. \n\n\
  \ For example, you cannot allocate a license to an instance in the process of shutting down.\n\
  \ "]

type nonrec update_license_specifications_for_resource_response = unit [@@ocaml.doc ""]

type nonrec license_specification = {
  license_configuration_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license configuration.\n"]
  ami_association_scope : string_ option;
      [@ocaml.doc "Scope of AMI associations. The possible value is [cross-account].\n"]
}
[@@ocaml.doc "Details for associating a license configuration with a resource.\n"]

type nonrec license_specifications = license_specification list [@@ocaml.doc ""]

type nonrec update_license_specifications_for_resource_request = {
  resource_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the Amazon Web Services resource.\n"]
  add_license_specifications : license_specifications option;
      [@ocaml.doc "ARNs of the license configurations to add.\n"]
  remove_license_specifications : license_specifications option;
      [@ocaml.doc "ARNs of the license configurations to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource cannot be found.\n"]

type nonrec resource_limit_exceeded_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "Your resource limits have been exceeded.\n"]

type nonrec update_license_manager_report_generator_response = unit [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec report_frequency_type =
  | DAY [@ocaml.doc ""]
  | WEEK [@ocaml.doc ""]
  | MONTH [@ocaml.doc ""]
  | ONE_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec report_frequency = {
  value : integer option;
      [@ocaml.doc
        "Number of times within the frequency period that a report is generated. The only \
         supported value is [1].\n"]
  period : report_frequency_type option;
      [@ocaml.doc "Time period between each report. The period can be daily, weekly, or monthly.\n"]
}
[@@ocaml.doc "Details about how frequently reports are generated.\n"]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec arn_list = arn list [@@ocaml.doc ""]

type nonrec report_context = {
  license_configuration_arns : arn_list option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the license configuration that this generator reports on.\n"]
  license_asset_group_arns : arn_list option;
      [@ocaml.doc
        "Amazon Resource Names (ARNs) of the license asset groups to include in the report.\n"]
  report_start_date : date_time option;
      [@ocaml.doc "Start date for the report data collection period.\n"]
  report_end_date : date_time option;
      [@ocaml.doc "End date for the report data collection period.\n"]
}
[@@ocaml.doc "Details of the license configuration that this generator reports on.\n"]

type nonrec report_type =
  | LICENSE_CONFIGURATION_SUMMARY_REPORT [@ocaml.doc ""]
  | LICENSE_CONFIGURATION_USAGE_REPORT [@ocaml.doc ""]
  | LICENSE_ASSET_GROUP_USAGE_REPORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report_type_list = report_type list [@@ocaml.doc ""]

type nonrec report_generator_name = string [@@ocaml.doc ""]

type nonrec update_license_manager_report_generator_request = {
  license_manager_report_generator_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the report generator to update.\n"]
  report_generator_name : report_generator_name; [@ocaml.doc "Name of the report generator.\n"]
  type_ : report_type_list;
      [@ocaml.doc
        "Type of reports to generate. The following report types are supported:\n\n\
        \ {ul\n\
        \       {-  License configuration report - Reports the number and details of consumed \
         licenses for a license configuration.\n\
        \           \n\
        \            }\n\
        \       {-  Resource report - Reports the tracked licenses and resource consumption for a \
         license configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  report_context : report_context; [@ocaml.doc "The report context.\n"]
  report_frequency : report_frequency; [@ocaml.doc "Frequency by which reports are generated.\n"]
  client_token : client_request_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  description : string_ option; [@ocaml.doc "Description of the report generator.\n"]
}
[@@ocaml.doc ""]

type nonrec update_license_configuration_response = unit [@@ocaml.doc ""]

type nonrec box_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec product_information_filter = {
  product_information_filter_name : string_; [@ocaml.doc "Filter name.\n"]
  product_information_filter_value : string_list option; [@ocaml.doc "Filter value.\n"]
  product_information_filter_comparator : string_; [@ocaml.doc "Logical operator.\n"]
}
[@@ocaml.doc "Describes product information filters.\n"]

type nonrec product_information_filter_list = product_information_filter list [@@ocaml.doc ""]

type nonrec product_information = {
  resource_type : string_;
      [@ocaml.doc "Resource type. The possible values are [SSM_MANAGED] | [RDS].\n"]
  product_information_filter_list : product_information_filter_list;
      [@ocaml.doc
        "A Product information filter consists of a [ProductInformationFilterComparator] which is \
         a logical operator, a [ProductInformationFilterName] which specifies the type of filter \
         being declared, and a [ProductInformationFilterValue] that specifies the value to filter \
         on. \n\n\
        \ Accepted values for [ProductInformationFilterName] are listed here along with \
         descriptions and valid options for [ProductInformationFilterComparator]. \n\
        \ \n\
        \  The following filters and are supported when the resource type is [SSM_MANAGED]:\n\
        \  \n\
        \   {ul\n\
        \         {-   [Application Name] - The name of the application. Logical operator is \
         [EQUALS].\n\
        \             \n\
        \              }\n\
        \         {-   [Application Publisher] - The publisher of the application. Logical \
         operator is [EQUALS].\n\
        \             \n\
        \              }\n\
        \         {-   [Application Version] - The version of the application. Logical operator is \
         [EQUALS].\n\
        \             \n\
        \              }\n\
        \         {-   [Platform Name] - The name of the platform. Logical operator is [EQUALS].\n\
        \             \n\
        \              }\n\
        \         {-   [Platform Type] - The platform type. Logical operator is [EQUALS].\n\
        \             \n\
        \              }\n\
        \         {-   [Tag:key] - The key of a tag attached to an Amazon Web Services resource \
         you wish to exclude from automated discovery. Logical operator is [NOT_EQUALS]. The key \
         for your tag must be appended to [Tag:] following the example: [Tag:name-of-your-key]. \
         [ProductInformationFilterValue] is optional if you are not using values for the key. \n\
        \             \n\
        \              }\n\
        \         {-   [AccountId] - The 12-digit ID of an Amazon Web Services account you wish to \
         exclude from automated discovery. Logical operator is [NOT_EQUALS].\n\
        \             \n\
        \              }\n\
        \         {-   [License Included] - The type of license included. Logical operators are \
         [EQUALS] and [NOT_EQUALS]. Possible values are: [sql-server-enterprise] | \
         [sql-server-standard] | [sql-server-web] | [windows-server-datacenter].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   The following filters and logical operators are supported when the resource type is \
         [RDS]:\n\
        \   \n\
        \    {ul\n\
        \          {-   [Engine Edition] - The edition of the database engine. Logical operator is \
         [EQUALS]. Possible values are: [oracle-ee] | [oracle-se] | [oracle-se1] | [oracle-se2] | \
         [db2-se] | [db2-ae].\n\
        \              \n\
        \               }\n\
        \          {-   [License Pack] - The license pack. Logical operator is [EQUALS]. Possible \
         values are: [data guard] | [diagnostic pack sqlt] | [tuning pack sqlt] | [ols] | [olap].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "Describes product information for a license configuration.\n"]

type nonrec product_information_list = product_information list [@@ocaml.doc ""]

type nonrec license_configuration_status = AVAILABLE [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_license_configuration_request = {
  license_configuration_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license configuration.\n"]
  license_configuration_status : license_configuration_status option;
      [@ocaml.doc "New status of the license configuration.\n"]
  license_rules : string_list option;
      [@ocaml.doc
        "New license rule. The only rule that you can add after you create a license configuration \
         is licenseAffinityToHost.\n"]
  license_count : box_long option;
      [@ocaml.doc "New number of licenses managed by the license configuration.\n"]
  license_count_hard_limit : box_boolean option;
      [@ocaml.doc "New hard limit of the number of available licenses.\n"]
  name : string_ option; [@ocaml.doc "New name of the license configuration.\n"]
  description : string_ option; [@ocaml.doc "New description of the license configuration.\n"]
  product_information_list : product_information_list option;
      [@ocaml.doc "New product information.\n"]
  disassociate_when_not_found : box_boolean option;
      [@ocaml.doc "When true, disassociates a resource when software is uninstalled.\n"]
  license_expiry : box_long option; [@ocaml.doc "License configuration expiry time.\n"]
}
[@@ocaml.doc ""]

type nonrec update_license_asset_ruleset_response = {
  license_asset_ruleset_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec script_rule_statement = {
  key_to_match : string_; [@ocaml.doc "Key name to match against in the script rule evaluation.\n"]
  script : string_; [@ocaml.doc "Script code used to evaluate the rule condition.\n"]
}
[@@ocaml.doc "Rule statement that uses a script to evaluate license asset conditions.\n"]

type nonrec matching_rule_statement = {
  key_to_match : string_;
      [@ocaml.doc
        "Key to match.\n\n\
        \ The following keys and are supported when the RuleStatement type is [Instance]: \n\
        \ \n\
        \  {ul\n\
        \        {-   [Platform] - The name of the platform. Logical operators are [EQUALS] and \
         [NOT_EQUALS]. \n\
        \            \n\
        \             }\n\
        \        {-   [EC2BillingProduct] - The billing product code. Logical operators are \
         [EQUALS] and [NOT_EQUALS]. Possible values are: [windows-server-enterprise] | \
         [windows-byol] | [rhel] | [rhel-byol] | [rhel-high-availability] | [ubuntu-pro] | \
         [suse-linux] | [sql-server-standard] | [sql-server-enterprise]. \n\
        \            \n\
        \             }\n\
        \        {-   [MarketPlaceProductCode] - The Marketplace product code. Logical operators \
         are [EQUALS] and [NOT_EQUALS]. \n\
        \            \n\
        \             }\n\
        \        {-   [AMIId] - The ID of the AMI. Logical operators are [EQUALS] and [NOT_EQUALS]. \n\
        \            \n\
        \             }\n\
        \        {-   [InstanceType] - The instance type. Logical operators are [EQUALS] and \
         [NOT_EQUALS]. \n\
        \            \n\
        \             }\n\
        \        {-   [InstanceId] - The ID of the instance. Logical operators are [EQUALS] and \
         [NOT_EQUALS]. \n\
        \            \n\
        \             }\n\
        \        {-   [HostId] - The ID of the host. Logical operators are [EQUALS] and \
         [NOT_EQUALS]. \n\
        \            \n\
        \             }\n\
        \        {-   [AccountId] - The ID of the account. Logical operators are [EQUALS] and \
         [NOT_EQUALS]. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following keys and are supported when the RuleStatement type is [License]: \n\
        \   \n\
        \    {ul\n\
        \          {-   [LicenseArn] - The ARN of a Managed Entitlement License. Logical operators \
         are [EQUALS] and [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          {-   [ProductSKU] - The productSKU of the license. Logical operators are \
         [EQUALS] and [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          {-   [Issuer] - The issuer of the license. Logical operators are [EQUALS] and \
         [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          {-   [Beneficiary] - The beneficiary of the license. Logical operators are \
         [EQUALS] and [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          {-   [LicenseStatus] - The status of the license. Logical operators are \
         [EQUALS] and [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          {-   [HomeRegion] - The home region of the license. Logical operators are \
         [EQUALS] and [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following keys and are supported when the RuleStatement type is [License \
         Configuration]: \n\
        \   \n\
        \    {ul\n\
        \          {-   [LicenseConfigurationArn] - The ARN of a self-managed license \
         configuration. Logical operators are [EQUALS] and [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          {-   [AccountId] - The account of the license configuration. Logical operators \
         are [EQUALS] and [NOT_EQUALS]. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  constraint_ : string_; [@ocaml.doc "Constraint.\n"]
  value_to_match : string_list; [@ocaml.doc "Value to match.\n"]
}
[@@ocaml.doc "Matching rule statement.\n"]

type nonrec script_rule_statement_list = script_rule_statement list [@@ocaml.doc ""]

type nonrec matching_rule_statement_list = matching_rule_statement list [@@ocaml.doc ""]

type nonrec or_rule_statement = {
  matching_rule_statements : matching_rule_statement_list option;
      [@ocaml.doc "Matching rule statements.\n"]
  script_rule_statements : script_rule_statement_list option;
      [@ocaml.doc "Script rule statements.\n"]
}
[@@ocaml.doc "OR rule statement.\n"]

type nonrec and_rule_statement = {
  matching_rule_statements : matching_rule_statement_list option;
      [@ocaml.doc "Matching rule statements.\n"]
  script_rule_statements : script_rule_statement_list option;
      [@ocaml.doc "Script rule statements.\n"]
}
[@@ocaml.doc "AND rule statement.\n"]

type nonrec instance_rule_statement = {
  and_rule_statement : and_rule_statement option; [@ocaml.doc "AND rule statement.\n"]
  or_rule_statement : or_rule_statement option; [@ocaml.doc "OR rule statement.\n"]
  matching_rule_statement : matching_rule_statement option;
      [@ocaml.doc "Matching rule statement.\n"]
  script_rule_statement : script_rule_statement option; [@ocaml.doc "Script rule statement.\n"]
}
[@@ocaml.doc "Instance rule statement.\n"]

type nonrec license_rule_statement = {
  and_rule_statement : and_rule_statement option; [@ocaml.doc "AND rule statement.\n"]
  or_rule_statement : or_rule_statement option; [@ocaml.doc "OR rule statement.\n"]
  matching_rule_statement : matching_rule_statement option; [@ocaml.doc "Matching rule statement.\n"]
}
[@@ocaml.doc "License rule statement.\n"]

type nonrec license_configuration_rule_statement = {
  and_rule_statement : and_rule_statement option; [@ocaml.doc "AND rule statement.\n"]
  or_rule_statement : or_rule_statement option; [@ocaml.doc "OR rule statement.\n"]
  matching_rule_statement : matching_rule_statement option; [@ocaml.doc "Matching rule statement.\n"]
}
[@@ocaml.doc "License configuration rule statement.\n"]

type nonrec rule_statement = {
  license_configuration_rule_statement : license_configuration_rule_statement option;
      [@ocaml.doc "License configuration rule statement.\n"]
  license_rule_statement : license_rule_statement option; [@ocaml.doc "License rule statement.\n"]
  instance_rule_statement : instance_rule_statement option; [@ocaml.doc "Instance rule statement.\n"]
}
[@@ocaml.doc "Rule statement.\n"]

type nonrec license_asset_rule = {
  rule_statement : rule_statement; [@ocaml.doc "Rule statement.\n"]
}
[@@ocaml.doc "License asset rule.\n"]

type nonrec license_asset_rule_list = license_asset_rule list [@@ocaml.doc ""]

type nonrec license_asset_resource_description = string [@@ocaml.doc ""]

type nonrec license_asset_resource_name = string [@@ocaml.doc ""]

type nonrec update_license_asset_ruleset_request = {
  name : license_asset_resource_name option; [@ocaml.doc "License asset ruleset name.\n"]
  description : license_asset_resource_description option;
      [@ocaml.doc "License asset ruleset description.\n"]
  rules : license_asset_rule_list; [@ocaml.doc "License asset rules.\n"]
  license_asset_ruleset_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset ruleset.\n"]
  client_token : string_;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_license_asset_group_response = {
  license_asset_group_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset group.\n"]
  status : string_; [@ocaml.doc "License asset group status.\n"]
}
[@@ocaml.doc ""]

type nonrec license_asset_group_status =
  | ACTIVE [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc
  "License asset group status. Allowed values are\n\n\
  \ {ul\n\
  \       {-   [ACTIVE] \n\
  \           \n\
  \            }\n\
  \       {-   [DISABLED] \n\
  \           \n\
  \            }\n\
  \       {-   [DELETED] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec license_asset_group_property = {
  key : string_; [@ocaml.doc "Property key.\n"]
  value : string_; [@ocaml.doc "Property value.\n"]
}
[@@ocaml.doc "License asset group property.\n"]

type nonrec license_asset_group_property_list = license_asset_group_property list [@@ocaml.doc ""]

type nonrec license_asset_ruleset_arn_list = arn list [@@ocaml.doc ""]

type nonrec license_asset_group_configuration = {
  usage_dimension : string_ option;
      [@ocaml.doc "License Asset Group Configuration Usage dimension.\n"]
}
[@@ocaml.doc "License asset group configuration.\n"]

type nonrec license_asset_group_configuration_list = license_asset_group_configuration list
[@@ocaml.doc ""]

type nonrec update_license_asset_group_request = {
  name : license_asset_resource_name option; [@ocaml.doc "License asset group name.\n"]
  description : license_asset_resource_description option;
      [@ocaml.doc "License asset group description.\n"]
  license_asset_group_configurations : license_asset_group_configuration_list option;
      [@ocaml.doc "License asset group configurations.\n"]
  associated_license_asset_ruleset_ar_ns : license_asset_ruleset_arn_list;
      [@ocaml.doc "ARNs of associated license asset rulesets.\n"]
  properties : license_asset_group_property_list option;
      [@ocaml.doc "License asset group properties.\n"]
  license_asset_group_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset group.\n"]
  status : license_asset_group_status option;
      [@ocaml.doc "License asset group status. The possible values are [ACTIVE] | [DISABLED].\n"]
  client_token : string_;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = string_ list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : string_; [@ocaml.doc "Amazon Resource Name (ARN) of the resource.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "Keys identifying the tags to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  key : string_ option; [@ocaml.doc "The tag key.\n"]
  value : string_ option; [@ocaml.doc "The tag value.\n"]
}
[@@ocaml.doc
  "Details about the tags for a resource. For more information about tagging support in License \
   Manager, see the \
   {{:https://docs.aws.amazon.com/license-manager/latest/APIReference/API_TagResource.html}TagResource} \
   operation.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : string_;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the resource. The following examples provide an example ARN \
         for each supported resource in License Manager:\n\n\
        \ {ul\n\
        \       {-  Licenses - \
         [arn:aws:license-manager::111122223333:license:l-EXAMPLE2da7646d6861033667f20e895] \n\
        \           \n\
        \            }\n\
        \       {-  Grants - \
         [arn:aws:license-manager::111122223333:grant:g-EXAMPLE7b19f4a0ab73679b0beb52707] \n\
        \           \n\
        \            }\n\
        \       {-  License configurations - \
         [arn:aws:license-manager:us-east-1:111122223333:license-configuration:lic-EXAMPLE6a788d4c8acd4264ff0ecf2ed2d] \n\
        \           \n\
        \            }\n\
        \       {-  Report generators - \
         [arn:aws:license-manager:us-east-1:111122223333:report-generator:r-EXAMPLE825b4a4f8fe5a3e0c88824e5fc6] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tag_list; [@ocaml.doc "One or more tags.\n"]
}
[@@ocaml.doc ""]

type nonrec grant_status =
  | PENDING_WORKFLOW [@ocaml.doc ""]
  | PENDING_ACCEPT [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED_WORKFLOW [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | PENDING_DELETE [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | WORKFLOW_COMPLETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reject_grant_response = {
  grant_arn : arn option; [@ocaml.doc "Grant ARN.\n"]
  status : grant_status option; [@ocaml.doc "Grant status.\n"]
  version : string_ option; [@ocaml.doc "Grant version.\n"]
}
[@@ocaml.doc ""]

type nonrec reject_grant_request = {
  grant_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the grant.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_limit_exceeded_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The request uses too many filters or too many filter values.\n"]

type nonrec resource_type =
  | EC2_INSTANCE [@ocaml.doc ""]
  | EC2_HOST [@ocaml.doc ""]
  | EC2_AMI [@ocaml.doc ""]
  | RDS [@ocaml.doc ""]
  | SYSTEMS_MANAGER_MANAGED_INSTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_configuration_usage = {
  resource_arn : string_ option; [@ocaml.doc "Amazon Resource Name (ARN) of the resource.\n"]
  resource_type : resource_type option; [@ocaml.doc "Type of resource.\n"]
  resource_status : string_ option; [@ocaml.doc "Status of the resource.\n"]
  resource_owner_id : string_ option; [@ocaml.doc "ID of the account that owns the resource.\n"]
  association_time : date_time option;
      [@ocaml.doc
        "Time when the license configuration was initially associated with the resource.\n"]
  consumed_licenses : box_long option; [@ocaml.doc "Number of licenses consumed by the resource.\n"]
}
[@@ocaml.doc "Details about the usage of a resource associated with a license configuration.\n"]

type nonrec license_configuration_usage_list = license_configuration_usage list [@@ocaml.doc ""]

type nonrec list_usage_for_license_configuration_response = {
  license_configuration_usage_list : license_configuration_usage_list option;
      [@ocaml.doc "Information about the license configurations.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec filter = {
  name : filter_name option; [@ocaml.doc "Name of the filter. Filter names are case-sensitive.\n"]
  values : filter_values option;
      [@ocaml.doc
        "The value of the filter, which is case-sensitive. You can only specify one value for the \
         filter.\n"]
}
[@@ocaml.doc
  "A filter name and value pair that is used to return more specific results from a describe \
   operation. Filters can be used to match a set of resources by specific criteria, such as tags, \
   attributes, or IDs.\n"]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec box_integer = int [@@ocaml.doc ""]

type nonrec list_usage_for_license_configuration_request = {
  license_configuration_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license configuration.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  filters : filters option;
      [@ocaml.doc
        "Filters to scope the results. The following filters and logical operators are supported:\n\n\
        \ {ul\n\
        \       {-   [resourceArn] - The ARN of the license configuration resource.\n\
        \           \n\
        \            }\n\
        \       {-   [resourceType] - The resource type ([EC2_INSTANCE] | [EC2_HOST] | [EC2_AMI] | \
         [SYSTEMS_MANAGER_MANAGED_INSTANCE]).\n\
        \           \n\
        \            }\n\
        \       {-   [resourceAccount] - The ID of the account that owns the resource.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec max_size3_string_list = string_ list [@@ocaml.doc ""]

type nonrec iso8601_date_time = string [@@ocaml.doc ""]

type nonrec token_data = {
  token_id : string_ option; [@ocaml.doc "Token ID.\n"]
  token_type : string_ option;
      [@ocaml.doc "Type of token generated. The supported value is [REFRESH_TOKEN].\n"]
  license_arn : string_ option; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  expiration_time : iso8601_date_time option;
      [@ocaml.doc "Token expiration time, in ISO8601-UTC format.\n"]
  token_properties : max_size3_string_list option; [@ocaml.doc "Data specified by the caller.\n"]
  role_arns : arn_list option;
      [@ocaml.doc "Amazon Resource Names (ARN) of the roles included in the token.\n"]
  status : string_ option;
      [@ocaml.doc "Token status. The possible values are [AVAILABLE] and [DELETED].\n"]
}
[@@ocaml.doc "Describes a token.\n"]

type nonrec token_list = token_data list [@@ocaml.doc ""]

type nonrec list_tokens_response = {
  tokens : token_list option; [@ocaml.doc "Received token details.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec max_size100 = int [@@ocaml.doc ""]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec list_tokens_request = {
  token_ids : string_list option; [@ocaml.doc "Token IDs.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filter is supported:\n\n\
        \ {ul\n\
        \       {-   [LicenseArns] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "Information about the tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : string_; [@ocaml.doc "Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec failed_dependency_exception = {
  message : message option; [@ocaml.doc ""]
  error_code : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "A dependency required to run the API is missing.\n"]

type nonrec resource_inventory = {
  resource_id : string_ option; [@ocaml.doc "ID of the resource.\n"]
  resource_type : resource_type option; [@ocaml.doc "Type of resource.\n"]
  resource_arn : string_ option; [@ocaml.doc "Amazon Resource Name (ARN) of the resource.\n"]
  platform : string_ option; [@ocaml.doc "Platform of the resource.\n"]
  platform_version : string_ option;
      [@ocaml.doc "Platform version of the resource in the inventory.\n"]
  resource_owning_account_id : string_ option;
      [@ocaml.doc "ID of the account that owns the resource.\n"]
  marketplace_product_codes : string_list option;
      [@ocaml.doc "List of Marketplace product codes associated with the resource.\n"]
  usage_operation : string_ option;
      [@ocaml.doc
        "Usage operation value that corresponds to the license type for billing purposes.\n"]
  ami_id : string_ option;
      [@ocaml.doc "Amazon Machine Image (AMI) ID associated with the resource.\n"]
  host_id : string_ option; [@ocaml.doc "Dedicated Host ID where the resource is running.\n"]
  region : string_ option; [@ocaml.doc "Region where the resource is located.\n"]
  instance_type : string_ option; [@ocaml.doc "EC2 instance type of the resource.\n"]
}
[@@ocaml.doc "Details about a resource.\n"]

type nonrec resource_inventory_list = resource_inventory list [@@ocaml.doc ""]

type nonrec list_resource_inventory_response = {
  resource_inventory_list : resource_inventory_list option;
      [@ocaml.doc "Information about the resources.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec inventory_filter_condition =
  | EQUALS [@ocaml.doc ""]
  | NOT_EQUALS [@ocaml.doc ""]
  | BEGINS_WITH [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inventory_filter = {
  name : string_; [@ocaml.doc "Name of the filter.\n"]
  condition : inventory_filter_condition; [@ocaml.doc "Condition of the filter.\n"]
  value : string_ option; [@ocaml.doc "Value of the filter.\n"]
}
[@@ocaml.doc "An inventory filter.\n"]

type nonrec inventory_filter_list = inventory_filter list [@@ocaml.doc ""]

type nonrec list_resource_inventory_request = {
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  filters : inventory_filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters and logical operators are supported:\n\n\
        \ {ul\n\
        \       {-   [account_id] - The ID of the Amazon Web Services account that owns the \
         resource. Logical operators are [EQUALS] | [NOT_EQUALS].\n\
        \           \n\
        \            }\n\
        \       {-   [application_name] - The name of the application. Logical operators are \
         [EQUALS] | [BEGINS_WITH].\n\
        \           \n\
        \            }\n\
        \       {-   [license_included] - The type of license included. Logical operators are \
         [EQUALS] | [NOT_EQUALS]. Possible values are [sql-server-enterprise] | \
         [sql-server-standard] | [sql-server-web] | [windows-server-datacenter].\n\
        \           \n\
        \            }\n\
        \       {-   [platform] - The platform of the resource. Logical operators are [EQUALS] | \
         [BEGINS_WITH].\n\
        \           \n\
        \            }\n\
        \       {-   [resource_id] - The ID of the resource. Logical operators are [EQUALS] | \
         [NOT_EQUALS].\n\
        \           \n\
        \            }\n\
        \       {-   \n\
        \           {[\n\
        \           tag:\n\
        \           ]}\n\
        \            - The key/value combination of a tag assigned to the resource. Logical \
         operators are [EQUALS] (single account) or [EQUALS] | [NOT_EQUALS] (cross account).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec allowed_operation =
  | CREATE_GRANT [@ocaml.doc ""]
  | CHECKOUT_LICENSE [@ocaml.doc ""]
  | CHECKOUT_BORROW_LICENSE [@ocaml.doc ""]
  | CHECK_IN_LICENSE [@ocaml.doc ""]
  | EXTEND_CONSUMPTION_LICENSE [@ocaml.doc ""]
  | LIST_PURCHASED_LICENSES [@ocaml.doc ""]
  | CREATE_TOKEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec allowed_operation_list = allowed_operation list [@@ocaml.doc ""]

type nonrec status_reason_message = string [@@ocaml.doc ""]

type nonrec received_status =
  | PENDING_WORKFLOW [@ocaml.doc ""]
  | PENDING_ACCEPT [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED_WORKFLOW [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | WORKFLOW_COMPLETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec received_metadata = {
  received_status : received_status option; [@ocaml.doc "Received status.\n"]
  received_status_reason : status_reason_message option; [@ocaml.doc "Received status reason.\n"]
  allowed_operations : allowed_operation_list option; [@ocaml.doc "Allowed operations.\n"]
}
[@@ocaml.doc "Metadata associated with received licenses and grants.\n"]

type nonrec metadata = {
  name : string_ option; [@ocaml.doc "The key name.\n"]
  value : string_ option; [@ocaml.doc "The value.\n"]
}
[@@ocaml.doc "Describes key/value pairs.\n"]

type nonrec metadata_list = metadata list [@@ocaml.doc ""]

type nonrec borrow_configuration = {
  allow_early_check_in : box_boolean;
      [@ocaml.doc "Indicates whether early check-ins are allowed.\n"]
  max_time_to_live_in_minutes : box_integer;
      [@ocaml.doc "Maximum time for the borrow configuration, in minutes.\n"]
}
[@@ocaml.doc "Details about a borrow configuration.\n"]

type nonrec provisional_configuration = {
  max_time_to_live_in_minutes : box_integer;
      [@ocaml.doc "Maximum time for the provisional configuration, in minutes.\n"]
}
[@@ocaml.doc "Details about a provisional configuration.\n"]

type nonrec renew_type = NONE [@ocaml.doc ""] | WEEKLY [@ocaml.doc ""] | MONTHLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec consumption_configuration = {
  renew_type : renew_type option; [@ocaml.doc "Renewal frequency.\n"]
  provisional_configuration : provisional_configuration option;
      [@ocaml.doc "Details about a provisional configuration.\n"]
  borrow_configuration : borrow_configuration option;
      [@ocaml.doc "Details about a borrow configuration.\n"]
}
[@@ocaml.doc "Details about a consumption configuration.\n"]

type nonrec entitlement_unit =
  | COUNT [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
  | SECONDS [@ocaml.doc ""]
  | MICROSECONDS [@ocaml.doc ""]
  | MILLISECONDS [@ocaml.doc ""]
  | BYTES [@ocaml.doc ""]
  | KILOBYTES [@ocaml.doc ""]
  | MEGABYTES [@ocaml.doc ""]
  | GIGABYTES [@ocaml.doc ""]
  | TERABYTES [@ocaml.doc ""]
  | BITS [@ocaml.doc ""]
  | KILOBITS [@ocaml.doc ""]
  | MEGABITS [@ocaml.doc ""]
  | GIGABITS [@ocaml.doc ""]
  | TERABITS [@ocaml.doc ""]
  | PERCENT [@ocaml.doc ""]
  | BYTES_PER_SECOND [@ocaml.doc ""]
  | KILOBYTES_PER_SECOND [@ocaml.doc ""]
  | MEGABYTES_PER_SECOND [@ocaml.doc ""]
  | GIGABYTES_PER_SECOND [@ocaml.doc ""]
  | TERABYTES_PER_SECOND [@ocaml.doc ""]
  | BITS_PER_SECOND [@ocaml.doc ""]
  | KILOBITS_PER_SECOND [@ocaml.doc ""]
  | MEGABITS_PER_SECOND [@ocaml.doc ""]
  | GIGABITS_PER_SECOND [@ocaml.doc ""]
  | TERABITS_PER_SECOND [@ocaml.doc ""]
  | COUNT_PER_SECOND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec entitlement = {
  name : string_; [@ocaml.doc "Entitlement name.\n"]
  value : string_ option; [@ocaml.doc "Entitlement resource. Use only if the unit is None.\n"]
  max_count : long option; [@ocaml.doc "Maximum entitlement count. Use if the unit is not None.\n"]
  overage : box_boolean option; [@ocaml.doc "Indicates whether overages are allowed.\n"]
  unit_ : entitlement_unit; [@ocaml.doc "Entitlement unit.\n"]
  allow_check_in : box_boolean option; [@ocaml.doc "Indicates whether check-ins are allowed.\n"]
}
[@@ocaml.doc "Describes a resource entitled for use with a license.\n"]

type nonrec entitlement_list = entitlement list [@@ocaml.doc ""]

type nonrec datetime_range = {
  \#begin : iso8601_date_time; [@ocaml.doc "Start of the time range.\n"]
  end_ : iso8601_date_time option; [@ocaml.doc "End of the time range.\n"]
}
[@@ocaml.doc "Describes a time range, in ISO8601-UTC format.\n"]

type nonrec license_status =
  | AVAILABLE [@ocaml.doc ""]
  | PENDING_AVAILABLE [@ocaml.doc ""]
  | DEACTIVATED [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | PENDING_DELETE [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec issuer_details = {
  name : string_ option; [@ocaml.doc "Issuer name.\n"]
  sign_key : string_ option;
      [@ocaml.doc
        "Asymmetric KMS key from Key Management Service. The KMS key must have a key usage of sign \
         and verify, and support the RSASSA-PSS SHA-256 signing algorithm.\n"]
  key_fingerprint : string_ option; [@ocaml.doc "Issuer key fingerprint.\n"]
}
[@@ocaml.doc "Details associated with the issuer of a license.\n"]

type nonrec granted_license = {
  license_arn : arn option; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  license_name : string_ option; [@ocaml.doc "License name.\n"]
  product_name : string_ option; [@ocaml.doc "Product name.\n"]
  product_sk_u : string_ option; [@ocaml.doc "Product SKU.\n"]
  issuer : issuer_details option; [@ocaml.doc "Granted license issuer.\n"]
  home_region : string_ option; [@ocaml.doc "Home Region of the granted license.\n"]
  status : license_status option; [@ocaml.doc "Granted license status.\n"]
  validity : datetime_range option;
      [@ocaml.doc
        "Date and time range during which the granted license is valid, in ISO8601-UTC format.\n"]
  beneficiary : string_ option; [@ocaml.doc "Granted license beneficiary.\n"]
  entitlements : entitlement_list option; [@ocaml.doc "License entitlements.\n"]
  consumption_configuration : consumption_configuration option;
      [@ocaml.doc "Configuration for consumption of the license.\n"]
  license_metadata : metadata_list option; [@ocaml.doc "Granted license metadata.\n"]
  create_time : iso8601_date_time option; [@ocaml.doc "Creation time of the granted license.\n"]
  version : string_ option; [@ocaml.doc "Version of the granted license.\n"]
  received_metadata : received_metadata option; [@ocaml.doc "Granted license received metadata.\n"]
}
[@@ocaml.doc "Describes a license that is granted to a grantee.\n"]

type nonrec granted_license_list = granted_license list [@@ocaml.doc ""]

type nonrec list_received_licenses_for_organization_response = {
  licenses : granted_license_list option;
      [@ocaml.doc "Lists the licenses the organization has received.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_received_licenses_for_organization_request = {
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters are supported:\n\n\
        \ {ul\n\
        \       {-   [Beneficiary] \n\
        \           \n\
        \            }\n\
        \       {-   [ProductSKU] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_received_licenses_response = {
  licenses : granted_license_list option; [@ocaml.doc "Received license details.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_received_licenses_request = {
  license_arns : arn_list option; [@ocaml.doc "Amazon Resource Names (ARNs) of the licenses.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters are supported:\n\n\
        \ {ul\n\
        \       {-   [ProductSKU] \n\
        \           \n\
        \            }\n\
        \       {-   [Status] \n\
        \           \n\
        \            }\n\
        \       {-   [Fingerprint] \n\
        \           \n\
        \            }\n\
        \       {-   [IssuerName] \n\
        \           \n\
        \            }\n\
        \       {-   [Beneficiary] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec activation_override_behavior =
  | DISTRIBUTED_GRANTS_ONLY [@ocaml.doc ""]
  | ALL_GRANTS_PERMITTED_BY_ISSUER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec options = {
  activation_override_behavior : activation_override_behavior option;
      [@ocaml.doc
        "An activation option for your grant that determines the behavior of activating a grant. \
         Activation options can only be used with granted licenses sourced from the Amazon Web \
         Services Marketplace. Additionally, the operation must specify the value of [ACTIVE] for \
         the [Status] parameter.\n\n\
        \ {ul\n\
        \       {-  As a license administrator, you can optionally specify an \
         [ActivationOverrideBehavior] when activating a grant.\n\
        \           \n\
        \            }\n\
        \       {-  As a grantor, you can optionally specify an [ActivationOverrideBehavior] when \
         you activate a grant for a grantee account in your organization.\n\
        \           \n\
        \            }\n\
        \       {-  As a grantee, if the grantor creating the distributed grant doesn\226\128\153t \
         specify an [ActivationOverrideBehavior], you can optionally specify one when you are \
         activating the grant.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    DISTRIBUTED_GRANTS_ONLY  Use this value to activate a grant without replacing any \
         member account\226\128\153s active grants for the same product.\n\
        \                             \n\
        \                               ALL_GRANTS_PERMITTED_BY_ISSUER  Use this value to activate \
         a grant and disable other active grants in any member accounts for the same product. This \
         action will also replace their previously activated grants with this activated grant.\n\
        \                                                               \n\
        \                                                                 "]
}
[@@ocaml.doc
  "The options you can specify when you create a new version of a grant, such as activation \
   override behavior. For more information, see \
   {{:https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html}Granted \
   licenses in License Manager} in the {i License Manager User Guide}.\n"]

type nonrec grant = {
  grant_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the grant.\n"]
  grant_name : string_; [@ocaml.doc "Grant name.\n"]
  parent_arn : arn; [@ocaml.doc "Parent ARN.\n"]
  license_arn : arn; [@ocaml.doc "License ARN.\n"]
  grantee_principal_arn : arn; [@ocaml.doc "The grantee principal ARN.\n"]
  home_region : string_; [@ocaml.doc "Home Region of the grant.\n"]
  grant_status : grant_status; [@ocaml.doc "Grant status.\n"]
  status_reason : status_reason_message option; [@ocaml.doc "Grant status reason.\n"]
  version : string_; [@ocaml.doc "Grant version.\n"]
  granted_operations : allowed_operation_list; [@ocaml.doc "Granted operations.\n"]
  options : options option; [@ocaml.doc "The options specified for the grant.\n"]
}
[@@ocaml.doc "Describes a grant.\n"]

type nonrec grant_list = grant list [@@ocaml.doc ""]

type nonrec list_received_grants_for_organization_response = {
  grants : grant_list option; [@ocaml.doc "Lists the grants the organization has received.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_received_grants_for_organization_request = {
  license_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the received license.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters are supported:\n\n\
        \ {ul\n\
        \       {-   [ParentArn] \n\
        \           \n\
        \            }\n\
        \       {-   [GranteePrincipalArn] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_received_grants_response = {
  grants : grant_list option; [@ocaml.doc "Received grant details.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_received_grants_request = {
  grant_arns : arn_list option; [@ocaml.doc "Amazon Resource Names (ARNs) of the grants.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters are supported:\n\n\
        \ {ul\n\
        \       {-   [ProductSKU] \n\
        \           \n\
        \            }\n\
        \       {-   [LicenseIssuerName] \n\
        \           \n\
        \            }\n\
        \       {-   [LicenseArn] \n\
        \           \n\
        \            }\n\
        \       {-   [GrantStatus] \n\
        \           \n\
        \            }\n\
        \       {-   [GranterAccountId] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec license = {
  license_arn : arn option; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  license_name : string_ option; [@ocaml.doc "License name.\n"]
  product_name : string_ option; [@ocaml.doc "Product name.\n"]
  product_sk_u : string_ option; [@ocaml.doc "Product SKU.\n"]
  issuer : issuer_details option; [@ocaml.doc "License issuer.\n"]
  home_region : string_ option; [@ocaml.doc "Home Region of the license.\n"]
  status : license_status option; [@ocaml.doc "License status.\n"]
  validity : datetime_range option;
      [@ocaml.doc "Date and time range during which the license is valid, in ISO8601-UTC format.\n"]
  beneficiary : string_ option; [@ocaml.doc "License beneficiary.\n"]
  entitlements : entitlement_list option; [@ocaml.doc "License entitlements.\n"]
  consumption_configuration : consumption_configuration option;
      [@ocaml.doc "Configuration for consumption of the license.\n"]
  license_metadata : metadata_list option; [@ocaml.doc "License metadata.\n"]
  create_time : iso8601_date_time option; [@ocaml.doc "License creation time.\n"]
  version : string_ option; [@ocaml.doc "License version.\n"]
}
[@@ocaml.doc "Software license that is managed in License Manager.\n"]

type nonrec license_list = license list [@@ocaml.doc ""]

type nonrec list_license_versions_response = {
  licenses : license_list option; [@ocaml.doc "License details.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_versions_request = {
  license_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_specifications_for_resource_response = {
  license_specifications : license_specifications option;
      [@ocaml.doc "License configurations associated with a resource.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_specifications_for_resource_request = {
  resource_arn : string_;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of a resource that has an associated license configuration.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_licenses_response = {
  licenses : license_list option; [@ocaml.doc "License details.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_licenses_request = {
  license_arns : arn_list option; [@ocaml.doc "Amazon Resource Names (ARNs) of the licenses.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters are supported:\n\n\
        \ {ul\n\
        \       {-   [Beneficiary] \n\
        \           \n\
        \            }\n\
        \       {-   [ProductSKU] \n\
        \           \n\
        \            }\n\
        \       {-   [Fingerprint] \n\
        \           \n\
        \            }\n\
        \       {-   [Status] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec s3_location = {
  bucket : string_ option; [@ocaml.doc "Name of the S3 bucket reports are published to.\n"]
  key_prefix : string_ option; [@ocaml.doc "Prefix of the S3 bucket reports are published to.\n"]
}
[@@ocaml.doc "Details of the S3 bucket that report generator reports are published to.\n"]

type nonrec report_generator = {
  report_generator_name : string_ option; [@ocaml.doc "Name of the report generator.\n"]
  report_type : report_type_list option; [@ocaml.doc "Type of reports that are generated.\n"]
  report_context : report_context option;
      [@ocaml.doc "License configuration type for this generator.\n"]
  report_frequency : report_frequency option;
      [@ocaml.doc "Details about how frequently reports are generated.\n"]
  license_manager_report_generator_arn : string_ option;
      [@ocaml.doc "Amazon Resource Name (ARN) of the report generator.\n"]
  last_run_status : string_ option; [@ocaml.doc "Status of the last report generation attempt.\n"]
  last_run_failure_reason : string_ option;
      [@ocaml.doc "Failure message for the last report generation attempt.\n"]
  last_report_generation_time : string_ option;
      [@ocaml.doc "Time the last report was generated at.\n"]
  report_creator_account : string_ option;
      [@ocaml.doc "The Amazon Web Services account ID used to create the report generator.\n"]
  description : string_ option; [@ocaml.doc "Description of the report generator.\n"]
  s3_location : s3_location option;
      [@ocaml.doc "Details of the S3 bucket that report generator reports are published to.\n"]
  create_time : string_ option; [@ocaml.doc "Time the report was created.\n"]
  tags : tag_list option; [@ocaml.doc "Tags associated with the report generator.\n"]
}
[@@ocaml.doc "Describe the details of a report generator.\n"]

type nonrec report_generator_list = report_generator list [@@ocaml.doc ""]

type nonrec list_license_manager_report_generators_response = {
  report_generators : report_generator_list option;
      [@ocaml.doc
        "A report generator that creates periodic reports about your license configurations.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_manager_report_generators_request = {
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters are supported: \n\n\
        \ {ul\n\
        \       {-   [LicenseConfigurationArn] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec license_conversion_task_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec product_code_type = MARKETPLACE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec product_code_id = string [@@ocaml.doc ""]

type nonrec product_code_list_item = {
  product_code_id : product_code_id; [@ocaml.doc "The product code ID\n"]
  product_code_type : product_code_type; [@ocaml.doc "The product code type\n"]
}
[@@ocaml.doc "A list item that contains a product code.\n"]

type nonrec product_code_list = product_code_list_item list [@@ocaml.doc ""]

type nonrec usage_operation = string [@@ocaml.doc ""]

type nonrec license_conversion_context = {
  usage_operation : usage_operation option;
      [@ocaml.doc
        "The Usage operation value that corresponds to the license type you are converting your \
         resource from. For more information about which platforms correspond to which usage \
         operation values see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/billing-info-fields.html#billing-info}Sample \
         data: usage operation by platform } \n"]
  product_codes : product_code_list option;
      [@ocaml.doc "Product codes referred to in the license conversion process.\n"]
}
[@@ocaml.doc "Information about a license type conversion task.\n"]

type nonrec license_conversion_task_id = string [@@ocaml.doc ""]

type nonrec license_conversion_task = {
  license_conversion_task_id : license_conversion_task_id option;
      [@ocaml.doc "The ID of the license type conversion task.\n"]
  resource_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource associated with the license type \
         conversion task.\n"]
  source_license_context : license_conversion_context option;
      [@ocaml.doc "Information about the license type this conversion task converted from.\n"]
  destination_license_context : license_conversion_context option;
      [@ocaml.doc "Information about the license type this conversion task converted to.\n"]
  status : license_conversion_task_status option;
      [@ocaml.doc "The status of the conversion task.\n"]
  status_message : string_ option; [@ocaml.doc "The status message for the conversion task.\n"]
  start_time : date_time option; [@ocaml.doc "The time the conversion task was started at.\n"]
  license_conversion_time : date_time option;
      [@ocaml.doc "The time the usage operation value of the resource was changed.\n"]
  end_time : date_time option; [@ocaml.doc "The time the conversion task was completed.\n"]
}
[@@ocaml.doc "Information about a license type conversion task.\n"]

type nonrec license_conversion_tasks = license_conversion_task list [@@ocaml.doc ""]

type nonrec list_license_conversion_tasks_response = {
  license_conversion_tasks : license_conversion_tasks option;
      [@ocaml.doc "Information about the license configuration tasks for your account.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_conversion_tasks_request = {
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  filters : filters option;
      [@ocaml.doc
        " Filters to scope the results. Valid filters are [ResourceArns] and [Status]. \n"]
}
[@@ocaml.doc ""]

type nonrec automated_discovery_information = {
  last_run_time : date_time option; [@ocaml.doc "Time that automated discovery last ran.\n"]
}
[@@ocaml.doc "Describes automated discovery.\n"]

type nonrec managed_resource_summary = {
  resource_type : resource_type option; [@ocaml.doc "Type of resource associated with a license.\n"]
  association_count : box_long option; [@ocaml.doc "Number of resources associated with licenses.\n"]
}
[@@ocaml.doc "Summary information about a managed resource.\n"]

type nonrec managed_resource_summary_list = managed_resource_summary list [@@ocaml.doc ""]

type nonrec consumed_license_summary = {
  resource_type : resource_type option;
      [@ocaml.doc "Resource type of the resource consuming a license.\n"]
  consumed_licenses : box_long option; [@ocaml.doc "Number of licenses consumed by the resource.\n"]
}
[@@ocaml.doc "Details about license consumption.\n"]

type nonrec consumed_license_summary_list = consumed_license_summary list [@@ocaml.doc ""]

type nonrec license_counting_type =
  | VCPU [@ocaml.doc ""]
  | INSTANCE [@ocaml.doc ""]
  | CORE [@ocaml.doc ""]
  | SOCKET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_configuration = {
  license_configuration_id : string_ option;
      [@ocaml.doc "Unique ID of the license configuration.\n"]
  license_configuration_arn : string_ option;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license configuration.\n"]
  name : string_ option; [@ocaml.doc "Name of the license configuration.\n"]
  description : string_ option; [@ocaml.doc "Description of the license configuration.\n"]
  license_counting_type : license_counting_type option;
      [@ocaml.doc "Dimension to use to track the license inventory.\n"]
  license_rules : string_list option; [@ocaml.doc "License rules.\n"]
  license_count : box_long option;
      [@ocaml.doc "Number of licenses managed by the license configuration.\n"]
  license_count_hard_limit : box_boolean option;
      [@ocaml.doc "Number of available licenses as a hard limit.\n"]
  disassociate_when_not_found : box_boolean option;
      [@ocaml.doc "When true, disassociates a resource when software is uninstalled.\n"]
  consumed_licenses : box_long option; [@ocaml.doc "Number of licenses consumed. \n"]
  status : string_ option; [@ocaml.doc "Status of the license configuration.\n"]
  owner_account_id : string_ option;
      [@ocaml.doc "Account ID of the license configuration's owner.\n"]
  consumed_license_summary_list : consumed_license_summary_list option;
      [@ocaml.doc "Summaries for licenses consumed by various resources.\n"]
  managed_resource_summary_list : managed_resource_summary_list option;
      [@ocaml.doc "Summaries for managed resources.\n"]
  product_information_list : product_information_list option; [@ocaml.doc "Product information.\n"]
  automated_discovery_information : automated_discovery_information option;
      [@ocaml.doc "Automated discovery information.\n"]
  license_expiry : box_long option;
      [@ocaml.doc "License configuration expiry time in Unix timestamp format.\n"]
}
[@@ocaml.doc
  "A license configuration is an abstraction of a customer license agreement that can be consumed \
   and enforced by License Manager. Components include specifications for the license type \
   (licensing by instance, socket, CPU, or vCPU), allowed tenancy (shared tenancy, Dedicated \
   Instance, Dedicated Host, or all of these), host affinity (how long a VM must be associated \
   with a host), and the number of licenses purchased and used.\n"]

type nonrec license_configurations = license_configuration list [@@ocaml.doc ""]

type nonrec list_license_configurations_for_organization_response = {
  license_configurations : license_configurations option; [@ocaml.doc "License configurations.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_configurations_for_organization_request = {
  license_configuration_arns : string_list option; [@ocaml.doc "License configuration ARNs.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  filters : filters option; [@ocaml.doc "Filters to scope the results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_configurations_response = {
  license_configurations : license_configurations option;
      [@ocaml.doc "Information about the license configurations.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_configurations_request = {
  license_configuration_arns : string_list option;
      [@ocaml.doc "Amazon Resource Names (ARN) of the license configurations.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  filters : filters option;
      [@ocaml.doc
        "Filters to scope the results. The following filters and logical operators are supported:\n\n\
        \ {ul\n\
        \       {-   [licenseCountingType] - The dimension for which licenses are counted. \
         Possible values are [vCPU] | [Instance] | [Core] | [Socket].\n\
        \           \n\
        \            }\n\
        \       {-   [enforceLicenseCount] - A Boolean value that indicates whether hard license \
         enforcement is used.\n\
        \           \n\
        \            }\n\
        \       {-   [usagelimitExceeded] - A Boolean value that indicates whether the available \
         licenses have been exceeded.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec license_asset_ruleset = {
  name : string_; [@ocaml.doc "License asset ruleset name.\n"]
  description : string_ option; [@ocaml.doc "License asset ruleset description.\n"]
  rules : license_asset_rule_list; [@ocaml.doc "License asset rules.\n"]
  license_asset_ruleset_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset ruleset.\n"]
}
[@@ocaml.doc "License asset ruleset.\n"]

type nonrec license_asset_ruleset_list = license_asset_ruleset list [@@ocaml.doc ""]

type nonrec list_license_asset_rulesets_response = {
  license_asset_rulesets : license_asset_ruleset_list option;
      [@ocaml.doc "License asset rulesets.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_asset_rulesets_request = {
  filters : filters option;
      [@ocaml.doc
        "Filters to scope the results. Following filters are supported\n\n\
        \ {ul\n\
        \       {-   [Name] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  show_aws_managed_license_asset_rulesets : boolean_ option;
      [@ocaml.doc "Specifies whether to show License Manager managed license asset rulesets.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec license_asset_group = {
  name : string_; [@ocaml.doc "License asset group name.\n"]
  description : string_ option; [@ocaml.doc "License asset group description.\n"]
  license_asset_group_configurations : license_asset_group_configuration_list option;
      [@ocaml.doc "License asset group configurations.\n"]
  associated_license_asset_ruleset_ar_ns : license_asset_ruleset_arn_list;
      [@ocaml.doc "ARNs of associated license asset rulesets.\n"]
  properties : license_asset_group_property_list option;
      [@ocaml.doc "License asset group properties.\n"]
  license_asset_group_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset group.\n"]
  status : license_asset_group_status; [@ocaml.doc "License asset group status.\n"]
  status_message : string_ option; [@ocaml.doc "License asset group status message.\n"]
  latest_usage_analysis_time : date_time option; [@ocaml.doc "Latest usage analysis time.\n"]
  latest_resource_discovery_time : date_time option; [@ocaml.doc "Latest resource discovery time.\n"]
}
[@@ocaml.doc "License asset group.\n"]

type nonrec license_asset_group_list = license_asset_group list [@@ocaml.doc ""]

type nonrec list_license_asset_groups_response = {
  license_asset_groups : license_asset_group_list option; [@ocaml.doc "License asset groups.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_license_asset_groups_request = {
  filters : filters option;
      [@ocaml.doc
        "Filters to scope the results. Following filters are supported\n\n\
        \ {ul\n\
        \       {-   [LicenseAssetRulesetArn] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec license_operation_failure = {
  resource_arn : string_ option; [@ocaml.doc "Amazon Resource Name (ARN) of the resource.\n"]
  resource_type : resource_type option; [@ocaml.doc "Resource type.\n"]
  error_message : string_ option; [@ocaml.doc "Error message.\n"]
  failure_time : date_time option; [@ocaml.doc "Failure time.\n"]
  operation_name : string_ option; [@ocaml.doc "Name of the operation.\n"]
  resource_owner_id : string_ option;
      [@ocaml.doc "ID of the Amazon Web Services account that owns the resource.\n"]
  operation_requested_by : string_ option;
      [@ocaml.doc "The requester is \"License Manager Automated Discovery\".\n"]
  metadata_list : metadata_list option; [@ocaml.doc "Reserved.\n"]
}
[@@ocaml.doc "Describes the failure of a license operation.\n"]

type nonrec license_operation_failure_list = license_operation_failure list [@@ocaml.doc ""]

type nonrec list_failures_for_license_configuration_operations_response = {
  license_operation_failure_list : license_operation_failure_list option;
      [@ocaml.doc "License configuration operations that failed.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_failures_for_license_configuration_operations_request = {
  license_configuration_arn : string_;
      [@ocaml.doc "Amazon Resource Name of the license configuration.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_distributed_grants_response = {
  grants : grant_list option; [@ocaml.doc "Distributed grant details.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_distributed_grants_request = {
  grant_arns : arn_list option; [@ocaml.doc "Amazon Resource Names (ARNs) of the grants.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "Filters to scope the results. The following filters are supported:\n\n\
        \ {ul\n\
        \       {-   [LicenseArn] \n\
        \           \n\
        \            }\n\
        \       {-   [GrantStatus] \n\
        \           \n\
        \            }\n\
        \       {-   [GranteePrincipalARN] \n\
        \           \n\
        \            }\n\
        \       {-   [ProductSKU] \n\
        \           \n\
        \            }\n\
        \       {-   [LicenseIssuerName] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
  max_results : max_size100 option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec license_configuration_association = {
  resource_arn : string_ option; [@ocaml.doc "Amazon Resource Name (ARN) of the resource.\n"]
  resource_type : resource_type option; [@ocaml.doc "Type of server resource.\n"]
  resource_owner_id : string_ option;
      [@ocaml.doc
        "ID of the Amazon Web Services account that owns the resource consuming licenses.\n"]
  association_time : date_time option;
      [@ocaml.doc "Time when the license configuration was associated with the resource.\n"]
  ami_association_scope : string_ option;
      [@ocaml.doc "Scope of AMI associations. The possible value is [cross-account].\n"]
}
[@@ocaml.doc "Describes an association with a license configuration.\n"]

type nonrec license_configuration_associations = license_configuration_association list
[@@ocaml.doc ""]

type nonrec list_associations_for_license_configuration_response = {
  license_configuration_associations : license_configuration_associations option;
      [@ocaml.doc "Information about the associations for the license configuration.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_associations_for_license_configuration_request = {
  license_configuration_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of a license configuration.\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec asset = {
  asset_arn : string_ option; [@ocaml.doc "Amazon Resource Name (ARN) of the asset.\n"]
  latest_asset_discovery_time : date_time option; [@ocaml.doc "Latest asset discovery time.\n"]
}
[@@ocaml.doc "Asset.\n"]

type nonrec asset_list = asset list [@@ocaml.doc ""]

type nonrec list_assets_for_license_asset_group_response = {
  assets : asset_list option; [@ocaml.doc "Assets.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_assets_for_license_asset_group_request = {
  license_asset_group_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset group.\n"]
  asset_type : string_;
      [@ocaml.doc
        "Asset type. The possible values are [Instance] | [License] | [LicenseConfiguration].\n"]
  max_results : box_integer option;
      [@ocaml.doc "Maximum number of results to return in a single call.\n"]
  next_token : string_ option; [@ocaml.doc "Token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec region_status = {
  status : string_ option; [@ocaml.doc "Status value for the region.\n"]
}
[@@ocaml.doc "Status information for a specific region.\n"]

type nonrec region_status_map = (string_ * region_status) list [@@ocaml.doc ""]

type nonrec cross_region_discovery_status = {
  message : region_status_map option;
      [@ocaml.doc "Map of region status messages for cross-region discovery.\n"]
}
[@@ocaml.doc "Status information for cross-region discovery.\n"]

type nonrec cross_account_discovery_service_status = {
  message : string_ option; [@ocaml.doc "Status message for cross-account discovery service.\n"]
}
[@@ocaml.doc "Status information for cross-account discovery service.\n"]

type nonrec service_status = {
  cross_account_discovery : cross_account_discovery_service_status option;
      [@ocaml.doc "Status of cross-account discovery service.\n"]
  cross_region_discovery : cross_region_discovery_status option;
      [@ocaml.doc "Status of cross-region discovery service.\n"]
}
[@@ocaml.doc "Overall service status information for License Manager.\n"]

type nonrec get_service_settings_response = {
  s3_bucket_arn : string_ option;
      [@ocaml.doc
        "Regional S3 bucket path for storing reports, license trail event data, discovery data, \
         and so on.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc "SNS topic configured to receive notifications from License Manager.\n"]
  organization_configuration : organization_configuration option;
      [@ocaml.doc
        "Indicates whether Organizations is integrated with License Manager for cross-account \
         discovery.\n"]
  enable_cross_accounts_discovery : box_boolean option;
      [@ocaml.doc "Indicates whether cross-account discovery is enabled.\n"]
  license_manager_resource_share_arn : string_ option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the resource share. The License Manager management account \
         provides member accounts with access to this share.\n"]
  cross_region_discovery_home_region : string_ option;
      [@ocaml.doc "Cross region discovery home region.\n"]
  cross_region_discovery_source_regions : string_list option;
      [@ocaml.doc "Cross region discovery source regions.\n"]
  service_status : service_status option; [@ocaml.doc "Service status.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_settings_request = unit [@@ocaml.doc ""]

type nonrec entitlement_data_unit =
  | COUNT [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
  | SECONDS [@ocaml.doc ""]
  | MICROSECONDS [@ocaml.doc ""]
  | MILLISECONDS [@ocaml.doc ""]
  | BYTES [@ocaml.doc ""]
  | KILOBYTES [@ocaml.doc ""]
  | MEGABYTES [@ocaml.doc ""]
  | GIGABYTES [@ocaml.doc ""]
  | TERABYTES [@ocaml.doc ""]
  | BITS [@ocaml.doc ""]
  | KILOBITS [@ocaml.doc ""]
  | MEGABITS [@ocaml.doc ""]
  | GIGABITS [@ocaml.doc ""]
  | TERABITS [@ocaml.doc ""]
  | PERCENT [@ocaml.doc ""]
  | BYTES_PER_SECOND [@ocaml.doc ""]
  | KILOBYTES_PER_SECOND [@ocaml.doc ""]
  | MEGABYTES_PER_SECOND [@ocaml.doc ""]
  | GIGABYTES_PER_SECOND [@ocaml.doc ""]
  | TERABYTES_PER_SECOND [@ocaml.doc ""]
  | BITS_PER_SECOND [@ocaml.doc ""]
  | KILOBITS_PER_SECOND [@ocaml.doc ""]
  | MEGABITS_PER_SECOND [@ocaml.doc ""]
  | GIGABITS_PER_SECOND [@ocaml.doc ""]
  | TERABITS_PER_SECOND [@ocaml.doc ""]
  | COUNT_PER_SECOND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entitlement_usage = {
  name : string_; [@ocaml.doc "Entitlement usage name.\n"]
  consumed_value : string_; [@ocaml.doc "Resource usage consumed.\n"]
  max_count : string_ option; [@ocaml.doc "Maximum entitlement usage count.\n"]
  unit_ : entitlement_data_unit; [@ocaml.doc "Entitlement usage unit.\n"]
}
[@@ocaml.doc "Usage associated with an entitlement resource.\n"]

type nonrec entitlement_usage_list = entitlement_usage list [@@ocaml.doc ""]

type nonrec license_usage = {
  entitlement_usages : entitlement_usage_list option; [@ocaml.doc "License entitlement usages.\n"]
}
[@@ocaml.doc "Describes the entitlement usage associated with a license.\n"]

type nonrec get_license_usage_response = {
  license_usage : license_usage option; [@ocaml.doc "License usage details.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_usage_request = {
  license_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_manager_report_generator_response = {
  report_generator : report_generator option;
      [@ocaml.doc
        "A report generator that creates periodic reports about your license configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_manager_report_generator_request = {
  license_manager_report_generator_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the report generator.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_conversion_task_response = {
  license_conversion_task_id : license_conversion_task_id option;
      [@ocaml.doc "ID of the license type conversion task.\n"]
  resource_arn : string_ option;
      [@ocaml.doc
        "Amazon Resource Names (ARN) of the resources the license conversion task is associated \
         with.\n"]
  source_license_context : license_conversion_context option;
      [@ocaml.doc "Information about the license type converted from.\n"]
  destination_license_context : license_conversion_context option;
      [@ocaml.doc "Information about the license type converted to.\n"]
  status_message : string_ option; [@ocaml.doc "The status message for the conversion task.\n"]
  status : license_conversion_task_status option;
      [@ocaml.doc "Status of the license type conversion task.\n"]
  start_time : date_time option;
      [@ocaml.doc "Time at which the license type conversion task was started .\n"]
  license_conversion_time : date_time option;
      [@ocaml.doc "Amount of time to complete the license type conversion.\n"]
  end_time : date_time option;
      [@ocaml.doc "Time at which the license type conversion task was completed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_conversion_task_request = {
  license_conversion_task_id : license_conversion_task_id;
      [@ocaml.doc "ID of the license type conversion task to retrieve information on.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_configuration_response = {
  license_configuration_id : string_ option;
      [@ocaml.doc "Unique ID for the license configuration.\n"]
  license_configuration_arn : string_ option;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license configuration.\n"]
  name : string_ option; [@ocaml.doc "Name of the license configuration.\n"]
  description : string_ option; [@ocaml.doc "Description of the license configuration.\n"]
  license_counting_type : license_counting_type option;
      [@ocaml.doc "Dimension for which the licenses are counted.\n"]
  license_rules : string_list option; [@ocaml.doc "License rules.\n"]
  license_count : box_long option; [@ocaml.doc "Number of available licenses.\n"]
  license_count_hard_limit : box_boolean option;
      [@ocaml.doc "Sets the number of available licenses as a hard limit.\n"]
  consumed_licenses : box_long option; [@ocaml.doc "Number of licenses assigned to resources.\n"]
  status : string_ option; [@ocaml.doc "License configuration status.\n"]
  owner_account_id : string_ option;
      [@ocaml.doc "Account ID of the owner of the license configuration.\n"]
  consumed_license_summary_list : consumed_license_summary_list option;
      [@ocaml.doc "Summaries of the licenses consumed by resources.\n"]
  managed_resource_summary_list : managed_resource_summary_list option;
      [@ocaml.doc "Summaries of the managed resources.\n"]
  tags : tag_list option; [@ocaml.doc "Tags for the license configuration.\n"]
  product_information_list : product_information_list option; [@ocaml.doc "Product information.\n"]
  automated_discovery_information : automated_discovery_information option;
      [@ocaml.doc "Automated discovery information.\n"]
  disassociate_when_not_found : box_boolean option;
      [@ocaml.doc "When true, disassociates a resource when software is uninstalled.\n"]
  license_expiry : box_long option; [@ocaml.doc "License Expiry.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_configuration_request = {
  license_configuration_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_asset_ruleset_response = {
  license_asset_ruleset : license_asset_ruleset; [@ocaml.doc "License asset ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_asset_ruleset_request = {
  license_asset_ruleset_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_asset_group_response = {
  license_asset_group : license_asset_group; [@ocaml.doc "License asset group.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_asset_group_request = {
  license_asset_group_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset group.\n"]
}
[@@ocaml.doc ""]

type nonrec get_license_response = { license : license option [@ocaml.doc "License details.\n"] }
[@@ocaml.doc ""]

type nonrec get_license_request = {
  license_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  version : string_ option; [@ocaml.doc "License version.\n"]
}
[@@ocaml.doc ""]

type nonrec get_grant_response = { grant : grant option [@ocaml.doc "Grant details.\n"] }
[@@ocaml.doc ""]

type nonrec get_grant_request = {
  grant_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the grant.\n"]
  version : string_ option; [@ocaml.doc "Grant version.\n"]
}
[@@ocaml.doc ""]

type nonrec token_string = string [@@ocaml.doc ""]

type nonrec get_access_token_response = {
  access_token : token_string option; [@ocaml.doc "Temporary access token.\n"]
}
[@@ocaml.doc ""]

type nonrec get_access_token_request = {
  token : token_string; [@ocaml.doc "Refresh token, encoded as a JWT token.\n"]
  token_properties : max_size3_string_list option;
      [@ocaml.doc "Token properties to validate against those present in the JWT token.\n"]
}
[@@ocaml.doc ""]

type nonrec extend_license_consumption_response = {
  license_consumption_token : string_ option; [@ocaml.doc "License consumption token.\n"]
  expiration : iso8601_date_time option;
      [@ocaml.doc "Date and time at which the license consumption expires.\n"]
}
[@@ocaml.doc ""]

type nonrec extend_license_consumption_request = {
  license_consumption_token : string_; [@ocaml.doc "License consumption token.\n"]
  dry_run : boolean_ option;
      [@ocaml.doc
        "Checks whether you have the required permissions for the action, without actually making \
         the request. Provides an error response if you do not have the required permissions.\n"]
}
[@@ocaml.doc ""]

type nonrec location = string [@@ocaml.doc ""]

type nonrec redirect_exception = {
  location : location option; [@ocaml.doc ""]
  message : message option; [@ocaml.doc ""]
}
[@@ocaml.doc "This is not the correct Region for the resource. Try again.\n"]

type nonrec delete_token_response = unit [@@ocaml.doc ""]

type nonrec delete_token_request = { token_id : string_ [@ocaml.doc "Token ID.\n"] }
[@@ocaml.doc ""]

type nonrec delete_license_manager_report_generator_response = unit [@@ocaml.doc ""]

type nonrec delete_license_manager_report_generator_request = {
  license_manager_report_generator_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the report generator to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_license_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_license_configuration_request = {
  license_configuration_arn : string_; [@ocaml.doc "ID of the license configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_license_asset_ruleset_response = unit [@@ocaml.doc ""]

type nonrec delete_license_asset_ruleset_request = {
  license_asset_ruleset_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_license_asset_group_response = {
  status : license_asset_group_status; [@ocaml.doc "License asset group status.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_license_asset_group_request = {
  license_asset_group_arn : arn;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset group.\n"]
}
[@@ocaml.doc ""]

type nonrec license_deletion_status = PENDING_DELETE [@ocaml.doc ""] | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delete_license_response = {
  status : license_deletion_status option; [@ocaml.doc "License status.\n"]
  deletion_date : iso8601_date_time option; [@ocaml.doc "Date when the license is deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_license_request = {
  license_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  source_version : string_; [@ocaml.doc "Current version of the license.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_grant_response = {
  grant_arn : arn option; [@ocaml.doc "Grant ARN.\n"]
  status : grant_status option; [@ocaml.doc "Grant status.\n"]
  version : string_ option; [@ocaml.doc "Grant version.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_grant_request = {
  grant_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the grant.\n"]
  status_reason : status_reason_message option;
      [@ocaml.doc "The Status reason for the delete request.\n"]
  version : string_; [@ocaml.doc "Current version of the grant.\n"]
}
[@@ocaml.doc ""]

type nonrec token_type = REFRESH_TOKEN [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec create_token_response = {
  token_id : string_ option; [@ocaml.doc "Token ID.\n"]
  token_type : token_type option; [@ocaml.doc "Token type.\n"]
  token : token_string option; [@ocaml.doc "Refresh token, encoded as a JWT token.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec create_token_request = {
  license_arn : arn;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the license. The ARN is mapped to the aud claim of the JWT \
         token.\n"]
  role_arns : arn_list option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the IAM roles to embed in the token. License Manager does \
         not check whether the roles are in use.\n"]
  expiration_in_days : integer option;
      [@ocaml.doc
        "Token expiration, in days, counted from token creation. The default is 365 days.\n"]
  token_properties : max_size3_string_list option;
      [@ocaml.doc
        "Data specified by the caller to be included in the JWT token. The data is mapped to the \
         amr claim of the JWT token.\n"]
  client_token : client_token; [@ocaml.doc "Idempotency token, valid for 10 minutes.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_version_response = {
  license_arn : arn option; [@ocaml.doc "License ARN.\n"]
  version : string_ option; [@ocaml.doc "New version of the license.\n"]
  status : license_status option; [@ocaml.doc "License status.\n"]
}
[@@ocaml.doc ""]

type nonrec issuer = {
  name : string_; [@ocaml.doc "Issuer name.\n"]
  sign_key : string_ option;
      [@ocaml.doc
        "Asymmetric KMS key from Key Management Service. The KMS key must have a key usage of sign \
         and verify, and support the RSASSA-PSS SHA-256 signing algorithm.\n"]
}
[@@ocaml.doc "Details about the issuer of a license.\n"]

type nonrec create_license_version_request = {
  license_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  license_name : string_; [@ocaml.doc "License name.\n"]
  product_name : string_; [@ocaml.doc "Product name.\n"]
  issuer : issuer; [@ocaml.doc "License issuer.\n"]
  home_region : string_; [@ocaml.doc "Home Region of the license.\n"]
  validity : datetime_range;
      [@ocaml.doc "Date and time range during which the license is valid, in ISO8601-UTC format.\n"]
  license_metadata : metadata_list option; [@ocaml.doc "Information about the license.\n"]
  entitlements : entitlement_list; [@ocaml.doc "License entitlements.\n"]
  consumption_configuration : consumption_configuration;
      [@ocaml.doc
        "Configuration for consumption of the license. Choose a provisional configuration for \
         workloads running with continuous connectivity. Choose a borrow configuration for \
         workloads with offline usage.\n"]
  status : license_status; [@ocaml.doc "License status.\n"]
  client_token : client_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  source_version : string_ option; [@ocaml.doc "Current version of the license.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_manager_report_generator_response = {
  license_manager_report_generator_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the new report generator.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_manager_report_generator_request = {
  report_generator_name : report_generator_name; [@ocaml.doc "Name of the report generator.\n"]
  type_ : report_type_list;
      [@ocaml.doc
        "Type of reports to generate. The following report types an be generated:\n\n\
        \ {ul\n\
        \       {-  License configuration report - Reports the number and details of consumed \
         licenses for a license configuration.\n\
        \           \n\
        \            }\n\
        \       {-  Resource report - Reports the tracked licenses and resource consumption for a \
         license configuration.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  report_context : report_context;
      [@ocaml.doc "Defines the type of license configuration the report generator tracks.\n"]
  report_frequency : report_frequency;
      [@ocaml.doc
        "Frequency by which reports are generated. Reports can be generated daily, monthly, or \
         weekly.\n"]
  client_token : client_request_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  description : string_ option; [@ocaml.doc "Description of the report generator.\n"]
  tags : tag_list option; [@ocaml.doc "Tags to add to the report generator.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_conversion_task_for_resource_response = {
  license_conversion_task_id : license_conversion_task_id option;
      [@ocaml.doc "The ID of the created license type conversion task.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_conversion_task_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the resource you are converting the license type for.\n"]
  source_license_context : license_conversion_context;
      [@ocaml.doc
        "Information that identifies the license type you are converting from. For the structure \
         of the source license, see \
         {{:https://docs.aws.amazon.com/license-manager/latest/userguide/conversion-procedures.html#conversion-cli}Convert \
         a license type using the CLI } in the {i License Manager User Guide}.\n"]
  destination_license_context : license_conversion_context;
      [@ocaml.doc
        "Information that identifies the license type you are converting to. For the structure of \
         the destination license, see \
         {{:https://docs.aws.amazon.com/license-manager/latest/userguide/conversion-procedures.html#conversion-cli}Convert \
         a license type using the CLI } in the {i License Manager User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_configuration_response = {
  license_configuration_arn : string_ option;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_configuration_request = {
  name : string_; [@ocaml.doc "Name of the license configuration.\n"]
  description : string_ option; [@ocaml.doc "Description of the license configuration.\n"]
  license_counting_type : license_counting_type;
      [@ocaml.doc "Dimension used to track the license inventory.\n"]
  license_count : box_long option;
      [@ocaml.doc "Number of licenses managed by the license configuration.\n"]
  license_count_hard_limit : box_boolean option;
      [@ocaml.doc
        "Indicates whether hard or soft license enforcement is used. Exceeding a hard limit blocks \
         the launch of new instances.\n"]
  license_rules : string_list option;
      [@ocaml.doc
        "License rules. The syntax is #name=value (for example, \
         #allowedTenancy=EC2-DedicatedHost). The available rules vary by dimension, as follows.\n\n\
        \ {ul\n\
        \       {-   [Cores] dimension: [allowedTenancy] | [licenseAffinityToHost] | \
         [maximumCores] | [minimumCores] \n\
        \           \n\
        \            }\n\
        \       {-   [Instances] dimension: [allowedTenancy] | [maximumVcpus] | [minimumVcpus] \n\
        \           \n\
        \            }\n\
        \       {-   [Sockets] dimension: [allowedTenancy] | [licenseAffinityToHost] | \
         [maximumSockets] | [minimumSockets] \n\
        \           \n\
        \            }\n\
        \       {-   [vCPUs] dimension: [allowedTenancy] | [honorVcpuOptimization] | \
         [maximumVcpus] | [minimumVcpus] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The unit for [licenseAffinityToHost] is days and the range is 1 to 180. The possible \
         values for [allowedTenancy] are [EC2-Default], [EC2-DedicatedHost], and \
         [EC2-DedicatedInstance]. The possible values for [honorVcpuOptimization] are [True] and \
         [False].\n\
        \   "]
  tags : tag_list option; [@ocaml.doc "Tags to add to the license configuration.\n"]
  disassociate_when_not_found : box_boolean option;
      [@ocaml.doc "When true, disassociates a resource when software is uninstalled.\n"]
  product_information_list : product_information_list option; [@ocaml.doc "Product information.\n"]
  license_expiry : box_long option; [@ocaml.doc "License configuration expiry.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_asset_ruleset_response = {
  license_asset_ruleset_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset ruleset.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_asset_ruleset_request = {
  name : license_asset_resource_name; [@ocaml.doc "License asset ruleset name.\n"]
  description : license_asset_resource_description option;
      [@ocaml.doc "License asset ruleset description.\n"]
  rules : license_asset_rule_list; [@ocaml.doc "License asset rules.\n"]
  tags : tag_list option; [@ocaml.doc "Tags to add to the license asset ruleset.\n"]
  client_token : string_;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_asset_group_response = {
  license_asset_group_arn : string_;
      [@ocaml.doc "Amazon Resource Name (ARN) of the license asset group.\n"]
  status : string_; [@ocaml.doc "License asset group status.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_asset_group_request = {
  name : license_asset_resource_name; [@ocaml.doc "License asset group name.\n"]
  description : license_asset_resource_description option;
      [@ocaml.doc "License asset group description.\n"]
  license_asset_group_configurations : license_asset_group_configuration_list;
      [@ocaml.doc "License asset group configurations.\n"]
  associated_license_asset_ruleset_ar_ns : license_asset_ruleset_arn_list;
      [@ocaml.doc "ARNs of associated license asset rulesets.\n"]
  properties : license_asset_group_property_list option;
      [@ocaml.doc "License asset group properties.\n"]
  tags : tag_list option; [@ocaml.doc "Tags to add to the license asset group.\n"]
  client_token : string_;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_response = {
  license_arn : arn option; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  status : license_status option; [@ocaml.doc "License status.\n"]
  version : string_ option; [@ocaml.doc "License version.\n"]
}
[@@ocaml.doc ""]

type nonrec create_license_request = {
  license_name : string_; [@ocaml.doc "License name.\n"]
  product_name : string_; [@ocaml.doc "Product name.\n"]
  product_sk_u : string_; [@ocaml.doc "Product SKU.\n"]
  issuer : issuer; [@ocaml.doc "License issuer.\n"]
  home_region : string_; [@ocaml.doc "Home Region for the license.\n"]
  validity : datetime_range;
      [@ocaml.doc "Date and time range during which the license is valid, in ISO8601-UTC format.\n"]
  entitlements : entitlement_list; [@ocaml.doc "License entitlements.\n"]
  beneficiary : string_; [@ocaml.doc "License beneficiary.\n"]
  consumption_configuration : consumption_configuration;
      [@ocaml.doc
        "Configuration for consumption of the license. Choose a provisional configuration for \
         workloads running with continuous connectivity. Choose a borrow configuration for \
         workloads with offline usage.\n"]
  license_metadata : metadata_list option; [@ocaml.doc "Information about the license.\n"]
  client_token : client_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to add to the license. For more information about tagging support in License \
         Manager, see the \
         {{:https://docs.aws.amazon.com/license-manager/latest/APIReference/API_TagResource.html}TagResource} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_grant_version_response = {
  grant_arn : arn option; [@ocaml.doc "Grant ARN.\n"]
  status : grant_status option; [@ocaml.doc "Grant status.\n"]
  version : string_ option; [@ocaml.doc "New version of the grant.\n"]
}
[@@ocaml.doc ""]

type nonrec create_grant_version_request = {
  client_token : client_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  grant_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the grant.\n"]
  grant_name : string_ option; [@ocaml.doc "Grant name.\n"]
  allowed_operations : allowed_operation_list option;
      [@ocaml.doc "Allowed operations for the grant.\n"]
  status : grant_status option; [@ocaml.doc "Grant status.\n"]
  status_reason : status_reason_message option; [@ocaml.doc "Grant status reason.\n"]
  source_version : string_ option; [@ocaml.doc "Current version of the grant.\n"]
  options : options option; [@ocaml.doc "The options specified for the grant.\n"]
}
[@@ocaml.doc ""]

type nonrec create_grant_response = {
  grant_arn : arn option; [@ocaml.doc "Grant ARN.\n"]
  status : grant_status option; [@ocaml.doc "Grant status.\n"]
  version : string_ option; [@ocaml.doc "Grant version.\n"]
}
[@@ocaml.doc ""]

type nonrec principal_arn_list = arn list [@@ocaml.doc ""]

type nonrec create_grant_request = {
  client_token : client_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  grant_name : string_; [@ocaml.doc "Grant name.\n"]
  license_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  principals : principal_arn_list;
      [@ocaml.doc
        "The grant principals. You can specify one of the following as an Amazon Resource Name \
         (ARN):\n\n\
        \ {ul\n\
        \       {-  An Amazon Web Services account, which includes only the account specified.\n\
        \           \n\
        \            }\n\
        \       } {ul\n\
        \               {-  An organizational unit (OU), which includes all accounts in the OU.\n\
        \                   \n\
        \                    }\n\
        \               }\n\
        \   {ul\n\
        \         {-  An organization, which will include all accounts across your organization.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  home_region : string_; [@ocaml.doc "Home Region of the grant.\n"]
  allowed_operations : allowed_operation_list; [@ocaml.doc "Allowed operations for the grant.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "Tags to add to the grant. For more information about tagging support in License Manager, \
         see the \
         {{:https://docs.aws.amazon.com/license-manager/latest/APIReference/API_TagResource.html}TagResource} \
         operation.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_digital_signature_method_exception = {
  message : message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The digital signature method is unsupported. Try your request again.\n"]

type nonrec no_entitlements_allowed_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc
  "There are no entitlements found for this license, or the entitlement maximum count is reached.\n"]

type nonrec signed_token = string [@@ocaml.doc ""]

type nonrec entitlement_data = {
  name : string_; [@ocaml.doc "Entitlement data name.\n"]
  value : string_ option; [@ocaml.doc "Entitlement data value.\n"]
  unit_ : entitlement_data_unit; [@ocaml.doc "Entitlement data unit.\n"]
}
[@@ocaml.doc "Data associated with an entitlement resource.\n"]

type nonrec entitlement_data_list = entitlement_data list [@@ocaml.doc ""]

type nonrec checkout_type = PROVISIONAL [@ocaml.doc ""] | PERPETUAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec checkout_license_response = {
  checkout_type : checkout_type option; [@ocaml.doc "Checkout type.\n"]
  license_consumption_token : string_ option; [@ocaml.doc "License consumption token.\n"]
  entitlements_allowed : entitlement_data_list option;
      [@ocaml.doc "Allowed license entitlements.\n"]
  signed_token : signed_token option; [@ocaml.doc "Signed token.\n"]
  node_id : string_ option; [@ocaml.doc "Node ID.\n"]
  issued_at : iso8601_date_time option;
      [@ocaml.doc "Date and time at which the license checkout is issued.\n"]
  expiration : iso8601_date_time option;
      [@ocaml.doc "Date and time at which the license checkout expires.\n"]
  license_arn : string_ option; [@ocaml.doc "Amazon Resource Name (ARN) of the checkout license.\n"]
}
[@@ocaml.doc ""]

type nonrec checkout_license_request = {
  product_sk_u : string_; [@ocaml.doc "Product SKU.\n"]
  checkout_type : checkout_type; [@ocaml.doc "Checkout type.\n"]
  key_fingerprint : string_; [@ocaml.doc "Key fingerprint identifying the license.\n"]
  entitlements : entitlement_data_list; [@ocaml.doc "License entitlements.\n"]
  client_token : client_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  beneficiary : string_ option; [@ocaml.doc "License beneficiary.\n"]
  node_id : string_ option; [@ocaml.doc "Node ID.\n"]
}
[@@ocaml.doc ""]

type nonrec entitlement_not_allowed_exception = { message : message option [@ocaml.doc ""] }
[@@ocaml.doc "The entitlement is not allowed.\n"]

type nonrec checkout_borrow_license_response = {
  license_arn : arn option; [@ocaml.doc "Amazon Resource Name (ARN) of the license.\n"]
  license_consumption_token : string_ option; [@ocaml.doc "License consumption token.\n"]
  entitlements_allowed : entitlement_data_list option;
      [@ocaml.doc "Allowed license entitlements.\n"]
  node_id : string_ option; [@ocaml.doc "Node ID.\n"]
  signed_token : signed_token option; [@ocaml.doc "Signed token.\n"]
  issued_at : iso8601_date_time option;
      [@ocaml.doc "Date and time at which the license checkout is issued.\n"]
  expiration : iso8601_date_time option;
      [@ocaml.doc "Date and time at which the license checkout expires.\n"]
  checkout_metadata : metadata_list option; [@ocaml.doc "Information about constraints.\n"]
}
[@@ocaml.doc ""]

type nonrec digital_signature_method = JWT_PS384 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec checkout_borrow_license_request = {
  license_arn : arn;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the license. The license must use the borrow consumption \
         configuration.\n"]
  entitlements : entitlement_data_list;
      [@ocaml.doc "License entitlements. Partial checkouts are not supported.\n"]
  digital_signature_method : digital_signature_method;
      [@ocaml.doc
        "Digital signature method. The possible value is JSON Web Signature (JWS) algorithm PS384. \
         For more information, see {{:https://tools.ietf.org/html/rfc7518#section-3.5}RFC 7518 \
         Digital Signature with RSASSA-PSS}.\n"]
  node_id : string_ option; [@ocaml.doc "Node ID.\n"]
  checkout_metadata : metadata_list option; [@ocaml.doc "Information about constraints.\n"]
  client_token : client_token;
      [@ocaml.doc
        "Unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec check_in_license_response = unit [@@ocaml.doc ""]

type nonrec check_in_license_request = {
  license_consumption_token : string_; [@ocaml.doc "License consumption token.\n"]
  beneficiary : string_ option; [@ocaml.doc "License beneficiary.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_grant_response = {
  grant_arn : arn option; [@ocaml.doc "Grant ARN.\n"]
  status : grant_status option; [@ocaml.doc "Grant status.\n"]
  version : string_ option; [@ocaml.doc "Grant version.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_grant_request = {
  grant_arn : arn; [@ocaml.doc "Amazon Resource Name (ARN) of the grant.\n"]
}
[@@ocaml.doc ""]
