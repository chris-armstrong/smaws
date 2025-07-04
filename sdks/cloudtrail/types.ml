open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cloudtrail";
      endpointPrefix = "cloudtrail";
      version = "2013-11-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec view_properties_map = (string * string) list[@@ocaml.doc ""]
type nonrec widget =
  {
  view_properties: view_properties_map option
    [@ocaml.doc
      " The view properties for the widget. For more information about view properties, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-widget-properties.html} View properties for widgets } in the {i CloudTrail User Guide}.. \n"];
  query_parameters: string list option
    [@ocaml.doc " The query parameters for the widget. \n"];
  query_statement: string option
    [@ocaml.doc " The SQL query statement for the widget. \n"];
  query_alias: string option
    [@ocaml.doc
      "The query alias used to identify the query for the widget. \n"]}
[@@ocaml.doc " A widget on a CloudTrail Lake dashboard. \n"]
type nonrec update_trail_response =
  {
  is_organization_trail: bool option
    [@ocaml.doc "Specifies whether the trail is an organization trail.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.\n\n  [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n "];
  cloud_watch_logs_role_arn: string option
    [@ocaml.doc
      "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.\n"];
  cloud_watch_logs_log_group_arn: string option
    [@ocaml.doc
      "Specifies the Amazon Resource Name (ARN) of the log group to which CloudTrail logs are delivered.\n"];
  log_file_validation_enabled: bool option
    [@ocaml.doc
      "Specifies whether log file integrity validation is enabled.\n"];
  trail_ar_n: string option
    [@ocaml.doc
      "Specifies the ARN of the trail that was updated. The following is the format of a trail ARN.\n\n  [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n "];
  is_multi_region_trail: bool option
    [@ocaml.doc
      "Specifies whether the trail exists in one Region or in all Regions.\n"];
  include_global_service_events: bool option
    [@ocaml.doc
      "Specifies whether the trail is publishing events from global services such as IAM to the log files.\n"];
  sns_topic_ar_n: string option
    [@ocaml.doc
      "Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files are delivered. The following is the format of a topic ARN.\n\n  [arn:aws:sns:us-east-2:123456789012:MyTopic] \n "];
  sns_topic_name: string option
    [@ocaml.doc "This field is no longer in use. Use [SnsTopicARN].\n"];
  s3_key_prefix: string option
    [@ocaml.doc
      "Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your IAM Log Files}.\n"];
  s3_bucket_name: string option
    [@ocaml.doc
      "Specifies the name of the Amazon S3 bucket designated for publishing log files.\n"];
  name: string option [@ocaml.doc "Specifies the name of the trail.\n"]}
[@@ocaml.doc
  "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec update_trail_request =
  {
  is_organization_trail: bool option
    [@ocaml.doc
      "Specifies whether the trail is applied to all accounts in an organization in Organizations, or only for the current Amazon Web Services account. The default is false, and cannot be true unless the call is made on behalf of an Amazon Web Services account that is the management account for an organization in Organizations. If the trail is not an organization trail and this is set to [true], the trail will be created in all Amazon Web Services accounts that belong to the organization. If the trail is an organization trail and this is set to [false], the trail will remain in the current Amazon Web Services account but be deleted from all member accounts in the organization.\n\n  Only the management account for the organization can convert an organization trail to a non-organization trail, or convert a non-organization trail to an organization trail.\n  \n   "];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID to use to encrypt the logs delivered by CloudTrail. The value can be an alias name prefixed by \"alias/\", a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.\n\n CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.\n \n  Examples:\n  \n   {ul\n         {-  alias/MyAliasName\n             \n              }\n         {-  arn:aws:kms:us-east-2:123456789012:alias/MyAliasName\n             \n              }\n         {-  arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012\n             \n              }\n         {-  12345678-1234-1234-1234-123456789012\n             \n              }\n         }\n  "];
  cloud_watch_logs_role_arn: string option
    [@ocaml.doc
      "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group. You must use a role that exists in your account.\n"];
  cloud_watch_logs_log_group_arn: string option
    [@ocaml.doc
      "Specifies a log group name using an Amazon Resource Name (ARN), a unique identifier that represents the log group to which CloudTrail logs are delivered. You must use a log group that exists in your account.\n\n Not required unless you specify [CloudWatchLogsRoleArn].\n "];
  enable_log_file_validation: bool option
    [@ocaml.doc
      "Specifies whether log file validation is enabled. The default is false.\n\n  When you disable log file integrity validation, the chain of digest files is broken after one hour. CloudTrail does not create digest files for log files that were delivered during a period in which log file integrity validation was disabled. For example, if you enable log file integrity validation at noon on January 1, disable it at noon on January 2, and re-enable it at noon on January 10, digest files will not be created for the log files delivered from noon on January 2 to noon on January 10. The same applies whenever you stop CloudTrail logging or delete a trail.\n  \n   "];
  is_multi_region_trail: bool option
    [@ocaml.doc
      "Specifies whether the trail applies only to the current Region or to all Regions. The default is false. If the trail exists only in the current Region and this value is set to true, shadow trails (replications of the trail) will be created in the other Regions. If the trail exists in all Regions and this value is set to false, the trail will remain in the Region where it was created, and its shadow trails in other Regions will be deleted. As a best practice, consider using trails that log events in all Regions.\n"];
  include_global_service_events: bool option
    [@ocaml.doc
      "Specifies whether the trail is publishing events from global services such as IAM to the log files.\n"];
  sns_topic_name: string option
    [@ocaml.doc
      "Specifies the name or ARN of the Amazon SNS topic defined for notification of log file delivery. The maximum length is 256 characters.\n"];
  s3_key_prefix: string option
    [@ocaml.doc
      "Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}. The maximum length is 200 characters.\n"];
  s3_bucket_name: string option
    [@ocaml.doc
      "Specifies the name of the Amazon S3 bucket designated for publishing log files. See {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Amazon S3 Bucket naming rules}.\n"];
  name: string
    [@ocaml.doc
      "Specifies the name of the trail or trail ARN. If [Name] is a trail name, the string must meet the following requirements:\n\n {ul\n       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)\n           \n            }\n       {-  Start with a letter or number, and end with a letter or number\n           \n            }\n       {-  Be between 3 and 128 characters\n           \n            }\n       {-  Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.\n           \n            }\n       {-  Not be in IP address format (for example, 192.168.5.4)\n           \n            }\n       }\n   If [Name] is a trail ARN, it must be in the following format.\n   \n     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n    "]}
[@@ocaml.doc "Specifies settings to update for the trail.\n"]
type nonrec unsupported_operation_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the requested operation is not supported.\n"]
type nonrec trail_not_provided_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "This exception is no longer in use.\n"]
type nonrec trail_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the trail with the given name is not found.\n"]
type nonrec throttling_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the request rate exceeds the limit. \n"]
type nonrec s3_bucket_does_not_exist_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified S3 bucket does not exist.\n"]
type nonrec organizations_not_in_use_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the request is made from an Amazon Web Services account that is not a member of an organization. To make this request, sign in using the credentials of an account that belongs to an organization.\n"]
type nonrec organization_not_in_all_features_mode_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when Organizations is not configured to support all features. All features must be enabled in Organizations to support creating an organization trail or event data store.\n"]
type nonrec operation_not_permitted_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the requested operation is not permitted.\n"]
type nonrec not_organization_master_account_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the Amazon Web Services account making the request to create or update an organization trail or event data store is not the management account for an organization in Organizations. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/creating-an-organizational-trail-prepare.html}Prepare For Creating a Trail For Your Organization} or {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-organizations.html}Organization event data stores}.\n"]
type nonrec no_management_account_slr_exists_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the management account does not have a service-linked role. \n"]
type nonrec kms_key_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the KMS key does not exist, when the S3 bucket and the KMS key are not in the same Region, or when the KMS key associated with the Amazon SNS topic either does not exist or is not in the same Region.\n"]
type nonrec kms_key_disabled_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "This exception is no longer in use.\n"]
type nonrec kms_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when there is an issue with the specified KMS key and the trail or event data store can't be updated.\n"]
type nonrec invalid_trail_name_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the provided trail name is not valid. Trail names must meet the following requirements:\n\n {ul\n       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)\n           \n            }\n       {-  Start with a letter or number, and end with a letter or number\n           \n            }\n       {-  Be between 3 and 128 characters\n           \n            }\n       {-  Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.\n           \n            }\n       {-  Not be in IP address format (for example, 192.168.5.4)\n           \n            }\n       }\n  "]
type nonrec invalid_sns_topic_name_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the provided SNS topic name is not valid.\n"]
type nonrec invalid_s3_prefix_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the provided S3 prefix is not valid.\n"]
type nonrec invalid_s3_bucket_name_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the provided S3 bucket name is not valid.\n"]
type nonrec invalid_parameter_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "The request includes a parameter that is not valid.\n"]
type nonrec invalid_parameter_combination_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the combination of parameters provided is not valid.\n"]
type nonrec invalid_kms_key_id_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "This exception is thrown when the KMS key ARN is not valid.\n"]
type nonrec invalid_home_region_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when an operation is called on a trail from a Region other than the Region in which the trail was created.\n"]
type nonrec invalid_event_selectors_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the [PutEventSelectors] operation is called with a number of event selectors, advanced event selectors, or data resources that is not valid. The combination of event selectors or advanced event selectors and data resources is not valid. A trail can have up to 5 event selectors. If a trail uses advanced event selectors, a maximum of 500 total values for all conditions in all advanced event selectors is allowed. A trail is limited to 250 data resources. These data resources can be distributed across event selectors, but the overall total cannot exceed 250.\n\n You can:\n \n  {ul\n        {-  Specify a valid number of event selectors (1 to 5) for a trail.\n            \n             }\n        {-  Specify a valid number of data resources (1 to 250) for an event selector. The limit of number of resources on an individual event selector is configurable up to 250. However, this upper limit is allowed only if the total number of data resources does not exceed 250 across all event selectors for a trail.\n            \n             }\n        {-  Specify up to 500 values for all conditions in all advanced event selectors for a trail.\n            \n             }\n        {-  Specify a valid value for a parameter. For example, specifying the [ReadWriteType] parameter with a value of [read-only] is not valid.\n            \n             }\n        }\n  "]
type nonrec invalid_cloud_watch_logs_role_arn_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the provided role is not valid.\n"]
type nonrec invalid_cloud_watch_logs_log_group_arn_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the provided CloudWatch Logs log group is not valid.\n"]
type nonrec insufficient_sns_topic_policy_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the policy on the Amazon SNS topic is not sufficient.\n"]
type nonrec insufficient_s3_bucket_policy_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the policy on the S3 bucket is not sufficient.\n"]
type nonrec insufficient_encryption_policy_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "For the [CreateTrail] [PutInsightSelectors], [UpdateTrail], [StartQuery], and [StartImport] operations, this exception is thrown when the policy on the S3 bucket or KMS key does not have sufficient permissions for the operation.\n\n For all other operations, this exception is thrown when the policy for the KMS key does not have sufficient permissions for the operation.\n "]
type nonrec insufficient_dependency_service_access_permission_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the IAM identity that is used to create the organization resource lacks one or more required permissions for creating an organization resource in a required service.\n"]
type nonrec conflict_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified resource is not ready for an operation. This can occur when you try to run an operation on a resource before CloudTrail has time to fully load the resource, or because another operation is modifying the resource. If this exception occurs, wait a few minutes, and then try the operation again.\n"]
type nonrec cloud_watch_logs_delivery_unavailable_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "Cannot set a CloudWatch Logs delivery for this Region.\n"]
type nonrec cloud_trail_invalid_client_token_id_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when a call results in the [InvalidClientTokenId] error code. This can occur when you are creating or updating a trail to send notifications to an Amazon SNS topic that is in a suspended Amazon Web Services account.\n"]
type nonrec cloud_trail_arn_invalid_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when an operation is called with an ARN that is not valid.\n\n The following is the format of a trail ARN: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n \n  The following is the format of an event data store ARN: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n  \n   The following is the format of a dashboard ARN: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n   \n    The following is the format of a channel ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n    "]
type nonrec cloud_trail_access_not_enabled_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when trusted access has not been enabled between CloudTrail and Organizations. For more information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_how-to-enable-disable-trusted-access}How to enable or disable trusted access} in the {i Organizations User Guide} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/creating-an-organizational-trail-prepare.html}Prepare For Creating a Trail For Your Organization} in the {i CloudTrail User Guide}.\n"]
type nonrec event_data_store_status =
  | STOPPED_INGESTION [@ocaml.doc ""]
  | STOPPING_INGESTION [@ocaml.doc ""]
  | STARTING_INGESTION [@ocaml.doc ""]
  | PENDING_DELETION [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec advanced_field_selector =
  {
  not_ends_with: string list option
    [@ocaml.doc
      " An operator that excludes events that match the last few characters of the event record field specified as the value of [Field]. \n"];
  not_starts_with: string list option
    [@ocaml.doc
      " An operator that excludes events that match the first few characters of the event record field specified as the value of [Field]. \n"];
  not_equals: string list option
    [@ocaml.doc
      " An operator that excludes events that match the exact value of the event record field specified as the value of [Field]. \n"];
  ends_with: string list option
    [@ocaml.doc
      "An operator that includes events that match the last few characters of the event record field specified as the value of [Field].\n"];
  starts_with: string list option
    [@ocaml.doc
      "An operator that includes events that match the first few characters of the event record field specified as the value of [Field].\n"];
  equals: string list option
    [@ocaml.doc
      " An operator that includes events that match the exact value of the event record field specified as the value of [Field]. This is the only valid operator that you can use with the [readOnly], [eventCategory], and [resources.type] fields.\n"];
  field: string
    [@ocaml.doc
      " A field in a CloudTrail event record on which to filter events to be logged. For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or events outside of Amazon Web Services, the field is used only for selecting events as filtering is not supported.\n\n For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedFieldSelector.html}AdvancedFieldSelector} in the {i CloudTrail API Reference}.\n \n   Selectors don't support the use of wildcards like [*] . To match multiple values with a single condition, you may use [StartsWith], [EndsWith], [NotStartsWith], or [NotEndsWith] to explicitly match the beginning or end of the event field.\n   \n    "]}
[@@ocaml.doc "A single selector statement in an advanced event selector.\n"]
type nonrec advanced_event_selector =
  {
  field_selectors: advanced_field_selector list
    [@ocaml.doc
      "Contains all selector statements in an advanced event selector.\n"];
  name: string option
    [@ocaml.doc
      "An optional, descriptive name for an advanced event selector, such as \"Log data events for only two S3 buckets\".\n"]}
[@@ocaml.doc
  "Advanced event selectors let you create fine-grained selectors for CloudTrail management, data, and network activity events. They help you control costs by logging only those events that are important to you. For more information about configuring advanced event selectors, see the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events}, {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-network-events-with-cloudtrail.html}Logging network activity events}, and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events} topics in the {i CloudTrail User Guide}.\n\n You cannot apply both event selectors and advanced event selectors to a trail.\n \n  For information about configurable advanced event selector fields, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelector} in the {i CloudTrail API Reference}.\n  "]
type nonrec billing_mode =
  | FIXED_RETENTION_PRICING [@ocaml.doc ""]
  | EXTENDABLE_RETENTION_PRICING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec federation_status =
  | DISABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_event_data_store_response =
  {
  federation_role_arn: string option
    [@ocaml.doc
      " If Lake query federation is enabled, provides the ARN of the federation role used to access the resources for the federated event data store. \n"];
  federation_status: federation_status option
    [@ocaml.doc
      " Indicates the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Lake query federation} status. The status is [ENABLED] if Lake query federation is enabled, or [DISABLED] if Lake query federation is disabled. You cannot delete an event data store if the [FederationStatus] is [ENABLED]. \n"];
  billing_mode: billing_mode option
    [@ocaml.doc "The billing mode for the event data store.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.\n\n  [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n "];
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp that shows when the event data store was last updated. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].\n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp that shows when an event data store was first created.\n"];
  termination_protection_enabled: bool option
    [@ocaml.doc
      "Indicates whether termination protection is enabled for the event data store.\n"];
  retention_period: int option
    [@ocaml.doc "The retention period, in days.\n"];
  organization_enabled: bool option
    [@ocaml.doc
      "Indicates whether an event data store is collecting logged events for an organization in Organizations.\n"];
  multi_region_enabled: bool option
    [@ocaml.doc
      "Indicates whether the event data store includes events from all Regions, or only from the Region in which it was created.\n"];
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "The advanced event selectors that are applied to the event data store.\n"];
  status: event_data_store_status option
    [@ocaml.doc "The status of an event data store.\n"];
  name: string option [@ocaml.doc "The name of the event data store.\n"];
  event_data_store_arn: string option
    [@ocaml.doc "The ARN of the event data store.\n"]}[@@ocaml.doc ""]
type nonrec update_event_data_store_request =
  {
  billing_mode: billing_mode option
    [@ocaml.doc
      " You can't change the billing mode from [EXTENDABLE_RETENTION_PRICING] to [FIXED_RETENTION_PRICING]. If [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING] and you want to use [FIXED_RETENTION_PRICING] instead, you'll need to stop ingestion on the event data store and create a new event data store that uses [FIXED_RETENTION_PRICING].\n \n   The billing mode for the event data store determines the cost for ingesting events and the default and maximum retention period for the event data store.\n   \n    The following are the possible values:\n    \n     {ul\n           {-   [EXTENDABLE_RETENTION_PRICING] - This billing mode is generally recommended if you want a flexible retention period of up to 3653 days (about 10 years). The default retention period for this billing mode is 366 days.\n               \n                }\n           {-   [FIXED_RETENTION_PRICING] - This billing mode is recommended if you expect to ingest more than 25 TB of event data per month and need a retention period of up to 2557 days (about 7 years). The default retention period for this billing mode is 2557 days.\n               \n                }\n           }\n   For more information about CloudTrail pricing, see {{:http://aws.amazon.com/cloudtrail/pricing/}CloudTrail Pricing} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-manage-costs.html}Managing CloudTrail Lake costs}.\n   "];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID to use to encrypt the events delivered by CloudTrail. The value can be an alias name prefixed by [alias/], a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.\n\n  Disabling or deleting the KMS key, or removing CloudTrail permissions on the key, prevents CloudTrail from logging events to the event data store, and prevents users from querying the data in the event data store that was encrypted with the key. After you associate an event data store with a KMS key, the KMS key cannot be removed or changed. Before you disable or delete a KMS key that you are using with an event data store, delete or back up your event data store.\n  \n    CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.\n    \n     Examples:\n     \n      {ul\n            {-   [alias/MyAliasName] \n                \n                 }\n            {-   [arn:aws:kms:us-east-2:123456789012:alias/MyAliasName] \n                \n                 }\n            {-   [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n                \n                 }\n            {-   [12345678-1234-1234-1234-123456789012] \n                \n                 }\n            }\n  "];
  termination_protection_enabled: bool option
    [@ocaml.doc
      "Indicates that termination protection is enabled and the event data store cannot be automatically deleted.\n"];
  retention_period: int option
    [@ocaml.doc
      "The retention period of the event data store, in days. If [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], you can set a retention period of up to 3653 days, the equivalent of 10 years. If [BillingMode] is set to [FIXED_RETENTION_PRICING], you can set a retention period of up to 2557 days, the equivalent of seven years.\n\n CloudTrail Lake determines whether to retain an event by checking if the [eventTime] of the event is within the specified retention period. For example, if you set a retention period of 90 days, CloudTrail will remove events when the [eventTime] is older than 90 days.\n \n   If you decrease the retention period of an event data store, CloudTrail will remove any events with an [eventTime] older than the new retention period. For example, if the previous retention period was 365 days and you decrease it to 100 days, CloudTrail will remove events with an [eventTime] older than 100 days.\n   \n    "];
  organization_enabled: bool option
    [@ocaml.doc
      "Specifies whether an event data store collects events logged for an organization in Organizations.\n\n  Only the management account for the organization can convert an organization event data store to a non-organization event data store, or convert a non-organization event data store to an organization event data store.\n  \n   "];
  multi_region_enabled: bool option
    [@ocaml.doc
      "Specifies whether an event data store collects events from all Regions, or only from the Region in which it was created.\n"];
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "The advanced event selectors used to select events for the event data store. You can configure up to five advanced event selectors for each event data store.\n"];
  name: string option [@ocaml.doc "The event data store name.\n"];
  event_data_store: string
    [@ocaml.doc
      "The ARN (or the ID suffix of the ARN) of the event data store that you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_insight_selectors_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "For [PutInsightSelectors], this exception is thrown when the formatting or syntax of the [InsightSelectors] JSON statement is not valid, or the specified [InsightType] in the [InsightSelectors] statement is not valid. Valid values for [InsightType] are [ApiCallRateInsight] and [ApiErrorRateInsight]. To enable Insights on an event data store, the destination event data store specified by the [InsightsDestination] parameter must log Insights events and the source event data store specified by the [EventDataStore] parameter must log management events.\n\n For [UpdateEventDataStore], this exception is thrown if Insights are enabled on the event data store and the updated advanced event selectors are not compatible with the configured [InsightSelectors]. If the [InsightSelectors] includes an [InsightType] of [ApiCallRateInsight], the source event data store must log [write] management events. If the [InsightSelectors] includes an [InsightType] of [ApiErrorRateInsight], the source event data store must log management events.\n "]
type nonrec inactive_event_data_store_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "The event data store is inactive.\n"]
type nonrec event_data_store_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "The specified event data store was not found.\n"]
type nonrec event_data_store_has_ongoing_import_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when you try to update or delete an event data store that currently has an import in progress. \n"]
type nonrec event_data_store_arn_invalid_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "The specified event data store ARN is not valid or does not map to an event data store in your account.\n"]
type nonrec event_data_store_already_exists_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "An event data store with that name already exists.\n"]
type nonrec dashboard_type =
  | CUSTOM [@ocaml.doc ""]
  | MANAGED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec refresh_schedule_frequency_unit =
  | DAYS [@ocaml.doc ""]
  | HOURS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec refresh_schedule_frequency =
  {
  value: int option
    [@ocaml.doc
      " The value for the refresh schedule. \n\n  For custom dashboards, the following values are valid when the unit is [HOURS]: [1], [6], [12], [24] \n \n  For custom dashboards, the only valid value when the unit is [DAYS] is [1].\n  \n   For the Highlights dashboard, the [Value] must be [6].\n   "];
  unit_: refresh_schedule_frequency_unit option
    [@ocaml.doc
      " The unit to use for the refresh. \n\n For custom dashboards, the unit can be [HOURS] or [DAYS].\n \n  For the Highlights dashboard, the [Unit] must be [HOURS].\n  "]}
[@@ocaml.doc
  " Specifies the frequency for a dashboard refresh schedule. \n\n  For a custom dashboard, you can schedule a refresh for every 1, 6, 12, or 24 hours, or every day. \n "]
type nonrec refresh_schedule_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec refresh_schedule =
  {
  time_of_day: string option
    [@ocaml.doc
      " The time of day in UTC to run the schedule; for hourly only refer to minutes; default is 00:00. \n"];
  status: refresh_schedule_status option
    [@ocaml.doc
      " Specifies whether the refresh schedule is enabled. Set the value to [ENABLED] to enable the refresh schedule, or to [DISABLED] to turn off the refresh schedule. \n"];
  frequency: refresh_schedule_frequency option
    [@ocaml.doc
      " The frequency at which you want the dashboard refreshed. \n"]}
[@@ocaml.doc " The schedule for a dashboard refresh. \n"]
type nonrec update_dashboard_response =
  {
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The timestamp that shows when the dashboard was updated. \n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The timestamp that shows when the dashboard was created. \n"];
  termination_protection_enabled: bool option
    [@ocaml.doc
      " Indicates whether termination protection is enabled for the dashboard. \n"];
  refresh_schedule: refresh_schedule option
    [@ocaml.doc " The refresh schedule for the dashboard, if configured. \n"];
  widgets: widget list option
    [@ocaml.doc " An array of widgets for the dashboard. \n"];
  type_: dashboard_type option [@ocaml.doc " The type of dashboard. \n"];
  name: string option [@ocaml.doc " The name for the dashboard. \n"];
  dashboard_arn: string option [@ocaml.doc " The ARN for the dashboard. \n"]}
[@@ocaml.doc ""]
type nonrec request_widget =
  {
  view_properties: view_properties_map
    [@ocaml.doc
      " The view properties for the widget. For more information about view properties, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-widget-properties.html} View properties for widgets } in the {i CloudTrail User Guide}. \n"];
  query_parameters: string list option
    [@ocaml.doc
      " The optional query parameters. The following query parameters are valid: [$StartTime$], [$EndTime$], and [$Period$]. \n"];
  query_statement: string
    [@ocaml.doc
      " The query statement for the widget. For custom dashboard widgets, you can query across multiple event data stores as long as all event data stores exist in your account. \n\n  When a query uses [?] with [eventTime], [?] must be surrounded by single quotes as follows: ['?'].\n  \n   "]}
[@@ocaml.doc
  " Contains information about a widget on a CloudTrail Lake dashboard. \n"]
type nonrec update_dashboard_request =
  {
  termination_protection_enabled: bool option
    [@ocaml.doc
      " Specifies whether termination protection is enabled for the dashboard. If termination protection is enabled, you cannot delete the dashboard until termination protection is disabled. \n"];
  refresh_schedule: refresh_schedule option
    [@ocaml.doc " The refresh schedule configuration for the dashboard. \n"];
  widgets: request_widget list option
    [@ocaml.doc
      " An array of widgets for the dashboard. A custom dashboard can have a maximum of 10 widgets. \n\n To add new widgets, pass in an array that includes the existing widgets along with any new widgets. Run the [GetDashboard] operation to get the list of widgets for the dashboard.\n \n  To remove widgets, pass in an array that includes the existing widgets minus the widgets you want removed.\n  "];
  dashboard_id: string [@ocaml.doc " The name or ARN of the dashboard. \n"]}
[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the quota is exceeded. For information about CloudTrail quotas, see {{:https://docs.aws.amazon.com/general/latest/gr/ct.html#limits_cloudtrail}Service quotas} in the {i Amazon Web Services General Reference}. \n"]
type nonrec resource_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified resource is not found.\n"]
type nonrec invalid_query_statement_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "The query that was submitted has validation errors, or uses incorrect syntax or unsupported keywords. For more information about writing a query, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-create-edit-query.html}Create or edit a query} in the {i CloudTrail User Guide}.\n"]
type nonrec destination_type =
  | AWS_SERVICE [@ocaml.doc ""]
  | EVENT_DATA_STORE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec destination =
  {
  location: string
    [@ocaml.doc
      " For channels used for a CloudTrail Lake integration, the location is the ARN of an event data store that receives events from a channel. For service-linked channels, the location is the name of the Amazon Web Services service.\n"];
  type_: destination_type
    [@ocaml.doc
      "The type of destination for events arriving from a channel. For channels used for a CloudTrail Lake integration, the value is [EVENT_DATA_STORE]. For service-linked channels, the value is [AWS_SERVICE]. \n"]}
[@@ocaml.doc
  "Contains information about the destination receiving events.\n"]
type nonrec update_channel_response =
  {
  destinations: destination list option
    [@ocaml.doc
      "The event data stores that log events arriving through the channel.\n"];
  source: string option
    [@ocaml.doc "The event source of the channel that was updated.\n"];
  name: string option
    [@ocaml.doc "The name of the channel that was updated.\n"];
  channel_arn: string option
    [@ocaml.doc "The ARN of the channel that was updated.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec update_channel_request =
  {
  name: string option [@ocaml.doc " Changes the name of the channel. \n"];
  destinations: destination list option
    [@ocaml.doc
      "The ARNs of event data stores that you want to log events arriving through the channel.\n"];
  channel: string
    [@ocaml.doc
      "The ARN or ID (the ARN suffix) of the channel that you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_event_data_store_category_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when event categories of specified event data stores are not valid.\n"]
type nonrec channel_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when CloudTrail cannot find the specified channel.\n"]
type nonrec channel_arn_invalid_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified value of [ChannelARN] is not valid.\n"]
type nonrec channel_already_exists_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the provided channel already exists. \n"]
type nonrec type_ =
  | RequestContext [@ocaml.doc ""]
  | TagContext [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec trail_info =
  {
  home_region: string option
    [@ocaml.doc
      "The Amazon Web Services Region in which a trail was created.\n"];
  name: string option [@ocaml.doc "The name of a trail.\n"];
  trail_ar_n: string option [@ocaml.doc "The ARN of a trail.\n"]}[@@ocaml.doc
                                                                   "Information about a CloudTrail trail, including the trail's name, home Region, and Amazon Resource Name (ARN).\n"]
type nonrec trail =
  {
  is_organization_trail: bool option
    [@ocaml.doc "Specifies whether the trail is an organization trail.\n"];
  has_insight_selectors: bool option
    [@ocaml.doc
      "Specifies whether a trail has insight types specified in an [InsightSelector] list.\n"];
  has_custom_event_selectors: bool option
    [@ocaml.doc "Specifies if the trail has custom event selectors.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID that encrypts the logs delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.\n\n  [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n "];
  cloud_watch_logs_role_arn: string option
    [@ocaml.doc
      "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.\n"];
  cloud_watch_logs_log_group_arn: string option
    [@ocaml.doc
      "Specifies an Amazon Resource Name (ARN), a unique identifier that represents the log group to which CloudTrail logs will be delivered.\n"];
  log_file_validation_enabled: bool option
    [@ocaml.doc "Specifies whether log file validation is enabled.\n"];
  trail_ar_n: string option
    [@ocaml.doc
      "Specifies the ARN of the trail. The following is the format of a trail ARN.\n\n  [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n "];
  home_region: string option
    [@ocaml.doc "The Region in which the trail was created.\n"];
  is_multi_region_trail: bool option
    [@ocaml.doc
      "Specifies whether the trail exists only in one Region or exists in all Regions.\n"];
  include_global_service_events: bool option
    [@ocaml.doc
      "Set to {b True} to include Amazon Web Services API calls from Amazon Web Services global services such as IAM. Otherwise, {b False}.\n"];
  sns_topic_ar_n: string option
    [@ocaml.doc
      "Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files are delivered. The following is the format of a topic ARN.\n\n  [arn:aws:sns:us-east-2:123456789012:MyTopic] \n "];
  sns_topic_name: string option
    [@ocaml.doc "This field is no longer in use. Use [SnsTopicARN].\n"];
  s3_key_prefix: string option
    [@ocaml.doc
      "Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}. The maximum length is 200 characters.\n"];
  s3_bucket_name: string option
    [@ocaml.doc
      "Name of the Amazon S3 bucket into which CloudTrail delivers your trail files. See {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Amazon S3 Bucket naming rules}.\n"];
  name: string option
    [@ocaml.doc
      "Name of the trail set by calling [CreateTrail]. The maximum length is 128 characters.\n"]}
[@@ocaml.doc "The settings for a trail.\n"]
type nonrec trail_already_exists_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified trail already exists.\n"]
type nonrec tag =
  {
  value: string option
    [@ocaml.doc
      "The value in a key-value pair of a tag. The value must be no longer than 256 Unicode characters.\n"];
  key: string
    [@ocaml.doc
      "The key in a key-value pair. The key must be must be no longer than 128 Unicode characters. The key must be unique for the resource to which it applies.\n"]}
[@@ocaml.doc
  "A custom key-value pair associated with a resource such as a CloudTrail trail, event data store, dashboard, or channel.\n"]
type nonrec tags_limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "The number of tags per trail, event data store, dashboard, or channel has exceeded the permitted amount. Currently, the limit is 50.\n"]
type nonrec stop_logging_request =
  {
  name: string
    [@ocaml.doc
      "Specifies the name or the CloudTrail ARN of the trail for which CloudTrail will stop logging Amazon Web Services API calls. The following is the format of a trail ARN.\n\n  [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n "]}
[@@ocaml.doc
  "Passes the request to CloudTrail to stop logging Amazon Web Services API calls for the specified account.\n"]
type nonrec s3_import_source =
  {
  s3_bucket_access_role_arn: string
    [@ocaml.doc " The IAM ARN role used to access the source S3 bucket. \n"];
  s3_bucket_region: string
    [@ocaml.doc " The Region associated with the source S3 bucket. \n"];
  s3_location_uri: string
    [@ocaml.doc " The URI for the source S3 bucket. \n"]}[@@ocaml.doc
                                                           " The settings for the source S3 bucket. \n"]
type nonrec import_source =
  {
  s3: s3_import_source [@ocaml.doc " The source S3 bucket. \n"]}[@@ocaml.doc
                                                                  " The import source. \n"]
type nonrec import_status =
  | COMPLETED [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | INITIALIZING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec import_statistics =
  {
  failed_entries: int option [@ocaml.doc " The number of failed entries. \n"];
  events_completed: int option
    [@ocaml.doc
      " The number of trail events imported into the event data store. \n"];
  files_completed: int option
    [@ocaml.doc "The number of log files that completed import.\n"];
  prefixes_completed: int option
    [@ocaml.doc " The number of S3 prefixes that completed import. \n"];
  prefixes_found: int option
    [@ocaml.doc " The number of S3 prefixes found for the import. \n"]}
[@@ocaml.doc
  " Provides statistics for the specified [ImportID]. CloudTrail does not update import statistics in real-time. Returned values for parameters such as [EventsCompleted] may be lower than the actual value, because CloudTrail updates statistics incrementally over the course of the import. \n"]
type nonrec stop_import_response =
  {
  import_statistics: import_statistics option
    [@ocaml.doc " Returns information on the stopped import. \n"];
  end_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Used with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. \n"];
  start_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Used with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. \n"];
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc " The timestamp of the import's last update. \n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc " The timestamp of the import's creation. \n"];
  import_status: import_status option
    [@ocaml.doc " The status of the import. \n"];
  destinations: string list option
    [@ocaml.doc " The ARN of the destination event data store. \n"];
  import_source: import_source option
    [@ocaml.doc " The source S3 bucket for the import. \n"];
  import_id: string option [@ocaml.doc " The ID for the import. \n"]}
[@@ocaml.doc ""]
type nonrec stop_import_request =
  {
  import_id: string [@ocaml.doc " The ID of the import. \n"]}[@@ocaml.doc ""]
type nonrec import_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc " The specified import was not found. \n"]
type nonrec stop_event_data_store_ingestion_request =
  {
  event_data_store: string
    [@ocaml.doc
      "The ARN (or ID suffix of the ARN) of the event data store for which you want to stop ingestion.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_event_data_store_status_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "The event data store is not in a status that supports the operation.\n"]
type nonrec start_query_response =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  query_id: string option [@ocaml.doc "The ID of the started query.\n"]}
[@@ocaml.doc ""]
type nonrec start_query_request =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  query_parameters: string list option
    [@ocaml.doc " The query parameters for the specified [QueryAlias]. \n"];
  query_alias: string option
    [@ocaml.doc " The alias that identifies a query template. \n"];
  delivery_s3_uri: string option
    [@ocaml.doc
      " The URI for the S3 bucket where CloudTrail delivers the query results. \n"];
  query_statement: string option [@ocaml.doc "The SQL code of your query.\n"]}
[@@ocaml.doc ""]
type nonrec max_concurrent_queries_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "You are already running the maximum number of concurrent queries. The maximum number of concurrent queries is 10. Wait a minute for some queries to finish, and then run the query again.\n"]
type nonrec start_logging_request =
  {
  name: string
    [@ocaml.doc
      "Specifies the name or the CloudTrail ARN of the trail for which CloudTrail logs Amazon Web Services API calls. The following is the format of a trail ARN.\n\n  [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n "]}
[@@ocaml.doc
  "The request to CloudTrail to start logging Amazon Web Services API calls for an account.\n"]
type nonrec start_import_response =
  {
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The timestamp of the import's last update, if applicable. \n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc " The timestamp for the import's creation. \n"];
  import_status: import_status option
    [@ocaml.doc
      " Shows the status of the import after a [StartImport] request. An import finishes with a status of [COMPLETED] if there were no failures, or [FAILED] if there were failures. \n"];
  end_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Used with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. \n"];
  start_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Used with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. \n"];
  import_source: import_source option
    [@ocaml.doc " The source S3 bucket for the import. \n"];
  destinations: string list option
    [@ocaml.doc " The ARN of the destination event data store. \n"];
  import_id: string option [@ocaml.doc " The ID of the import. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec start_import_request =
  {
  import_id: string option
    [@ocaml.doc
      " The ID of the import. Use this parameter when you are retrying an import. \n"];
  end_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Use with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. When you specify a time range, CloudTrail checks the prefix and log file names to verify the names contain a date between the specified [StartEventTime] and [EndEventTime] before attempting to import events. \n"];
  start_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Use with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. When you specify a time range, CloudTrail checks the prefix and log file names to verify the names contain a date between the specified [StartEventTime] and [EndEventTime] before attempting to import events. \n"];
  import_source: import_source option
    [@ocaml.doc
      " The source S3 bucket for the import. Use this parameter for a new import. \n"];
  destinations: string list option
    [@ocaml.doc
      " The ARN of the destination event data store. Use this parameter for a new import. \n"]}
[@@ocaml.doc ""]
type nonrec invalid_import_source_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the provided source S3 bucket is not valid for import. \n"]
type nonrec account_has_ongoing_import_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when you start a new import and a previous import is still in progress. \n"]
type nonrec start_event_data_store_ingestion_request =
  {
  event_data_store: string
    [@ocaml.doc
      "The ARN (or ID suffix of the ARN) of the event data store for which you want to start ingestion.\n"]}
[@@ocaml.doc ""]
type nonrec start_dashboard_refresh_response =
  {
  refresh_id: string option
    [@ocaml.doc " The refresh ID for the dashboard. \n"]}[@@ocaml.doc ""]
type nonrec query_parameter_values = (string * string) list[@@ocaml.doc ""]
type nonrec start_dashboard_refresh_request =
  {
  query_parameter_values: query_parameter_values option
    [@ocaml.doc
      " The query parameter values for the dashboard \n\n For custom dashboards, the following query parameters are valid: [$StartTime$], [$EndTime$], and [$Period$].\n \n  For managed dashboards, the following query parameters are valid: [$StartTime$], [$EndTime$], [$Period$], and [$EventDataStoreId$]. The [$EventDataStoreId$] query parameter is required.\n  "];
  dashboard_id: string [@ocaml.doc " The name or ARN of the dashboard. \n"]}
[@@ocaml.doc ""]
type nonrec source_config =
  {
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      " The advanced event selectors that are configured for the channel.\n"];
  apply_to_all_regions: bool option
    [@ocaml.doc
      " Specifies whether the channel applies to a single Region or to all Regions.\n"]}
[@@ocaml.doc " Contains configuration information about the channel. \n"]
type nonrec search_sample_queries_search_result =
  {
  relevance: float option
    [@ocaml.doc
      " A value between 0 and 1 indicating the similarity between the search phrase and result. \n"];
  sq_l: string option [@ocaml.doc " The SQL code of the sample query. \n"];
  description: string option
    [@ocaml.doc " A longer description of a sample query. \n"];
  name: string option [@ocaml.doc " The name of a sample query. \n"]}
[@@ocaml.doc
  " A search result returned by the [SearchSampleQueries] operation. \n"]
type nonrec search_sample_queries_response =
  {
  next_token: string option
    [@ocaml.doc " A token you can use to get the next page of results.\n"];
  search_results: search_sample_queries_search_result list option
    [@ocaml.doc
      " A list of objects containing the search results ordered from most relevant to least relevant. \n"]}
[@@ocaml.doc ""]
type nonrec search_sample_queries_request =
  {
  next_token: string option
    [@ocaml.doc
      " A token you can use to get the next page of results. The length constraint is in characters, not words. \n"];
  max_results: int option
    [@ocaml.doc
      " The maximum number of results to return on a single page. The default value is 10. \n"];
  search_phrase: string
    [@ocaml.doc
      " The natural language phrase to use for the semantic search. The phrase must be in English. The length constraint is in characters, not words.\n"]}
[@@ocaml.doc ""]
type nonrec restore_event_data_store_response =
  {
  billing_mode: billing_mode option
    [@ocaml.doc "The billing mode for the event data store.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.\n\n  [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n "];
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp that shows when an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].\n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of an event data store's creation.\n"];
  termination_protection_enabled: bool option
    [@ocaml.doc
      "Indicates that termination protection is enabled and the event data store cannot be automatically deleted.\n"];
  retention_period: int option
    [@ocaml.doc "The retention period, in days.\n"];
  organization_enabled: bool option
    [@ocaml.doc
      "Indicates whether an event data store is collecting logged events for an organization in Organizations.\n"];
  multi_region_enabled: bool option
    [@ocaml.doc
      "Indicates whether the event data store is collecting events from all Regions, or only from the Region in which the event data store was created.\n"];
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "The advanced event selectors that were used to select events.\n"];
  status: event_data_store_status option
    [@ocaml.doc "The status of the event data store.\n"];
  name: string option [@ocaml.doc "The name of the event data store.\n"];
  event_data_store_arn: string option
    [@ocaml.doc "The event data store ARN.\n"]}[@@ocaml.doc ""]
type nonrec restore_event_data_store_request =
  {
  event_data_store: string
    [@ocaml.doc
      "The ARN (or the ID suffix of the ARN) of the event data store that you want to restore.\n"]}
[@@ocaml.doc ""]
type nonrec event_data_store_max_limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "Your account has used the maximum number of event data stores.\n"]
type nonrec resource_type_not_supported_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified resource type is not supported by CloudTrail.\n"]
type nonrec resource_tag =
  {
  tags_list: tag list option [@ocaml.doc "A list of tags.\n"];
  resource_id: string option
    [@ocaml.doc "Specifies the ARN of the resource.\n"]}[@@ocaml.doc
                                                          "A resource tag.\n"]
type nonrec resource_policy_not_valid_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the resouce-based policy has syntax errors, or contains a principal that is not valid. \n"]
type nonrec resource_policy_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the specified resource policy is not found. \n"]
type nonrec resource =
  {
  resource_name: string option
    [@ocaml.doc
      "The name of the resource referenced by the event returned. These are user-created names whose values will depend on the environment. For example, the resource name might be \"auto-scaling-test-group\" for an Auto Scaling Group or \"i-1234567\" for an EC2 Instance.\n"];
  resource_type: string option
    [@ocaml.doc
      "The type of a resource referenced by the event returned. When the resource type cannot be determined, null is returned. Some examples of resource types are: {b Instance} for EC2, {b Trail} for CloudTrail, {b DBInstance} for Amazon RDS, and {b AccessKey} for IAM. To learn more about how to look up and filter events by the resource types supported for a service, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/view-cloudtrail-events-console.html#filtering-cloudtrail-events}Filtering CloudTrail Events}.\n"]}
[@@ocaml.doc
  "Specifies the type and name of a resource referenced by an event.\n"]
type nonrec resource_arn_not_valid_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the provided resource does not exist, or the ARN format of the resource is not valid. \n\n The following is the format of an event data store ARN: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n \n  The following is the format of a dashboard ARN: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n  \n   The following is the format of a channel ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n   "]
type nonrec remove_tags_request =
  {
  tags_list: tag list
    [@ocaml.doc "Specifies a list of tags to be removed.\n"];
  resource_id: string
    [@ocaml.doc
      "Specifies the ARN of the trail, event data store, dashboard, or channel from which tags should be removed.\n\n  Example trail ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n \n  Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n  \n   Example dashboard ARN format: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n   \n    Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n    "]}
[@@ocaml.doc
  "Specifies the tags to remove from a trail, event data store, dashboard, or channel.\n"]
type nonrec invalid_tag_parameter_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified tag key or values are not valid. It can also occur if there are duplicate tags or too many tags on the resource.\n"]
type nonrec register_organization_delegated_admin_request =
  {
  member_account_id: string
    [@ocaml.doc
      "An organization member account ID that you want to designate as a delegated administrator.\n"]}
[@@ocaml.doc
  "Specifies an organization member account ID as a CloudTrail delegated administrator.\n"]
type nonrec not_organization_management_account_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the account making the request is not the organization's management account. \n"]
type nonrec insufficient_iam_access_permission_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "The task can't be completed because you are signed in with an account that lacks permissions to view or create a service-linked role. Sign in with an account that has the required permissions and then try again.\n"]
type nonrec delegated_admin_account_limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the maximum number of CloudTrail delegated administrators is reached.\n"]
type nonrec cannot_delegate_management_account_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the management account of an organization is registered as the CloudTrail delegated administrator.\n"]
type nonrec account_registered_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the account is already registered as the CloudTrail delegated administrator.\n"]
type nonrec account_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified account is not found or not part of an organization.\n"]
type nonrec read_write_type =
  | All [@ocaml.doc ""]
  | WriteOnly [@ocaml.doc ""]
  | ReadOnly [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec query_status =
  | TIMED_OUT [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | FINISHED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec query_statistics_for_describe_query =
  {
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation time of the query.\n"];
  execution_time_in_millis: int option
    [@ocaml.doc "The query's run time, in milliseconds.\n"];
  bytes_scanned: int option
    [@ocaml.doc
      "The total bytes that the query scanned in the event data store. This value matches the number of bytes for which your account is billed for the query, unless the query is still running.\n"];
  events_scanned: int option
    [@ocaml.doc
      "The number of events that the query scanned in the event data store.\n"];
  events_matched: int option
    [@ocaml.doc "The number of events that matched a query.\n"]}[@@ocaml.doc
                                                                  "Gets metadata about a query, including the number of events that were matched, the total number of events scanned, the query run time in milliseconds, and the query's creation time.\n"]
type nonrec query_statistics =
  {
  bytes_scanned: int option
    [@ocaml.doc
      "The total bytes that the query scanned in the event data store. This value matches the number of bytes for which your account is billed for the query, unless the query is still running.\n"];
  total_results_count: int option
    [@ocaml.doc "The total number of results returned by a query.\n"];
  results_count: int option [@ocaml.doc "The number of results returned.\n"]}
[@@ocaml.doc "Metadata about a query, such as the number of results.\n"]
type nonrec query_result_column = (string * string) list[@@ocaml.doc ""]
type nonrec query_id_not_found_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "The query ID does not exist or does not map to a query.\n"]
type nonrec query =
  {
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The creation time of a query.\n"];
  query_status: query_status option
    [@ocaml.doc
      "The status of the query. This can be [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].\n"];
  query_id: string option [@ocaml.doc "The ID of a query.\n"]}[@@ocaml.doc
                                                                "A SQL string of criteria about events that you want to collect in an event data store.\n"]
type nonrec put_resource_policy_response =
  {
  delegated_admin_resource_policy: string option
    [@ocaml.doc
      " The default resource-based policy that is automatically generated for the delegated administrator of an Organizations organization. This policy will be evaluated in tandem with any policy you submit for the resource. For more information about this policy, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-organizations.html#cloudtrail-lake-organizations-eds-rbp}Default resource policy for delegated administrators}. \n"];
  resource_policy: string option
    [@ocaml.doc
      " The JSON-formatted string of the Amazon Web Services resource-based policy attached to the CloudTrail event data store, dashboard, or channel. \n"];
  resource_arn: string option
    [@ocaml.doc
      " The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to the resource-based policy. \n\n Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n \n  Example dashboard ARN format: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n  \n   Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n   "]}
[@@ocaml.doc ""]
type nonrec put_resource_policy_request =
  {
  resource_policy: string
    [@ocaml.doc
      " A JSON-formatted string for an Amazon Web Services resource-based policy. \n\n  For example resource-based policies, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html}CloudTrail resource-based policy examples} in the {i CloudTrail User Guide}.\n "];
  resource_arn: string
    [@ocaml.doc
      " The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to the resource-based policy.\n\n Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n \n  Example dashboard ARN format: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n  \n   Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n   "]}
[@@ocaml.doc ""]
type nonrec insight_type =
  | ApiErrorRateInsight [@ocaml.doc ""]
  | ApiCallRateInsight [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec insight_selector =
  {
  insight_type: insight_type option
    [@ocaml.doc
      "The type of Insights events to log on a trail or event data store. [ApiCallRateInsight] and [ApiErrorRateInsight] are valid Insight types.\n\n The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume.\n \n  The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes. The error is shown if the API call is unsuccessful.\n  "]}
[@@ocaml.doc
  "A JSON string that contains a list of Insights types that are logged on a trail or event data store.\n"]
type nonrec put_insight_selectors_response =
  {
  insights_destination: string option
    [@ocaml.doc
      " The ARN of the destination event data store that logs Insights events. \n"];
  event_data_store_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the source event data store for which you want to change or add Insights selectors.\n"];
  insight_selectors: insight_selector list option
    [@ocaml.doc
      "A JSON string that contains the Insights event types that you want to log on a trail or event data store. The valid Insights types are [ApiErrorRateInsight] and [ApiCallRateInsight].\n"];
  trail_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a trail for which you want to change or add Insights selectors.\n"]}
[@@ocaml.doc ""]
type nonrec put_insight_selectors_request =
  {
  insights_destination: string option
    [@ocaml.doc
      " The ARN (or ID suffix of the ARN) of the destination event data store that logs Insights events. To enable Insights on an event data store, you must provide both the [EventDataStore] and [InsightsDestination] parameters. \n\n You cannot use this parameter with the [TrailName] parameter.\n "];
  event_data_store: string option
    [@ocaml.doc
      "The ARN (or ID suffix of the ARN) of the source event data store for which you want to change or add Insights selectors. To enable Insights on an event data store, you must provide both the [EventDataStore] and [InsightsDestination] parameters.\n\n You cannot use this parameter with the [TrailName] parameter.\n "];
  insight_selectors: insight_selector list
    [@ocaml.doc
      "A JSON string that contains the Insights types you want to log on a trail or event data store. [ApiCallRateInsight] and [ApiErrorRateInsight] are valid Insight types.\n\n The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume.\n \n  The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes. The error is shown if the API call is unsuccessful.\n  "];
  trail_name: string option
    [@ocaml.doc
      "The name of the CloudTrail trail for which you want to change or add Insights selectors.\n\n You cannot use this parameter with the [EventDataStore] and [InsightsDestination] parameters.\n "]}
[@@ocaml.doc ""]
type nonrec data_resource =
  {
  values: string list option
    [@ocaml.doc
      "An array of Amazon Resource Name (ARN) strings or partial ARN strings for the specified resource type.\n\n {ul\n       {-  To log data events for all objects in all S3 buckets in your Amazon Web Services account, specify the prefix as [arn:aws:s3].\n           \n             This also enables logging of data event activity performed by any user or role in your Amazon Web Services account, even if that activity is performed on a bucket that belongs to another Amazon Web Services account.\n             \n               }\n       {-  To log data events for all objects in an S3 bucket, specify the bucket and an empty object prefix such as [arn:aws:s3:::amzn-s3-demo-bucket1/]. The trail logs data events for all objects in this S3 bucket.\n           \n            }\n       {-  To log data events for specific objects, specify the S3 bucket and object prefix such as [arn:aws:s3:::amzn-s3-demo-bucket1/example-images]. The trail logs data events for objects in this S3 bucket that match the prefix.\n           \n            }\n       {-  To log data events for all Lambda functions in your Amazon Web Services account, specify the prefix as [arn:aws:lambda].\n           \n             This also enables logging of [Invoke] activity performed by any user or role in your Amazon Web Services account, even if that activity is performed on a function that belongs to another Amazon Web Services account. \n             \n               }\n       {-  To log data events for a specific Lambda function, specify the function ARN.\n           \n             Lambda function ARNs are exact. For example, if you specify a function ARN {i arn:aws:lambda:us-west-2:111111111111:function:helloworld}, data events will only be logged for {i arn:aws:lambda:us-west-2:111111111111:function:helloworld}. They will not be logged for {i arn:aws:lambda:us-west-2:111111111111:function:helloworld2}.\n             \n               }\n       {-  To log data events for all DynamoDB tables in your Amazon Web Services account, specify the prefix as [arn:aws:dynamodb].\n           \n            }\n       }\n  "];
  type_: string option
    [@ocaml.doc
      "The resource type in which you want to log data events. You can specify the following {i basic} event selector resource types:\n\n {ul\n       {-   [AWS::DynamoDB::Table] \n           \n            }\n       {-   [AWS::Lambda::Function] \n           \n            }\n       {-   [AWS::S3::Object] \n           \n            }\n       }\n   Additional resource types are available through {i advanced} event selectors. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelector}.\n   "]}
[@@ocaml.doc
  "You can configure the [DataResource] in an [EventSelector] to log data events for the following three resource types:\n\n {ul\n       {-   [AWS::DynamoDB::Table] \n           \n            }\n       {-   [AWS::Lambda::Function] \n           \n            }\n       {-   [AWS::S3::Object] \n           \n            }\n       }\n   To log data events for all other resource types including objects stored in {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html}directory buckets}, you must use {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelectors}. You must also use [AdvancedEventSelectors] if you want to filter on the [eventName] field.\n   \n    Configure the [DataResource] to specify the resource type and resource ARNs for which you want to log data events.\n    \n      The total number of allowed data resources is 250. This number can be distributed between 1 and 5 event selectors, but the total cannot exceed 250 across all selectors for the trail.\n      \n        The following example demonstrates how logging works when you configure logging of all data events for a general purpose bucket named [amzn-s3-demo-bucket1]. In this example, the CloudTrail user specified an empty prefix, and the option to log both [Read] and [Write] data events.\n        \n         {ol\n               {-  A user uploads an image file to [amzn-s3-demo-bucket1].\n                   \n                    }\n               {-  The [PutObject] API operation is an Amazon S3 object-level API. It is recorded as a data event in CloudTrail. Because the CloudTrail user specified an S3 bucket with an empty prefix, events that occur on any object in that bucket are logged. The trail processes and logs the event.\n                   \n                    }\n               {-  A user uploads an object to an Amazon S3 bucket named [arn:aws:s3:::amzn-s3-demo-bucket1].\n                   \n                    }\n               {-  The [PutObject] API operation occurred for an object in an S3 bucket that the CloudTrail user didn't specify for the trail. The trail doesn\226\128\153t log the event.\n                   \n                    }\n               }\n   The following example demonstrates how logging works when you configure logging of Lambda data events for a Lambda function named {i MyLambdaFunction}, but not for all Lambda functions.\n   \n    {ol\n          {-  A user runs a script that includes a call to the {i MyLambdaFunction} function and the {i MyOtherLambdaFunction} function.\n              \n               }\n          {-  The [Invoke] API operation on {i MyLambdaFunction} is an Lambda API. It is recorded as a data event in CloudTrail. Because the CloudTrail user specified logging data events for {i MyLambdaFunction}, any invocations of that function are logged. The trail processes and logs the event.\n              \n               }\n          {-  The [Invoke] API operation on {i MyOtherLambdaFunction} is an Lambda API. Because the CloudTrail user did not specify logging data events for all Lambda functions, the [Invoke] operation for {i MyOtherLambdaFunction} does not match the function specified for the trail. The trail doesn\226\128\153t log the event. \n              \n               }\n          }\n  "]
type nonrec event_selector =
  {
  exclude_management_event_sources: string list option
    [@ocaml.doc
      "An optional list of service event sources from which you do not want management events to be logged on your trail. In this release, the list can be empty (disables the filter), or it can filter out Key Management Service or Amazon RDS Data API events by containing [kms.amazonaws.com] or [rdsdata.amazonaws.com]. By default, [ExcludeManagementEventSources] is empty, and KMS and Amazon RDS Data API events are logged to your trail. You can exclude management event sources only in Regions that support the event source.\n"];
  data_resources: data_resource list option
    [@ocaml.doc
      "CloudTrail supports data event logging for Amazon S3 objects in standard S3 buckets, Lambda functions, and Amazon DynamoDB tables with basic event selectors. You can specify up to 250 resources for an individual event selector, but the total number of data resources cannot exceed 250 across all event selectors in a trail. This limit does not apply if you configure resource logging for all data events.\n\n For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Data Events} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html}Limits in CloudTrail} in the {i CloudTrail User Guide}.\n \n   To log data events for all other resource types including objects stored in {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html}directory buckets}, you must use {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelectors}. You must also use [AdvancedEventSelectors] if you want to filter on the [eventName] field.\n   \n    "];
  include_management_events: bool option
    [@ocaml.doc
      "Specify if you want your event selector to include management events for your trail.\n\n  For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Management Events} in the {i CloudTrail User Guide}.\n \n  By default, the value is [true].\n  \n   The first copy of management events is free. You are charged for additional copies of management events that you are logging on any subsequent trail in the same Region. For more information about CloudTrail pricing, see {{:http://aws.amazon.com/cloudtrail/pricing/}CloudTrail Pricing}.\n   "];
  read_write_type: read_write_type option
    [@ocaml.doc
      "Specify if you want your trail to log read-only events, write-only events, or all. For example, the EC2 [GetConsoleOutput] is a read-only API operation and [RunInstances] is a write-only API operation.\n\n  By default, the value is [All].\n "]}
[@@ocaml.doc
  "Use event selectors to further specify the management and data event settings for your trail. By default, trails created without specific event selectors will be configured to log all read and write management events, and no data events. When an event occurs in your account, CloudTrail evaluates the event selector for all trails. For each trail, if the event matches any event selector, the trail processes and logs the event. If the event doesn't match any event selector, the trail doesn't log the event.\n\n You can configure up to five event selectors for a trail.\n \n  You cannot apply both event selectors and advanced event selectors to a trail.\n  "]
type nonrec put_event_selectors_response =
  {
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "Specifies the advanced event selectors configured for your trail.\n"];
  event_selectors: event_selector list option
    [@ocaml.doc "Specifies the event selectors configured for your trail.\n"];
  trail_ar_n: string option
    [@ocaml.doc
      "Specifies the ARN of the trail that was updated with event selectors. The following is the format of a trail ARN.\n\n  [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n "]}
[@@ocaml.doc ""]
type nonrec put_event_selectors_request =
  {
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      " Specifies the settings for advanced event selectors. You can use advanced event selectors to log management events, data events for all resource types, and network activity events.\n\n You can add advanced event selectors, and conditions for your advanced event selectors, up to a maximum of 500 values for all conditions and selectors on a trail. You can use either [AdvancedEventSelectors] or [EventSelectors], but not both. If you apply [AdvancedEventSelectors] to a trail, any existing [EventSelectors] are overwritten. For more information about advanced event selectors, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-network-events-with-cloudtrail.html}Logging network activity events} in the {i CloudTrail User Guide}. \n "];
  event_selectors: event_selector list option
    [@ocaml.doc
      "Specifies the settings for your event selectors. You can use event selectors to log management events and data events for the following resource types:\n\n {ul\n       {-   [AWS::DynamoDB::Table] \n           \n            }\n       {-   [AWS::Lambda::Function] \n           \n            }\n       {-   [AWS::S3::Object] \n           \n            }\n       }\n   You can't use event selectors to log network activity events.\n   \n    You can configure up to five event selectors for a trail. You can use either [EventSelectors] or [AdvancedEventSelectors] in a [PutEventSelectors] request, but not both. If you apply [EventSelectors] to a trail, any existing [AdvancedEventSelectors] are overwritten.\n    "];
  trail_name: string
    [@ocaml.doc
      "Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the following requirements:\n\n {ul\n       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)\n           \n            }\n       {-  Start with a letter or number, and end with a letter or number\n           \n            }\n       {-  Be between 3 and 128 characters\n           \n            }\n       {-  Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.\n           \n            }\n       {-  Not be in IP address format (for example, 192.168.5.4)\n           \n            }\n       }\n   If you specify a trail ARN, it must be in the following format.\n   \n     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n    "]}
[@@ocaml.doc ""]
type nonrec max_event_size =
  | Large [@ocaml.doc ""]
  | Standard [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec context_key_selector =
  {
  equals: string list
    [@ocaml.doc
      "A list of keys defined by Type to be included in CloudTrail enriched events. \n"];
  type_: type_
    [@ocaml.doc
      "Specifies the type of the event record field in ContextKeySelector. Valid values include RequestContext, TagContext.\n"]}
[@@ocaml.doc
  "An object that contains information types to be included in CloudTrail enriched events.\n"]
type nonrec put_event_configuration_response =
  {
  context_key_selectors: context_key_selector list option
    [@ocaml.doc
      "The list of context key selectors that are configured for the event data store.\n"];
  max_event_size: max_event_size option
    [@ocaml.doc
      "The maximum allowed size for events stored in the specified event data store.\n"];
  event_data_store_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which the event configuration settings were updated.\n"]}
[@@ocaml.doc ""]
type nonrec put_event_configuration_request =
  {
  context_key_selectors: context_key_selector list
    [@ocaml.doc
      "A list of context key selectors that will be included to provide enriched event data.\n"];
  max_event_size: max_event_size
    [@ocaml.doc
      "The maximum allowed size for events to be stored in the specified event data store. If you are using context key selectors, MaxEventSize must be set to Large.\n"];
  event_data_store: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which you want to update event configuration settings.\n"]}
[@@ocaml.doc ""]
type nonrec public_key =
  {
  fingerprint: string option
    [@ocaml.doc "The fingerprint of the public key.\n"];
  validity_end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The ending time of validity of the public key.\n"];
  validity_start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The starting time of validity of the public key.\n"];
  value: bytes option
    [@ocaml.doc "The DER encoded public key value in PKCS#1 format.\n"]}
[@@ocaml.doc "Contains information about a returned public key.\n"]
type nonrec partition_key =
  {
  type_: string
    [@ocaml.doc
      "The data type of the partition key. For example, [bigint] or [string].\n"];
  name: string [@ocaml.doc "The name of the partition key.\n"]}[@@ocaml.doc
                                                                 "Contains information about a partition key for an event data store.\n"]
type nonrec maximum_number_of_trails_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the maximum number of trails is reached.\n"]
type nonrec event =
  {
  cloud_trail_event: string option
    [@ocaml.doc
      "A JSON string that contains a representation of the event returned.\n"];
  resources: resource list option
    [@ocaml.doc "A list of resources referenced by the event returned.\n"];
  username: string option
    [@ocaml.doc
      "A user name or role name of the requester that called the API in the event returned.\n"];
  event_source: string option
    [@ocaml.doc
      "The Amazon Web Services service to which the request was made.\n"];
  event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time of the event returned.\n"];
  access_key_id: string option
    [@ocaml.doc
      "The Amazon Web Services access key ID that was used to sign the request. If the request was made with temporary security credentials, this is the access key ID of the temporary credentials.\n"];
  read_only: string option
    [@ocaml.doc
      "Information about whether the event is a write event or a read event. \n"];
  event_name: string option [@ocaml.doc "The name of the event returned.\n"];
  event_id: string option
    [@ocaml.doc "The CloudTrail ID of the event returned.\n"]}[@@ocaml.doc
                                                                "Contains information about an event that was returned by a lookup request. The result includes a representation of a CloudTrail event.\n"]
type nonrec lookup_events_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to get the next page of results after a previous API call. If the token does not appear, there are no more results to return. The token must be passed in with the same parameters as the previous call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.\n"];
  events: event list option
    [@ocaml.doc
      "A list of events returned based on the lookup attributes specified and the CloudTrail event. The events list is sorted by time. The most recent event is listed first.\n"]}
[@@ocaml.doc "Contains a response to a LookupEvents action.\n"]
type nonrec lookup_attribute_key =
  | ACCESS_KEY_ID [@ocaml.doc ""]
  | EVENT_SOURCE [@ocaml.doc ""]
  | RESOURCE_NAME [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""]
  | USERNAME [@ocaml.doc ""]
  | READ_ONLY [@ocaml.doc ""]
  | EVENT_NAME [@ocaml.doc ""]
  | EVENT_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec lookup_attribute =
  {
  attribute_value: string
    [@ocaml.doc
      "Specifies a value for the specified [AttributeKey].\n\n The maximum length for the [AttributeValue] is 2000 characters. The following characters ('[_]', '[ ]', '[,]', '[\\\\n]') count as two characters towards the 2000 character limit.\n "];
  attribute_key: lookup_attribute_key
    [@ocaml.doc
      "Specifies an attribute on which to filter the events returned.\n"]}
[@@ocaml.doc
  "Specifies an attribute and value that filter the events returned.\n"]
type nonrec event_category =
  | Insight [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec lookup_events_request =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to get the next page of results after a previous API call. This token must be passed in with the same parameters that were specified in the original call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.\n"];
  max_results: int option
    [@ocaml.doc
      "The number of events to return. Possible values are 1 through 50. The default is 50.\n"];
  event_category: event_category option
    [@ocaml.doc
      "Specifies the event category. If you do not specify an event category, events of the category are not returned in the response. For example, if you do not specify [insight] as the value of [EventCategory], no Insights events are returned.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies that only events that occur before or at the specified time are returned. If the specified end time is before the specified start time, an error is returned.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies that only events that occur after or at the specified time are returned. If the specified start time is after the specified end time, an error is returned.\n"];
  lookup_attributes: lookup_attribute list option
    [@ocaml.doc
      "Contains a list of lookup attributes. Currently the list can contain only one item.\n"]}
[@@ocaml.doc "Contains a request for LookupEvents.\n"]
type nonrec invalid_time_range_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "Occurs if the timestamp values are not valid. Either the start time occurs after the end time, or the time range is outside the range of possible values.\n"]
type nonrec invalid_next_token_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "A token that is not valid, or a token that was previously used in a request with different parameters. This exception is thrown if the token is not valid.\n"]
type nonrec invalid_max_results_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown if the limit specified is not valid.\n"]
type nonrec invalid_lookup_attributes_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "Occurs when a lookup attribute is specified that is not valid.\n"]
type nonrec invalid_event_category_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "Occurs if an event category that is not valid is specified as a value of [EventCategory].\n"]
type nonrec list_trails_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to get the next page of results after a previous API call. If the token does not appear, there are no more results to return. The token must be passed in with the same parameters as the previous call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.\n"];
  trails: trail_info list option
    [@ocaml.doc
      "Returns the name, ARN, and home Region of trails in the current account.\n"]}
[@@ocaml.doc ""]
type nonrec list_trails_request =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to get the next page of results after a previous API call. This token must be passed in with the same parameters that were specified in the original call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_response =
  {
  next_token: string option [@ocaml.doc "Reserved for future use.\n"];
  resource_tag_list: resource_tag list option
    [@ocaml.doc "A list of resource tags.\n"]}[@@ocaml.doc
                                                "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec list_tags_request =
  {
  next_token: string option [@ocaml.doc "Reserved for future use.\n"];
  resource_id_list: string list
    [@ocaml.doc
      "Specifies a list of trail, event data store, dashboard, or channel ARNs whose tags will be listed. The list has a limit of 20 ARNs.\n\n  Example trail ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n \n  Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n  \n   Example dashboard ARN format: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n   \n    Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n    "]}
[@@ocaml.doc "Specifies a list of tags to return.\n"]
type nonrec invalid_token_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "Reserved for future use.\n"]
type nonrec list_queries_response =
  {
  next_token: string option
    [@ocaml.doc "A token you can use to get the next page of results.\n"];
  queries: query list option
    [@ocaml.doc
      "Lists matching query results, and shows query ID, status, and creation time of each query.\n"]}
[@@ocaml.doc ""]
type nonrec list_queries_request =
  {
  query_status: query_status option
    [@ocaml.doc
      "The status of queries that you want to return in results. Valid values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Use with [StartTime] to bound a [ListQueries] request, and limit its results to only those queries run within a specified time period.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Use with [EndTime] to bound a [ListQueries] request, and limit its results to only those queries run within a specified time period.\n"];
  max_results: int option
    [@ocaml.doc "The maximum number of queries to show on a page.\n"];
  next_token: string option
    [@ocaml.doc "A token you can use to get the next page of results.\n"];
  event_data_store: string
    [@ocaml.doc
      "The ARN (or the ID suffix of the ARN) of an event data store on which queries were run.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_query_status_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc "The query status is not valid for the operation.\n"]
type nonrec invalid_date_range_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "A date range for the query was specified that is not valid. Be sure that the start time is chronologically before the end time. For more information about writing a query, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-create-edit-query.html}Create or edit a query} in the {i CloudTrail User Guide}.\n"]
type nonrec list_public_keys_response =
  {
  next_token: string option [@ocaml.doc "Reserved for future use.\n"];
  public_key_list: public_key list option
    [@ocaml.doc
      "Contains an array of PublicKey objects.\n\n  The returned public keys may have validity time ranges that overlap.\n  \n   "]}
[@@ocaml.doc
  "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec list_public_keys_request =
  {
  next_token: string option [@ocaml.doc "Reserved for future use.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Optionally specifies, in UTC, the end of the time range to look up public keys for CloudTrail digest files. If not specified, the current time is used.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Optionally specifies, in UTC, the start of the time range to look up public keys for CloudTrail digest files. If not specified, the current time is used, and the current public key is returned.\n"]}
[@@ocaml.doc "Requests the public keys for a specified time range.\n"]
type nonrec list_insights_metric_data_response =
  {
  next_token: string option
    [@ocaml.doc
      "Only returned if the full results could not be returned in a single query. You can set the [NextToken] parameter in the next request to this value to continue retrieval.\n"];
  values: float list option
    [@ocaml.doc
      "List of values representing the API call rate or error rate at each timestamp. The number of values is equal to the number of timestamps.\n"];
  timestamps: CoreTypes.Timestamp.t list option
    [@ocaml.doc
      "List of timestamps at intervals corresponding to the specified time period.\n"];
  error_code: string option
    [@ocaml.doc
      "Only returned if [InsightType] parameter was set to [ApiErrorRateInsight].\n\n If returning metrics for the [ApiErrorRateInsight] Insights type, this is the error to retrieve data for. For example, [AccessDenied].\n "];
  insight_type: insight_type option
    [@ocaml.doc
      "The type of CloudTrail Insights event, which is either [ApiCallRateInsight] or [ApiErrorRateInsight]. The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume. The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes.\n"];
  event_name: string option
    [@ocaml.doc
      "The name of the event, typically the Amazon Web Services API on which unusual levels of activity were recorded.\n"];
  event_source: string option
    [@ocaml.doc
      "The Amazon Web Services service to which the request was made, such as [iam.amazonaws.com] or [s3.amazonaws.com].\n"]}
[@@ocaml.doc ""]
type nonrec insights_metric_data_type =
  | NON_ZERO_DATA [@ocaml.doc ""]
  | FILL_WITH_ZEROS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_insights_metric_data_request =
  {
  next_token: string option
    [@ocaml.doc
      "Returned if all datapoints can't be returned in a single call. For example, due to reaching [MaxResults].\n\n Add this parameter to the request to continue retrieving results starting from the last evaluated point.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of data points to return. Valid values are integers from 1 to 21600. The default value is 21600.\n"];
  data_type: insights_metric_data_type option
    [@ocaml.doc
      "Type of data points to return. Valid values are [NonZeroData] and [FillWithZeros]. The default is [NonZeroData].\n"];
  period: int option
    [@ocaml.doc
      "Granularity of data to retrieve, in seconds. Valid values are [60], [300], and [3600]. If you specify any other value, you will get an error. The default is 3600 seconds.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies, in UTC, the end time for time-series data. The value specified is exclusive; results include data points up to the specified time stamp.\n\n The default is the time of request.\n "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies, in UTC, the start time for time-series data. The value specified is inclusive; results include data points with the specified time stamp.\n\n The default is 90 days before the time of request.\n "];
  error_code: string option
    [@ocaml.doc
      "Conditionally required if the [InsightType] parameter is set to [ApiErrorRateInsight].\n\n If returning metrics for the [ApiErrorRateInsight] Insights type, this is the error to retrieve data for. For example, [AccessDenied].\n "];
  insight_type: insight_type
    [@ocaml.doc
      "The type of CloudTrail Insights event, which is either [ApiCallRateInsight] or [ApiErrorRateInsight]. The [ApiCallRateInsight] Insights type analyzes write-only management API calls that are aggregated per minute against a baseline API call volume. The [ApiErrorRateInsight] Insights type analyzes management API calls that result in error codes.\n"];
  event_name: string
    [@ocaml.doc
      "The name of the event, typically the Amazon Web Services API on which unusual levels of activity were recorded.\n"];
  event_source: string
    [@ocaml.doc
      "The Amazon Web Services service to which the request was made, such as [iam.amazonaws.com] or [s3.amazonaws.com].\n"]}
[@@ocaml.doc ""]
type nonrec imports_list_item =
  {
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc " The timestamp of the import's last update. \n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc " The timestamp of the import's creation. \n"];
  destinations: string list option
    [@ocaml.doc " The ARN of the destination event data store. \n"];
  import_status: import_status option
    [@ocaml.doc " The status of the import. \n"];
  import_id: string option [@ocaml.doc " The ID of the import. \n"]}[@@ocaml.doc
                                                                    " Contains information about an import that was returned by a lookup request. \n"]
type nonrec list_imports_response =
  {
  next_token: string option
    [@ocaml.doc
      " A token you can use to get the next page of import results. \n"];
  imports: imports_list_item list option
    [@ocaml.doc " The list of returned imports. \n"]}[@@ocaml.doc ""]
type nonrec list_imports_request =
  {
  next_token: string option
    [@ocaml.doc
      " A token you can use to get the next page of import results. \n"];
  import_status: import_status option
    [@ocaml.doc " The status of the import. \n"];
  destination: string option
    [@ocaml.doc " The ARN of the destination event data store. \n"];
  max_results: int option
    [@ocaml.doc
      " The maximum number of imports to display on a single page. \n"]}
[@@ocaml.doc ""]
type nonrec import_failure_status =
  | SUCCEEDED [@ocaml.doc ""]
  | RETRY [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec import_failure_list_item =
  {
  last_updated_time: CoreTypes.Timestamp.t option
    [@ocaml.doc " When the import was last updated. \n"];
  error_message: string option
    [@ocaml.doc " Provides the reason the import failed. \n"];
  error_type: string option [@ocaml.doc " The type of import error. \n"];
  status: import_failure_status option
    [@ocaml.doc " The status of the import. \n"];
  location: string option
    [@ocaml.doc " The location of the failure in the S3 bucket. \n"]}
[@@ocaml.doc " Provides information about an import failure. \n"]
type nonrec list_import_failures_response =
  {
  next_token: string option
    [@ocaml.doc " A token you can use to get the next page of results. \n"];
  failures: import_failure_list_item list option
    [@ocaml.doc " Contains information about the import failures. \n"]}
[@@ocaml.doc ""]
type nonrec list_import_failures_request =
  {
  next_token: string option
    [@ocaml.doc
      " A token you can use to get the next page of import failures. \n"];
  max_results: int option
    [@ocaml.doc
      " The maximum number of failures to display on a single page. \n"];
  import_id: string [@ocaml.doc " The ID of the import. \n"]}[@@ocaml.doc ""]
type nonrec event_data_store =
  {
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp showing when an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].\n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the event data store's creation.\n"];
  retention_period: int option
    [@ocaml.doc "The retention period, in days.\n"];
  organization_enabled: bool option
    [@ocaml.doc
      "Indicates that an event data store is collecting logged events for an organization.\n"];
  multi_region_enabled: bool option
    [@ocaml.doc
      "Indicates whether the event data store includes events from all Regions, or only from the Region in which it was created.\n"];
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "The advanced event selectors that were used to select events for the data store.\n"];
  status: event_data_store_status option
    [@ocaml.doc "The status of an event data store.\n"];
  termination_protection_enabled: bool option
    [@ocaml.doc
      "Indicates whether the event data store is protected from termination.\n"];
  name: string option [@ocaml.doc "The name of the event data store.\n"];
  event_data_store_arn: string option
    [@ocaml.doc "The ARN of the event data store.\n"]}[@@ocaml.doc
                                                        "A storage lake of event data against which you can run complex SQL-based queries. An event data store can include events that you have logged on your account. To select events for an event data store, use {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-concepts.html#adv-event-selectors}advanced event selectors}.\n"]
type nonrec list_event_data_stores_response =
  {
  next_token: string option
    [@ocaml.doc "A token you can use to get the next page of results.\n"];
  event_data_stores: event_data_store list option
    [@ocaml.doc
      "Contains information about event data stores in the account, in the current Region.\n"]}
[@@ocaml.doc ""]
type nonrec list_event_data_stores_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of event data stores to display on a single page.\n"];
  next_token: string option
    [@ocaml.doc
      "A token you can use to get the next page of event data store results.\n"]}
[@@ocaml.doc ""]
type nonrec dashboard_detail =
  {
  type_: dashboard_type option [@ocaml.doc " The type of dashboard. \n"];
  dashboard_arn: string option [@ocaml.doc " The ARN for the dashboard. \n"]}
[@@ocaml.doc " Provides information about a CloudTrail Lake dashboard. \n"]
type nonrec list_dashboards_response =
  {
  next_token: string option
    [@ocaml.doc
      " A token you can use to get the next page of dashboard results. \n"];
  dashboards: dashboard_detail list option
    [@ocaml.doc
      " Contains information about dashboards in the account, in the current Region that match the applied filters. \n"]}
[@@ocaml.doc ""]
type nonrec list_dashboards_request =
  {
  max_results: int option
    [@ocaml.doc
      " The maximum number of dashboards to display on a single page. \n"];
  next_token: string option
    [@ocaml.doc
      " A token you can use to get the next page of dashboard results. \n"];
  type_: dashboard_type option
    [@ocaml.doc
      " Specify a dashboard type to filter on: [CUSTOM] or [MANAGED]. \n"];
  name_prefix: string option
    [@ocaml.doc " Specify a name prefix to filter on. \n"]}[@@ocaml.doc ""]
type nonrec channel =
  {
  name: string option
    [@ocaml.doc
      " The name of the CloudTrail channel. For service-linked channels, the name is [aws-service-channel/service-name/custom-suffix] where [service-name] represents the name of the Amazon Web Services service that created the channel and [custom-suffix] represents the suffix created by the Amazon Web Services service. \n"];
  channel_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of a channel.\n"]}[@@ocaml.doc
                                                                    "Contains information about a returned CloudTrail channel.\n"]
type nonrec list_channels_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to get the next page of results after a previous API call.\n"];
  channels: channel list option
    [@ocaml.doc " The list of channels in the account. \n"]}[@@ocaml.doc ""]
type nonrec list_channels_request =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to get the next page of results after a previous API call. This token must be passed in with the same parameters that were specified in the original call. For example, if the original call specified an AttributeKey of 'Username' with a value of 'root', the call with NextToken should include those same parameters.\n"];
  max_results: int option
    [@ocaml.doc
      " The maximum number of CloudTrail channels to display on a single page. \n"]}
[@@ocaml.doc ""]
type nonrec invalid_source_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified value of [Source] is not valid.\n"]
type nonrec insight_not_enabled_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "If you run [GetInsightSelectors] on a trail or event data store that does not have Insights events enabled, the operation throws the exception [InsightNotEnabledException].\n"]
type nonrec ingestion_status =
  {
  latest_ingestion_attempt_event_i_d: string option
    [@ocaml.doc
      "The event ID of the most recent attempt to ingest events.\n"];
  latest_ingestion_attempt_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp of the most recent attempt to ingest events on the channel.\n"];
  latest_ingestion_error_code: string option
    [@ocaml.doc
      "The error code for the most recent failure to ingest events.\n"];
  latest_ingestion_success_event_i_d: string option
    [@ocaml.doc
      "The event ID of the most recent successful ingestion of events.\n"];
  latest_ingestion_success_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp of the most recent successful ingestion of events for the channel.\n"]}
[@@ocaml.doc
  "A table showing information about the most recent successful and failed attempts to ingest events.\n"]
type nonrec inactive_query_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "The specified query cannot be canceled because it is in the [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED] state.\n"]
type nonrec get_trail_status_response =
  {
  time_logging_stopped: string option
    [@ocaml.doc "This field is no longer in use.\n"];
  time_logging_started: string option
    [@ocaml.doc "This field is no longer in use.\n"];
  latest_delivery_attempt_succeeded: string option
    [@ocaml.doc "This field is no longer in use.\n"];
  latest_notification_attempt_succeeded: string option
    [@ocaml.doc "This field is no longer in use.\n"];
  latest_notification_attempt_time: string option
    [@ocaml.doc "This field is no longer in use.\n"];
  latest_delivery_attempt_time: string option
    [@ocaml.doc "This field is no longer in use.\n"];
  latest_digest_delivery_error: string option
    [@ocaml.doc
      "Displays any Amazon S3 error that CloudTrail encountered when attempting to deliver a digest file to the designated bucket. For more information, see {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html}Error Responses} in the Amazon S3 API Reference. \n\n  This error occurs only when there is a problem with the destination S3 bucket, and does not occur for requests that time out. To resolve the issue, fix the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html}bucket policy} so that CloudTrail can write to the bucket; or create a new bucket and call [UpdateTrail] to specify the new bucket.\n  \n   "];
  latest_digest_delivery_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies the date and time that CloudTrail last delivered a digest file to an account's Amazon S3 bucket.\n"];
  latest_cloud_watch_logs_delivery_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Displays the most recent date and time when CloudTrail delivered logs to CloudWatch Logs.\n"];
  latest_cloud_watch_logs_delivery_error: string option
    [@ocaml.doc
      "Displays any CloudWatch Logs error that CloudTrail encountered when attempting to deliver logs to CloudWatch Logs.\n"];
  stop_logging_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies the most recent date and time when CloudTrail stopped recording API calls for an Amazon Web Services account.\n"];
  start_logging_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies the most recent date and time when CloudTrail started recording API calls for an Amazon Web Services account.\n"];
  latest_notification_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies the date and time of the most recent Amazon SNS notification that CloudTrail has written a new log file to an account's Amazon S3 bucket.\n"];
  latest_delivery_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specifies the date and time that CloudTrail last delivered log files to an account's Amazon S3 bucket.\n"];
  latest_notification_error: string option
    [@ocaml.doc
      "Displays any Amazon SNS error that CloudTrail encountered when attempting to send a notification. For more information about Amazon SNS errors, see the {{:https://docs.aws.amazon.com/sns/latest/dg/welcome.html}Amazon SNS Developer Guide}. \n"];
  latest_delivery_error: string option
    [@ocaml.doc
      "Displays any Amazon S3 error that CloudTrail encountered when attempting to deliver log files to the designated bucket. For more information, see {{:https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html}Error Responses} in the Amazon S3 API Reference. \n\n  This error occurs only when there is a problem with the destination S3 bucket, and does not occur for requests that time out. To resolve the issue, fix the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/create-s3-bucket-policy-for-cloudtrail.html}bucket policy} so that CloudTrail can write to the bucket; or create a new bucket and call [UpdateTrail] to specify the new bucket.\n  \n   "];
  is_logging: bool option
    [@ocaml.doc
      "Whether the CloudTrail trail is currently logging Amazon Web Services API calls.\n"]}
[@@ocaml.doc
  "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec get_trail_status_request =
  {
  name: string
    [@ocaml.doc
      "Specifies the name or the CloudTrail ARN of the trail for which you are requesting status. To get the status of a shadow trail (a replication of the trail in another Region), you must specify its ARN.\n\n  The following is the format of a trail ARN: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n \n   If the trail is an organization trail and you are a member account in the organization in Organizations, you must provide the full ARN of that trail, and not just the name.\n   \n    "]}
[@@ocaml.doc
  "The name of a trail about which you want the current status.\n"]
type nonrec get_trail_response = {
  trail: trail option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec get_trail_request =
  {
  name: string
    [@ocaml.doc
      "The name or the Amazon Resource Name (ARN) of the trail for which you want to retrieve settings information.\n"]}
[@@ocaml.doc ""]
type nonrec get_resource_policy_response =
  {
  delegated_admin_resource_policy: string option
    [@ocaml.doc
      " The default resource-based policy that is automatically generated for the delegated administrator of an Organizations organization. This policy will be evaluated in tandem with any policy you submit for the resource. For more information about this policy, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-organizations.html#cloudtrail-lake-organizations-eds-rbp}Default resource policy for delegated administrators}. \n"];
  resource_policy: string option
    [@ocaml.doc
      " A JSON-formatted string that contains the resource-based policy attached to the CloudTrail event data store, dashboard, or channel. \n"];
  resource_arn: string option
    [@ocaml.doc
      " The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to resource-based policy. \n\n Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n \n  Example dashboard ARN format: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n  \n   Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n   "]}
[@@ocaml.doc ""]
type nonrec get_resource_policy_request =
  {
  resource_arn: string
    [@ocaml.doc
      " The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel attached to the resource-based policy.\n\n Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n \n  Example dashboard ARN format: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n  \n   Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n   "]}
[@@ocaml.doc ""]
type nonrec get_query_results_response =
  {
  error_message: string option
    [@ocaml.doc "The error message returned if a query failed.\n"];
  next_token: string option
    [@ocaml.doc
      "A token you can use to get the next page of query results.\n"];
  query_result_rows: query_result_column list list option
    [@ocaml.doc "Contains the individual event results of the query.\n"];
  query_statistics: query_statistics option
    [@ocaml.doc "Shows the count of query results.\n"];
  query_status: query_status option
    [@ocaml.doc
      "The status of the query. Values include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].\n"]}
[@@ocaml.doc ""]
type nonrec get_query_results_request =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  max_query_results: int option
    [@ocaml.doc
      "The maximum number of query results to display on a single page.\n"];
  next_token: string option
    [@ocaml.doc
      "A token you can use to get the next page of query results.\n"];
  query_id: string
    [@ocaml.doc "The ID of the query for which you want to get results.\n"];
  event_data_store: string option
    [@ocaml.doc
      "The ARN (or ID suffix of the ARN) of the event data store against which the query was run.\n"]}
[@@ocaml.doc ""]
type nonrec get_insight_selectors_response =
  {
  insights_destination: string option
    [@ocaml.doc
      " The ARN of the destination event data store that logs Insights events. \n"];
  event_data_store_arn: string option
    [@ocaml.doc
      " The ARN of the source event data store that enabled Insights events. \n"];
  insight_selectors: insight_selector list option
    [@ocaml.doc
      "A JSON string that contains the Insight types you want to log on a trail or event data store. [ApiErrorRateInsight] and [ApiCallRateInsight] are supported as Insights types.\n"];
  trail_ar_n: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a trail for which you want to get Insights selectors.\n"]}
[@@ocaml.doc ""]
type nonrec get_insight_selectors_request =
  {
  event_data_store: string option
    [@ocaml.doc
      " Specifies the ARN (or ID suffix of the ARN) of the event data store for which you want to get Insights selectors. \n\n You cannot use this parameter with the [TrailName] parameter.\n "];
  trail_name: string option
    [@ocaml.doc
      "Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the following requirements:\n\n {ul\n       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)\n           \n            }\n       {-  Start with a letter or number, and end with a letter or number\n           \n            }\n       {-  Be between 3 and 128 characters\n           \n            }\n       {-  Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.\n           \n            }\n       {-  Not be in IP address format (for example, 192.168.5.4)\n           \n            }\n       }\n   If you specify a trail ARN, it must be in the format:\n   \n     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n    \n     You cannot use this parameter with the [EventDataStore] parameter.\n     "]}
[@@ocaml.doc ""]
type nonrec get_import_response =
  {
  import_statistics: import_statistics option
    [@ocaml.doc
      " Provides statistics for the import. CloudTrail does not update import statistics in real-time. Returned values for parameters such as [EventsCompleted] may be lower than the actual value, because CloudTrail updates statistics incrementally over the course of the import. \n"];
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc " The timestamp of when the import was updated. \n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc " The timestamp of the import's creation. \n"];
  import_status: import_status option
    [@ocaml.doc " The status of the import. \n"];
  end_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Used with [StartEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. \n"];
  start_event_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " Used with [EndEventTime] to bound a [StartImport] request, and limit imported trail events to only those events logged within a specified time period. \n"];
  import_source: import_source option
    [@ocaml.doc " The source S3 bucket. \n"];
  destinations: string list option
    [@ocaml.doc " The ARN of the destination event data store. \n"];
  import_id: string option [@ocaml.doc " The ID of the import. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_import_request =
  {
  import_id: string [@ocaml.doc " The ID for the import. \n"]}[@@ocaml.doc
                                                                ""]
type nonrec get_event_selectors_response =
  {
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      " The advanced event selectors that are configured for the trail. \n"];
  event_selectors: event_selector list option
    [@ocaml.doc "The event selectors that are configured for the trail.\n"];
  trail_ar_n: string option
    [@ocaml.doc "The specified trail ARN that has the event selectors.\n"]}
[@@ocaml.doc ""]
type nonrec get_event_selectors_request =
  {
  trail_name: string
    [@ocaml.doc
      "Specifies the name of the trail or trail ARN. If you specify a trail name, the string must meet the following requirements:\n\n {ul\n       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)\n           \n            }\n       {-  Start with a letter or number, and end with a letter or number\n           \n            }\n       {-  Be between 3 and 128 characters\n           \n            }\n       {-  Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.\n           \n            }\n       {-  Not be in IP address format (for example, 192.168.5.4)\n           \n            }\n       }\n   If you specify a trail ARN, it must be in the format:\n   \n     [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n    "]}
[@@ocaml.doc ""]
type nonrec get_event_data_store_response =
  {
  partition_keys: partition_key list option
    [@ocaml.doc
      "The partition keys for the event data store. To improve query performance and efficiency, CloudTrail Lake organizes event data into partitions based on values derived from partition keys.\n"];
  federation_role_arn: string option
    [@ocaml.doc
      " If Lake query federation is enabled, provides the ARN of the federation role used to access the resources for the federated event data store. \n"];
  federation_status: federation_status option
    [@ocaml.doc
      " Indicates the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Lake query federation} status. The status is [ENABLED] if Lake query federation is enabled, or [DISABLED] if Lake query federation is disabled. You cannot delete an event data store if the [FederationStatus] is [ENABLED]. \n"];
  billing_mode: billing_mode option
    [@ocaml.doc "The billing mode for the event data store.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.\n\n  [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n "];
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Shows the time that an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].\n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp of the event data store's creation.\n"];
  termination_protection_enabled: bool option
    [@ocaml.doc "Indicates that termination protection is enabled.\n"];
  retention_period: int option
    [@ocaml.doc "The retention period of the event data store, in days.\n"];
  organization_enabled: bool option
    [@ocaml.doc
      "Indicates whether an event data store is collecting logged events for an organization in Organizations.\n"];
  multi_region_enabled: bool option
    [@ocaml.doc
      "Indicates whether the event data store includes events from all Regions, or only from the Region in which it was created.\n"];
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "The advanced event selectors used to select events for the data store.\n"];
  status: event_data_store_status option
    [@ocaml.doc "The status of an event data store.\n"];
  name: string option [@ocaml.doc "The name of the event data store.\n"];
  event_data_store_arn: string option
    [@ocaml.doc "The event data store Amazon Resource Number (ARN).\n"]}
[@@ocaml.doc ""]
type nonrec get_event_data_store_request =
  {
  event_data_store: string
    [@ocaml.doc
      "The ARN (or ID suffix of the ARN) of the event data store about which you want information.\n"]}
[@@ocaml.doc ""]
type nonrec get_event_configuration_response =
  {
  context_key_selectors: context_key_selector list option
    [@ocaml.doc
      "The list of context key selectors that are configured for the event data store.\n"];
  max_event_size: max_event_size option
    [@ocaml.doc
      "The maximum allowed size for events stored in the specified event data store.\n"];
  event_data_store_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which the event configuration settings are returned.\n"]}
[@@ocaml.doc ""]
type nonrec get_event_configuration_request =
  {
  event_data_store: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) or ID suffix of the ARN of the event data store for which you want to retrieve event configuration settings.\n"]}
[@@ocaml.doc ""]
type nonrec dashboard_status =
  | DELETING [@ocaml.doc ""]
  | UPDATED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_dashboard_response =
  {
  termination_protection_enabled: bool option
    [@ocaml.doc
      " Indicates whether termination protection is enabled for the dashboard. \n"];
  last_refresh_failure_reason: string option
    [@ocaml.doc
      " Provides information about failures for the last scheduled refresh. \n"];
  last_refresh_id: string option
    [@ocaml.doc " The ID of the last dashboard refresh. \n"];
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The timestamp that shows when the dashboard was last updated. \n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The timestamp that shows when the dashboard was created. \n"];
  refresh_schedule: refresh_schedule option
    [@ocaml.doc " The refresh schedule for the dashboard, if configured. \n"];
  widgets: widget list option
    [@ocaml.doc " An array of widgets for the dashboard. \n"];
  status: dashboard_status option
    [@ocaml.doc " The status of the dashboard. \n"];
  type_: dashboard_type option [@ocaml.doc " The type of dashboard. \n"];
  dashboard_arn: string option [@ocaml.doc " The ARN for the dashboard. \n"]}
[@@ocaml.doc ""]
type nonrec get_dashboard_request =
  {
  dashboard_id: string [@ocaml.doc " The name or ARN for the dashboard. \n"]}
[@@ocaml.doc ""]
type nonrec get_channel_response =
  {
  ingestion_status: ingestion_status option
    [@ocaml.doc
      "A table showing information about the most recent successful and failed attempts to ingest events.\n"];
  destinations: destination list option
    [@ocaml.doc
      "The destinations for the channel. For channels created for integrations, the destinations are the event data stores that log events arriving through the channel. For service-linked channels, the destination is the Amazon Web Services service that created the service-linked channel to receive events.\n"];
  source_config: source_config option
    [@ocaml.doc
      " Provides information about the advanced event selectors configured for the channel, and whether the channel applies to all Regions or a single Region. \n"];
  source: string option
    [@ocaml.doc "The source for the CloudTrail channel.\n"];
  name: string option
    [@ocaml.doc
      " The name of the CloudTrail channel. For service-linked channels, the name is [aws-service-channel/service-name/custom-suffix] where [service-name] represents the name of the Amazon Web Services service that created the channel and [custom-suffix] represents the suffix generated by the Amazon Web Services service. \n"];
  channel_arn: string option
    [@ocaml.doc
      "The ARN of an channel returned by a [GetChannel] request.\n"]}
[@@ocaml.doc ""]
type nonrec get_channel_request =
  {
  channel: string [@ocaml.doc "The ARN or [UUID] of a channel.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec generate_response_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when a valid query could not be generated for the provided prompt. \n"]
type nonrec generate_query_response =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  query_alias: string option
    [@ocaml.doc
      " An alias that identifies the prompt. When you run the [StartQuery] operation, you can pass in either the [QueryAlias] or [QueryStatement] parameter. \n"];
  query_statement: string option
    [@ocaml.doc " The SQL query statement generated from the prompt. \n"]}
[@@ocaml.doc ""]
type nonrec generate_query_request =
  {
  prompt: string
    [@ocaml.doc
      " The prompt that you want to use to generate the query. The prompt must be in English. For example prompts, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-query-generator.html#lake-query-generator-examples}Example prompts} in the {i CloudTrail } user guide. \n"];
  event_data_stores: string list
    [@ocaml.doc
      " The ARN (or ID suffix of the ARN) of the event data store that you want to query. You can only specify one event data store. \n"]}
[@@ocaml.doc ""]
type nonrec event_data_store_termination_protected_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "The event data store cannot be deleted because termination protection is enabled for it.\n"]
type nonrec event_data_store_federation_enabled_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " You cannot delete the event data store because Lake query federation is enabled. To delete the event data store, run the [DisableFederation] operation to disable Lake query federation on the event data store. \n"]
type nonrec enable_federation_response =
  {
  federation_role_arn: string option
    [@ocaml.doc " The ARN of the federation role. \n"];
  federation_status: federation_status option
    [@ocaml.doc " The federation status. \n"];
  event_data_store_arn: string option
    [@ocaml.doc
      " The ARN of the event data store for which you enabled Lake query federation. \n"]}
[@@ocaml.doc ""]
type nonrec enable_federation_request =
  {
  federation_role_arn: string
    [@ocaml.doc
      " The ARN of the federation role to use for the event data store. Amazon Web Services services like Lake Formation use this federation role to access data for the federated event data store. The federation role must exist in your account and provide the {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html#query-federation-permissions-role}required minimum permissions}. \n"];
  event_data_store: string
    [@ocaml.doc
      "The ARN (or ID suffix of the ARN) of the event data store for which you want to enable Lake query federation.\n"]}
[@@ocaml.doc ""]
type nonrec concurrent_modification_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " You are trying to update a resource when another request is in progress. Allow sufficient wait time for the previous request to complete, then retry your request. \n"]
type nonrec access_denied_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc " You do not have sufficient access to perform this action. \n"]
type nonrec disable_federation_response =
  {
  federation_status: federation_status option
    [@ocaml.doc " The federation status. \n"];
  event_data_store_arn: string option
    [@ocaml.doc
      " The ARN of the event data store for which you disabled Lake query federation. \n"]}
[@@ocaml.doc ""]
type nonrec disable_federation_request =
  {
  event_data_store: string
    [@ocaml.doc
      " The ARN (or ID suffix of the ARN) of the event data store for which you want to disable Lake query federation. \n"]}
[@@ocaml.doc ""]
type nonrec describe_trails_response =
  {
  trail_list: trail list option
    [@ocaml.doc
      "The list of trail objects. Trail objects with string values are only returned if values for the objects exist in a trail's configuration. For example, [SNSTopicName] and [SNSTopicARN] are only returned in results if a trail is configured to send SNS notifications. Similarly, [KMSKeyId] only appears in results if a trail's log files are encrypted with KMS customer managed keys.\n"]}
[@@ocaml.doc
  "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec describe_trails_request =
  {
  include_shadow_trails: bool option
    [@ocaml.doc
      "Specifies whether to include shadow trails in the response. A shadow trail is the replication in a Region of a trail that was created in a different Region, or in the case of an organization trail, the replication of an organization trail in member accounts. If you do not include shadow trails, organization trails in a member account and Region replication trails will not be returned. The default is true.\n"];
  trail_name_list: string list option
    [@ocaml.doc
      "Specifies a list of trail names, trail ARNs, or both, of the trails to describe. The format of a trail ARN is:\n\n  [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n \n  If an empty list is specified, information for the trail in the current Region is returned.\n  \n   {ul\n         {-  If an empty list is specified and [IncludeShadowTrails] is false, then information for all trails in the current Region is returned.\n             \n              }\n         {-  If an empty list is specified and IncludeShadowTrails is null or true, then information for all trails in the current Region and any associated shadow trails in other Regions is returned.\n             \n              }\n         }\n    If one or more trail names are specified, information is returned only if the names match the names of trails belonging only to the current Region and current account. To return information about a trail in another Region, you must specify its trail ARN.\n    \n     "]}
[@@ocaml.doc "Returns information about the trail.\n"]
type nonrec delivery_status =
  | UNKNOWN [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | ACCESS_DENIED_SIGNING_FILE [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
  | RESOURCE_NOT_FOUND [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | FAILED_SIGNING_FILE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec describe_query_response =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  prompt: string option
    [@ocaml.doc
      " The prompt used for a generated query. For information about generated queries, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-query-generator.html}Create CloudTrail Lake queries from natural language prompts} in the {i CloudTrail } user guide. \n"];
  delivery_status: delivery_status option
    [@ocaml.doc "The delivery status.\n"];
  delivery_s3_uri: string option
    [@ocaml.doc
      "The URI for the S3 bucket where CloudTrail delivered query results, if applicable.\n"];
  error_message: string option
    [@ocaml.doc "The error message returned if a query failed.\n"];
  query_statistics: query_statistics_for_describe_query option
    [@ocaml.doc
      "Metadata about a query, including the number of events that were matched, the total number of events scanned, the query run time in milliseconds, and the query's creation time.\n"];
  query_status: query_status option
    [@ocaml.doc
      "The status of a query. Values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED] \n"];
  query_string: string option [@ocaml.doc "The SQL code of a query.\n"];
  query_id: string option [@ocaml.doc "The ID of the query.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_query_request =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  refresh_id: string option
    [@ocaml.doc " The ID of the dashboard refresh. \n"];
  query_alias: string option
    [@ocaml.doc " The alias that identifies a query template. \n"];
  query_id: string option [@ocaml.doc "The query ID.\n"];
  event_data_store: string option
    [@ocaml.doc
      "The ARN (or the ID suffix of the ARN) of an event data store on which the specified query was run.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_organization_delegated_admin_request =
  {
  delegated_admin_account_id: string
    [@ocaml.doc
      "A delegated administrator account ID. This is a member account in an organization that is currently designated as a delegated administrator.\n"]}
[@@ocaml.doc
  "Removes CloudTrail delegated administrator permissions from a specified member account in an organization that is currently designated as a delegated administrator.\n"]
type nonrec account_not_registered_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified account is not registered as the CloudTrail delegated administrator.\n"]
type nonrec delete_trail_request =
  {
  name: string
    [@ocaml.doc
      "Specifies the name or the CloudTrail ARN of the trail to be deleted. The following is the format of a trail ARN. [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n"]}
[@@ocaml.doc "The request that specifies the name of a trail to delete.\n"]
type nonrec delete_resource_policy_request =
  {
  resource_arn: string
    [@ocaml.doc
      " The Amazon Resource Name (ARN) of the CloudTrail event data store, dashboard, or channel you're deleting the resource-based policy from.\n\n Example event data store ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n \n  Example dashboard ARN format: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n  \n   Example channel ARN format: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n   "]}
[@@ocaml.doc ""]
type nonrec delete_event_data_store_request =
  {
  event_data_store: string
    [@ocaml.doc
      "The ARN (or the ID suffix of the ARN) of the event data store to delete.\n"]}
[@@ocaml.doc ""]
type nonrec channel_exists_for_eds_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  "This exception is thrown when the specified event data store cannot yet be deleted because it is in use by a channel.\n"]
type nonrec delete_dashboard_request =
  {
  dashboard_id: string [@ocaml.doc " The name or ARN for the dashboard. \n"]}
[@@ocaml.doc ""]
type nonrec delete_channel_request =
  {
  channel: string
    [@ocaml.doc
      "The ARN or the [UUID] value of the channel that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec create_trail_response =
  {
  is_organization_trail: bool option
    [@ocaml.doc "Specifies whether the trail is an organization trail.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.\n\n  [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n "];
  cloud_watch_logs_role_arn: string option
    [@ocaml.doc
      "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group.\n"];
  cloud_watch_logs_log_group_arn: string option
    [@ocaml.doc
      "Specifies the Amazon Resource Name (ARN) of the log group to which CloudTrail logs will be delivered.\n"];
  log_file_validation_enabled: bool option
    [@ocaml.doc
      "Specifies whether log file integrity validation is enabled.\n"];
  trail_ar_n: string option
    [@ocaml.doc
      "Specifies the ARN of the trail that was created. The format of a trail ARN is:\n\n  [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n "];
  is_multi_region_trail: bool option
    [@ocaml.doc
      "Specifies whether the trail exists in one Region or in all Regions.\n"];
  include_global_service_events: bool option
    [@ocaml.doc
      "Specifies whether the trail is publishing events from global services such as IAM to the log files.\n"];
  sns_topic_ar_n: string option
    [@ocaml.doc
      "Specifies the ARN of the Amazon SNS topic that CloudTrail uses to send notifications when log files are delivered. The format of a topic ARN is:\n\n  [arn:aws:sns:us-east-2:123456789012:MyTopic] \n "];
  sns_topic_name: string option
    [@ocaml.doc "This field is no longer in use. Use [SnsTopicARN].\n"];
  s3_key_prefix: string option
    [@ocaml.doc
      "Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}.\n"];
  s3_bucket_name: string option
    [@ocaml.doc
      "Specifies the name of the Amazon S3 bucket designated for publishing log files.\n"];
  name: string option [@ocaml.doc "Specifies the name of the trail.\n"]}
[@@ocaml.doc
  "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec create_trail_request =
  {
  tags_list: tag list option [@ocaml.doc ""];
  is_organization_trail: bool option
    [@ocaml.doc
      "Specifies whether the trail is created for all accounts in an organization in Organizations, or only for the current Amazon Web Services account. The default is false, and cannot be true unless the call is made on behalf of an Amazon Web Services account that is the management account or delegated administrator account for an organization in Organizations.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID to use to encrypt the logs delivered by CloudTrail. The value can be an alias name prefixed by [alias/], a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.\n\n CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.\n \n  Examples:\n  \n   {ul\n         {-   [alias/MyAliasName] \n             \n              }\n         {-   [arn:aws:kms:us-east-2:123456789012:alias/MyAliasName] \n             \n              }\n         {-   [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n             \n              }\n         {-   [12345678-1234-1234-1234-123456789012] \n             \n              }\n         }\n  "];
  cloud_watch_logs_role_arn: string option
    [@ocaml.doc
      "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user's log group. You must use a role that exists in your account.\n"];
  cloud_watch_logs_log_group_arn: string option
    [@ocaml.doc
      "Specifies a log group name using an Amazon Resource Name (ARN), a unique identifier that represents the log group to which CloudTrail logs will be delivered. You must use a log group that exists in your account.\n\n Not required unless you specify [CloudWatchLogsRoleArn].\n "];
  enable_log_file_validation: bool option
    [@ocaml.doc
      "Specifies whether log file integrity validation is enabled. The default is false.\n\n  When you disable log file integrity validation, the chain of digest files is broken after one hour. CloudTrail does not create digest files for log files that were delivered during a period in which log file integrity validation was disabled. For example, if you enable log file integrity validation at noon on January 1, disable it at noon on January 2, and re-enable it at noon on January 10, digest files will not be created for the log files delivered from noon on January 2 to noon on January 10. The same applies whenever you stop CloudTrail logging or delete a trail.\n  \n   "];
  is_multi_region_trail: bool option
    [@ocaml.doc
      "Specifies whether the trail is created in the current Region or in all Regions. The default is false, which creates a trail only in the Region where you are signed in. As a best practice, consider creating trails that log events in all Regions.\n"];
  include_global_service_events: bool option
    [@ocaml.doc
      "Specifies whether the trail is publishing events from global services such as IAM to the log files.\n"];
  sns_topic_name: string option
    [@ocaml.doc
      "Specifies the name or ARN of the Amazon SNS topic defined for notification of log file delivery. The maximum length is 256 characters.\n"];
  s3_key_prefix: string option
    [@ocaml.doc
      "Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for log file delivery. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/get-and-view-cloudtrail-log-files.html#cloudtrail-find-log-files}Finding Your CloudTrail Log Files}. The maximum length is 200 characters.\n"];
  s3_bucket_name: string
    [@ocaml.doc
      "Specifies the name of the Amazon S3 bucket designated for publishing log files. For information about bucket naming rules, see {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html}Bucket naming rules} in the {i Amazon Simple Storage Service User Guide}. \n"];
  name: string
    [@ocaml.doc
      "Specifies the name of the trail. The name must meet the following requirements:\n\n {ul\n       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)\n           \n            }\n       {-  Start with a letter or number, and end with a letter or number\n           \n            }\n       {-  Be between 3 and 128 characters\n           \n            }\n       {-  Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.\n           \n            }\n       {-  Not be in IP address format (for example, 192.168.5.4)\n           \n            }\n       }\n  "]}
[@@ocaml.doc "Specifies the settings for each trail.\n"]
type nonrec create_event_data_store_response =
  {
  billing_mode: billing_mode option
    [@ocaml.doc "The billing mode for the event data store.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID that encrypts the events delivered by CloudTrail. The value is a fully specified ARN to a KMS key in the following format.\n\n  [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n "];
  updated_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp that shows when an event data store was updated, if applicable. [UpdatedTimestamp] is always either the same or newer than the time shown in [CreatedTimestamp].\n"];
  created_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp that shows when the event data store was created.\n"];
  tags_list: tag list option [@ocaml.doc ""];
  termination_protection_enabled: bool option
    [@ocaml.doc
      "Indicates whether termination protection is enabled for the event data store.\n"];
  retention_period: int option
    [@ocaml.doc "The retention period of an event data store, in days.\n"];
  organization_enabled: bool option
    [@ocaml.doc
      "Indicates whether an event data store is collecting logged events for an organization in Organizations.\n"];
  multi_region_enabled: bool option
    [@ocaml.doc
      "Indicates whether the event data store collects events from all Regions, or only from the Region in which it was created.\n"];
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "The advanced event selectors that were used to select the events for the data store.\n"];
  status: event_data_store_status option
    [@ocaml.doc "The status of event data store creation.\n"];
  name: string option [@ocaml.doc "The name of the event data store.\n"];
  event_data_store_arn: string option
    [@ocaml.doc "The ARN of the event data store.\n"]}[@@ocaml.doc ""]
type nonrec create_event_data_store_request =
  {
  billing_mode: billing_mode option
    [@ocaml.doc
      "The billing mode for the event data store determines the cost for ingesting events and the default and maximum retention period for the event data store.\n\n The following are the possible values:\n \n  {ul\n        {-   [EXTENDABLE_RETENTION_PRICING] - This billing mode is generally recommended if you want a flexible retention period of up to 3653 days (about 10 years). The default retention period for this billing mode is 366 days.\n            \n             }\n        {-   [FIXED_RETENTION_PRICING] - This billing mode is recommended if you expect to ingest more than 25 TB of event data per month and need a retention period of up to 2557 days (about 7 years). The default retention period for this billing mode is 2557 days.\n            \n             }\n        }\n   The default value is [EXTENDABLE_RETENTION_PRICING].\n   \n    For more information about CloudTrail pricing, see {{:http://aws.amazon.com/cloudtrail/pricing/}CloudTrail Pricing} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-manage-costs.html}Managing CloudTrail Lake costs}.\n    "];
  start_ingestion: bool option
    [@ocaml.doc
      "Specifies whether the event data store should start ingesting live events. The default is true.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "Specifies the KMS key ID to use to encrypt the events delivered by CloudTrail. The value can be an alias name prefixed by [alias/], a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier.\n\n  Disabling or deleting the KMS key, or removing CloudTrail permissions on the key, prevents CloudTrail from logging events to the event data store, and prevents users from querying the data in the event data store that was encrypted with the key. After you associate an event data store with a KMS key, the KMS key cannot be removed or changed. Before you disable or delete a KMS key that you are using with an event data store, delete or back up your event data store.\n  \n    CloudTrail also supports KMS multi-Region keys. For more information about multi-Region keys, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html}Using multi-Region keys} in the {i Key Management Service Developer Guide}.\n    \n     Examples:\n     \n      {ul\n            {-   [alias/MyAliasName] \n                \n                 }\n            {-   [arn:aws:kms:us-east-2:123456789012:alias/MyAliasName] \n                \n                 }\n            {-   [arn:aws:kms:us-east-2:123456789012:key/12345678-1234-1234-1234-123456789012] \n                \n                 }\n            {-   [12345678-1234-1234-1234-123456789012] \n                \n                 }\n            }\n  "];
  tags_list: tag list option [@ocaml.doc ""];
  termination_protection_enabled: bool option
    [@ocaml.doc
      "Specifies whether termination protection is enabled for the event data store. If termination protection is enabled, you cannot delete the event data store until termination protection is disabled.\n"];
  retention_period: int option
    [@ocaml.doc
      "The retention period of the event data store, in days. If [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], you can set a retention period of up to 3653 days, the equivalent of 10 years. If [BillingMode] is set to [FIXED_RETENTION_PRICING], you can set a retention period of up to 2557 days, the equivalent of seven years.\n\n CloudTrail Lake determines whether to retain an event by checking if the [eventTime] of the event is within the specified retention period. For example, if you set a retention period of 90 days, CloudTrail will remove events when the [eventTime] is older than 90 days.\n \n   If you plan to copy trail events to this event data store, we recommend that you consider both the age of the events that you want to copy as well as how long you want to keep the copied events in your event data store. For example, if you copy trail events that are 5 years old and specify a retention period of 7 years, the event data store will retain those events for two years.\n   \n    "];
  organization_enabled: bool option
    [@ocaml.doc
      "Specifies whether an event data store collects events logged for an organization in Organizations.\n"];
  multi_region_enabled: bool option
    [@ocaml.doc
      "Specifies whether the event data store includes events from all Regions, or only from the Region in which the event data store is created.\n"];
  advanced_event_selectors: advanced_event_selector list option
    [@ocaml.doc
      "The advanced event selectors to use to select the events for the data store. You can configure up to five advanced event selectors for each event data store.\n\n  For more information about how to use advanced event selectors to log CloudTrail events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html#creating-data-event-selectors-advanced}Log events by using advanced event selectors} in the CloudTrail User Guide.\n \n  For more information about how to use advanced event selectors to include Config configuration items in your event data store, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-eds-cli.html#lake-cli-create-eds-config}Create an event data store for Config configuration items} in the CloudTrail User Guide.\n  \n   For more information about how to use advanced event selectors to include events outside of Amazon Web Services events in your event data store, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-integrations-cli.html#lake-cli-create-integration}Create an integration to log events from outside Amazon Web Services} in the CloudTrail User Guide.\n   "];
  name: string [@ocaml.doc "The name of the event data store.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_dashboard_response =
  {
  termination_protection_enabled: bool option
    [@ocaml.doc
      " Indicates whether termination protection is enabled for the dashboard. \n"];
  refresh_schedule: refresh_schedule option
    [@ocaml.doc " The refresh schedule for the dashboard, if configured. \n"];
  tags_list: tag list option [@ocaml.doc ""];
  widgets: widget list option
    [@ocaml.doc " An array of widgets for the dashboard. \n"];
  type_: dashboard_type option [@ocaml.doc " The dashboard type. \n"];
  name: string option [@ocaml.doc " The name of the dashboard. \n"];
  dashboard_arn: string option [@ocaml.doc " The ARN for the dashboard. \n"]}
[@@ocaml.doc ""]
type nonrec create_dashboard_request =
  {
  widgets: request_widget list option
    [@ocaml.doc
      " An array of widgets for a custom dashboard. A custom dashboard can have a maximum of ten widgets. \n\n You do not need to specify widgets for the Highlights dashboard.\n "];
  termination_protection_enabled: bool option
    [@ocaml.doc
      " Specifies whether termination protection is enabled for the dashboard. If termination protection is enabled, you cannot delete the dashboard until termination protection is disabled. \n"];
  tags_list: tag list option [@ocaml.doc ""];
  refresh_schedule: refresh_schedule option
    [@ocaml.doc
      " The refresh schedule configuration for the dashboard. \n\n To create the Highlights dashboard, you must set a refresh schedule and set the [Status] to [ENABLED]. The [Unit] for the refresh schedule must be [HOURS] and the [Value] must be [6].\n "];
  name: string
    [@ocaml.doc
      " The name of the dashboard. The name must be unique to your account. \n\n To create the Highlights dashboard, the name must be [AWSCloudTrail-Highlights].\n "]}
[@@ocaml.doc ""]
type nonrec create_channel_response =
  {
  tags: tag list option [@ocaml.doc ""];
  destinations: destination list option
    [@ocaml.doc
      "The event data stores that log the events arriving through the channel.\n"];
  source: string option
    [@ocaml.doc "The partner or external event source name.\n"];
  name: string option [@ocaml.doc "The name of the new channel.\n"];
  channel_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the new channel.\n"]}
[@@ocaml.doc ""]
type nonrec create_channel_request =
  {
  tags: tag list option [@ocaml.doc ""];
  destinations: destination list
    [@ocaml.doc
      "One or more event data stores to which events arriving through a channel will be logged.\n"];
  source: string
    [@ocaml.doc
      "The name of the partner or external event source. You cannot change this name after you create the channel. A maximum of one channel is allowed per source.\n\n  A source can be either [Custom] for all valid non-Amazon Web Services events, or the name of a partner event source. For information about the source names for available partners, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-event-data-store-integration.html#cloudtrail-lake-partner-information}Additional information about integration partners} in the CloudTrail User Guide. \n "];
  name: string [@ocaml.doc "The name of the channel.\n"]}[@@ocaml.doc ""]
type nonrec channel_max_limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc
      "Brief description of the exception returned by the request.\n"]}
[@@ocaml.doc
  " This exception is thrown when the maximum number of channels limit is exceeded. \n"]
type nonrec cancel_query_response =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  query_status: query_status
    [@ocaml.doc
      "Shows the status of a query after a [CancelQuery] request. Typically, the values shown are either [RUNNING] or [CANCELLED].\n"];
  query_id: string [@ocaml.doc "The ID of the canceled query.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec cancel_query_request =
  {
  event_data_store_owner_account_id: string option
    [@ocaml.doc " The account ID of the event data store owner. \n"];
  query_id: string
    [@ocaml.doc
      "The ID of the query that you want to cancel. The [QueryId] comes from the response of a [StartQuery] operation.\n"];
  event_data_store: string option
    [@ocaml.doc
      "The ARN (or the ID suffix of the ARN) of an event data store on which the specified query is running.\n"]}
[@@ocaml.doc ""]
type nonrec add_tags_request =
  {
  tags_list: tag list
    [@ocaml.doc "Contains a list of tags, up to a limit of 50\n"];
  resource_id: string
    [@ocaml.doc
      "Specifies the ARN of the trail, event data store, dashboard, or channel to which one or more tags will be added.\n\n The format of a trail ARN is: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n \n  The format of an event data store ARN is: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n  \n   The format of a dashboard ARN is: [arn:aws:cloudtrail:us-east-1:123456789012:dashboard/exampleDash] \n   \n    The format of a channel ARN is: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n    "]}
[@@ocaml.doc
  "Specifies the tags to add to a trail, event data store, dashboard, or channel.\n"]