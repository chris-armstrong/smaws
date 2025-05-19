open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cloudtrail";
      endpointPrefix = "cloudtrail";
      version = "2013-11-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec update_trail_response =
  {
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  log_file_validation_enabled: bool option ;
  trail_ar_n: string option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_ar_n: string option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string option }[@@ocaml.doc
                         "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec update_trail_request =
  {
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  enable_log_file_validation: bool option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string }[@@ocaml.doc "Specifies settings to update for the trail.\n"]
type nonrec unsupported_operation_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the requested operation is not supported.\n"]
type nonrec trail_not_provided_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is no longer in use.\n"]
type nonrec trail_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the trail with the given name is not found.\n"]
type nonrec throttling_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the request rate exceeds the limit. \n"]
type nonrec s3_bucket_does_not_exist_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified S3 bucket does not exist.\n"]
type nonrec organizations_not_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the request is made from an Amazon Web Services account that is not a member of an organization. To make this request, sign in using the credentials of an account that belongs to an organization.\n"]
type nonrec organization_not_in_all_features_mode_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when Organizations is not configured to support all features. All features must be enabled in Organizations to support creating an organization trail or event data store.\n"]
type nonrec operation_not_permitted_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the requested operation is not permitted.\n"]
type nonrec not_organization_master_account_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the Amazon Web Services account making the request to create or update an organization trail or event data store is not the management account for an organization in Organizations. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/creating-an-organizational-trail-prepare.html}Prepare For Creating a Trail For Your Organization} or {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-organizations.html}Organization event data stores}.\n"]
type nonrec no_management_account_slr_exists_exception =
  {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the management account does not have a service-linked role. \n"]
type nonrec kms_key_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the KMS key does not exist, when the S3 bucket and the KMS key are not in the same Region, or when the KMS key associated with the Amazon SNS topic either does not exist or is not in the same Region.\n"]
type nonrec kms_key_disabled_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is no longer in use.\n"]
type nonrec kms_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when there is an issue with the specified KMS key and the trail or event data store can't be updated.\n"]
type nonrec invalid_trail_name_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the provided trail name is not valid. Trail names must meet the following requirements:\n\n {ul\n       {-  Contain only ASCII letters (a-z, A-Z), numbers (0-9), periods (.), underscores (_), or dashes (-)\n           \n            }\n       {-  Start with a letter or number, and end with a letter or number\n           \n            }\n       {-  Be between 3 and 128 characters\n           \n            }\n       {-  Have no adjacent periods, underscores or dashes. Names like [my-_namespace] and [my--namespace] are not valid.\n           \n            }\n       {-  Not be in IP address format (for example, 192.168.5.4)\n           \n            }\n       }\n  "]
type nonrec invalid_sns_topic_name_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the provided SNS topic name is not valid.\n"]
type nonrec invalid_s3_prefix_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the provided S3 prefix is not valid.\n"]
type nonrec invalid_s3_bucket_name_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the provided S3 bucket name is not valid.\n"]
type nonrec invalid_parameter_exception = {
  message: string option }[@@ocaml.doc
                            "The request includes a parameter that is not valid.\n"]
type nonrec invalid_parameter_combination_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the combination of parameters provided is not valid.\n"]
type nonrec invalid_kms_key_id_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the KMS key ARN is not valid.\n"]
type nonrec invalid_home_region_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when an operation is called on a trail from a Region other than the Region in which the trail was created.\n"]
type nonrec invalid_event_selectors_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the [PutEventSelectors] operation is called with a number of event selectors, advanced event selectors, or data resources that is not valid. The combination of event selectors or advanced event selectors and data resources is not valid. A trail can have up to 5 event selectors. If a trail uses advanced event selectors, a maximum of 500 total values for all conditions in all advanced event selectors is allowed. A trail is limited to 250 data resources. These data resources can be distributed across event selectors, but the overall total cannot exceed 250.\n\n You can:\n \n  {ul\n        {-  Specify a valid number of event selectors (1 to 5) for a trail.\n            \n             }\n        {-  Specify a valid number of data resources (1 to 250) for an event selector. The limit of number of resources on an individual event selector is configurable up to 250. However, this upper limit is allowed only if the total number of data resources does not exceed 250 across all event selectors for a trail.\n            \n             }\n        {-  Specify up to 500 values for all conditions in all advanced event selectors for a trail.\n            \n             }\n        {-  Specify a valid value for a parameter. For example, specifying the [ReadWriteType] parameter with a value of [read-only] is not valid.\n            \n             }\n        }\n  "]
type nonrec invalid_cloud_watch_logs_role_arn_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the provided role is not valid.\n"]
type nonrec invalid_cloud_watch_logs_log_group_arn_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the provided CloudWatch Logs log group is not valid.\n"]
type nonrec insufficient_sns_topic_policy_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the policy on the Amazon SNS topic is not sufficient.\n"]
type nonrec insufficient_s3_bucket_policy_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the policy on the S3 bucket is not sufficient.\n"]
type nonrec insufficient_encryption_policy_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the policy on the S3 bucket or KMS key does not have sufficient permissions for the operation.\n"]
type nonrec insufficient_dependency_service_access_permission_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the IAM identity that is used to create the organization resource lacks one or more required permissions for creating an organization resource in a required service.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified resource is not ready for an operation. This can occur when you try to run an operation on a resource before CloudTrail has time to fully load the resource, or because another operation is modifying the resource. If this exception occurs, wait a few minutes, and then try the operation again.\n"]
type nonrec cloud_watch_logs_delivery_unavailable_exception =
  {
  message: string option }[@@ocaml.doc
                            "Cannot set a CloudWatch Logs delivery for this Region.\n"]
type nonrec cloud_trail_invalid_client_token_id_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when a call results in the [InvalidClientTokenId] error code. This can occur when you are creating or updating a trail to send notifications to an Amazon SNS topic that is in a suspended Amazon Web Services account.\n"]
type nonrec cloud_trail_arn_invalid_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when an operation is called with an ARN that is not valid.\n\n The following is the format of a trail ARN: [arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail] \n \n  The following is the format of an event data store ARN: [arn:aws:cloudtrail:us-east-2:123456789012:eventdatastore/EXAMPLE-f852-4e8f-8bd1-bcf6cEXAMPLE] \n  \n   The following is the format of a channel ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/01234567890] \n   "]
type nonrec cloud_trail_access_not_enabled_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when trusted access has not been enabled between CloudTrail and Organizations. For more information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_how-to-enable-disable-trusted-access}How to enable or disable trusted access} in the {i Organizations User Guide} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/creating-an-organizational-trail-prepare.html}Prepare For Creating a Trail For Your Organization} in the {i CloudTrail User Guide}.\n"]
type nonrec event_data_store_status =
  | STOPPED_INGESTION 
  | STOPPING_INGESTION 
  | STARTING_INGESTION 
  | PENDING_DELETION 
  | ENABLED 
  | CREATED [@@ocaml.doc ""]
type nonrec advanced_field_selector =
  {
  not_ends_with: string list option ;
  not_starts_with: string list option ;
  not_equals: string list option ;
  ends_with: string list option ;
  starts_with: string list option ;
  equals: string list option ;
  field: string }[@@ocaml.doc
                   "A single selector statement in an advanced event selector.\n"]
type nonrec advanced_event_selector =
  {
  field_selectors: advanced_field_selector list ;
  name: string option }[@@ocaml.doc
                         "Advanced event selectors let you create fine-grained selectors for CloudTrail management and data events. They help you control costs by logging only those events that are important to you. For more information about advanced event selectors, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events} and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events} in the {i CloudTrail User Guide}.\n\n You cannot apply both event selectors and advanced event selectors to a trail.\n \n   {b Supported CloudTrail event record fields for management events} \n  \n   {ul\n         {-   [eventCategory] (required)\n             \n              }\n         {-   [eventSource] \n             \n              }\n         {-   [readOnly] \n             \n              }\n         }\n    {b Supported CloudTrail event record fields for data events} \n   \n    {ul\n          {-   [eventCategory] (required)\n              \n               }\n          {-   [resources.type] (required)\n              \n               }\n          {-   [readOnly] \n              \n               }\n          {-   [eventName] \n              \n               }\n          {-   [resources.ARN] \n              \n               }\n          }\n    For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or events outside of Amazon Web Services, the only supported field is [eventCategory]. \n    \n     "]
type nonrec billing_mode =
  | FIXED_RETENTION_PRICING 
  | EXTENDABLE_RETENTION_PRICING [@@ocaml.doc ""]
type nonrec federation_status =
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING [@@ocaml.doc ""]
type nonrec update_event_data_store_response =
  {
  federation_role_arn: string option ;
  federation_status: federation_status option ;
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }[@@ocaml.doc ""]
type nonrec update_event_data_store_request =
  {
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  name: string option ;
  event_data_store: string }[@@ocaml.doc ""]
type nonrec invalid_insight_selectors_exception = {
  message: string option }[@@ocaml.doc
                            "For [PutInsightSelectors], this exception is thrown when the formatting or syntax of the [InsightSelectors] JSON statement is not valid, or the specified [InsightType] in the [InsightSelectors] statement is not valid. Valid values for [InsightType] are [ApiCallRateInsight] and [ApiErrorRateInsight]. To enable Insights on an event data store, the destination event data store specified by the [InsightsDestination] parameter must log Insights events and the source event data store specified by the [EventDataStore] parameter must log management events.\n\n For [UpdateEventDataStore], this exception is thrown if Insights are enabled on the event data store and the updated advanced event selectors are not compatible with the configured [InsightSelectors]. If the [InsightSelectors] includes an [InsightType] of [ApiCallRateInsight], the source event data store must log [write] management events. If the [InsightSelectors] includes an [InsightType] of [ApiErrorRateInsight], the source event data store must log management events.\n "]
type nonrec inactive_event_data_store_exception = {
  message: string option }[@@ocaml.doc "The event data store is inactive.\n"]
type nonrec event_data_store_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The specified event data store was not found.\n"]
type nonrec event_data_store_has_ongoing_import_exception =
  {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when you try to update or delete an event data store that currently has an import in progress. \n"]
type nonrec event_data_store_arn_invalid_exception =
  {
  message: string option }[@@ocaml.doc
                            "The specified event data store ARN is not valid or does not map to an event data store in your account.\n"]
type nonrec event_data_store_already_exists_exception =
  {
  message: string option }[@@ocaml.doc
                            "An event data store with that name already exists.\n"]
type nonrec destination_type =
  | AWS_SERVICE 
  | EVENT_DATA_STORE [@@ocaml.doc ""]
type nonrec destination = {
  location: string ;
  type_: destination_type }[@@ocaml.doc
                             "Contains information about the destination receiving events.\n"]
type nonrec update_channel_response =
  {
  destinations: destination list option ;
  source: string option ;
  name: string option ;
  channel_arn: string option }[@@ocaml.doc ""]
type nonrec update_channel_request =
  {
  name: string option ;
  destinations: destination list option ;
  channel: string }[@@ocaml.doc ""]
type nonrec invalid_event_data_store_category_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when event categories of specified event data stores are not valid.\n"]
type nonrec channel_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when CloudTrail cannot find the specified channel.\n"]
type nonrec channel_arn_invalid_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified value of [ChannelARN] is not valid.\n"]
type nonrec channel_already_exists_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the provided channel already exists. \n"]
type nonrec trail_info =
  {
  home_region: string option ;
  name: string option ;
  trail_ar_n: string option }[@@ocaml.doc
                               "Information about a CloudTrail trail, including the trail's name, home Region, and Amazon Resource Name (ARN).\n"]
type nonrec trail =
  {
  is_organization_trail: bool option ;
  has_insight_selectors: bool option ;
  has_custom_event_selectors: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  log_file_validation_enabled: bool option ;
  trail_ar_n: string option ;
  home_region: string option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_ar_n: string option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string option }[@@ocaml.doc "The settings for a trail.\n"]
type nonrec trail_already_exists_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified trail already exists.\n"]
type nonrec tag = {
  value: string option ;
  key: string }[@@ocaml.doc
                 "A custom key-value pair associated with a resource such as a CloudTrail trail, event data store, or channel.\n"]
type nonrec tags_limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The number of tags per trail, event data store, or channel has exceeded the permitted amount. Currently, the limit is 50.\n"]
type nonrec stop_logging_response = unit
type nonrec stop_logging_request = {
  name: string }[@@ocaml.doc
                  "Passes the request to CloudTrail to stop logging Amazon Web Services API calls for the specified account.\n"]
type nonrec s3_import_source =
  {
  s3_bucket_access_role_arn: string ;
  s3_bucket_region: string ;
  s3_location_uri: string }[@@ocaml.doc
                             " The settings for the source S3 bucket. \n"]
type nonrec import_source = {
  s3: s3_import_source }[@@ocaml.doc " The import source. \n"]
type nonrec import_status =
  | COMPLETED 
  | STOPPED 
  | FAILED 
  | IN_PROGRESS 
  | INITIALIZING [@@ocaml.doc ""]
type nonrec import_statistics =
  {
  failed_entries: int option ;
  events_completed: int option ;
  files_completed: int option ;
  prefixes_completed: int option ;
  prefixes_found: int option }[@@ocaml.doc
                                " Provides statistics for the specified [ImportID]. CloudTrail does not update import statistics in real-time. Returned values for parameters such as [EventsCompleted] may be lower than the actual value, because CloudTrail updates statistics incrementally over the course of the import. \n"]
type nonrec stop_import_response =
  {
  import_statistics: import_statistics option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  import_status: import_status option ;
  destinations: string list option ;
  import_source: import_source option ;
  import_id: string option }[@@ocaml.doc ""]
type nonrec stop_import_request = {
  import_id: string }[@@ocaml.doc ""]
type nonrec import_not_found_exception = {
  message: string option }[@@ocaml.doc
                            " The specified import was not found. \n"]
type nonrec stop_event_data_store_ingestion_response = unit
type nonrec stop_event_data_store_ingestion_request =
  {
  event_data_store: string }[@@ocaml.doc ""]
type nonrec invalid_event_data_store_status_exception =
  {
  message: string option }[@@ocaml.doc
                            "The event data store is not in a status that supports the operation.\n"]
type nonrec start_query_response = {
  query_id: string option }[@@ocaml.doc ""]
type nonrec start_query_request =
  {
  query_parameters: string list option ;
  query_alias: string option ;
  delivery_s3_uri: string option ;
  query_statement: string option }[@@ocaml.doc ""]
type nonrec max_concurrent_queries_exception = {
  message: string option }[@@ocaml.doc
                            "You are already running the maximum number of concurrent queries. The maximum number of concurrent queries is 10. Wait a minute for some queries to finish, and then run the query again.\n"]
type nonrec invalid_query_statement_exception = {
  message: string option }[@@ocaml.doc
                            "The query that was submitted has validation errors, or uses incorrect syntax or unsupported keywords. For more information about writing a query, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-create-edit-query.html}Create or edit a query} in the {i CloudTrail User Guide}.\n"]
type nonrec start_logging_response = unit
type nonrec start_logging_request = {
  name: string }[@@ocaml.doc
                  "The request to CloudTrail to start logging Amazon Web Services API calls for an account.\n"]
type nonrec start_import_response =
  {
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  import_status: import_status option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  import_source: import_source option ;
  destinations: string list option ;
  import_id: string option }[@@ocaml.doc ""]
type nonrec start_import_request =
  {
  import_id: string option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  import_source: import_source option ;
  destinations: string list option }[@@ocaml.doc ""]
type nonrec invalid_import_source_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the provided source S3 bucket is not valid for import. \n"]
type nonrec account_has_ongoing_import_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when you start a new import and a previous import is still in progress. \n"]
type nonrec start_event_data_store_ingestion_response = unit
type nonrec start_event_data_store_ingestion_request =
  {
  event_data_store: string }[@@ocaml.doc ""]
type nonrec source_config =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  apply_to_all_regions: bool option }[@@ocaml.doc
                                       " Contains configuration information about the channel. \n"]
type nonrec restore_event_data_store_response =
  {
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }[@@ocaml.doc ""]
type nonrec restore_event_data_store_request = {
  event_data_store: string }[@@ocaml.doc ""]
type nonrec event_data_store_max_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "Your account has used the maximum number of event data stores.\n"]
type nonrec resource_type_not_supported_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified resource type is not supported by CloudTrail.\n"]
type nonrec resource_tag =
  {
  tags_list: tag list option ;
  resource_id: string option }[@@ocaml.doc "A resource tag.\n"]
type nonrec resource_policy_not_valid_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the resouce-based policy has syntax errors, or contains a principal that is not valid. \n\n The following are requirements for the resource policy:\n \n  {ul\n        {-   Contains only one action: cloudtrail-data:PutAuditEvents \n            \n             }\n        {-   Contains at least one statement. The policy can have a maximum of 20 statements. \n            \n             }\n        {-   Each statement contains at least one principal. A statement can have a maximum of 50 principals. \n            \n             }\n        }\n  "]
type nonrec resource_policy_not_found_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the specified resource policy is not found. \n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified resource is not found.\n"]
type nonrec resource =
  {
  resource_name: string option ;
  resource_type: string option }[@@ocaml.doc
                                  "Specifies the type and name of a resource referenced by an event.\n"]
type nonrec resource_arn_not_valid_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the provided resource does not exist, or the ARN format of the resource is not valid. The following is the valid format for a resource ARN: [arn:aws:cloudtrail:us-east-2:123456789012:channel/MyChannel]. \n"]
type nonrec remove_tags_response = unit
type nonrec remove_tags_request = {
  tags_list: tag list ;
  resource_id: string }[@@ocaml.doc
                         "Specifies the tags to remove from a trail, event data store, or channel.\n"]
type nonrec invalid_tag_parameter_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified tag key or values are not valid. It can also occur if there are duplicate tags or too many tags on the resource.\n"]
type nonrec register_organization_delegated_admin_response = unit
type nonrec register_organization_delegated_admin_request =
  {
  member_account_id: string }[@@ocaml.doc
                               "Specifies an organization member account ID as a CloudTrail delegated administrator.\n"]
type nonrec not_organization_management_account_exception =
  {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the account making the request is not the organization's management account. \n"]
type nonrec delegated_admin_account_limit_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the maximum number of CloudTrail delegated administrators is reached.\n"]
type nonrec cannot_delegate_management_account_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the management account of an organization is registered as the CloudTrail delegated administrator.\n"]
type nonrec account_registered_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the account is already registered as the CloudTrail delegated administrator.\n"]
type nonrec account_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified account is not found or not part of an organization.\n"]
type nonrec read_write_type =
  | All 
  | WriteOnly 
  | ReadOnly [@@ocaml.doc ""]
type nonrec query_status =
  | TIMED_OUT 
  | CANCELLED 
  | FAILED 
  | FINISHED 
  | RUNNING 
  | QUEUED [@@ocaml.doc ""]
type nonrec query_statistics_for_describe_query =
  {
  creation_time: CoreTypes.Timestamp.t option ;
  execution_time_in_millis: int option ;
  bytes_scanned: int option ;
  events_scanned: int option ;
  events_matched: int option }[@@ocaml.doc
                                "Gets metadata about a query, including the number of events that were matched, the total number of events scanned, the query run time in milliseconds, and the query's creation time.\n"]
type nonrec query_statistics =
  {
  bytes_scanned: int option ;
  total_results_count: int option ;
  results_count: int option }[@@ocaml.doc
                               "Metadata about a query, such as the number of results.\n"]
type nonrec query_result_column = (string * string) list[@@ocaml.doc ""]
type nonrec query_id_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The query ID does not exist or does not map to a query.\n"]
type nonrec query =
  {
  creation_time: CoreTypes.Timestamp.t option ;
  query_status: query_status option ;
  query_id: string option }[@@ocaml.doc
                             "A SQL string of criteria about events that you want to collect in an event data store.\n"]
type nonrec put_resource_policy_response =
  {
  resource_policy: string option ;
  resource_arn: string option }[@@ocaml.doc ""]
type nonrec put_resource_policy_request =
  {
  resource_policy: string ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec insight_type =
  | ApiErrorRateInsight 
  | ApiCallRateInsight [@@ocaml.doc ""]
type nonrec insight_selector = {
  insight_type: insight_type option }[@@ocaml.doc
                                       "A JSON string that contains a list of Insights types that are logged on a trail or event data store.\n"]
type nonrec put_insight_selectors_response =
  {
  insights_destination: string option ;
  event_data_store_arn: string option ;
  insight_selectors: insight_selector list option ;
  trail_ar_n: string option }[@@ocaml.doc ""]
type nonrec put_insight_selectors_request =
  {
  insights_destination: string option ;
  event_data_store: string option ;
  insight_selectors: insight_selector list ;
  trail_name: string option }[@@ocaml.doc ""]
type nonrec data_resource =
  {
  values: string list option ;
  type_: string option }[@@ocaml.doc
                          "Data events provide information about the resource operations performed on or within a resource itself. These are also known as data plane operations. You can specify up to 250 data resources for a trail.\n\n Configure the [DataResource] to specify the resource type and resource ARNs for which you want to log data events.\n \n  You can specify the following resource types in your event selectors for your trail:\n  \n   {ul\n         {-   [AWS::DynamoDB::Table] \n             \n              }\n         {-   [AWS::Lambda::Function] \n             \n              }\n         {-   [AWS::S3::Object] \n             \n              }\n         }\n    The total number of allowed data resources is 250. This number can be distributed between 1 and 5 event selectors, but the total cannot exceed 250 across all selectors for the trail.\n    \n     If you are using advanced event selectors, the maximum total number of values for all conditions, across all advanced event selectors for the trail, is 500.\n     \n       The following example demonstrates how logging works when you configure logging of all data events for an S3 bucket named [bucket-1]. In this example, the CloudTrail user specified an empty prefix, and the option to log both [Read] and [Write] data events.\n       \n        {ol\n              {-  A user uploads an image file to [bucket-1].\n                  \n                   }\n              {-  The [PutObject] API operation is an Amazon S3 object-level API. It is recorded as a data event in CloudTrail. Because the CloudTrail user specified an S3 bucket with an empty prefix, events that occur on any object in that bucket are logged. The trail processes and logs the event.\n                  \n                   }\n              {-  A user uploads an object to an Amazon S3 bucket named [arn:aws:s3:::bucket-2].\n                  \n                   }\n              {-  The [PutObject] API operation occurred for an object in an S3 bucket that the CloudTrail user didn't specify for the trail. The trail doesn\226\128\153t log the event.\n                  \n                   }\n              }\n   The following example demonstrates how logging works when you configure logging of Lambda data events for a Lambda function named {i MyLambdaFunction}, but not for all Lambda functions.\n   \n    {ol\n          {-  A user runs a script that includes a call to the {i MyLambdaFunction} function and the {i MyOtherLambdaFunction} function.\n              \n               }\n          {-  The [Invoke] API operation on {i MyLambdaFunction} is an Lambda API. It is recorded as a data event in CloudTrail. Because the CloudTrail user specified logging data events for {i MyLambdaFunction}, any invocations of that function are logged. The trail processes and logs the event.\n              \n               }\n          {-  The [Invoke] API operation on {i MyOtherLambdaFunction} is an Lambda API. Because the CloudTrail user did not specify logging data events for all Lambda functions, the [Invoke] operation for {i MyOtherLambdaFunction} does not match the function specified for the trail. The trail doesn\226\128\153t log the event. \n              \n               }\n          }\n  "]
type nonrec event_selector =
  {
  exclude_management_event_sources: string list option ;
  data_resources: data_resource list option ;
  include_management_events: bool option ;
  read_write_type: read_write_type option }[@@ocaml.doc
                                             "Use event selectors to further specify the management and data event settings for your trail. By default, trails created without specific event selectors will be configured to log all read and write management events, and no data events. When an event occurs in your account, CloudTrail evaluates the event selector for all trails. For each trail, if the event matches any event selector, the trail processes and logs the event. If the event doesn't match any event selector, the trail doesn't log the event.\n\n You can configure up to five event selectors for a trail.\n \n  You cannot apply both event selectors and advanced event selectors to a trail.\n  "]
type nonrec put_event_selectors_response =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  event_selectors: event_selector list option ;
  trail_ar_n: string option }[@@ocaml.doc ""]
type nonrec put_event_selectors_request =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  event_selectors: event_selector list option ;
  trail_name: string }[@@ocaml.doc ""]
type nonrec public_key =
  {
  fingerprint: string option ;
  validity_end_time: CoreTypes.Timestamp.t option ;
  validity_start_time: CoreTypes.Timestamp.t option ;
  value: bytes option }[@@ocaml.doc
                         "Contains information about a returned public key.\n"]
type nonrec partition_key = {
  type_: string ;
  name: string }[@@ocaml.doc
                  "Contains information about a partition key for an event data store.\n"]
type nonrec maximum_number_of_trails_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the maximum number of trails is reached.\n"]
type nonrec event =
  {
  cloud_trail_event: string option ;
  resources: resource list option ;
  username: string option ;
  event_source: string option ;
  event_time: CoreTypes.Timestamp.t option ;
  access_key_id: string option ;
  read_only: string option ;
  event_name: string option ;
  event_id: string option }[@@ocaml.doc
                             "Contains information about an event that was returned by a lookup request. The result includes a representation of a CloudTrail event.\n"]
type nonrec lookup_events_response =
  {
  next_token: string option ;
  events: event list option }[@@ocaml.doc
                               "Contains a response to a LookupEvents action.\n"]
type nonrec lookup_attribute_key =
  | ACCESS_KEY_ID 
  | EVENT_SOURCE 
  | RESOURCE_NAME 
  | RESOURCE_TYPE 
  | USERNAME 
  | READ_ONLY 
  | EVENT_NAME 
  | EVENT_ID [@@ocaml.doc ""]
type nonrec lookup_attribute =
  {
  attribute_value: string ;
  attribute_key: lookup_attribute_key }[@@ocaml.doc
                                         "Specifies an attribute and value that filter the events returned.\n"]
type nonrec event_category =
  | Insight [@@ocaml.doc ""]
type nonrec lookup_events_request =
  {
  next_token: string option ;
  max_results: int option ;
  event_category: event_category option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  lookup_attributes: lookup_attribute list option }[@@ocaml.doc
                                                     "Contains a request for LookupEvents.\n"]
type nonrec invalid_time_range_exception = {
  message: string option }[@@ocaml.doc
                            "Occurs if the timestamp values are not valid. Either the start time occurs after the end time, or the time range is outside the range of possible values.\n"]
type nonrec invalid_next_token_exception = {
  message: string option }[@@ocaml.doc
                            "A token that is not valid, or a token that was previously used in a request with different parameters. This exception is thrown if the token is not valid.\n"]
type nonrec invalid_max_results_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown if the limit specified is not valid.\n"]
type nonrec invalid_lookup_attributes_exception = {
  message: string option }[@@ocaml.doc
                            "Occurs when a lookup attribute is specified that is not valid.\n"]
type nonrec invalid_event_category_exception = {
  message: string option }[@@ocaml.doc
                            "Occurs if an event category that is not valid is specified as a value of [EventCategory].\n"]
type nonrec list_trails_response =
  {
  next_token: string option ;
  trails: trail_info list option }[@@ocaml.doc ""]
type nonrec list_trails_request = {
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_tags_response =
  {
  next_token: string option ;
  resource_tag_list: resource_tag list option }[@@ocaml.doc
                                                 "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec list_tags_request =
  {
  next_token: string option ;
  resource_id_list: string list }[@@ocaml.doc
                                   "Specifies a list of tags to return.\n"]
type nonrec invalid_token_exception = {
  message: string option }[@@ocaml.doc "Reserved for future use.\n"]
type nonrec list_queries_response =
  {
  next_token: string option ;
  queries: query list option }[@@ocaml.doc ""]
type nonrec list_queries_request =
  {
  query_status: query_status option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  max_results: int option ;
  next_token: string option ;
  event_data_store: string }[@@ocaml.doc ""]
type nonrec invalid_query_status_exception = {
  message: string option }[@@ocaml.doc
                            "The query status is not valid for the operation.\n"]
type nonrec invalid_date_range_exception = {
  message: string option }[@@ocaml.doc
                            "A date range for the query was specified that is not valid. Be sure that the start time is chronologically before the end time. For more information about writing a query, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-create-edit-query.html}Create or edit a query} in the {i CloudTrail User Guide}.\n"]
type nonrec list_public_keys_response =
  {
  next_token: string option ;
  public_key_list: public_key list option }[@@ocaml.doc
                                             "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec list_public_keys_request =
  {
  next_token: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                              "Requests the public keys for a specified time range.\n"]
type nonrec list_insights_metric_data_response =
  {
  next_token: string option ;
  values: float list option ;
  timestamps: CoreTypes.Timestamp.t list option ;
  error_code: string option ;
  insight_type: insight_type option ;
  event_name: string option ;
  event_source: string option }[@@ocaml.doc ""]
type nonrec insights_metric_data_type =
  | NON_ZERO_DATA 
  | FILL_WITH_ZEROS [@@ocaml.doc ""]
type nonrec list_insights_metric_data_request =
  {
  next_token: string option ;
  max_results: int option ;
  data_type: insights_metric_data_type option ;
  period: int option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  error_code: string option ;
  insight_type: insight_type ;
  event_name: string ;
  event_source: string }[@@ocaml.doc ""]
type nonrec imports_list_item =
  {
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  destinations: string list option ;
  import_status: import_status option ;
  import_id: string option }[@@ocaml.doc
                              " Contains information about an import that was returned by a lookup request. \n"]
type nonrec list_imports_response =
  {
  next_token: string option ;
  imports: imports_list_item list option }[@@ocaml.doc ""]
type nonrec list_imports_request =
  {
  next_token: string option ;
  import_status: import_status option ;
  destination: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec import_failure_status =
  | SUCCEEDED 
  | RETRY 
  | FAILED [@@ocaml.doc ""]
type nonrec import_failure_list_item =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  error_type: string option ;
  status: import_failure_status option ;
  location: string option }[@@ocaml.doc
                             " Provides information about an import failure. \n"]
type nonrec list_import_failures_response =
  {
  next_token: string option ;
  failures: import_failure_list_item list option }[@@ocaml.doc ""]
type nonrec list_import_failures_request =
  {
  next_token: string option ;
  max_results: int option ;
  import_id: string }[@@ocaml.doc ""]
type nonrec event_data_store =
  {
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  termination_protection_enabled: bool option ;
  name: string option ;
  event_data_store_arn: string option }[@@ocaml.doc
                                         "A storage lake of event data against which you can run complex SQL-based queries. An event data store can include events that you have logged on your account. To select events for an event data store, use {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-lake-concepts.html#adv-event-selectors}advanced event selectors}.\n"]
type nonrec list_event_data_stores_response =
  {
  next_token: string option ;
  event_data_stores: event_data_store list option }[@@ocaml.doc ""]
type nonrec list_event_data_stores_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec channel = {
  name: string option ;
  channel_arn: string option }[@@ocaml.doc
                                "Contains information about a returned CloudTrail channel.\n"]
type nonrec list_channels_response =
  {
  next_token: string option ;
  channels: channel list option }[@@ocaml.doc ""]
type nonrec list_channels_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec invalid_source_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified value of [Source] is not valid.\n"]
type nonrec insight_not_enabled_exception = {
  message: string option }[@@ocaml.doc
                            "If you run [GetInsightSelectors] on a trail or event data store that does not have Insights events enabled, the operation throws the exception [InsightNotEnabledException].\n"]
type nonrec ingestion_status =
  {
  latest_ingestion_attempt_event_i_d: string option ;
  latest_ingestion_attempt_time: CoreTypes.Timestamp.t option ;
  latest_ingestion_error_code: string option ;
  latest_ingestion_success_event_i_d: string option ;
  latest_ingestion_success_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                                 "A table showing information about the most recent successful and failed attempts to ingest events.\n"]
type nonrec inactive_query_exception = {
  message: string option }[@@ocaml.doc
                            "The specified query cannot be canceled because it is in the [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED] state.\n"]
type nonrec get_trail_status_response =
  {
  time_logging_stopped: string option ;
  time_logging_started: string option ;
  latest_delivery_attempt_succeeded: string option ;
  latest_notification_attempt_succeeded: string option ;
  latest_notification_attempt_time: string option ;
  latest_delivery_attempt_time: string option ;
  latest_digest_delivery_error: string option ;
  latest_digest_delivery_time: CoreTypes.Timestamp.t option ;
  latest_cloud_watch_logs_delivery_time: CoreTypes.Timestamp.t option ;
  latest_cloud_watch_logs_delivery_error: string option ;
  stop_logging_time: CoreTypes.Timestamp.t option ;
  start_logging_time: CoreTypes.Timestamp.t option ;
  latest_notification_time: CoreTypes.Timestamp.t option ;
  latest_delivery_time: CoreTypes.Timestamp.t option ;
  latest_notification_error: string option ;
  latest_delivery_error: string option ;
  is_logging: bool option }[@@ocaml.doc
                             "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec get_trail_status_request = {
  name: string }[@@ocaml.doc
                  "The name of a trail about which you want the current status.\n"]
type nonrec get_trail_response = {
  trail: trail option }[@@ocaml.doc ""]
type nonrec get_trail_request = {
  name: string }[@@ocaml.doc ""]
type nonrec get_resource_policy_response =
  {
  resource_policy: string option ;
  resource_arn: string option }[@@ocaml.doc ""]
type nonrec get_resource_policy_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec get_query_results_response =
  {
  error_message: string option ;
  next_token: string option ;
  query_result_rows: query_result_column list list option ;
  query_statistics: query_statistics option ;
  query_status: query_status option }[@@ocaml.doc ""]
type nonrec get_query_results_request =
  {
  max_query_results: int option ;
  next_token: string option ;
  query_id: string ;
  event_data_store: string option }[@@ocaml.doc ""]
type nonrec get_insight_selectors_response =
  {
  insights_destination: string option ;
  event_data_store_arn: string option ;
  insight_selectors: insight_selector list option ;
  trail_ar_n: string option }[@@ocaml.doc ""]
type nonrec get_insight_selectors_request =
  {
  event_data_store: string option ;
  trail_name: string option }[@@ocaml.doc ""]
type nonrec get_import_response =
  {
  import_statistics: import_statistics option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  import_status: import_status option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  import_source: import_source option ;
  destinations: string list option ;
  import_id: string option }[@@ocaml.doc ""]
type nonrec get_import_request = {
  import_id: string }[@@ocaml.doc ""]
type nonrec get_event_selectors_response =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  event_selectors: event_selector list option ;
  trail_ar_n: string option }[@@ocaml.doc ""]
type nonrec get_event_selectors_request = {
  trail_name: string }[@@ocaml.doc ""]
type nonrec get_event_data_store_response =
  {
  partition_keys: partition_key list option ;
  federation_role_arn: string option ;
  federation_status: federation_status option ;
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }[@@ocaml.doc ""]
type nonrec get_event_data_store_request = {
  event_data_store: string }[@@ocaml.doc ""]
type nonrec get_channel_response =
  {
  ingestion_status: ingestion_status option ;
  destinations: destination list option ;
  source_config: source_config option ;
  source: string option ;
  name: string option ;
  channel_arn: string option }[@@ocaml.doc ""]
type nonrec get_channel_request = {
  channel: string }[@@ocaml.doc ""]
type nonrec event_data_store_termination_protected_exception =
  {
  message: string option }[@@ocaml.doc
                            "The event data store cannot be deleted because termination protection is enabled for it.\n"]
type nonrec event_data_store_federation_enabled_exception =
  {
  message: string option }[@@ocaml.doc
                            " You cannot delete the event data store because Lake query federation is enabled. To delete the event data store, run the [DisableFederation] operation to disable Lake query federation on the event data store. \n"]
type nonrec enable_federation_response =
  {
  federation_role_arn: string option ;
  federation_status: federation_status option ;
  event_data_store_arn: string option }[@@ocaml.doc ""]
type nonrec enable_federation_request =
  {
  federation_role_arn: string ;
  event_data_store: string }[@@ocaml.doc ""]
type nonrec concurrent_modification_exception = {
  message: string option }[@@ocaml.doc
                            " You are trying to update a resource when another request is in progress. Allow sufficient wait time for the previous request to complete, then retry your request. \n"]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            " You do not have sufficient access to perform this action. \n"]
type nonrec disable_federation_response =
  {
  federation_status: federation_status option ;
  event_data_store_arn: string option }[@@ocaml.doc ""]
type nonrec disable_federation_request = {
  event_data_store: string }[@@ocaml.doc ""]
type nonrec describe_trails_response = {
  trail_list: trail list option }[@@ocaml.doc
                                   "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec describe_trails_request =
  {
  include_shadow_trails: bool option ;
  trail_name_list: string list option }[@@ocaml.doc
                                         "Returns information about the trail.\n"]
type nonrec delivery_status =
  | UNKNOWN 
  | CANCELLED 
  | ACCESS_DENIED_SIGNING_FILE 
  | ACCESS_DENIED 
  | RESOURCE_NOT_FOUND 
  | PENDING 
  | FAILED_SIGNING_FILE 
  | FAILED 
  | SUCCESS [@@ocaml.doc ""]
type nonrec describe_query_response =
  {
  delivery_status: delivery_status option ;
  delivery_s3_uri: string option ;
  error_message: string option ;
  query_statistics: query_statistics_for_describe_query option ;
  query_status: query_status option ;
  query_string: string option ;
  query_id: string option }[@@ocaml.doc ""]
type nonrec describe_query_request =
  {
  query_alias: string option ;
  query_id: string option ;
  event_data_store: string option }[@@ocaml.doc ""]
type nonrec deregister_organization_delegated_admin_response = unit
type nonrec deregister_organization_delegated_admin_request =
  {
  delegated_admin_account_id: string }[@@ocaml.doc
                                        "Removes CloudTrail delegated administrator permissions from a specified member account in an organization that is currently designated as a delegated administrator.\n"]
type nonrec account_not_registered_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified account is not registered as the CloudTrail delegated administrator.\n"]
type nonrec delete_trail_response = unit
type nonrec delete_trail_request = {
  name: string }[@@ocaml.doc
                  "The request that specifies the name of a trail to delete.\n"]
type nonrec delete_resource_policy_response = unit
type nonrec delete_resource_policy_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec delete_event_data_store_response = unit
type nonrec delete_event_data_store_request = {
  event_data_store: string }[@@ocaml.doc ""]
type nonrec channel_exists_for_eds_exception = {
  message: string option }[@@ocaml.doc
                            "This exception is thrown when the specified event data store cannot yet be deleted because it is in use by a channel.\n"]
type nonrec delete_channel_response = unit
type nonrec delete_channel_request = {
  channel: string }[@@ocaml.doc ""]
type nonrec create_trail_response =
  {
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  log_file_validation_enabled: bool option ;
  trail_ar_n: string option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_ar_n: string option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string option }[@@ocaml.doc
                         "Returns the objects or data listed below if successful. Otherwise, returns an error.\n"]
type nonrec create_trail_request =
  {
  tags_list: tag list option ;
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  enable_log_file_validation: bool option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string ;
  name: string }[@@ocaml.doc "Specifies the settings for each trail.\n"]
type nonrec create_event_data_store_response =
  {
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  tags_list: tag list option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }[@@ocaml.doc ""]
type nonrec create_event_data_store_request =
  {
  billing_mode: billing_mode option ;
  start_ingestion: bool option ;
  kms_key_id: string option ;
  tags_list: tag list option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_channel_response =
  {
  tags: tag list option ;
  destinations: destination list option ;
  source: string option ;
  name: string option ;
  channel_arn: string option }[@@ocaml.doc ""]
type nonrec create_channel_request =
  {
  tags: tag list option ;
  destinations: destination list ;
  source: string ;
  name: string }[@@ocaml.doc ""]
type nonrec channel_max_limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            " This exception is thrown when the maximum number of channels limit is exceeded. \n"]
type nonrec cancel_query_response =
  {
  query_status: query_status ;
  query_id: string }[@@ocaml.doc ""]
type nonrec cancel_query_request =
  {
  query_id: string ;
  event_data_store: string option }[@@ocaml.doc ""]
type nonrec add_tags_response = unit
type nonrec add_tags_request = {
  tags_list: tag list ;
  resource_id: string }[@@ocaml.doc
                         "Specifies the tags to add to a trail, event data store, or channel.\n"]