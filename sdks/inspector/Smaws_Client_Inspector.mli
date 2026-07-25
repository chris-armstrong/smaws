(** Inspector client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_failed_item_details :
  failure_code:failed_item_error_code -> retryable:bool_ -> unit -> failed_item_details

val make_add_attributes_to_findings_response :
  failed_items:failed_items -> unit -> add_attributes_to_findings_response

val make_attribute : ?value:attribute_value -> key:attribute_key -> unit -> attribute

val make_add_attributes_to_findings_request :
  finding_arns:add_remove_attributes_finding_arn_list ->
  attributes:user_attribute_list ->
  unit ->
  add_attributes_to_findings_request

val make_agent_already_running_assessment :
  agent_id:agent_id -> assessment_run_arn:arn -> unit -> agent_already_running_assessment

val make_agent_filter :
  agent_healths:agent_health_list ->
  agent_health_codes:agent_health_code_list ->
  unit ->
  agent_filter

val make_agent_preview :
  ?hostname:hostname ->
  ?auto_scaling_group:auto_scaling_group ->
  ?agent_health:agent_health ->
  ?agent_version:agent_version ->
  ?operating_system:operating_system ->
  ?kernel_version:kernel_version ->
  ?ipv4_address:ipv4_address ->
  agent_id:agent_id ->
  unit ->
  agent_preview

val make_assessment_run_notification :
  ?message:message ->
  ?sns_topic_arn:arn ->
  ?sns_publish_status_code:assessment_run_notification_sns_status_code ->
  date:timestamp ->
  event:inspector_event ->
  error:bool_ ->
  unit ->
  assessment_run_notification

val make_assessment_run_state_change :
  state_changed_at:timestamp -> state:assessment_run_state -> unit -> assessment_run_state_change

val make_assessment_run :
  ?started_at:timestamp ->
  ?completed_at:timestamp ->
  arn:arn ->
  name:assessment_run_name ->
  assessment_template_arn:arn ->
  state:assessment_run_state ->
  duration_in_seconds:assessment_run_duration ->
  rules_package_arns:assessment_rules_package_arn_list ->
  user_attributes_for_findings:user_attribute_list ->
  created_at:timestamp ->
  state_changed_at:timestamp ->
  data_collected:bool_ ->
  state_changes:assessment_run_state_change_list ->
  notifications:assessment_run_notification_list ->
  finding_counts:assessment_run_finding_counts ->
  unit ->
  assessment_run

val make_telemetry_metadata :
  ?data_size:long -> message_type:message_type -> count:long -> unit -> telemetry_metadata

val make_assessment_run_agent :
  ?agent_health_details:message ->
  ?auto_scaling_group:auto_scaling_group ->
  agent_id:agent_id ->
  assessment_run_arn:arn ->
  agent_health:agent_health ->
  agent_health_code:agent_health_code ->
  telemetry_metadata:telemetry_metadata_list ->
  unit ->
  assessment_run_agent

val make_timestamp_range : ?begin_date:timestamp -> ?end_date:timestamp -> unit -> timestamp_range

val make_duration_range :
  ?min_seconds:assessment_run_duration ->
  ?max_seconds:assessment_run_duration ->
  unit ->
  duration_range

val make_assessment_run_filter :
  ?name_pattern:name_pattern ->
  ?states:assessment_run_state_list ->
  ?duration_range:duration_range ->
  ?rules_package_arns:filter_rules_package_arn_list ->
  ?start_time_range:timestamp_range ->
  ?completion_time_range:timestamp_range ->
  ?state_change_time_range:timestamp_range ->
  unit ->
  assessment_run_filter

val make_assessment_target :
  ?resource_group_arn:arn ->
  arn:arn ->
  name:assessment_target_name ->
  created_at:timestamp ->
  updated_at:timestamp ->
  unit ->
  assessment_target

val make_assessment_target_filter :
  ?assessment_target_name_pattern:name_pattern -> unit -> assessment_target_filter

val make_assessment_template :
  ?last_assessment_run_arn:arn ->
  arn:arn ->
  name:assessment_template_name ->
  assessment_target_arn:arn ->
  duration_in_seconds:assessment_run_duration ->
  rules_package_arns:assessment_template_rules_package_arn_list ->
  user_attributes_for_findings:user_attribute_list ->
  assessment_run_count:arn_count ->
  created_at:timestamp ->
  unit ->
  assessment_template

val make_assessment_template_filter :
  ?name_pattern:name_pattern ->
  ?duration_range:duration_range ->
  ?rules_package_arns:filter_rules_package_arn_list ->
  unit ->
  assessment_template_filter

val make_security_group : ?group_name:text -> ?group_id:text -> unit -> security_group
val make_private_ip : ?private_dns_name:text -> ?private_ip_address:text -> unit -> private_ip

val make_network_interface :
  ?network_interface_id:text ->
  ?subnet_id:text ->
  ?vpc_id:text ->
  ?private_dns_name:text ->
  ?private_ip_address:text ->
  ?private_ip_addresses:private_ip_addresses ->
  ?public_dns_name:text ->
  ?public_ip:text ->
  ?ipv6_addresses:ipv6_addresses ->
  ?security_groups:security_groups ->
  unit ->
  network_interface

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_asset_attributes :
  ?agent_id:agent_id ->
  ?auto_scaling_group:auto_scaling_group ->
  ?ami_id:ami_id ->
  ?hostname:hostname ->
  ?ipv4_addresses:ipv4_address_list ->
  ?tags:tags ->
  ?network_interfaces:network_interfaces ->
  schema_version:numeric_version ->
  unit ->
  asset_attributes

val make_create_assessment_target_response :
  assessment_target_arn:arn -> unit -> create_assessment_target_response

val make_create_assessment_target_request :
  ?resource_group_arn:arn ->
  assessment_target_name:assessment_target_name ->
  unit ->
  create_assessment_target_request

val make_create_assessment_template_response :
  assessment_template_arn:arn -> unit -> create_assessment_template_response

val make_create_assessment_template_request :
  ?user_attributes_for_findings:user_attribute_list ->
  assessment_target_arn:arn ->
  assessment_template_name:assessment_template_name ->
  duration_in_seconds:assessment_run_duration ->
  rules_package_arns:assessment_template_rules_package_arn_list ->
  unit ->
  create_assessment_template_request

val make_create_exclusions_preview_response :
  preview_token:uui_d -> unit -> create_exclusions_preview_response

val make_create_exclusions_preview_request :
  assessment_template_arn:arn -> unit -> create_exclusions_preview_request

val make_create_resource_group_response :
  resource_group_arn:arn -> unit -> create_resource_group_response

val make_resource_group_tag : ?value:tag_value -> key:tag_key -> unit -> resource_group_tag

val make_create_resource_group_request :
  resource_group_tags:resource_group_tags -> unit -> create_resource_group_request

val make_delete_assessment_run_request :
  assessment_run_arn:arn -> unit -> delete_assessment_run_request

val make_delete_assessment_target_request :
  assessment_target_arn:arn -> unit -> delete_assessment_target_request

val make_delete_assessment_template_request :
  assessment_template_arn:arn -> unit -> delete_assessment_template_request

val make_describe_assessment_runs_response :
  assessment_runs:assessment_run_list ->
  failed_items:failed_items ->
  unit ->
  describe_assessment_runs_response

val make_describe_assessment_runs_request :
  assessment_run_arns:batch_describe_arn_list -> unit -> describe_assessment_runs_request

val make_describe_assessment_targets_response :
  assessment_targets:assessment_target_list ->
  failed_items:failed_items ->
  unit ->
  describe_assessment_targets_response

val make_describe_assessment_targets_request :
  assessment_target_arns:batch_describe_arn_list -> unit -> describe_assessment_targets_request

val make_describe_assessment_templates_response :
  assessment_templates:assessment_template_list ->
  failed_items:failed_items ->
  unit ->
  describe_assessment_templates_response

val make_describe_assessment_templates_request :
  assessment_template_arns:batch_describe_arn_list -> unit -> describe_assessment_templates_request

val make_describe_cross_account_access_role_response :
  role_arn:arn ->
  valid:bool_ ->
  registered_at:timestamp ->
  unit ->
  describe_cross_account_access_role_response

val make_scope : ?key:scope_type -> ?value:scope_value -> unit -> scope

val make_exclusion :
  ?attributes:attribute_list ->
  arn:arn ->
  title:text ->
  description:text ->
  recommendation:text ->
  scopes:scope_list ->
  unit ->
  exclusion

val make_describe_exclusions_response :
  exclusions:exclusion_map -> failed_items:failed_items -> unit -> describe_exclusions_response

val make_describe_exclusions_request :
  ?locale:locale ->
  exclusion_arns:batch_describe_exclusions_arn_list ->
  unit ->
  describe_exclusions_request

val make_inspector_service_attributes :
  ?assessment_run_arn:arn ->
  ?rules_package_arn:arn ->
  schema_version:numeric_version ->
  unit ->
  inspector_service_attributes

val make_finding :
  ?schema_version:numeric_version ->
  ?service:service_name ->
  ?service_attributes:inspector_service_attributes ->
  ?asset_type:asset_type ->
  ?asset_attributes:asset_attributes ->
  ?id:finding_id ->
  ?title:text ->
  ?description:text ->
  ?recommendation:text ->
  ?severity:severity ->
  ?numeric_severity:numeric_severity ->
  ?confidence:ioc_confidence ->
  ?indicator_of_compromise:bool_ ->
  arn:arn ->
  attributes:attribute_list ->
  user_attributes:user_attribute_list ->
  created_at:timestamp ->
  updated_at:timestamp ->
  unit ->
  finding

val make_describe_findings_response :
  findings:finding_list -> failed_items:failed_items -> unit -> describe_findings_response

val make_describe_findings_request :
  ?locale:locale -> finding_arns:batch_describe_arn_list -> unit -> describe_findings_request

val make_resource_group :
  arn:arn -> tags:resource_group_tags -> created_at:timestamp -> unit -> resource_group

val make_describe_resource_groups_response :
  resource_groups:resource_group_list ->
  failed_items:failed_items ->
  unit ->
  describe_resource_groups_response

val make_describe_resource_groups_request :
  resource_group_arns:batch_describe_arn_list -> unit -> describe_resource_groups_request

val make_rules_package :
  ?description:text ->
  arn:arn ->
  name:rules_package_name ->
  version:version ->
  provider:provider_name ->
  unit ->
  rules_package

val make_describe_rules_packages_response :
  rules_packages:rules_package_list ->
  failed_items:failed_items ->
  unit ->
  describe_rules_packages_response

val make_describe_rules_packages_request :
  ?locale:locale ->
  rules_package_arns:batch_describe_arn_list ->
  unit ->
  describe_rules_packages_request

val make_event_subscription :
  event:inspector_event -> subscribed_at:timestamp -> unit -> event_subscription

val make_exclusion_preview :
  ?attributes:attribute_list ->
  title:text ->
  description:text ->
  recommendation:text ->
  scopes:scope_list ->
  unit ->
  exclusion_preview

val make_finding_filter :
  ?agent_ids:agent_id_list ->
  ?auto_scaling_groups:auto_scaling_group_list ->
  ?rule_names:rule_name_list ->
  ?severities:severity_list ->
  ?rules_package_arns:filter_rules_package_arn_list ->
  ?attributes:attribute_list ->
  ?user_attributes:attribute_list ->
  ?creation_time_range:timestamp_range ->
  unit ->
  finding_filter

val make_get_assessment_report_response :
  ?url:url -> status:report_status -> unit -> get_assessment_report_response

val make_get_assessment_report_request :
  assessment_run_arn:arn ->
  report_file_format:report_file_format ->
  report_type:report_type ->
  unit ->
  get_assessment_report_request

val make_get_exclusions_preview_response :
  ?exclusion_previews:exclusion_preview_list ->
  ?next_token:pagination_token ->
  preview_status:preview_status ->
  unit ->
  get_exclusions_preview_response

val make_get_exclusions_preview_request :
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  ?locale:locale ->
  assessment_template_arn:arn ->
  preview_token:uui_d ->
  unit ->
  get_exclusions_preview_request

val make_get_telemetry_metadata_response :
  telemetry_metadata:telemetry_metadata_list -> unit -> get_telemetry_metadata_response

val make_get_telemetry_metadata_request :
  assessment_run_arn:arn -> unit -> get_telemetry_metadata_request

val make_update_assessment_target_request :
  ?resource_group_arn:arn ->
  assessment_target_arn:arn ->
  assessment_target_name:assessment_target_name ->
  unit ->
  update_assessment_target_request

val make_unsubscribe_from_event_request :
  resource_arn:arn ->
  event:inspector_event ->
  topic_arn:arn ->
  unit ->
  unsubscribe_from_event_request

val make_subscribe_to_event_request :
  resource_arn:arn -> event:inspector_event -> topic_arn:arn -> unit -> subscribe_to_event_request

val make_stop_assessment_run_request :
  ?stop_action:stop_action -> assessment_run_arn:arn -> unit -> stop_assessment_run_request

val make_start_assessment_run_response :
  assessment_run_arn:arn -> unit -> start_assessment_run_response

val make_start_assessment_run_request :
  ?assessment_run_name:assessment_run_name ->
  assessment_template_arn:arn ->
  unit ->
  start_assessment_run_request

val make_set_tags_for_resource_request :
  ?tags:tag_list -> resource_arn:arn -> unit -> set_tags_for_resource_request

val make_remove_attributes_from_findings_response :
  failed_items:failed_items -> unit -> remove_attributes_from_findings_response

val make_remove_attributes_from_findings_request :
  finding_arns:add_remove_attributes_finding_arn_list ->
  attribute_keys:user_attribute_key_list ->
  unit ->
  remove_attributes_from_findings_request

val make_register_cross_account_access_role_request :
  role_arn:arn -> unit -> register_cross_account_access_role_request

val make_preview_agents_response :
  ?next_token:pagination_token ->
  agent_previews:agent_preview_list ->
  unit ->
  preview_agents_response

val make_preview_agents_request :
  ?next_token:pagination_token ->
  ?max_results:preview_agents_max_results ->
  preview_agents_arn:arn ->
  unit ->
  preview_agents_request

val make_list_tags_for_resource_response : tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_rules_packages_response :
  ?next_token:pagination_token ->
  rules_package_arns:list_returned_arn_list ->
  unit ->
  list_rules_packages_response

val make_list_rules_packages_request :
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  unit ->
  list_rules_packages_request

val make_list_findings_response :
  ?next_token:pagination_token ->
  finding_arns:list_returned_arn_list ->
  unit ->
  list_findings_response

val make_list_findings_request :
  ?assessment_run_arns:list_parent_arn_list ->
  ?filter:finding_filter ->
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  unit ->
  list_findings_request

val make_list_exclusions_response :
  ?next_token:pagination_token ->
  exclusion_arns:list_returned_arn_list ->
  unit ->
  list_exclusions_response

val make_list_exclusions_request :
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  assessment_run_arn:arn ->
  unit ->
  list_exclusions_request

val make_subscription :
  resource_arn:arn ->
  topic_arn:arn ->
  event_subscriptions:event_subscription_list ->
  unit ->
  subscription

val make_list_event_subscriptions_response :
  ?next_token:pagination_token ->
  subscriptions:subscription_list ->
  unit ->
  list_event_subscriptions_response

val make_list_event_subscriptions_request :
  ?resource_arn:arn ->
  ?next_token:pagination_token ->
  ?max_results:list_event_subscriptions_max_results ->
  unit ->
  list_event_subscriptions_request

val make_list_assessment_templates_response :
  ?next_token:pagination_token ->
  assessment_template_arns:list_returned_arn_list ->
  unit ->
  list_assessment_templates_response

val make_list_assessment_templates_request :
  ?assessment_target_arns:list_parent_arn_list ->
  ?filter:assessment_template_filter ->
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  unit ->
  list_assessment_templates_request

val make_list_assessment_targets_response :
  ?next_token:pagination_token ->
  assessment_target_arns:list_returned_arn_list ->
  unit ->
  list_assessment_targets_response

val make_list_assessment_targets_request :
  ?filter:assessment_target_filter ->
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  unit ->
  list_assessment_targets_request

val make_list_assessment_runs_response :
  ?next_token:pagination_token ->
  assessment_run_arns:list_returned_arn_list ->
  unit ->
  list_assessment_runs_response

val make_list_assessment_runs_request :
  ?assessment_template_arns:list_parent_arn_list ->
  ?filter:assessment_run_filter ->
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  unit ->
  list_assessment_runs_request

val make_list_assessment_run_agents_response :
  ?next_token:pagination_token ->
  assessment_run_agents:assessment_run_agent_list ->
  unit ->
  list_assessment_run_agents_response

val make_list_assessment_run_agents_request :
  ?filter:agent_filter ->
  ?next_token:pagination_token ->
  ?max_results:list_max_results ->
  assessment_run_arn:arn ->
  unit ->
  list_assessment_run_agents_request
(** {1:operations Operations} *)

module ListAssessmentRunAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_run_agents_request ->
    ( list_assessment_run_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_run_agents_request ->
    ( list_assessment_run_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the agents of the assessment runs that are specified by the ARNs of the assessment runs.\n"]

module ListAssessmentRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_runs_request ->
    ( list_assessment_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_runs_request ->
    ( list_assessment_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the assessment runs that correspond to the assessment templates that are specified by the \
   ARNs of the assessment templates.\n"]

module ListAssessmentTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_targets_request ->
    ( list_assessment_targets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_targets_request ->
    ( list_assessment_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the ARNs of the assessment targets within this AWS account. For more information about \
   assessment targets, see \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html}Amazon \
   Inspector Assessment Targets}.\n"]

module ListAssessmentTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_templates_request ->
    ( list_assessment_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_templates_request ->
    ( list_assessment_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the assessment templates that correspond to the assessment targets that are specified by \
   the ARNs of the assessment targets.\n"]

module ListEventSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_event_subscriptions_request ->
    ( list_event_subscriptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_event_subscriptions_request ->
    ( list_event_subscriptions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the event subscriptions for the assessment template that is specified by the ARN of \
   the assessment template. For more information, see [SubscribeToEvent] and \
   [UnsubscribeFromEvent].\n"]

module ListExclusions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_exclusions_request ->
    ( list_exclusions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_exclusions_request ->
    ( list_exclusions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List exclusions that are generated by the assessment run.\n"]

module ListFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_findings_request ->
    ( list_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_findings_request ->
    ( list_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists findings that are generated by the assessment runs that are specified by the ARNs of the \
   assessment runs.\n"]

module ListRulesPackages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rules_packages_request ->
    ( list_rules_packages_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rules_packages_request ->
    ( list_rules_packages_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all available Amazon Inspector rules packages.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags associated with an assessment template.\n"]

module PreviewAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    preview_agents_request ->
    ( preview_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    preview_agents_request ->
    ( preview_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Previews the agents installed on the EC2 instances that are part of the specified assessment \
   target.\n"]

module RegisterCrossAccountAccessRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_cross_account_access_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_cross_account_access_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers the IAM role that grants Amazon Inspector access to AWS Services needed to perform \
   security assessments.\n"]

module RemoveAttributesFromFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_attributes_from_findings_request ->
    ( remove_attributes_from_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_attributes_from_findings_request ->
    ( remove_attributes_from_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes entire attributes (key and value pairs) from the findings that are specified by the \
   ARNs of the findings where an attribute with the specified key exists.\n"]

module SetTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_tags_for_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_tags_for_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets tags (key and value pairs) to the assessment template that is specified by the ARN of the \
   assessment template.\n"]

module StartAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AgentsAlreadyRunningAssessmentException of agents_already_running_assessment_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_assessment_run_request ->
    ( start_assessment_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AgentsAlreadyRunningAssessmentException of agents_already_running_assessment_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_assessment_run_request ->
    ( start_assessment_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AgentsAlreadyRunningAssessmentException of agents_already_running_assessment_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the assessment run specified by the ARN of the assessment template. For this API to \
   function properly, you must not exceed the limit of running up to 500 concurrent agents per AWS \
   account.\n"]

module StopAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the assessment run that is specified by the ARN of the assessment run.\n"]

module SubscribeToEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    subscribe_to_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    subscribe_to_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the process of sending Amazon Simple Notification Service (SNS) notifications about a \
   specified event to a specified SNS topic.\n"]

module UnsubscribeFromEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    unsubscribe_from_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    unsubscribe_from_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the process of sending Amazon Simple Notification Service (SNS) notifications about a \
   specified event to a specified SNS topic.\n"]

module UpdateAssessmentTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the assessment target that is specified by the ARN of the assessment target.\n\n\
  \ If resourceGroupArn is not specified, all EC2 instances in the current AWS account and region \
   are included in the assessment target.\n\
  \ "]

module GetTelemetryMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_telemetry_metadata_request ->
    ( get_telemetry_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_telemetry_metadata_request ->
    ( get_telemetry_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Information about the data that is collected for the specified assessment run.\n"]

module GetExclusionsPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_exclusions_preview_request ->
    ( get_exclusions_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_exclusions_preview_request ->
    ( get_exclusions_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the exclusions preview (a list of ExclusionPreview objects) specified by the preview \
   token. You can obtain the preview token by running the CreateExclusionsPreview API.\n"]

module GetAssessmentReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_assessment_report_request ->
    ( get_assessment_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_assessment_report_request ->
    ( get_assessment_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Produces an assessment report that includes detailed and comprehensive results of a specified \
   assessment run. \n"]

module DescribeRulesPackages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_packages_request ->
    ( describe_rules_packages_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_packages_request ->
    ( describe_rules_packages_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the rules packages that are specified by the ARNs of the rules packages.\n"]

module DescribeResourceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_groups_request ->
    ( describe_resource_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_groups_request ->
    ( describe_resource_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the resource groups that are specified by the ARNs of the resource groups.\n"]

module DescribeFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_findings_request ->
    ( describe_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_findings_request ->
    ( describe_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the findings that are specified by the ARNs of the findings.\n"]

module DescribeExclusions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_exclusions_request ->
    ( describe_exclusions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_exclusions_request ->
    ( describe_exclusions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the exclusions that are specified by the exclusions' ARNs.\n"]

module DescribeCrossAccountAccessRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_cross_account_access_role_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_cross_account_access_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the IAM role that enables Amazon Inspector to access your AWS account.\n"]

module DescribeAssessmentTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_templates_request ->
    ( describe_assessment_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_templates_request ->
    ( describe_assessment_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the assessment templates that are specified by the ARNs of the assessment templates.\n"]

module DescribeAssessmentTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_targets_request ->
    ( describe_assessment_targets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_targets_request ->
    ( describe_assessment_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the assessment targets that are specified by the ARNs of the assessment targets.\n"]

module DescribeAssessmentRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_runs_request ->
    ( describe_assessment_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_runs_request ->
    ( describe_assessment_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the assessment runs that are specified by the ARNs of the assessment runs.\n"]

module DeleteAssessmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the assessment template that is specified by the ARN of the assessment template.\n"]

module DeleteAssessmentTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the assessment target that is specified by the ARN of the assessment target.\n"]

module DeleteAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the assessment run that is specified by the ARN of the assessment run.\n"]

module CreateResourceGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resource_group_request ->
    ( create_resource_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resource_group_request ->
    ( create_resource_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a resource group using the specified set of tags (key and value pairs) that are used to \
   select the EC2 instances to be included in an Amazon Inspector assessment target. The created \
   resource group is then used to create an Amazon Inspector assessment target. For more \
   information, see [CreateAssessmentTarget].\n"]

module CreateExclusionsPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PreviewGenerationInProgressException of preview_generation_in_progress_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_exclusions_preview_request ->
    ( create_exclusions_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PreviewGenerationInProgressException of preview_generation_in_progress_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_exclusions_preview_request ->
    ( create_exclusions_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PreviewGenerationInProgressException of preview_generation_in_progress_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the generation of an exclusions preview for the specified assessment template. The \
   exclusions preview lists the potential exclusions (ExclusionPreview) that Inspector can detect \
   before it runs the assessment. \n"]

module CreateAssessmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_template_request ->
    ( create_assessment_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_template_request ->
    ( create_assessment_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an assessment template for the assessment target that is specified by the ARN of the \
   assessment target. If the \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html}service-linked \
   role} isn\226\128\153t already registered, this action also creates and registers a \
   service-linked role to grant Amazon Inspector access to AWS Services needed to perform security \
   assessments.\n"]

module CreateAssessmentTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_target_request ->
    ( create_assessment_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_target_request ->
    ( create_assessment_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new assessment target using the ARN of the resource group that is generated by \
   [CreateResourceGroup]. If resourceGroupArn is not specified, all EC2 instances in the current \
   AWS account and region are included in the assessment target. If the \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html}service-linked \
   role} isn\226\128\153t already registered, this action also creates and registers a \
   service-linked role to grant Amazon Inspector access to AWS Services needed to perform security \
   assessments. You can create up to 50 assessment targets per AWS account. You can run up to 500 \
   concurrent agents per AWS account. For more information, see \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html} Amazon \
   Inspector Assessment Targets}.\n"]

(** {1:Serialization and Deserialization} *)
module AddAttributesToFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_attributes_to_findings_request ->
    ( add_attributes_to_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_attributes_to_findings_request ->
    ( add_attributes_to_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns attributes (key and value pairs) to the findings that are specified by the ARNs of the \
   findings.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
