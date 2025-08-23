(** 
    CloudTrail client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

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
  "Specifies the tags to add to a trail, event data store, dashboard, or channel.\n"](** {1:builders Builders} *)

val make_widget :
  ?view_properties:view_properties_map ->
    ?query_parameters:string list ->
      ?query_statement:string -> ?query_alias:string -> unit -> widget
val make_update_trail_response :
  ?is_organization_trail:bool ->
    ?kms_key_id:string ->
      ?cloud_watch_logs_role_arn:string ->
        ?cloud_watch_logs_log_group_arn:string ->
          ?log_file_validation_enabled:bool ->
            ?trail_ar_n:string ->
              ?is_multi_region_trail:bool ->
                ?include_global_service_events:bool ->
                  ?sns_topic_ar_n:string ->
                    ?sns_topic_name:string ->
                      ?s3_key_prefix:string ->
                        ?s3_bucket_name:string ->
                          ?name:string -> unit -> update_trail_response
val make_update_trail_request :
  ?is_organization_trail:bool ->
    ?kms_key_id:string ->
      ?cloud_watch_logs_role_arn:string ->
        ?cloud_watch_logs_log_group_arn:string ->
          ?enable_log_file_validation:bool ->
            ?is_multi_region_trail:bool ->
              ?include_global_service_events:bool ->
                ?sns_topic_name:string ->
                  ?s3_key_prefix:string ->
                    ?s3_bucket_name:string ->
                      name:string -> unit -> update_trail_request
val make_advanced_field_selector :
  ?not_ends_with:string list ->
    ?not_starts_with:string list ->
      ?not_equals:string list ->
        ?ends_with:string list ->
          ?starts_with:string list ->
            ?equals:string list ->
              field:string -> unit -> advanced_field_selector
val make_advanced_event_selector :
  ?name:string ->
    field_selectors:advanced_field_selector list ->
      unit -> advanced_event_selector
val make_update_event_data_store_response :
  ?federation_role_arn:string ->
    ?federation_status:federation_status ->
      ?billing_mode:billing_mode ->
        ?kms_key_id:string ->
          ?updated_timestamp:CoreTypes.Timestamp.t ->
            ?created_timestamp:CoreTypes.Timestamp.t ->
              ?termination_protection_enabled:bool ->
                ?retention_period:int ->
                  ?organization_enabled:bool ->
                    ?multi_region_enabled:bool ->
                      ?advanced_event_selectors:advanced_event_selector list
                        ->
                        ?status:event_data_store_status ->
                          ?name:string ->
                            ?event_data_store_arn:string ->
                              unit -> update_event_data_store_response
val make_update_event_data_store_request :
  ?billing_mode:billing_mode ->
    ?kms_key_id:string ->
      ?termination_protection_enabled:bool ->
        ?retention_period:int ->
          ?organization_enabled:bool ->
            ?multi_region_enabled:bool ->
              ?advanced_event_selectors:advanced_event_selector list ->
                ?name:string ->
                  event_data_store:string ->
                    unit -> update_event_data_store_request
val make_refresh_schedule_frequency :
  ?value:int ->
    ?unit_:refresh_schedule_frequency_unit ->
      unit -> refresh_schedule_frequency
val make_refresh_schedule :
  ?time_of_day:string ->
    ?status:refresh_schedule_status ->
      ?frequency:refresh_schedule_frequency -> unit -> refresh_schedule
val make_update_dashboard_response :
  ?updated_timestamp:CoreTypes.Timestamp.t ->
    ?created_timestamp:CoreTypes.Timestamp.t ->
      ?termination_protection_enabled:bool ->
        ?refresh_schedule:refresh_schedule ->
          ?widgets:widget list ->
            ?type_:dashboard_type ->
              ?name:string ->
                ?dashboard_arn:string -> unit -> update_dashboard_response
val make_request_widget :
  ?query_parameters:string list ->
    view_properties:view_properties_map ->
      query_statement:string -> unit -> request_widget
val make_update_dashboard_request :
  ?termination_protection_enabled:bool ->
    ?refresh_schedule:refresh_schedule ->
      ?widgets:request_widget list ->
        dashboard_id:string -> unit -> update_dashboard_request
val make_destination :
  location:string -> type_:destination_type -> unit -> destination
val make_update_channel_response :
  ?destinations:destination list ->
    ?source:string ->
      ?name:string -> ?channel_arn:string -> unit -> update_channel_response
val make_update_channel_request :
  ?name:string ->
    ?destinations:destination list ->
      channel:string -> unit -> update_channel_request
val make_trail_info :
  ?home_region:string ->
    ?name:string -> ?trail_ar_n:string -> unit -> trail_info
val make_trail :
  ?is_organization_trail:bool ->
    ?has_insight_selectors:bool ->
      ?has_custom_event_selectors:bool ->
        ?kms_key_id:string ->
          ?cloud_watch_logs_role_arn:string ->
            ?cloud_watch_logs_log_group_arn:string ->
              ?log_file_validation_enabled:bool ->
                ?trail_ar_n:string ->
                  ?home_region:string ->
                    ?is_multi_region_trail:bool ->
                      ?include_global_service_events:bool ->
                        ?sns_topic_ar_n:string ->
                          ?sns_topic_name:string ->
                            ?s3_key_prefix:string ->
                              ?s3_bucket_name:string ->
                                ?name:string -> unit -> trail
val make_tag : ?value:string -> key:string -> unit -> tag
val make_stop_logging_response : unit -> unit
val make_stop_logging_request : name:string -> unit -> stop_logging_request
val make_s3_import_source :
  s3_bucket_access_role_arn:string ->
    s3_bucket_region:string ->
      s3_location_uri:string -> unit -> s3_import_source
val make_import_source : s3:s3_import_source -> unit -> import_source
val make_import_statistics :
  ?failed_entries:int ->
    ?events_completed:int ->
      ?files_completed:int ->
        ?prefixes_completed:int ->
          ?prefixes_found:int -> unit -> import_statistics
val make_stop_import_response :
  ?import_statistics:import_statistics ->
    ?end_event_time:CoreTypes.Timestamp.t ->
      ?start_event_time:CoreTypes.Timestamp.t ->
        ?updated_timestamp:CoreTypes.Timestamp.t ->
          ?created_timestamp:CoreTypes.Timestamp.t ->
            ?import_status:import_status ->
              ?destinations:string list ->
                ?import_source:import_source ->
                  ?import_id:string -> unit -> stop_import_response
val make_stop_import_request :
  import_id:string -> unit -> stop_import_request
val make_stop_event_data_store_ingestion_response : unit -> unit
val make_stop_event_data_store_ingestion_request :
  event_data_store:string -> unit -> stop_event_data_store_ingestion_request
val make_start_query_response :
  ?event_data_store_owner_account_id:string ->
    ?query_id:string -> unit -> start_query_response
val make_start_query_request :
  ?event_data_store_owner_account_id:string ->
    ?query_parameters:string list ->
      ?query_alias:string ->
        ?delivery_s3_uri:string ->
          ?query_statement:string -> unit -> start_query_request
val make_start_logging_response : unit -> unit
val make_start_logging_request : name:string -> unit -> start_logging_request
val make_start_import_response :
  ?updated_timestamp:CoreTypes.Timestamp.t ->
    ?created_timestamp:CoreTypes.Timestamp.t ->
      ?import_status:import_status ->
        ?end_event_time:CoreTypes.Timestamp.t ->
          ?start_event_time:CoreTypes.Timestamp.t ->
            ?import_source:import_source ->
              ?destinations:string list ->
                ?import_id:string -> unit -> start_import_response
val make_start_import_request :
  ?import_id:string ->
    ?end_event_time:CoreTypes.Timestamp.t ->
      ?start_event_time:CoreTypes.Timestamp.t ->
        ?import_source:import_source ->
          ?destinations:string list -> unit -> start_import_request
val make_start_event_data_store_ingestion_response : unit -> unit
val make_start_event_data_store_ingestion_request :
  event_data_store:string -> unit -> start_event_data_store_ingestion_request
val make_start_dashboard_refresh_response :
  ?refresh_id:string -> unit -> start_dashboard_refresh_response
val make_start_dashboard_refresh_request :
  ?query_parameter_values:query_parameter_values ->
    dashboard_id:string -> unit -> start_dashboard_refresh_request
val make_source_config :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?apply_to_all_regions:bool -> unit -> source_config
val make_search_sample_queries_response :
  ?next_token:string ->
    ?search_results:search_sample_queries_search_result list ->
      unit -> search_sample_queries_response
val make_search_sample_queries_request :
  ?next_token:string ->
    ?max_results:int ->
      search_phrase:string -> unit -> search_sample_queries_request
val make_restore_event_data_store_response :
  ?billing_mode:billing_mode ->
    ?kms_key_id:string ->
      ?updated_timestamp:CoreTypes.Timestamp.t ->
        ?created_timestamp:CoreTypes.Timestamp.t ->
          ?termination_protection_enabled:bool ->
            ?retention_period:int ->
              ?organization_enabled:bool ->
                ?multi_region_enabled:bool ->
                  ?advanced_event_selectors:advanced_event_selector list ->
                    ?status:event_data_store_status ->
                      ?name:string ->
                        ?event_data_store_arn:string ->
                          unit -> restore_event_data_store_response
val make_restore_event_data_store_request :
  event_data_store:string -> unit -> restore_event_data_store_request
val make_resource_tag :
  ?tags_list:tag list -> ?resource_id:string -> unit -> resource_tag
val make_resource :
  ?resource_name:string -> ?resource_type:string -> unit -> resource
val make_remove_tags_response : unit -> unit
val make_remove_tags_request :
  tags_list:tag list -> resource_id:string -> unit -> remove_tags_request
val make_register_organization_delegated_admin_response : unit -> unit
val make_register_organization_delegated_admin_request :
  member_account_id:string ->
    unit -> register_organization_delegated_admin_request
val make_query_statistics_for_describe_query :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?execution_time_in_millis:int ->
      ?bytes_scanned:int ->
        ?events_scanned:int ->
          ?events_matched:int -> unit -> query_statistics_for_describe_query
val make_query_statistics :
  ?bytes_scanned:int ->
    ?total_results_count:int ->
      ?results_count:int -> unit -> query_statistics
val make_query :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?query_status:query_status -> ?query_id:string -> unit -> query
val make_put_resource_policy_response :
  ?delegated_admin_resource_policy:string ->
    ?resource_policy:string ->
      ?resource_arn:string -> unit -> put_resource_policy_response
val make_put_resource_policy_request :
  resource_policy:string ->
    resource_arn:string -> unit -> put_resource_policy_request
val make_insight_selector :
  ?insight_type:insight_type -> unit -> insight_selector
val make_put_insight_selectors_response :
  ?insights_destination:string ->
    ?event_data_store_arn:string ->
      ?insight_selectors:insight_selector list ->
        ?trail_ar_n:string -> unit -> put_insight_selectors_response
val make_put_insight_selectors_request :
  ?insights_destination:string ->
    ?event_data_store:string ->
      ?trail_name:string ->
        insight_selectors:insight_selector list ->
          unit -> put_insight_selectors_request
val make_data_resource :
  ?values:string list -> ?type_:string -> unit -> data_resource
val make_event_selector :
  ?exclude_management_event_sources:string list ->
    ?data_resources:data_resource list ->
      ?include_management_events:bool ->
        ?read_write_type:read_write_type -> unit -> event_selector
val make_put_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?event_selectors:event_selector list ->
      ?trail_ar_n:string -> unit -> put_event_selectors_response
val make_put_event_selectors_request :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?event_selectors:event_selector list ->
      trail_name:string -> unit -> put_event_selectors_request
val make_context_key_selector :
  equals:string list -> type_:type_ -> unit -> context_key_selector
val make_put_event_configuration_response :
  ?context_key_selectors:context_key_selector list ->
    ?max_event_size:max_event_size ->
      ?event_data_store_arn:string ->
        unit -> put_event_configuration_response
val make_put_event_configuration_request :
  ?event_data_store:string ->
    context_key_selectors:context_key_selector list ->
      max_event_size:max_event_size ->
        unit -> put_event_configuration_request
val make_public_key :
  ?fingerprint:string ->
    ?validity_end_time:CoreTypes.Timestamp.t ->
      ?validity_start_time:CoreTypes.Timestamp.t ->
        ?value:bytes -> unit -> public_key
val make_partition_key : type_:string -> name:string -> unit -> partition_key
val make_event :
  ?cloud_trail_event:string ->
    ?resources:resource list ->
      ?username:string ->
        ?event_source:string ->
          ?event_time:CoreTypes.Timestamp.t ->
            ?access_key_id:string ->
              ?read_only:string ->
                ?event_name:string -> ?event_id:string -> unit -> event
val make_lookup_events_response :
  ?next_token:string -> ?events:event list -> unit -> lookup_events_response
val make_lookup_attribute :
  attribute_value:string ->
    attribute_key:lookup_attribute_key -> unit -> lookup_attribute
val make_lookup_events_request :
  ?next_token:string ->
    ?max_results:int ->
      ?event_category:event_category ->
        ?end_time:CoreTypes.Timestamp.t ->
          ?start_time:CoreTypes.Timestamp.t ->
            ?lookup_attributes:lookup_attribute list ->
              unit -> lookup_events_request
val make_list_trails_response :
  ?next_token:string ->
    ?trails:trail_info list -> unit -> list_trails_response
val make_list_trails_request :
  ?next_token:string -> unit -> list_trails_request
val make_list_tags_response :
  ?next_token:string ->
    ?resource_tag_list:resource_tag list -> unit -> list_tags_response
val make_list_tags_request :
  ?next_token:string ->
    resource_id_list:string list -> unit -> list_tags_request
val make_list_queries_response :
  ?next_token:string -> ?queries:query list -> unit -> list_queries_response
val make_list_queries_request :
  ?query_status:query_status ->
    ?end_time:CoreTypes.Timestamp.t ->
      ?start_time:CoreTypes.Timestamp.t ->
        ?max_results:int ->
          ?next_token:string ->
            event_data_store:string -> unit -> list_queries_request
val make_list_public_keys_response :
  ?next_token:string ->
    ?public_key_list:public_key list -> unit -> list_public_keys_response
val make_list_public_keys_request :
  ?next_token:string ->
    ?end_time:CoreTypes.Timestamp.t ->
      ?start_time:CoreTypes.Timestamp.t -> unit -> list_public_keys_request
val make_list_insights_metric_data_response :
  ?next_token:string ->
    ?values:float list ->
      ?timestamps:CoreTypes.Timestamp.t list ->
        ?error_code:string ->
          ?insight_type:insight_type ->
            ?event_name:string ->
              ?event_source:string ->
                unit -> list_insights_metric_data_response
val make_list_insights_metric_data_request :
  ?next_token:string ->
    ?max_results:int ->
      ?data_type:insights_metric_data_type ->
        ?period:int ->
          ?end_time:CoreTypes.Timestamp.t ->
            ?start_time:CoreTypes.Timestamp.t ->
              ?error_code:string ->
                insight_type:insight_type ->
                  event_name:string ->
                    event_source:string ->
                      unit -> list_insights_metric_data_request
val make_imports_list_item :
  ?updated_timestamp:CoreTypes.Timestamp.t ->
    ?created_timestamp:CoreTypes.Timestamp.t ->
      ?destinations:string list ->
        ?import_status:import_status ->
          ?import_id:string -> unit -> imports_list_item
val make_list_imports_response :
  ?next_token:string ->
    ?imports:imports_list_item list -> unit -> list_imports_response
val make_list_imports_request :
  ?next_token:string ->
    ?import_status:import_status ->
      ?destination:string -> ?max_results:int -> unit -> list_imports_request
val make_import_failure_list_item :
  ?last_updated_time:CoreTypes.Timestamp.t ->
    ?error_message:string ->
      ?error_type:string ->
        ?status:import_failure_status ->
          ?location:string -> unit -> import_failure_list_item
val make_list_import_failures_response :
  ?next_token:string ->
    ?failures:import_failure_list_item list ->
      unit -> list_import_failures_response
val make_list_import_failures_request :
  ?next_token:string ->
    ?max_results:int ->
      import_id:string -> unit -> list_import_failures_request
val make_event_data_store :
  ?updated_timestamp:CoreTypes.Timestamp.t ->
    ?created_timestamp:CoreTypes.Timestamp.t ->
      ?retention_period:int ->
        ?organization_enabled:bool ->
          ?multi_region_enabled:bool ->
            ?advanced_event_selectors:advanced_event_selector list ->
              ?status:event_data_store_status ->
                ?termination_protection_enabled:bool ->
                  ?name:string ->
                    ?event_data_store_arn:string -> unit -> event_data_store
val make_list_event_data_stores_response :
  ?next_token:string ->
    ?event_data_stores:event_data_store list ->
      unit -> list_event_data_stores_response
val make_list_event_data_stores_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_event_data_stores_request
val make_dashboard_detail :
  ?type_:dashboard_type -> ?dashboard_arn:string -> unit -> dashboard_detail
val make_list_dashboards_response :
  ?next_token:string ->
    ?dashboards:dashboard_detail list -> unit -> list_dashboards_response
val make_list_dashboards_request :
  ?max_results:int ->
    ?next_token:string ->
      ?type_:dashboard_type ->
        ?name_prefix:string -> unit -> list_dashboards_request
val make_channel : ?name:string -> ?channel_arn:string -> unit -> channel
val make_list_channels_response :
  ?next_token:string ->
    ?channels:channel list -> unit -> list_channels_response
val make_list_channels_request :
  ?next_token:string -> ?max_results:int -> unit -> list_channels_request
val make_ingestion_status :
  ?latest_ingestion_attempt_event_i_d:string ->
    ?latest_ingestion_attempt_time:CoreTypes.Timestamp.t ->
      ?latest_ingestion_error_code:string ->
        ?latest_ingestion_success_event_i_d:string ->
          ?latest_ingestion_success_time:CoreTypes.Timestamp.t ->
            unit -> ingestion_status
val make_get_trail_status_response :
  ?time_logging_stopped:string ->
    ?time_logging_started:string ->
      ?latest_delivery_attempt_succeeded:string ->
        ?latest_notification_attempt_succeeded:string ->
          ?latest_notification_attempt_time:string ->
            ?latest_delivery_attempt_time:string ->
              ?latest_digest_delivery_error:string ->
                ?latest_digest_delivery_time:CoreTypes.Timestamp.t ->
                  ?latest_cloud_watch_logs_delivery_time:CoreTypes.Timestamp.t
                    ->
                    ?latest_cloud_watch_logs_delivery_error:string ->
                      ?stop_logging_time:CoreTypes.Timestamp.t ->
                        ?start_logging_time:CoreTypes.Timestamp.t ->
                          ?latest_notification_time:CoreTypes.Timestamp.t ->
                            ?latest_delivery_time:CoreTypes.Timestamp.t ->
                              ?latest_notification_error:string ->
                                ?latest_delivery_error:string ->
                                  ?is_logging:bool ->
                                    unit -> get_trail_status_response
val make_get_trail_status_request :
  name:string -> unit -> get_trail_status_request
val make_get_trail_response : ?trail:trail -> unit -> get_trail_response
val make_get_trail_request : name:string -> unit -> get_trail_request
val make_get_resource_policy_response :
  ?delegated_admin_resource_policy:string ->
    ?resource_policy:string ->
      ?resource_arn:string -> unit -> get_resource_policy_response
val make_get_resource_policy_request :
  resource_arn:string -> unit -> get_resource_policy_request
val make_get_query_results_response :
  ?error_message:string ->
    ?next_token:string ->
      ?query_result_rows:query_result_column list list ->
        ?query_statistics:query_statistics ->
          ?query_status:query_status -> unit -> get_query_results_response
val make_get_query_results_request :
  ?event_data_store_owner_account_id:string ->
    ?max_query_results:int ->
      ?next_token:string ->
        ?event_data_store:string ->
          query_id:string -> unit -> get_query_results_request
val make_get_insight_selectors_response :
  ?insights_destination:string ->
    ?event_data_store_arn:string ->
      ?insight_selectors:insight_selector list ->
        ?trail_ar_n:string -> unit -> get_insight_selectors_response
val make_get_insight_selectors_request :
  ?event_data_store:string ->
    ?trail_name:string -> unit -> get_insight_selectors_request
val make_get_import_response :
  ?import_statistics:import_statistics ->
    ?updated_timestamp:CoreTypes.Timestamp.t ->
      ?created_timestamp:CoreTypes.Timestamp.t ->
        ?import_status:import_status ->
          ?end_event_time:CoreTypes.Timestamp.t ->
            ?start_event_time:CoreTypes.Timestamp.t ->
              ?import_source:import_source ->
                ?destinations:string list ->
                  ?import_id:string -> unit -> get_import_response
val make_get_import_request : import_id:string -> unit -> get_import_request
val make_get_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?event_selectors:event_selector list ->
      ?trail_ar_n:string -> unit -> get_event_selectors_response
val make_get_event_selectors_request :
  trail_name:string -> unit -> get_event_selectors_request
val make_get_event_data_store_response :
  ?partition_keys:partition_key list ->
    ?federation_role_arn:string ->
      ?federation_status:federation_status ->
        ?billing_mode:billing_mode ->
          ?kms_key_id:string ->
            ?updated_timestamp:CoreTypes.Timestamp.t ->
              ?created_timestamp:CoreTypes.Timestamp.t ->
                ?termination_protection_enabled:bool ->
                  ?retention_period:int ->
                    ?organization_enabled:bool ->
                      ?multi_region_enabled:bool ->
                        ?advanced_event_selectors:advanced_event_selector
                          list ->
                          ?status:event_data_store_status ->
                            ?name:string ->
                              ?event_data_store_arn:string ->
                                unit -> get_event_data_store_response
val make_get_event_data_store_request :
  event_data_store:string -> unit -> get_event_data_store_request
val make_get_event_configuration_response :
  ?context_key_selectors:context_key_selector list ->
    ?max_event_size:max_event_size ->
      ?event_data_store_arn:string ->
        unit -> get_event_configuration_response
val make_get_event_configuration_request :
  ?event_data_store:string -> unit -> get_event_configuration_request
val make_get_dashboard_response :
  ?termination_protection_enabled:bool ->
    ?last_refresh_failure_reason:string ->
      ?last_refresh_id:string ->
        ?updated_timestamp:CoreTypes.Timestamp.t ->
          ?created_timestamp:CoreTypes.Timestamp.t ->
            ?refresh_schedule:refresh_schedule ->
              ?widgets:widget list ->
                ?status:dashboard_status ->
                  ?type_:dashboard_type ->
                    ?dashboard_arn:string -> unit -> get_dashboard_response
val make_get_dashboard_request :
  dashboard_id:string -> unit -> get_dashboard_request
val make_get_channel_response :
  ?ingestion_status:ingestion_status ->
    ?destinations:destination list ->
      ?source_config:source_config ->
        ?source:string ->
          ?name:string -> ?channel_arn:string -> unit -> get_channel_response
val make_get_channel_request : channel:string -> unit -> get_channel_request
val make_generate_query_response :
  ?event_data_store_owner_account_id:string ->
    ?query_alias:string ->
      ?query_statement:string -> unit -> generate_query_response
val make_generate_query_request :
  prompt:string ->
    event_data_stores:string list -> unit -> generate_query_request
val make_enable_federation_response :
  ?federation_role_arn:string ->
    ?federation_status:federation_status ->
      ?event_data_store_arn:string -> unit -> enable_federation_response
val make_enable_federation_request :
  federation_role_arn:string ->
    event_data_store:string -> unit -> enable_federation_request
val make_disable_federation_response :
  ?federation_status:federation_status ->
    ?event_data_store_arn:string -> unit -> disable_federation_response
val make_disable_federation_request :
  event_data_store:string -> unit -> disable_federation_request
val make_describe_trails_response :
  ?trail_list:trail list -> unit -> describe_trails_response
val make_describe_trails_request :
  ?include_shadow_trails:bool ->
    ?trail_name_list:string list -> unit -> describe_trails_request
val make_describe_query_response :
  ?event_data_store_owner_account_id:string ->
    ?prompt:string ->
      ?delivery_status:delivery_status ->
        ?delivery_s3_uri:string ->
          ?error_message:string ->
            ?query_statistics:query_statistics_for_describe_query ->
              ?query_status:query_status ->
                ?query_string:string ->
                  ?query_id:string -> unit -> describe_query_response
val make_describe_query_request :
  ?event_data_store_owner_account_id:string ->
    ?refresh_id:string ->
      ?query_alias:string ->
        ?query_id:string ->
          ?event_data_store:string -> unit -> describe_query_request
val make_deregister_organization_delegated_admin_response : unit -> unit
val make_deregister_organization_delegated_admin_request :
  delegated_admin_account_id:string ->
    unit -> deregister_organization_delegated_admin_request
val make_delete_trail_response : unit -> unit
val make_delete_trail_request : name:string -> unit -> delete_trail_request
val make_delete_resource_policy_response : unit -> unit
val make_delete_resource_policy_request :
  resource_arn:string -> unit -> delete_resource_policy_request
val make_delete_event_data_store_response : unit -> unit
val make_delete_event_data_store_request :
  event_data_store:string -> unit -> delete_event_data_store_request
val make_delete_dashboard_response : unit -> unit
val make_delete_dashboard_request :
  dashboard_id:string -> unit -> delete_dashboard_request
val make_delete_channel_response : unit -> unit
val make_delete_channel_request :
  channel:string -> unit -> delete_channel_request
val make_create_trail_response :
  ?is_organization_trail:bool ->
    ?kms_key_id:string ->
      ?cloud_watch_logs_role_arn:string ->
        ?cloud_watch_logs_log_group_arn:string ->
          ?log_file_validation_enabled:bool ->
            ?trail_ar_n:string ->
              ?is_multi_region_trail:bool ->
                ?include_global_service_events:bool ->
                  ?sns_topic_ar_n:string ->
                    ?sns_topic_name:string ->
                      ?s3_key_prefix:string ->
                        ?s3_bucket_name:string ->
                          ?name:string -> unit -> create_trail_response
val make_create_trail_request :
  ?tags_list:tag list ->
    ?is_organization_trail:bool ->
      ?kms_key_id:string ->
        ?cloud_watch_logs_role_arn:string ->
          ?cloud_watch_logs_log_group_arn:string ->
            ?enable_log_file_validation:bool ->
              ?is_multi_region_trail:bool ->
                ?include_global_service_events:bool ->
                  ?sns_topic_name:string ->
                    ?s3_key_prefix:string ->
                      s3_bucket_name:string ->
                        name:string -> unit -> create_trail_request
val make_create_event_data_store_response :
  ?billing_mode:billing_mode ->
    ?kms_key_id:string ->
      ?updated_timestamp:CoreTypes.Timestamp.t ->
        ?created_timestamp:CoreTypes.Timestamp.t ->
          ?tags_list:tag list ->
            ?termination_protection_enabled:bool ->
              ?retention_period:int ->
                ?organization_enabled:bool ->
                  ?multi_region_enabled:bool ->
                    ?advanced_event_selectors:advanced_event_selector list ->
                      ?status:event_data_store_status ->
                        ?name:string ->
                          ?event_data_store_arn:string ->
                            unit -> create_event_data_store_response
val make_create_event_data_store_request :
  ?billing_mode:billing_mode ->
    ?start_ingestion:bool ->
      ?kms_key_id:string ->
        ?tags_list:tag list ->
          ?termination_protection_enabled:bool ->
            ?retention_period:int ->
              ?organization_enabled:bool ->
                ?multi_region_enabled:bool ->
                  ?advanced_event_selectors:advanced_event_selector list ->
                    name:string -> unit -> create_event_data_store_request
val make_create_dashboard_response :
  ?termination_protection_enabled:bool ->
    ?refresh_schedule:refresh_schedule ->
      ?tags_list:tag list ->
        ?widgets:widget list ->
          ?type_:dashboard_type ->
            ?name:string ->
              ?dashboard_arn:string -> unit -> create_dashboard_response
val make_create_dashboard_request :
  ?widgets:request_widget list ->
    ?termination_protection_enabled:bool ->
      ?tags_list:tag list ->
        ?refresh_schedule:refresh_schedule ->
          name:string -> unit -> create_dashboard_request
val make_create_channel_response :
  ?tags:tag list ->
    ?destinations:destination list ->
      ?source:string ->
        ?name:string ->
          ?channel_arn:string -> unit -> create_channel_response
val make_create_channel_request :
  ?tags:tag list ->
    destinations:destination list ->
      source:string -> name:string -> unit -> create_channel_request
val make_cancel_query_response :
  ?event_data_store_owner_account_id:string ->
    query_status:query_status ->
      query_id:string -> unit -> cancel_query_response
val make_cancel_query_request :
  ?event_data_store_owner_account_id:string ->
    ?event_data_store:string ->
      query_id:string -> unit -> cancel_query_request
val make_add_tags_response : unit -> unit
val make_add_tags_request :
  tags_list:tag list -> resource_id:string -> unit -> add_tags_request(** {1:operations Operations} *)

module AddTags :
sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelARNInvalidException of channel_arn_invalid_exception 
          | `ChannelNotFoundException of channel_not_found_exception 
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `ConflictException of conflict_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidTagParameterException of invalid_tag_parameter_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourceTypeNotSupportedException of
              resource_type_not_supported_exception 
          | `TagsLimitExceededException of tags_limit_exceeded_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Adds one or more tags to a trail, event data store, dashboard, or channel, up to a limit of 50. Overwrites an existing tag's value when a new value is specified for an existing tag key. Tag key names must be unique; you cannot have two keys with the same name but different values. If you specify a key without a value, the tag will be created with the specified key and a value of null. You can tag a trail or event data store that applies to all Amazon Web Services Regions only from the Region in which the trail or event data store was created (also known as its home Region).\n"]
module CancelQuery :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_query_request ->
        (cancel_query_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InactiveQueryException of inactive_query_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `QueryIdNotFoundException of query_id_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Cancels a query if the query is not in a terminated state, such as [CANCELLED], [FAILED], [TIMED_OUT], or [FINISHED]. You must specify an ARN value for [EventDataStore]. The ID of the query that you want to cancel is also required. When you run [CancelQuery], the query status might show as [CANCELLED] even if the operation is not yet finished.\n"]
module CreateChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_channel_request ->
        (create_channel_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelAlreadyExistsException of
              channel_already_exists_exception 
          | `ChannelMaxLimitExceededException of
              channel_max_limit_exceeded_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidEventDataStoreCategoryException of
              invalid_event_data_store_category_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidSourceException of invalid_source_exception 
          | `InvalidTagParameterException of invalid_tag_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `TagsLimitExceededException of tags_limit_exceeded_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Creates a channel for CloudTrail to ingest events from a partner or external source. After you create a channel, a CloudTrail Lake event data store can log events from the partner or source that you specify.\n"]
module CreateDashboard :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_dashboard_request ->
        (create_dashboard_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InvalidQueryStatementException of
              invalid_query_statement_exception 
          | `InvalidTagParameterException of invalid_tag_parameter_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Creates a custom dashboard or the Highlights dashboard. \n\n {ul\n       {-   {b Custom dashboards} - Custom dashboards allow you to query events in any event data store type. You can add up to 10 widgets to a custom dashboard. You can manually refresh a custom dashboard, or you can set a refresh schedule.\n           \n            }\n       {-   {b Highlights dashboard} - You can create the Highlights dashboard to see a summary of key user activities and API usage across all your event data stores. CloudTrail Lake manages the Highlights dashboard and refreshes the dashboard every 6 hours. To create the Highlights dashboard, you must set and enable a refresh schedule.\n           \n            }\n       }\n    CloudTrail runs queries to populate the dashboard's widgets during a manual or scheduled refresh. CloudTrail must be granted permissions to run the [StartQuery] operation on your behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a resource-based policy to each event data store. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-eds-dashboard}Example: Allow CloudTrail to run queries to populate a dashboard} in the {i CloudTrail User Guide}. \n   \n     To set a refresh schedule, CloudTrail must be granted permissions to run the [StartDashboardRefresh] operation to refresh the dashboard on your behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a resource-based policy to the dashboard. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-dashboards} Resource-based policy example for a dashboard} in the {i CloudTrail User Guide}. \n    \n     For more information about dashboards, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-dashboard.html}CloudTrail Lake dashboards} in the {i CloudTrail User Guide}.\n     "]
module CreateEventDataStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_data_store_request ->
        (create_event_data_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `ConflictException of conflict_exception 
          | `EventDataStoreAlreadyExistsException of
              event_data_store_already_exists_exception 
          | `EventDataStoreMaxLimitExceededException of
              event_data_store_max_limit_exceeded_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InvalidEventSelectorsException of
              invalid_event_selectors_exception 
          | `InvalidKmsKeyIdException of invalid_kms_key_id_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidTagParameterException of invalid_tag_parameter_exception 
          | `KmsException of kms_exception 
          | `KmsKeyNotFoundException of kms_key_not_found_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Creates a new event data store.\n"]
module CreateTrail :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_trail_request ->
        (create_trail_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `CloudTrailInvalidClientTokenIdException of
              cloud_trail_invalid_client_token_id_exception 
          | `CloudWatchLogsDeliveryUnavailableException of
              cloud_watch_logs_delivery_unavailable_exception 
          | `ConflictException of conflict_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InsufficientS3BucketPolicyException of
              insufficient_s3_bucket_policy_exception 
          | `InsufficientSnsTopicPolicyException of
              insufficient_sns_topic_policy_exception 
          | `InvalidCloudWatchLogsLogGroupArnException of
              invalid_cloud_watch_logs_log_group_arn_exception 
          | `InvalidCloudWatchLogsRoleArnException of
              invalid_cloud_watch_logs_role_arn_exception 
          | `InvalidKmsKeyIdException of invalid_kms_key_id_exception 
          | `InvalidParameterCombinationException of
              invalid_parameter_combination_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception 
          | `InvalidS3PrefixException of invalid_s3_prefix_exception 
          | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception 
          | `InvalidTagParameterException of invalid_tag_parameter_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `KmsException of kms_exception 
          | `KmsKeyDisabledException of kms_key_disabled_exception 
          | `KmsKeyNotFoundException of kms_key_not_found_exception 
          | `MaximumNumberOfTrailsExceededException of
              maximum_number_of_trails_exceeded_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `S3BucketDoesNotExistException of
              s3_bucket_does_not_exist_exception 
          | `TagsLimitExceededException of tags_limit_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailAlreadyExistsException of trail_already_exists_exception 
          | `TrailNotProvidedException of trail_not_provided_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Creates a trail that specifies the settings for delivery of log data to an Amazon S3 bucket. \n"]
module DeleteChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_channel_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelARNInvalidException of channel_arn_invalid_exception 
          | `ChannelNotFoundException of channel_not_found_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Deletes a channel.\n"]
module DeleteDashboard :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_dashboard_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Deletes the specified dashboard. You cannot delete a dashboard that has termination protection enabled. \n"]
module DeleteEventDataStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_data_store_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelExistsForEDSException of channel_exists_for_eds_exception 
          | `ConflictException of conflict_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreFederationEnabledException of
              event_data_store_federation_enabled_exception 
          | `EventDataStoreHasOngoingImportException of
              event_data_store_has_ongoing_import_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `EventDataStoreTerminationProtectedException of
              event_data_store_termination_protected_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Disables the event data store specified by [EventDataStore], which accepts an event data store ARN. After you run [DeleteEventDataStore], the event data store enters a [PENDING_DELETION] state, and is automatically deleted after a wait period of seven days. [TerminationProtectionEnabled] must be set to [False] on the event data store and the [FederationStatus] must be [DISABLED]. You cannot delete an event data store if [TerminationProtectionEnabled] is [True] or the [FederationStatus] is [ENABLED].\n\n After you run [DeleteEventDataStore] on an event data store, you cannot run [ListQueries], [DescribeQuery], or [GetQueryResults] on queries that are using an event data store in a [PENDING_DELETION] state. An event data store in the [PENDING_DELETION] state does not incur costs.\n "]
module DeleteResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ResourceARNNotValidException of resource_arn_not_valid_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourcePolicyNotFoundException of
              resource_policy_not_found_exception 
          | `ResourceTypeNotSupportedException of
              resource_type_not_supported_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Deletes the resource-based policy attached to the CloudTrail event data store, dashboard, or channel. \n"]
module DeleteTrail :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_trail_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `ConflictException of conflict_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidHomeRegionException of invalid_home_region_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Deletes a trail. This operation must be called from the Region in which the trail was created. [DeleteTrail] cannot be called on the shadow trails (replicated trails in other Regions) of a trail that is enabled in all Regions.\n"]
module DeregisterOrganizationDelegatedAdmin :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_organization_delegated_admin_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccountNotFoundException of account_not_found_exception 
          | `AccountNotRegisteredException of
              account_not_registered_exception 
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `ConflictException of conflict_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotOrganizationManagementAccountException of
              not_organization_management_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Removes CloudTrail delegated administrator permissions from a member account in an organization.\n"]
module DescribeQuery :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_request ->
        (describe_query_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `QueryIdNotFoundException of query_id_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns metadata about a query, including query run time in milliseconds, number of events scanned and matched, and query status. If the query results were delivered to an S3 bucket, the response also provides the S3 URI and the delivery status.\n\n You must specify either [QueryId] or [QueryAlias]. Specifying the [QueryAlias] parameter returns information about the last query run for the alias. You can provide [RefreshId] along with [QueryAlias] to view the query results of a dashboard query for the specified [RefreshId].\n "]
module DescribeTrails :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_trails_request ->
        (describe_trails_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Retrieves settings for one or more trails associated with the current Region for your account.\n"]
module DisableFederation :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_federation_request ->
        (disable_federation_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Disables Lake query federation on the specified event data store. When you disable federation, CloudTrail disables the integration with Glue, Lake Formation, and Amazon Athena. After disabling Lake query federation, you can no longer query your event data in Amazon Athena.\n\n No CloudTrail Lake data is deleted when you disable federation and you can continue to run queries in CloudTrail Lake.\n "]
module EnableFederation :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_federation_request ->
        (enable_federation_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreFederationEnabledException of
              event_data_store_federation_enabled_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Enables Lake query federation on the specified event data store. Federating an event data store lets you view the metadata associated with the event data store in the Glue {{:https://docs.aws.amazon.com/glue/latest/dg/components-overview.html#data-catalog-intro}Data Catalog} and run SQL queries against your event data using Amazon Athena. The table metadata stored in the Glue Data Catalog lets the Athena query engine know how to find, read, and process the data that you want to query.\n\n When you enable Lake query federation, CloudTrail creates a managed database named [aws:cloudtrail] (if the database doesn't already exist) and a managed federated table in the Glue Data Catalog. The event data store ID is used for the table name. CloudTrail registers the role ARN and event data store in {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation-lake-formation.html}Lake Formation}, the service responsible for allowing fine-grained access control of the federated resources in the Glue Data Catalog.\n \n  For more information about Lake query federation, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Federate an event data store}.\n  "]
module GenerateQuery :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_query_request ->
        (generate_query_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `GenerateResponseException of generate_response_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Generates a query from a natural language prompt. This operation uses generative artificial intelligence (generative AI) to produce a ready-to-use SQL query from the prompt. \n\n The prompt can be a question or a statement about the event data in your event data store. For example, you can enter prompts like \"What are my top errors in the past month?\" and \226\128\156Give me a list of users that used SNS.\226\128\157\n \n  The prompt must be in English. For information about limitations, permissions, and supported Regions, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/lake-query-generator.html}Create CloudTrail Lake queries from natural language prompts} in the {i CloudTrail } user guide.\n  \n    Do not include any personally identifying, confidential, or sensitive information in your prompts.\n    \n     This feature uses generative AI large language models (LLMs); we recommend double-checking the LLM response.\n     \n      "]
module GetChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_channel_request ->
        (get_channel_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelARNInvalidException of channel_arn_invalid_exception 
          | `ChannelNotFoundException of channel_not_found_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc " Returns information about a specific channel. \n"]
module GetDashboard :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_dashboard_request ->
        (get_dashboard_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc " Returns the specified dashboard. \n"]
module GetEventConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_event_configuration_request ->
        (get_event_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InvalidEventDataStoreCategoryException of
              invalid_event_data_store_category_exception 
          | `InvalidEventDataStoreStatusException of
              invalid_event_data_store_status_exception 
          | `InvalidParameterCombinationException of
              invalid_parameter_combination_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Retrieves the current event configuration settings for the specified event data store, including details about maximum event size and context key selectors configured for the event data store.\n"]
module GetEventDataStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_event_data_store_request ->
        (get_event_data_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns information about an event data store specified as either an ARN or the ID portion of the ARN.\n"]
module GetEventSelectors :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_event_selectors_request ->
        (get_event_selectors_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Describes the settings for the event selectors that you configured for your trail. The information returned for your event selectors includes the following:\n\n {ul\n       {-  If your event selector includes read-only events, write-only events, or all events. This applies to management events, data events, and network activity events.\n           \n            }\n       {-  If your event selector includes management events.\n           \n            }\n       {-  If your event selector includes network activity events, the event sources for which you are logging network activity events.\n           \n            }\n       {-  If your event selector includes data events, the resources on which you are logging data events.\n           \n            }\n       }\n   For more information about logging management, data, and network activity events, see the following topics in the {i CloudTrail User Guide}:\n   \n    {ul\n          {-   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events} \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events} \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-network-events-with-cloudtrail.html}Logging network activity events} \n              \n               }\n          }\n  "]
module GetImport :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_import_request ->
        (get_import_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ImportNotFoundException of import_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc " Returns information about a specific import. \n"]
module GetInsightSelectors :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_insight_selectors_request ->
        (get_insight_selectors_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `InsightNotEnabledException of insight_not_enabled_exception 
          | `InvalidParameterCombinationException of
              invalid_parameter_combination_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Describes the settings for the Insights event selectors that you configured for your trail or event data store. [GetInsightSelectors] shows if CloudTrail Insights event logging is enabled on the trail or event data store, and if it is, which Insights types are enabled. If you run [GetInsightSelectors] on a trail or event data store that does not have Insights events enabled, the operation throws the exception [InsightNotEnabledException] \n\n Specify either the [EventDataStore] parameter to get Insights event selectors for an event data store, or the [TrailName] parameter to the get Insights event selectors for a trail. You cannot specify these parameters together.\n \n  For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Working with CloudTrail Insights} in the {i CloudTrail User Guide}.\n  "]
module GetQueryResults :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_query_results_request ->
        (get_query_results_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InvalidMaxResultsException of invalid_max_results_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `QueryIdNotFoundException of query_id_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Gets event data results of a query. You must specify the [QueryID] value returned by the [StartQuery] operation.\n"]
module GetResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policy_request ->
        (get_resource_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ResourceARNNotValidException of resource_arn_not_valid_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourcePolicyNotFoundException of
              resource_policy_not_found_exception 
          | `ResourceTypeNotSupportedException of
              resource_type_not_supported_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Retrieves the JSON text of the resource-based policy document attached to the CloudTrail event data store, dashboard, or channel. \n"]
module GetTrail :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_trail_request ->
        (get_trail_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Returns settings information for a specified trail.\n"]
module GetTrailStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_trail_status_request ->
        (get_trail_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns a JSON-formatted list of information about the specified trail. Fields include information on delivery errors, Amazon SNS and Amazon S3 errors, and start and stop logging times for each trail. This operation returns trail status from a single Region. To return trail status from all Regions, you must call the operation on each Region.\n"]
module ListChannels :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_channels_request ->
        (list_channels_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Lists the channels in the current account, and their source names. \n"]
module ListDashboards :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_dashboards_request ->
        (list_dashboards_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Returns information about all dashboards in the account, in the current Region. \n"]
module ListEventDataStores :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_data_stores_request ->
        (list_event_data_stores_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidMaxResultsException of invalid_max_results_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns information about all event data stores in the account, in the current Region.\n"]
module ListImportFailures :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_import_failures_request ->
        (list_import_failures_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc " Returns a list of failures for the specified import. \n"]
module ListImports :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_imports_request ->
        (list_imports_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Returns information on all imports, or a select set of imports by [ImportStatus] or [Destination]. \n"]
module ListInsightsMetricData :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_insights_metric_data_request ->
        (list_insights_metric_data_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns Insights metrics data for trails that have enabled Insights. The request must include the [EventSource], [EventName], and [InsightType] parameters.\n\n If the [InsightType] is set to [ApiErrorRateInsight], the request must also include the [ErrorCode] parameter.\n \n  The following are the available time periods for [ListInsightsMetricData]. Each cutoff is inclusive.\n  \n   {ul\n         {-  Data points with a period of 60 seconds (1-minute) are available for 15 days.\n             \n              }\n         {-  Data points with a period of 300 seconds (5-minute) are available for 63 days.\n             \n              }\n         {-  Data points with a period of 3600 seconds (1 hour) are available for 90 days.\n             \n              }\n         }\n   Access to the [ListInsightsMetricData] API operation is linked to the [cloudtrail:LookupEvents] action. To use this operation, you must have permissions to perform the [cloudtrail:LookupEvents] action.\n   "]
module ListPublicKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_public_keys_request ->
        (list_public_keys_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidTimeRangeException of invalid_time_range_exception 
          | `InvalidTokenException of invalid_token_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns all public keys whose private keys were used to sign the digest files within the specified time range. The public key is needed to validate digest files that were signed with its corresponding private key.\n\n  CloudTrail uses different private and public key pairs per Region. Each digest file is signed with a private key unique to its Region. When you validate a digest file from a specific Region, you must look in the same Region for its corresponding public key.\n  \n   "]
module ListQueries :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_queries_request ->
        (list_queries_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidDateRangeException of invalid_date_range_exception 
          | `InvalidMaxResultsException of invalid_max_results_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidQueryStatusException of invalid_query_status_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Returns a list of queries and query statuses for the past seven days. You must specify an ARN value for [EventDataStore]. Optionally, to shorten the list of results, you can specify a time range, formatted as timestamps, by adding [StartTime] and [EndTime] parameters, and a [QueryStatus] value. Valid values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].\n"]
module ListTags :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_request ->
        (list_tags_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelARNInvalidException of channel_arn_invalid_exception 
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidTokenException of invalid_token_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourceTypeNotSupportedException of
              resource_type_not_supported_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Lists the tags for the specified trails, event data stores, dashboards, or channels in the current Region.\n"]
module ListTrails :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_trails_request ->
        (list_trails_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Lists trails that are in the current account.\n"]
module LookupEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      lookup_events_request ->
        (lookup_events_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidEventCategoryException of
              invalid_event_category_exception 
          | `InvalidLookupAttributesException of
              invalid_lookup_attributes_exception 
          | `InvalidMaxResultsException of invalid_max_results_exception 
          | `InvalidNextTokenException of invalid_next_token_exception 
          | `InvalidTimeRangeException of invalid_time_range_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Looks up {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-management-events}management events} or {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-insights-events}CloudTrail Insights events} that are captured by CloudTrail. You can look up events that occurred in a Region within the last 90 days.\n\n   [LookupEvents] returns recent Insights events for trails that enable Insights. To view Insights events for an event data store, you can run queries on your Insights event data store, and you can also view the Lake dashboard for Insights.\n  \n    Lookup supports the following attributes for management events:\n    \n     {ul\n           {-  Amazon Web Services access key\n               \n                }\n           {-  Event ID\n               \n                }\n           {-  Event name\n               \n                }\n           {-  Event source\n               \n                }\n           {-  Read only\n               \n                }\n           {-  Resource name\n               \n                }\n           {-  Resource type\n               \n                }\n           {-  User name\n               \n                }\n           }\n   Lookup supports the following attributes for Insights events:\n   \n    {ul\n          {-  Event ID\n              \n               }\n          {-  Event name\n              \n               }\n          {-  Event source\n              \n               }\n          }\n   All attributes are optional. The default number of results returned is 50, with a maximum of 50 possible. The response includes a token that you can use to get the next page of results.\n   \n     The rate of lookup requests is limited to two per second, per account, per Region. If this limit is exceeded, a throttling error occurs.\n     \n      "]
module PutEventConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_event_configuration_request ->
        (put_event_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `ConflictException of conflict_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InsufficientIAMAccessPermissionException of
              insufficient_iam_access_permission_exception 
          | `InvalidEventDataStoreCategoryException of
              invalid_event_data_store_category_exception 
          | `InvalidEventDataStoreStatusException of
              invalid_event_data_store_status_exception 
          | `InvalidParameterCombinationException of
              invalid_parameter_combination_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ThrottlingException of throttling_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Updates the event configuration settings for the specified event data store. You can update the maximum event size and context key selectors.\n"]
module PutEventSelectors :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_event_selectors_request ->
        (put_event_selectors_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `ConflictException of conflict_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidEventSelectorsException of
              invalid_event_selectors_exception 
          | `InvalidHomeRegionException of invalid_home_region_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Configures event selectors (also referred to as {i basic event selectors}) or advanced event selectors for your trail. You can use either [AdvancedEventSelectors] or [EventSelectors], but not both. If you apply [AdvancedEventSelectors] to a trail, any existing [EventSelectors] are overwritten.\n\n You can use [AdvancedEventSelectors] to log management events, data events for all resource types, and network activity events.\n \n  You can use [EventSelectors] to log management events and data events for the following resource types:\n  \n   {ul\n         {-   [AWS::DynamoDB::Table] \n             \n              }\n         {-   [AWS::Lambda::Function] \n             \n              }\n         {-   [AWS::S3::Object] \n             \n              }\n         }\n   You can't use [EventSelectors] to log network activity events.\n   \n    If you want your trail to log Insights events, be sure the event selector or advanced event selector enables logging of the Insights event types you want configured for your trail. For more information about logging Insights events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Working with CloudTrail Insights} in the {i CloudTrail User Guide}. By default, trails created without specific event selectors are configured to log all read and write management events, and no data events or network activity events.\n    \n     When an event occurs in your account, CloudTrail evaluates the event selectors or advanced event selectors in all trails. For each trail, if the event matches any event selector, the trail processes and logs the event. If the event doesn't match any event selector, the trail doesn't log the event.\n     \n      Example\n      \n       {ol\n             {-  You create an event selector for a trail and specify that you want to log write-only events.\n                 \n                  }\n             {-  The EC2 [GetConsoleOutput] and [RunInstances] API operations occur in your account.\n                 \n                  }\n             {-  CloudTrail evaluates whether the events match your event selectors.\n                 \n                  }\n             {-  The [RunInstances] is a write-only event and it matches your event selector. The trail logs the event.\n                 \n                  }\n             {-  The [GetConsoleOutput] is a read-only event that doesn't match your event selector. The trail doesn't log the event. \n                 \n                  }\n             }\n   The [PutEventSelectors] operation must be called from the Region in which the trail was created; otherwise, an [InvalidHomeRegionException] exception is thrown.\n   \n    You can configure up to five event selectors for each trail.\n    \n     You can add advanced event selectors, and conditions for your advanced event selectors, up to a maximum of 500 values for all conditions and selectors on a trail. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events}, {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events}, {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-network-events-with-cloudtrail.html}Logging network activity events}, and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html}Quotas in CloudTrail} in the {i CloudTrail User Guide}.\n     "]
module PutInsightSelectors :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_insight_selectors_request ->
        (put_insight_selectors_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InsufficientS3BucketPolicyException of
              insufficient_s3_bucket_policy_exception 
          | `InvalidHomeRegionException of invalid_home_region_exception 
          | `InvalidInsightSelectorsException of
              invalid_insight_selectors_exception 
          | `InvalidParameterCombinationException of
              invalid_parameter_combination_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `KmsException of kms_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `S3BucketDoesNotExistException of
              s3_bucket_does_not_exist_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Lets you enable Insights event logging by specifying the Insights selectors that you want to enable on an existing trail or event data store. You also use [PutInsightSelectors] to turn off Insights event logging, by passing an empty list of Insights types. The valid Insights event types are [ApiErrorRateInsight] and [ApiCallRateInsight].\n\n To enable Insights on an event data store, you must specify the ARNs (or ID suffix of the ARNs) for the source event data store ([EventDataStore]) and the destination event data store ([InsightsDestination]). The source event data store logs management events and enables Insights. The destination event data store logs Insights events based upon the management event activity of the source event data store. The source and destination event data stores must belong to the same Amazon Web Services account.\n \n  To log Insights events for a trail, you must specify the name ([TrailName]) of the CloudTrail trail for which you want to change or add Insights selectors.\n  \n   To log CloudTrail Insights events on API call volume, the trail or event data store must log [write] management events. To log CloudTrail Insights events on API error rate, the trail or event data store must log [read] or [write] management events. You can call [GetEventSelectors] on a trail to check whether the trail logs management events. You can call [GetEventDataStore] on an event data store to check whether the event data store logs management events.\n   \n    For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Working with CloudTrail Insights} in the {i CloudTrail User Guide}.\n    "]
module PutResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_request ->
        (put_resource_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ResourceARNNotValidException of resource_arn_not_valid_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourcePolicyNotValidException of
              resource_policy_not_valid_exception 
          | `ResourceTypeNotSupportedException of
              resource_type_not_supported_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Attaches a resource-based permission policy to a CloudTrail event data store, dashboard, or channel. For more information about resource-based policies, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html}CloudTrail resource-based policy examples} in the {i CloudTrail User Guide}. \n"]
module RegisterOrganizationDelegatedAdmin :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_organization_delegated_admin_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccountNotFoundException of account_not_found_exception 
          | `AccountRegisteredException of account_registered_exception 
          | `CannotDelegateManagementAccountException of
              cannot_delegate_management_account_exception 
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `ConflictException of conflict_exception 
          | `DelegatedAdminAccountLimitExceededException of
              delegated_admin_account_limit_exceeded_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InsufficientIAMAccessPermissionException of
              insufficient_iam_access_permission_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NotOrganizationManagementAccountException of
              not_organization_management_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Registers an organization\226\128\153s member account as the CloudTrail {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-delegated-administrator.html}delegated administrator}.\n"]
module RemoveTags :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelARNInvalidException of channel_arn_invalid_exception 
          | `ChannelNotFoundException of channel_not_found_exception 
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `ConflictException of conflict_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidTagParameterException of invalid_tag_parameter_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourceTypeNotSupportedException of
              resource_type_not_supported_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Removes the specified tags from a trail, event data store, dashboard, or channel.\n"]
module RestoreEventDataStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      restore_event_data_store_request ->
        (restore_event_data_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreMaxLimitExceededException of
              event_data_store_max_limit_exceeded_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidEventDataStoreStatusException of
              invalid_event_data_store_status_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Restores a deleted event data store specified by [EventDataStore], which accepts an event data store ARN. You can only restore a deleted event data store within the seven-day wait period after deletion. Restoring an event data store can take several minutes, depending on the size of the event data store.\n"]
module SearchSampleQueries :
sig
  val request :
    Smaws_Lib.Context.t ->
      search_sample_queries_request ->
        (search_sample_queries_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Searches sample queries and returns a list of sample queries that are sorted by relevance. To search for sample queries, provide a natural language [SearchPhrase] in English. \n"]
module StartDashboardRefresh :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_dashboard_refresh_request ->
        (start_dashboard_refresh_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Starts a refresh of the specified dashboard. \n\n  Each time a dashboard is refreshed, CloudTrail runs queries to populate the dashboard's widgets. CloudTrail must be granted permissions to run the [StartQuery] operation on your behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a resource-based policy to each event data store. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-eds-dashboard}Example: Allow CloudTrail to run queries to populate a dashboard} in the {i CloudTrail User Guide}. \n "]
module StartEventDataStoreIngestion :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_event_data_store_ingestion_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidEventDataStoreCategoryException of
              invalid_event_data_store_category_exception 
          | `InvalidEventDataStoreStatusException of
              invalid_event_data_store_status_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Starts the ingestion of live events on an event data store specified as either an ARN or the ID portion of the ARN. To start ingestion, the event data store [Status] must be [STOPPED_INGESTION] and the [eventCategory] must be [Management], [Data], [NetworkActivity], or [ConfigurationItem].\n"]
module StartImport :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_import_request ->
        (start_import_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccountHasOngoingImportException of
              account_has_ongoing_import_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `ImportNotFoundException of import_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InvalidEventDataStoreCategoryException of
              invalid_event_data_store_category_exception 
          | `InvalidEventDataStoreStatusException of
              invalid_event_data_store_status_exception 
          | `InvalidImportSourceException of invalid_import_source_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Starts an import of logged trail events from a source S3 bucket to a destination event data store. By default, CloudTrail only imports events contained in the S3 bucket's [CloudTrail] prefix and the prefixes inside the [CloudTrail] prefix, and does not check prefixes for other Amazon Web Services services. If you want to import CloudTrail events contained in another prefix, you must include the prefix in the [S3LocationUri]. For more considerations about importing trail events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-copy-trail-to-lake.html#cloudtrail-trail-copy-considerations}Considerations for copying trail events} in the {i CloudTrail User Guide}. \n\n  When you start a new import, the [Destinations] and [ImportSource] parameters are required. Before starting a new import, disable any access control lists (ACLs) attached to the source S3 bucket. For more information about disabling ACLs, see {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html}Controlling ownership of objects and disabling ACLs for your bucket}. \n \n   When you retry an import, the [ImportID] parameter is required. \n  \n     If the destination event data store is for an organization, you must use the management account to import trail events. You cannot use the delegated administrator account for the organization. \n    \n     "]
module StartLogging :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_logging_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `ConflictException of conflict_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidHomeRegionException of invalid_home_region_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Starts the recording of Amazon Web Services API calls and log file delivery for a trail. For a trail that is enabled in all Regions, this operation must be called from the Region in which the trail was created. This operation cannot be called on the shadow trails (replicated trails in other Regions) of a trail that is enabled in all Regions.\n"]
module StartQuery :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_query_request ->
        (start_query_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InsufficientS3BucketPolicyException of
              insufficient_s3_bucket_policy_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidQueryStatementException of
              invalid_query_statement_exception 
          | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception 
          | `InvalidS3PrefixException of invalid_s3_prefix_exception 
          | `MaxConcurrentQueriesException of
              max_concurrent_queries_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `S3BucketDoesNotExistException of
              s3_bucket_does_not_exist_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Starts a CloudTrail Lake query. Use the [QueryStatement] parameter to provide your SQL query, enclosed in single quotation marks. Use the optional [DeliveryS3Uri] parameter to deliver the query results to an S3 bucket.\n\n  [StartQuery] requires you specify either the [QueryStatement] parameter, or a [QueryAlias] and any [QueryParameters]. In the current release, the [QueryAlias] and [QueryParameters] parameters are used only for the queries that populate the CloudTrail Lake dashboards.\n "]
module StopEventDataStoreIngestion :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_event_data_store_ingestion_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidEventDataStoreCategoryException of
              invalid_event_data_store_category_exception 
          | `InvalidEventDataStoreStatusException of
              invalid_event_data_store_status_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Stops the ingestion of live events on an event data store specified as either an ARN or the ID portion of the ARN. To stop ingestion, the event data store [Status] must be [ENABLED] and the [eventCategory] must be [Management], [Data], [NetworkActivity], or [ConfigurationItem].\n"]
module StopImport :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_import_request ->
        (stop_import_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ImportNotFoundException of import_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc " Stops a specified import. \n"]
module StopLogging :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_logging_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `ConflictException of conflict_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InvalidHomeRegionException of invalid_home_region_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Suspends the recording of Amazon Web Services API calls and log file delivery for the specified trail. Under most circumstances, there is no need to use this action. You can update a trail without stopping it first. This action is the only way to stop recording. For a trail enabled in all Regions, this operation must be called from the Region in which the trail was created, or an [InvalidHomeRegionException] will occur. This operation cannot be called on the shadow trails (replicated trails in other Regions) of a trail enabled in all Regions.\n"]
module UpdateChannel :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_channel_request ->
        (update_channel_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ChannelAlreadyExistsException of
              channel_already_exists_exception 
          | `ChannelARNInvalidException of channel_arn_invalid_exception 
          | `ChannelNotFoundException of channel_not_found_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InvalidEventDataStoreCategoryException of
              invalid_event_data_store_category_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Updates a channel specified by a required channel ARN or UUID.\n"]
module UpdateDashboard :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_dashboard_request ->
        (update_dashboard_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InvalidQueryStatementException of
              invalid_query_statement_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     " Updates the specified dashboard. \n\n  To set a refresh schedule, CloudTrail must be granted permissions to run the [StartDashboardRefresh] operation to refresh the dashboard on your behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a resource-based policy to the dashboard. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-dashboards} Resource-based policy example for a dashboard} in the {i CloudTrail User Guide}. \n \n   CloudTrail runs queries to populate the dashboard's widgets during a manual or scheduled refresh. CloudTrail must be granted permissions to run the [StartQuery] operation on your behalf. To provide permissions, run the [PutResourcePolicy] operation to attach a resource-based policy to each event data store. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html#security_iam_resource-based-policy-examples-eds-dashboard}Example: Allow CloudTrail to run queries to populate a dashboard} in the {i CloudTrail User Guide}. \n  "]
module UpdateEventDataStore :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_data_store_request ->
        (update_event_data_store_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `EventDataStoreAlreadyExistsException of
              event_data_store_already_exists_exception 
          | `EventDataStoreARNInvalidException of
              event_data_store_arn_invalid_exception 
          | `EventDataStoreHasOngoingImportException of
              event_data_store_has_ongoing_import_exception 
          | `EventDataStoreNotFoundException of
              event_data_store_not_found_exception 
          | `InactiveEventDataStoreException of
              inactive_event_data_store_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InvalidEventSelectorsException of
              invalid_event_selectors_exception 
          | `InvalidInsightSelectorsException of
              invalid_insight_selectors_exception 
          | `InvalidKmsKeyIdException of invalid_kms_key_id_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `KmsException of kms_exception 
          | `KmsKeyNotFoundException of kms_key_not_found_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Updates an event data store. The required [EventDataStore] value is an ARN or the ID portion of the ARN. Other parameters are optional, but at least one optional parameter must be specified, or CloudTrail throws an error. [RetentionPeriod] is in days, and valid values are integers between 7 and 3653 if the [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], or between 7 and 2557 if [BillingMode] is set to [FIXED_RETENTION_PRICING]. By default, [TerminationProtection] is enabled.\n\n For event data stores for CloudTrail events, [AdvancedEventSelectors] includes or excludes management, data, or network activity events in your event data store. For more information about [AdvancedEventSelectors], see {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelectors}.\n \n   For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or non-Amazon Web Services events, [AdvancedEventSelectors] includes events of that type in your event data store.\n  "]
module UpdateTrail :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_trail_request ->
        (update_trail_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `CloudTrailAccessNotEnabledException of
              cloud_trail_access_not_enabled_exception 
          | `CloudTrailARNInvalidException of
              cloud_trail_arn_invalid_exception 
          | `CloudTrailInvalidClientTokenIdException of
              cloud_trail_invalid_client_token_id_exception 
          | `CloudWatchLogsDeliveryUnavailableException of
              cloud_watch_logs_delivery_unavailable_exception 
          | `ConflictException of conflict_exception 
          | `InsufficientDependencyServiceAccessPermissionException of
              insufficient_dependency_service_access_permission_exception 
          | `InsufficientEncryptionPolicyException of
              insufficient_encryption_policy_exception 
          | `InsufficientS3BucketPolicyException of
              insufficient_s3_bucket_policy_exception 
          | `InsufficientSnsTopicPolicyException of
              insufficient_sns_topic_policy_exception 
          | `InvalidCloudWatchLogsLogGroupArnException of
              invalid_cloud_watch_logs_log_group_arn_exception 
          | `InvalidCloudWatchLogsRoleArnException of
              invalid_cloud_watch_logs_role_arn_exception 
          | `InvalidEventSelectorsException of
              invalid_event_selectors_exception 
          | `InvalidHomeRegionException of invalid_home_region_exception 
          | `InvalidKmsKeyIdException of invalid_kms_key_id_exception 
          | `InvalidParameterCombinationException of
              invalid_parameter_combination_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception 
          | `InvalidS3PrefixException of invalid_s3_prefix_exception 
          | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception 
          | `InvalidTrailNameException of invalid_trail_name_exception 
          | `KmsException of kms_exception 
          | `KmsKeyDisabledException of kms_key_disabled_exception 
          | `KmsKeyNotFoundException of kms_key_not_found_exception 
          | `NoManagementAccountSLRExistsException of
              no_management_account_slr_exists_exception 
          | `NotOrganizationMasterAccountException of
              not_organization_master_account_exception 
          | `OperationNotPermittedException of
              operation_not_permitted_exception 
          | `OrganizationNotInAllFeaturesModeException of
              organization_not_in_all_features_mode_exception 
          | `OrganizationsNotInUseException of
              organizations_not_in_use_exception 
          | `S3BucketDoesNotExistException of
              s3_bucket_does_not_exist_exception 
          | `ThrottlingException of throttling_exception 
          | `TrailNotFoundException of trail_not_found_exception 
          | `TrailNotProvidedException of trail_not_provided_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Updates trail settings that control what events you are logging, and how to handle log files. Changes to a trail do not require stopping the CloudTrail service. Use this action to designate an existing bucket for log delivery. If the existing bucket has previously been a target for CloudTrail log files, an IAM policy exists for the bucket. [UpdateTrail] must be called from the Region in which the trail was created; otherwise, an [InvalidHomeRegionException] is thrown.\n"]