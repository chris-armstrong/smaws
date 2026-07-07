open Types

let make_upload_entity_definitions_response ~upload_id:(upload_id_ : upload_id) () =
  ({ upload_id = upload_id_ } : upload_entity_definitions_response)

let make_definition_document ~text:(text_ : definition_text)
    ~language:(language_ : definition_language) () =
  ({ text = text_; language = language_ } : definition_document)

let make_upload_entity_definitions_request
    ?deprecate_existing_entities:(deprecate_existing_entities_ : deprecate_existing_entities option)
    ?sync_with_public_namespace:(sync_with_public_namespace_ : sync_with_public_namespace option)
    ?document:(document_ : definition_document option) () =
  ({
     deprecate_existing_entities = deprecate_existing_entities_;
     sync_with_public_namespace = sync_with_public_namespace_;
     document = document_;
   }
    : upload_entity_definitions_request)

let make_system_template_summary ?created_at:(created_at_ : timestamp option)
    ?revision_number:(revision_number_ : version option) ?arn:(arn_ : arn option)
    ?id:(id_ : urn option) () =
  ({ created_at = created_at_; revision_number = revision_number_; arn = arn_; id = id_ }
    : system_template_summary)

let make_update_system_template_response ?summary:(summary_ : system_template_summary option) () =
  ({ summary = summary_ } : update_system_template_response)

let make_update_system_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option)
    ~definition:(definition_ : definition_document) ~id:(id_ : urn) () =
  ({
     compatible_namespace_version = compatible_namespace_version_;
     definition = definition_;
     id = id_;
   }
    : update_system_template_request)

let make_flow_template_summary ?created_at:(created_at_ : timestamp option)
    ?revision_number:(revision_number_ : version option) ?arn:(arn_ : arn option)
    ?id:(id_ : urn option) () =
  ({ created_at = created_at_; revision_number = revision_number_; arn = arn_; id = id_ }
    : flow_template_summary)

let make_update_flow_template_response ?summary:(summary_ : flow_template_summary option) () =
  ({ summary = summary_ } : update_flow_template_response)

let make_update_flow_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option)
    ~definition:(definition_ : definition_document) ~id:(id_ : urn) () =
  ({
     compatible_namespace_version = compatible_namespace_version_;
     definition = definition_;
     id = id_;
   }
    : update_flow_template_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_system_instance_summary
    ?greengrass_group_version_id:(greengrass_group_version_id_ : greengrass_group_version_id option)
    ?greengrass_group_id:(greengrass_group_id_ : greengrass_group_id option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?greengrass_group_name:(greengrass_group_name_ : group_name option)
    ?target:(target_ : deployment_target option)
    ?status:(status_ : system_instance_deployment_status option) ?arn:(arn_ : arn option)
    ?id:(id_ : urn option) () =
  ({
     greengrass_group_version_id = greengrass_group_version_id_;
     greengrass_group_id = greengrass_group_id_;
     updated_at = updated_at_;
     created_at = created_at_;
     greengrass_group_name = greengrass_group_name_;
     target = target_;
     status = status_;
     arn = arn_;
     id = id_;
   }
    : system_instance_summary)

let make_undeploy_system_instance_response ?summary:(summary_ : system_instance_summary option) () =
  ({ summary = summary_ } : undeploy_system_instance_response)

let make_undeploy_system_instance_request ?id:(id_ : urn option) () =
  ({ id = id_ } : undeploy_system_instance_request)

let make_thing ?thing_name:(thing_name_ : thing_name option)
    ?thing_arn:(thing_arn_ : thing_arn option) () =
  ({ thing_name = thing_name_; thing_arn = thing_arn_ } : thing)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : resource_arn)
    () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_system_template_filter ~value:(value_ : system_template_filter_values)
    ~name:(name_ : system_template_filter_name) () =
  ({ value = value_; name = name_ } : system_template_filter)

let make_system_template_description
    ?validated_namespace_version:(validated_namespace_version_ : version option)
    ?definition:(definition_ : definition_document option)
    ?summary:(summary_ : system_template_summary option) () =
  ({
     validated_namespace_version = validated_namespace_version_;
     definition = definition_;
     summary = summary_;
   }
    : system_template_description)

let make_system_instance_filter ?value:(value_ : system_instance_filter_values option)
    ?name:(name_ : system_instance_filter_name option) () =
  ({ value = value_; name = name_ } : system_instance_filter)

let make_metrics_configuration ?metric_rule_role_arn:(metric_rule_role_arn_ : role_arn option)
    ?cloud_metric_enabled:(cloud_metric_enabled_ : enabled option) () =
  ({ metric_rule_role_arn = metric_rule_role_arn_; cloud_metric_enabled = cloud_metric_enabled_ }
    : metrics_configuration)

let make_dependency_revision ?revision_number:(revision_number_ : version option)
    ?id:(id_ : urn option) () =
  ({ revision_number = revision_number_; id = id_ } : dependency_revision)

let make_system_instance_description
    ?flow_actions_role_arn:(flow_actions_role_arn_ : role_arn option)
    ?validated_dependency_revisions:(validated_dependency_revisions_ : dependency_revisions option)
    ?validated_namespace_version:(validated_namespace_version_ : version option)
    ?metrics_configuration:(metrics_configuration_ : metrics_configuration option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?definition:(definition_ : definition_document option)
    ?summary:(summary_ : system_instance_summary option) () =
  ({
     flow_actions_role_arn = flow_actions_role_arn_;
     validated_dependency_revisions = validated_dependency_revisions_;
     validated_namespace_version = validated_namespace_version_;
     metrics_configuration = metrics_configuration_;
     s3_bucket_name = s3_bucket_name_;
     definition = definition_;
     summary = summary_;
   }
    : system_instance_description)

let make_search_things_response ?next_token:(next_token_ : next_token option)
    ?things:(things_ : things option) () =
  ({ next_token = next_token_; things = things_ } : search_things_response)

let make_search_things_request ?namespace_version:(namespace_version_ : version option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~entity_id:(entity_id_ : urn) () =
  ({
     namespace_version = namespace_version_;
     max_results = max_results_;
     next_token = next_token_;
     entity_id = entity_id_;
   }
    : search_things_request)

let make_search_system_templates_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : system_template_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : search_system_templates_response)

let make_search_system_templates_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : system_template_filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : search_system_templates_request)

let make_search_system_instances_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : system_instance_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : search_system_instances_response)

let make_search_system_instances_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : system_instance_filters option) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : search_system_instances_request)

let make_search_flow_templates_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : flow_template_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : search_flow_templates_response)

let make_flow_template_filter ~value:(value_ : flow_template_filter_values)
    ~name:(name_ : flow_template_filter_name) () =
  ({ value = value_; name = name_ } : flow_template_filter)

let make_search_flow_templates_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : flow_template_filters option)
    () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : search_flow_templates_request)

let make_flow_execution_summary ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?flow_template_id:(flow_template_id_ : urn option)
    ?system_instance_id:(system_instance_id_ : urn option)
    ?status:(status_ : flow_execution_status option)
    ?flow_execution_id:(flow_execution_id_ : flow_execution_id option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     flow_template_id = flow_template_id_;
     system_instance_id = system_instance_id_;
     status = status_;
     flow_execution_id = flow_execution_id_;
   }
    : flow_execution_summary)

let make_search_flow_executions_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : flow_execution_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : search_flow_executions_response)

let make_search_flow_executions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?flow_execution_id:(flow_execution_id_ : flow_execution_id option)
    ~system_instance_id:(system_instance_id_ : urn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     flow_execution_id = flow_execution_id_;
     system_instance_id = system_instance_id_;
   }
    : search_flow_executions_request)

let make_entity_description ?definition:(definition_ : definition_document option)
    ?created_at:(created_at_ : timestamp option) ?type_:(type__ : entity_type option)
    ?arn:(arn_ : arn option) ?id:(id_ : urn option) () =
  ({ definition = definition_; created_at = created_at_; type_ = type__; arn = arn_; id = id_ }
    : entity_description)

let make_search_entities_response ?next_token:(next_token_ : next_token option)
    ?descriptions:(descriptions_ : entity_descriptions option) () =
  ({ next_token = next_token_; descriptions = descriptions_ } : search_entities_response)

let make_entity_filter ?value:(value_ : entity_filter_values option)
    ?name:(name_ : entity_filter_name option) () =
  ({ value = value_; name = name_ } : entity_filter)

let make_search_entities_request ?namespace_version:(namespace_version_ : version option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : entity_filters option) ~entity_types:(entity_types_ : entity_types) () =
  ({
     namespace_version = namespace_version_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     entity_types = entity_types_;
   }
    : search_entities_request)

let make_list_tags_for_resource_response ?next_token:(next_token_ : next_token option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~resource_arn:(resource_arn_ : resource_arn) ()
    =
  ({ next_token = next_token_; resource_arn = resource_arn_; max_results = max_results_ }
    : list_tags_for_resource_request)

let make_flow_execution_message ?payload:(payload_ : flow_execution_message_payload option)
    ?timestamp:(timestamp_ : timestamp option)
    ?event_type:(event_type_ : flow_execution_event_type option)
    ?message_id:(message_id_ : flow_execution_message_id option) () =
  ({
     payload = payload_;
     timestamp = timestamp_;
     event_type = event_type_;
     message_id = message_id_;
   }
    : flow_execution_message)

let make_list_flow_execution_messages_response ?next_token:(next_token_ : next_token option)
    ?messages:(messages_ : flow_execution_messages option) () =
  ({ next_token = next_token_; messages = messages_ } : list_flow_execution_messages_response)

let make_list_flow_execution_messages_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~flow_execution_id:(flow_execution_id_ : flow_execution_id) () =
  ({ max_results = max_results_; next_token = next_token_; flow_execution_id = flow_execution_id_ }
    : list_flow_execution_messages_request)

let make_get_upload_status_response ?failure_reason:(failure_reason_ : string_list option)
    ?namespace_version:(namespace_version_ : version option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?namespace_arn:(namespace_arn_ : arn option) ~created_date:(created_date_ : timestamp)
    ~upload_status:(upload_status_ : upload_status) ~upload_id:(upload_id_ : upload_id) () =
  ({
     created_date = created_date_;
     failure_reason = failure_reason_;
     namespace_version = namespace_version_;
     namespace_name = namespace_name_;
     namespace_arn = namespace_arn_;
     upload_status = upload_status_;
     upload_id = upload_id_;
   }
    : get_upload_status_response)

let make_get_upload_status_request ~upload_id:(upload_id_ : upload_id) () =
  ({ upload_id = upload_id_ } : get_upload_status_request)

let make_get_system_template_revisions_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : system_template_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : get_system_template_revisions_response)

let make_get_system_template_revisions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~id:(id_ : urn) () =
  ({ max_results = max_results_; next_token = next_token_; id = id_ }
    : get_system_template_revisions_request)

let make_get_system_template_response
    ?description:(description_ : system_template_description option) () =
  ({ description = description_ } : get_system_template_response)

let make_get_system_template_request ?revision_number:(revision_number_ : version option)
    ~id:(id_ : urn) () =
  ({ revision_number = revision_number_; id = id_ } : get_system_template_request)

let make_get_system_instance_response
    ?description:(description_ : system_instance_description option) () =
  ({ description = description_ } : get_system_instance_response)

let make_get_system_instance_request ~id:(id_ : urn) () =
  ({ id = id_ } : get_system_instance_request)

let make_get_namespace_deletion_status_response ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : namespace_deletion_status_error_codes option)
    ?status:(status_ : namespace_deletion_status option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?namespace_arn:(namespace_arn_ : arn option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     status = status_;
     namespace_name = namespace_name_;
     namespace_arn = namespace_arn_;
   }
    : get_namespace_deletion_status_response)

let make_get_namespace_deletion_status_request () = (() : unit)

let make_get_flow_template_revisions_response ?next_token:(next_token_ : next_token option)
    ?summaries:(summaries_ : flow_template_summaries option) () =
  ({ next_token = next_token_; summaries = summaries_ } : get_flow_template_revisions_response)

let make_get_flow_template_revisions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~id:(id_ : urn) () =
  ({ max_results = max_results_; next_token = next_token_; id = id_ }
    : get_flow_template_revisions_request)

let make_flow_template_description
    ?validated_namespace_version:(validated_namespace_version_ : version option)
    ?definition:(definition_ : definition_document option)
    ?summary:(summary_ : flow_template_summary option) () =
  ({
     validated_namespace_version = validated_namespace_version_;
     definition = definition_;
     summary = summary_;
   }
    : flow_template_description)

let make_get_flow_template_response ?description:(description_ : flow_template_description option)
    () =
  ({ description = description_ } : get_flow_template_response)

let make_get_flow_template_request ?revision_number:(revision_number_ : version option)
    ~id:(id_ : urn) () =
  ({ revision_number = revision_number_; id = id_ } : get_flow_template_request)

let make_get_entities_response ?descriptions:(descriptions_ : entity_descriptions option) () =
  ({ descriptions = descriptions_ } : get_entities_response)

let make_get_entities_request ?namespace_version:(namespace_version_ : version option)
    ~ids:(ids_ : urns) () =
  ({ namespace_version = namespace_version_; ids = ids_ } : get_entities_request)

let make_dissociate_entity_from_thing_response () = (() : unit)

let make_dissociate_entity_from_thing_request ~entity_type:(entity_type_ : entity_type)
    ~thing_name:(thing_name_ : thing_name) () =
  ({ entity_type = entity_type_; thing_name = thing_name_ } : dissociate_entity_from_thing_request)

let make_describe_namespace_response ?namespace_version:(namespace_version_ : version option)
    ?tracking_namespace_version:(tracking_namespace_version_ : version option)
    ?tracking_namespace_name:(tracking_namespace_name_ : namespace_name option)
    ?namespace_name:(namespace_name_ : namespace_name option)
    ?namespace_arn:(namespace_arn_ : arn option) () =
  ({
     namespace_version = namespace_version_;
     tracking_namespace_version = tracking_namespace_version_;
     tracking_namespace_name = tracking_namespace_name_;
     namespace_name = namespace_name_;
     namespace_arn = namespace_arn_;
   }
    : describe_namespace_response)

let make_describe_namespace_request ?namespace_name:(namespace_name_ : namespace_name option) () =
  ({ namespace_name = namespace_name_ } : describe_namespace_request)

let make_deprecate_system_template_response () = (() : unit)

let make_deprecate_system_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : deprecate_system_template_request)

let make_deprecate_flow_template_response () = (() : unit)

let make_deprecate_flow_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : deprecate_flow_template_request)

let make_deploy_system_instance_response
    ?greengrass_deployment_id:(greengrass_deployment_id_ : greengrass_deployment_id option)
    ~summary:(summary_ : system_instance_summary) () =
  ({ greengrass_deployment_id = greengrass_deployment_id_; summary = summary_ }
    : deploy_system_instance_response)

let make_deploy_system_instance_request ?id:(id_ : urn option) () =
  ({ id = id_ } : deploy_system_instance_request)

let make_delete_system_template_response () = (() : unit)

let make_delete_system_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : delete_system_template_request)

let make_delete_system_instance_response () = (() : unit)

let make_delete_system_instance_request ?id:(id_ : urn option) () =
  ({ id = id_ } : delete_system_instance_request)

let make_delete_namespace_response ?namespace_name:(namespace_name_ : namespace_name option)
    ?namespace_arn:(namespace_arn_ : arn option) () =
  ({ namespace_name = namespace_name_; namespace_arn = namespace_arn_ } : delete_namespace_response)

let make_delete_namespace_request () = (() : unit)
let make_delete_flow_template_response () = (() : unit)

let make_delete_flow_template_request ~id:(id_ : urn) () =
  ({ id = id_ } : delete_flow_template_request)

let make_create_system_template_response ?summary:(summary_ : system_template_summary option) () =
  ({ summary = summary_ } : create_system_template_response)

let make_create_system_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option)
    ~definition:(definition_ : definition_document) () =
  ({ compatible_namespace_version = compatible_namespace_version_; definition = definition_ }
    : create_system_template_request)

let make_create_system_instance_response ?summary:(summary_ : system_instance_summary option) () =
  ({ summary = summary_ } : create_system_instance_response)

let make_create_system_instance_request
    ?flow_actions_role_arn:(flow_actions_role_arn_ : role_arn option)
    ?metrics_configuration:(metrics_configuration_ : metrics_configuration option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?greengrass_group_name:(greengrass_group_name_ : group_name option)
    ?tags:(tags_ : tag_list option) ~target:(target_ : deployment_target)
    ~definition:(definition_ : definition_document) () =
  ({
     flow_actions_role_arn = flow_actions_role_arn_;
     metrics_configuration = metrics_configuration_;
     s3_bucket_name = s3_bucket_name_;
     greengrass_group_name = greengrass_group_name_;
     target = target_;
     definition = definition_;
     tags = tags_;
   }
    : create_system_instance_request)

let make_create_flow_template_response ?summary:(summary_ : flow_template_summary option) () =
  ({ summary = summary_ } : create_flow_template_response)

let make_create_flow_template_request
    ?compatible_namespace_version:(compatible_namespace_version_ : version option)
    ~definition:(definition_ : definition_document) () =
  ({ compatible_namespace_version = compatible_namespace_version_; definition = definition_ }
    : create_flow_template_request)

let make_associate_entity_to_thing_response () = (() : unit)

let make_associate_entity_to_thing_request ?namespace_version:(namespace_version_ : version option)
    ~entity_id:(entity_id_ : urn) ~thing_name:(thing_name_ : thing_name) () =
  ({ namespace_version = namespace_version_; entity_id = entity_id_; thing_name = thing_name_ }
    : associate_entity_to_thing_request)
