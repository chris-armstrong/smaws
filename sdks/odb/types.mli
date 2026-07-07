type nonrec character_set_type = NATIONAL [@ocaml.doc ""] | DATABASE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec managed_resource_status =
  | DISABLING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec zero_etl_access = {
  cidr : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The CIDR block for the Zero-ETL access.\n"]
  status : managed_resource_status option; [@ocaml.doc "The status of the Zero-ETL access.\n"]
}
[@@ocaml.doc "The configuration for Zero-ETL access from the ODB network.\n"]

type nonrec weeks_of_month = Smaws_Lib.Smithy_api.Types.integer list [@@ocaml.doc ""]

type nonrec wallet_type = INSTANCE [@ocaml.doc ""] | REGIONAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec vpc_endpoint_type = SERVICENETWORK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The description of the error.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The field name for which validation failed.\n"]
}
[@@ocaml.doc
  "The input failed to meet the constraints specified by the service in a specified field. Make \
   sure you provided the correct input and try again.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc "A list of fields that failed validation.\n"]
  reason : validation_exception_reason; [@ocaml.doc "The reason why the validation failed.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request has failed validation because it is missing required fields or has invalid inputs.\n"]

type nonrec resource_status =
  | MAINTENANCE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_odb_peering_connection_output = {
  odb_peering_connection_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The identifier of the Oracle Database\\@Amazon Web Services peering connection that was \
         updated.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the peering connection update operation.\n"]
  status : resource_status option;
      [@ocaml.doc "The status of the peering connection update operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The display name of the peering connection.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id_or_arn = string [@@ocaml.doc ""]

type nonrec resource_display_name = string [@@ocaml.doc ""]

type nonrec peered_cidr = string [@@ocaml.doc ""]

type nonrec peered_cidr_list = peered_cidr list [@@ocaml.doc ""]

type nonrec update_odb_peering_connection_input = {
  peer_network_cidrs_to_be_removed : peered_cidr_list option;
      [@ocaml.doc
        "A list of CIDR blocks to remove from the peering connection. The CIDR blocks must \
         currently exist in the peering connection.\n"]
  peer_network_cidrs_to_be_added : peered_cidr_list option;
      [@ocaml.doc
        "A list of CIDR blocks to add to the peering connection. These CIDR blocks define the IP \
         address ranges that can communicate through the peering connection. The CIDR blocks must \
         not overlap with existing CIDR blocks in the Oracle Database\\@Amazon Web Services \
         network.\n"]
  display_name : resource_display_name option;
      [@ocaml.doc "A new display name for the peering connection.\n"]
  odb_peering_connection_id : resource_id_or_arn;
      [@ocaml.doc
        "The identifier of the Oracle Database\\@Amazon Web Services peering connection to update.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of seconds to wait before retrying the request after being throttled.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec resource_not_found_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of resource that was not found.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the resource that was not found.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation tried to access a resource that doesn't exist. Make sure you provided the correct \
   resource and try again.\n"]

type nonrec internal_server_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of seconds to wait before retrying the request after an internal server error.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Occurs when there is an internal failure in the Oracle Database\\@Amazon Web Services service. \
   Wait and try again.\n"]

type nonrec conflict_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of resource that caused the conflict.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the resource that caused the conflict.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Occurs when a conflict with the current status of your resource. Fix any inconsistencies with \
   your resource and try again.\n"]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You don't have sufficient access to perform this action. Make sure you have the required \
   permissions and try again.\n"]

type nonrec update_odb_network_output = {
  odb_network_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the ODB network.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the ODB network.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the ODB network.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the ODB network.\n"]
}
[@@ocaml.doc ""]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec access = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec policy_document = string [@@ocaml.doc ""]

type nonrec update_odb_network_input = {
  cross_region_s3_restore_sources_to_disable : string_list option;
      [@ocaml.doc "The cross-Region Amazon S3 restore sources to disable for the ODB network.\n"]
  cross_region_s3_restore_sources_to_enable : string_list option;
      [@ocaml.doc "The cross-Region Amazon S3 restore sources to enable for the ODB network.\n"]
  kms_policy_document : policy_document option;
      [@ocaml.doc
        "The Amazon Web Services Key Management Service (KMS) policy document that defines \
         permissions for key usage within the ODB network.\n"]
  sts_policy_document : policy_document option;
      [@ocaml.doc
        "The Amazon Web Services Security Token Service (STS) policy document that defines \
         permissions for token service usage within the ODB network.\n"]
  s3_policy_document : policy_document option;
      [@ocaml.doc
        "Specifies the updated endpoint policy for Amazon S3 access from the ODB network.\n"]
  kms_access : access option;
      [@ocaml.doc
        "The Amazon Web Services Key Management Service (KMS) access configuration for the ODB \
         network.\n"]
  sts_access : access option;
      [@ocaml.doc
        "The Amazon Web Services Security Token Service (STS) access configuration for the ODB \
         network.\n"]
  zero_etl_access : access option;
      [@ocaml.doc "Specifies the updated configuration for Zero-ETL access from the ODB network.\n"]
  s3_access : access option;
      [@ocaml.doc
        "Specifies the updated configuration for Amazon S3 access from the ODB network.\n"]
  peered_cidrs_to_be_removed : string_list option;
      [@ocaml.doc "The list of CIDR ranges from the peered VPC to remove from the ODB network.\n"]
  peered_cidrs_to_be_added : string_list option;
      [@ocaml.doc
        "The list of CIDR ranges from the peered VPC that allow access to the ODB network.\n"]
  display_name : resource_display_name option;
      [@ocaml.doc "The new user-friendly name of the ODB network.\n"]
  odb_network_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the ODB network to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_cloud_exadata_infrastructure_output = {
  cloud_exadata_infrastructure_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the updated Exadata infrastructure.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Exadata infrastructure after the update \
         operation.\n"]
  status : resource_status option;
      [@ocaml.doc "The current status of the Exadata infrastructure after the update operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the updated Exadata infrastructure.\n"]
}
[@@ocaml.doc ""]

type nonrec day_of_week_name =
  | SUNDAY [@ocaml.doc ""]
  | SATURDAY [@ocaml.doc ""]
  | FRIDAY [@ocaml.doc ""]
  | THURSDAY [@ocaml.doc ""]
  | WEDNESDAY [@ocaml.doc ""]
  | TUESDAY [@ocaml.doc ""]
  | MONDAY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec day_of_week = {
  name : day_of_week_name option; [@ocaml.doc "The name of the day of the week.\n"]
}
[@@ocaml.doc "An enumeration of days of the week used for scheduling maintenance windows.\n"]

type nonrec days_of_week = day_of_week list [@@ocaml.doc ""]

type nonrec hours_of_day = Smaws_Lib.Smithy_api.Types.integer list [@@ocaml.doc ""]

type nonrec month_name =
  | DECEMBER [@ocaml.doc ""]
  | NOVEMBER [@ocaml.doc ""]
  | OCTOBER [@ocaml.doc ""]
  | SEPTEMBER [@ocaml.doc ""]
  | AUGUST [@ocaml.doc ""]
  | JULY [@ocaml.doc ""]
  | JUNE [@ocaml.doc ""]
  | MAY [@ocaml.doc ""]
  | APRIL [@ocaml.doc ""]
  | MARCH [@ocaml.doc ""]
  | FEBRUARY [@ocaml.doc ""]
  | JANUARY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec month = { name : month_name option [@ocaml.doc "The name of the month.\n"] }
[@@ocaml.doc "An enumeration of months used for scheduling maintenance windows.\n"]

type nonrec months = month list [@@ocaml.doc ""]

type nonrec patching_mode_type = NONROLLING [@ocaml.doc ""] | ROLLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec preference_type = CUSTOM_PREFERENCE [@ocaml.doc ""] | NO_PREFERENCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec maintenance_window = {
  weeks_of_month : weeks_of_month option;
      [@ocaml.doc "The weeks of the month when maintenance can be performed.\n"]
  skip_ru : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether to skip release updates during maintenance.\n"]
  preference : preference_type option;
      [@ocaml.doc "The preference for the maintenance window scheduling.\n"]
  patching_mode : patching_mode_type option;
      [@ocaml.doc "The patching mode for the maintenance window.\n"]
  months : months option; [@ocaml.doc "The months when maintenance can be performed.\n"]
  lead_time_in_weeks : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The lead time in weeks before the maintenance window.\n"]
  is_custom_action_timeout_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether custom action timeout is enabled for the maintenance window.\n"]
  hours_of_day : hours_of_day option;
      [@ocaml.doc "The hours of the day when maintenance can be performed.\n"]
  days_of_week : days_of_week option;
      [@ocaml.doc "The days of the week when maintenance can be performed.\n"]
  custom_action_timeout_in_mins : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The custom action timeout in minutes for the maintenance window.\n"]
}
[@@ocaml.doc
  "The scheduling details for the maintenance window. Patching and system updates take place \
   during the maintenance window.\n"]

type nonrec update_cloud_exadata_infrastructure_input = {
  maintenance_window : maintenance_window option; [@ocaml.doc ""]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Exadata infrastructure to update.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_resource_status =
  | STANDBY [@ocaml.doc ""]
  | INACCESSIBLE [@ocaml.doc ""]
  | UPGRADING [@ocaml.doc ""]
  | ROLE_CHANGE_IN_PROGRESS [@ocaml.doc ""]
  | RECREATING [@ocaml.doc ""]
  | RESTARTING [@ocaml.doc ""]
  | AVAILABLE_NEEDS_ATTENTION [@ocaml.doc ""]
  | SCALE_IN_PROGRESS [@ocaml.doc ""]
  | BACKUP_IN_PROGRESS [@ocaml.doc ""]
  | RESTORE_FAILED [@ocaml.doc ""]
  | RESTORE_IN_PROGRESS [@ocaml.doc ""]
  | UNAVAILABLE [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | MAINTENANCE_IN_PROGRESS [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database, if applicable.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database that was updated.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec db_workload =
  | LH [@ocaml.doc ""]
  | APEX [@ocaml.doc ""]
  | AJD [@ocaml.doc ""]
  | OLTP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec database_tool = {
  max_idle_time_in_minutes : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum amount of time, in minutes, that the database management tool can be idle \
         before it is shut down.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The compute capacity allocated to the database management tool.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the database management tool.\n"]
  is_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the database management tool is enabled.\n"]
}
[@@ocaml.doc "Information about a database management tool for an Autonomous Database.\n"]

type nonrec database_tool_list = database_tool list [@@ocaml.doc ""]

type nonrec database_edition =
  | ENTERPRISE_EDITION [@ocaml.doc ""]
  | STANDARD_EDITION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_model =
  | LICENSE_INCLUDED [@ocaml.doc ""]
  | BRING_YOUR_OWN_LICENSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec autonomous_maintenance_schedule_type = REGULAR [@ocaml.doc ""] | EARLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec customer_contact = {
  email : sensitive_string option; [@ocaml.doc "The email address of the contact.\n"]
}
[@@ocaml.doc
  "A contact to receive notification from Oracle about maintenance updates for a specific Exadata \
   infrastructure.\n"]

type nonrec customer_contacts = customer_contact list [@@ocaml.doc ""]

type nonrec scheduled_operation_details = {
  scheduled_stop_time : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The scheduled stop time for the Autonomous Database, in UTC.\n"]
  scheduled_start_time : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The scheduled start time for the Autonomous Database, in UTC.\n"]
  day_of_week : day_of_week;
      [@ocaml.doc "The day of the week on which the scheduled operation occurs.\n"]
}
[@@ocaml.doc
  "The scheduled start and stop times for an Autonomous Database on a specific day of the week.\n"]

type nonrec scheduled_operation_details_list = scheduled_operation_details list [@@ocaml.doc ""]

type nonrec repeat_cadence =
  | YEARLY [@ocaml.doc ""]
  | MONTHLY [@ocaml.doc ""]
  | WEEKLY [@ocaml.doc ""]
  | ONE_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec long_term_backup_schedule = {
  time_of_backup : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time at which the long-term backup is taken.\n"]
  retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The retention period, in days, for long-term backups.\n"]
  repeat_cadence : repeat_cadence option;
      [@ocaml.doc "The cadence at which long-term backups are taken.\n"]
  is_disabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the long-term backup schedule is disabled.\n"]
}
[@@ocaml.doc "The long-term backup schedule for an Autonomous Database.\n"]

type nonrec open_mode = READ_WRITE [@ocaml.doc ""] | READ_ONLY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec permission_level = UNRESTRICTED [@ocaml.doc ""] | RESTRICTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec refreshable_mode = MANUAL [@ocaml.doc ""] | AUTOMATIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec resource_pool_summary = {
  available_compute_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The available compute capacity in the resource pool.\n"]
  total_compute_capacity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total compute capacity of the resource pool.\n"]
  available_storage_capacity_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The available storage capacity in the resource pool, in TB.\n"]
  pool_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total storage size of the resource pool, in terabytes (TB).\n"]
  pool_size : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of Autonomous Databases that the resource pool can contain.\n"]
  is_disabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the resource pool is disabled.\n"]
}
[@@ocaml.doc "The configuration of a resource pool for an Autonomous Database.\n"]

type nonrec standby_allowlisted_ips_source =
  | NOT_APPLICABLE [@ocaml.doc ""]
  | SEPARATE [@ocaml.doc ""]
  | PRIMARY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec encryption_key_provider_input =
  | AWS_KMS [@ocaml.doc ""]
  | ORACLE_MANAGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec external_id_type =
  | TENANT_OCID [@ocaml.doc ""]
  | COMPARTMENT_OCID [@ocaml.doc ""]
  | DATABASE_OCID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kms_key_id_or_arn = string [@@ocaml.doc ""]

type nonrec aws_encryption_key_configuration_input = {
  kms_key_id : kms_key_id_or_arn option;
      [@ocaml.doc
        "The identifier or ARN of the Amazon Web Services KMS key to use for encryption.\n"]
  external_id_type : external_id_type option;
      [@ocaml.doc "The type of external identifier associated with the encryption key.\n"]
  iam_role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Identity and Access Management \
         (IAM) role that grants access to the KMS key.\n"]
}
[@@ocaml.doc
  "The configuration of the Amazon Web Services Key Management Service (KMS) encryption key to use \
   for an Autonomous Database.\n"]

type nonrec encryption_key_configuration_input =
  | AwsEncryptionKey of aws_encryption_key_configuration_input
      [@ocaml.doc
        "The configuration of the Amazon Web Services Key Management Service (KMS) encryption key \
         to use.\n"]
[@@ocaml.doc
  "The configuration of the encryption key to use for an Autonomous Database. This is a union, so \
   only one of the following members can be specified.\n"]

type nonrec update_autonomous_database_input = {
  encryption_key_configuration : encryption_key_configuration_input option;
      [@ocaml.doc "The configuration of the encryption key to use for the Autonomous Database.\n"]
  encryption_key_provider : encryption_key_provider_input option;
      [@ocaml.doc "The provider of the encryption key to use for the Autonomous Database.\n"]
  time_of_auto_refresh_start : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time at which the automatic refresh of the refreshable clone Autonomous \
         Database starts.\n"]
  auto_refresh_point_lag_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time lag, in seconds, between the refreshable clone and its source Autonomous Database.\n"]
  auto_refresh_frequency_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The frequency, in seconds, at which the refreshable clone Autonomous Database is \
         automatically refreshed.\n"]
  allowlisted_ips : string_list option;
      [@ocaml.doc "The list of IP addresses that are allowed to access the Autonomous Database.\n"]
  standby_allowlisted_ips : string_list option;
      [@ocaml.doc
        "The list of IP addresses that are allowed to access the standby Autonomous Database.\n"]
  standby_allowlisted_ips_source : standby_allowlisted_ips_source option;
      [@ocaml.doc
        "The source of the allowlisted IP addresses for the standby Autonomous Database.\n"]
  resource_pool_summary : resource_pool_summary option;
      [@ocaml.doc "The configuration of the resource pool for the Autonomous Database.\n"]
  resource_pool_leader_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the resource pool leader Autonomous Database.\n"]
  peer_db_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the peer Autonomous Database.\n"]
  private_endpoint_label : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint label for the Autonomous Database.\n"]
  private_endpoint_ip : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint IP address for the Autonomous Database.\n"]
  refreshable_mode : refreshable_mode option;
      [@ocaml.doc "The refresh mode of the refreshable clone Autonomous Database.\n"]
  permission_level : permission_level option;
      [@ocaml.doc "The permission level of the Autonomous Database.\n"]
  open_mode : open_mode option;
      [@ocaml.doc
        "The mode in which to open the Autonomous Database, either read-only or read/write.\n"]
  long_term_backup_schedule : long_term_backup_schedule option;
      [@ocaml.doc "The long-term backup schedule for the Autonomous Database.\n"]
  scheduled_operations : scheduled_operation_details_list option;
      [@ocaml.doc "The list of scheduled start and stop times for the Autonomous Database.\n"]
  customer_contacts_to_send_to_oc_i : customer_contacts option;
      [@ocaml.doc
        "The list of customer contacts to receive operational notifications from OCI for the \
         Autonomous Database.\n"]
  autonomous_maintenance_schedule_type : autonomous_maintenance_schedule_type option;
      [@ocaml.doc "The maintenance schedule type for the Autonomous Database.\n"]
  local_adg_auto_failover_max_data_loss_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum data loss limit, in seconds, for automatic failover to the local Oracle Data \
         Guard standby database.\n"]
  byol_compute_count_limit : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The maximum number of compute resources that you can allocate to the Autonomous Database \
         under the bring-your-own-license (BYOL) model.\n"]
  backup_retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The retention period, in days, for automatic backups of the Autonomous Database.\n"]
  is_disconnect_peer : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to disconnect the Autonomous Database from its peer database.\n"]
  is_refreshable_clone : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Specifies whether the Autonomous Database is a refreshable clone.\n"]
  is_mtls_connection_required : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether mutual TLS (mTLS) authentication is required to connect to the \
         Autonomous Database.\n"]
  is_local_data_guard_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable local Oracle Data Guard for the Autonomous Database.\n"]
  is_backup_retention_locked : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to lock the backup retention period of the Autonomous Database to \
         prevent it from being shortened.\n"]
  is_auto_scaling_for_storage_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable automatic scaling of the storage for the Autonomous Database.\n"]
  is_auto_scaling_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable automatic scaling of the compute resources for the Autonomous \
         Database.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model to apply to the Autonomous Database.\n"]
  database_edition : database_edition option;
      [@ocaml.doc "The Oracle Database edition to apply to the Autonomous Database.\n"]
  db_tools_details : database_tool_list option;
      [@ocaml.doc "The list of database management tools to enable for the Autonomous Database.\n"]
  db_workload : db_workload option;
      [@ocaml.doc
        "The intended use of the Autonomous Database, such as transaction processing, data \
         warehouse, JSON database, or APEX.\n"]
  db_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Database software version to use for the Autonomous Database.\n"]
  db_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The new name of the Autonomous Database.\n"]
  display_name : resource_display_name option;
      [@ocaml.doc "The new user-friendly name for the Autonomous Database.\n"]
  data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size, in gigabytes (GB), of the data volume to allocate for the Autonomous Database.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size, in terabytes (TB), of the data volume to allocate for the Autonomous Database.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores to allocate to the Autonomous Database.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The compute capacity, in number of ECPUs or OCPUs, to assign to the Autonomous Database.\n"]
  admin_password : sensitive_string option;
      [@ocaml.doc "The new password for the [ADMIN] user of the Autonomous Database.\n"]
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_autonomous_database_backup_output = {
  autonomous_database_backup_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database backup that was updated.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database backup, if \
         applicable.\n"]
  status : resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database backup.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database backup.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec update_autonomous_database_backup_input = {
  retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The retention period, in days, for the Autonomous Database backup.\n"]
  autonomous_database_backup_id : resource_id;
      [@ocaml.doc "The unique identifier of the Autonomous Database backup to update.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_keys; [@ocaml.doc "The names (keys) of the tags to remove from the resource.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]
}
[@@ocaml.doc ""]

type nonrec transportable_tablespace = {
  tts_bundle_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The URL of the transportable tablespace bundle to use when creating the Autonomous \
         Database.\n"]
}
[@@ocaml.doc
  "The transportable tablespace configuration used when creating an Autonomous Database.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec request_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : request_tag_map; [@ocaml.doc "The list of tags to apply to the resource.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to apply tags to.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unqiue identifier of the service quota that was exceeded.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of resource that exceeded the service quota.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the resource that exceeded the service quota.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "You have exceeded the service quota.\n"]

type nonrec system_version_summary = {
  system_versions : string_list option;
      [@ocaml.doc
        "The Exadata system versions that are compatible with the specified Exadata shape and GI \
         version.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The Exadata hardware model.\n"]
  gi_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The version of GI software.\n"]
}
[@@ocaml.doc
  "Information about the compatible system versions that can be used with a specific Exadata shape \
   and Grid Infrastructure (GI) version.\n"]

type nonrec system_version_list = system_version_summary list [@@ocaml.doc ""]

type nonrec switchover_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Autonomous Database after the switchover \
         operation.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database after the switchover operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was switched over.\n"]
}
[@@ocaml.doc ""]

type nonrec switchover_autonomous_database_input = {
  peer_db_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the peer Autonomous Database to switch over to.\n"]
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to switch over.\n"]
}
[@@ocaml.doc ""]

type nonrec supported_aws_integration = KmsTde [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec subscription_error = {
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A human-readable message that describes the subscription error.\n"]
}
[@@ocaml.doc "Information about an error that occurred during the subscription process.\n"]

type nonrec subscription_errors = subscription_error list [@@ocaml.doc ""]

type nonrec sts_access = {
  sts_policy_document : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Web Services Security Token Service (STS) policy document that defines \
         permissions for token service usage.\n"]
  domain_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The domain name for Amazon Web Services Security Token Service (STS) access configuration.\n"]
  ipv4_addresses : string_list option;
      [@ocaml.doc
        "The IPv4 addresses allowed for Amazon Web Services Security Token Service (STS) access.\n"]
  status : managed_resource_status option;
      [@ocaml.doc
        "The current status of the Amazon Web Services Security Token Service (STS) access \
         configuration.\n"]
}
[@@ocaml.doc
  "Configuration for Amazon Web Services Security Token Service (STS) access from the ODB network.\n"]

type nonrec db_node_resource_status =
  | STARTING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stop_db_node_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the DB node after the stop operation.\n"]
  status : db_node_resource_status option;
      [@ocaml.doc "The current status of the DB node after the stop operation.\n"]
  db_node_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the DB node that was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_db_node_input = {
  db_node_id : resource_id; [@ocaml.doc "The unique identifier of the DB node to stop.\n"]
  cloud_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the VM cluster that contains the DB node to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Autonomous Database after the stop \
         operation.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database after the stop operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was stopped.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_autonomous_database_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec start_db_node_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the DB node after the start operation.\n"]
  status : db_node_resource_status option;
      [@ocaml.doc "The current status of the DB node after the start operation.\n"]
  db_node_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the DB node that was started.\n"]
}
[@@ocaml.doc ""]

type nonrec start_db_node_input = {
  db_node_id : resource_id; [@ocaml.doc "The unique identifier of the DB node to start.\n"]
  cloud_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the VM cluster that contains the DB node to start.\n"]
}
[@@ocaml.doc ""]

type nonrec start_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Autonomous Database after the start \
         operation.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database after the start operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was started.\n"]
}
[@@ocaml.doc ""]

type nonrec start_autonomous_database_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to start.\n"]
}
[@@ocaml.doc ""]

type nonrec source_type =
  | CLONE_TO_REFRESHABLE [@ocaml.doc ""]
  | CROSS_REGION_DISASTER_RECOVERY [@ocaml.doc ""]
  | CROSS_REGION_DATAGUARD [@ocaml.doc ""]
  | BACKUP_FROM_TIMESTAMP [@ocaml.doc ""]
  | BACKUP_FROM_ID [@ocaml.doc ""]
  | DATABASE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec clone_type = PARTIAL [@ocaml.doc ""] | METADATA [@ocaml.doc ""] | FULL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec database_clone_configuration = {
  clone_type : clone_type;
      [@ocaml.doc
        "The type of clone to create, either a full clone, a metadata clone, or a partial clone.\n"]
  source_autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the source Autonomous Database to clone.\n"]
}
[@@ocaml.doc
  "The configuration for creating an Autonomous Database as a clone of an existing database.\n"]

type nonrec integer_list = Smaws_Lib.Smithy_api.Types.integer list [@@ocaml.doc ""]

type nonrec restore_from_backup_configuration = {
  clone_table_space_list : integer_list option;
      [@ocaml.doc "The list of tablespace identifiers to clone from the backup.\n"]
  clone_type : clone_type; [@ocaml.doc "The type of clone to create from the backup.\n"]
  autonomous_database_backup_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database backup to restore from.\n"]
}
[@@ocaml.doc "The configuration for creating an Autonomous Database by restoring from a backup.\n"]

type nonrec point_in_time_restore_configuration = {
  clone_table_space_list : integer_list option;
      [@ocaml.doc "The list of tablespace identifiers to clone from the point-in-time restore.\n"]
  use_latest_available_backup_timestamp : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether to use the latest available backup timestamp for the restore.\n"]
  timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time to which to restore the Autonomous Database.\n"]
  clone_type : clone_type;
      [@ocaml.doc "The type of clone to create from the point-in-time restore.\n"]
  source_autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the source Autonomous Database to restore from.\n"]
}
[@@ocaml.doc
  "The configuration for creating an Autonomous Database by restoring to a point in time.\n"]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec cross_region_data_guard_configuration = {
  source_autonomous_database_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source Autonomous Database for the cross-Region \
         Oracle Data Guard configuration.\n"]
}
[@@ocaml.doc
  "The configuration for creating an Autonomous Database as a cross-Region Oracle Data Guard peer.\n"]

type nonrec disaster_recovery_type = BACKUP_BASED [@ocaml.doc ""] | ADG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cross_region_disaster_recovery_configuration = {
  is_replicate_automatic_backups : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether automatic backups are replicated to the disaster recovery database.\n"]
  remote_disaster_recovery_type : disaster_recovery_type;
      [@ocaml.doc
        "The type of remote disaster recovery to configure, either Autonomous Data Guard or \
         backup-based.\n"]
  source_autonomous_database_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source Autonomous Database for the cross-Region \
         disaster recovery configuration.\n"]
}
[@@ocaml.doc
  "The configuration for creating an Autonomous Database as a cross-Region disaster recovery peer.\n"]

type nonrec clone_to_refreshable_configuration = {
  clone_type : clone_type option; [@ocaml.doc "The type of clone to create.\n"]
  open_mode : open_mode option;
      [@ocaml.doc
        "The mode in which to open the refreshable clone, either read-only or read/write.\n"]
  time_of_auto_refresh_start : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time at which the automatic refresh of the refreshable clone starts.\n"]
  auto_refresh_point_lag_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time lag, in seconds, between the refreshable clone and its source database.\n"]
  auto_refresh_frequency_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The frequency, in seconds, at which the refreshable clone is automatically refreshed.\n"]
  refreshable_mode : refreshable_mode option;
      [@ocaml.doc "The refresh mode of the refreshable clone, either automatic or manual.\n"]
  source_autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the source Autonomous Database to create the refreshable clone \
         from.\n"]
}
[@@ocaml.doc "The configuration for creating an Autonomous Database as a refreshable clone.\n"]

type nonrec source_configuration =
  | CloneToRefreshable of clone_to_refreshable_configuration
      [@ocaml.doc
        "The configuration for creating the Autonomous Database as a refreshable clone.\n"]
  | CrossRegionDisasterRecovery of cross_region_disaster_recovery_configuration
      [@ocaml.doc
        "The configuration for creating the Autonomous Database as a cross-Region disaster \
         recovery peer.\n"]
  | CrossRegionDataGuard of cross_region_data_guard_configuration
      [@ocaml.doc
        "The configuration for creating the Autonomous Database as a cross-Region Oracle Data \
         Guard peer.\n"]
  | PointInTimeRestore of point_in_time_restore_configuration
      [@ocaml.doc
        "The configuration for creating the Autonomous Database by restoring to a point in time.\n"]
  | RestoreFromBackup of restore_from_backup_configuration
      [@ocaml.doc
        "The configuration for creating the Autonomous Database by restoring from a backup.\n"]
  | DatabaseClone of database_clone_configuration
      [@ocaml.doc
        "The configuration for creating the Autonomous Database as a clone of an existing database.\n"]
[@@ocaml.doc
  "The configuration details for the source used to create an Autonomous Database. This is a \
   union, so only one of the following members can be specified.\n"]

type nonrec shrink_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Autonomous Database after the shrink \
         operation.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database after the shrink operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was shrunk.\n"]
}
[@@ocaml.doc ""]

type nonrec shrink_autonomous_database_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to shrink.\n"]
}
[@@ocaml.doc ""]

type nonrec shape_type =
  | AMPERE_FLEX_A1 [@ocaml.doc ""]
  | INTEL_FLEX_X9 [@ocaml.doc ""]
  | INTEL [@ocaml.doc ""]
  | AMD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_network_endpoint = {
  vpc_endpoint_type : vpc_endpoint_type option; [@ocaml.doc "The type of the VPC endpoint.\n"]
  vpc_endpoint_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the VPC endpoint.\n"]
}
[@@ocaml.doc "The configuration for a service network endpoint.\n"]

type nonrec sensitive_string_list = sensitive_string list [@@ocaml.doc ""]

type nonrec s3_access = {
  s3_policy_document : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint policy for the Amazon S3 access.\n"]
  domain_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The domain name for the Amazon S3 access.\n"]
  ipv4_addresses : string_list option; [@ocaml.doc "The IPv4 addresses for the Amazon S3 access.\n"]
  status : managed_resource_status option; [@ocaml.doc "The status of the Amazon S3 access.\n"]
}
[@@ocaml.doc "The configuration for Amazon S3 access from the ODB network.\n"]

type nonrec restore_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Autonomous Database after the restore \
         operation.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database after the restore operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was restored.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_autonomous_database_input = {
  timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time to which to restore the Autonomous Database.\n"]
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to restore.\n"]
}
[@@ocaml.doc ""]

type nonrec response_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec resource_id_list = resource_id list [@@ocaml.doc ""]

type nonrec refreshable_status = NOT_REFRESHING [@ocaml.doc ""] | REFRESHING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reboot_db_node_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the DB node after the reboot operation.\n"]
  status : db_node_resource_status option;
      [@ocaml.doc "The current status of the DB node after the reboot operation.\n"]
  db_node_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the DB node that was rebooted.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_db_node_input = {
  db_node_id : resource_id; [@ocaml.doc "The unique identifier of the DB node to reboot.\n"]
  cloud_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the VM cluster that contains the DB node to reboot.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Autonomous Database after the reboot \
         operation.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database after the reboot operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was rebooted.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_autonomous_database_input = {
  is_online_reboot : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to perform an online reboot of the Autonomous Database without \
         interrupting active connections.\n"]
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to reboot.\n"]
}
[@@ocaml.doc ""]

type nonrec peer_network_route_table_id = string [@@ocaml.doc ""]

type nonrec peer_network_route_table_id_list = peer_network_route_table_id list [@@ocaml.doc ""]

type nonrec operations_insights_status =
  | FAILED_DISABLING [@ocaml.doc ""]
  | FAILED_ENABLING [@ocaml.doc ""]
  | NOT_ENABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec okv_encryption_key_configuration = {
  okv_uri : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The URI of the Oracle Key Vault (OKV) server.\n"]
  okv_kms_key : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the Oracle Key Vault (OKV) key to use for encryption.\n"]
  directory_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The name of the directory where the Oracle Key Vault (OKV) configuration is stored.\n"]
  certificate_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The identifier of the Oracle Key Vault (OKV) certificate.\n"]
  certificate_directory_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The name of the directory that contains the Oracle Key Vault (OKV) certificate.\n"]
}
[@@ocaml.doc
  "The configuration of the Oracle Key Vault (OKV) encryption key used for an Autonomous Database.\n"]

type nonrec odb_peering_connection_summary = {
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The percentage progress of the ODB peering connection creation or deletion.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the ODB peering connection was created.\n"]
  peer_network_cidrs : peered_cidr_list option;
      [@ocaml.doc
        "The CIDR blocks associated with the peering connection. These CIDR blocks define the IP \
         address ranges that can communicate through the peering connection.\n"]
  odb_peering_connection_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The type of the ODB peering connection.\n\n Valid Values: [ODB-VPC | ODB-ODB] \n "]
  peer_network_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the peer network.\n"]
  odb_network_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network that initiated the peering connection.\n"]
  odb_peering_connection_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ODB peering connection.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for the current status of the ODB peering connection.\n"]
  status : resource_status option; [@ocaml.doc "The status of the ODB peering connection.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The display name of the ODB peering connection.\n"]
  odb_peering_connection_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the ODB peering connection. A sample ID is \
         [odbpcx-abcdefgh12345678].\n"]
}
[@@ocaml.doc "A summary of an ODB peering connection.\n"]

type nonrec odb_peering_connection_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec odb_peering_connection_list = odb_peering_connection_summary list [@@ocaml.doc ""]

type nonrec odb_peering_connection = {
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The percentage progress of the ODB peering connection creation or deletion.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The timestamp when the ODB peering connection was created.\n"]
  peer_network_cidrs : peered_cidr_list option;
      [@ocaml.doc
        "The CIDR blocks associated with the peering connection. These CIDR blocks define the IP \
         address ranges that can communicate through the peering connection.\n"]
  odb_peering_connection_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The type of the ODB peering connection.\n\n Valid Values: [ODB-VPC | ODB-ODB] \n "]
  peer_network_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the peer network.\n"]
  odb_network_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network that initiated the peering connection.\n"]
  odb_peering_connection_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB peering connection.\n\n\
        \ Example: \
         [arn:aws:odb:us-east-1:123456789012:odb-peering-connection/odbpcx-abcdefgh12345678] \n\
        \ "]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for the current status of the ODB peering connection.\n"]
  status : resource_status option; [@ocaml.doc "The status of the ODB peering connection.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The display name of the ODB peering connection.\n"]
  odb_peering_connection_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the ODB peering connection. A sample ID is \
         [odbpcx-abcdefgh12345678].\n"]
}
[@@ocaml.doc
  "A peering connection between an ODB network and either another ODB network or a customer-owned \
   VPC.\n"]

type nonrec oci_dns_forwarding_config = {
  oci_dns_listener_ip : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "OCI DNS listener IP for custom DNS setup.\n"]
  domain_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Domain name to which DNS resolver forwards to.\n"]
}
[@@ocaml.doc "DNS configuration to forward DNS resolver endpoints to your OCI Private Zone.\n"]

type nonrec oci_dns_forwarding_config_list = oci_dns_forwarding_config list [@@ocaml.doc ""]

type nonrec managed_s3_backup_access = {
  ipv4_addresses : string_list option;
      [@ocaml.doc "The IPv4 addresses for the managed Amazon S3 backup access.\n"]
  status : managed_resource_status option;
      [@ocaml.doc "The status of the managed Amazon S3 backup access.\n"]
}
[@@ocaml.doc "The configuration for managed Amazon S3 backup access from the ODB network.\n"]

type nonrec kms_access = {
  kms_policy_document : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Web Services Key Management Service (KMS) policy document that defines \
         permissions for key usage.\n"]
  domain_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The domain name for Amazon Web Services Key Management Service (KMS) access configuration.\n"]
  ipv4_addresses : string_list option;
      [@ocaml.doc
        "The IPv4 addresses allowed for Amazon Web Services Key Management Service (KMS) access.\n"]
  status : managed_resource_status option;
      [@ocaml.doc
        "The current status of the Amazon Web Services Key Management Service (KMS) access \
         configuration.\n"]
}
[@@ocaml.doc
  "Configuration for Amazon Web Services Key Management Service (KMS) access from the ODB network.\n"]

type nonrec cross_region_s3_restore_sources_access = {
  status : managed_resource_status option;
      [@ocaml.doc
        "The current status of the cross-Region Amazon S3 restore access configuration.\n"]
  ipv4_addresses : string_list option;
      [@ocaml.doc "The IPv4 addresses allowed for cross-Region Amazon S3 restore access.\n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region for cross-Region Amazon S3 restore access.\n"]
}
[@@ocaml.doc
  "The configuration access for the cross-Region Amazon S3 database restore source for the ODB \
   network.\n"]

type nonrec cross_region_s3_restore_sources_access_list =
  cross_region_s3_restore_sources_access list
[@@ocaml.doc ""]

type nonrec managed_services = {
  cross_region_s3_restore_sources_access : cross_region_s3_restore_sources_access_list option;
      [@ocaml.doc
        "The access configuration for the cross-Region Amazon S3 database restore source.\n"]
  kms_access : kms_access option;
      [@ocaml.doc "The Amazon Web Services Key Management Service (KMS) access configuration.\n"]
  sts_access : sts_access option;
      [@ocaml.doc "The Amazon Web Services Security Token Service (STS) access configuration.\n"]
  s3_access : s3_access option; [@ocaml.doc "The Amazon S3 access configuration.\n"]
  zero_etl_access : zero_etl_access option; [@ocaml.doc "The Zero-ETL access configuration.\n"]
  managed_s3_backup_access : managed_s3_backup_access option;
      [@ocaml.doc "The managed Amazon S3 backup access configuration.\n"]
  service_network_endpoint : service_network_endpoint option;
      [@ocaml.doc "The service network endpoint configuration.\n"]
  managed_services_ipv4_cidrs : string_list option;
      [@ocaml.doc "The IPv4 CIDR blocks for the managed services.\n"]
  resource_gateway_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource gateway.\n"]
  service_network_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the service network.\n"]
}
[@@ocaml.doc "The managed services configuration for the ODB network.\n"]

type nonrec odb_network_summary = {
  ec2_placement_group_ids : resource_id_list option;
      [@ocaml.doc "The list of EC2 Placement Group IDs associated with your ODB network.\n"]
  managed_services : managed_services option;
      [@ocaml.doc "The managed services configuration for the ODB network.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The amount of progress made on the current operation on the ODB network, expressed as a \
         percentage.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the ODB network was created.\n"]
  oci_dns_forwarding_configs : oci_dns_forwarding_config_list option;
      [@ocaml.doc
        "The DNS resolver endpoint in OCI for forwarding DNS queries for the ociPrivateZone domain.\n"]
  oci_vcn_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for the VCN that's associated with the ODB network.\n"]
  oci_vcn_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Oracle Cloud ID (OCID) for the Virtual Cloud Network (VCN) associated with the ODB \
         network.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor associated with the ODB network.\n"]
  oci_network_anchor_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL of the OCI network anchor for the ODB network.\n"]
  oci_network_anchor_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the OCI network anchor for the ODB network.\n"]
  peered_cidrs : string_list option;
      [@ocaml.doc
        "The list of CIDR ranges from the peered VPC that are allowed access to the ODB network.\n"]
  default_dns_prefix : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The DNS prefix to the default DNS domain name. The default DNS domain name is \
         oraclevcn.com.\n"]
  custom_domain_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The domain name for the resources in the ODB network.\n"]
  backup_subnet_cidr : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The CIDR range of the backup subnet in the ODB network.\n"]
  client_subnet_cidr : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The CIDR range of the client subnet in the ODB network.\n"]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The AZ ID of the AZ where the ODB network is located.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Web Services Availability Zone (AZ) where the ODB network is located.\n"]
  odb_network_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ODB network.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the current status of the ODB network.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the ODB network.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the ODB network.\n"]
  odb_network_id : resource_id_or_arn; [@ocaml.doc "The unique identifier of the ODB network.\n"]
}
[@@ocaml.doc "Information about an ODB network.\n"]

type nonrec odb_network_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec odb_network_list = odb_network_summary list [@@ocaml.doc ""]

type nonrec odb_network = {
  ec2_placement_group_ids : resource_id_list option;
      [@ocaml.doc "The list of EC2 Placement Group IDs associated with your ODB network.\n"]
  managed_services : managed_services option;
      [@ocaml.doc "The managed services configuration for the ODB network.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The amount of progress made on the current operation on the ODB network, expressed as a \
         percentage.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the ODB network was created.\n"]
  oci_dns_forwarding_configs : oci_dns_forwarding_config_list option;
      [@ocaml.doc
        "The DNS resolver endpoint in OCI for forwarding DNS queries for the ociPrivateZone domain.\n"]
  oci_vcn_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for the VCN that's associated with the ODB network.\n"]
  oci_vcn_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Oracle Cloud ID (OCID) for the Virtual Cloud Network (VCN) that's associated with the \
         ODB network.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor that's associated with the ODB network.\n"]
  oci_network_anchor_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL of the OCI network anchor for the ODB network.\n"]
  oci_network_anchor_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the OCI network anchor for the ODB network.\n"]
  peered_cidrs : string_list option;
      [@ocaml.doc
        "The list of CIDR ranges from the peered VPC that are allowed access to the ODB network.\n"]
  default_dns_prefix : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The DNS prefix to the default DNS domain name. The default DNS domain name is \
         oraclevcn.com.\n"]
  custom_domain_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The domain name for the resources in the ODB network.\n"]
  backup_subnet_cidr : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The CIDR range of the backup subnet in the ODB network.\n"]
  client_subnet_cidr : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The CIDR range of the client subnet in the ODB network.\n"]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The AZ ID of the AZ where the ODB network is located.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Web Services Availability Zone (AZ) where the ODB network is located.\n"]
  odb_network_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the ODB network.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the current status of the ODB network.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the ODB network.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the ODB network.\n"]
  odb_network_id : resource_id_or_arn; [@ocaml.doc "The unique identifier of the ODB network.\n"]
}
[@@ocaml.doc "Information about an ODB network.\n"]

type nonrec list_tags_for_resource_response = {
  tags : response_tag_map option; [@ocaml.doc "The list of tags applied to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec list_system_versions_output = {
  system_versions : system_version_list; [@ocaml.doc "The list of system versions.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_system_versions_input = {
  shape : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The Exadata hardware system model.\n"]
  gi_version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The software version of the Exadata Grid Infrastructure (GI).\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec gi_version_summary = {
  version : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The GI software version.\n"]
}
[@@ocaml.doc
  "Information about a specific version of Oracle Grid Infrastructure (GI) software that can be \
   installed on a VM cluster.\n"]

type nonrec gi_version_list = gi_version_summary list [@@ocaml.doc ""]

type nonrec list_gi_versions_output = {
  gi_versions : gi_version_list; [@ocaml.doc "The list of GI versions and their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_gi_versions_input = {
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The shape to return GI versions for. For a list of valid shapes, use the \
         [ListDbSystemShapes] operation..\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec compute_model = OCPU [@ocaml.doc ""] | ECPU [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec db_system_shape_summary = {
  are_server_types_supported : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether the hardware system model supports configurable database and server \
         storage types.\n"]
  compute_model : compute_model option;
      [@ocaml.doc
        "The OCI model compute model used when you create or clone an instance: ECPU or OCPU. An \
         ECPU is an abstracted measure of compute resources. ECPUs are based on the number of \
         cores elastically allocated from a pool of compute and storage servers. An OCPU is a \
         legacy physical measure of compute resources. OCPUs are based on the physical core of a \
         processor with hyper-threading enabled. \n"]
  name : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The name of the shape.\n"]
  shape_type : shape_type option;
      [@ocaml.doc "The shape type. This property is determined by the CPU hardware.\n"]
  shape_family : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The family of the shape.\n"]
  runtime_minimum_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The runtime minimum number of CPU cores that can be enabled for the shape.\n"]
  minimum_node_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The minimum number of compute servers that are available for the shape.\n"]
  minimum_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The minimum number of CPU cores that can be enabled for the shape.\n"]
  min_storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The minimum number of Exadata storage servers that are available for the shape.\n"]
  min_memory_per_node_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The minimum amount of memory, in gigabytes (GB), that must be allocated per DB node for \
         the shape.\n"]
  min_db_node_storage_per_node_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The minimum amount of DB node storage, in gigabytes (GB), that must be allocated per DB \
         node for the shape.\n"]
  min_data_storage_in_t_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The minimum amount of data storage, in terabytes (TB), that must be allocated for the \
         shape.\n"]
  min_core_count_per_node : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The minimum number of CPU cores that can be enabled per node for the shape.\n"]
  maximum_node_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of compute servers that is available for the shape.\n"]
  max_storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of Exadata storage servers that's available for the shape.\n"]
  core_count_increment : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The discrete number by which the CPU core count for the shape can be increased or \
         decreased.\n"]
  available_memory_per_node_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum amount of memory, in gigabytes (GB), that's available per DB node for the \
         shape.\n"]
  available_memory_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum amount of memory, in gigabytes (GB), that can be enabled for the shape.\n"]
  available_db_node_storage_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum amount of DB node storage, in gigabytes (GB), that can be enabled for the \
         shape.\n"]
  available_db_node_per_node_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum amount of DB node storage, in gigabytes (GB), that's available per DB node \
         for the shape.\n"]
  available_data_storage_per_server_in_t_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum amount of data storage, in terabytes (TB), that's available per storage \
         server for the shape.\n"]
  available_data_storage_in_t_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum amount of data storage, in terabytes (TB), that can be enabled for the shape.\n"]
  available_core_count_per_node : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of CPU cores per DB node that can be enabled for the shape.\n"]
  available_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of CPU cores that can be enabled for the shape.\n"]
}
[@@ocaml.doc
  "Information about a hardware system model (shape) that's available for an Exadata \
   infrastructure. The shape determines resources, such as CPU cores, memory, and storage, to \
   allocate to the Exadata infrastructure.\n"]

type nonrec db_system_shape_list = db_system_shape_summary list [@@ocaml.doc ""]

type nonrec list_db_system_shapes_output = {
  db_system_shapes : db_system_shape_list; [@ocaml.doc "The list of shapes and their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_system_shapes_input = {
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The physical ID of the AZ, for example, use1-az4. This ID persists across accounts.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The logical name of the AZ, for example, us-east-1a. This name varies depending on the \
         account.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_version_summary = {
  version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Database software version.\n"]
  details : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional details about the Autonomous Database software version.\n"]
  db_workload : db_workload option;
      [@ocaml.doc
        "The intended use of the Autonomous Database that the version supports, such as \
         transaction processing, data warehouse, JSON database, or APEX.\n"]
}
[@@ocaml.doc
  "A summary of an available Oracle Database software version for Autonomous Databases.\n"]

type nonrec autonomous_database_version_list = autonomous_database_version_summary list
[@@ocaml.doc ""]

type nonrec list_autonomous_database_versions_output = {
  autonomous_database_versions : autonomous_database_version_list;
      [@ocaml.doc "The list of available Autonomous Database software versions.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_database_versions_input = {
  db_workload : db_workload option;
      [@ocaml.doc
        "The intended use of the Autonomous Database to return versions for, such as transaction \
         processing, data warehouse, JSON database, or APEX.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_character_set_summary = {
  character_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the character set.\n"]
}
[@@ocaml.doc "A summary of an available character set for Autonomous Databases.\n"]

type nonrec autonomous_database_character_set_list = autonomous_database_character_set_summary list
[@@ocaml.doc ""]

type nonrec list_autonomous_database_character_sets_output = {
  autonomous_database_character_sets : autonomous_database_character_set_list;
      [@ocaml.doc "The list of available Autonomous Database character sets.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_database_character_sets_input = {
  character_set_type : character_set_type option;
      [@ocaml.doc
        "The type of character set to return results for, either the database character set or the \
         national character set.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n"]
}
[@@ocaml.doc ""]

type nonrec initialize_service_output = unit [@@ocaml.doc ""]

type nonrec initialize_service_input = {
  oci_identity_domain : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "The Oracle Cloud Infrastructure (OCI) identity domain configuration for service \
         initialization.\n"]
}
[@@ocaml.doc ""]

type nonrec oci_onboarding_status =
  | CANCELED [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | PUBLIC_OFFER_UNSUPPORTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | ACTIVE_LIMITED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ACTIVE_IN_HOME_REGION [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | PENDING_INITIALIZATION [@ocaml.doc ""]
  | PENDING_CUSTOMER_ACTION [@ocaml.doc ""]
  | PENDING_LINK_GENERATION [@ocaml.doc ""]
  | NOT_STARTED [@ocaml.doc ""]
[@@ocaml.doc "\n"]

type nonrec oci_identity_domain = {
  account_setup_cloud_formation_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Web Services CloudFormation URL for setting up the account integration with \
         the OCI identity domain.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the OCI identity domain, if applicable.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the OCI identity domain.\n"]
  oci_identity_domain_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL of the OCI identity domain.\n"]
  oci_identity_domain_resource_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The resource URL for accessing the OCI identity domain.\n"]
  oci_identity_domain_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the OCI identity domain.\n"]
}
[@@ocaml.doc
  "Information about an Oracle Cloud Infrastructure (OCI) identity domain configuration.\n"]

type nonrec oci_aws_integration = KmsTde [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec oci_iam_role = {
  aws_integration : oci_aws_integration option;
      [@ocaml.doc
        "The Amazon Web Services integration configuration settings for the Amazon Web Services \
         Identity and Access Management (IAM) service role.\n"]
  iam_role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Identity and Access Management \
         (IAM) service role.\n"]
}
[@@ocaml.doc
  "Information about an Amazon Web Services Identity and Access Management (IAM) service role used \
   for Autonomous Database integration with Oracle Cloud Infrastructure (OCI).\n"]

type nonrec oci_iam_role_list = oci_iam_role list [@@ocaml.doc ""]

type nonrec get_oci_onboarding_status_output = {
  subscription_errors : subscription_errors option;
      [@ocaml.doc
        "The list of errors that occurred during the subscription process for your Amazon Web \
         Services account, if any.\n"]
  linked_oci_compartment_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the Oracle Cloud Infrastructure (OCI) compartment that is linked \
         to your Amazon Web Services account.\n"]
  linked_oci_tenancy_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the Oracle Cloud Infrastructure (OCI) tenancy that is linked to \
         your Amazon Web Services account.\n"]
  autonomous_database_oci_integration_iam_roles : oci_iam_role_list option;
      [@ocaml.doc
        "The list of Amazon Web Services Identity and Access Management (IAM) service roles used \
         for Autonomous Database integration with Oracle Cloud Infrastructure (OCI).\n"]
  oci_identity_domain : oci_identity_domain option;
      [@ocaml.doc
        "The Oracle Cloud Infrastructure (OCI) identity domain information in the onboarding \
         status response.\n"]
  new_tenancy_activation_link : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A new OCI tenancy activation link for your Amazon Web Services account.\n"]
  existing_tenancy_activation_link : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The existing OCI tenancy activation link for your Amazon Web Services account.\n"]
  status : oci_onboarding_status option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_oci_onboarding_status_input = unit [@@ocaml.doc ""]

type nonrec disassociate_iam_role_from_resource_output = unit [@@ocaml.doc ""]

type nonrec disassociate_iam_role_from_resource_input = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target resource to disassociate from the Amazon Web \
         Services Identity and Access Management (IAM) service role.\n"]
  aws_integration : supported_aws_integration;
      [@ocaml.doc
        "The Amazon Web Services integration configuration settings for the Amazon Web Services \
         Identity and Access Management (IAM) service role disassociation.\n"]
  iam_role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Identity and Access Management \
         (IAM) service role to disassociate from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_iam_role_to_resource_output = unit [@@ocaml.doc ""]

type nonrec associate_iam_role_to_resource_input = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target resource to associate with the Amazon Web \
         Services Identity and Access Management (IAM) service role.\n"]
  aws_integration : supported_aws_integration;
      [@ocaml.doc
        "The Amazon Web Services integration configuration settings for the Amazon Web Services \
         Identity and Access Management (IAM) service role association.\n"]
  iam_role_arn : role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Identity and Access Management \
         (IAM) service role to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_marketplace_registration_output = unit [@@ocaml.doc ""]

type nonrec accept_marketplace_registration_input = {
  marketplace_registration_token : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The registration token that's generated by Amazon Web Services Marketplace and sent to \
         Oracle Database\\@Amazon Web Services.\n"]
}
[@@ocaml.doc ""]

type nonrec oci_encryption_key_configuration = {
  vault_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Oracle Cloud Identifier (OCID) of the OCI Vault that contains the encryption key.\n"]
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Oracle Cloud Identifier (OCID) of the OCI Vault key to use for encryption.\n"]
}
[@@ocaml.doc
  "The configuration of the Oracle Cloud Infrastructure (OCI) Vault encryption key used for an \
   Autonomous Database.\n"]

type nonrec objective =
  | LOW_LATENCY [@ocaml.doc ""]
  | HIGH_THROUGHPUT [@ocaml.doc ""]
  | BASIC [@ocaml.doc ""]
  | BALANCED [@ocaml.doc ""]
  | AUTO [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec net_services_architecture = SHARED [@ocaml.doc ""] | DEDICATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_odb_peering_connections_output = {
  odb_peering_connections : odb_peering_connection_list;
      [@ocaml.doc "The list of ODB peering connections.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The pagination token for the next page of ODB peering connections.\n"]
}
[@@ocaml.doc ""]

type nonrec list_odb_peering_connections_input = {
  odb_network_id : resource_id_or_arn option;
      [@ocaml.doc
        "The identifier of the ODB network to list peering connections for.\n\n\
        \ If not specified, lists all ODB peering connections in the account.\n\
        \ "]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The pagination token for the next page of ODB peering connections.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of ODB peering connections to return in the response.\n\n\
        \ Default: [20] \n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be between 1 and 100.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_odb_networks_output = {
  odb_networks : odb_network_list; [@ocaml.doc "The list of ODB networks.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_odb_networks_input = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec db_server_patching_status =
  | SCHEDULED [@ocaml.doc ""]
  | MAINTENANCE_IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec db_server_patching_details = {
  time_patching_started : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time when the patching operation started.\n"]
  time_patching_ended : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time when the patching operation ended.\n"]
  patching_status : db_server_patching_status option;
      [@ocaml.doc
        "The status of the patching operation. Possible values are [SCHEDULED], \
         [MAINTENANCE_IN_PROGRESS], [FAILED], and [COMPLETE].\n"]
  estimated_patch_duration : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Estimated time, in minutes, to patch one database server.\n"]
}
[@@ocaml.doc
  "The scheduling details for the quarterly maintenance window. Patching and system updates take \
   place during the maintenance window.\n"]

type nonrec db_server_summary = {
  autonomous_virtual_machine_ids : string_list option;
      [@ocaml.doc "A list of unique identifiers for the Autonomous VMs.\n"]
  autonomous_vm_cluster_ids : string_list option;
      [@ocaml.doc "A list of identifiers for the Autonomous VM clusters.\n"]
  compute_model : compute_model option;
      [@ocaml.doc
        "The OCI model compute model used when you create or clone an instance: ECPU or OCPU. An \
         ECPU is an abstracted measure of compute resources. ECPUs are based on the number of \
         cores elastically allocated from a pool of compute and storage servers. An OCPU is a \
         legacy physical measure of compute resources. OCPUs are based on the physical core of a \
         processor with hyper-threading enabled.\n"]
  vm_cluster_ids : string_list option;
      [@ocaml.doc "The IDs of the VM clusters that are associated with the database server.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the database server was created.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The hardware system model of the Exadata infrastructure that the database server is \
         hosted on. The shape determines the amount of CPU, storage, and memory resources \
         available.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of memory, in gigabytes (GB), that's allocated on the database server.\n"]
  max_memory_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of memory, in gigabytes (GB), that's available on the database server.\n"]
  max_db_node_storage_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of local node storage, in gigabytes (GB), that's available on the \
         database server.\n"]
  max_cpu_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores available on the database server.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the database server.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the database server.\n"]
  exadata_infrastructure_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the Exadata infrastructure that hosts the database server.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The user-friendly name of the database server. The name doesn't need to be unique.\n"]
  db_server_patching_details : db_server_patching_details option; [@ocaml.doc ""]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GB), that's allocated on the database \
         server.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores enabled on the database server.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the database server.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the database server.\n"]
  db_server_id : resource_id option; [@ocaml.doc "The unique identifier of the database server.\n"]
}
[@@ocaml.doc "Information about a database server.\n"]

type nonrec db_server_list = db_server_summary list [@@ocaml.doc ""]

type nonrec list_db_servers_output = {
  db_servers : db_server_list;
      [@ocaml.doc "The list of database servers along with their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_servers_input = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Oracle Exadata infrastructure.\n"]
}
[@@ocaml.doc ""]

type nonrec db_node_maintenance_type = VMDB_REBOOT_MIGRATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec db_node_summary = {
  vnic_id : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The OCID of the VNIC.\n"]
  vnic2_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the second VNIC.\n"]
  total_cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores reserved on the DB node.\n"]
  time_maintenance_window_start : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The start date and time of the maintenance window.\n"]
  time_maintenance_window_end : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The end date and time of the maintenance window.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the DB node was created.\n"]
  software_storage_size_in_g_b : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size of the block storage volume, in gigabytes (GB), that's allocated for the DB \
         system. This attribute applies only for virtual machine DB systems.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory, in gigabytes (GB), that allocated on the DB node.\n"]
  maintenance_type : db_node_maintenance_type option;
      [@ocaml.doc "The type of maintenance the DB node. \n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the DB node.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The OCID of the DB node.\n"]
  hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The host name for the DB node.\n"]
  host_ip_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the host IP address that's associated with the DB node.\n"]
  fault_domain : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the fault domain where the DB node is located.\n"]
  db_system_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the DB system.\n"]
  db_server_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the database server that's associated with the DB node.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GB), that's allocated on the DB node.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores enabled on the DB node.\n"]
  backup_vnic_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the backup VNIC for the DB node.\n"]
  backup_vnic2_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The OCID of the second backup virtual network interface card (VNIC) for the DB node.\n"]
  backup_ip_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Oracle Cloud ID (OCID) of the backup IP address that's associated with the DB node.\n"]
  additional_details : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the planned maintenance.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the DB node.\n"]
  status : db_node_resource_status option; [@ocaml.doc "The current status of the DB node.\n"]
  db_node_arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB node.\n"]
  db_node_id : resource_id option; [@ocaml.doc "The unique identifier of the DB node.\n"]
}
[@@ocaml.doc "Information about a DB node.\n"]

type nonrec db_node_list = db_node_summary list [@@ocaml.doc ""]

type nonrec list_db_nodes_output = {
  db_nodes : db_node_list; [@ocaml.doc "The list of DB nodes along with their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_db_nodes_input = {
  cloud_vm_cluster_id : resource_id; [@ocaml.doc "The unique identifier of the VM cluster.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec data_collection_options = {
  is_incident_logs_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether incident logs are enabled for the cloud VM cluster.\n"]
  is_health_monitoring_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether health monitoring is enabled for the VM cluster.\n"]
  is_diagnostics_events_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether diagnostic collection is enabled for the VM cluster.\n"]
}
[@@ocaml.doc "Information about the data collection options enabled for a VM cluster.\n"]

type nonrec disk_redundancy = NORMAL [@ocaml.doc ""] | HIGH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec db_iorm_config = {
  share : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The relative priority of this database.\n"]
  flash_cache_limit : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The flash cache limit for this database. This value is internally configured based on the \
         share value assigned to the database.\n"]
  db_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The database name. For the default DbPlan, the dbName is [default].\n"]
}
[@@ocaml.doc "The IORM configuration settings for the database.\n"]

type nonrec db_iorm_config_list = db_iorm_config list [@@ocaml.doc ""]

type nonrec iorm_lifecycle_state =
  | UPDATING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | BOOTSTRAPPING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exadata_iorm_config = {
  objective : objective option;
      [@ocaml.doc "The current value for the IORM objective. The default is AUTO.\n"]
  lifecycle_state : iorm_lifecycle_state option;
      [@ocaml.doc "The current state of IORM configuration for the Exadata DB system.\n"]
  lifecycle_details : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the current lifecycleState.\n"]
  db_plans : db_iorm_config_list option;
      [@ocaml.doc "An array of IORM settings for all the database in the Exadata DB system.\n"]
}
[@@ocaml.doc "The IORM settings of the Exadata DB system.\n"]

type nonrec iam_role_status =
  | UNKNOWN [@ocaml.doc ""]
  | PARTIALLY_CONNECTED [@ocaml.doc ""]
  | DISCONNECTED [@ocaml.doc ""]
  | CONNECTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DISASSOCIATING [@ocaml.doc ""]
  | ASSOCIATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iam_role = {
  aws_integration : supported_aws_integration option;
      [@ocaml.doc
        "The Amazon Web Services integration configuration settings for the Amazon Web Services \
         Identity and Access Management (IAM) service role.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Amazon Web Services Identity and \
         Access Management (IAM) service role, if applicable.\n"]
  status : iam_role_status option;
      [@ocaml.doc
        "The current status of the Amazon Web Services Identity and Access Management (IAM) \
         service role.\n"]
  iam_role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Identity and Access Management \
         (IAM) service role.\n"]
}
[@@ocaml.doc
  "Information about an Amazon Web Services Identity and Access Management (IAM) service role \
   associated with a resource.\n"]

type nonrec iam_role_list = iam_role list [@@ocaml.doc ""]

type nonrec cloud_vm_cluster_summary = {
  iam_roles : iam_role_list option;
      [@ocaml.doc
        "The Amazon Web Services Identity and Access Management (IAM) service roles associated \
         with the VM cluster in the summary information.\n"]
  compute_model : compute_model option;
      [@ocaml.doc
        "The OCI model compute model used when you create or clone an instance: ECPU or OCPU. An \
         ECPU is an abstracted measure of compute resources. ECPUs are based on the number of \
         cores elastically allocated from a pool of compute and storage servers. An OCPU is a \
         legacy physical measure of compute resources. OCPUs are based on the physical core of a \
         processor with hyper-threading enabled. \n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The amount of progress made on the current operation on the VM cluster, expressed as a \
         percentage.\n"]
  odb_network_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network associated with this VM cluster.\n"]
  odb_network_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the ODB network for the VM cluster.\n"]
  vip_ids : string_list option;
      [@ocaml.doc
        "The virtual IP (VIP) addresses that are associated with the VM cluster. Oracle's Cluster \
         Ready Services (CRS) creates and maintains one VIP address for each node in the VM \
         cluster to enable failover. If one node fails, the VIP is reassigned to another active \
         node in the cluster.\n"]
  time_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time zone of the VM cluster.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the VM cluster was created.\n"]
  system_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The operating system version of the image chosen for the VM cluster.\n"]
  storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GB), that's allocated to the VM cluster.\n"]
  ssh_public_keys : sensitive_string_list option;
      [@ocaml.doc
        "The public key portion of one or more key pairs used for SSH access to the VM cluster.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The hardware model name of the Exadata infrastructure that's running the VM cluster.\n"]
  scan_ip_ids : string_list option;
      [@ocaml.doc "The OCID of the SCAN IP addresses that are associated with the VM cluster.\n"]
  scan_dns_record_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The OCID of the DNS record for the SCAN IP addresses that are associated with the VM \
         cluster.\n"]
  scan_dns_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The FQDN of the DNS record for the Single Client Access Name (SCAN) IP addresses that are \
         associated with the VM cluster.\n"]
  domain : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The domain of the VM cluster.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The HTTPS link to the VM cluster in OCI.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the VM cluster.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The OCID of the VM cluster.\n"]
  node_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of nodes in the VM cluster.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory, in gigabytes (GB), that's allocated for the VM cluster.\n"]
  listener_port : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The port number configured for the listener on the VM cluster.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model applied to the VM cluster.\n"]
  last_update_history_entry_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud ID (OCID) of the last maintenance update history entry.\n"]
  is_sparse_diskgroup_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the VM cluster is configured with a sparse disk group.\n"]
  is_local_backup_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether database backups to local Exadata storage is enabled for the VM cluster.\n"]
  iorm_config_cache : exadata_iorm_config option; [@ocaml.doc ""]
  hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The host name for the VM cluster.\n"]
  gi_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The software version of the Oracle Grid Infrastructure (GI) for the VM cluster.\n"]
  disk_redundancy : disk_redundancy option;
      [@ocaml.doc
        "The type of redundancy configured for the VM cluster. [NORMAL] is 2-way redundancy. \
         [HIGH] is 3-way redundancy.\n"]
  db_servers : string_list option; [@ocaml.doc "The list of database servers for the VM cluster.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GB), that's allocated for the VM cluster.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The size of the data disk group, in terabytes (TB), that's allocated for the VM cluster.\n"]
  data_collection_options : data_collection_options option; [@ocaml.doc ""]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores enabled on the VM cluster.\n"]
  cluster_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the Grid Infrastructure (GI) cluster.\n"]
  cloud_exadata_infrastructure_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Exadata infrastructure that this VM cluster belongs \
         to.\n"]
  cloud_exadata_infrastructure_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the Exadata infrastructure that this VM cluster belongs to.\n"]
  cloud_vm_cluster_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the VM cluster.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the VM cluster.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the VM cluster.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name for the VM cluster.\n"]
  cloud_vm_cluster_id : resource_id; [@ocaml.doc "The unique identifier of the VM cluster.\n"]
}
[@@ocaml.doc "Information about a VM cluster.\n"]

type nonrec cloud_vm_cluster_list = cloud_vm_cluster_summary list [@@ocaml.doc ""]

type nonrec list_cloud_vm_clusters_output = {
  cloud_vm_clusters : cloud_vm_cluster_list;
      [@ocaml.doc "The list of VM clusters along with their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_cloud_vm_clusters_input = {
  cloud_exadata_infrastructure_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the Oracle Exadata infrastructure.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec cloud_exadata_infrastructure_summary = {
  compute_model : compute_model option;
      [@ocaml.doc
        "The OCI model compute model used when you create or clone an instance: ECPU or OCPU. An \
         ECPU is an abstracted measure of compute resources. ECPUs are based on the number of \
         cores elastically allocated from a pool of compute and storage servers. An OCPU is a \
         legacy physical measure of compute resources. OCPUs are based on the physical core of a \
         processor with hyper-threading enabled. \n"]
  storage_server_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The storage server model type of the Exadata infrastructure. For the list of valid model \
         names, use the [ListDbSystemShapes] operation.\n"]
  database_server_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The database server model type of the Exadata infrastructure. For the list of valid model \
         names, use the [ListDbSystemShapes] operation.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The amount of progress made on the current operation on the Exadata infrastructure, \
         expressed as a percentage.\n"]
  total_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of storage, in gigabytes (GB), on the the Exadata infrastructure.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Exadata infrastructure was created.\n"]
  storage_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The software version of the storage servers on the Exadata infrastructure.\n"]
  storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of storage servers that are activated for the Exadata infrastructure.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The model name of the Exadata infrastructure.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the Exadata infrastructure.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The HTTPS link to the Exadata infrastructure in OCI.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the Exadata infrastructure.\n"]
  next_maintenance_run_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the next maintenance run for the Exadata infrastructure.\n"]
  monthly_storage_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The monthly software version of the storage servers installed on the Exadata \
         infrastructure.\n"]
  monthly_db_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The monthly software version of the database servers (dom0) installed on the Exadata \
         infrastructure.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of memory, in gigabytes (GB), that's allocated on the Exadata infrastructure.\n"]
  max_memory_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of memory, in gigabytes (GB), that's available on the Exadata \
         infrastructure.\n"]
  max_db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of local node storage, in gigabytes (GB), that's available on the \
         Exadata infrastructure.\n"]
  max_data_storage_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The total amount of data disk group storage, in terabytes (TB), that's available on the \
         Exadata infrastructure.\n"]
  max_cpu_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores available on the Exadata infrastructure.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "The scheduling details for the maintenance window. Patching and system updates take place \
         during the maintenance window.\n"]
  last_maintenance_run_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Oracle Cloud Identifier (OCID) of the last maintenance run for the Exadata \
         infrastructure.\n"]
  db_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The software version of the database servers on the Exadata infrastructure.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size of the Exadata infrastructure's local node storage, in gigabytes (GB).\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The size of the Exadata infrastructure's data disk group, in terabytes (TB).\n"]
  customer_contacts_to_send_to_oc_i : customer_contacts option;
      [@ocaml.doc
        "The email addresses of contacts to receive notification from Oracle about maintenance \
         updates for the Exadata infrastructure.\n"]
  cpu_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total number of CPU cores that are allocated to the Exadata infrastructure.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of database servers for the Exadata infrastructure.\n"]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The AZ ID of the AZ where the Exadata infrastructure is located.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the Availability Zone (AZ) where the Exadata infrastructure is located.\n"]
  available_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of available storage, in gigabytes (GB), for the Exadata infrastructure.\n"]
  additional_storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of storage servers requested for the Exadata infrastructure.\n"]
  activated_storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of storage servers requested for the Exadata infrastructure.\n"]
  cloud_exadata_infrastructure_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the Exadata infrastructure.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the Exadata infrastructure.\n"]
  status : resource_status option;
      [@ocaml.doc "The current status of the Exadata infrastructure.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name for the Exadata infrastructure.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier for the Exadata infrastructure.\n"]
}
[@@ocaml.doc "Information about an Exadata infrastructure.\n"]

type nonrec cloud_exadata_infrastructure_list = cloud_exadata_infrastructure_summary list
[@@ocaml.doc ""]

type nonrec list_cloud_exadata_infrastructures_output = {
  cloud_exadata_infrastructures : cloud_exadata_infrastructure_list;
      [@ocaml.doc "The list of Exadata infrastructures along with their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_cloud_exadata_infrastructures_input = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n\n\
        \ Default: [10] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec cloud_autonomous_vm_cluster_summary = {
  iam_roles : iam_role_list option;
      [@ocaml.doc
        "The Amazon Web Services Identity and Access Management (IAM) service roles associated \
         with the Autonomous VM cluster in the summary information.\n"]
  total_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total number of Autonomous Container Databases that can be created in the Autonomous \
         VM cluster.\n"]
  time_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time zone of the Autonomous VM cluster.\n"]
  time_ords_certificate_expires : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The expiration date and time of the Oracle REST Data Services (ORDS) certificate.\n"]
  time_database_ssl_certificate_expires : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The expiration date and time of the database SSL certificate.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous VM cluster was created.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The shape of the Exadata infrastructure for the Autonomous VM cluster.\n"]
  scan_listener_port_tls : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The SCAN listener port for TLS (TCP) protocol.\n"]
  scan_listener_port_non_tls : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The SCAN listener port for non-TLS (TCP) protocol.\n"]
  reserved_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The number of CPUs reserved for system operations and redundancy.\n"]
  reclaimable_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The number of CPUs that can be reclaimed from terminated or scaled-down Autonomous \
         Databases.\n"]
  provisioned_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The number of CPUs currently provisioned in the Autonomous VM cluster.\n"]
  provisioned_autonomous_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous Container Databases currently provisioned in the Autonomous VM \
         cluster.\n"]
  provisionable_autonomous_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous CDBs that you can provision in the Autonomous VM cluster.\n"]
  non_provisionable_autonomous_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous CDBs that can't be provisioned because of resource constraints.\n"]
  node_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of database server nodes in the Autonomous VM cluster.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total amount of memory allocated to the Autonomous VM cluster, in GB.\n"]
  memory_per_oracle_compute_unit_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory allocated per Oracle Compute Unit (OCU), in GB.\n"]
  max_acds_lowest_scaled_value : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The lowest value to which you can scale down the maximum number of Autonomous CDBs.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "The scheduling details for the maintenance window. Patching and system updates take place \
         during the maintenance window.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model that applies to the Autonomous VM cluster.\n"]
  is_mtls_enabled_vm_cluster : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates if mutual TLS (mTLS) authentication is enabled for the Autonomous VM cluster.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing the OCI console page for this Autonomous VM cluster.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the Autonomous VM cluster.\n"]
  hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The host name for the Autonomous VM cluster.\n"]
  exadata_storage_in_t_bs_lowest_scaled_value : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The lowest value to which Exadata storage can be scaled down, in TB.\n"]
  domain : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The domain name for the Autonomous VM cluster.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-provided description of the Autonomous VM cluster.\n"]
  db_servers : string_list option;
      [@ocaml.doc "The list of database servers associated with the Autonomous VM cluster.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The local node storage allocated to the Autonomous VM cluster, in GB.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total data storage allocated to the Autonomous VM cluster, in TB.\n"]
  data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total data storage allocated to the Autonomous VM cluster, in GB.\n"]
  cpu_percentage : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The percentage of total CPU cores currently in use in the Autonomous VM cluster.\n"]
  cpu_core_count_per_node : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores per node in the Autonomous VM cluster.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores in the Autonomous VM cluster.\n"]
  compute_model : compute_model option;
      [@ocaml.doc "The compute model of the Autonomous VM cluster: ECPU or OCPU.\n"]
  available_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The number of CPU cores available for allocation to Autonomous Databases.\n"]
  available_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous Container Databases that you can create with the currently \
         available storage.\n"]
  available_autonomous_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The available data storage for Autonomous Databases in the Autonomous VM cluster, in TB.\n"]
  autonomous_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The total data storage allocated for Autonomous Databases in the Autonomous VM cluster, \
         in TB.\n"]
  autonomous_data_storage_percentage : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The percentage of data storage currently in use for Autonomous Databases in the \
         Autonomous VM cluster.\n"]
  cloud_exadata_infrastructure_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Exadata infrastructure containing this Autonomous \
         VM cluster.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn option;
      [@ocaml.doc
        "The unique identifier of the Exadata infrastructure containing this Autonomous VM cluster.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous VM cluster, if \
         applicable.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the Autonomous VM cluster.\n"]
  display_name : resource_display_name option;
      [@ocaml.doc "The user-friendly name for the Autonomous VM cluster.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The progress of the current operation on the Autonomous VM cluster, as a percentage.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the OCI resource anchor associated with this Autonomous VM cluster.\n"]
  odb_network_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network associated with this Autonomous VM \
         cluster.\n"]
  odb_network_id : resource_id_or_arn option;
      [@ocaml.doc
        "The unique identifier of the ODB network associated with this Autonomous VM cluster.\n"]
  cloud_autonomous_vm_cluster_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the Autonomous VM cluster.\n"]
  cloud_autonomous_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the Autonomous VM cluster.\n"]
}
[@@ocaml.doc "A summary of an Autonomous VM cluster.\n"]

type nonrec cloud_autonomous_vm_cluster_list = cloud_autonomous_vm_cluster_summary list
[@@ocaml.doc ""]

type nonrec list_cloud_autonomous_vm_clusters_output = {
  cloud_autonomous_vm_clusters : cloud_autonomous_vm_cluster_list;
      [@ocaml.doc
        "The list of Autonomous VM clusters in the specified Cloud Exadata Infrastructure.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The pagination token to continue listing from.\n"]
}
[@@ocaml.doc ""]

type nonrec list_cloud_autonomous_vm_clusters_input = {
  cloud_exadata_infrastructure_id : resource_id_or_arn option;
      [@ocaml.doc
        "The unique identifier of the Cloud Exadata Infrastructure that hosts the Autonomous VM \
         clusters to be listed.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The pagination token to continue listing from.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of items to return per page.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_virtual_machine_summary = {
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the Oracle Cloud Infrastructure (OCI) resource anchor associated with this \
         Autonomous VM.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the Autonomous VM.\n"]
  cloud_autonomous_vm_cluster_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the Autonomous VM cluster containing this Autonomous VM.\n"]
  client_ip_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The IP address used by clients to connect to this Autonomous VM.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of storage allocated to this Autonomous Virtual Machine, in gigabytes (GB).\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory allocated to this Autonomous VM, in gigabytes (GB).\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores allocated to this Autonomous VM.\n"]
  db_server_display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The display name of the database server hosting this Autonomous VM.\n"]
  db_server_id : resource_id option;
      [@ocaml.doc "The unique identifier of the database server hosting this Autonomous VM.\n"]
  vm_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the Autonomous VM.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous VM, if applicable.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the Autonomous VM.\n"]
  autonomous_virtual_machine_id : resource_id option;
      [@ocaml.doc "The unique identifier of the Autonomous VM.\n"]
}
[@@ocaml.doc "A summary of an Autonomous Virtual Machine (VM) within an Autonomous VM cluster.\n"]

type nonrec autonomous_virtual_machine_list = autonomous_virtual_machine_summary list
[@@ocaml.doc ""]

type nonrec list_autonomous_virtual_machines_output = {
  autonomous_virtual_machines : autonomous_virtual_machine_list;
      [@ocaml.doc "The list of Autonomous VMs in the specified Autonomous VM cluster.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The pagination token from which to continue listing.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_virtual_machines_input = {
  cloud_autonomous_vm_cluster_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the Autonomous VM cluster whose virtual machines you're listing.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The pagination token to continue listing from.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The maximum number of items to return per page.\n"]
}
[@@ocaml.doc ""]

type nonrec database_type = CLONE [@ocaml.doc ""] | REGULAR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec database_connection_string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""]

type nonrec database_connection_string_profile = {
  value : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The connection string value of the profile.\n"]
  tls_authentication : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The TLS authentication method used by the connection string profile.\n"]
  syntax_format : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The syntax format of the connection string profile.\n"]
  session_mode : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The session mode of the connection string profile.\n"]
  protocol : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The protocol used by the connection string profile.\n"]
  is_regional : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the connection string profile is regional.\n"]
  host_format : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The host name format used in the connection string.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the connection string profile.\n"]
  consumer_group : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The consumer group associated with the connection string profile.\n"]
}
[@@ocaml.doc "A connection string profile for an Autonomous Database.\n"]

type nonrec database_connection_string_profile_list = database_connection_string_profile list
[@@ocaml.doc ""]

type nonrec autonomous_database_connection_strings = {
  profiles : database_connection_string_profile_list option;
      [@ocaml.doc "The list of connection string profiles for the Autonomous Database.\n"]
  low : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The connection string for the low-priority database service.\n"]
  medium : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The connection string for the medium-priority database service.\n"]
  high : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The connection string for the high-priority database service.\n"]
  dedicated : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The connection string for connecting to the Autonomous Database with a dedicated service.\n"]
  all_connection_strings : database_connection_string_map option;
      [@ocaml.doc
        "The list of all connection strings that you can use to connect to the Autonomous Database.\n"]
}
[@@ocaml.doc "The connection strings used to connect to an Autonomous Database.\n"]

type nonrec autonomous_database_apex = {
  ords_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle REST Data Services (ORDS) version of the Autonomous Database.\n"]
  apex_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Application Express (APEX) version of the Autonomous Database.\n"]
}
[@@ocaml.doc "The Oracle Application Express (APEX) details for an Autonomous Database.\n"]

type nonrec database_standby_summary = {
  time_maintenance_end : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the next maintenance of the standby database ends.\n"]
  time_maintenance_begin : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the next maintenance of the standby database begins.\n"]
  time_disaster_recovery_role_changed : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the disaster recovery role of the standby database last changed.\n"]
  time_data_guard_role_changed : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the Oracle Data Guard role of the standby database last changed.\n"]
  maintenance_target_component : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The component on the standby Autonomous Database that the current maintenance is being \
         applied to.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the standby Autonomous Database, if \
         applicable.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the standby Autonomous Database.\n"]
  lag_time_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time lag, in seconds, between the standby database and the primary database.\n"]
  availability_domain : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The availability domain of the standby Autonomous Database.\n"]
}
[@@ocaml.doc "A summary of a standby Autonomous Database in an Oracle Data Guard configuration.\n"]

type nonrec data_safe_status =
  | FAILED [@ocaml.doc ""]
  | NOT_REGISTERED [@ocaml.doc ""]
  | DEREGISTERING [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""]
  | REGISTERING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec database_management_status =
  | FAILED_DISABLING [@ocaml.doc ""]
  | FAILED_ENABLING [@ocaml.doc ""]
  | NOT_ENABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec autonomous_database_connection_urls = {
  sql_dev_web_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing Oracle SQL Developer Web for the Autonomous Database.\n"]
  spatial_studio_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing Oracle Spatial Studio for the Autonomous Database.\n"]
  ords_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The URL for accessing Oracle REST Data Services (ORDS) for the Autonomous Database.\n"]
  mongo_db_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing the MongoDB API for the Autonomous Database.\n"]
  machine_learning_user_management_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The URL for accessing Oracle Machine Learning user management for the Autonomous Database.\n"]
  machine_learning_notebook_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The URL for accessing the Oracle Machine Learning notebook for the Autonomous Database.\n"]
  graph_studio_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing Oracle Graph Studio for the Autonomous Database.\n"]
  database_transforms_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing Oracle Database Transforms for the Autonomous Database.\n"]
  apex_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The URL for accessing Oracle Application Express (APEX) for the Autonomous Database.\n"]
}
[@@ocaml.doc "The connection URLs for accessing tools and services for an Autonomous Database.\n"]

type nonrec data_guard_role =
  | SNAPSHOT_STANDBY [@ocaml.doc ""]
  | BACKUP_COPY [@ocaml.doc ""]
  | DISABLED_STANDBY [@ocaml.doc ""]
  | STANDBY [@ocaml.doc ""]
  | PRIMARY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec disaster_recovery_configuration = {
  time_snapshot_standby_enabled_till : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time until which the snapshot standby database remains enabled.\n"]
  is_snapshot_standby : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the standby database is a snapshot standby.\n"]
  is_replicate_automatic_backups : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether automatic backups are replicated to the disaster recovery database.\n"]
  disaster_recovery_type : disaster_recovery_type option;
      [@ocaml.doc "The type of disaster recovery configured for the Autonomous Database.\n"]
}
[@@ocaml.doc "The disaster recovery configuration for an Autonomous Database.\n"]

type nonrec encryption_key_provider =
  | OCI [@ocaml.doc ""]
  | OKV [@ocaml.doc ""]
  | AWS_KMS [@ocaml.doc ""]
  | ORACLE_MANAGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aws_encryption_key_configuration = {
  kms_key_id : kms_key_id_or_arn option;
      [@ocaml.doc "The identifier or ARN of the Amazon Web Services KMS key used for encryption.\n"]
  external_id_type : external_id_type option;
      [@ocaml.doc "The type of external identifier associated with the encryption key.\n"]
  iam_role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Identity and Access Management \
         (IAM) role that grants access to the KMS key.\n"]
}
[@@ocaml.doc
  "The configuration of the Amazon Web Services Key Management Service (KMS) encryption key used \
   for an Autonomous Database.\n"]

type nonrec encryption_key_configuration =
  | OkvEncryptionKey of okv_encryption_key_configuration
      [@ocaml.doc "The configuration of the Oracle Key Vault (OKV) encryption key.\n"]
  | OciEncryptionKey of oci_encryption_key_configuration
      [@ocaml.doc
        "The configuration of the Oracle Cloud Infrastructure (OCI) Vault encryption key.\n"]
  | AwsEncryptionKey of aws_encryption_key_configuration
      [@ocaml.doc
        "The configuration of the Amazon Web Services Key Management Service (KMS) encryption key.\n"]
[@@ocaml.doc
  "The configuration of the encryption key used for an Autonomous Database. This is a union, so \
   only one of the following members can be specified.\n"]

type nonrec encryption_summary = {
  encryption_key_configuration : encryption_key_configuration option;
      [@ocaml.doc "The configuration of the encryption key used for the Autonomous Database.\n"]
  encryption_key_provider : encryption_key_provider option;
      [@ocaml.doc "The provider of the encryption key used for the Autonomous Database.\n"]
}
[@@ocaml.doc "The encryption configuration for an Autonomous Database.\n"]

type nonrec autonomous_database_summary = {
  time_undeleted : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database was restored after deletion.\n"]
  next_long_term_backup_time_stamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the next scheduled long-term backup of the Autonomous Database.\n"]
  time_until_reconnect_clone_enabled : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time until which reconnecting the refreshable clone to its source Autonomous \
         Database is allowed.\n"]
  time_disaster_recovery_role_changed : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the disaster recovery role of the Autonomous Database last changed.\n"]
  time_reclamation_of_free_autonomous_database : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the Always Free Autonomous Database is scheduled to be stopped \
         because of inactivity.\n"]
  time_deletion_of_free_autonomous_database : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the inactive Always Free Autonomous Database is scheduled to be \
         automatically deleted.\n"]
  time_of_auto_refresh_start : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time at which the automatic refresh of the refreshable clone Autonomous \
         Database starts.\n"]
  time_of_next_refresh : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the next scheduled refresh of the refreshable clone Autonomous \
         Database.\n"]
  time_of_last_refresh_point : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time as of which the data in the refreshable clone Autonomous Database is \
         current.\n"]
  time_of_last_refresh : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the last refresh of the refreshable clone Autonomous Database.\n"]
  time_of_last_failover : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time of the last failover operation for the Autonomous Database.\n"]
  time_of_last_switchover : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the last switchover operation for the Autonomous Database.\n"]
  time_data_guard_role_changed : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the Oracle Data Guard role of the Autonomous Database last changed.\n"]
  time_local_data_guard_enabled : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when local Oracle Data Guard was enabled for the Autonomous Database.\n"]
  time_maintenance_end : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the next maintenance of the Autonomous Database ends.\n"]
  time_maintenance_begin : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the next maintenance of the Autonomous Database begins.\n"]
  time_of_last_backup : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time of the last backup of the Autonomous Database.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database was created.\n"]
  encryption_summary : encryption_summary option;
      [@ocaml.doc "The encryption configuration for the Autonomous Database.\n"]
  resource_pool_summary : resource_pool_summary option;
      [@ocaml.doc "The configuration of the resource pool for the Autonomous Database.\n"]
  total_backup_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total amount of backup storage used by the Autonomous Database, in GB.\n"]
  is_backup_retention_locked : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether the backup retention period of the Autonomous Database is locked.\n"]
  long_term_backup_schedule : long_term_backup_schedule option;
      [@ocaml.doc "The long-term backup schedule for the Autonomous Database.\n"]
  backup_retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The retention period, in days, for automatic backups of the Autonomous Database.\n"]
  clone_table_space_list : integer_list option;
      [@ocaml.doc "The list of tablespace identifiers to clone for the Autonomous Database.\n"]
  is_reconnect_clone_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether reconnecting the refreshable clone to its source Autonomous Database is \
         enabled.\n"]
  auto_refresh_point_lag_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time lag, in seconds, between the refreshable clone and its source Autonomous Database.\n"]
  auto_refresh_frequency_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The frequency, in seconds, at which the refreshable clone Autonomous Database is \
         automatically refreshed.\n"]
  refreshable_status : refreshable_status option;
      [@ocaml.doc "The refresh status of the refreshable clone Autonomous Database.\n"]
  refreshable_mode : refreshable_mode option;
      [@ocaml.doc "The refresh mode of the refreshable clone Autonomous Database.\n"]
  is_refreshable_clone : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the Autonomous Database is a refreshable clone.\n"]
  remote_disaster_recovery_configuration : disaster_recovery_configuration option;
      [@ocaml.doc
        "The configuration of the remote disaster recovery for the Autonomous Database.\n"]
  local_adg_auto_failover_max_data_loss_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum data loss limit, in seconds, for automatic failover to the local Oracle Data \
         Guard standby database.\n"]
  failed_data_recovery_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of time, in seconds, that the data in the Autonomous Database is behind the \
         data in the primary database.\n"]
  peer_db_ids : string_list option;
      [@ocaml.doc "The list of unique identifiers of the peer Autonomous Databases.\n"]
  role : data_guard_role option;
      [@ocaml.doc "The Oracle Data Guard role of the Autonomous Database.\n"]
  local_disaster_recovery_type : disaster_recovery_type option;
      [@ocaml.doc "The type of local disaster recovery configured for the Autonomous Database.\n"]
  is_remote_data_guard_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether remote Oracle Data Guard is enabled for the Autonomous Database.\n"]
  is_local_data_guard_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether local Oracle Data Guard is enabled for the Autonomous Database.\n"]
  standby_allowlisted_ips_source : standby_allowlisted_ips_source option;
      [@ocaml.doc
        "The source of the allowlisted IP addresses for the standby Autonomous Database.\n"]
  standby_allowlisted_ips : string_list option;
      [@ocaml.doc
        "The list of IP addresses that are allowed to access the standby Autonomous Database.\n"]
  allowlisted_ips : string_list option;
      [@ocaml.doc "The list of IP addresses that are allowed to access the Autonomous Database.\n"]
  private_endpoint_label : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint label for the Autonomous Database.\n"]
  private_endpoint_ip : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint IP address for the Autonomous Database.\n"]
  private_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint for the Autonomous Database.\n"]
  odb_network_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network associated with the Autonomous Database.\n"]
  odb_network_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the ODB network associated with the Autonomous Database.\n"]
  is_auto_scaling_for_storage_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether automatic scaling of the storage is enabled for the Autonomous Database.\n"]
  in_memory_area_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The size of the in-memory area of the Autonomous Database, in GB.\n"]
  allocated_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The amount of storage currently allocated to the Autonomous Database, in TB.\n"]
  actual_used_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The actual amount of data storage currently in use by the Autonomous Database, in TB.\n"]
  used_data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of data storage currently in use by the Autonomous Database, in GB.\n"]
  used_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The amount of data storage currently in use by the Autonomous Database, in TB.\n"]
  data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size, in gigabytes (GB), of the data volume allocated for the Autonomous Database.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The size, in terabytes (TB), of the data volume allocated for the Autonomous Database.\n"]
  is_auto_scaling_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether automatic scaling of the compute resources is enabled for the \
         Autonomous Database.\n"]
  provisionable_cpus : integer_list option;
      [@ocaml.doc
        "The list of CPU core counts that you can provision for the Autonomous Database.\n"]
  memory_per_oracle_compute_unit_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory allocated per Oracle Compute Unit, in GB.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores allocated to the Autonomous Database.\n"]
  compute_model : compute_model option;
      [@ocaml.doc "The compute model of the Autonomous Database, either ECPU or OCPU.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The compute capacity, in number of Elastic CPUs (ECPUs) or Oracle CPUs (OCPUs), assigned \
         to the Autonomous Database.\n"]
  resource_pool_leader_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the resource pool leader Autonomous Database.\n"]
  scheduled_operations : scheduled_operation_details_list option;
      [@ocaml.doc "The list of scheduled start and stop times for the Autonomous Database.\n"]
  db_tools_details : database_tool_list option;
      [@ocaml.doc "The list of database management tools enabled for the Autonomous Database.\n"]
  connection_urls : autonomous_database_connection_urls option;
      [@ocaml.doc
        "The connection URLs for accessing tools and services for the Autonomous Database.\n"]
  maintenance_target_component : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The component on the Autonomous Database that the current maintenance is being applied to.\n"]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the Availability Zone where the Autonomous Database is located.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Availability Zone where the Autonomous Database is located.\n"]
  operations_insights_status : operations_insights_status option;
      [@ocaml.doc "The status of Oracle Operations Insights for the Autonomous Database.\n"]
  database_management_status : database_management_status option;
      [@ocaml.doc "The status of Oracle Database Management for the Autonomous Database.\n"]
  data_safe_status : data_safe_status option;
      [@ocaml.doc "The status of the Oracle Data Safe registration for the Autonomous Database.\n"]
  local_standby_db : database_standby_summary option;
      [@ocaml.doc
        "The details of the local standby Autonomous Database in an Oracle Data Guard configuration.\n"]
  standby_db : database_standby_summary option;
      [@ocaml.doc
        "The details of the standby Autonomous Database in a cross-Region Oracle Data Guard \
         configuration.\n"]
  apex_details : autonomous_database_apex option;
      [@ocaml.doc "The Oracle Application Express (APEX) details for the Autonomous Database.\n"]
  customer_contacts : customer_contacts option;
      [@ocaml.doc
        "The list of customer contacts that receive operational notifications from Oracle for the \
         Autonomous Database.\n"]
  sql_web_developer_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing Oracle SQL Developer Web for the Autonomous Database.\n"]
  service_console_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing the Oracle service console for the Autonomous Database.\n"]
  connection_string_details : autonomous_database_connection_strings option;
      [@ocaml.doc "The connection string details for the Autonomous Database.\n"]
  byol_compute_count_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of compute resources that you can allocate to the Autonomous Database \
         under the bring-your-own-license (BYOL) model.\n"]
  available_upgrade_versions : string_list option;
      [@ocaml.doc
        "The list of Oracle Database software versions to which the Autonomous Database can be \
         upgraded.\n"]
  net_services_architecture : net_services_architecture option;
      [@ocaml.doc
        "The Oracle Net Services architecture of the Autonomous Database, either dedicated or \
         shared.\n"]
  autonomous_maintenance_schedule_type : autonomous_maintenance_schedule_type option;
      [@ocaml.doc "The maintenance schedule type for the Autonomous Database.\n"]
  is_mtls_connection_required : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether mutual TLS (mTLS) authentication is required to connect to the \
         Autonomous Database.\n"]
  permission_level : permission_level option;
      [@ocaml.doc "The permission level of the Autonomous Database.\n"]
  open_mode : open_mode option;
      [@ocaml.doc
        "The mode in which the Autonomous Database is open, either read-only or read/write.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model that applies to the Autonomous Database.\n"]
  database_edition : database_edition option;
      [@ocaml.doc "The Oracle Database edition of the Autonomous Database.\n"]
  ncharacter_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The national character set of the Autonomous Database.\n"]
  character_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The character set of the Autonomous Database.\n"]
  db_workload : db_workload option;
      [@ocaml.doc
        "The intended use of the Autonomous Database, such as transaction processing, data \
         warehouse, JSON database, or APEX.\n"]
  db_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Database software version of the Autonomous Database.\n"]
  database_type : database_type option;
      [@ocaml.doc "The type of the Autonomous Database, either a regular database or a clone.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database, if applicable.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database.\n"]
  source_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the source from which the Autonomous Database was created.\n"]
  db_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the Autonomous Database.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing the OCI console page for the Autonomous Database.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the Autonomous Database.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The progress of the current operation on the Autonomous Database, as a percentage.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the Oracle Cloud Infrastructure (OCI) resource anchor associated with the \
         Autonomous Database.\n"]
  autonomous_database_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Autonomous Database.\n"]
  autonomous_database_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the Autonomous Database.\n"]
}
[@@ocaml.doc "A summary of an Autonomous Database.\n"]

type nonrec autonomous_database_list = autonomous_database_summary list [@@ocaml.doc ""]

type nonrec list_autonomous_databases_output = {
  autonomous_databases : autonomous_database_list;
      [@ocaml.doc "The list of Autonomous Databases along with their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_databases_input = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_peer_summary = {
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region where the peer Autonomous Database is located.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the peer Autonomous Database.\n"]
  autonomous_database_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the peer Autonomous Database.\n"]
  autonomous_database_id : resource_id option;
      [@ocaml.doc "The unique identifier of the peer Autonomous Database.\n"]
}
[@@ocaml.doc "A summary of a peer database of an Autonomous Database.\n"]

type nonrec autonomous_database_peer_list = autonomous_database_peer_summary list [@@ocaml.doc ""]

type nonrec list_autonomous_database_peers_output = {
  autonomous_database_peers : autonomous_database_peer_list;
      [@ocaml.doc "The list of peer databases for the Autonomous Database.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_database_peers_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the Autonomous Database whose peer databases you want to list.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_database_clones_output = {
  autonomous_database_clones : autonomous_database_list;
      [@ocaml.doc "The list of Autonomous Database clones along with their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_database_clones_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the source Autonomous Database whose clones you want to list.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_backup_status =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec autonomous_database_backup_type =
  | ROLL_FORWARD_IMAGE_COPY [@ocaml.doc ""]
  | CUMULATIVE_INCREMENTAL [@ocaml.doc ""]
  | VIRTUAL_FULL [@ocaml.doc ""]
  | LONGTERM [@ocaml.doc ""]
  | FULL [@ocaml.doc ""]
  | INCREMENTAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec autonomous_database_backup_summary = {
  type_ : autonomous_database_backup_type option;
      [@ocaml.doc "The type of the Autonomous Database backup.\n"]
  time_ended : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database backup ended.\n"]
  time_started : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database backup started.\n"]
  time_available_till : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time until which the Autonomous Database backup is available for restore.\n"]
  size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The size of the Autonomous Database backup, in terabytes (TB).\n"]
  retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The retention period, in days, for the Autonomous Database backup.\n"]
  is_automatic : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the backup was created automatically.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database backup, if \
         applicable.\n"]
  status : autonomous_database_backup_status option;
      [@ocaml.doc "The current status of the Autonomous Database backup.\n"]
  db_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Database software version of the Autonomous Database backup.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database backup.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the Autonomous Database backup.\n"]
  autonomous_database_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the Autonomous Database that the backup was created from.\n"]
  autonomous_database_backup_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Autonomous Database backup.\n"]
  autonomous_database_backup_id : resource_id option;
      [@ocaml.doc "The unique identifier of the Autonomous Database backup.\n"]
}
[@@ocaml.doc "A summary of an Autonomous Database backup.\n"]

type nonrec autonomous_database_backup_list = autonomous_database_backup_summary list
[@@ocaml.doc ""]

type nonrec list_autonomous_database_backups_output = {
  autonomous_database_backups : autonomous_database_backup_list;
      [@ocaml.doc "The list of Autonomous Database backups along with their properties.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to include in another request to get the next page of items. This value is \
         [null] when there are no more items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_autonomous_database_backups_input = {
  type_ : autonomous_database_backup_type option;
      [@ocaml.doc "The type of the Autonomous Database backups to return results for.\n"]
  status : autonomous_database_backup_status option;
      [@ocaml.doc "The status of the Autonomous Database backups to return results for.\n"]
  autonomous_database_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the Autonomous Database whose backups you want to list.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token returned from a previous paginated request. Pagination continues from the end \
         of the items returned by the previous request.\n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of items to return for this request. To get the next page of items, \
         make another request with the token returned in the output.\n"]
}
[@@ocaml.doc ""]

type nonrec hostname = string [@@ocaml.doc ""]

type nonrec get_odb_peering_connection_output = {
  odb_peering_connection : odb_peering_connection option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_odb_peering_connection_input = {
  odb_peering_connection_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the ODB peering connection to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_odb_network_output = {
  odb_network : odb_network option; [@ocaml.doc "The ODB network.\n"]
}
[@@ocaml.doc ""]

type nonrec get_odb_network_input = {
  odb_network_id : resource_id_or_arn; [@ocaml.doc "The unique identifier of the ODB network.\n"]
}
[@@ocaml.doc ""]

type nonrec db_server = {
  autonomous_virtual_machine_ids : string_list option;
      [@ocaml.doc
        "The list of unique identifiers for the Autonomous VMs associated with this database server.\n"]
  autonomous_vm_cluster_ids : string_list option;
      [@ocaml.doc
        "The list of identifiers for the Autonomous VM clusters associated with this database \
         server.\n"]
  compute_model : compute_model option;
      [@ocaml.doc "The compute model of the database server (ECPU or OCPU).\n"]
  vm_cluster_ids : string_list option;
      [@ocaml.doc "The OCID of the VM clusters that are associated with the database server.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the database server was created.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The shape of the database server. The shape determines the amount of CPU, storage, and \
         memory resources available.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The allocated memory in GBs on the database server.\n"]
  max_memory_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total memory available in GBs.\n"]
  max_db_node_storage_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total local node storage available in GBs.\n"]
  max_cpu_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores available.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the database server.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the database server.\n"]
  exadata_infrastructure_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID of the Exadata infrastructure the database server belongs to.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the database server.\n"]
  db_server_patching_details : db_server_patching_details option;
      [@ocaml.doc
        "The scheduling details for the quarterly maintenance window. Patching and system updates \
         take place during the maintenance window.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The allocated local node storage in GBs on the database server.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores enabled on the database server.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the current status of the database server.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the database server.\n"]
  db_server_id : resource_id option; [@ocaml.doc "The unique identifier for the database server.\n"]
}
[@@ocaml.doc "Information about a database server.\n"]

type nonrec get_db_server_output = {
  db_server : db_server option; [@ocaml.doc "The details of the requested database server.\n"]
}
[@@ocaml.doc ""]

type nonrec get_db_server_input = {
  db_server_id : resource_id;
      [@ocaml.doc "The unique identifier of the database server to retrieve information about.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the Oracle Exadata infrastructure that contains the database \
         server.\n"]
}
[@@ocaml.doc ""]

type nonrec db_node = {
  floating_ip_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The floating IP address assigned to the DB node.\n"]
  private_ip_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private IP address assigned to the DB node.\n"]
  vnic_id : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The OCID of the VNIC.\n"]
  vnic2_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the second VNIC.\n"]
  total_cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores reserved on the DB node.\n"]
  time_maintenance_window_start : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Start date and time of maintenance window.\n"]
  time_maintenance_window_end : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "End date and time of maintenance window.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the DB node was created.\n"]
  software_storage_size_in_g_b : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The size (in GB) of the block storage volume allocation for the DB system. \n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The allocated memory in GBs on the DB node.\n"]
  maintenance_type : db_node_maintenance_type option;
      [@ocaml.doc
        "The type of database node maintenance. Either [VMDB_REBOOT_MIGRATION] or \
         [EXADBXS_REBOOT_MIGRATION].\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the DB node.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The OCID of the DB node.\n"]
  hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The host name for the DB node.\n"]
  host_ip_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the host IP address that's associated with the DB node.\n"]
  fault_domain : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the fault domain the instance is contained in.\n"]
  db_system_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the DB system.\n"]
  db_server_id : resource_id option;
      [@ocaml.doc "The unique identifier of the Db server that is associated with the DB node.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GBs), that's allocated on the DB node.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "Number of CPU cores enabled on the DB node.\n"]
  backup_vnic_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the backup VNIC.\n"]
  backup_vnic2_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the second backup VNIC.\n"]
  backup_ip_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Oracle Cloud ID (OCID) of the backup IP address that's associated with the DB node.\n"]
  additional_details : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the planned maintenance.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the DB node.\n"]
  status : db_node_resource_status option; [@ocaml.doc "The current status of the DB node.\n"]
  db_node_arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the DB node.\n"]
  db_node_id : resource_id option; [@ocaml.doc "The unique identifier of the DB node.\n"]
}
[@@ocaml.doc "Information about a DB node.\n"]

type nonrec get_db_node_output = { db_node : db_node option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec get_db_node_input = {
  db_node_id : resource_id;
      [@ocaml.doc "The unique identifier of the DB node to retrieve information about.\n"]
  cloud_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the VM cluster that contains the DB node.\n"]
}
[@@ocaml.doc ""]

type nonrec cloud_vm_cluster = {
  iam_roles : iam_role_list option;
      [@ocaml.doc
        "The Amazon Web Services Identity and Access Management (IAM) service roles associated \
         with the VM cluster.\n"]
  compute_model : compute_model option;
      [@ocaml.doc
        "The OCI model compute model used when you create or clone an instance: ECPU or OCPU. An \
         ECPU is an abstracted measure of compute resources. ECPUs are based on the number of \
         cores elastically allocated from a pool of compute and storage servers. An OCPU is a \
         legacy physical measure of compute resources. OCPUs are based on the physical core of a \
         processor with hyper-threading enabled. \n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The amount of progress made on the current operation on the VM cluster, expressed as a \
         percentage.\n"]
  odb_network_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network associated with this VM cluster.\n"]
  odb_network_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the ODB network for the VM cluster.\n"]
  vip_ids : string_list option;
      [@ocaml.doc
        "The virtual IP (VIP) addresses that are associated with the VM cluster. Oracle's Cluster \
         Ready Services (CRS) creates and maintains one VIP address for each node in the VM \
         cluster to enable failover. If one node fails, the VIP is reassigned to another active \
         node in the cluster.\n"]
  time_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time zone of the VM cluster.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the VM cluster was created.\n"]
  system_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The operating system version of the image chosen for the VM cluster.\n"]
  storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GB), that's allocated to the VM cluster.\n"]
  ssh_public_keys : sensitive_string_list option;
      [@ocaml.doc
        "The public key portion of one or more key pairs used for SSH access to the VM cluster.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The hardware model name of the Exadata infrastructure that's running the VM cluster.\n"]
  scan_ip_ids : string_list option;
      [@ocaml.doc "The OCID of the SCAN IP addresses that are associated with the VM cluster.\n"]
  scan_dns_record_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The OCID of the DNS record for the SCAN IP addresses that are associated with the VM \
         cluster.\n"]
  scan_dns_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The FQDN of the DNS record for the Single Client Access Name (SCAN) IP addresses that are \
         associated with the VM cluster.\n"]
  domain : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The domain of the VM cluster.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The HTTPS link to the VM cluster in OCI.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the VM cluster.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The OCID of the VM cluster.\n"]
  node_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of nodes in the VM cluster.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory, in gigabytes (GB), that's allocated for the VM cluster.\n"]
  listener_port : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The port number configured for the listener on the VM cluster.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model applied to the VM cluster.\n"]
  last_update_history_entry_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud ID (OCID) of the last maintenance update history entry.\n"]
  is_sparse_diskgroup_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the VM cluster is configured with a sparse disk group.\n"]
  is_local_backup_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether database backups to local Exadata storage is enabled for the VM cluster.\n"]
  iorm_config_cache : exadata_iorm_config option;
      [@ocaml.doc "The ExadataIormConfig cache details for the VM cluster.\n"]
  hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The host name for the VM cluster.\n"]
  gi_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The software version of the Oracle Grid Infrastructure (GI) for the VM cluster.\n"]
  disk_redundancy : disk_redundancy option;
      [@ocaml.doc
        "The type of redundancy configured for the VM cluster. [NORMAL] is 2-way redundancy. \
         [HIGH] is 3-way redundancy.\n"]
  db_servers : string_list option; [@ocaml.doc "The list of database servers for the VM cluster.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GB), that's allocated for the VM cluster.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The size of the data disk group, in terabytes (TB), that's allocated for the VM cluster.\n"]
  data_collection_options : data_collection_options option;
      [@ocaml.doc "The set of diagnostic collection options enabled for the VM cluster.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores enabled on the VM cluster.\n"]
  cluster_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the Grid Infrastructure (GI) cluster.\n"]
  cloud_exadata_infrastructure_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Exadata infrastructure that this VM cluster belongs \
         to.\n"]
  cloud_exadata_infrastructure_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the Exadata infrastructure that this VM cluster belongs to.\n"]
  cloud_vm_cluster_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the VM cluster.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the VM cluster.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the VM cluster.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name for the VM cluster.\n"]
  cloud_vm_cluster_id : resource_id; [@ocaml.doc "The unique identifier of the VM cluster.\n"]
}
[@@ocaml.doc "Information about a VM cluster.\n"]

type nonrec get_cloud_vm_cluster_output = {
  cloud_vm_cluster : cloud_vm_cluster option; [@ocaml.doc "The VM cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cloud_vm_cluster_input = {
  cloud_vm_cluster_id : resource_id; [@ocaml.doc "The unique identifier of the VM cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec cloud_autonomous_vm_cluster_resource_details = {
  unallocated_adb_storage_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The amount of unallocated Autonomous Database storage in the Autonomous VM cluster, in \
         terabytes.\n"]
  cloud_autonomous_vm_cluster_id : resource_id option;
      [@ocaml.doc "The unique identifier of the Autonomous VM cluster.\n"]
}
[@@ocaml.doc "Resource details of an Autonomous VM cluster.\n"]

type nonrec cloud_autonomous_vm_cluster_resource_details_list =
  cloud_autonomous_vm_cluster_resource_details list
[@@ocaml.doc ""]

type nonrec cloud_exadata_infrastructure_unallocated_resources = {
  ocpus : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of unallocated Oracle CPU Units (OCPUs) available.\n"]
  memory_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of unallocated memory available, in gigabytes (GB).\n"]
  local_storage_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of unallocated local storage available, in gigabytes (GB).\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the Cloud Exadata infrastructure.\n"]
  exadata_storage_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The amount of unallocated Exadata storage available, in terabytes (TB).\n"]
  cloud_exadata_infrastructure_display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The display name of the Cloud Exadata infrastructure.\n"]
  cloud_autonomous_vm_clusters : cloud_autonomous_vm_cluster_resource_details_list option;
      [@ocaml.doc
        "A list of Autonomous VM clusters associated with this Cloud Exadata Infrastructure.\n"]
}
[@@ocaml.doc "Information about unallocated resources in the Cloud Exadata infrastructure.\n"]

type nonrec get_cloud_exadata_infrastructure_unallocated_resources_output = {
  cloud_exadata_infrastructure_unallocated_resources :
    cloud_exadata_infrastructure_unallocated_resources option;
      [@ocaml.doc
        "Details about the unallocated resources in the specified Cloud Exadata infrastructure.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cloud_exadata_infrastructure_unallocated_resources_input = {
  db_servers : string_list option;
      [@ocaml.doc "The database servers to include in the unallocated resources query.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the Cloud Exadata infrastructure for which to retrieve \
         unallocated resources.\n"]
}
[@@ocaml.doc ""]

type nonrec cloud_exadata_infrastructure = {
  compute_model : compute_model option;
      [@ocaml.doc
        "The OCI model compute model used when you create or clone an instance: ECPU or OCPU. An \
         ECPU is an abstracted measure of compute resources. ECPUs are based on the number of \
         cores elastically allocated from a pool of compute and storage servers. An OCPU is a \
         legacy physical measure of compute resources. OCPUs are based on the physical core of a \
         processor with hyper-threading enabled. \n"]
  storage_server_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The storage server model type of the Exadata infrastructure. For the list of valid model \
         names, use the [ListDbSystemShapes] operation.\n"]
  database_server_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The database server model type of the Exadata infrastructure. For the list of valid model \
         names, use the [ListDbSystemShapes] operation.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The amount of progress made on the current operation on the Exadata infrastructure, \
         expressed as a percentage.\n"]
  total_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of storage, in gigabytes (GB), on the the Exadata infrastructure.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Exadata infrastructure was created.\n"]
  storage_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The software version of the storage servers on the Exadata infrastructure.\n"]
  storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of storage servers that are activated for the Exadata infrastructure.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The model name of the Exadata infrastructure.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the Exadata infrastructure.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The HTTPS link to the Exadata infrastructure in OCI.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the OCI resource anchor for the Exadata infrastructure.\n"]
  next_maintenance_run_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The OCID of the next maintenance run for the Exadata infrastructure.\n"]
  monthly_storage_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The monthly software version of the storage servers installed on the Exadata \
         infrastructure.\n"]
  monthly_db_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The monthly software version of the database servers installed on the Exadata \
         infrastructure.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of memory, in gigabytes (GB), that's allocated on the Exadata infrastructure.\n"]
  max_memory_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of memory, in gigabytes (GB), that's available on the Exadata \
         infrastructure.\n"]
  max_db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of local node storage, in gigabytes (GB), that's available on the \
         Exadata infrastructure.\n"]
  max_data_storage_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The total amount of data disk group storage, in terabytes (TB), that's available on the \
         Exadata infrastructure.\n"]
  max_cpu_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores available on the Exadata infrastructure.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "The scheduling details for the maintenance window. Patching and system updates take place \
         during the maintenance window.\n"]
  last_maintenance_run_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Oracle Cloud Identifier (OCID) of the last maintenance run for the Exadata \
         infrastructure.\n"]
  db_server_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The software version of the database servers (dom0) in the Exadata infrastructure.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size of the Exadata infrastructure's local node storage, in gigabytes (GB).\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The size of the Exadata infrastructure's data disk group, in terabytes (TB).\n"]
  customer_contacts_to_send_to_oc_i : customer_contacts option;
      [@ocaml.doc
        "The email addresses of contacts to receive notification from Oracle about maintenance \
         updates for the Exadata infrastructure.\n"]
  cpu_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total number of CPU cores that are allocated to the Exadata infrastructure.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of database servers for the Exadata infrastructure.\n"]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The AZ ID of the AZ where the Exadata infrastructure is located.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the Availability Zone (AZ) where the Exadata infrastructure is located.\n"]
  available_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of available storage, in gigabytes (GB), for the Exadata infrastructure.\n"]
  additional_storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of storage servers requested for the Exadata infrastructure.\n"]
  activated_storage_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of storage servers requested for the Exadata infrastructure.\n"]
  cloud_exadata_infrastructure_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the Exadata infrastructure.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the Exadata infrastructure.\n"]
  status : resource_status option;
      [@ocaml.doc "The current status of the Exadata infrastructure.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name for the Exadata infrastructure.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier for the Exadata infrastructure.\n"]
}
[@@ocaml.doc "Information about an Exadata infrastructure.\n"]

type nonrec get_cloud_exadata_infrastructure_output = {
  cloud_exadata_infrastructure : cloud_exadata_infrastructure option;
      [@ocaml.doc "The Exadata infrastructure.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cloud_exadata_infrastructure_input = {
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Exadata infrastructure.\n"]
}
[@@ocaml.doc ""]

type nonrec cloud_autonomous_vm_cluster = {
  iam_roles : iam_role_list option;
      [@ocaml.doc
        "The Amazon Web Services Identity and Access Management (IAM) service roles associated \
         with the Autonomous VM cluster.\n"]
  total_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total number of Autonomous Container Databases that can be created with the allocated \
         local storage.\n"]
  time_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time zone of the Autonomous VM cluster.\n"]
  time_ords_certificate_expires : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The expiration date and time of the Oracle REST Data Services (ORDS) certificate.\n"]
  time_database_ssl_certificate_expires : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The expiration date and time of the database SSL certificate.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous VM cluster was created.\n"]
  shape : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The shape of the Exadata infrastructure for the Autonomous VM cluster.\n"]
  scan_listener_port_tls : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The SCAN listener port for TLS (TCP) protocol. The default is 2484.\n"]
  scan_listener_port_non_tls : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The SCAN listener port for non-TLS (TCP) protocol. The default is 1521.\n"]
  reserved_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The number of CPU cores reserved for system operations and redundancy.\n"]
  reclaimable_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The number of CPU cores that can be reclaimed from terminated or scaled-down Autonomous \
         Databases.\n"]
  provisioned_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The number of CPU cores currently provisioned in the Autonomous VM cluster.\n"]
  provisioned_autonomous_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous CDBs currently provisioned in the Autonomous VM cluster.\n"]
  provisionable_autonomous_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous CDBs that can be provisioned in the Autonomous VM cluster.\n"]
  non_provisionable_autonomous_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous CDBs that can't be provisioned because of resource constraints.\n"]
  node_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of database server nodes in the Autonomous VM cluster.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The total amount of memory allocated to the Autonomous VM cluster, in gigabytes (GB).\n"]
  memory_per_oracle_compute_unit_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory allocated per Oracle Compute Unit, in GB.\n"]
  max_acds_lowest_scaled_value : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The minimum value to which you can scale down the maximum number of Autonomous CDBs.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "The scheduling details for the maintenance window. Patching and system updates take place \
         during the maintenance window.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model that applies to the Autonomous VM cluster.\n"]
  is_mtls_enabled_vm_cluster : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether mutual TLS (mTLS) authentication is enabled for the Autonomous VM \
         cluster.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing the OCI console page for this Autonomous VM cluster.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the Autonomous VM cluster.\n"]
  hostname : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The hostname for the Autonomous VM cluster.\n"]
  exadata_storage_in_t_bs_lowest_scaled_value : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The minimum value to which you can scale down the Exadata storage, in TB.\n"]
  domain : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The domain name for the Autonomous VM cluster.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-provided description of the Autonomous VM cluster.\n"]
  db_servers : string_list option;
      [@ocaml.doc "The list of database servers associated with the Autonomous VM cluster.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The local node storage allocated to the Autonomous VM cluster, in gigabytes (GB).\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total data storage allocated to the Autonomous VM cluster, in TB.\n"]
  data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total data storage allocated to the Autonomous VM cluster, in GB.\n"]
  cpu_percentage : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The percentage of total CPU cores currently in use in the Autonomous VM cluster.\n"]
  cpu_core_count_per_node : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores enabled per node in the Autonomous VM cluster.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of CPU cores in the Autonomous VM cluster.\n"]
  compute_model : compute_model option;
      [@ocaml.doc "The compute model of the Autonomous VM cluster: ECPU or OCPU.\n"]
  available_cpus : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc "The number of CPU cores available for allocation to Autonomous Databases.\n"]
  available_container_databases : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The number of Autonomous CDBs that you can create with the currently available storage.\n"]
  available_autonomous_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The available data storage space for Autonomous Databases in the Autonomous VM cluster, \
         in TB.\n"]
  autonomous_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The data storage size allocated for Autonomous Databases in the Autonomous VM cluster, in \
         TB.\n"]
  autonomous_data_storage_percentage : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The percentage of data storage currently in use for Autonomous Databases in the \
         Autonomous VM cluster.\n"]
  cloud_exadata_infrastructure_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Cloud Exadata Infrastructure containing this \
         Autonomous VM cluster.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn option;
      [@ocaml.doc
        "The unique identifier of the Cloud Exadata Infrastructure containing this Autonomous VM \
         cluster.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the current status of the Autonomous VM cluster.\n"]
  status : resource_status option;
      [@ocaml.doc
        "The current state of the Autonomous VM cluster. Possible values include [CREATING], \
         [AVAILABLE], [UPDATING], [DELETING], [DELETED], [FAILED].\n"]
  display_name : resource_display_name option;
      [@ocaml.doc "The display name of the Autonomous VM cluster.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The progress of the current operation on the Autonomous VM cluster, as a percentage.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the OCI resource anchor associated with this Autonomous VM cluster.\n"]
  odb_network_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network associated with this Autonomous VM \
         cluster.\n"]
  odb_network_id : resource_id_or_arn option;
      [@ocaml.doc
        "The unique identifier of the ODB network associated with this Autonomous VM cluster.\n"]
  cloud_autonomous_vm_cluster_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the Autonomous VM cluster.\n"]
  cloud_autonomous_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the Autonomous VM cluster.\n"]
}
[@@ocaml.doc "Information about an Autonomous VM cluster resource.\n"]

type nonrec get_cloud_autonomous_vm_cluster_output = {
  cloud_autonomous_vm_cluster : cloud_autonomous_vm_cluster option;
      [@ocaml.doc "The details of the requested Autonomous VM cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cloud_autonomous_vm_cluster_input = {
  cloud_autonomous_vm_cluster_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the Autonomous VM cluster to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_wallet_status = UPDATING [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec autonomous_database_wallet_details = {
  time_rotated : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database wallet was last rotated.\n"]
  status : autonomous_database_wallet_status option;
      [@ocaml.doc "The current status of the Autonomous Database wallet.\n"]
}
[@@ocaml.doc "The wallet details for an Autonomous Database.\n"]

type nonrec get_autonomous_database_wallet_details_output = {
  autonomous_database_wallet_details : autonomous_database_wallet_details;
      [@ocaml.doc "The wallet details for the Autonomous Database.\n"]
}
[@@ocaml.doc ""]

type nonrec get_autonomous_database_wallet_details_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the Autonomous Database to retrieve wallet details for.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database = {
  time_undeleted : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database was restored after deletion.\n"]
  next_long_term_backup_time_stamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the next scheduled long-term backup of the Autonomous Database.\n"]
  time_until_reconnect_clone_enabled : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time until which reconnecting the refreshable clone to its source Autonomous \
         Database is allowed.\n"]
  time_disaster_recovery_role_changed : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the disaster recovery role of the Autonomous Database last changed.\n"]
  time_reclamation_of_free_autonomous_database : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the Always Free Autonomous Database is scheduled to be stopped \
         because of inactivity.\n"]
  time_deletion_of_free_autonomous_database : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the inactive Always Free Autonomous Database is scheduled to be \
         automatically deleted.\n"]
  time_of_auto_refresh_start : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time at which the automatic refresh of the refreshable clone Autonomous \
         Database starts.\n"]
  time_of_next_refresh : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the next scheduled refresh of the refreshable clone Autonomous \
         Database.\n"]
  time_of_last_refresh_point : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time as of which the data in the refreshable clone Autonomous Database is \
         current.\n"]
  time_of_last_refresh : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the last refresh of the refreshable clone Autonomous Database.\n"]
  time_of_last_failover : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time of the last failover operation for the Autonomous Database.\n"]
  time_of_last_switchover : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time of the last switchover operation for the Autonomous Database.\n"]
  time_data_guard_role_changed : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the Oracle Data Guard role of the Autonomous Database last changed.\n"]
  time_local_data_guard_enabled : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when local Oracle Data Guard was enabled for the Autonomous Database.\n"]
  time_maintenance_end : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the next maintenance of the Autonomous Database ends.\n"]
  time_maintenance_begin : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time when the next maintenance of the Autonomous Database begins.\n"]
  time_of_last_backup : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time of the last backup of the Autonomous Database.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database was created.\n"]
  encryption_summary : encryption_summary option;
      [@ocaml.doc "The encryption configuration for the Autonomous Database.\n"]
  resource_pool_summary : resource_pool_summary option;
      [@ocaml.doc "The configuration of the resource pool for the Autonomous Database.\n"]
  total_backup_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total amount of backup storage used by the Autonomous Database, in GB.\n"]
  is_backup_retention_locked : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether the backup retention period of the Autonomous Database is locked.\n"]
  long_term_backup_schedule : long_term_backup_schedule option;
      [@ocaml.doc "The long-term backup schedule for the Autonomous Database.\n"]
  backup_retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The retention period, in days, for automatic backups of the Autonomous Database.\n"]
  clone_table_space_list : integer_list option;
      [@ocaml.doc "The list of tablespace identifiers to clone for the Autonomous Database.\n"]
  is_reconnect_clone_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether reconnecting the refreshable clone to its source Autonomous Database is \
         enabled.\n"]
  auto_refresh_point_lag_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time lag, in seconds, between the refreshable clone and its source Autonomous Database.\n"]
  auto_refresh_frequency_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The frequency, in seconds, at which the refreshable clone Autonomous Database is \
         automatically refreshed.\n"]
  refreshable_status : refreshable_status option;
      [@ocaml.doc "The refresh status of the refreshable clone Autonomous Database.\n"]
  refreshable_mode : refreshable_mode option;
      [@ocaml.doc "The refresh mode of the refreshable clone Autonomous Database.\n"]
  is_refreshable_clone : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the Autonomous Database is a refreshable clone.\n"]
  remote_disaster_recovery_configuration : disaster_recovery_configuration option;
      [@ocaml.doc
        "The configuration of the remote disaster recovery for the Autonomous Database.\n"]
  local_adg_auto_failover_max_data_loss_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum data loss limit, in seconds, for automatic failover to the local Oracle Data \
         Guard standby database.\n"]
  failed_data_recovery_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of time, in seconds, that the data in the Autonomous Database is behind the \
         data in the primary database.\n"]
  peer_db_ids : string_list option;
      [@ocaml.doc "The list of unique identifiers of the peer Autonomous Databases.\n"]
  role : data_guard_role option;
      [@ocaml.doc "The Oracle Data Guard role of the Autonomous Database.\n"]
  local_disaster_recovery_type : disaster_recovery_type option;
      [@ocaml.doc "The type of local disaster recovery configured for the Autonomous Database.\n"]
  is_remote_data_guard_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether remote Oracle Data Guard is enabled for the Autonomous Database.\n"]
  is_local_data_guard_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether local Oracle Data Guard is enabled for the Autonomous Database.\n"]
  standby_allowlisted_ips_source : standby_allowlisted_ips_source option;
      [@ocaml.doc
        "The source of the allowlisted IP addresses for the standby Autonomous Database.\n"]
  standby_allowlisted_ips : string_list option;
      [@ocaml.doc
        "The list of IP addresses that are allowed to access the standby Autonomous Database.\n"]
  allowlisted_ips : string_list option;
      [@ocaml.doc "The list of IP addresses that are allowed to access the Autonomous Database.\n"]
  private_endpoint_label : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint label for the Autonomous Database.\n"]
  private_endpoint_ip : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint IP address for the Autonomous Database.\n"]
  private_endpoint : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint for the Autonomous Database.\n"]
  odb_network_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the ODB network associated with the Autonomous Database.\n"]
  odb_network_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the ODB network associated with the Autonomous Database.\n"]
  is_auto_scaling_for_storage_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether automatic scaling of the storage is enabled for the Autonomous Database.\n"]
  in_memory_area_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The size of the in-memory area of the Autonomous Database, in GB.\n"]
  allocated_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The amount of storage currently allocated to the Autonomous Database, in TB.\n"]
  actual_used_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The actual amount of data storage currently in use by the Autonomous Database, in TB.\n"]
  used_data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of data storage currently in use by the Autonomous Database, in GB.\n"]
  used_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The amount of data storage currently in use by the Autonomous Database, in TB.\n"]
  data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size, in gigabytes (GB), of the data volume allocated for the Autonomous Database.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The size, in terabytes (TB), of the data volume allocated for the Autonomous Database.\n"]
  is_auto_scaling_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether automatic scaling of the compute resources is enabled for the \
         Autonomous Database.\n"]
  provisionable_cpus : integer_list option;
      [@ocaml.doc
        "The list of CPU core counts that you can provision for the Autonomous Database.\n"]
  memory_per_oracle_compute_unit_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory allocated per Oracle Compute Unit, in GB.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores allocated to the Autonomous Database.\n"]
  compute_model : compute_model option;
      [@ocaml.doc "The compute model of the Autonomous Database, either ECPU or OCPU.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The compute capacity, in number of Elastic CPUs (ECPUs) or Oracle CPUs (OCPUs), assigned \
         to the Autonomous Database.\n"]
  resource_pool_leader_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique identifier of the resource pool leader Autonomous Database.\n"]
  scheduled_operations : scheduled_operation_details_list option;
      [@ocaml.doc "The list of scheduled start and stop times for the Autonomous Database.\n"]
  db_tools_details : database_tool_list option;
      [@ocaml.doc "The list of database management tools enabled for the Autonomous Database.\n"]
  connection_urls : autonomous_database_connection_urls option;
      [@ocaml.doc
        "The connection URLs for accessing tools and services for the Autonomous Database.\n"]
  maintenance_target_component : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The component on the Autonomous Database that the current maintenance is being applied to.\n"]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the Availability Zone where the Autonomous Database is located.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Availability Zone where the Autonomous Database is located.\n"]
  operations_insights_status : operations_insights_status option;
      [@ocaml.doc "The status of Oracle Operations Insights for the Autonomous Database.\n"]
  database_management_status : database_management_status option;
      [@ocaml.doc "The status of Oracle Database Management for the Autonomous Database.\n"]
  data_safe_status : data_safe_status option;
      [@ocaml.doc "The status of the Oracle Data Safe registration for the Autonomous Database.\n"]
  local_standby_db : database_standby_summary option;
      [@ocaml.doc
        "The details of the local standby Autonomous Database in an Oracle Data Guard configuration.\n"]
  standby_db : database_standby_summary option;
      [@ocaml.doc
        "The details of the standby Autonomous Database in a cross-Region Oracle Data Guard \
         configuration.\n"]
  apex_details : autonomous_database_apex option;
      [@ocaml.doc "The Oracle Application Express (APEX) details for the Autonomous Database.\n"]
  customer_contacts : customer_contacts option;
      [@ocaml.doc
        "The list of customer contacts that receive operational notifications from Oracle for the \
         Autonomous Database.\n"]
  sql_web_developer_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing Oracle SQL Developer Web for the Autonomous Database.\n"]
  service_console_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing the Oracle service console for the Autonomous Database.\n"]
  connection_string_details : autonomous_database_connection_strings option;
      [@ocaml.doc "The connection string details for the Autonomous Database.\n"]
  byol_compute_count_limit : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The maximum number of compute resources that you can allocate to the Autonomous Database \
         under the bring-your-own-license (BYOL) model.\n"]
  available_upgrade_versions : string_list option;
      [@ocaml.doc
        "The list of Oracle Database software versions to which the Autonomous Database can be \
         upgraded.\n"]
  net_services_architecture : net_services_architecture option;
      [@ocaml.doc
        "The Oracle Net Services architecture of the Autonomous Database, either dedicated or \
         shared.\n"]
  autonomous_maintenance_schedule_type : autonomous_maintenance_schedule_type option;
      [@ocaml.doc "The maintenance schedule type for the Autonomous Database.\n"]
  is_mtls_connection_required : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether mutual TLS (mTLS) authentication is required to connect to the \
         Autonomous Database.\n"]
  permission_level : permission_level option;
      [@ocaml.doc "The permission level of the Autonomous Database.\n"]
  open_mode : open_mode option;
      [@ocaml.doc
        "The mode in which the Autonomous Database is open, either read-only or read/write.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model that applies to the Autonomous Database.\n"]
  database_edition : database_edition option;
      [@ocaml.doc "The Oracle Database edition of the Autonomous Database.\n"]
  ncharacter_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The national character set of the Autonomous Database.\n"]
  character_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The character set of the Autonomous Database.\n"]
  db_workload : db_workload option;
      [@ocaml.doc
        "The intended use of the Autonomous Database, such as transaction processing, data \
         warehouse, JSON database, or APEX.\n"]
  db_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Database software version of the Autonomous Database.\n"]
  database_type : database_type option;
      [@ocaml.doc "The type of the Autonomous Database, either a regular database or a clone.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database, if applicable.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database.\n"]
  source_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier of the source from which the Autonomous Database was created.\n"]
  db_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The name of the Autonomous Database.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  oci_url : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The URL for accessing the OCI console page for the Autonomous Database.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the Autonomous Database.\n"]
  percent_progress : Smaws_Lib.Smithy_api.Types.float_ option;
      [@ocaml.doc
        "The progress of the current operation on the Autonomous Database, as a percentage.\n"]
  oci_resource_anchor_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the Oracle Cloud Infrastructure (OCI) resource anchor associated with the \
         Autonomous Database.\n"]
  autonomous_database_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Autonomous Database.\n"]
  autonomous_database_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the Autonomous Database.\n"]
}
[@@ocaml.doc "Information about an Autonomous Database.\n"]

type nonrec get_autonomous_database_output = {
  autonomous_database : autonomous_database;
      [@ocaml.doc "The details of the requested Autonomous Database.\n"]
}
[@@ocaml.doc ""]

type nonrec get_autonomous_database_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the Autonomous Database to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_backup = {
  type_ : autonomous_database_backup_type option;
      [@ocaml.doc "The type of the Autonomous Database backup.\n"]
  time_ended : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database backup ended.\n"]
  time_started : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the Autonomous Database backup started.\n"]
  time_available_till : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "The date and time until which the Autonomous Database backup is available for restore.\n"]
  size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The size of the Autonomous Database backup, in terabytes (TB).\n"]
  retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The retention period, in days, for the Autonomous Database backup.\n"]
  is_automatic : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Indicates whether the backup was created automatically.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database backup, if \
         applicable.\n"]
  status : autonomous_database_backup_status option;
      [@ocaml.doc "The current status of the Autonomous Database backup.\n"]
  db_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Database software version of the Autonomous Database backup.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database backup.\n"]
  ocid : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Cloud Identifier (OCID) of the Autonomous Database backup.\n"]
  autonomous_database_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the Autonomous Database that the backup was created from.\n"]
  autonomous_database_backup_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Autonomous Database backup.\n"]
  autonomous_database_backup_id : resource_id option;
      [@ocaml.doc "The unique identifier of the Autonomous Database backup.\n"]
}
[@@ocaml.doc "Information about an Autonomous Database backup.\n"]

type nonrec get_autonomous_database_backup_output = {
  autonomous_database_backup : autonomous_database_backup option;
      [@ocaml.doc "The details of the requested Autonomous Database backup.\n"]
}
[@@ocaml.doc ""]

type nonrec get_autonomous_database_backup_input = {
  autonomous_database_backup_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the Autonomous Database backup to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec general_input_string = string [@@ocaml.doc ""]

type nonrec failover_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the status of the Autonomous Database after the failover \
         operation.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database after the failover operation.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was failed over.\n"]
}
[@@ocaml.doc ""]

type nonrec failover_autonomous_database_input = {
  peer_db_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the peer Autonomous Database to fail over to.\n"]
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to fail over.\n"]
}
[@@ocaml.doc ""]

type nonrec exascale_db_storage_vault_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec exadb_vm_cluster_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec delete_odb_peering_connection_output = unit [@@ocaml.doc ""]

type nonrec delete_odb_peering_connection_input = {
  odb_peering_connection_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the ODB peering connection to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_odb_network_output = unit [@@ocaml.doc ""]

type nonrec delete_odb_network_input = {
  delete_associated_resources : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Specifies whether to delete associated OCI networking resources along with the ODB network.\n"]
  odb_network_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the ODB network to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cloud_vm_cluster_output = unit [@@ocaml.doc ""]

type nonrec delete_cloud_vm_cluster_input = {
  cloud_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the VM cluster to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cloud_exadata_infrastructure_output = unit [@@ocaml.doc ""]

type nonrec delete_cloud_exadata_infrastructure_input = {
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Exadata infrastructure to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cloud_autonomous_vm_cluster_output = unit [@@ocaml.doc ""]

type nonrec delete_cloud_autonomous_vm_cluster_input = {
  cloud_autonomous_vm_cluster_id : resource_id;
      [@ocaml.doc "The unique identifier of the Autonomous VM cluster to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_autonomous_database_output = unit [@@ocaml.doc ""]

type nonrec delete_autonomous_database_input = {
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_autonomous_database_backup_output = unit [@@ocaml.doc ""]

type nonrec delete_autonomous_database_backup_input = {
  autonomous_database_backup_id : resource_id;
      [@ocaml.doc "The unique identifier of the Autonomous Database backup to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec db_node_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec create_odb_peering_connection_output = {
  odb_peering_connection_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the ODB peering connection.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for the current status of the ODB peering connection.\n"]
  status : resource_status option; [@ocaml.doc "The status of the ODB peering connection.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The display name of the ODB peering connection.\n"]
}
[@@ocaml.doc ""]

type nonrec create_odb_peering_connection_input = {
  tags : request_tag_map option; [@ocaml.doc "The tags to assign to the ODB peering connection.\n"]
  client_token : general_input_string option;
      [@ocaml.doc
        "The client token for the ODB peering connection request.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be unique for each request.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  peer_network_route_table_ids : peer_network_route_table_id_list option;
      [@ocaml.doc
        "The unique identifier of the VPC route table for which a route to the ODB network is \
         automatically created during peering connection establishment.\n"]
  peer_network_cidrs_to_be_added : peered_cidr_list option;
      [@ocaml.doc
        "A list of CIDR blocks to add to the peering connection. These CIDR blocks define the IP \
         address ranges that can communicate through the peering connection.\n"]
  display_name : resource_display_name option;
      [@ocaml.doc "The display name for the ODB peering connection.\n"]
  peer_network_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the peer network. This can be either a VPC ID or another ODB \
         network ID.\n"]
  odb_network_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the ODB network that initiates the peering connection.\n"]
}
[@@ocaml.doc ""]

type nonrec create_odb_network_output = {
  odb_network_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the ODB network.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the ODB network.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the ODB network.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the ODB network.\n"]
}
[@@ocaml.doc ""]

type nonrec create_odb_network_input = {
  tags : request_tag_map option;
      [@ocaml.doc "The list of resource tags to apply to the ODB network.\n"]
  cross_region_s3_restore_sources_to_enable : string_list option;
      [@ocaml.doc "The cross-Region Amazon S3 restore sources to enable for the ODB network.\n"]
  kms_policy_document : policy_document option;
      [@ocaml.doc
        "The Amazon Web Services Key Management Service (KMS) policy document that defines \
         permissions for key usage within the ODB network.\n"]
  sts_policy_document : policy_document option;
      [@ocaml.doc
        "The Amazon Web Services Security Token Service (STS) policy document that defines \
         permissions for token service usage within the ODB network.\n"]
  s3_policy_document : policy_document option;
      [@ocaml.doc "Specifies the endpoint policy for Amazon S3 access from the ODB network.\n"]
  kms_access : access option;
      [@ocaml.doc
        "The Amazon Web Services Key Management Service (KMS) access configuration for the ODB \
         network.\n"]
  sts_access : access option;
      [@ocaml.doc
        "The Amazon Web Services Security Token Service (STS) access configuration for the ODB \
         network.\n"]
  zero_etl_access : access option;
      [@ocaml.doc "Specifies the configuration for Zero-ETL access from the ODB network.\n"]
  s3_access : access option;
      [@ocaml.doc "Specifies the configuration for Amazon S3 access from the ODB network.\n"]
  client_token : general_input_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, the Amazon Web Services SDK automatically \
         generates a client token and uses it for the request to ensure idempotency. The client \
         token is valid for up to 24 hours after it's first used.\n"]
  default_dns_prefix : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The DNS prefix to the default DNS domain name. The default DNS domain name is \
         oraclevcn.com.\n"]
  custom_domain_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The domain name to use for the resources in the ODB network.\n"]
  backup_subnet_cidr : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The CIDR range of the backup subnet for the ODB network.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must not overlap with the CIDR range of the client subnet.\n\
        \            \n\
        \             }\n\
        \        {-  Must not overlap with the CIDR ranges of the VPCs that are connected to the \
         ODB network.\n\
        \            \n\
        \             }\n\
        \        {-  Must not use the following CIDR ranges that are reserved by OCI:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [100.106.0.0/16] and [100.107.0.0/16] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [169.254.0.0/16] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [224.0.0.0 - 239.255.255.255] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [240.0.0.0 - 255.255.255.255] \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \  "]
  client_subnet_cidr : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The CIDR range of the client subnet for the ODB network.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must not overlap with the CIDR range of the backup subnet.\n\
        \            \n\
        \             }\n\
        \        {-  Must not overlap with the CIDR ranges of the VPCs that are connected to the \
         ODB network.\n\
        \            \n\
        \             }\n\
        \        {-  Must not use the following CIDR ranges that are reserved by OCI:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [100.106.0.0/16] and [100.107.0.0/16] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [169.254.0.0/16] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [224.0.0.0 - 239.255.255.255] \n\
        \                       \n\
        \                        }\n\
        \                   {-   [240.0.0.0 - 255.255.255.255] \n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \  "]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The AZ ID of the AZ where the ODB network is located.\n\n\
        \ This operation requires that you specify a value for either [availabilityZone] or \
         [availabilityZoneId].\n\
        \ "]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Web Services Availability Zone (AZ) where the ODB network is located.\n\n\
        \ This operation requires that you specify a value for either [availabilityZone] or \
         [availabilityZoneId].\n\
        \ "]
  display_name : resource_display_name; [@ocaml.doc "A user-friendly name for the ODB network.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cloud_vm_cluster_output = {
  cloud_vm_cluster_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier for the VM cluster.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the VM cluster.\n"]
  status : resource_status option; [@ocaml.doc "The current status of the VM cluster.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name for the VM cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_name = string [@@ocaml.doc ""]

type nonrec create_cloud_vm_cluster_input = {
  scan_listener_port_tcp : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The port number for TCP connections to the single client access name (SCAN) listener. \n\n\
        \ Valid values: [1024\226\128\1478999] with the following exceptions: [2484], [6100], \
         [6200], [7060], [7070], [7085], and [7879] \n\
        \ \n\
        \  Default: [1521] \n\
        \  "]
  client_token : general_input_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, the Amazon Web Services SDK automatically \
         generates a client token and uses it for the request to ensure idempotency. The client \
         token is valid for up to 24 hours after it's first used.\n"]
  time_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The time zone for the VM cluster. For a list of valid values for time zone, you can check \
         the options in the console.\n\n\
        \ Default: UTC\n\
        \ "]
  system_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The version of the operating system of the image for the VM cluster.\n"]
  memory_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The amount of memory, in gigabytes (GBs), to allocate for the VM cluster.\n"]
  license_model : license_model option;
      [@ocaml.doc
        "The Oracle license model to apply to the VM cluster.\n\n Default: [LICENSE_INCLUDED] \n "]
  is_sparse_diskgroup_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Specifies whether to create a sparse disk group for the VM cluster.\n"]
  is_local_backup_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable database backups to local Exadata storage for the VM cluster.\n"]
  tags : request_tag_map option;
      [@ocaml.doc "The list of resource tags to apply to the VM cluster.\n"]
  db_servers : string_list option; [@ocaml.doc "The list of database servers for the VM cluster.\n"]
  db_node_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The amount of local node storage, in gigabytes (GBs), to allocate for the VM cluster.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The size of the data disk group, in terabytes (TBs), to allocate for the VM cluster.\n"]
  data_collection_options : data_collection_options option;
      [@ocaml.doc
        "The set of preferences for the various diagnostic collection options for the VM cluster.\n"]
  cluster_name : cluster_name option;
      [@ocaml.doc "A name for the Grid Infrastructure cluster. The name isn't case sensitive.\n"]
  odb_network_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the ODB network for the VM cluster.\n"]
  ssh_public_keys : string_list;
      [@ocaml.doc
        "The public key portion of one or more key pairs used for SSH access to the VM cluster.\n"]
  hostname : hostname;
      [@ocaml.doc
        "The host name for the VM cluster.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Can't be \"localhost\" or \"hostname\".\n\
        \            \n\
        \             }\n\
        \        {-  Can't contain \"-version\".\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of the combined hostname and domain is 63 characters.\n\
        \            \n\
        \             }\n\
        \        {-  The hostname must be unique within the subnet.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  gi_version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "A valid software version of Oracle Grid Infrastructure (GI). To get the list of valid \
         values, use the [ListGiVersions] operation and specify the shape of the Exadata \
         infrastructure.\n\n\
        \ Example: [19.0.0.0] \n\
        \ "]
  display_name : resource_display_name; [@ocaml.doc "A user-friendly name for the VM cluster.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The number of CPU cores to enable on the VM cluster.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Exadata infrastructure for this VM cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cloud_exadata_infrastructure_output = {
  cloud_exadata_infrastructure_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Exadata infrastructure.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Additional information about the status of the Exadata infrastructure.\n"]
  status : resource_status option;
      [@ocaml.doc "The current status of the Exadata infrastructure.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name for the Exadata infrastructure.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cloud_exadata_infrastructure_input = {
  storage_server_type : general_input_string option;
      [@ocaml.doc
        "The storage server model type of the Exadata infrastructure. For the list of valid model \
         names, use the [ListDbSystemShapes] operation.\n"]
  database_server_type : general_input_string option;
      [@ocaml.doc
        "The database server model type of the Exadata infrastructure. For the list of valid model \
         names, use the [ListDbSystemShapes] operation.\n"]
  client_token : general_input_string option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. If you don't specify a client token, the Amazon Web Services SDK automatically \
         generates a client token and uses it for the request to ensure idempotency. The client \
         token is valid for up to 24 hours after it's first used.\n"]
  storage_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "The number of storage servers to activate for this Exadata infrastructure. Valid values \
         for this parameter depend on the shape. To get information about the minimum and maximum \
         values, use the [ListDbSystemShapes] operation.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "The maintenance window configuration for the Exadata Cloud infrastructure.\n\n\
        \ This allows you to define when maintenance operations such as patching and updates can \
         be performed on the infrastructure.\n\
        \ "]
  customer_contacts_to_send_to_oc_i : customer_contacts option;
      [@ocaml.doc
        "The email addresses of contacts to receive notification from Oracle about maintenance \
         updates for the Exadata infrastructure.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "The number of database servers for the Exadata infrastructure. Valid values for this \
         parameter depend on the shape. To get information about the minimum and maximum values, \
         use the [ListDbSystemShapes] operation.\n"]
  tags : request_tag_map option;
      [@ocaml.doc "The list of resource tags to apply to the Exadata infrastructure.\n"]
  availability_zone_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The AZ ID of the AZ where the Exadata infrastructure is located.\n\n\
        \ This operation requires that you specify a value for either [availabilityZone] or \
         [availabilityZoneId].\n\
        \ \n\
        \  Example: [use1-az1] \n\
        \  "]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the Availability Zone (AZ) where the Exadata infrastructure is located.\n\n\
        \ This operation requires that you specify a value for either [availabilityZone] or \
         [availabilityZoneId].\n\
        \ \n\
        \  Example: [us-east-1a] \n\
        \  "]
  shape : general_input_string;
      [@ocaml.doc
        "The model name of the Exadata infrastructure. For the list of valid model names, use the \
         [ListDbSystemShapes] operation.\n"]
  display_name : resource_display_name;
      [@ocaml.doc "A user-friendly name for the Exadata infrastructure.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cloud_autonomous_vm_cluster_output = {
  cloud_autonomous_vm_cluster_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the created Autonomous VM cluster.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous VM cluster creation \
         process, if applicable.\n"]
  status : resource_status option;
      [@ocaml.doc "The current status of the Autonomous VM cluster creation process.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The display name of the created Autonomous VM cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cloud_autonomous_vm_cluster_input = {
  total_container_databases : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc
        "The total number of Autonomous CDBs that you can create in the Autonomous VM cluster.\n"]
  time_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The time zone to use for the Autonomous VM cluster.\n"]
  tags : request_tag_map option;
      [@ocaml.doc
        "Free-form tags for this resource. Each tag is a key-value pair with no predefined name, \
         type, or namespace.\n"]
  scan_listener_port_tls : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The SCAN listener port for TLS (TCP) protocol.\n"]
  scan_listener_port_non_tls : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The SCAN listener port for non-TLS (TCP) protocol.\n"]
  memory_per_oracle_compute_unit_in_g_bs : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The amount of memory to be allocated per OCPU, in GB.\n"]
  maintenance_window : maintenance_window option;
      [@ocaml.doc
        "The scheduling details for the maintenance window. Patching and system updates take place \
         during the maintenance window.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model to apply to the Autonomous VM cluster.\n"]
  is_mtls_enabled_vm_cluster : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable mutual TLS (mTLS) authentication for the Autonomous VM cluster.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "A user-provided description of the Autonomous VM cluster.\n"]
  db_servers : string_list option;
      [@ocaml.doc "The list of database servers to be used for the Autonomous VM cluster.\n"]
  cpu_core_count_per_node : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The number of CPU cores to be enabled per VM cluster node.\n"]
  autonomous_data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.double;
      [@ocaml.doc
        "The data disk group size to be allocated for Autonomous Databases, in terabytes (TB).\n"]
  client_token : general_input_string option;
      [@ocaml.doc "A client-provided token to ensure idempotency of the request.\n"]
  display_name : resource_display_name;
      [@ocaml.doc
        "The display name for the Autonomous VM cluster. The name does not need to be unique.\n"]
  odb_network_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the ODB network to be used for the VM cluster.\n"]
  cloud_exadata_infrastructure_id : resource_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the Exadata infrastructure where the VM cluster will be created.\n"]
}
[@@ocaml.doc ""]

type nonrec autonomous_database_wallet_file = bytes [@@ocaml.doc ""]

type nonrec create_autonomous_database_wallet_output = {
  autonomous_database_wallet_file : autonomous_database_wallet_file;
      [@ocaml.doc
        "The generated wallet file for the Autonomous Database, returned as a compressed archive.\n"]
}
[@@ocaml.doc ""]

type nonrec create_autonomous_database_wallet_input = {
  client_token : general_input_string option;
      [@ocaml.doc "A client-provided token to ensure the idempotency of the request.\n"]
  password : sensitive_string; [@ocaml.doc "The password to encrypt the keys inside the wallet.\n"]
  wallet_type : wallet_type option;
      [@ocaml.doc "The type of wallet to create, either a regional wallet or an instance wallet.\n"]
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to create a wallet for.\n"]
}
[@@ocaml.doc ""]

type nonrec create_autonomous_database_output = {
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database, if applicable.\n"]
  status : autonomous_database_resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database that was created.\n"]
  autonomous_database_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_autonomous_database_input = {
  tags : request_tag_map option;
      [@ocaml.doc
        "The list of resource tags to apply to the Autonomous Database. Each tag is a key-value \
         pair with no predefined name, type, or namespace.\n"]
  client_token : general_input_string option;
      [@ocaml.doc "A client-provided token to ensure the idempotency of the request.\n"]
  encryption_key_configuration : encryption_key_configuration_input option;
      [@ocaml.doc "The configuration of the encryption key to use for the Autonomous Database.\n"]
  encryption_key_provider : encryption_key_provider_input option;
      [@ocaml.doc "The provider of the encryption key to use for the Autonomous Database.\n"]
  source_configuration : source_configuration option;
      [@ocaml.doc
        "The configuration details for the source used to create the Autonomous Database.\n"]
  source : source_type option;
      [@ocaml.doc
        "The source from which to create the Autonomous Database, such as a clone, backup, or \
         cross-Region copy.\n"]
  db_tools_details : database_tool_list option;
      [@ocaml.doc "The list of database management tools to enable for the Autonomous Database.\n"]
  is_mtls_connection_required : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether mutual TLS (mTLS) authentication is required to connect to the \
         Autonomous Database.\n"]
  is_local_data_guard_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable local Oracle Data Guard for the Autonomous Database.\n"]
  is_backup_retention_locked : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to lock the backup retention period of the Autonomous Database to \
         prevent it from being shortened.\n"]
  transportable_tablespace : transportable_tablespace option;
      [@ocaml.doc
        "The transportable tablespace configuration to use when creating the Autonomous Database.\n"]
  allowlisted_ips : string_list option;
      [@ocaml.doc "The list of IP addresses that are allowed to access the Autonomous Database.\n"]
  standby_allowlisted_ips : string_list option;
      [@ocaml.doc
        "The list of IP addresses that are allowed to access the standby Autonomous Database.\n"]
  scheduled_operations : scheduled_operation_details_list option;
      [@ocaml.doc "The list of scheduled start and stop times for the Autonomous Database.\n"]
  resource_pool_summary : resource_pool_summary option;
      [@ocaml.doc "The configuration of the resource pool for the Autonomous Database.\n"]
  resource_pool_leader_id : resource_id_or_arn option;
      [@ocaml.doc "The unique identifier of the resource pool leader Autonomous Database.\n"]
  private_endpoint_label : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint label for the Autonomous Database.\n"]
  private_endpoint_ip : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The private endpoint IP address for the Autonomous Database.\n"]
  customer_contacts_to_send_to_oc_i : customer_contacts option;
      [@ocaml.doc
        "The list of customer contacts to receive operational notifications from Oracle Cloud \
         Infrastructure (OCI) for the Autonomous Database.\n"]
  cpu_core_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The number of CPU cores to allocate to the Autonomous Database.\n"]
  byol_compute_count_limit : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The maximum number of compute resources that you can allocate to the Autonomous Database \
         under the bring-your-own-license (BYOL) model.\n"]
  backup_retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The retention period, in days, for automatic backups of the Autonomous Database.\n"]
  autonomous_maintenance_schedule_type : autonomous_maintenance_schedule_type option;
      [@ocaml.doc "The maintenance schedule type for the Autonomous Database.\n"]
  standby_allowlisted_ips_source : standby_allowlisted_ips_source option;
      [@ocaml.doc
        "The source of the allowlisted IP addresses for the standby Autonomous Database.\n"]
  database_edition : database_edition option;
      [@ocaml.doc "The Oracle Database edition to apply to the Autonomous Database.\n"]
  db_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Oracle Database software version to use for the Autonomous Database.\n"]
  ncharacter_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The national character set to use for the Autonomous Database.\n"]
  character_set : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The character set to use for the Autonomous Database.\n"]
  license_model : license_model option;
      [@ocaml.doc "The Oracle license model to apply to the Autonomous Database.\n"]
  is_auto_scaling_for_storage_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable automatic scaling of the storage for the Autonomous Database.\n"]
  is_auto_scaling_enabled : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Specifies whether to enable automatic scaling of the compute resources for the Autonomous \
         Database.\n"]
  db_workload : db_workload option;
      [@ocaml.doc
        "The intended use of the Autonomous Database, such as transaction processing, data \
         warehouse, JSON database, or APEX.\n"]
  data_storage_size_in_g_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size, in gigabytes (GB), of the data volume to allocate for the Autonomous Database.\n"]
  data_storage_size_in_t_bs : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The size, in terabytes (TB), of the data volume to allocate for the Autonomous Database.\n"]
  compute_count : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The compute capacity, in number of Elastic CPUs (ECPUs) or Oracle CPUs (OCPUs), to assign \
         to the Autonomous Database.\n"]
  admin_password : sensitive_string option;
      [@ocaml.doc "The password for the [ADMIN] user of the Autonomous Database.\n"]
  db_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The name of the Autonomous Database. The name must begin with an alphabetic character and \
         can contain a maximum of 30 alphanumeric characters. Special characters are not \
         permitted. The name must be unique in the Amazon Web Services account.\n"]
  display_name : resource_display_name option;
      [@ocaml.doc
        "The user-friendly name for the Autonomous Database. The name does not have to be unique.\n"]
  odb_network_id : resource_id_or_arn option;
      [@ocaml.doc
        "The unique identifier of the ODB network to be used for the Autonomous Database.\n"]
}
[@@ocaml.doc ""]

type nonrec create_autonomous_database_backup_output = {
  autonomous_database_backup_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique identifier of the Autonomous Database backup that was created.\n"]
  status_reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Additional information about the current status of the Autonomous Database backup, if \
         applicable.\n"]
  status : resource_status option;
      [@ocaml.doc "The current status of the Autonomous Database backup.\n"]
  display_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The user-friendly name of the Autonomous Database backup that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_autonomous_database_backup_input = {
  tags : request_tag_map option;
      [@ocaml.doc
        "The list of resource tags to apply to the Autonomous Database backup. Each tag is a \
         key-value pair with no predefined name, type, or namespace.\n"]
  client_token : general_input_string option;
      [@ocaml.doc "A client-provided token to ensure the idempotency of the request.\n"]
  retention_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The retention period, in days, for the Autonomous Database backup.\n"]
  display_name : resource_display_name option;
      [@ocaml.doc "The user-friendly name for the Autonomous Database backup.\n"]
  autonomous_database_id : resource_id_or_arn;
      [@ocaml.doc "The unique identifier of the Autonomous Database to back up.\n"]
}
[@@ocaml.doc ""]

type nonrec cloud_vm_cluster_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec cloud_exadata_infrastructure_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec cloud_autonomous_vm_cluster_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec autonomous_database_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec autonomous_database_backup_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
