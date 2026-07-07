open Types

let make_lambdas ?arn:(arn_ : lambda_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option) () =
  ({ arn = arn_; external_id = external_id_; cross_account_role = cross_account_role_ } : lambdas)

let make_lambda_ungraceful ?behavior:(behavior_ : lambda_ungraceful_behavior option) () =
  ({ behavior = behavior_ } : lambda_ungraceful)

let make_custom_action_lambda_configuration ?ungraceful:(ungraceful_ : lambda_ungraceful option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~region_to_run:(region_to_run_ : region_to_run_in)
    ~retry_interval_minutes:(retry_interval_minutes_ : Smaws_Lib.Smithy_api.Types.float_)
    ~lambdas:(lambdas_ : lambda_list) () =
  ({
     ungraceful = ungraceful_;
     region_to_run = region_to_run_;
     retry_interval_minutes = retry_interval_minutes_;
     lambdas = lambdas_;
     timeout_minutes = timeout_minutes_;
   }
    : custom_action_lambda_configuration)

let make_asg ?arn:(arn_ : asg_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option) () =
  ({ arn = arn_; external_id = external_id_; cross_account_role = cross_account_role_ } : asg)

let make_ec2_ungraceful
    ~minimum_success_percentage:(minimum_success_percentage_ : Smaws_Lib.Smithy_api.Types.integer)
    () =
  ({ minimum_success_percentage = minimum_success_percentage_ } : ec2_ungraceful)

let make_ec2_asg_capacity_increase_configuration
    ?capacity_monitoring_approach:
      (capacity_monitoring_approach_ : ec2_asg_capacity_monitoring_approach option)
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ungraceful:(ungraceful_ : ec2_ungraceful option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~asgs:(asgs_ : asg_list) () =
  ({
     capacity_monitoring_approach = capacity_monitoring_approach_;
     target_percent = target_percent_;
     ungraceful = ungraceful_;
     asgs = asgs_;
     timeout_minutes = timeout_minutes_;
   }
    : ec2_asg_capacity_increase_configuration)

let make_execution_approval_configuration
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~approval_role:(approval_role_ : role_arn) () =
  ({ approval_role = approval_role_; timeout_minutes = timeout_minutes_ }
    : execution_approval_configuration)

let make_arc_routing_control_state ~state:(state_ : routing_control_state_change)
    ~routing_control_arn:(routing_control_arn_ : routing_control_arn) () =
  ({ state = state_; routing_control_arn = routing_control_arn_ } : arc_routing_control_state)

let make_arc_routing_control_configuration
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~region_and_routing_controls:(region_and_routing_controls_ : region_and_routing_controls) () =
  ({
     region_and_routing_controls = region_and_routing_controls_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : arc_routing_control_configuration)

let make_global_aurora_ungraceful
    ?ungraceful:(ungraceful_ : global_aurora_ungraceful_behavior option) () =
  ({ ungraceful = ungraceful_ } : global_aurora_ungraceful)

let make_global_aurora_configuration ?ungraceful:(ungraceful_ : global_aurora_ungraceful option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~database_cluster_arns:(database_cluster_arns_ : aurora_cluster_arns)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier)
    ~behavior:(behavior_ : global_aurora_default_behavior) () =
  ({
     database_cluster_arns = database_cluster_arns_;
     global_cluster_identifier = global_cluster_identifier_;
     ungraceful = ungraceful_;
     behavior = behavior_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : global_aurora_configuration)

let make_region_switch_plan_configuration
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option) ~arn:(arn_ : plan_arn) () =
  ({ arn = arn_; external_id = external_id_; cross_account_role = cross_account_role_ }
    : region_switch_plan_configuration)

let make_service ?service_arn:(service_arn_ : ecs_service_arn option)
    ?cluster_arn:(cluster_arn_ : ecs_cluster_arn option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option) () =
  ({
     service_arn = service_arn_;
     cluster_arn = cluster_arn_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
   }
    : service)

let make_ecs_ungraceful
    ~minimum_success_percentage:(minimum_success_percentage_ : Smaws_Lib.Smithy_api.Types.integer)
    () =
  ({ minimum_success_percentage = minimum_success_percentage_ } : ecs_ungraceful)

let make_ecs_capacity_increase_configuration
    ?capacity_monitoring_approach:
      (capacity_monitoring_approach_ : ecs_capacity_monitoring_approach option)
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ungraceful:(ungraceful_ : ecs_ungraceful option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~services:(services_ : service_list) () =
  ({
     capacity_monitoring_approach = capacity_monitoring_approach_;
     target_percent = target_percent_;
     ungraceful = ungraceful_;
     services = services_;
     timeout_minutes = timeout_minutes_;
   }
    : ecs_capacity_increase_configuration)

let make_kubernetes_resource_type ~kind:(kind_ : Smaws_Lib.Smithy_api.Types.string_)
    ~api_version:(api_version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ kind = kind_; api_version = api_version_ } : kubernetes_resource_type)

let make_kubernetes_scaling_resource
    ?hpa_name:(hpa_name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~namespace:(namespace_ : kubernetes_namespace) () =
  ({ hpa_name = hpa_name_; name = name_; namespace = namespace_ } : kubernetes_scaling_resource)

let make_eks_cluster ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ~cluster_arn:(cluster_arn_ : eks_cluster_arn) () =
  ({
     cluster_arn = cluster_arn_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
   }
    : eks_cluster)

let make_eks_resource_scaling_ungraceful
    ~minimum_success_percentage:(minimum_success_percentage_ : Smaws_Lib.Smithy_api.Types.integer)
    () =
  ({ minimum_success_percentage = minimum_success_percentage_ } : eks_resource_scaling_ungraceful)

let make_eks_resource_scaling_configuration
    ?capacity_monitoring_approach:
      (capacity_monitoring_approach_ : eks_capacity_monitoring_approach option)
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?ungraceful:(ungraceful_ : eks_resource_scaling_ungraceful option)
    ?eks_clusters:(eks_clusters_ : eks_clusters option)
    ?scaling_resources:(scaling_resources_ : kubernetes_scaling_apps option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~kubernetes_resource_type:(kubernetes_resource_type_ : kubernetes_resource_type) () =
  ({
     capacity_monitoring_approach = capacity_monitoring_approach_;
     target_percent = target_percent_;
     ungraceful = ungraceful_;
     eks_clusters = eks_clusters_;
     scaling_resources = scaling_resources_;
     kubernetes_resource_type = kubernetes_resource_type_;
     timeout_minutes = timeout_minutes_;
   }
    : eks_resource_scaling_configuration)

let make_route53_resource_record_set ?region:(region_ : region option)
    ?record_set_identifier:(record_set_identifier_ : route53_resource_record_set_identifier option)
    () =
  ({ region = region_; record_set_identifier = record_set_identifier_ }
    : route53_resource_record_set)

let make_route53_health_check_configuration
    ?record_sets:(record_sets_ : route53_resource_record_set_list option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~record_name:(record_name_ : route53_record_name)
    ~hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id) () =
  ({
     record_sets = record_sets_;
     record_name = record_name_;
     hosted_zone_id = hosted_zone_id_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : route53_health_check_configuration)

let make_document_db_ungraceful ?ungraceful:(ungraceful_ : document_db_ungraceful_behavior option)
    () =
  ({ ungraceful = ungraceful_ } : document_db_ungraceful)

let make_document_db_configuration ?ungraceful:(ungraceful_ : document_db_ungraceful option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~database_cluster_arns:(database_cluster_arns_ : document_db_cluster_arns)
    ~global_cluster_identifier:(global_cluster_identifier_ : document_db_global_cluster_identifier)
    ~behavior:(behavior_ : document_db_default_behavior) () =
  ({
     database_cluster_arns = database_cluster_arns_;
     global_cluster_identifier = global_cluster_identifier_;
     ungraceful = ungraceful_;
     behavior = behavior_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : document_db_configuration)

let make_rds_promote_read_replica_configuration
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~db_instance_arn_map:(db_instance_arn_map_ : rds_db_instance_arn_map) () =
  ({
     db_instance_arn_map = db_instance_arn_map_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : rds_promote_read_replica_configuration)

let make_rds_create_cross_region_replica_configuration
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~db_instance_arn_map:(db_instance_arn_map_ : rds_db_instance_arn_map) () =
  ({
     db_instance_arn_map = db_instance_arn_map_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : rds_create_cross_region_replica_configuration)

let make_event_source_mapping
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ~arn:(arn_ : event_source_mapping_arn) () =
  ({ arn = arn_; external_id = external_id_; cross_account_role = cross_account_role_ }
    : event_source_mapping)

let make_lambda_event_source_mapping_ungraceful
    ?behavior:(behavior_ : lambda_event_source_mapping_ungraceful_behavior option) () =
  ({ behavior = behavior_ } : lambda_event_source_mapping_ungraceful)

let make_lambda_event_source_mapping_configuration
    ?ungraceful:(ungraceful_ : lambda_event_source_mapping_ungraceful option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~region_event_source_mappings:(region_event_source_mappings_ : region_event_source_mapping_map)
    ~action:(action_ : event_source_mapping_action) () =
  ({
     ungraceful = ungraceful_;
     region_event_source_mappings = region_event_source_mappings_;
     action = action_;
     timeout_minutes = timeout_minutes_;
   }
    : lambda_event_source_mapping_configuration)

let make_aurora_serverless_scaling_configuration
    ?target_percent:(target_percent_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~region_database_cluster_arns:(region_database_cluster_arns_ : region_aurora_cluster_map)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     target_percent = target_percent_;
     region_database_cluster_arns = region_database_cluster_arns_;
     global_cluster_identifier = global_cluster_identifier_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : aurora_serverless_scaling_configuration)

let make_aurora_provisioned_scaling_configuration
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~instance_arns:(instance_arns_ : region_aurora_instance_arn_map)
    ~region_database_cluster_arns:(region_database_cluster_arns_ : region_aurora_cluster_map)
    ~global_cluster_identifier:(global_cluster_identifier_ : global_cluster_identifier) () =
  ({
     instance_arns = instance_arns_;
     region_database_cluster_arns = region_database_cluster_arns_;
     global_cluster_identifier = global_cluster_identifier_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : aurora_provisioned_scaling_configuration)

let make_neptune_ungraceful ?ungraceful:(ungraceful_ : neptune_ungraceful_behavior option) () =
  ({ ungraceful = ungraceful_ } : neptune_ungraceful)

let make_neptune_global_database_configuration ?ungraceful:(ungraceful_ : neptune_ungraceful option)
    ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ?timeout_minutes:(timeout_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~region_database_cluster_arns:(region_database_cluster_arns_ : region_neptune_cluster_arn_map)
    ~global_cluster_identifier:(global_cluster_identifier_ : neptune_global_cluster_identifier)
    ~behavior:(behavior_ : neptune_default_behavior) () =
  ({
     region_database_cluster_arns = region_database_cluster_arns_;
     global_cluster_identifier = global_cluster_identifier_;
     ungraceful = ungraceful_;
     behavior = behavior_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
     timeout_minutes = timeout_minutes_;
   }
    : neptune_global_database_configuration)

let make_parallel_execution_block_configuration ~steps:(steps_ : steps) () =
  ({ steps = steps_ } : parallel_execution_block_configuration)

let make_step ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~execution_block_type:(execution_block_type_ : execution_block_type)
    ~execution_block_configuration:(execution_block_configuration_ : execution_block_configuration)
    ~name:(name_ : step_name) () =
  ({
     execution_block_type = execution_block_type_;
     execution_block_configuration = execution_block_configuration_;
     description = description_;
     name = name_;
   }
    : step)

let make_workflow
    ?workflow_description:(workflow_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?workflow_target_region:(workflow_target_region_ : region option) ?steps:(steps_ : steps option)
    ~workflow_target_action:(workflow_target_action_ : workflow_target_action) () =
  ({
     workflow_description = workflow_description_;
     workflow_target_region = workflow_target_region_;
     workflow_target_action = workflow_target_action_;
     steps = steps_;
   }
    : workflow)

let make_associated_alarm ?external_id:(external_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cross_account_role:(cross_account_role_ : iam_role_arn option)
    ~alarm_type:(alarm_type_ : alarm_type)
    ~resource_identifier:(resource_identifier_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     alarm_type = alarm_type_;
     resource_identifier = resource_identifier_;
     external_id = external_id_;
     cross_account_role = cross_account_role_;
   }
    : associated_alarm)

let make_trigger_condition ~condition:(condition_ : alarm_condition)
    ~associated_alarm_name:(associated_alarm_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ condition = condition_; associated_alarm_name = associated_alarm_name_ } : trigger_condition)

let make_trigger ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~min_delay_minutes_between_executions:
      (min_delay_minutes_between_executions_ : Smaws_Lib.Smithy_api.Types.integer)
    ~conditions:(conditions_ : trigger_condition_list) ~action:(action_ : workflow_target_action)
    ~target_region:(target_region_ : region) () =
  ({
     min_delay_minutes_between_executions = min_delay_minutes_between_executions_;
     conditions = conditions_;
     action = action_;
     target_region = target_region_;
     description = description_;
   }
    : trigger)

let make_s3_report_output_configuration ?bucket_owner:(bucket_owner_ : account_id option)
    ?bucket_path:(bucket_path_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ bucket_owner = bucket_owner_; bucket_path = bucket_path_ } : s3_report_output_configuration)

let make_report_configuration ?report_output:(report_output_ : report_output_list option) () =
  ({ report_output = report_output_ } : report_configuration)

let make_plan ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?primary_region:(primary_region_ : region option)
    ?report_configuration:(report_configuration_ : report_configuration option)
    ?triggers:(triggers_ : trigger_list option)
    ?associated_alarms:(associated_alarms_ : associated_alarm_map option)
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~owner:(owner_ : account_id) ~recovery_approach:(recovery_approach_ : recovery_approach)
    ~regions:(regions_ : region_list) ~name:(name_ : plan_name)
    ~execution_role:(execution_role_ : iam_role_arn) ~workflows:(workflows_ : workflow_list)
    ~arn:(arn_ : plan_arn) () =
  ({
     updated_at = updated_at_;
     version = version_;
     owner = owner_;
     primary_region = primary_region_;
     recovery_approach = recovery_approach_;
     regions = regions_;
     name = name_;
     report_configuration = report_configuration_;
     triggers = triggers_;
     associated_alarms = associated_alarms_;
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
     execution_role = execution_role_;
     workflows = workflows_;
     description = description_;
     arn = arn_;
   }
    : plan)

let make_update_plan_response ?plan:(plan_ : plan option) () =
  ({ plan = plan_ } : update_plan_response)

let make_update_plan_request
    ?report_configuration:(report_configuration_ : report_configuration option)
    ?triggers:(triggers_ : trigger_list option)
    ?associated_alarms:(associated_alarms_ : associated_alarm_map option)
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~execution_role:(execution_role_ : iam_role_arn) ~workflows:(workflows_ : workflow_list)
    ~arn:(arn_ : plan_arn) () =
  ({
     report_configuration = report_configuration_;
     triggers = triggers_;
     associated_alarms = associated_alarms_;
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
     execution_role = execution_role_;
     workflows = workflows_;
     description = description_;
     arn = arn_;
   }
    : update_plan_request)

let make_update_plan_execution_step_response () = (() : unit)

let make_update_plan_execution_step_request
    ~action_to_take:(action_to_take_ : update_plan_execution_step_action)
    ~step_name:(step_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~comment:(comment_ : execution_comment) ~execution_id:(execution_id_ : execution_id)
    ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     action_to_take = action_to_take_;
     step_name = step_name_;
     comment = comment_;
     execution_id = execution_id_;
     plan_arn = plan_arn_;
   }
    : update_plan_execution_step_request)

let make_update_plan_execution_response () = (() : unit)

let make_update_plan_execution_request ?comment:(comment_ : execution_comment option)
    ~action:(action_ : update_plan_execution_action) ~execution_id:(execution_id_ : execution_id)
    ~plan_arn:(plan_arn_ : plan_arn) () =
  ({ comment = comment_; action = action_; execution_id = execution_id_; plan_arn = plan_arn_ }
    : update_plan_execution_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_tag_keys:(resource_tag_keys_ : tag_keys)
    ~arn:(arn_ : plan_arn) () =
  ({ resource_tag_keys = resource_tag_keys_; arn = arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~arn:(arn_ : plan_arn) () =
  ({ tags = tags_; arn = arn_ } : tag_resource_request)

let make_step_state ?step_mode:(step_mode_ : execution_mode option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : step_status option) ?name:(name_ : step_name option) () =
  ({
     step_mode = step_mode_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     name = name_;
   }
    : step_state)

let make_start_plan_execution_response
    ?deactivate_region:(deactivate_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?activate_region:(activate_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?plan_version:(plan_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?plan:(plan_ : plan_arn option) ?execution_id:(execution_id_ : execution_id option) () =
  ({
     deactivate_region = deactivate_region_;
     activate_region = activate_region_;
     plan_version = plan_version_;
     plan = plan_;
     execution_id = execution_id_;
   }
    : start_plan_execution_response)

let make_start_plan_execution_request
    ?recovery_execution_id:(recovery_execution_id_ : recovery_execution_id option)
    ?latest_version:(latest_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?comment:(comment_ : execution_comment option) ?mode:(mode_ : execution_mode option)
    ~action:(action_ : execution_action)
    ~target_region:(target_region_ : Smaws_Lib.Smithy_api.Types.string_)
    ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     recovery_execution_id = recovery_execution_id_;
     latest_version = latest_version_;
     comment = comment_;
     mode = mode_;
     action = action_;
     target_region = target_region_;
     plan_arn = plan_arn_;
   }
    : start_plan_execution_request)

let make_s3_report_output
    ?s3_object_key:(s3_object_key_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ s3_object_key = s3_object_key_ } : s3_report_output)

let make_route53_health_check ?status:(status_ : route53_health_check_status option)
    ?health_check_id:(health_check_id_ : route53_health_check_id option) ~region:(region_ : region)
    ~record_name:(record_name_ : route53_record_name)
    ~hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id) () =
  ({
     region = region_;
     status = status_;
     health_check_id = health_check_id_;
     record_name = record_name_;
     hosted_zone_id = hosted_zone_id_;
   }
    : route53_health_check)

let make_minimal_workflow ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?action:(action_ : execution_action option) () =
  ({ name = name_; action = action_ } : minimal_workflow)

let make_resource_warning ?resource_arn:(resource_arn_ : resource_arn option)
    ?step_name:(step_name_ : step_name option) ?workflow:(workflow_ : minimal_workflow option)
    ~warning_message:(warning_message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~warning_updated_time:(warning_updated_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~warning_status:(warning_status_ : resource_warning_status)
    ~version:(version_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     warning_message = warning_message_;
     warning_updated_time = warning_updated_time_;
     warning_status = warning_status_;
     resource_arn = resource_arn_;
     step_name = step_name_;
     version = version_;
     workflow = workflow_;
   }
    : resource_warning)

let make_failed_report_output
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : failed_report_error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ } : failed_report_output)

let make_abbreviated_plan
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?active_plan_execution:(active_plan_execution_ : execution_id option)
    ?execution_role:(execution_role_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?primary_region:(primary_region_ : region option)
    ~recovery_approach:(recovery_approach_ : recovery_approach) ~regions:(regions_ : region_list)
    ~name:(name_ : plan_name) ~owner:(owner_ : account_id) ~arn:(arn_ : plan_arn) () =
  ({
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
     active_plan_execution = active_plan_execution_;
     execution_role = execution_role_;
     description = description_;
     updated_at = updated_at_;
     version = version_;
     primary_region = primary_region_;
     recovery_approach = recovery_approach_;
     regions = regions_;
     name = name_;
     owner = owner_;
     arn = arn_;
   }
    : abbreviated_plan)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : tags option) () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~arn:(arn_ : plan_arn) () =
  ({ arn = arn_ } : list_tags_for_resource_request)

let make_list_route53_health_checks_response ?next_token:(next_token_ : next_token option)
    ?health_checks:(health_checks_ : route53_health_check_list option) () =
  ({ next_token = next_token_; health_checks = health_checks_ }
    : list_route53_health_checks_response)

let make_list_route53_health_checks_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?record_name:(record_name_ : route53_record_name option)
    ?hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id option) ~arn:(arn_ : plan_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     record_name = record_name_;
     hosted_zone_id = hosted_zone_id_;
     arn = arn_;
   }
    : list_route53_health_checks_request)

let make_list_route53_health_checks_in_region_response ?next_token:(next_token_ : next_token option)
    ?health_checks:(health_checks_ : route53_health_check_list option) () =
  ({ next_token = next_token_; health_checks = health_checks_ }
    : list_route53_health_checks_in_region_response)

let make_list_route53_health_checks_in_region_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?record_name:(record_name_ : route53_record_name option)
    ?hosted_zone_id:(hosted_zone_id_ : route53_hosted_zone_id option) ~arn:(arn_ : plan_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     record_name = record_name_;
     hosted_zone_id = hosted_zone_id_;
     arn = arn_;
   }
    : list_route53_health_checks_in_region_request)

let make_list_plans_response ?next_token:(next_token_ : next_token option)
    ?plans:(plans_ : plan_list option) () =
  ({ next_token = next_token_; plans = plans_ } : list_plans_response)

let make_list_plans_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_plans_request)

let make_list_plans_in_region_response ?next_token:(next_token_ : next_token option)
    ?plans:(plans_ : plan_list option) () =
  ({ next_token = next_token_; plans = plans_ } : list_plans_in_region_response)

let make_list_plans_in_region_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_plans_in_region_request)

let make_abbreviated_execution ?actual_recovery_time:(actual_recovery_time_ : duration option)
    ?recovery_execution_id:(recovery_execution_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?comment:(comment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~execution_region:(execution_region_ : Smaws_Lib.Smithy_api.Types.string_)
    ~execution_action:(execution_action_ : execution_action)
    ~execution_state:(execution_state_ : execution_state) ~mode:(mode_ : execution_mode)
    ~start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~execution_id:(execution_id_ : execution_id) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     actual_recovery_time = actual_recovery_time_;
     recovery_execution_id = recovery_execution_id_;
     execution_region = execution_region_;
     execution_action = execution_action_;
     execution_state = execution_state_;
     mode = mode_;
     end_time = end_time_;
     start_time = start_time_;
     comment = comment_;
     updated_at = updated_at_;
     version = version_;
     execution_id = execution_id_;
     plan_arn = plan_arn_;
   }
    : abbreviated_execution)

let make_list_plan_executions_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?items:(items_ : abbreviated_executions_list option) () =
  ({ next_token = next_token_; items = items_ } : list_plan_executions_response)

let make_list_plan_executions_request ?state:(state_ : execution_state option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : list_executions_max_results option)
    ~plan_arn:(plan_arn_ : plan_arn) () =
  ({ state = state_; next_token = next_token_; max_results = max_results_; plan_arn = plan_arn_ }
    : list_plan_executions_request)

let make_execution_event
    ?previous_event_id:(previous_event_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error:(error_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resources:(resources_ : resources option)
    ?execution_block_type:(execution_block_type_ : execution_block_type option)
    ?step_name:(step_name_ : step_name option) ?type_:(type__ : execution_event_type option)
    ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~event_id:(event_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     previous_event_id = previous_event_id_;
     event_id = event_id_;
     description = description_;
     error = error_;
     resources = resources_;
     execution_block_type = execution_block_type_;
     step_name = step_name_;
     type_ = type__;
     timestamp = timestamp_;
   }
    : execution_event)

let make_list_plan_execution_events_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?items:(items_ : execution_event_list option) () =
  ({ next_token = next_token_; items = items_ } : list_plan_execution_events_response)

let make_list_plan_execution_events_request ?name:(name_ : step_name option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : list_execution_events_max_results option)
    ~execution_id:(execution_id_ : execution_id) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     name = name_;
     next_token = next_token_;
     max_results = max_results_;
     execution_id = execution_id_;
     plan_arn = plan_arn_;
   }
    : list_plan_execution_events_request)

let make_get_plan_response ?plan:(plan_ : plan option) () = ({ plan = plan_ } : get_plan_response)
let make_get_plan_request ~arn:(arn_ : plan_arn) () = ({ arn = arn_ } : get_plan_request)

let make_get_plan_in_region_response ?plan:(plan_ : plan option) () =
  ({ plan = plan_ } : get_plan_in_region_response)

let make_get_plan_in_region_request ~arn:(arn_ : plan_arn) () =
  ({ arn = arn_ } : get_plan_in_region_request)

let make_generated_report ?report_output:(report_output_ : report_output option)
    ?report_generation_time:(report_generation_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    () =
  ({ report_output = report_output_; report_generation_time = report_generation_time_ }
    : generated_report)

let make_get_plan_execution_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?generated_report_details:(generated_report_details_ : generated_report_details option)
    ?actual_recovery_time:(actual_recovery_time_ : duration option) ?plan:(plan_ : plan option)
    ?step_states:(step_states_ : step_states option)
    ?recovery_execution_id:(recovery_execution_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?comment:(comment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?updated_at:(updated_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?version:(version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~execution_region:(execution_region_ : Smaws_Lib.Smithy_api.Types.string_)
    ~execution_action:(execution_action_ : execution_action)
    ~execution_state:(execution_state_ : execution_state) ~mode:(mode_ : execution_mode)
    ~start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~execution_id:(execution_id_ : execution_id) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     next_token = next_token_;
     generated_report_details = generated_report_details_;
     actual_recovery_time = actual_recovery_time_;
     plan = plan_;
     step_states = step_states_;
     recovery_execution_id = recovery_execution_id_;
     execution_region = execution_region_;
     execution_action = execution_action_;
     execution_state = execution_state_;
     mode = mode_;
     end_time = end_time_;
     start_time = start_time_;
     comment = comment_;
     updated_at = updated_at_;
     version = version_;
     execution_id = execution_id_;
     plan_arn = plan_arn_;
   }
    : get_plan_execution_response)

let make_get_plan_execution_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : get_plan_execution_step_states_max_results option)
    ~execution_id:(execution_id_ : execution_id) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     execution_id = execution_id_;
     plan_arn = plan_arn_;
   }
    : get_plan_execution_request)

let make_get_plan_evaluation_status_response ?next_token:(next_token_ : next_token option)
    ?warnings:(warnings_ : plan_warnings option)
    ?evaluation_state:(evaluation_state_ : evaluation_status option)
    ?region:(region_ : region option)
    ?last_evaluated_version:(last_evaluated_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_evaluation_time:(last_evaluation_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     next_token = next_token_;
     warnings = warnings_;
     evaluation_state = evaluation_state_;
     region = region_;
     last_evaluated_version = last_evaluated_version_;
     last_evaluation_time = last_evaluation_time_;
     plan_arn = plan_arn_;
   }
    : get_plan_evaluation_status_response)

let make_get_plan_evaluation_status_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({ next_token = next_token_; max_results = max_results_; plan_arn = plan_arn_ }
    : get_plan_evaluation_status_request)

let make_delete_plan_response () = (() : unit)
let make_delete_plan_request ~arn:(arn_ : plan_arn) () = ({ arn = arn_ } : delete_plan_request)

let make_create_plan_response ?plan:(plan_ : plan option) () =
  ({ plan = plan_ } : create_plan_response)

let make_create_plan_request ?tags:(tags_ : tags option)
    ?primary_region:(primary_region_ : region option)
    ?report_configuration:(report_configuration_ : report_configuration option)
    ?triggers:(triggers_ : trigger_list option)
    ?associated_alarms:(associated_alarms_ : associated_alarm_map option)
    ?recovery_time_objective_minutes:
      (recovery_time_objective_minutes_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~recovery_approach:(recovery_approach_ : recovery_approach) ~regions:(regions_ : region_list)
    ~name:(name_ : plan_name) ~execution_role:(execution_role_ : iam_role_arn)
    ~workflows:(workflows_ : workflow_list) () =
  ({
     tags = tags_;
     primary_region = primary_region_;
     recovery_approach = recovery_approach_;
     regions = regions_;
     name = name_;
     report_configuration = report_configuration_;
     triggers = triggers_;
     associated_alarms = associated_alarms_;
     recovery_time_objective_minutes = recovery_time_objective_minutes_;
     execution_role = execution_role_;
     workflows = workflows_;
     description = description_;
   }
    : create_plan_request)

let make_cancel_plan_execution_response () = (() : unit)

let make_cancel_plan_execution_request ?comment:(comment_ : execution_comment option)
    ~execution_id:(execution_id_ : execution_id) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({ comment = comment_; execution_id = execution_id_; plan_arn = plan_arn_ }
    : cancel_plan_execution_request)

let make_approve_plan_execution_step_response () = (() : unit)

let make_approve_plan_execution_step_request ?comment:(comment_ : execution_comment option)
    ~approval:(approval_ : approval) ~step_name:(step_name_ : step_name)
    ~execution_id:(execution_id_ : execution_id) ~plan_arn:(plan_arn_ : plan_arn) () =
  ({
     comment = comment_;
     approval = approval_;
     step_name = step_name_;
     execution_id = execution_id_;
     plan_arn = plan_arn_;
   }
    : approve_plan_execution_step_request)
