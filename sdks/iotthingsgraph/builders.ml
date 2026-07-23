open Types

let make_associate_entity_to_thing_response () = (() : unit)

let make_associate_entity_to_thing_request ?namespace_version:(namespace_version_ : version option)
    ~thing_name:(thing_name_ : thing_name) ~entity_id:(entity_id_ : urn) () =
  ({ thing_name = thing_name_; entity_id = entity_id_; namespace_version = namespace_version_ }
    : associate_entity_to_thing_request)

let make_flow_template_summary ?id:(id_ : urn option) ?arn:(arn_ : arn option)
    ?revision_number:(revision_number_ : version option)
    ?created_at:(created_at_ : timestamp option) () =
  ({ id = id_; arn = arn_; revision_number = revision_number_; created_at = created_at_ }
    : flow_template_summary)

let make_create_flow_template_response ?summary:(summary_ : flow_template_summary option) () =
  ({ summary = summary_ } : create_flow_template_response)

let make_definition_document ~language:(language_ : definition_language)
    ~text:(text_ : definition_text) () =
  ({ language = language_; text = text_ } : definition_document)

let make_create_flow_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option)
    ~definition:(definition_ : definition_document) () =
  ({ definition = definition_; compatible_namespace_version = compatible_namespace_version_ }
    : create_flow_template_request)

let make_system_instance_summary ?id:(id_ : urn option) ?arn:(arn_ : arn option)
    ?status:(status_ : system_instance_deployment_status option)
    ?target:(target_ : deployment_target option)
    ?greengrass_group_name:(greengrass_group_name_ : group_name option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?greengrass_group_id:(greengrass_group_id_ : greengrass_group_id option)
    ?greengrass_group_version_id:(greengrass_group_version_id_ : greengrass_group_version_id option)
    () =
  ({
     id = id_;
     arn = arn_;
     status = status_;
     target = target_;
     greengrass_group_name = greengrass_group_name_;
     created_at = created_at_;
     updated_at = updated_at_;
     greengrass_group_id = greengrass_group_id_;
     greengrass_group_version_id = greengrass_group_version_id_;
   }
    : system_instance_summary)

let make_create_system_instance_response ?summary:(summary_ : system_instance_summary option) () =
  ({ summary = summary_ } : create_system_instance_response)

let make_metrics_configuration ?cloud_metric_enabled:(cloud_metric_enabled_ : enabled option)
    ?metric_rule_role_arn:(metric_rule_role_arn_ : role_arn option) () =
  ({ cloud_metric_enabled = cloud_metric_enabled_; metric_rule_role_arn = metric_rule_role_arn_ }
    : metrics_configuration)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_system_instance_request ?tags:(tags_ : tag_list option)
    ?greengrass_group_name:(greengrass_group_name_ : group_name option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?metrics_configuration:(metrics_configuration_ : metrics_configuration option)
    ?flow_actions_role_arn:(flow_actions_role_arn_ : role_arn option)
    ~definition:(definition_ : definition_document) ~target:(target_ : deployment_target) () =
  ({
     tags = tags_;
     definition = definition_;
     target = target_;
     greengrass_group_name = greengrass_group_name_;
     s3_bucket_name = s3_bucket_name_;
     metrics_configuration = metrics_configuration_;
     flow_actions_role_arn = flow_actions_role_arn_;
   }
    : create_system_instance_request)

let make_system_template_summary ?id:(id_ : urn option) ?arn:(arn_ : arn option)
    ?revision_number:(revision_number_ : version option)
    ?created_at:(created_at_ : timestamp option) () =
  ({ id = id_; arn = arn_; revision_number = revision_number_; created_at = created_at_ }
    : system_template_summary)

let make_create_system_template_response ?summary:(summary_ : system_template_summary option) () =
  ({ summary = summary_ } : create_system_template_response)

let make_create_system_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option)
    ~definition:(definition_ : definition_document) () =
  ({ definition = definition_; compatible_namespace_version = compatible_namespace_version_ }
    : create_system_template_request)

let make_delete_flow_template_response () = (() : unit)

let make_delete_flow_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : delete_flow_template_request)

let make_delete_namespace_response ?namespace_arn:(namespace_arn_ : arn option)
    ?namespace_name:(namespace_name_ : namespace_name option) () =
  ({ namespace_arn = namespace_arn_; namespace_name = namespace_name_ } : delete_namespace_response)

let make_delete_namespace_request () = (() : unit)
let make_delete_system_instance_response () = (() : unit)

let make_delete_system_instance_request ?id:(id_ : urn option) () =
  ({ id = id_ } : delete_system_instance_request)

let make_delete_system_template_response () = (() : unit)

let make_delete_system_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : delete_system_template_request)

let make_dependency_revision ?id:(id_ : urn option)
    ?revision_number:(revision_number_ : version option) () =
  ({ id = id_; revision_number = revision_number_ } : dependency_revision)

let make_deploy_system_instance_response
    ?greengrass_deployment_id:(greengrass_deployment_id_ : greengrass_deployment_id option)
    ~summary:(summary_ : system_instance_summary) () =
  ({ summary = summary_; greengrass_deployment_id = greengrass_deployment_id_ }
    : deploy_system_instance_response)

let make_deploy_system_instance_request ?id:(id_ : urn option) () =
  ({ id = id_ } : deploy_system_instance_request)

let make_deprecate_flow_template_response () = (() : unit)

let make_deprecate_flow_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : deprecate_flow_template_request)

let make_deprecate_system_template_response () = (() : unit)

let make_deprecate_system_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : deprecate_system_template_request)

let make_describe_namespace_response ?namespace_arn:(namespace_arn_ : arn option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?tracking_namespace_name:(tracking_namespace_name_ : namespace_name option)
    ?tracking_namespace_version:(tracking_namespace_version_ : version option)
    ?namespace_version:(namespace_version_ : version option) () =
  ({
     namespace_arn = namespace_arn_;
     namespace_name = namespace_name_;
     tracking_namespace_name = tracking_namespace_name_;
     tracking_namespace_version = tracking_namespace_version_;
     namespace_version = namespace_version_;
   }
    : describe_namespace_response)

let make_describe_namespace_request ?namespace_name:(namespace_name_ : namespace_name option) () =
  ({ namespace_name = namespace_name_ } : describe_namespace_request)

let make_dissociate_entity_from_thing_response () = (() : unit)

let make_dissociate_entity_from_thing_request ~thing_name:(thing_name_ : thing_name)
    ~entity_type:(entity_type_ : entity_type) () =
  ({ thing_name = thing_name_; entity_type = entity_type_ } : dissociate_entity_from_thing_request)

let make_entity_description ?id:(id_ : urn option) ?arn:(arn_ : arn option)
    ?type_:(type__ : entity_type option) ?created_at:(created_at_ : timestamp option)
    ?definition:(definition_ : definition_document option) () =
  ({ id = id_; arn = arn_; type_ = type__; created_at = created_at_; definition = definition_ }
    : entity_description)

let make_entity_filter ?name:(name_ : entity_filter_name option)
    ?value:(value_ : entity_filter_values option) () =
  ({ name = name_; value = value_ } : entity_filter)

let make_flow_execution_message ?message_id:(message_id_ : flow_execution_message_id option)
    ?event_type:(event_type_ : flow_execution_event_type option)
    ?timestamp:(timestamp_ : timestamp option)
    ?payload:(payload_ : flow_execution_message_payload option) () =
  ({
     message_id = message_id_;
     event_type = event_type_;
     timestamp = timestamp_;
     payload = payload_;
   }
    : flow_execution_message)

let make_flow_execution_summary ?flow_execution_id:(flow_execution_id_ : flow_execution_id option)
    ?status:(status_ : flow_execution_status option)
    ?system_instance_id:(system_instance_id_ : urn option)
    ?flow_template_id:(flow_template_id_ : urn option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({
     flow_execution_id = flow_execution_id_;
     status = status_;
     system_instance_id = system_instance_id_;
     flow_template_id = flow_template_id_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : flow_execution_summary)

let make_flow_template_description ?summary:(summary_ : flow_template_summary option)
    ?definition:(definition_ : definition_document option)
    ?validated_namespace_version:(validated_namespace_version_ : version option) () =
  ({
     summary = summary_;
     definition = definition_;
     validated_namespace_version = validated_namespace_version_;
   }
    : flow_template_description)

let make_flow_template_filter ~name:(name_ : flow_template_filter_name)
    ~value:(value_ : flow_template_filter_values) () =
  ({ name = name_; value = value_ } : flow_template_filter)

let make_get_entities_response ?descriptions:(descriptions_ : entity_descriptions option) () =
  ({ descriptions = descriptions_ } : get_entities_response)

let make_get_entities_request ?namespace_version:(namespace_version_ : version option)
    ~ids:(ids_ : urns) () =
  ({ ids = ids_; namespace_version = namespace_version_ } : get_entities_request)

let make_get_flow_template_response ?description:(description_ : flow_template_description option)
    () =
  ({ description = description_ } : get_flow_template_response)

let make_get_flow_template_request ?revision_number:(revision_number_ : version option)
    ~id:(id_ : urn) () =
  ({ id = id_; revision_number = revision_number_ } : get_flow_template_request)

let make_get_flow_template_revisions_response
    ?summaries:(summaries_ : flow_template_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : get_flow_template_revisions_response)

let make_get_flow_template_revisions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~id:(id_ : urn) () =
  ({ id = id_; next_token = next_token_; max_results = max_results_ }
    : get_flow_template_revisions_request)

let make_get_namespace_deletion_status_response ?namespace_arn:(namespace_arn_ : arn option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?status:(status_ : namespace_deletion_status option)
    ?error_code:(error_code_ : namespace_deletion_status_error_codes option)
    ?error_message:(error_message_ : string_ option) () =
  ({
     namespace_arn = namespace_arn_;
     namespace_name = namespace_name_;
     status = status_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : get_namespace_deletion_status_response)

let make_get_namespace_deletion_status_request () = (() : unit)

let make_system_instance_description ?summary:(summary_ : system_instance_summary option)
    ?definition:(definition_ : definition_document option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?metrics_configuration:(metrics_configuration_ : metrics_configuration option)
    ?validated_namespace_version:(validated_namespace_version_ : version option)
    ?validated_dependency_revisions:(validated_dependency_revisions_ : dependency_revisions option)
    ?flow_actions_role_arn:(flow_actions_role_arn_ : role_arn option) () =
  ({
     summary = summary_;
     definition = definition_;
     s3_bucket_name = s3_bucket_name_;
     metrics_configuration = metrics_configuration_;
     validated_namespace_version = validated_namespace_version_;
     validated_dependency_revisions = validated_dependency_revisions_;
     flow_actions_role_arn = flow_actions_role_arn_;
   }
    : system_instance_description)

let make_get_system_instance_response
    ?description:(description_ : system_instance_description option) () =
  ({ description = description_ } : get_system_instance_response)

let make_get_system_instance_request ~id:(id_ : urn) () =
  ({ id = id_ } : get_system_instance_request)

let make_system_template_description ?summary:(summary_ : system_template_summary option)
    ?definition:(definition_ : definition_document option)
    ?validated_namespace_version:(validated_namespace_version_ : version option) () =
  ({
     summary = summary_;
     definition = definition_;
     validated_namespace_version = validated_namespace_version_;
   }
    : system_template_description)

let make_get_system_template_response
    ?description:(description_ : system_template_description option) () =
  ({ description = description_ } : get_system_template_response)

let make_get_system_template_request ?revision_number:(revision_number_ : version option)
    ~id:(id_ : urn) () =
  ({ id = id_; revision_number = revision_number_ } : get_system_template_request)

let make_get_system_template_revisions_response
    ?summaries:(summaries_ : system_template_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : get_system_template_revisions_response)

let make_get_system_template_revisions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~id:(id_ : urn) () =
  ({ id = id_; next_token = next_token_; max_results = max_results_ }
    : get_system_template_revisions_request)

let make_get_upload_status_response ?namespace_arn:(namespace_arn_ : arn option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?namespace_version:(namespace_version_ : version option)
    ?failure_reason:(failure_reason_ : string_list option) ~upload_id:(upload_id_ : upload_id)
    ~upload_status:(upload_status_ : upload_status) ~created_date:(created_date_ : timestamp) () =
  ({
     upload_id = upload_id_;
     upload_status = upload_status_;
     namespace_arn = namespace_arn_;
     namespace_name = namespace_name_;
     namespace_version = namespace_version_;
     failure_reason = failure_reason_;
     created_date = created_date_;
   }
    : get_upload_status_response)

let make_get_upload_status_request ~upload_id:(upload_id_ : upload_id) () =
  ({ upload_id = upload_id_ } : get_upload_status_request)

let make_upload_entity_definitions_response ~upload_id:(upload_id_ : upload_id) () =
  ({ upload_id = upload_id_ } : upload_entity_definitions_response)

let make_upload_entity_definitions_request ?document:(document_ : definition_document option)
    ?sync_with_public_namespace:(sync_with_public_namespace_ : sync_with_public_namespace option)
    ?deprecate_existing_entities:(deprecate_existing_entities_ : deprecate_existing_entities option)
    () =
  ({
     document = document_;
     sync_with_public_namespace = sync_with_public_namespace_;
     deprecate_existing_entities = deprecate_existing_entities_;
   }
    : upload_entity_definitions_request)

let make_update_system_template_response ?summary:(summary_ : system_template_summary option) () =
  ({ summary = summary_ } : update_system_template_response)

let make_update_system_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option) ~id:(id_ : urn)
    ~definition:(definition_ : definition_document) () =
  ({
     id = id_;
     definition = definition_;
     compatible_namespace_version = compatible_namespace_version_;
   }
    : update_system_template_request)

let make_update_flow_template_response ?summary:(summary_ : flow_template_summary option) () =
  ({ summary = summary_ } : update_flow_template_response)

let make_update_flow_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option) ~id:(id_ : urn)
    ~definition:(definition_ : definition_document) () =
  ({
     id = id_;
     definition = definition_;
     compatible_namespace_version = compatible_namespace_version_;
   }
    : update_flow_template_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_undeploy_system_instance_response ?summary:(summary_ : system_instance_summary option) () =
  ({ summary = summary_ } : undeploy_system_instance_response)

let make_undeploy_system_instance_request ?id:(id_ : urn option) () =
  ({ id = id_ } : undeploy_system_instance_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tag_list)
    () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_thing ?thing_arn:(thing_arn_ : thing_arn option)
    ?thing_name:(thing_name_ : thing_name option) () =
  ({ thing_arn = thing_arn_; thing_name = thing_name_ } : thing)

let make_search_things_response ?things:(things_ : things option)
    ?next_token:(next_token_ : next_token option) () =
  ({ things = things_; next_token = next_token_ } : search_things_response)

let make_search_things_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?namespace_version:(namespace_version_ : version option) ~entity_id:(entity_id_ : urn) () =
  ({
     entity_id = entity_id_;
     next_token = next_token_;
     max_results = max_results_;
     namespace_version = namespace_version_;
   }
    : search_things_request)

let make_search_system_templates_response ?summaries:(summaries_ : system_template_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : search_system_templates_response)

let make_system_template_filter ~name:(name_ : system_template_filter_name)
    ~value:(value_ : system_template_filter_values) () =
  ({ name = name_; value = value_ } : system_template_filter)

let make_search_system_templates_request ?filters:(filters_ : system_template_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : search_system_templates_request)

let make_search_system_instances_response ?summaries:(summaries_ : system_instance_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : search_system_instances_response)

let make_system_instance_filter ?name:(name_ : system_instance_filter_name option)
    ?value:(value_ : system_instance_filter_values option) () =
  ({ name = name_; value = value_ } : system_instance_filter)

let make_search_system_instances_request ?filters:(filters_ : system_instance_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : search_system_instances_request)

let make_search_flow_templates_response ?summaries:(summaries_ : flow_template_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : search_flow_templates_response)

let make_search_flow_templates_request ?filters:(filters_ : flow_template_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : search_flow_templates_request)

let make_search_flow_executions_response ?summaries:(summaries_ : flow_execution_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : search_flow_executions_response)

let make_search_flow_executions_request
    ?flow_execution_id:(flow_execution_id_ : flow_execution_id option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~system_instance_id:(system_instance_id_ : urn) () =
  ({
     system_instance_id = system_instance_id_;
     flow_execution_id = flow_execution_id_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : search_flow_executions_request)

let make_search_entities_response ?descriptions:(descriptions_ : entity_descriptions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ descriptions = descriptions_; next_token = next_token_ } : search_entities_response)

let make_search_entities_request ?filters:(filters_ : entity_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?namespace_version:(namespace_version_ : version option)
    ~entity_types:(entity_types_ : entity_types) () =
  ({
     entity_types = entity_types_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     namespace_version = namespace_version_;
   }
    : search_entities_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ max_results = max_results_; resource_arn = resource_arn_; next_token = next_token_ }
    : list_tags_for_resource_request)

let make_list_flow_execution_messages_response
    ?messages:(messages_ : flow_execution_messages option)
    ?next_token:(next_token_ : next_token option) () =
  ({ messages = messages_; next_token = next_token_ } : list_flow_execution_messages_response)

let make_list_flow_execution_messages_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~flow_execution_id:(flow_execution_id_ : flow_execution_id) () =
  ({ flow_execution_id = flow_execution_id_; next_token = next_token_; max_results = max_results_ }
    : list_flow_execution_messages_request)
