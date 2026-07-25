open Types

let make_abbreviated_execution ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?comment:(comment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?recovery_execution_id:(recovery_execution_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?actual_recovery_time:(actual_recovery_time_ : duration option) ~plan_arn:(plan_arn_ : plan_arn)
    ~execution_id:(execution_id_ : execution_id)
    ~start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp) ~mode:(mode_ : execution_mode)
    ~execution_state:(execution_state_ : execution_state)
    ~execution_action:(execution_action_ : execution_action)
    ~execution_region:(execution_region_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     plan_arn = plan_arn_;
     execution_id = execution_id_;
     version = version_;
     updated_at = updated_at_;
     comment = comment_;
     start_time = start_time_;
     end_time = end_time_;
     mode = mode_;
     execution_state = execution_state_;
     execution_action = execution_action_;
     execution_region = execution_region_;
     recovery_execution_id = recovery_execution_id_;
     actual_recovery_time = actual_recovery_time_;
   }
    : abbreviated_execution)

let make_abbreviated_plan ?primary_region:(primary_region_ : region option)
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?execution_role:(execution_role_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?active_plan_execution:(active_plan_execution_ : execution_id option)
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~arn:(arn_ : plan_arn) ~owner:(owner_ : account_id) ~name:(name_ : plan_name)
    ~regions:(regions_ : region_list) ~recovery_approach:(recovery_approach_ : recovery_approach) ()
    =
  ({
     arn = arn_;
     owner = owner_;
     name = name_;
     regions = regions_;
     recovery_approach = recovery_approach_;
     primary_region = primary_region_;
     version = version_;
     updated_at = updated_at_;
     description = description_;
     execution_role = execution_role_;
     active_plan_execution = active_plan_execution_;
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
   }
    : abbreviated_plan)

let make_approve_plan_execution_step_response () = (() : unit)

let make_approve_plan_execution_step_request ?comment:(comment_ : execution_comment option)
    ~plan_arn:(plan_arn_ : plan_arn) ~execution_id:(execution_id_ : execution_id)
    ~step_name:(step_name_ : step_name) ~approval:(approval_ : approval) () =
  ({
     plan_arn = plan_arn_;
     execution_id = execution_id_;
     step_name = step_name_;
     approval = approval_;
     comment = comment_;
   }
    : approve_plan_execution_step_request)

let make_update_plan_execution_step_response () = (() : unit)

let make_update_plan_execution_step_request ~plan_arn:(plan_arn_ : plan_arn)
    ~execution_id:(execution_id_ : execution_id) ~comment:(comment_ : execution_comment)
    ~step_name:(step_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~action_to_take:(action_to_take_ : update_plan_execution_step_action) () =
  ({
     plan_arn = plan_arn_;
     execution_id = execution_id_;
     comment = comment_;
     step_name = step_name_;
     action_to_take = action_to_take_;
   }
    : update_plan_execution_step_request)

let make_update_plan_execution_response () = (() : unit)

let make_update_plan_execution_request ?comment:(comment_ : execution_comment option)
    ~plan_arn:(plan_arn_ : plan_arn) ~execution_id:(execution_id_ : execution_id)
    ~action:(action_ : update_plan_execution_action) () =
  ({ plan_arn = plan_arn_; execution_id = execution_id_; action = action_; comment = comment_ }
    : update_plan_execution_request)

let make_start_plan_execution_response ?execution_id:(execution_id_ : execution_id option)
    ?plan:(plan_ : plan_arn option)
    ?plan_version:(plan_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?activate_region:(activate_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?deactivate_region:(deactivate_region_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     execution_id = execution_id_;
     plan = plan_;
     plan_version = plan_version_;
     activate_region = activate_region_;
     deactivate_region = deactivate_region_;
   }
    : start_plan_execution_response)

let make_start_plan_execution_request ?mode:(mode_ : execution_mode option)
    ?comment:(comment_ : execution_comment option)
    ?latest_version:(latest_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recovery_execution_id:(recovery_execution_id_ : recovery_execution_id option)
    ~plan_arn:(plan_arn_ : plan_arn)
    ~target_region:(target_region_ : Smaws_Lib.Smithy_api.Types.string_)
    ~action:(action_ : execution_action) () =
  ({
     plan_arn = plan_arn_;
     target_region = target_region_;
     action = action_;
     mode = mode_;
     comment = comment_;
     latest_version = latest_version_;
     recovery_execution_id = recovery_execution_id_;
   }
    : start_plan_execution_request)

let make_route53_health_check ?health_check_id:(health_check_id_ : route53_health_check_id option)
    ?status:(status_ : route53_health_check_status option)
    ~hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id)
    ~record_name:(record_name_ : route53_record_name) ~region:(region_ : region) () =
  ({
     hosted_zone_id = hosted_zone_id_;
     record_name = record_name_;
     health_check_id = health_check_id_;
     status = status_;
     region = region_;
   }
    : route53_health_check)

let make_list_route53_health_checks_in_region_response
    ?health_checks:(health_checks_ : route53_health_check_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ health_checks = health_checks_; next_token = next_token_ }
    : list_route53_health_checks_in_region_response)

let make_list_route53_health_checks_in_region_request
    ?hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id option)
    ?record_name:(record_name_ : route53_record_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~arn:(arn_ : plan_arn) () =
  ({
     arn = arn_;
     hosted_zone_id = hosted_zone_id_;
     record_name = record_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_route53_health_checks_in_region_request)

let make_list_route53_health_checks_response
    ?health_checks:(health_checks_ : route53_health_check_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ health_checks = health_checks_; next_token = next_token_ }
    : list_route53_health_checks_response)

let make_list_route53_health_checks_request
    ?hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id option)
    ?record_name:(record_name_ : route53_record_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~arn:(arn_ : plan_arn) () =
  ({
     arn = arn_;
     hosted_zone_id = hosted_zone_id_;
     record_name = record_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_route53_health_checks_request)

let make_list_plans_in_region_response ?plans:(plans_ : plan_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ plans = plans_; next_token = next_token_ } : list_plans_in_region_response)

let make_list_plans_in_region_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_plans_in_region_request)

let make_list_plan_executions_response ?items:(items_ : abbreviated_executions_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ items = items_; next_token = next_token_ } : list_plan_executions_response)

let make_list_plan_executions_request
    ?max_results:(max_results_ : list_executions_max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?state:(state_ : execution_state option) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({ plan_arn = plan_arn_; max_results = max_results_; next_token = next_token_; state = state_ }
    : list_plan_executions_request)

let make_execution_event ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?type_:(type__ : execution_event_type option) ?step_name:(step_name_ : step_name option)
    ?execution_block_type:(execution_block_type_ : execution_block_type option)
    ?resources:(resources_ : resources option)
    ?error:(error_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?previous_event_id:(previous_event_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~event_id:(event_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     timestamp = timestamp_;
     type_ = type__;
     step_name = step_name_;
     execution_block_type = execution_block_type_;
     resources = resources_;
     error = error_;
     description = description_;
     event_id = event_id_;
     previous_event_id = previous_event_id_;
   }
    : execution_event)

let make_list_plan_execution_events_response ?items:(items_ : execution_event_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ items = items_; next_token = next_token_ } : list_plan_execution_events_response)

let make_list_plan_execution_events_request
    ?max_results:(max_results_ : list_execution_events_max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : step_name option) ~plan_arn:(plan_arn_ : plan_arn)
    ~execution_id:(execution_id_ : execution_id) () =
  ({
     plan_arn = plan_arn_;
     execution_id = execution_id_;
     max_results = max_results_;
     next_token = next_token_;
     name = name_;
   }
    : list_plan_execution_events_request)

let make_s3_report_output_configuration
    ?bucket_path:(bucket_path_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?bucket_owner:(bucket_owner_ : account_id option) () =
  ({ bucket_path = bucket_path_; bucket_owner = bucket_owner_ } : s3_report_output_configuration)

let make_report_configuration ?report_output:(report_output_ : report_output_list option) () =
  ({ report_output = report_output_ } : report_configuration)

let make_trigger_condition
    ~associated_alarm_name:(associated_alarm_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~condition:(condition_ : alarm_condition) () =
  ({ associated_alarm_name = associated_alarm_name_; condition = condition_ } : trigger_condition)

let make_trigger ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~target_region:(target_region_ : region) ~action:(action_ : workflow_target_action)
    ~conditions:(conditions_ : trigger_condition_list)
    ~min_delay_minutes_between_executions:
      (min_delay_minutes_between_executions_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({
     description = description_;
     target_region = target_region_;
     action = action_;
     conditions = conditions_;
     min_delay_minutes_between_executions = min_delay_minutes_between_executions_;
   }
    : trigger)

let make_associated_alarm ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~resource_identifier:(resource_identifier_ : Smaws_Lib.Smithy_api.Types.string_)
    ~alarm_type:(alarm_type_ : alarm_type) () =
  ({
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     resource_identifier = resource_identifier_;
     alarm_type = alarm_type_;
   }
    : associated_alarm)

let make_neptune_ungraceful ?ungraceful:(ungraceful_ : neptune_ungraceful_behavior option) () =
  ({ ungraceful = ungraceful_ } : neptune_ungraceful)

let make_neptune_global_database_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ungraceful:(ungraceful_ : neptune_ungraceful option)
    ~behavior:(behavior_ : neptune_default_behavior)
    ~global_cluster_identifier:(global_cluster_identifier_ : neptune_global_cluster_identifier)
    ~region_database_cluster_arns:(region_database_cluster_arns_ : region_neptune_cluster_arn_map)
    () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     behavior = behavior_;
     ungraceful = ungraceful_;
     global_cluster_identifier = global_cluster_identifier_;
     region_database_cluster_arns = region_database_cluster_arns_;
   }
    : neptune_global_database_configuration)

let make_aurora_provisioned_scaling_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~region_database_cluster_arns:(region_database_cluster_arns_ : region_aurora_cluster_map)
    ~instance_arns:(instance_arns_ : region_aurora_instance_arn_map) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     global_cluster_identifier = global_cluster_identifier_;
     region_database_cluster_arns = region_database_cluster_arns_;
     instance_arns = instance_arns_;
   }
    : aurora_provisioned_scaling_configuration)

let make_aurora_serverless_scaling_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~region_database_cluster_arns:(region_database_cluster_arns_ : region_aurora_cluster_map) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     global_cluster_identifier = global_cluster_identifier_;
     region_database_cluster_arns = region_database_cluster_arns_;
     target_percent = target_percent_;
   }
    : aurora_serverless_scaling_configuration)

let make_lambda_event_source_mapping_ungraceful
    ?behavior:(behavior_ : lambda_event_source_mapping_ungraceful_behavior option) () =
  ({ behavior = behavior_ } : lambda_event_source_mapping_ungraceful)

let make_event_source_mapping ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~arn:(arn_ : event_source_mapping_arn) () =
  ({ cross_account_role = cross_account_role_; external_id = external_id_; arn = arn_ }
    : event_source_mapping)

let make_lambda_event_source_mapping_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ungraceful:(ungraceful_ : lambda_event_source_mapping_ungraceful option)
    ~action:(action_ : event_source_mapping_action)
    ~region_event_source_mappings:(region_event_source_mappings_ : region_event_source_mapping_map)
    () =
  ({
     timeout_minutes = timeout_minutes_;
     action = action_;
     region_event_source_mappings = region_event_source_mappings_;
     ungraceful = ungraceful_;
   }
    : lambda_event_source_mapping_configuration)

let make_rds_create_cross_region_replica_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_instance_arn_map:(db_instance_arn_map_ : rds_db_instance_arn_map) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     db_instance_arn_map = db_instance_arn_map_;
   }
    : rds_create_cross_region_replica_configuration)

let make_rds_promote_read_replica_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~db_instance_arn_map:(db_instance_arn_map_ : rds_db_instance_arn_map) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     db_instance_arn_map = db_instance_arn_map_;
   }
    : rds_promote_read_replica_configuration)

let make_document_db_ungraceful ?ungraceful:(ungraceful_ : document_db_ungraceful_behavior option)
    () =
  ({ ungraceful = ungraceful_ } : document_db_ungraceful)

let make_document_db_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ungraceful:(ungraceful_ : document_db_ungraceful option)
    ~behavior:(behavior_ : document_db_default_behavior)
    ~global_cluster_identifier:(global_cluster_identifier_ : document_db_global_cluster_identifier)
    ~database_cluster_arns:(database_cluster_arns_ : document_db_cluster_arns) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     behavior = behavior_;
     ungraceful = ungraceful_;
     global_cluster_identifier = global_cluster_identifier_;
     database_cluster_arns = database_cluster_arns_;
   }
    : document_db_configuration)

let make_route53_resource_record_set
    ?record_set_identifier:(record_set_identifier_ : route53_resource_record_set_identifier option)
    ?region:(region_ : region option) () =
  ({ record_set_identifier = record_set_identifier_; region = region_ }
    : route53_resource_record_set)

let make_route53_health_check_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?record_sets:(record_sets_ : route53_resource_record_set_list option)
    ~hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id)
    ~record_name:(record_name_ : route53_record_name) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     hosted_zone_id = hosted_zone_id_;
     record_name = record_name_;
     record_sets = record_sets_;
   }
    : route53_health_check_configuration)

let make_eks_resource_scaling_ungraceful
    ~minimum_success_percentage:(minimum_success_percentage_ : Smaws_Lib.Smithy_api.Types.integer)
    () =
  ({ minimum_success_percentage = minimum_success_percentage_ } : eks_resource_scaling_ungraceful)

let make_eks_cluster ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~cluster_arn:(cluster_arn_ : eks_cluster_arn) () =
  ({
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     cluster_arn = cluster_arn_;
   }
    : eks_cluster)

let make_kubernetes_scaling_resource
    ?hpa_name:(hpa_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~namespace:(namespace_ : kubernetes_namespace)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ namespace = namespace_; name = name_; hpa_name = hpa_name_ } : kubernetes_scaling_resource)

let make_kubernetes_resource_type ~api_version:(api_version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~kind:(kind_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ api_version = api_version_; kind = kind_ } : kubernetes_resource_type)

let make_eks_resource_scaling_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?scaling_resources:(scaling_resources_ : kubernetes_scaling_apps option)
    ?eks_clusters:(eks_clusters_ : eks_clusters option)
    ?ungraceful:(ungraceful_ : eks_resource_scaling_ungraceful option)
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?capacity_monitoring_approach:
      (capacity_monitoring_approach_ : eks_capacity_monitoring_approach option)
    ~kubernetes_resource_type:(kubernetes_resource_type_ : kubernetes_resource_type) () =
  ({
     timeout_minutes = timeout_minutes_;
     kubernetes_resource_type = kubernetes_resource_type_;
     scaling_resources = scaling_resources_;
     eks_clusters = eks_clusters_;
     ungraceful = ungraceful_;
     target_percent = target_percent_;
     capacity_monitoring_approach = capacity_monitoring_approach_;
   }
    : eks_resource_scaling_configuration)

let make_ecs_ungraceful
    ~minimum_success_percentage:(minimum_success_percentage_ : Smaws_Lib.Smithy_api.Types.integer)
    () =
  ({ minimum_success_percentage = minimum_success_percentage_ } : ecs_ungraceful)

let make_service ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cluster_arn:(cluster_arn_ : ecs_cluster_arn option)
    ?service_arn:(service_arn_ : ecs_service_arn option) () =
  ({
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     cluster_arn = cluster_arn_;
     service_arn = service_arn_;
   }
    : service)

let make_ecs_capacity_increase_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ungraceful:(ungraceful_ : ecs_ungraceful option)
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?capacity_monitoring_approach:
      (capacity_monitoring_approach_ : ecs_capacity_monitoring_approach option)
    ~services:(services_ : service_list) () =
  ({
     timeout_minutes = timeout_minutes_;
     services = services_;
     ungraceful = ungraceful_;
     target_percent = target_percent_;
     capacity_monitoring_approach = capacity_monitoring_approach_;
   }
    : ecs_capacity_increase_configuration)

let make_region_switch_plan_configuration
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option) ~arn:(arn_ : plan_arn)
    () =
  ({ cross_account_role = cross_account_role_; external_id = external_id_; arn = arn_ }
    : region_switch_plan_configuration)

let make_global_aurora_ungraceful
    ?ungraceful:(ungraceful_ : global_aurora_ungraceful_behavior option) () =
  ({ ungraceful = ungraceful_ } : global_aurora_ungraceful)

let make_global_aurora_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?ungraceful:(ungraceful_ : global_aurora_ungraceful option)
    ~behavior:(behavior_ : global_aurora_default_behavior)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~database_cluster_arns:(database_cluster_arns_ : aurora_cluster_arns) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     behavior = behavior_;
     ungraceful = ungraceful_;
     global_cluster_identifier = global_cluster_identifier_;
     database_cluster_arns = database_cluster_arns_;
   }
    : global_aurora_configuration)

let make_arc_routing_control_state ~routing_control_arn:(routing_control_arn_ : routing_control_arn)
    ~state:(state_ : routing_control_state_change) () =
  ({ routing_control_arn = routing_control_arn_; state = state_ } : arc_routing_control_state)

let make_arc_routing_control_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~region_and_routing_controls:(region_and_routing_controls_ : region_and_routing_controls) () =
  ({
     timeout_minutes = timeout_minutes_;
     cross_account_role = cross_account_role_;
     external_id = external_id_;
     region_and_routing_controls = region_and_routing_controls_;
   }
    : arc_routing_control_configuration)

let make_execution_approval_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~approval_role:(approval_role_ : role_arn) () =
  ({ timeout_minutes = timeout_minutes_; approval_role = approval_role_ }
    : execution_approval_configuration)

let make_ec2_ungraceful
    ~minimum_success_percentage:(minimum_success_percentage_ : Smaws_Lib.Smithy_api.Types.integer)
    () =
  ({ minimum_success_percentage = minimum_success_percentage_ } : ec2_ungraceful)

let make_asg ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : asg_arn option) () =
  ({ cross_account_role = cross_account_role_; external_id = external_id_; arn = arn_ } : asg)

let make_ec2_asg_capacity_increase_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ungraceful:(ungraceful_ : ec2_ungraceful option)
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?capacity_monitoring_approach:
      (capacity_monitoring_approach_ : ec2_asg_capacity_monitoring_approach option)
    ~asgs:(asgs_ : asg_list) () =
  ({
     timeout_minutes = timeout_minutes_;
     asgs = asgs_;
     ungraceful = ungraceful_;
     target_percent = target_percent_;
     capacity_monitoring_approach = capacity_monitoring_approach_;
   }
    : ec2_asg_capacity_increase_configuration)

let make_lambda_ungraceful ?behavior:(behavior_ : lambda_ungraceful_behavior option) () =
  ({ behavior = behavior_ } : lambda_ungraceful)

let make_lambdas ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?arn:(arn_ : lambda_arn option) () =
  ({ cross_account_role = cross_account_role_; external_id = external_id_; arn = arn_ } : lambdas)

let make_custom_action_lambda_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ungraceful:(ungraceful_ : lambda_ungraceful option) ~lambdas:(lambdas_ : lambda_list)
    ~retry_interval_minutes:(retry_interval_minutes_ : Smaws_Lib.Smithy_api.Types.float_)
    ~region_to_run:(region_to_run_ : region_to_run_in) () =
  ({
     timeout_minutes = timeout_minutes_;
     lambdas = lambdas_;
     retry_interval_minutes = retry_interval_minutes_;
     region_to_run = region_to_run_;
     ungraceful = ungraceful_;
   }
    : custom_action_lambda_configuration)

let make_step ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~name:(name_ : step_name)
    ~execution_block_configuration:(execution_block_configuration_ : execution_block_configuration)
    ~execution_block_type:(execution_block_type_ : execution_block_type) () =
  ({
     name = name_;
     description = description_;
     execution_block_configuration = execution_block_configuration_;
     execution_block_type = execution_block_type_;
   }
    : step)

let make_parallel_execution_block_configuration ~steps:(steps_ : steps) () =
  ({ steps = steps_ } : parallel_execution_block_configuration)

let make_workflow ?steps:(steps_ : steps option)
    ?workflow_target_region:(workflow_target_region_ : region option)
    ?workflow_description:(workflow_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~workflow_target_action:(workflow_target_action_ : workflow_target_action) () =
  ({
     steps = steps_;
     workflow_target_action = workflow_target_action_;
     workflow_target_region = workflow_target_region_;
     workflow_description = workflow_description_;
   }
    : workflow)

let make_plan ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?associated_alarms:(associated_alarms_ : associated_alarm_map option)
    ?triggers:(triggers_ : trigger_list option)
    ?report_configuration:(report_configuration_ : report_configuration option)
    ?primary_region:(primary_region_ : region option)
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option) ~arn:(arn_ : plan_arn)
    ~workflows:(workflows_ : workflow_list) ~execution_role:(execution_role_ : iam_role_arn)
    ~name:(name_ : plan_name) ~regions:(regions_ : region_list)
    ~recovery_approach:(recovery_approach_ : recovery_approach) ~owner:(owner_ : account_id) () =
  ({
     arn = arn_;
     description = description_;
     workflows = workflows_;
     execution_role = execution_role_;
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
     associated_alarms = associated_alarms_;
     triggers = triggers_;
     report_configuration = report_configuration_;
     name = name_;
     regions = regions_;
     recovery_approach = recovery_approach_;
     primary_region = primary_region_;
     owner = owner_;
     version = version_;
     updated_at = updated_at_;
   }
    : plan)

let make_get_plan_in_region_response ?plan:(plan_ : plan option) () =
  ({ plan = plan_ } : get_plan_in_region_response)

let make_get_plan_in_region_request ~arn:(arn_ : plan_arn) () =
  ({ arn = arn_ } : get_plan_in_region_request)

let make_failed_report_output ?error_code:(error_code_ : failed_report_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ error_code = error_code_; error_message = error_message_ } : failed_report_output)

let make_s3_report_output
    ?s3_object_key:(s3_object_key_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ s3_object_key = s3_object_key_ } : s3_report_output)

let make_generated_report
    ?report_generation_time:(report_generation_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?report_output:(report_output_ : report_output option) () =
  ({ report_generation_time = report_generation_time_; report_output = report_output_ }
    : generated_report)

let make_step_state ?name:(name_ : step_name option) ?status:(status_ : step_status option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?step_mode:(step_mode_ : execution_mode option) () =
  ({
     name = name_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     step_mode = step_mode_;
   }
    : step_state)

let make_get_plan_execution_response ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?comment:(comment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?recovery_execution_id:(recovery_execution_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?step_states:(step_states_ : step_states option) ?plan:(plan_ : plan option)
    ?actual_recovery_time:(actual_recovery_time_ : duration option)
    ?generated_report_details:(generated_report_details_ : generated_report_details option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~plan_arn:(plan_arn_ : plan_arn) ~execution_id:(execution_id_ : execution_id)
    ~start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp) ~mode:(mode_ : execution_mode)
    ~execution_state:(execution_state_ : execution_state)
    ~execution_action:(execution_action_ : execution_action)
    ~execution_region:(execution_region_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     plan_arn = plan_arn_;
     execution_id = execution_id_;
     version = version_;
     updated_at = updated_at_;
     comment = comment_;
     start_time = start_time_;
     end_time = end_time_;
     mode = mode_;
     execution_state = execution_state_;
     execution_action = execution_action_;
     execution_region = execution_region_;
     recovery_execution_id = recovery_execution_id_;
     step_states = step_states_;
     plan = plan_;
     actual_recovery_time = actual_recovery_time_;
     generated_report_details = generated_report_details_;
     next_token = next_token_;
   }
    : get_plan_execution_response)

let make_get_plan_execution_request
    ?max_results:(max_results_ : get_plan_execution_step_states_max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~plan_arn:(plan_arn_ : plan_arn) ~execution_id:(execution_id_ : execution_id) () =
  ({
     plan_arn = plan_arn_;
     execution_id = execution_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : get_plan_execution_request)

let make_minimal_workflow ?action:(action_ : execution_action option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ action = action_; name = name_ } : minimal_workflow)

let make_resource_warning ?workflow:(workflow_ : minimal_workflow option)
    ?step_name:(step_name_ : step_name option) ?resource_arn:(resource_arn_ : resource_arn option)
    ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_)
    ~warning_status:(warning_status_ : resource_warning_status)
    ~warning_updated_time:(warning_updated_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~warning_message:(warning_message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     workflow = workflow_;
     version = version_;
     step_name = step_name_;
     resource_arn = resource_arn_;
     warning_status = warning_status_;
     warning_updated_time = warning_updated_time_;
     warning_message = warning_message_;
   }
    : resource_warning)

let make_get_plan_evaluation_status_response
    ?last_evaluation_time:(last_evaluation_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_evaluated_version:(last_evaluated_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?region:(region_ : region option)
    ?evaluation_state:(evaluation_state_ : evaluation_status option)
    ?warnings:(warnings_ : plan_warnings option) ?next_token:(next_token_ : next_token option)
    ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     plan_arn = plan_arn_;
     last_evaluation_time = last_evaluation_time_;
     last_evaluated_version = last_evaluated_version_;
     region = region_;
     evaluation_state = evaluation_state_;
     warnings = warnings_;
     next_token = next_token_;
   }
    : get_plan_evaluation_status_response)

let make_get_plan_evaluation_status_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({ plan_arn = plan_arn_; max_results = max_results_; next_token = next_token_ }
    : get_plan_evaluation_status_request)

let make_cancel_plan_execution_response () = (() : unit)

let make_cancel_plan_execution_request ?comment:(comment_ : execution_comment option)
    ~plan_arn:(plan_arn_ : plan_arn) ~execution_id:(execution_id_ : execution_id) () =
  ({ plan_arn = plan_arn_; execution_id = execution_id_; comment = comment_ }
    : cancel_plan_execution_request)

let make_create_plan_response ?plan:(plan_ : plan option) () =
  ({ plan = plan_ } : create_plan_response)

let make_create_plan_request ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?associated_alarms:(associated_alarms_ : associated_alarm_map option)
    ?triggers:(triggers_ : trigger_list option)
    ?report_configuration:(report_configuration_ : report_configuration option)
    ?primary_region:(primary_region_ : region option) ?tags:(tags_ : tags option)
    ~workflows:(workflows_ : workflow_list) ~execution_role:(execution_role_ : iam_role_arn)
    ~name:(name_ : plan_name) ~regions:(regions_ : region_list)
    ~recovery_approach:(recovery_approach_ : recovery_approach) () =
  ({
     description = description_;
     workflows = workflows_;
     execution_role = execution_role_;
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
     associated_alarms = associated_alarms_;
     triggers = triggers_;
     report_configuration = report_configuration_;
     name = name_;
     regions = regions_;
     recovery_approach = recovery_approach_;
     primary_region = primary_region_;
     tags = tags_;
   }
    : create_plan_request)

let make_delete_plan_response () = (() : unit)
let make_delete_plan_request ~arn:(arn_ : plan_arn) () = ({ arn = arn_ } : delete_plan_request)
let make_get_plan_response ?plan:(plan_ : plan option) () = ({ plan = plan_ } : get_plan_response)
let make_get_plan_request ~arn:(arn_ : plan_arn) () = ({ arn = arn_ } : get_plan_request)

let make_list_plans_response ?plans:(plans_ : plan_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ plans = plans_; next_token = next_token_ } : list_plans_response)

let make_list_plans_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_plans_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : tags option) () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~arn:(arn_ : plan_arn) () =
  ({ arn = arn_ } : list_tags_for_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~arn:(arn_ : plan_arn) ~tags:(tags_ : tags) () =
  ({ arn = arn_; tags = tags_ } : tag_resource_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~arn:(arn_ : plan_arn)
    ~resource_tag_keys:(resource_tag_keys_ : tag_keys) () =
  ({ arn = arn_; resource_tag_keys = resource_tag_keys_ } : untag_resource_request)

let make_update_plan_response ?plan:(plan_ : plan option) () =
  ({ plan = plan_ } : update_plan_response)

let make_update_plan_request ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?associated_alarms:(associated_alarms_ : associated_alarm_map option)
    ?triggers:(triggers_ : trigger_list option)
    ?report_configuration:(report_configuration_ : report_configuration option)
    ~arn:(arn_ : plan_arn) ~workflows:(workflows_ : workflow_list)
    ~execution_role:(execution_role_ : iam_role_arn) () =
  ({
     arn = arn_;
     description = description_;
     workflows = workflows_;
     execution_role = execution_role_;
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
     associated_alarms = associated_alarms_;
     triggers = triggers_;
     report_configuration = report_configuration_;
   }
    : update_plan_request)
