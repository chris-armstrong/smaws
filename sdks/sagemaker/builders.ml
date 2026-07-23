open Types

let make_ai_benchmark_inference_component ~identifier:(identifier_ : ai_resource_identifier) () =
  ({ identifier = identifier_ } : ai_benchmark_inference_component)

let make_ai_benchmark_endpoint
    ?target_container_hostname:(target_container_hostname_ : string_ option)
    ?inference_components:(inference_components_ : ai_benchmark_inference_component_list option)
    ~identifier:(identifier_ : ai_resource_identifier) () =
  ({
     identifier = identifier_;
     target_container_hostname = target_container_hostname_;
     inference_components = inference_components_;
   }
    : ai_benchmark_endpoint)

let make_ai_benchmark_job_summary ?end_time:(end_time_ : timestamp option)
    ?ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name option)
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name)
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn)
    ~ai_benchmark_job_status:(ai_benchmark_job_status_ : ai_benchmark_job_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     ai_benchmark_job_name = ai_benchmark_job_name_;
     ai_benchmark_job_arn = ai_benchmark_job_arn_;
     ai_benchmark_job_status = ai_benchmark_job_status_;
     creation_time = creation_time_;
     end_time = end_time_;
     ai_workload_config_name = ai_workload_config_name_;
   }
    : ai_benchmark_job_summary)

let make_vpc_config ~security_group_ids:(security_group_ids_ : vpc_security_group_ids)
    ~subnets:(subnets_ : subnets) () =
  ({ security_group_ids = security_group_ids_; subnets = subnets_ } : vpc_config)

let make_ai_benchmark_network_config ?vpc_config:(vpc_config_ : vpc_config option) () =
  ({ vpc_config = vpc_config_ } : ai_benchmark_network_config)

let make_ai_mlflow_config
    ?mlflow_experiment_name:(mlflow_experiment_name_ : ai_mlflow_experiment_name option)
    ?mlflow_run_name:(mlflow_run_name_ : ai_mlflow_run_name option)
    ~mlflow_resource_arn:(mlflow_resource_arn_ : ai_mlflow_resource_arn) () =
  ({
     mlflow_resource_arn = mlflow_resource_arn_;
     mlflow_experiment_name = mlflow_experiment_name_;
     mlflow_run_name = mlflow_run_name_;
   }
    : ai_mlflow_config)

let make_ai_benchmark_output_config ?mlflow_config:(mlflow_config_ : ai_mlflow_config option)
    ~s3_output_location:(s3_output_location_ : s3_uri) () =
  ({ s3_output_location = s3_output_location_; mlflow_config = mlflow_config_ }
    : ai_benchmark_output_config)

let make_ai_cloud_watch_logs ?log_group_arn:(log_group_arn_ : string_ option)
    ?log_stream_name:(log_stream_name_ : string_ option) () =
  ({ log_group_arn = log_group_arn_; log_stream_name = log_stream_name_ } : ai_cloud_watch_logs)

let make_ai_capacity_reservation_config
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : ai_capacity_reservation_preference option)
    ?ml_reservation_arns:(ml_reservation_arns_ : ai_ml_reservation_arn_list option) () =
  ({
     capacity_reservation_preference = capacity_reservation_preference_;
     ml_reservation_arns = ml_reservation_arns_;
   }
    : ai_capacity_reservation_config)

let make_ai_workload_s3_data_source ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_ } : ai_workload_s3_data_source)

let make_ai_workload_data_source
    ?s3_data_source:(s3_data_source_ : ai_workload_s3_data_source option) () =
  ({ s3_data_source = s3_data_source_ } : ai_workload_data_source)

let make_ai_workload_input_data_config ~channel_name:(channel_name_ : ai_channel_name)
    ~data_source:(data_source_ : ai_workload_data_source) () =
  ({ channel_name = channel_name_; data_source = data_source_ } : ai_workload_input_data_config)

let make_ai_model_source_s3 ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ s3_uri = s3_uri_ } : ai_model_source_s3)

let make_ai_recommendation_performance_metric ?stat:(stat_ : string_ option)
    ?unit_:(unit__ : string_ option) ~metric:(metric_ : string_) ~value:(value_ : string_) () =
  ({ metric = metric_; stat = stat_; value = value_; unit_ = unit__ }
    : ai_recommendation_performance_metric)

let make_ai_recommendation_deployment_s3_channel
    ?channel_name:(channel_name_ : ai_channel_name option) ?uri:(uri_ : s3_uri option) () =
  ({ channel_name = channel_name_; uri = uri_ } : ai_recommendation_deployment_s3_channel)

let make_ai_recommendation_deployment_configuration
    ?s3:(s3_ : ai_recommendation_deployment_s3_channel_list option)
    ?image_uri:(image_uri_ : string_ option)
    ?instance_type:(instance_type_ : ai_recommendation_instance_type option)
    ?instance_count:(instance_count_ : ai_recommendation_instance_count option)
    ?copy_count_per_instance:
      (copy_count_per_instance_ : ai_recommendation_copy_count_per_instance option)
    ?environment_variables:(environment_variables_ : environment_map option) () =
  ({
     s3 = s3_;
     image_uri = image_uri_;
     instance_type = instance_type_;
     instance_count = instance_count_;
     copy_count_per_instance = copy_count_per_instance_;
     environment_variables = environment_variables_;
   }
    : ai_recommendation_deployment_configuration)

let make_ai_recommendation_instance_detail
    ?instance_type:(instance_type_ : ai_recommendation_instance_type option)
    ?instance_count:(instance_count_ : ai_recommendation_instance_count option)
    ?copy_count_per_instance:
      (copy_count_per_instance_ : ai_recommendation_copy_count_per_instance option) () =
  ({
     instance_type = instance_type_;
     instance_count = instance_count_;
     copy_count_per_instance = copy_count_per_instance_;
   }
    : ai_recommendation_instance_detail)

let make_ai_recommendation_model_details
    ?model_package_arn:(model_package_arn_ : model_package_arn option)
    ?inference_specification_name:
      (inference_specification_name_ : ai_inference_specification_name option)
    ?instance_details:(instance_details_ : ai_recommendation_instance_detail_list option) () =
  ({
     model_package_arn = model_package_arn_;
     inference_specification_name = inference_specification_name_;
     instance_details = instance_details_;
   }
    : ai_recommendation_model_details)

let make_ai_recommendation_optimization_detail
    ?optimization_config:(optimization_config_ : ai_recommendation_optimization_config_map option)
    ~optimization_type:(optimization_type_ : ai_recommendation_optimization_type) () =
  ({ optimization_type = optimization_type_; optimization_config = optimization_config_ }
    : ai_recommendation_optimization_detail)

let make_ai_recommendation
    ?recommendation_description:(recommendation_description_ : string_ option)
    ?optimization_details:
      (optimization_details_ : ai_recommendation_optimization_detail_list option)
    ?model_details:(model_details_ : ai_recommendation_model_details option)
    ?deployment_configuration:
      (deployment_configuration_ : ai_recommendation_deployment_configuration option)
    ?ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn option)
    ?expected_performance:(expected_performance_ : expected_performance_list option) () =
  ({
     recommendation_description = recommendation_description_;
     optimization_details = optimization_details_;
     model_details = model_details_;
     deployment_configuration = deployment_configuration_;
     ai_benchmark_job_arn = ai_benchmark_job_arn_;
     expected_performance = expected_performance_;
   }
    : ai_recommendation)

let make_ai_recommendation_compute_spec
    ?instance_types:(instance_types_ : ai_recommendation_instance_type_list option)
    ?capacity_reservation_config:
      (capacity_reservation_config_ : ai_capacity_reservation_config option) () =
  ({ instance_types = instance_types_; capacity_reservation_config = capacity_reservation_config_ }
    : ai_recommendation_compute_spec)

let make_ai_recommendation_constraint ~metric:(metric_ : ai_recommendation_metric) () =
  ({ metric = metric_ } : ai_recommendation_constraint)

let make_ai_recommendation_inference_specification
    ?framework:(framework_ : ai_recommendation_inference_framework option) () =
  ({ framework = framework_ } : ai_recommendation_inference_specification)

let make_ai_recommendation_job_summary ?end_time:(end_time_ : timestamp option)
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name)
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn)
    ~ai_recommendation_job_status:(ai_recommendation_job_status_ : ai_recommendation_job_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     ai_recommendation_job_name = ai_recommendation_job_name_;
     ai_recommendation_job_arn = ai_recommendation_job_arn_;
     ai_recommendation_job_status = ai_recommendation_job_status_;
     creation_time = creation_time_;
     end_time = end_time_;
   }
    : ai_recommendation_job_summary)

let make_ai_recommendation_output_config ?s3_output_location:(s3_output_location_ : s3_uri option)
    ?model_package_group_identifier:
      (model_package_group_identifier_ : ai_resource_identifier option)
    ?mlflow_config:(mlflow_config_ : ai_mlflow_config option) () =
  ({
     s3_output_location = s3_output_location_;
     model_package_group_identifier = model_package_group_identifier_;
     mlflow_config = mlflow_config_;
   }
    : ai_recommendation_output_config)

let make_ai_recommendation_performance_target
    ~constraints:(constraints_ : ai_recommendation_constraint_list) () =
  ({ constraints = constraints_ } : ai_recommendation_performance_target)

let make_ai_workload_config_summary
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name)
    ~ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     ai_workload_config_name = ai_workload_config_name_;
     ai_workload_config_arn = ai_workload_config_arn_;
     creation_time = creation_time_;
   }
    : ai_workload_config_summary)

let make_ai_workload_configs ~workload_spec:(workload_spec_ : workload_spec) () =
  ({ workload_spec = workload_spec_ } : ai_workload_configs)

let make_accelerator_partition_config ~type_:(type__ : mig_profile_type) ~count:(count_ : integer)
    () =
  ({ type_ = type__; count = count_ } : accelerator_partition_config)

let make_compute_quota_resource_config ?count:(count_ : instance_count option)
    ?accelerators:(accelerators_ : accelerators_amount option) ?v_cpu:(v_cpu_ : v_cpu_amount option)
    ?memory_in_gi_b:(memory_in_gi_b_ : memory_in_gi_b_amount option)
    ?accelerator_partition:(accelerator_partition_ : accelerator_partition_config option)
    ~instance_type:(instance_type_ : cluster_instance_type) () =
  ({
     instance_type = instance_type_;
     count = count_;
     accelerators = accelerators_;
     v_cpu = v_cpu_;
     memory_in_gi_b = memory_in_gi_b_;
     accelerator_partition = accelerator_partition_;
   }
    : compute_quota_resource_config)

let make_action_source ?source_type:(source_type_ : string256 option)
    ?source_id:(source_id_ : string256 option) ~source_uri:(source_uri_ : source_uri) () =
  ({ source_uri = source_uri_; source_type = source_type_; source_id = source_id_ } : action_source)

let make_action_summary ?action_arn:(action_arn_ : action_arn option)
    ?action_name:(action_name_ : experiment_entity_name option)
    ?source:(source_ : action_source option) ?action_type:(action_type_ : string64 option)
    ?status:(status_ : action_status option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     action_arn = action_arn_;
     action_name = action_name_;
     source = source_;
     action_type = action_type_;
     status = status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : action_summary)

let make_add_association_response ?source_arn:(source_arn_ : association_entity_arn option)
    ?destination_arn:(destination_arn_ : association_entity_arn option) () =
  ({ source_arn = source_arn_; destination_arn = destination_arn_ } : add_association_response)

let make_add_association_request
    ?association_type:(association_type_ : association_edge_type option)
    ~source_arn:(source_arn_ : association_entity_arn)
    ~destination_arn:(destination_arn_ : association_entity_arn) () =
  ({
     source_arn = source_arn_;
     destination_arn = destination_arn_;
     association_type = association_type_;
   }
    : add_association_request)

let make_add_cluster_node_specification
    ?availability_zones:(availability_zones_ : cluster_availability_zones option)
    ?instance_types:(instance_types_ : cluster_instance_types option)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name)
    ~increment_target_count_by:(increment_target_count_by_ : batch_add_increment_count) () =
  ({
     instance_group_name = instance_group_name_;
     increment_target_count_by = increment_target_count_by_;
     availability_zones = availability_zones_;
     instance_types = instance_types_;
   }
    : add_cluster_node_specification)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_output ?tags:(tags_ : tag_list option) () = ({ tags = tags_ } : add_tags_output)

let make_add_tags_input ~resource_arn:(resource_arn_ : resource_arn) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : add_tags_input)

let make_additional_enis ?efa_enis:(efa_enis_ : efa_enis option) () =
  ({ efa_enis = efa_enis_ } : additional_enis)

let make_base_model ?hub_content_name:(hub_content_name_ : hub_content_name option)
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ?recipe_name:(recipe_name_ : recipe_name option) () =
  ({
     hub_content_name = hub_content_name_;
     hub_content_version = hub_content_version_;
     recipe_name = recipe_name_;
   }
    : base_model)

let make_additional_s3_data_source ?compression_type:(compression_type_ : compression_type option)
    ?e_tag:(e_tag_ : string_ option)
    ~s3_data_type:(s3_data_type_ : additional_s3_data_source_data_type) ~s3_uri:(s3_uri_ : s3_uri)
    () =
  ({
     s3_data_type = s3_data_type_;
     s3_uri = s3_uri_;
     compression_type = compression_type_;
     e_tag = e_tag_;
   }
    : additional_s3_data_source)

let make_inference_hub_access_config ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_content_arn = hub_content_arn_ } : inference_hub_access_config)

let make_model_access_config ~accept_eula:(accept_eula_ : accept_eula) () =
  ({ accept_eula = accept_eula_ } : model_access_config)

let make_s3_model_data_source
    ?model_access_config:(model_access_config_ : model_access_config option)
    ?hub_access_config:(hub_access_config_ : inference_hub_access_config option)
    ?manifest_s3_uri:(manifest_s3_uri_ : s3_model_uri option) ?e_tag:(e_tag_ : string_ option)
    ?manifest_etag:(manifest_etag_ : string_ option) ~s3_uri:(s3_uri_ : s3_model_uri)
    ~s3_data_type:(s3_data_type_ : s3_model_data_type)
    ~compression_type:(compression_type_ : model_compression_type) () =
  ({
     s3_uri = s3_uri_;
     s3_data_type = s3_data_type_;
     compression_type = compression_type_;
     model_access_config = model_access_config_;
     hub_access_config = hub_access_config_;
     manifest_s3_uri = manifest_s3_uri_;
     e_tag = e_tag_;
     manifest_etag = manifest_etag_;
   }
    : s3_model_data_source)

let make_additional_model_data_source ~channel_name:(channel_name_ : additional_model_channel_name)
    ~s3_data_source:(s3_data_source_ : s3_model_data_source) () =
  ({ channel_name = channel_name_; s3_data_source = s3_data_source_ }
    : additional_model_data_source)

let make_model_input ~data_input_config:(data_input_config_ : data_input_config) () =
  ({ data_input_config = data_input_config_ } : model_input)

let make_model_data_source ?s3_data_source:(s3_data_source_ : s3_model_data_source option) () =
  ({ s3_data_source = s3_data_source_ } : model_data_source)

let make_model_package_container_definition
    ?container_hostname:(container_hostname_ : container_hostname option)
    ?image:(image_ : container_image option) ?image_digest:(image_digest_ : image_digest option)
    ?model_data_url:(model_data_url_ : url option)
    ?model_data_source:(model_data_source_ : model_data_source option)
    ?product_id:(product_id_ : product_id option)
    ?environment:(environment_ : environment_map option)
    ?model_input:(model_input_ : model_input option) ?framework:(framework_ : string_ option)
    ?framework_version:(framework_version_ : model_package_framework_version option)
    ?nearest_model_name:(nearest_model_name_ : string_ option)
    ?additional_model_data_sources:
      (additional_model_data_sources_ : additional_model_data_sources option)
    ?additional_s3_data_source:(additional_s3_data_source_ : additional_s3_data_source option)
    ?model_data_e_tag:(model_data_e_tag_ : string_ option)
    ?is_checkpoint:(is_checkpoint_ : boolean_ option) ?base_model:(base_model_ : base_model option)
    () =
  ({
     container_hostname = container_hostname_;
     image = image_;
     image_digest = image_digest_;
     model_data_url = model_data_url_;
     model_data_source = model_data_source_;
     product_id = product_id_;
     environment = environment_;
     model_input = model_input_;
     framework = framework_;
     framework_version = framework_version_;
     nearest_model_name = nearest_model_name_;
     additional_model_data_sources = additional_model_data_sources_;
     additional_s3_data_source = additional_s3_data_source_;
     model_data_e_tag = model_data_e_tag_;
     is_checkpoint = is_checkpoint_;
     base_model = base_model_;
   }
    : model_package_container_definition)

let make_additional_inference_specification_definition
    ?description:(description_ : entity_description option)
    ?supported_transform_instance_types:
      (supported_transform_instance_types_ : transform_instance_types option)
    ?supported_realtime_inference_instance_types:
      (supported_realtime_inference_instance_types_ : realtime_inference_instance_types option)
    ?supported_content_types:(supported_content_types_ : content_types option)
    ?supported_response_mime_types:(supported_response_mime_types_ : response_mime_types option)
    ~name:(name_ : entity_name) ~containers:(containers_ : model_package_container_definition_list)
    () =
  ({
     name = name_;
     description = description_;
     containers = containers_;
     supported_transform_instance_types = supported_transform_instance_types_;
     supported_realtime_inference_instance_types = supported_realtime_inference_instance_types_;
     supported_content_types = supported_content_types_;
     supported_response_mime_types = supported_response_mime_types_;
   }
    : additional_inference_specification_definition)

let make_agent_version ~version:(version_ : edge_version) ~agent_count:(agent_count_ : long) () =
  ({ version = version_; agent_count = agent_count_ } : agent_version)

let make_alarm ?alarm_name:(alarm_name_ : alarm_name option) () =
  ({ alarm_name = alarm_name_ } : alarm)

let make_alarm_details ~alarm_name:(alarm_name_ : alarm_name) () =
  ({ alarm_name = alarm_name_ } : alarm_details)

let make_training_repository_auth_config
    ~training_repository_credentials_provider_arn:
      (training_repository_credentials_provider_arn_ : training_repository_credentials_provider_arn)
    () =
  ({ training_repository_credentials_provider_arn = training_repository_credentials_provider_arn_ }
    : training_repository_auth_config)

let make_training_image_config
    ?training_repository_auth_config:
      (training_repository_auth_config_ : training_repository_auth_config option)
    ~training_repository_access_mode:
      (training_repository_access_mode_ : training_repository_access_mode) () =
  ({
     training_repository_access_mode = training_repository_access_mode_;
     training_repository_auth_config = training_repository_auth_config_;
   }
    : training_image_config)

let make_metric_definition ~name:(name_ : metric_name) ~regex:(regex_ : metric_regex) () =
  ({ name = name_; regex = regex_ } : metric_definition)

let make_algorithm_specification ?training_image:(training_image_ : algorithm_image option)
    ?algorithm_name:(algorithm_name_ : arn_or_name option)
    ?metric_definitions:(metric_definitions_ : metric_definition_list option)
    ?enable_sage_maker_metrics_time_series:
      (enable_sage_maker_metrics_time_series_ : boolean_ option)
    ?container_entrypoint:(container_entrypoint_ : training_container_entrypoint option)
    ?container_arguments:(container_arguments_ : training_container_arguments option)
    ?training_image_config:(training_image_config_ : training_image_config option)
    ~training_input_mode:(training_input_mode_ : training_input_mode) () =
  ({
     training_image = training_image_;
     algorithm_name = algorithm_name_;
     training_input_mode = training_input_mode_;
     metric_definitions = metric_definitions_;
     enable_sage_maker_metrics_time_series = enable_sage_maker_metrics_time_series_;
     container_entrypoint = container_entrypoint_;
     container_arguments = container_arguments_;
     training_image_config = training_image_config_;
   }
    : algorithm_specification)

let make_algorithm_status_item ?failure_reason:(failure_reason_ : string_ option)
    ~name:(name_ : entity_name) ~status:(status_ : detailed_algorithm_status) () =
  ({ name = name_; status = status_; failure_reason = failure_reason_ } : algorithm_status_item)

let make_algorithm_status_details
    ?validation_statuses:(validation_statuses_ : algorithm_status_item_list option)
    ?image_scan_statuses:(image_scan_statuses_ : algorithm_status_item_list option) () =
  ({ validation_statuses = validation_statuses_; image_scan_statuses = image_scan_statuses_ }
    : algorithm_status_details)

let make_algorithm_summary
    ?algorithm_description:(algorithm_description_ : entity_description option)
    ~algorithm_name:(algorithm_name_ : entity_name) ~algorithm_arn:(algorithm_arn_ : algorithm_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~algorithm_status:(algorithm_status_ : algorithm_status) () =
  ({
     algorithm_name = algorithm_name_;
     algorithm_arn = algorithm_arn_;
     algorithm_description = algorithm_description_;
     creation_time = creation_time_;
     algorithm_status = algorithm_status_;
   }
    : algorithm_summary)

let make_transform_resources ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?transform_ami_version:(transform_ami_version_ : transform_ami_version option)
    ~instance_type:(instance_type_ : transform_instance_type)
    ~instance_count:(instance_count_ : transform_instance_count) () =
  ({
     instance_type = instance_type_;
     instance_count = instance_count_;
     volume_kms_key_id = volume_kms_key_id_;
     transform_ami_version = transform_ami_version_;
   }
    : transform_resources)

let make_transform_output ?accept:(accept_ : accept option)
    ?assemble_with:(assemble_with_ : assembly_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({
     s3_output_path = s3_output_path_;
     accept = accept_;
     assemble_with = assemble_with_;
     kms_key_id = kms_key_id_;
   }
    : transform_output)

let make_transform_s3_data_source ~s3_data_type:(s3_data_type_ : s3_data_type)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_data_type = s3_data_type_; s3_uri = s3_uri_ } : transform_s3_data_source)

let make_transform_data_source ~s3_data_source:(s3_data_source_ : transform_s3_data_source) () =
  ({ s3_data_source = s3_data_source_ } : transform_data_source)

let make_transform_input ?content_type:(content_type_ : content_type option)
    ?compression_type:(compression_type_ : compression_type option)
    ?split_type:(split_type_ : split_type option)
    ~data_source:(data_source_ : transform_data_source) () =
  ({
     data_source = data_source_;
     content_type = content_type_;
     compression_type = compression_type_;
     split_type = split_type_;
   }
    : transform_input)

let make_transform_job_definition
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?environment:(environment_ : transform_environment_map option)
    ~transform_input:(transform_input_ : transform_input)
    ~transform_output:(transform_output_ : transform_output)
    ~transform_resources:(transform_resources_ : transform_resources) () =
  ({
     max_concurrent_transforms = max_concurrent_transforms_;
     max_payload_in_m_b = max_payload_in_m_b_;
     batch_strategy = batch_strategy_;
     environment = environment_;
     transform_input = transform_input_;
     transform_output = transform_output_;
     transform_resources = transform_resources_;
   }
    : transform_job_definition)

let make_stopping_condition
    ?max_runtime_in_seconds:(max_runtime_in_seconds_ : max_runtime_in_seconds option)
    ?max_wait_time_in_seconds:(max_wait_time_in_seconds_ : max_wait_time_in_seconds option)
    ?max_pending_time_in_seconds:(max_pending_time_in_seconds_ : max_pending_time_in_seconds option)
    () =
  ({
     max_runtime_in_seconds = max_runtime_in_seconds_;
     max_wait_time_in_seconds = max_wait_time_in_seconds_;
     max_pending_time_in_seconds = max_pending_time_in_seconds_;
   }
    : stopping_condition)

let make_placement_specification ?ultra_server_id:(ultra_server_id_ : string256 option)
    ~instance_count:(instance_count_ : training_instance_count) () =
  ({ ultra_server_id = ultra_server_id_; instance_count = instance_count_ }
    : placement_specification)

let make_instance_placement_config ?enable_multiple_jobs:(enable_multiple_jobs_ : boolean_ option)
    ?placement_specifications:(placement_specifications_ : placement_specifications option) () =
  ({
     enable_multiple_jobs = enable_multiple_jobs_;
     placement_specifications = placement_specifications_;
   }
    : instance_placement_config)

let make_instance_group ~instance_type:(instance_type_ : training_instance_type)
    ~instance_count:(instance_count_ : training_instance_count)
    ~instance_group_name:(instance_group_name_ : instance_group_name) () =
  ({
     instance_type = instance_type_;
     instance_count = instance_count_;
     instance_group_name = instance_group_name_;
   }
    : instance_group)

let make_resource_config ?instance_type:(instance_type_ : training_instance_type option)
    ?instance_count:(instance_count_ : training_instance_count option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?keep_alive_period_in_seconds:
      (keep_alive_period_in_seconds_ : keep_alive_period_in_seconds option)
    ?instance_groups:(instance_groups_ : instance_groups option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?instance_placement_config:(instance_placement_config_ : instance_placement_config option) () =
  ({
     instance_type = instance_type_;
     instance_count = instance_count_;
     volume_size_in_g_b = volume_size_in_g_b_;
     volume_kms_key_id = volume_kms_key_id_;
     keep_alive_period_in_seconds = keep_alive_period_in_seconds_;
     instance_groups = instance_groups_;
     training_plan_arn = training_plan_arn_;
     instance_placement_config = instance_placement_config_;
   }
    : resource_config)

let make_output_data_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?compression_type:(compression_type_ : output_compression_type option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({
     kms_key_id = kms_key_id_;
     s3_output_path = s3_output_path_;
     compression_type = compression_type_;
   }
    : output_data_config)

let make_shuffle_config ~seed:(seed_ : seed) () = ({ seed = seed_ } : shuffle_config)

let make_dataset_source ~dataset_arn:(dataset_arn_ : hub_data_set_arn) () =
  ({ dataset_arn = dataset_arn_ } : dataset_source)

let make_file_system_data_source ~file_system_id:(file_system_id_ : file_system_id)
    ~file_system_access_mode:(file_system_access_mode_ : file_system_access_mode)
    ~file_system_type:(file_system_type_ : file_system_type)
    ~directory_path:(directory_path_ : directory_path) () =
  ({
     file_system_id = file_system_id_;
     file_system_access_mode = file_system_access_mode_;
     file_system_type = file_system_type_;
     directory_path = directory_path_;
   }
    : file_system_data_source)

let make_hub_access_config ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_content_arn = hub_content_arn_ } : hub_access_config)

let make_s3_data_source
    ?s3_data_distribution_type:(s3_data_distribution_type_ : s3_data_distribution option)
    ?attribute_names:(attribute_names_ : attribute_names option)
    ?instance_group_names:(instance_group_names_ : instance_group_names option)
    ?model_access_config:(model_access_config_ : model_access_config option)
    ?hub_access_config:(hub_access_config_ : hub_access_config option)
    ~s3_data_type:(s3_data_type_ : s3_data_type) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({
     s3_data_type = s3_data_type_;
     s3_uri = s3_uri_;
     s3_data_distribution_type = s3_data_distribution_type_;
     attribute_names = attribute_names_;
     instance_group_names = instance_group_names_;
     model_access_config = model_access_config_;
     hub_access_config = hub_access_config_;
   }
    : s3_data_source)

let make_data_source ?s3_data_source:(s3_data_source_ : s3_data_source option)
    ?file_system_data_source:(file_system_data_source_ : file_system_data_source option)
    ?dataset_source:(dataset_source_ : dataset_source option) () =
  ({
     s3_data_source = s3_data_source_;
     file_system_data_source = file_system_data_source_;
     dataset_source = dataset_source_;
   }
    : data_source)

let make_channel ?content_type:(content_type_ : content_type option)
    ?compression_type:(compression_type_ : compression_type option)
    ?record_wrapper_type:(record_wrapper_type_ : record_wrapper option)
    ?input_mode:(input_mode_ : training_input_mode option)
    ?shuffle_config:(shuffle_config_ : shuffle_config option)
    ~channel_name:(channel_name_ : channel_name) ~data_source:(data_source_ : data_source) () =
  ({
     channel_name = channel_name_;
     data_source = data_source_;
     content_type = content_type_;
     compression_type = compression_type_;
     record_wrapper_type = record_wrapper_type_;
     input_mode = input_mode_;
     shuffle_config = shuffle_config_;
   }
    : channel)

let make_training_job_definition ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ~training_input_mode:(training_input_mode_ : training_input_mode)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~output_data_config:(output_data_config_ : output_data_config)
    ~resource_config:(resource_config_ : resource_config)
    ~stopping_condition:(stopping_condition_ : stopping_condition) () =
  ({
     training_input_mode = training_input_mode_;
     hyper_parameters = hyper_parameters_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     resource_config = resource_config_;
     stopping_condition = stopping_condition_;
   }
    : training_job_definition)

let make_algorithm_validation_profile
    ?transform_job_definition:(transform_job_definition_ : transform_job_definition option)
    ~profile_name:(profile_name_ : entity_name)
    ~training_job_definition:(training_job_definition_ : training_job_definition) () =
  ({
     profile_name = profile_name_;
     training_job_definition = training_job_definition_;
     transform_job_definition = transform_job_definition_;
   }
    : algorithm_validation_profile)

let make_algorithm_validation_specification ~validation_role:(validation_role_ : role_arn)
    ~validation_profiles:(validation_profiles_ : algorithm_validation_profiles) () =
  ({ validation_role = validation_role_; validation_profiles = validation_profiles_ }
    : algorithm_validation_specification)

let make_amazon_q_settings ?status:(status_ : feature_status option)
    ?q_profile_arn:(q_profile_arn_ : q_profile_arn option) () =
  ({ status = status_; q_profile_arn = q_profile_arn_ } : amazon_q_settings)

let make_annotation_consolidation_config
    ~annotation_consolidation_lambda_arn:
      (annotation_consolidation_lambda_arn_ : lambda_function_arn) () =
  ({ annotation_consolidation_lambda_arn = annotation_consolidation_lambda_arn_ }
    : annotation_consolidation_config)

let make_resource_spec ?sage_maker_image_arn:(sage_maker_image_arn_ : image_arn option)
    ?sage_maker_image_version_arn:(sage_maker_image_version_arn_ : image_version_arn option)
    ?sage_maker_image_version_alias:(sage_maker_image_version_alias_ : image_version_alias option)
    ?instance_type:(instance_type_ : app_instance_type option)
    ?lifecycle_config_arn:(lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    ?training_plan_arn:(training_plan_arn_ : studio_resource_spec_training_plan_arn option) () =
  ({
     sage_maker_image_arn = sage_maker_image_arn_;
     sage_maker_image_version_arn = sage_maker_image_version_arn_;
     sage_maker_image_version_alias = sage_maker_image_version_alias_;
     instance_type = instance_type_;
     lifecycle_config_arn = lifecycle_config_arn_;
     training_plan_arn = training_plan_arn_;
   }
    : resource_spec)

let make_app_details ?domain_id:(domain_id_ : domain_id option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?space_name:(space_name_ : space_name option) ?app_type:(app_type_ : app_type option)
    ?app_name:(app_name_ : app_name option) ?status:(status_ : app_status option)
    ?creation_time:(creation_time_ : creation_time option)
    ?resource_spec:(resource_spec_ : resource_spec option) () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     space_name = space_name_;
     app_type = app_type_;
     app_name = app_name_;
     status = status_;
     creation_time = creation_time_;
     resource_spec = resource_spec_;
   }
    : app_details)

let make_container_config
    ?container_arguments:(container_arguments_ : custom_image_container_arguments option)
    ?container_entrypoint:(container_entrypoint_ : custom_image_container_entrypoint option)
    ?container_environment_variables:
      (container_environment_variables_ : custom_image_container_environment_variables option) () =
  ({
     container_arguments = container_arguments_;
     container_entrypoint = container_entrypoint_;
     container_environment_variables = container_environment_variables_;
   }
    : container_config)

let make_file_system_config ?mount_path:(mount_path_ : mount_path option)
    ?default_uid:(default_uid_ : default_uid option)
    ?default_gid:(default_gid_ : default_gid option) () =
  ({ mount_path = mount_path_; default_uid = default_uid_; default_gid = default_gid_ }
    : file_system_config)

let make_code_editor_app_image_config
    ?file_system_config:(file_system_config_ : file_system_config option)
    ?container_config:(container_config_ : container_config option) () =
  ({ file_system_config = file_system_config_; container_config = container_config_ }
    : code_editor_app_image_config)

let make_jupyter_lab_app_image_config
    ?file_system_config:(file_system_config_ : file_system_config option)
    ?container_config:(container_config_ : container_config option) () =
  ({ file_system_config = file_system_config_; container_config = container_config_ }
    : jupyter_lab_app_image_config)

let make_kernel_spec ?display_name:(display_name_ : kernel_display_name option)
    ~name:(name_ : kernel_name) () =
  ({ name = name_; display_name = display_name_ } : kernel_spec)

let make_kernel_gateway_image_config
    ?file_system_config:(file_system_config_ : file_system_config option)
    ~kernel_specs:(kernel_specs_ : kernel_specs) () =
  ({ kernel_specs = kernel_specs_; file_system_config = file_system_config_ }
    : kernel_gateway_image_config)

let make_app_image_config_details
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option)
    ?app_image_config_name:(app_image_config_name_ : app_image_config_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option) () =
  ({
     app_image_config_arn = app_image_config_arn_;
     app_image_config_name = app_image_config_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     code_editor_app_image_config = code_editor_app_image_config_;
   }
    : app_image_config_details)

let make_idle_settings ?lifecycle_management:(lifecycle_management_ : lifecycle_management option)
    ?idle_timeout_in_minutes:(idle_timeout_in_minutes_ : idle_timeout_in_minutes option)
    ?min_idle_timeout_in_minutes:(min_idle_timeout_in_minutes_ : idle_timeout_in_minutes option)
    ?max_idle_timeout_in_minutes:(max_idle_timeout_in_minutes_ : idle_timeout_in_minutes option) ()
    =
  ({
     lifecycle_management = lifecycle_management_;
     idle_timeout_in_minutes = idle_timeout_in_minutes_;
     min_idle_timeout_in_minutes = min_idle_timeout_in_minutes_;
     max_idle_timeout_in_minutes = max_idle_timeout_in_minutes_;
   }
    : idle_settings)

let make_app_lifecycle_management ?idle_settings:(idle_settings_ : idle_settings option) () =
  ({ idle_settings = idle_settings_ } : app_lifecycle_management)

let make_app_specification
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ?container_arguments:(container_arguments_ : container_arguments option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     image_uri = image_uri_;
     container_entrypoint = container_entrypoint_;
     container_arguments = container_arguments_;
   }
    : app_specification)

let make_artifact_source_type ~source_id_type:(source_id_type_ : artifact_source_id_type)
    ~value:(value_ : string256) () =
  ({ source_id_type = source_id_type_; value = value_ } : artifact_source_type)

let make_artifact_source ?source_types:(source_types_ : artifact_source_types option)
    ~source_uri:(source_uri_ : source_uri) () =
  ({ source_uri = source_uri_; source_types = source_types_ } : artifact_source)

let make_artifact_summary ?artifact_arn:(artifact_arn_ : artifact_arn option)
    ?artifact_name:(artifact_name_ : experiment_entity_name option)
    ?source:(source_ : artifact_source option) ?artifact_type:(artifact_type_ : string256 option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     artifact_arn = artifact_arn_;
     artifact_name = artifact_name_;
     source = source_;
     artifact_type = artifact_type_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : artifact_summary)

let make_associate_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_component_arn = trial_component_arn_; trial_arn = trial_arn_ }
    : associate_trial_component_response)

let make_associate_trial_component_request
    ~trial_component_name:(trial_component_name_ : experiment_entity_name)
    ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ trial_component_name = trial_component_name_; trial_name = trial_name_ }
    : associate_trial_component_request)

let make_association_info ~source_arn:(source_arn_ : string2048)
    ~destination_arn:(destination_arn_ : string2048) () =
  ({ source_arn = source_arn_; destination_arn = destination_arn_ } : association_info)

let make_iam_identity ?arn:(arn_ : string_ option) ?principal_id:(principal_id_ : string_ option)
    ?source_identity:(source_identity_ : string_ option) () =
  ({ arn = arn_; principal_id = principal_id_; source_identity = source_identity_ } : iam_identity)

let make_user_context ?user_profile_arn:(user_profile_arn_ : string_ option)
    ?user_profile_name:(user_profile_name_ : string_ option)
    ?domain_id:(domain_id_ : string_ option) ?iam_identity:(iam_identity_ : iam_identity option) ()
    =
  ({
     user_profile_arn = user_profile_arn_;
     user_profile_name = user_profile_name_;
     domain_id = domain_id_;
     iam_identity = iam_identity_;
   }
    : user_context)

let make_association_summary ?source_arn:(source_arn_ : association_entity_arn option)
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?source_type:(source_type_ : string256 option)
    ?destination_type:(destination_type_ : string256 option)
    ?association_type:(association_type_ : association_edge_type option)
    ?source_name:(source_name_ : experiment_entity_name option)
    ?destination_name:(destination_name_ : experiment_entity_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option) () =
  ({
     source_arn = source_arn_;
     destination_arn = destination_arn_;
     source_type = source_type_;
     destination_type = destination_type_;
     association_type = association_type_;
     source_name = source_name_;
     destination_name = destination_name_;
     creation_time = creation_time_;
     created_by = created_by_;
   }
    : association_summary)

let make_async_inference_client_config
    ?max_concurrent_invocations_per_instance:
      (max_concurrent_invocations_per_instance_ : max_concurrent_invocations_per_instance option) ()
    =
  ({ max_concurrent_invocations_per_instance = max_concurrent_invocations_per_instance_ }
    : async_inference_client_config)

let make_async_inference_notification_config ?success_topic:(success_topic_ : sns_topic_arn option)
    ?error_topic:(error_topic_ : sns_topic_arn option)
    ?include_inference_response_in:
      (include_inference_response_in_ : async_notification_topic_type_list option) () =
  ({
     success_topic = success_topic_;
     error_topic = error_topic_;
     include_inference_response_in = include_inference_response_in_;
   }
    : async_inference_notification_config)

let make_async_inference_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?s3_output_path:(s3_output_path_ : destination_s3_uri option)
    ?notification_config:(notification_config_ : async_inference_notification_config option)
    ?s3_failure_path:(s3_failure_path_ : destination_s3_uri option) () =
  ({
     kms_key_id = kms_key_id_;
     s3_output_path = s3_output_path_;
     notification_config = notification_config_;
     s3_failure_path = s3_failure_path_;
   }
    : async_inference_output_config)

let make_async_inference_config
    ?client_config:(client_config_ : async_inference_client_config option)
    ~output_config:(output_config_ : async_inference_output_config) () =
  ({ client_config = client_config_; output_config = output_config_ } : async_inference_config)

let make_athena_dataset_definition ?work_group:(work_group_ : athena_work_group option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?output_compression:(output_compression_ : athena_result_compression_type option)
    ~catalog:(catalog_ : athena_catalog) ~database:(database_ : athena_database)
    ~query_string:(query_string_ : athena_query_string) ~output_s3_uri:(output_s3_uri_ : s3_uri)
    ~output_format:(output_format_ : athena_result_format) () =
  ({
     catalog = catalog_;
     database = database_;
     query_string = query_string_;
     work_group = work_group_;
     output_s3_uri = output_s3_uri_;
     kms_key_id = kms_key_id_;
     output_format = output_format_;
     output_compression = output_compression_;
   }
    : athena_dataset_definition)

let make_attach_cluster_node_volume_response ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~node_id:(node_id_ : cluster_node_id) ~volume_id:(volume_id_ : volume_id)
    ~attach_time:(attach_time_ : timestamp) ~status:(status_ : volume_attachment_status)
    ~device_name:(device_name_ : volume_device_name) () =
  ({
     cluster_arn = cluster_arn_;
     node_id = node_id_;
     volume_id = volume_id_;
     attach_time = attach_time_;
     status = status_;
     device_name = device_name_;
   }
    : attach_cluster_node_volume_response)

let make_attach_cluster_node_volume_request ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~node_id:(node_id_ : cluster_node_id) ~volume_id:(volume_id_ : volume_id) () =
  ({ cluster_arn = cluster_arn_; node_id = node_id_; volume_id = volume_id_ }
    : attach_cluster_node_volume_request)

let make_authorized_url ?url:(url_ : long_s3_uri option)
    ?local_path:(local_path_ : local_path option) () =
  ({ url = url_; local_path = local_path_ } : authorized_url)

let make_auto_ml_algorithm_config ~auto_ml_algorithms:(auto_ml_algorithms_ : auto_ml_algorithms) ()
    =
  ({ auto_ml_algorithms = auto_ml_algorithms_ } : auto_ml_algorithm_config)

let make_auto_ml_container_definition ?environment:(environment_ : environment_map option)
    ~image:(image_ : container_image) ~model_data_url:(model_data_url_ : url) () =
  ({ image = image_; model_data_url = model_data_url_; environment = environment_ }
    : auto_ml_container_definition)

let make_metric_datum ?metric_name:(metric_name_ : auto_ml_metric_enum option)
    ?standard_metric_name:(standard_metric_name_ : auto_ml_metric_extended_enum option)
    ?value:(value_ : float_ option) ?set:(set_ : metric_set_source option) () =
  ({
     metric_name = metric_name_;
     standard_metric_name = standard_metric_name_;
     value = value_;
     set = set_;
   }
    : metric_datum)

let make_candidate_artifact_locations
    ?model_insights:(model_insights_ : model_insights_location option)
    ?backtest_results:(backtest_results_ : backtest_results_location option)
    ~explainability:(explainability_ : explainability_location) () =
  ({
     explainability = explainability_;
     model_insights = model_insights_;
     backtest_results = backtest_results_;
   }
    : candidate_artifact_locations)

let make_candidate_properties
    ?candidate_artifact_locations:
      (candidate_artifact_locations_ : candidate_artifact_locations option)
    ?candidate_metrics:(candidate_metrics_ : metric_data_list option) () =
  ({
     candidate_artifact_locations = candidate_artifact_locations_;
     candidate_metrics = candidate_metrics_;
   }
    : candidate_properties)

let make_auto_ml_candidate_step ~candidate_step_type:(candidate_step_type_ : candidate_step_type)
    ~candidate_step_arn:(candidate_step_arn_ : candidate_step_arn)
    ~candidate_step_name:(candidate_step_name_ : candidate_step_name) () =
  ({
     candidate_step_type = candidate_step_type_;
     candidate_step_arn = candidate_step_arn_;
     candidate_step_name = candidate_step_name_;
   }
    : auto_ml_candidate_step)

let make_final_auto_ml_job_objective_metric ?type_:(type__ : auto_ml_job_objective_type option)
    ?standard_metric_name:(standard_metric_name_ : auto_ml_metric_enum option)
    ~metric_name:(metric_name_ : auto_ml_metric_enum) ~value:(value_ : metric_value) () =
  ({
     type_ = type__;
     metric_name = metric_name_;
     value = value_;
     standard_metric_name = standard_metric_name_;
   }
    : final_auto_ml_job_objective_metric)

let make_auto_ml_candidate
    ?final_auto_ml_job_objective_metric:
      (final_auto_ml_job_objective_metric_ : final_auto_ml_job_objective_metric option)
    ?inference_containers:(inference_containers_ : auto_ml_container_definitions option)
    ?end_time:(end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?candidate_properties:(candidate_properties_ : candidate_properties option)
    ?inference_container_definitions:
      (inference_container_definitions_ : auto_ml_inference_container_definitions option)
    ~candidate_name:(candidate_name_ : candidate_name)
    ~objective_status:(objective_status_ : objective_status)
    ~candidate_steps:(candidate_steps_ : candidate_steps)
    ~candidate_status:(candidate_status_ : candidate_status)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     candidate_name = candidate_name_;
     final_auto_ml_job_objective_metric = final_auto_ml_job_objective_metric_;
     objective_status = objective_status_;
     candidate_steps = candidate_steps_;
     candidate_status = candidate_status_;
     inference_containers = inference_containers_;
     creation_time = creation_time_;
     end_time = end_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     candidate_properties = candidate_properties_;
     inference_container_definitions = inference_container_definitions_;
   }
    : auto_ml_candidate)

let make_auto_ml_candidate_generation_config
    ?feature_specification_s3_uri:(feature_specification_s3_uri_ : s3_uri option)
    ?algorithms_config:(algorithms_config_ : auto_ml_algorithms_config option) () =
  ({
     feature_specification_s3_uri = feature_specification_s3_uri_;
     algorithms_config = algorithms_config_;
   }
    : auto_ml_candidate_generation_config)

let make_auto_mls3_data_source ~s3_data_type:(s3_data_type_ : auto_mls3_data_type)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_data_type = s3_data_type_; s3_uri = s3_uri_ } : auto_mls3_data_source)

let make_auto_ml_data_source ~s3_data_source:(s3_data_source_ : auto_mls3_data_source) () =
  ({ s3_data_source = s3_data_source_ } : auto_ml_data_source)

let make_auto_ml_channel ?data_source:(data_source_ : auto_ml_data_source option)
    ?compression_type:(compression_type_ : compression_type option)
    ?content_type:(content_type_ : content_type option)
    ?channel_type:(channel_type_ : auto_ml_channel_type option)
    ?sample_weight_attribute_name:
      (sample_weight_attribute_name_ : sample_weight_attribute_name option)
    ~target_attribute_name:(target_attribute_name_ : target_attribute_name) () =
  ({
     data_source = data_source_;
     compression_type = compression_type_;
     target_attribute_name = target_attribute_name_;
     content_type = content_type_;
     channel_type = channel_type_;
     sample_weight_attribute_name = sample_weight_attribute_name_;
   }
    : auto_ml_channel)

let make_emr_serverless_compute_config ~execution_role_ar_n:(execution_role_ar_n_ : role_arn) () =
  ({ execution_role_ar_n = execution_role_ar_n_ } : emr_serverless_compute_config)

let make_auto_ml_compute_config
    ?emr_serverless_compute_config:
      (emr_serverless_compute_config_ : emr_serverless_compute_config option) () =
  ({ emr_serverless_compute_config = emr_serverless_compute_config_ } : auto_ml_compute_config)

let make_auto_ml_data_split_config
    ?validation_fraction:(validation_fraction_ : validation_fraction option) () =
  ({ validation_fraction = validation_fraction_ } : auto_ml_data_split_config)

let make_auto_ml_job_artifacts
    ?candidate_definition_notebook_location:
      (candidate_definition_notebook_location_ : candidate_definition_notebook_location option)
    ?data_exploration_notebook_location:
      (data_exploration_notebook_location_ : data_exploration_notebook_location option) () =
  ({
     candidate_definition_notebook_location = candidate_definition_notebook_location_;
     data_exploration_notebook_location = data_exploration_notebook_location_;
   }
    : auto_ml_job_artifacts)

let make_auto_ml_job_channel ?channel_type:(channel_type_ : auto_ml_channel_type option)
    ?content_type:(content_type_ : content_type option)
    ?compression_type:(compression_type_ : compression_type option)
    ?data_source:(data_source_ : auto_ml_data_source option) () =
  ({
     channel_type = channel_type_;
     content_type = content_type_;
     compression_type = compression_type_;
     data_source = data_source_;
   }
    : auto_ml_job_channel)

let make_auto_ml_job_completion_criteria ?max_candidates:(max_candidates_ : max_candidates option)
    ?max_runtime_per_training_job_in_seconds:
      (max_runtime_per_training_job_in_seconds_ : max_runtime_per_training_job_in_seconds option)
    ?max_auto_ml_job_runtime_in_seconds:
      (max_auto_ml_job_runtime_in_seconds_ : max_auto_ml_job_runtime_in_seconds option) () =
  ({
     max_candidates = max_candidates_;
     max_runtime_per_training_job_in_seconds = max_runtime_per_training_job_in_seconds_;
     max_auto_ml_job_runtime_in_seconds = max_auto_ml_job_runtime_in_seconds_;
   }
    : auto_ml_job_completion_criteria)

let make_auto_ml_security_config ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?vpc_config:(vpc_config_ : vpc_config option) () =
  ({
     volume_kms_key_id = volume_kms_key_id_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     vpc_config = vpc_config_;
   }
    : auto_ml_security_config)

let make_auto_ml_job_config
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?security_config:(security_config_ : auto_ml_security_config option)
    ?candidate_generation_config:
      (candidate_generation_config_ : auto_ml_candidate_generation_config option)
    ?data_split_config:(data_split_config_ : auto_ml_data_split_config option)
    ?mode:(mode_ : auto_ml_mode option) () =
  ({
     completion_criteria = completion_criteria_;
     security_config = security_config_;
     candidate_generation_config = candidate_generation_config_;
     data_split_config = data_split_config_;
     mode = mode_;
   }
    : auto_ml_job_config)

let make_auto_ml_job_objective ~metric_name:(metric_name_ : auto_ml_metric_enum) () =
  ({ metric_name = metric_name_ } : auto_ml_job_objective)

let make_auto_ml_job_step_metadata ?arn:(arn_ : auto_ml_job_arn option) () =
  ({ arn = arn_ } : auto_ml_job_step_metadata)

let make_auto_ml_partial_failure_reason
    ?partial_failure_message:(partial_failure_message_ : auto_ml_failure_reason option) () =
  ({ partial_failure_message = partial_failure_message_ } : auto_ml_partial_failure_reason)

let make_auto_ml_job_summary ?end_time:(end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?partial_failure_reasons:(partial_failure_reasons_ : auto_ml_partial_failure_reasons option)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name)
    ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn)
    ~auto_ml_job_status:(auto_ml_job_status_ : auto_ml_job_status)
    ~auto_ml_job_secondary_status:(auto_ml_job_secondary_status_ : auto_ml_job_secondary_status)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     auto_ml_job_name = auto_ml_job_name_;
     auto_ml_job_arn = auto_ml_job_arn_;
     auto_ml_job_status = auto_ml_job_status_;
     auto_ml_job_secondary_status = auto_ml_job_secondary_status_;
     creation_time = creation_time_;
     end_time = end_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     partial_failure_reasons = partial_failure_reasons_;
   }
    : auto_ml_job_summary)

let make_auto_ml_output_data_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ kms_key_id = kms_key_id_; s3_output_path = s3_output_path_ } : auto_ml_output_data_config)

let make_text_generation_job_config
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?base_model_name:(base_model_name_ : base_model_name option)
    ?text_generation_hyper_parameters:
      (text_generation_hyper_parameters_ : text_generation_hyper_parameters option)
    ?model_access_config:(model_access_config_ : model_access_config option) () =
  ({
     completion_criteria = completion_criteria_;
     base_model_name = base_model_name_;
     text_generation_hyper_parameters = text_generation_hyper_parameters_;
     model_access_config = model_access_config_;
   }
    : text_generation_job_config)

let make_candidate_generation_config
    ?algorithms_config:(algorithms_config_ : auto_ml_algorithms_config option) () =
  ({ algorithms_config = algorithms_config_ } : candidate_generation_config)

let make_tabular_job_config
    ?candidate_generation_config:(candidate_generation_config_ : candidate_generation_config option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?feature_specification_s3_uri:(feature_specification_s3_uri_ : s3_uri option)
    ?mode:(mode_ : auto_ml_mode option)
    ?generate_candidate_definitions_only:
      (generate_candidate_definitions_only_ : generate_candidate_definitions_only option)
    ?problem_type:(problem_type_ : problem_type option)
    ?sample_weight_attribute_name:
      (sample_weight_attribute_name_ : sample_weight_attribute_name option)
    ~target_attribute_name:(target_attribute_name_ : target_attribute_name) () =
  ({
     candidate_generation_config = candidate_generation_config_;
     completion_criteria = completion_criteria_;
     feature_specification_s3_uri = feature_specification_s3_uri_;
     mode = mode_;
     generate_candidate_definitions_only = generate_candidate_definitions_only_;
     problem_type = problem_type_;
     target_attribute_name = target_attribute_name_;
     sample_weight_attribute_name = sample_weight_attribute_name_;
   }
    : tabular_job_config)

let make_holiday_config_attributes ?country_code:(country_code_ : country_code option) () =
  ({ country_code = country_code_ } : holiday_config_attributes)

let make_time_series_config
    ?grouping_attribute_names:(grouping_attribute_names_ : grouping_attribute_names option)
    ~target_attribute_name:(target_attribute_name_ : target_attribute_name)
    ~timestamp_attribute_name:(timestamp_attribute_name_ : timestamp_attribute_name)
    ~item_identifier_attribute_name:
      (item_identifier_attribute_name_ : item_identifier_attribute_name) () =
  ({
     target_attribute_name = target_attribute_name_;
     timestamp_attribute_name = timestamp_attribute_name_;
     item_identifier_attribute_name = item_identifier_attribute_name_;
     grouping_attribute_names = grouping_attribute_names_;
   }
    : time_series_config)

let make_time_series_transformations ?filling:(filling_ : filling_transformations option)
    ?aggregation:(aggregation_ : aggregation_transformations option) () =
  ({ filling = filling_; aggregation = aggregation_ } : time_series_transformations)

let make_time_series_forecasting_job_config
    ?feature_specification_s3_uri:(feature_specification_s3_uri_ : s3_uri option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?forecast_quantiles:(forecast_quantiles_ : forecast_quantiles option)
    ?transformations:(transformations_ : time_series_transformations option)
    ?holiday_config:(holiday_config_ : holiday_config option)
    ?candidate_generation_config:(candidate_generation_config_ : candidate_generation_config option)
    ~forecast_frequency:(forecast_frequency_ : forecast_frequency)
    ~forecast_horizon:(forecast_horizon_ : forecast_horizon)
    ~time_series_config:(time_series_config_ : time_series_config) () =
  ({
     feature_specification_s3_uri = feature_specification_s3_uri_;
     completion_criteria = completion_criteria_;
     forecast_frequency = forecast_frequency_;
     forecast_horizon = forecast_horizon_;
     forecast_quantiles = forecast_quantiles_;
     transformations = transformations_;
     time_series_config = time_series_config_;
     holiday_config = holiday_config_;
     candidate_generation_config = candidate_generation_config_;
   }
    : time_series_forecasting_job_config)

let make_text_classification_job_config
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ~content_column:(content_column_ : content_column)
    ~target_label_column:(target_label_column_ : target_label_column) () =
  ({
     completion_criteria = completion_criteria_;
     content_column = content_column_;
     target_label_column = target_label_column_;
   }
    : text_classification_job_config)

let make_image_classification_job_config
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option) () =
  ({ completion_criteria = completion_criteria_ } : image_classification_job_config)

let make_text_generation_resolved_attributes
    ?base_model_name:(base_model_name_ : base_model_name option) () =
  ({ base_model_name = base_model_name_ } : text_generation_resolved_attributes)

let make_tabular_resolved_attributes ?problem_type:(problem_type_ : problem_type option) () =
  ({ problem_type = problem_type_ } : tabular_resolved_attributes)

let make_auto_ml_resolved_attributes
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option)
    ?auto_ml_problem_type_resolved_attributes:
      (auto_ml_problem_type_resolved_attributes_ : auto_ml_problem_type_resolved_attributes option)
    () =
  ({
     auto_ml_job_objective = auto_ml_job_objective_;
     completion_criteria = completion_criteria_;
     auto_ml_problem_type_resolved_attributes = auto_ml_problem_type_resolved_attributes_;
   }
    : auto_ml_resolved_attributes)

let make_auto_parameter ~name:(name_ : parameter_key) ~value_hint:(value_hint_ : parameter_value) ()
    =
  ({ name = name_; value_hint = value_hint_ } : auto_parameter)

let make_auto_rollback_config ?alarms:(alarms_ : alarm_list option) () =
  ({ alarms = alarms_ } : auto_rollback_config)

let make_autotune ~mode:(mode_ : autotune_mode) () = ({ mode = mode_ } : autotune)

let make_available_upgrade ?version:(version_ : major_minor_version option)
    ?release_notes:(release_notes_ : release_notes_list option) () =
  ({ version = version_; release_notes = release_notes_ } : available_upgrade)

let make_batch_add_cluster_nodes_error
    ?availability_zones:(availability_zones_ : cluster_availability_zones option)
    ?instance_types:(instance_types_ : cluster_instance_types option)
    ?message:(message_ : string_ option)
    ~instance_group_name:(instance_group_name_ : instance_group_name)
    ~error_code:(error_code_ : batch_add_cluster_nodes_error_code)
    ~failed_count:(failed_count_ : batch_add_failure_count) () =
  ({
     instance_group_name = instance_group_name_;
     error_code = error_code_;
     failed_count = failed_count_;
     availability_zones = availability_zones_;
     instance_types = instance_types_;
     message = message_;
   }
    : batch_add_cluster_nodes_error)

let make_batch_add_cluster_nodes_response ~successful:(successful_ : node_addition_result_list)
    ~failed:(failed_ : batch_add_cluster_nodes_error_list) () =
  ({ successful = successful_; failed = failed_ } : batch_add_cluster_nodes_response)

let make_batch_add_cluster_nodes_request ?client_token:(client_token_ : string_ option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn)
    ~nodes_to_add:(nodes_to_add_ : add_cluster_node_specification_list) () =
  ({ cluster_name = cluster_name_; client_token = client_token_; nodes_to_add = nodes_to_add_ }
    : batch_add_cluster_nodes_request)

let make_batch_data_capture_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?generate_inference_id:(generate_inference_id_ : boolean_ option)
    ~destination_s3_uri:(destination_s3_uri_ : s3_uri) () =
  ({
     destination_s3_uri = destination_s3_uri_;
     kms_key_id = kms_key_id_;
     generate_inference_id = generate_inference_id_;
   }
    : batch_data_capture_config)

let make_batch_delete_cluster_node_logical_ids_error
    ~code:(code_ : batch_delete_cluster_nodes_error_code) ~message:(message_ : string_)
    ~node_logical_id:(node_logical_id_ : cluster_node_logical_id) () =
  ({ code = code_; message = message_; node_logical_id = node_logical_id_ }
    : batch_delete_cluster_node_logical_ids_error)

let make_batch_delete_cluster_nodes_error ~code:(code_ : batch_delete_cluster_nodes_error_code)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) ~node_id:(node_id_ : cluster_node_id)
    () =
  ({ code = code_; message = message_; node_id = node_id_ } : batch_delete_cluster_nodes_error)

let make_batch_delete_cluster_nodes_response
    ?failed:(failed_ : batch_delete_cluster_nodes_error_list option)
    ?successful:(successful_ : cluster_node_ids option)
    ?failed_node_logical_ids:
      (failed_node_logical_ids_ : batch_delete_cluster_node_logical_ids_error_list option)
    ?successful_node_logical_ids:
      (successful_node_logical_ids_ : cluster_node_logical_id_list option) () =
  ({
     failed = failed_;
     successful = successful_;
     failed_node_logical_ids = failed_node_logical_ids_;
     successful_node_logical_ids = successful_node_logical_ids_;
   }
    : batch_delete_cluster_nodes_response)

let make_batch_delete_cluster_nodes_request ?node_ids:(node_ids_ : cluster_node_ids option)
    ?node_logical_ids:(node_logical_ids_ : cluster_node_logical_id_list option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_; node_ids = node_ids_; node_logical_ids = node_logical_ids_ }
    : batch_delete_cluster_nodes_request)

let make_batch_describe_model_package_error ~error_code:(error_code_ : string_)
    ~error_response:(error_response_ : string_) () =
  ({ error_code = error_code_; error_response = error_response_ }
    : batch_describe_model_package_error)

let make_inference_specification
    ?supported_transform_instance_types:
      (supported_transform_instance_types_ : transform_instance_types option)
    ?supported_realtime_inference_instance_types:
      (supported_realtime_inference_instance_types_ : realtime_inference_instance_types option)
    ?supported_content_types:(supported_content_types_ : content_types option)
    ?supported_response_mime_types:(supported_response_mime_types_ : response_mime_types option)
    ~containers:(containers_ : model_package_container_definition_list) () =
  ({
     containers = containers_;
     supported_transform_instance_types = supported_transform_instance_types_;
     supported_realtime_inference_instance_types = supported_realtime_inference_instance_types_;
     supported_content_types = supported_content_types_;
     supported_response_mime_types = supported_response_mime_types_;
   }
    : inference_specification)

let make_batch_describe_model_package_summary
    ?model_package_version:(model_package_version_ : model_package_version option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ~model_package_group_name:(model_package_group_name_ : entity_name)
    ~model_package_arn:(model_package_arn_ : model_package_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~inference_specification:(inference_specification_ : inference_specification)
    ~model_package_status:(model_package_status_ : model_package_status) () =
  ({
     model_package_group_name = model_package_group_name_;
     model_package_version = model_package_version_;
     model_package_arn = model_package_arn_;
     model_package_description = model_package_description_;
     creation_time = creation_time_;
     inference_specification = inference_specification_;
     model_package_status = model_package_status_;
     model_approval_status = model_approval_status_;
     model_package_registration_type = model_package_registration_type_;
   }
    : batch_describe_model_package_summary)

let make_batch_describe_model_package_output
    ?model_package_summaries:(model_package_summaries_ : model_package_summaries option)
    ?batch_describe_model_package_error_map:
      (batch_describe_model_package_error_map_ : batch_describe_model_package_error_map option) () =
  ({
     model_package_summaries = model_package_summaries_;
     batch_describe_model_package_error_map = batch_describe_model_package_error_map_;
   }
    : batch_describe_model_package_output)

let make_batch_describe_model_package_input
    ~model_package_arn_list:(model_package_arn_list_ : model_package_arn_list) () =
  ({ model_package_arn_list = model_package_arn_list_ } : batch_describe_model_package_input)

let make_batch_reboot_cluster_node_logical_ids_error
    ~node_logical_id:(node_logical_id_ : cluster_node_logical_id)
    ~error_code:(error_code_ : batch_reboot_cluster_nodes_error_code) ~message:(message_ : string_)
    () =
  ({ node_logical_id = node_logical_id_; error_code = error_code_; message = message_ }
    : batch_reboot_cluster_node_logical_ids_error)

let make_batch_reboot_cluster_nodes_error ~node_id:(node_id_ : cluster_node_id)
    ~error_code:(error_code_ : batch_reboot_cluster_nodes_error_code) ~message:(message_ : string_)
    () =
  ({ node_id = node_id_; error_code = error_code_; message = message_ }
    : batch_reboot_cluster_nodes_error)

let make_batch_reboot_cluster_nodes_response ?successful:(successful_ : cluster_node_ids option)
    ?failed:(failed_ : batch_reboot_cluster_nodes_errors option)
    ?failed_node_logical_ids:
      (failed_node_logical_ids_ : batch_reboot_cluster_node_logical_ids_errors option)
    ?successful_node_logical_ids:
      (successful_node_logical_ids_ : cluster_node_logical_id_list option) () =
  ({
     successful = successful_;
     failed = failed_;
     failed_node_logical_ids = failed_node_logical_ids_;
     successful_node_logical_ids = successful_node_logical_ids_;
   }
    : batch_reboot_cluster_nodes_response)

let make_batch_reboot_cluster_nodes_request ?node_ids:(node_ids_ : cluster_node_ids option)
    ?node_logical_ids:(node_logical_ids_ : cluster_node_logical_id_list option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_; node_ids = node_ids_; node_logical_ids = node_logical_ids_ }
    : batch_reboot_cluster_nodes_request)

let make_batch_replace_cluster_node_logical_ids_error
    ~node_logical_id:(node_logical_id_ : cluster_node_logical_id)
    ~error_code:(error_code_ : batch_replace_cluster_nodes_error_code) ~message:(message_ : string_)
    () =
  ({ node_logical_id = node_logical_id_; error_code = error_code_; message = message_ }
    : batch_replace_cluster_node_logical_ids_error)

let make_batch_replace_cluster_nodes_error ~node_id:(node_id_ : cluster_node_id)
    ~error_code:(error_code_ : batch_replace_cluster_nodes_error_code) ~message:(message_ : string_)
    () =
  ({ node_id = node_id_; error_code = error_code_; message = message_ }
    : batch_replace_cluster_nodes_error)

let make_batch_replace_cluster_nodes_response ?successful:(successful_ : cluster_node_ids option)
    ?failed:(failed_ : batch_replace_cluster_nodes_errors option)
    ?failed_node_logical_ids:
      (failed_node_logical_ids_ : batch_replace_cluster_node_logical_ids_errors option)
    ?successful_node_logical_ids:
      (successful_node_logical_ids_ : cluster_node_logical_id_list option) () =
  ({
     successful = successful_;
     failed = failed_;
     failed_node_logical_ids = failed_node_logical_ids_;
     successful_node_logical_ids = successful_node_logical_ids_;
   }
    : batch_replace_cluster_nodes_response)

let make_batch_replace_cluster_nodes_request ?node_ids:(node_ids_ : cluster_node_ids option)
    ?node_logical_ids:(node_logical_ids_ : cluster_node_logical_id_list option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_; node_ids = node_ids_; node_logical_ids = node_logical_ids_ }
    : batch_replace_cluster_nodes_request)

let make_monitoring_parquet_dataset_format () = (() : unit)

let make_monitoring_json_dataset_format ?line:(line_ : boolean_ option) () =
  ({ line = line_ } : monitoring_json_dataset_format)

let make_monitoring_csv_dataset_format ?header:(header_ : boolean_ option) () =
  ({ header = header_ } : monitoring_csv_dataset_format)

let make_monitoring_dataset_format ?csv:(csv_ : monitoring_csv_dataset_format option)
    ?json:(json_ : monitoring_json_dataset_format option)
    ?parquet:(parquet_ : monitoring_parquet_dataset_format option) () =
  ({ csv = csv_; json = json_; parquet = parquet_ } : monitoring_dataset_format)

let make_batch_transform_input ?s3_input_mode:(s3_input_mode_ : processing_s3_input_mode option)
    ?s3_data_distribution_type:
      (s3_data_distribution_type_ : processing_s3_data_distribution_type option)
    ?features_attribute:(features_attribute_ : string_ option)
    ?inference_attribute:(inference_attribute_ : string_ option)
    ?probability_attribute:(probability_attribute_ : string_ option)
    ?probability_threshold_attribute:
      (probability_threshold_attribute_ : probability_threshold_attribute option)
    ?start_time_offset:(start_time_offset_ : monitoring_time_offset_string option)
    ?end_time_offset:(end_time_offset_ : monitoring_time_offset_string option)
    ?exclude_features_attribute:(exclude_features_attribute_ : exclude_features_attribute option)
    ~data_captured_destination_s3_uri:(data_captured_destination_s3_uri_ : destination_s3_uri)
    ~dataset_format:(dataset_format_ : monitoring_dataset_format)
    ~local_path:(local_path_ : processing_local_path) () =
  ({
     data_captured_destination_s3_uri = data_captured_destination_s3_uri_;
     dataset_format = dataset_format_;
     local_path = local_path_;
     s3_input_mode = s3_input_mode_;
     s3_data_distribution_type = s3_data_distribution_type_;
     features_attribute = features_attribute_;
     inference_attribute = inference_attribute_;
     probability_attribute = probability_attribute_;
     probability_threshold_attribute = probability_threshold_attribute_;
     start_time_offset = start_time_offset_;
     end_time_offset = end_time_offset_;
     exclude_features_attribute = exclude_features_attribute_;
   }
    : batch_transform_input)

let make_bedrock_custom_model_deployment_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_custom_model_deployment_metadata)

let make_bedrock_custom_model_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_custom_model_metadata)

let make_bedrock_model_import_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_model_import_metadata)

let make_bedrock_provisioned_model_throughput_metadata ?arn:(arn_ : string1024 option) () =
  ({ arn = arn_ } : bedrock_provisioned_model_throughput_metadata)

let make_best_objective_not_improving
    ?max_number_of_training_jobs_not_improving:
      (max_number_of_training_jobs_not_improving_ : max_number_of_training_jobs_not_improving option)
    () =
  ({ max_number_of_training_jobs_not_improving = max_number_of_training_jobs_not_improving_ }
    : best_objective_not_improving)

let make_metrics_source ?content_digest:(content_digest_ : content_digest option)
    ~content_type:(content_type_ : content_type) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ content_type = content_type_; content_digest = content_digest_; s3_uri = s3_uri_ }
    : metrics_source)

let make_bias ?report:(report_ : metrics_source option)
    ?pre_training_report:(pre_training_report_ : metrics_source option)
    ?post_training_report:(post_training_report_ : metrics_source option) () =
  ({
     report = report_;
     pre_training_report = pre_training_report_;
     post_training_report = post_training_report_;
   }
    : bias)

let make_capacity_size ~type_:(type__ : capacity_size_type) ~value:(value_ : capacity_size_value) ()
    =
  ({ type_ = type__; value = value_ } : capacity_size)

let make_traffic_routing_config ?canary_size:(canary_size_ : capacity_size option)
    ?linear_step_size:(linear_step_size_ : capacity_size option)
    ~type_:(type__ : traffic_routing_config_type)
    ~wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_interval_in_seconds) () =
  ({
     type_ = type__;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     canary_size = canary_size_;
     linear_step_size = linear_step_size_;
   }
    : traffic_routing_config)

let make_blue_green_update_policy
    ?termination_wait_in_seconds:(termination_wait_in_seconds_ : termination_wait_in_seconds option)
    ?maximum_execution_timeout_in_seconds:
      (maximum_execution_timeout_in_seconds_ : maximum_execution_timeout_in_seconds option)
    ~traffic_routing_configuration:(traffic_routing_configuration_ : traffic_routing_config) () =
  ({
     traffic_routing_configuration = traffic_routing_configuration_;
     termination_wait_in_seconds = termination_wait_in_seconds_;
     maximum_execution_timeout_in_seconds = maximum_execution_timeout_in_seconds_;
   }
    : blue_green_update_policy)

let make_output_parameter ~name:(name_ : string256) ~value:(value_ : string1024) () =
  ({ name = name_; value = value_ } : output_parameter)

let make_callback_step_metadata ?callback_token:(callback_token_ : callback_token option)
    ?sqs_queue_url:(sqs_queue_url_ : string256 option)
    ?output_parameters:(output_parameters_ : output_parameter_list option) () =
  ({
     callback_token = callback_token_;
     sqs_queue_url = sqs_queue_url_;
     output_parameters = output_parameters_;
   }
    : callback_step_metadata)

let make_emr_serverless_settings ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?status:(status_ : feature_status option) () =
  ({ execution_role_arn = execution_role_arn_; status = status_ } : emr_serverless_settings)

let make_generative_ai_settings
    ?amazon_bedrock_role_arn:(amazon_bedrock_role_arn_ : role_arn option) () =
  ({ amazon_bedrock_role_arn = amazon_bedrock_role_arn_ } : generative_ai_settings)

let make_kendra_settings ?status:(status_ : feature_status option) () =
  ({ status = status_ } : kendra_settings)

let make_direct_deploy_settings ?status:(status_ : feature_status option) () =
  ({ status = status_ } : direct_deploy_settings)

let make_identity_provider_o_auth_setting
    ?data_source_name:(data_source_name_ : data_source_name option)
    ?status:(status_ : feature_status option) ?secret_arn:(secret_arn_ : secret_arn option) () =
  ({ data_source_name = data_source_name_; status = status_; secret_arn = secret_arn_ }
    : identity_provider_o_auth_setting)

let make_workspace_settings ?s3_artifact_path:(s3_artifact_path_ : s3_uri option)
    ?s3_kms_key_id:(s3_kms_key_id_ : kms_key_id option) () =
  ({ s3_artifact_path = s3_artifact_path_; s3_kms_key_id = s3_kms_key_id_ } : workspace_settings)

let make_model_register_settings ?status:(status_ : feature_status option)
    ?cross_account_model_register_role_arn:
      (cross_account_model_register_role_arn_ : role_arn option) () =
  ({
     status = status_;
     cross_account_model_register_role_arn = cross_account_model_register_role_arn_;
   }
    : model_register_settings)

let make_time_series_forecasting_settings ?status:(status_ : feature_status option)
    ?amazon_forecast_role_arn:(amazon_forecast_role_arn_ : role_arn option) () =
  ({ status = status_; amazon_forecast_role_arn = amazon_forecast_role_arn_ }
    : time_series_forecasting_settings)

let make_canvas_app_settings
    ?time_series_forecasting_settings:
      (time_series_forecasting_settings_ : time_series_forecasting_settings option)
    ?model_register_settings:(model_register_settings_ : model_register_settings option)
    ?workspace_settings:(workspace_settings_ : workspace_settings option)
    ?identity_provider_o_auth_settings:
      (identity_provider_o_auth_settings_ : identity_provider_o_auth_settings option)
    ?direct_deploy_settings:(direct_deploy_settings_ : direct_deploy_settings option)
    ?kendra_settings:(kendra_settings_ : kendra_settings option)
    ?generative_ai_settings:(generative_ai_settings_ : generative_ai_settings option)
    ?emr_serverless_settings:(emr_serverless_settings_ : emr_serverless_settings option) () =
  ({
     time_series_forecasting_settings = time_series_forecasting_settings_;
     model_register_settings = model_register_settings_;
     workspace_settings = workspace_settings_;
     identity_provider_o_auth_settings = identity_provider_o_auth_settings_;
     direct_deploy_settings = direct_deploy_settings_;
     kendra_settings = kendra_settings_;
     generative_ai_settings = generative_ai_settings_;
     emr_serverless_settings = emr_serverless_settings_;
   }
    : canvas_app_settings)

let make_capacity_reservation ?arn:(arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?type_:(type__ : capacity_reservation_type option) () =
  ({ arn = arn_; type_ = type__ } : capacity_reservation)

let make_capacity_size_config ~type_:(type__ : node_unavailability_type)
    ~value:(value_ : node_unavailability_value) () =
  ({ type_ = type__; value = value_ } : capacity_size_config)

let make_capture_content_type_header
    ?csv_content_types:(csv_content_types_ : csv_content_types option)
    ?json_content_types:(json_content_types_ : json_content_types option) () =
  ({ csv_content_types = csv_content_types_; json_content_types = json_content_types_ }
    : capture_content_type_header)

let make_capture_option ~capture_mode:(capture_mode_ : capture_mode) () =
  ({ capture_mode = capture_mode_ } : capture_option)

let make_categorical_parameter ~name:(name_ : string64)
    ~value:(value_ : categorical_parameter_range_values) () =
  ({ name = name_; value = value_ } : categorical_parameter)

let make_categorical_parameter_range ~name:(name_ : parameter_key)
    ~values:(values_ : parameter_values) () =
  ({ name = name_; values = values_ } : categorical_parameter_range)

let make_categorical_parameter_range_specification ~values:(values_ : parameter_values) () =
  ({ values = values_ } : categorical_parameter_range_specification)

let make_cfn_stack_create_parameter ?value:(value_ : cfn_stack_parameter_value option)
    ~key:(key_ : cfn_stack_parameter_key) () =
  ({ key = key_; value = value_ } : cfn_stack_create_parameter)

let make_cfn_create_template_provider ?role_ar_n:(role_ar_n_ : role_arn option)
    ?parameters:(parameters_ : cfn_stack_create_parameters option)
    ~template_name:(template_name_ : cfn_template_name)
    ~template_ur_l:(template_ur_l_ : cfn_template_ur_l) () =
  ({
     template_name = template_name_;
     template_ur_l = template_ur_l_;
     role_ar_n = role_ar_n_;
     parameters = parameters_;
   }
    : cfn_create_template_provider)

let make_cfn_stack_detail ?name:(name_ : cfn_stack_name option) ?id:(id_ : cfn_stack_id option)
    ~status_message:(status_message_ : cfn_stack_status_message) () =
  ({ name = name_; id = id_; status_message = status_message_ } : cfn_stack_detail)

let make_cfn_stack_parameter ?value:(value_ : cfn_stack_parameter_value option)
    ~key:(key_ : cfn_stack_parameter_key) () =
  ({ key = key_; value = value_ } : cfn_stack_parameter)

let make_cfn_stack_update_parameter ?value:(value_ : cfn_stack_parameter_value option)
    ~key:(key_ : cfn_stack_parameter_key) () =
  ({ key = key_; value = value_ } : cfn_stack_update_parameter)

let make_cfn_template_provider_detail ?role_ar_n:(role_ar_n_ : role_arn option)
    ?parameters:(parameters_ : cfn_stack_parameters option)
    ?stack_detail:(stack_detail_ : cfn_stack_detail option)
    ~template_name:(template_name_ : cfn_template_name)
    ~template_ur_l:(template_ur_l_ : cfn_template_ur_l) () =
  ({
     template_name = template_name_;
     template_ur_l = template_ur_l_;
     role_ar_n = role_ar_n_;
     parameters = parameters_;
     stack_detail = stack_detail_;
   }
    : cfn_template_provider_detail)

let make_cfn_update_template_provider ?parameters:(parameters_ : cfn_stack_update_parameters option)
    ~template_name:(template_name_ : cfn_template_name)
    ~template_ur_l:(template_ur_l_ : cfn_template_ur_l) () =
  ({ template_name = template_name_; template_ur_l = template_ur_l_; parameters = parameters_ }
    : cfn_update_template_provider)

let make_channel_specification ?description:(description_ : entity_description option)
    ?is_required:(is_required_ : boolean_ option)
    ?supported_compression_types:(supported_compression_types_ : compression_types option)
    ~name:(name_ : channel_name) ~supported_content_types:(supported_content_types_ : content_types)
    ~supported_input_modes:(supported_input_modes_ : input_modes) () =
  ({
     name = name_;
     description = description_;
     is_required = is_required_;
     supported_content_types = supported_content_types_;
     supported_compression_types = supported_compression_types_;
     supported_input_modes = supported_input_modes_;
   }
    : channel_specification)

let make_checkpoint_config ?local_path:(local_path_ : directory_path option)
    ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ s3_uri = s3_uri_; local_path = local_path_ } : checkpoint_config)

let make_clarify_check_step_metadata ?check_type:(check_type_ : string256 option)
    ?baseline_used_for_drift_check_constraints:
      (baseline_used_for_drift_check_constraints_ : string1024 option)
    ?calculated_baseline_constraints:(calculated_baseline_constraints_ : string1024 option)
    ?model_package_group_name:(model_package_group_name_ : string256 option)
    ?violation_report:(violation_report_ : string1024 option)
    ?check_job_arn:(check_job_arn_ : string256 option) ?skip_check:(skip_check_ : boolean_ option)
    ?register_new_baseline:(register_new_baseline_ : boolean_ option) () =
  ({
     check_type = check_type_;
     baseline_used_for_drift_check_constraints = baseline_used_for_drift_check_constraints_;
     calculated_baseline_constraints = calculated_baseline_constraints_;
     model_package_group_name = model_package_group_name_;
     violation_report = violation_report_;
     check_job_arn = check_job_arn_;
     skip_check = skip_check_;
     register_new_baseline = register_new_baseline_;
   }
    : clarify_check_step_metadata)

let make_clarify_text_config ~language:(language_ : clarify_text_language)
    ~granularity:(granularity_ : clarify_text_granularity) () =
  ({ language = language_; granularity = granularity_ } : clarify_text_config)

let make_clarify_shap_baseline_config ?mime_type:(mime_type_ : clarify_mime_type option)
    ?shap_baseline:(shap_baseline_ : clarify_shap_baseline option)
    ?shap_baseline_uri:(shap_baseline_uri_ : url option) () =
  ({
     mime_type = mime_type_;
     shap_baseline = shap_baseline_;
     shap_baseline_uri = shap_baseline_uri_;
   }
    : clarify_shap_baseline_config)

let make_clarify_shap_config
    ?number_of_samples:(number_of_samples_ : clarify_shap_number_of_samples option)
    ?use_logit:(use_logit_ : clarify_shap_use_logit option) ?seed:(seed_ : clarify_shap_seed option)
    ?text_config:(text_config_ : clarify_text_config option)
    ~shap_baseline_config:(shap_baseline_config_ : clarify_shap_baseline_config) () =
  ({
     shap_baseline_config = shap_baseline_config_;
     number_of_samples = number_of_samples_;
     use_logit = use_logit_;
     seed = seed_;
     text_config = text_config_;
   }
    : clarify_shap_config)

let make_clarify_inference_config
    ?features_attribute:(features_attribute_ : clarify_features_attribute option)
    ?content_template:(content_template_ : clarify_content_template option)
    ?max_record_count:(max_record_count_ : clarify_max_record_count option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : clarify_max_payload_in_m_b option)
    ?probability_index:(probability_index_ : clarify_probability_index option)
    ?label_index:(label_index_ : clarify_label_index option)
    ?probability_attribute:(probability_attribute_ : clarify_probability_attribute option)
    ?label_attribute:(label_attribute_ : clarify_label_attribute option)
    ?label_headers:(label_headers_ : clarify_label_headers option)
    ?feature_headers:(feature_headers_ : clarify_feature_headers option)
    ?feature_types:(feature_types_ : clarify_feature_types option) () =
  ({
     features_attribute = features_attribute_;
     content_template = content_template_;
     max_record_count = max_record_count_;
     max_payload_in_m_b = max_payload_in_m_b_;
     probability_index = probability_index_;
     label_index = label_index_;
     probability_attribute = probability_attribute_;
     label_attribute = label_attribute_;
     label_headers = label_headers_;
     feature_headers = feature_headers_;
     feature_types = feature_types_;
   }
    : clarify_inference_config)

let make_clarify_explainer_config
    ?enable_explanations:(enable_explanations_ : clarify_enable_explanations option)
    ?inference_config:(inference_config_ : clarify_inference_config option)
    ~shap_config:(shap_config_ : clarify_shap_config) () =
  ({
     enable_explanations = enable_explanations_;
     inference_config = inference_config_;
     shap_config = shap_config_;
   }
    : clarify_explainer_config)

let make_rolling_deployment_policy
    ?rollback_maximum_batch_size:(rollback_maximum_batch_size_ : capacity_size_config option)
    ~maximum_batch_size:(maximum_batch_size_ : capacity_size_config) () =
  ({
     maximum_batch_size = maximum_batch_size_;
     rollback_maximum_batch_size = rollback_maximum_batch_size_;
   }
    : rolling_deployment_policy)

let make_deployment_configuration
    ?rolling_update_policy:(rolling_update_policy_ : rolling_deployment_policy option)
    ?wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_time_interval_in_seconds option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_alarms option) () =
  ({
     rolling_update_policy = rolling_update_policy_;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     auto_rollback_configuration = auto_rollback_configuration_;
   }
    : deployment_configuration)

let make_cluster_patch_schedule ?next_patch_date:(next_patch_date_ : timestamp option) () =
  ({ next_patch_date = next_patch_date_ } : cluster_patch_schedule)

let make_cluster_auto_patch_config ?patch_schedule:(patch_schedule_ : cluster_patch_schedule option)
    ?deployment_config:(deployment_config_ : deployment_configuration option)
    ~patching_strategy:(patching_strategy_ : cluster_patching_strategy) () =
  ({
     patching_strategy = patching_strategy_;
     patch_schedule = patch_schedule_;
     deployment_config = deployment_config_;
   }
    : cluster_auto_patch_config)

let make_cluster_patch_schedule_details ?next_patch_date:(next_patch_date_ : timestamp option) () =
  ({ next_patch_date = next_patch_date_ } : cluster_patch_schedule_details)

let make_cluster_auto_patch_config_details
    ?patching_strategy:(patching_strategy_ : cluster_patching_strategy option)
    ?current_patch_schedule:(current_patch_schedule_ : cluster_patch_schedule_details option)
    ?desired_patch_schedule:(desired_patch_schedule_ : cluster_patch_schedule_details option)
    ?deployment_config:(deployment_config_ : deployment_configuration option) () =
  ({
     patching_strategy = patching_strategy_;
     current_patch_schedule = current_patch_schedule_;
     desired_patch_schedule = desired_patch_schedule_;
     deployment_config = deployment_config_;
   }
    : cluster_auto_patch_config_details)

let make_cluster_auto_scaling_config
    ?auto_scaler_type:(auto_scaler_type_ : cluster_auto_scaler_type option)
    ~mode:(mode_ : cluster_auto_scaling_mode) () =
  ({ mode = mode_; auto_scaler_type = auto_scaler_type_ } : cluster_auto_scaling_config)

let make_cluster_auto_scaling_config_output
    ?auto_scaler_type:(auto_scaler_type_ : cluster_auto_scaler_type option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~mode:(mode_ : cluster_auto_scaling_mode) ~status:(status_ : cluster_auto_scaling_status) () =
  ({
     mode = mode_;
     auto_scaler_type = auto_scaler_type_;
     status = status_;
     failure_message = failure_message_;
   }
    : cluster_auto_scaling_config_output)

let make_cluster_on_demand_options () = (() : unit)
let make_cluster_spot_options () = (() : unit)

let make_cluster_capacity_requirements ?spot:(spot_ : cluster_spot_options option)
    ?on_demand:(on_demand_ : cluster_on_demand_options option) () =
  ({ spot = spot_; on_demand = on_demand_ } : cluster_capacity_requirements)

let make_cluster_ebs_volume_config
    ?volume_size_in_g_b:(volume_size_in_g_b_ : cluster_ebs_volume_size_in_g_b option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?root_volume:(root_volume_ : boolean_ option) () =
  ({
     volume_size_in_g_b = volume_size_in_g_b_;
     volume_kms_key_id = volume_kms_key_id_;
     root_volume = root_volume_;
   }
    : cluster_ebs_volume_config)

let make_instance_requirements_eni_configuration
    ?customer_eni:(customer_eni_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?additional_enis:(additional_enis_ : additional_enis option) () =
  ({ customer_eni = customer_eni_; additional_enis = additional_enis_ }
    : instance_requirements_eni_configuration)

let make_instance_metadata ?customer_eni:(customer_eni_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?additional_enis:(additional_enis_ : additional_enis option)
    ?instance_requirements_eni_configurations:
      (instance_requirements_eni_configurations_ : instance_requirements_eni_configurations option)
    ?capacity_reservation:(capacity_reservation_ : capacity_reservation option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?lcs_execution_state:(lcs_execution_state_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?node_logical_id:(node_logical_id_ : cluster_node_logical_id option) () =
  ({
     customer_eni = customer_eni_;
     additional_enis = additional_enis_;
     instance_requirements_eni_configurations = instance_requirements_eni_configurations_;
     capacity_reservation = capacity_reservation_;
     failure_message = failure_message_;
     lcs_execution_state = lcs_execution_state_;
     node_logical_id = node_logical_id_;
   }
    : instance_metadata)

let make_instance_group_scaling_metadata ?instance_count:(instance_count_ : instance_count option)
    ?target_count:(target_count_ : target_count option)
    ?min_count:(min_count_ : instance_count option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     instance_count = instance_count_;
     target_count = target_count_;
     min_count = min_count_;
     failure_message = failure_message_;
   }
    : instance_group_scaling_metadata)

let make_instance_group_metadata
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?availability_zone_id:(availability_zone_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?capacity_reservation:(capacity_reservation_ : capacity_reservation option)
    ?subnet_id:(subnet_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?ami_override:(ami_override_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     failure_message = failure_message_;
     availability_zone_id = availability_zone_id_;
     capacity_reservation = capacity_reservation_;
     subnet_id = subnet_id_;
     security_group_ids = security_group_ids_;
     ami_override = ami_override_;
   }
    : instance_group_metadata)

let make_cluster_metadata
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?eks_role_access_entries:(eks_role_access_entries_ : eks_role_access_entries option)
    ?slr_access_entry:(slr_access_entry_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     failure_message = failure_message_;
     eks_role_access_entries = eks_role_access_entries_;
     slr_access_entry = slr_access_entry_;
   }
    : cluster_metadata)

let make_event_details ?event_metadata:(event_metadata_ : event_metadata option) () =
  ({ event_metadata = event_metadata_ } : event_details)

let make_cluster_event_detail
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_details:(event_details_ : event_details option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_level:(event_level_ : cluster_event_level option) ~event_id:(event_id_ : event_id)
    ~cluster_arn:(cluster_arn_ : cluster_arn) ~cluster_name:(cluster_name_ : cluster_name)
    ~resource_type:(resource_type_ : cluster_event_resource_type)
    ~event_time:(event_time_ : timestamp) () =
  ({
     event_id = event_id_;
     cluster_arn = cluster_arn_;
     cluster_name = cluster_name_;
     instance_group_name = instance_group_name_;
     instance_id = instance_id_;
     resource_type = resource_type_;
     event_time = event_time_;
     event_details = event_details_;
     description = description_;
     event_level = event_level_;
   }
    : cluster_event_detail)

let make_cluster_event_summary
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?event_level:(event_level_ : cluster_event_level option) ~event_id:(event_id_ : event_id)
    ~cluster_arn:(cluster_arn_ : cluster_arn) ~cluster_name:(cluster_name_ : cluster_name)
    ~resource_type:(resource_type_ : cluster_event_resource_type)
    ~event_time:(event_time_ : timestamp) () =
  ({
     event_id = event_id_;
     cluster_arn = cluster_arn_;
     cluster_name = cluster_name_;
     instance_group_name = instance_group_name_;
     instance_id = instance_id_;
     resource_type = resource_type_;
     event_time = event_time_;
     description = description_;
     event_level = event_level_;
   }
    : cluster_event_summary)

let make_cluster_fsx_lustre_config ?mount_path:(mount_path_ : cluster_fsx_mount_path option)
    ~dns_name:(dns_name_ : cluster_dns_name) ~mount_name:(mount_name_ : cluster_mount_name) () =
  ({ dns_name = dns_name_; mount_name = mount_name_; mount_path = mount_path_ }
    : cluster_fsx_lustre_config)

let make_cluster_fsx_open_zfs_config ?mount_path:(mount_path_ : cluster_fsx_mount_path option)
    ~dns_name:(dns_name_ : cluster_dns_name) () =
  ({ dns_name = dns_name_; mount_path = mount_path_ } : cluster_fsx_open_zfs_config)

let make_cluster_network_interface_details
    ?interface_type:(interface_type_ : cluster_interface_type option) () =
  ({ interface_type = interface_type_ } : cluster_network_interface_details)

let make_cluster_slurm_config_details
    ?partition_names:(partition_names_ : cluster_partition_names option)
    ~node_type:(node_type_ : cluster_slurm_node_type) () =
  ({ node_type = node_type_; partition_names = partition_names_ } : cluster_slurm_config_details)

let make_cluster_kubernetes_taint ?value:(value_ : cluster_kubernetes_taint_value option)
    ~key:(key_ : cluster_kubernetes_taint_key) ~effect_:(effect__ : cluster_kubernetes_taint_effect)
    () =
  ({ key = key_; value = value_; effect_ = effect__ } : cluster_kubernetes_taint)

let make_cluster_kubernetes_config_details
    ?current_labels:(current_labels_ : cluster_kubernetes_labels option)
    ?desired_labels:(desired_labels_ : cluster_kubernetes_labels option)
    ?current_taints:(current_taints_ : cluster_kubernetes_taints option)
    ?desired_taints:(desired_taints_ : cluster_kubernetes_taints option) () =
  ({
     current_labels = current_labels_;
     desired_labels = desired_labels_;
     current_taints = current_taints_;
     desired_taints = desired_taints_;
   }
    : cluster_kubernetes_config_details)

let make_scheduled_update_config
    ?deployment_config:(deployment_config_ : deployment_configuration option)
    ~schedule_expression:(schedule_expression_ : cron_schedule_expression) () =
  ({ schedule_expression = schedule_expression_; deployment_config = deployment_config_ }
    : scheduled_update_config)

let make_cluster_life_cycle_config ?source_s3_uri:(source_s3_uri_ : s3_uri option)
    ?on_create:(on_create_ : cluster_life_cycle_config_file_name option)
    ?on_init_complete:(on_init_complete_ : cluster_life_cycle_config_file_name option) () =
  ({ source_s3_uri = source_s3_uri_; on_create = on_create_; on_init_complete = on_init_complete_ }
    : cluster_life_cycle_config)

let make_cluster_instance_type_detail ?instance_type:(instance_type_ : cluster_instance_type option)
    ?current_count:(current_count_ : cluster_non_negative_instance_count option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option) () =
  ({
     instance_type = instance_type_;
     current_count = current_count_;
     threads_per_core = threads_per_core_;
   }
    : cluster_instance_type_detail)

let make_cluster_instance_requirement_details
    ?current_instance_types:(current_instance_types_ : cluster_instance_types option)
    ?desired_instance_types:(desired_instance_types_ : cluster_instance_types option) () =
  ({
     current_instance_types = current_instance_types_;
     desired_instance_types = desired_instance_types_;
   }
    : cluster_instance_requirement_details)

let make_cluster_instance_group_details
    ?current_count:(current_count_ : cluster_non_negative_instance_count option)
    ?target_count:(target_count_ : cluster_instance_count option)
    ?min_count:(min_count_ : cluster_instance_count option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?instance_requirements:(instance_requirements_ : cluster_instance_requirement_details option)
    ?instance_type_details:(instance_type_details_ : cluster_instance_type_details option)
    ?life_cycle_config:(life_cycle_config_ : cluster_life_cycle_config option)
    ?execution_role:(execution_role_ : role_arn option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?status:(status_ : instance_group_status option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?training_plan_status:(training_plan_status_ : instance_group_training_plan_status option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?auto_patch_config:(auto_patch_config_ : cluster_auto_patch_config_details option)
    ?current_image_id:(current_image_id_ : image_id option)
    ?desired_image_id:(desired_image_id_ : image_id option)
    ?current_image_release_version:(current_image_release_version_ : image_release_version option)
    ?desired_image_release_version:(desired_image_release_version_ : image_release_version option)
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ?active_operations:(active_operations_ : active_operations option)
    ?kubernetes_config:(kubernetes_config_ : cluster_kubernetes_config_details option)
    ?capacity_requirements:(capacity_requirements_ : cluster_capacity_requirements option)
    ?target_state_count:(target_state_count_ : cluster_instance_count option)
    ?software_update_status:(software_update_status_ : software_update_status option)
    ?active_software_update_config:
      (active_software_update_config_ : deployment_configuration option)
    ?slurm_config:(slurm_config_ : cluster_slurm_config_details option)
    ?network_interface:(network_interface_ : cluster_network_interface_details option) () =
  ({
     current_count = current_count_;
     target_count = target_count_;
     min_count = min_count_;
     instance_group_name = instance_group_name_;
     instance_type = instance_type_;
     instance_requirements = instance_requirements_;
     instance_type_details = instance_type_details_;
     life_cycle_config = life_cycle_config_;
     execution_role = execution_role_;
     threads_per_core = threads_per_core_;
     instance_storage_configs = instance_storage_configs_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     status = status_;
     training_plan_arn = training_plan_arn_;
     training_plan_status = training_plan_status_;
     override_vpc_config = override_vpc_config_;
     scheduled_update_config = scheduled_update_config_;
     auto_patch_config = auto_patch_config_;
     current_image_id = current_image_id_;
     desired_image_id = desired_image_id_;
     current_image_release_version = current_image_release_version_;
     desired_image_release_version = desired_image_release_version_;
     image_version_status = image_version_status_;
     active_operations = active_operations_;
     kubernetes_config = kubernetes_config_;
     capacity_requirements = capacity_requirements_;
     target_state_count = target_state_count_;
     software_update_status = software_update_status_;
     active_software_update_config = active_software_update_config_;
     slurm_config = slurm_config_;
     network_interface = network_interface_;
   }
    : cluster_instance_group_details)

let make_cluster_network_interface ?interface_type:(interface_type_ : cluster_interface_type option)
    () =
  ({ interface_type = interface_type_ } : cluster_network_interface)

let make_cluster_slurm_config ?partition_names:(partition_names_ : cluster_partition_names option)
    ~node_type:(node_type_ : cluster_slurm_node_type) () =
  ({ node_type = node_type_; partition_names = partition_names_ } : cluster_slurm_config)

let make_cluster_kubernetes_config ?labels:(labels_ : cluster_kubernetes_labels option)
    ?taints:(taints_ : cluster_kubernetes_taints option) () =
  ({ labels = labels_; taints = taints_ } : cluster_kubernetes_config)

let make_cluster_instance_requirements ~instance_types:(instance_types_ : cluster_instance_types) ()
    =
  ({ instance_types = instance_types_ } : cluster_instance_requirements)

let make_cluster_instance_group_specification
    ?min_instance_count:(min_instance_count_ : cluster_instance_count option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?instance_requirements:(instance_requirements_ : cluster_instance_requirements option)
    ?life_cycle_config:(life_cycle_config_ : cluster_life_cycle_config option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?image_id:(image_id_ : image_id option)
    ?auto_patch_config:(auto_patch_config_ : cluster_auto_patch_config option)
    ?image_release_version:(image_release_version_ : image_release_version option)
    ?kubernetes_config:(kubernetes_config_ : cluster_kubernetes_config option)
    ?slurm_config:(slurm_config_ : cluster_slurm_config option)
    ?capacity_requirements:(capacity_requirements_ : cluster_capacity_requirements option)
    ?network_interface:(network_interface_ : cluster_network_interface option)
    ~instance_count:(instance_count_ : cluster_instance_count)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name)
    ~execution_role:(execution_role_ : role_arn) () =
  ({
     instance_count = instance_count_;
     min_instance_count = min_instance_count_;
     instance_group_name = instance_group_name_;
     instance_type = instance_type_;
     instance_requirements = instance_requirements_;
     life_cycle_config = life_cycle_config_;
     execution_role = execution_role_;
     threads_per_core = threads_per_core_;
     instance_storage_configs = instance_storage_configs_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     training_plan_arn = training_plan_arn_;
     override_vpc_config = override_vpc_config_;
     scheduled_update_config = scheduled_update_config_;
     image_id = image_id_;
     auto_patch_config = auto_patch_config_;
     image_release_version = image_release_version_;
     kubernetes_config = kubernetes_config_;
     slurm_config = slurm_config_;
     capacity_requirements = capacity_requirements_;
     network_interface = network_interface_;
   }
    : cluster_instance_group_specification)

let make_cluster_instance_placement
    ?availability_zone:(availability_zone_ : cluster_availability_zone option)
    ?availability_zone_id:(availability_zone_id_ : cluster_availability_zone_id option) () =
  ({ availability_zone = availability_zone_; availability_zone_id = availability_zone_id_ }
    : cluster_instance_placement)

let make_cluster_instance_status_details
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : cluster_instance_status) () =
  ({ status = status_; message = message_ } : cluster_instance_status_details)

let make_cluster_kubernetes_config_node_details
    ?current_labels:(current_labels_ : cluster_kubernetes_labels option)
    ?desired_labels:(desired_labels_ : cluster_kubernetes_labels option)
    ?current_taints:(current_taints_ : cluster_kubernetes_taints option)
    ?desired_taints:(desired_taints_ : cluster_kubernetes_taints option) () =
  ({
     current_labels = current_labels_;
     desired_labels = desired_labels_;
     current_taints = current_taints_;
     desired_taints = desired_taints_;
   }
    : cluster_kubernetes_config_node_details)

let make_ultra_server_info ?id:(id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ id = id_; type_ = type__ } : ultra_server_info)

let make_cluster_node_details
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?node_logical_id:(node_logical_id_ : cluster_node_logical_id option)
    ?instance_status:(instance_status_ : cluster_instance_status_details option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?launch_time:(launch_time_ : timestamp option)
    ?last_software_update_time:(last_software_update_time_ : timestamp option)
    ?life_cycle_config:(life_cycle_config_ : cluster_life_cycle_config option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?private_primary_ip:(private_primary_ip_ : cluster_private_primary_ip option)
    ?private_primary_ipv6:(private_primary_ipv6_ : cluster_private_primary_ipv6 option)
    ?private_dns_hostname:(private_dns_hostname_ : cluster_private_dns_hostname option)
    ?placement:(placement_ : cluster_instance_placement option)
    ?current_image_id:(current_image_id_ : image_id option)
    ?desired_image_id:(desired_image_id_ : image_id option)
    ?current_image_release_version:(current_image_release_version_ : image_release_version option)
    ?desired_image_release_version:(desired_image_release_version_ : image_release_version option)
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ?ultra_server_info:(ultra_server_info_ : ultra_server_info option)
    ?kubernetes_config:(kubernetes_config_ : cluster_kubernetes_config_node_details option)
    ?capacity_type:(capacity_type_ : cluster_capacity_type option)
    ?network_interface:(network_interface_ : cluster_network_interface_details option) () =
  ({
     instance_group_name = instance_group_name_;
     instance_id = instance_id_;
     node_logical_id = node_logical_id_;
     instance_status = instance_status_;
     instance_type = instance_type_;
     launch_time = launch_time_;
     last_software_update_time = last_software_update_time_;
     life_cycle_config = life_cycle_config_;
     override_vpc_config = override_vpc_config_;
     threads_per_core = threads_per_core_;
     instance_storage_configs = instance_storage_configs_;
     private_primary_ip = private_primary_ip_;
     private_primary_ipv6 = private_primary_ipv6_;
     private_dns_hostname = private_dns_hostname_;
     placement = placement_;
     current_image_id = current_image_id_;
     desired_image_id = desired_image_id_;
     current_image_release_version = current_image_release_version_;
     desired_image_release_version = desired_image_release_version_;
     image_version_status = image_version_status_;
     ultra_server_info = ultra_server_info_;
     kubernetes_config = kubernetes_config_;
     capacity_type = capacity_type_;
     network_interface = network_interface_;
   }
    : cluster_node_details)

let make_cluster_node_summary
    ?node_logical_id:(node_logical_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_software_update_time:(last_software_update_time_ : timestamp option)
    ?ultra_server_info:(ultra_server_info_ : ultra_server_info option)
    ?private_dns_hostname:(private_dns_hostname_ : cluster_private_dns_hostname option)
    ?current_image_release_version:(current_image_release_version_ : image_release_version option)
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name)
    ~instance_id:(instance_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~instance_type:(instance_type_ : cluster_instance_type) ~launch_time:(launch_time_ : timestamp)
    ~instance_status:(instance_status_ : cluster_instance_status_details) () =
  ({
     instance_group_name = instance_group_name_;
     instance_id = instance_id_;
     node_logical_id = node_logical_id_;
     instance_type = instance_type_;
     launch_time = launch_time_;
     last_software_update_time = last_software_update_time_;
     instance_status = instance_status_;
     ultra_server_info = ultra_server_info_;
     private_dns_hostname = private_dns_hostname_;
     current_image_release_version = current_image_release_version_;
     image_version_status = image_version_status_;
   }
    : cluster_node_summary)

let make_cluster_orchestrator_slurm_config
    ?slurm_config_strategy:(slurm_config_strategy_ : cluster_slurm_config_strategy option) () =
  ({ slurm_config_strategy = slurm_config_strategy_ } : cluster_orchestrator_slurm_config)

let make_cluster_orchestrator_eks_config ~cluster_arn:(cluster_arn_ : eks_cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : cluster_orchestrator_eks_config)

let make_cluster_orchestrator ?eks:(eks_ : cluster_orchestrator_eks_config option)
    ?slurm:(slurm_ : cluster_orchestrator_slurm_config option) () =
  ({ eks = eks_; slurm = slurm_ } : cluster_orchestrator)

let make_f_sx_lustre_config ~size_in_gi_b:(size_in_gi_b_ : f_sx_lustre_size_in_gi_b)
    ~per_unit_storage_throughput:
      (per_unit_storage_throughput_ : f_sx_lustre_per_unit_storage_throughput) () =
  ({ size_in_gi_b = size_in_gi_b_; per_unit_storage_throughput = per_unit_storage_throughput_ }
    : f_sx_lustre_config)

let make_environment_config_details
    ?f_sx_lustre_config:(f_sx_lustre_config_ : f_sx_lustre_config option)
    ?s3_output_path:(s3_output_path_ : s3_uri option) () =
  ({ f_sx_lustre_config = f_sx_lustre_config_; s3_output_path = s3_output_path_ }
    : environment_config_details)

let make_cluster_restricted_instance_group_details
    ?current_count:(current_count_ : cluster_non_negative_instance_count option)
    ?target_count:(target_count_ : cluster_instance_count option)
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?instance_type:(instance_type_ : cluster_instance_type option)
    ?execution_role:(execution_role_ : role_arn option)
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?status:(status_ : instance_group_status option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?training_plan_status:(training_plan_status_ : instance_group_training_plan_status option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?environment_config:(environment_config_ : environment_config_details option) () =
  ({
     current_count = current_count_;
     target_count = target_count_;
     instance_group_name = instance_group_name_;
     instance_type = instance_type_;
     execution_role = execution_role_;
     threads_per_core = threads_per_core_;
     instance_storage_configs = instance_storage_configs_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     status = status_;
     training_plan_arn = training_plan_arn_;
     training_plan_status = training_plan_status_;
     override_vpc_config = override_vpc_config_;
     scheduled_update_config = scheduled_update_config_;
     environment_config = environment_config_;
   }
    : cluster_restricted_instance_group_details)

let make_environment_config ?f_sx_lustre_config:(f_sx_lustre_config_ : f_sx_lustre_config option) ()
    =
  ({ f_sx_lustre_config = f_sx_lustre_config_ } : environment_config)

let make_cluster_restricted_instance_group_specification
    ?threads_per_core:(threads_per_core_ : cluster_threads_per_core option)
    ?instance_storage_configs:(instance_storage_configs_ : cluster_instance_storage_configs option)
    ?on_start_deep_health_checks:(on_start_deep_health_checks_ : on_start_deep_health_checks option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ?override_vpc_config:(override_vpc_config_ : vpc_config option)
    ?scheduled_update_config:(scheduled_update_config_ : scheduled_update_config option)
    ?environment_config:(environment_config_ : environment_config option)
    ~instance_count:(instance_count_ : cluster_instance_count)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name)
    ~instance_type:(instance_type_ : cluster_instance_type)
    ~execution_role:(execution_role_ : role_arn) () =
  ({
     instance_count = instance_count_;
     instance_group_name = instance_group_name_;
     instance_type = instance_type_;
     execution_role = execution_role_;
     threads_per_core = threads_per_core_;
     instance_storage_configs = instance_storage_configs_;
     on_start_deep_health_checks = on_start_deep_health_checks_;
     training_plan_arn = training_plan_arn_;
     override_vpc_config = override_vpc_config_;
     scheduled_update_config = scheduled_update_config_;
     environment_config = environment_config_;
   }
    : cluster_restricted_instance_group_specification)

let make_cluster_shared_environment_config
    ~f_sx_lustre_deletion_policy:
      (f_sx_lustre_deletion_policy_ : cluster_f_sx_lustre_deletion_policy)
    ~f_sx_lustre_config:(f_sx_lustre_config_ : f_sx_lustre_config) () =
  ({
     f_sx_lustre_deletion_policy = f_sx_lustre_deletion_policy_;
     f_sx_lustre_config = f_sx_lustre_config_;
   }
    : cluster_shared_environment_config)

let make_cluster_restricted_instance_groups_config
    ~shared_environment_config:(shared_environment_config_ : cluster_shared_environment_config) () =
  ({ shared_environment_config = shared_environment_config_ }
    : cluster_restricted_instance_groups_config)

let make_cluster_shared_environment_config_details
    ?current_f_sx_lustre_config:(current_f_sx_lustre_config_ : f_sx_lustre_config option)
    ?desired_f_sx_lustre_config:(desired_f_sx_lustre_config_ : f_sx_lustre_config option)
    ?current_f_sx_lustre_deletion_policy:
      (current_f_sx_lustre_deletion_policy_ : cluster_f_sx_lustre_deletion_policy option)
    ?desired_f_sx_lustre_deletion_policy:
      (desired_f_sx_lustre_deletion_policy_ : cluster_f_sx_lustre_deletion_policy option) () =
  ({
     current_f_sx_lustre_config = current_f_sx_lustre_config_;
     desired_f_sx_lustre_config = desired_f_sx_lustre_config_;
     current_f_sx_lustre_deletion_policy = current_f_sx_lustre_deletion_policy_;
     desired_f_sx_lustre_deletion_policy = desired_f_sx_lustre_deletion_policy_;
   }
    : cluster_shared_environment_config_details)

let make_cluster_restricted_instance_groups_config_output
    ~shared_environment_config:
      (shared_environment_config_ : cluster_shared_environment_config_details) () =
  ({ shared_environment_config = shared_environment_config_ }
    : cluster_restricted_instance_groups_config_output)

let make_cluster_scheduler_config_summary
    ?cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id)
    ~name:(name_ : entity_name) ~creation_time:(creation_time_ : timestamp)
    ~status:(status_ : scheduler_resource_status) () =
  ({
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
     name = name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     status = status_;
     cluster_arn = cluster_arn_;
   }
    : cluster_scheduler_config_summary)

let make_cluster_summary ?training_plan_arns:(training_plan_arns_ : training_plan_arns option)
    ?image_version_status:(image_version_status_ : cluster_image_version_status option)
    ~cluster_arn:(cluster_arn_ : cluster_arn) ~cluster_name:(cluster_name_ : cluster_name)
    ~creation_time:(creation_time_ : timestamp) ~cluster_status:(cluster_status_ : cluster_status)
    () =
  ({
     cluster_arn = cluster_arn_;
     cluster_name = cluster_name_;
     creation_time = creation_time_;
     cluster_status = cluster_status_;
     training_plan_arns = training_plan_arns_;
     image_version_status = image_version_status_;
   }
    : cluster_summary)

let make_cluster_tiered_storage_config
    ?instance_memory_allocation_percentage:
      (instance_memory_allocation_percentage_ : cluster_instance_memory_allocation_percentage option)
    ~mode:(mode_ : cluster_config_mode) () =
  ({ mode = mode_; instance_memory_allocation_percentage = instance_memory_allocation_percentage_ }
    : cluster_tiered_storage_config)

let make_custom_image ?image_version_number:(image_version_number_ : image_version_number option)
    ~image_name:(image_name_ : image_name)
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({
     image_name = image_name_;
     image_version_number = image_version_number_;
     app_image_config_name = app_image_config_name_;
   }
    : custom_image)

let make_code_editor_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?custom_images:(custom_images_ : custom_images option)
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option)
    ?app_lifecycle_management:(app_lifecycle_management_ : app_lifecycle_management option)
    ?built_in_lifecycle_config_arn:
      (built_in_lifecycle_config_arn_ : studio_lifecycle_config_arn option) () =
  ({
     default_resource_spec = default_resource_spec_;
     custom_images = custom_images_;
     lifecycle_config_arns = lifecycle_config_arns_;
     app_lifecycle_management = app_lifecycle_management_;
     built_in_lifecycle_config_arn = built_in_lifecycle_config_arn_;
   }
    : code_editor_app_settings)

let make_code_repository ~repository_url:(repository_url_ : repository_url) () =
  ({ repository_url = repository_url_ } : code_repository)

let make_git_config ?branch:(branch_ : branch option) ?secret_arn:(secret_arn_ : secret_arn option)
    ~repository_url:(repository_url_ : git_config_url) () =
  ({ repository_url = repository_url_; branch = branch_; secret_arn = secret_arn_ } : git_config)

let make_code_repository_summary ?git_config:(git_config_ : git_config option)
    ~code_repository_name:(code_repository_name_ : entity_name)
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~last_modified_time:(last_modified_time_ : last_modified_time) () =
  ({
     code_repository_name = code_repository_name_;
     code_repository_arn = code_repository_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     git_config = git_config_;
   }
    : code_repository_summary)

let make_cognito_config ~user_pool:(user_pool_ : cognito_user_pool)
    ~client_id:(client_id_ : client_id) () =
  ({ user_pool = user_pool_; client_id = client_id_ } : cognito_config)

let make_cognito_member_definition ~user_pool:(user_pool_ : cognito_user_pool)
    ~user_group:(user_group_ : cognito_user_group) ~client_id:(client_id_ : client_id) () =
  ({ user_pool = user_pool_; user_group = user_group_; client_id = client_id_ }
    : cognito_member_definition)

let make_vector_config ~dimension:(dimension_ : dimension) () =
  ({ dimension = dimension_ } : vector_config)

let make_collection_configuration ?collection_name:(collection_name_ : collection_name option)
    ?collection_parameters:(collection_parameters_ : collection_parameters option) () =
  ({ collection_name = collection_name_; collection_parameters = collection_parameters_ }
    : collection_configuration)

let make_compilation_job_summary
    ?compilation_start_time:(compilation_start_time_ : timestamp option)
    ?compilation_end_time:(compilation_end_time_ : timestamp option)
    ?compilation_target_device:(compilation_target_device_ : target_device option)
    ?compilation_target_platform_os:(compilation_target_platform_os_ : target_platform_os option)
    ?compilation_target_platform_arch:
      (compilation_target_platform_arch_ : target_platform_arch option)
    ?compilation_target_platform_accelerator:
      (compilation_target_platform_accelerator_ : target_platform_accelerator option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ~compilation_job_name:(compilation_job_name_ : entity_name)
    ~compilation_job_arn:(compilation_job_arn_ : compilation_job_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~compilation_job_status:(compilation_job_status_ : compilation_job_status) () =
  ({
     compilation_job_name = compilation_job_name_;
     compilation_job_arn = compilation_job_arn_;
     creation_time = creation_time_;
     compilation_start_time = compilation_start_time_;
     compilation_end_time = compilation_end_time_;
     compilation_target_device = compilation_target_device_;
     compilation_target_platform_os = compilation_target_platform_os_;
     compilation_target_platform_arch = compilation_target_platform_arch_;
     compilation_target_platform_accelerator = compilation_target_platform_accelerator_;
     last_modified_time = last_modified_time_;
     compilation_job_status = compilation_job_status_;
   }
    : compilation_job_summary)

let make_resource_sharing_config ?borrow_limit:(borrow_limit_ : borrow_limit option)
    ?absolute_borrow_limits:(absolute_borrow_limits_ : absolute_borrow_limit_resource_list option)
    ~strategy:(strategy_ : resource_sharing_strategy) () =
  ({
     strategy = strategy_;
     borrow_limit = borrow_limit_;
     absolute_borrow_limits = absolute_borrow_limits_;
   }
    : resource_sharing_config)

let make_compute_quota_config
    ?compute_quota_resources:(compute_quota_resources_ : compute_quota_resource_config_list option)
    ?resource_sharing_config:(resource_sharing_config_ : resource_sharing_config option)
    ?preempt_team_tasks:(preempt_team_tasks_ : preempt_team_tasks option) () =
  ({
     compute_quota_resources = compute_quota_resources_;
     resource_sharing_config = resource_sharing_config_;
     preempt_team_tasks = preempt_team_tasks_;
   }
    : compute_quota_config)

let make_compute_quota_target ?fair_share_weight:(fair_share_weight_ : fair_share_weight option)
    ~team_name:(team_name_ : compute_quota_target_team_name) () =
  ({ team_name = team_name_; fair_share_weight = fair_share_weight_ } : compute_quota_target)

let make_compute_quota_summary ?compute_quota_version:(compute_quota_version_ : integer option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?compute_quota_config:(compute_quota_config_ : compute_quota_config option)
    ?activation_state:(activation_state_ : activation_state option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id) ~name:(name_ : entity_name)
    ~status:(status_ : scheduler_resource_status)
    ~compute_quota_target:(compute_quota_target_ : compute_quota_target)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     compute_quota_arn = compute_quota_arn_;
     compute_quota_id = compute_quota_id_;
     name = name_;
     compute_quota_version = compute_quota_version_;
     status = status_;
     cluster_arn = cluster_arn_;
     compute_quota_config = compute_quota_config_;
     compute_quota_target = compute_quota_target_;
     activation_state = activation_state_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : compute_quota_summary)

let make_condition_step_metadata ?outcome:(outcome_ : condition_outcome option) () =
  ({ outcome = outcome_ } : condition_step_metadata)

let make_metrics_endpoint
    ?metric_publish_frequency_in_seconds:
      (metric_publish_frequency_in_seconds_ : metric_publish_frequency_in_seconds option)
    ~metrics_endpoint_path:(metrics_endpoint_path_ : metrics_endpoint_path) () =
  ({
     metrics_endpoint_path = metrics_endpoint_path_;
     metric_publish_frequency_in_seconds = metric_publish_frequency_in_seconds_;
   }
    : metrics_endpoint)

let make_container_metrics_config
    ?metrics_endpoints:(metrics_endpoints_ : metrics_endpoint_list option) () =
  ({ metrics_endpoints = metrics_endpoints_ } : container_metrics_config)

let make_multi_model_config ?model_cache_setting:(model_cache_setting_ : model_cache_setting option)
    () =
  ({ model_cache_setting = model_cache_setting_ } : multi_model_config)

let make_repository_auth_config
    ~repository_credentials_provider_arn:
      (repository_credentials_provider_arn_ : repository_credentials_provider_arn) () =
  ({ repository_credentials_provider_arn = repository_credentials_provider_arn_ }
    : repository_auth_config)

let make_image_config
    ?repository_auth_config:(repository_auth_config_ : repository_auth_config option)
    ~repository_access_mode:(repository_access_mode_ : repository_access_mode) () =
  ({
     repository_access_mode = repository_access_mode_;
     repository_auth_config = repository_auth_config_;
   }
    : image_config)

let make_container_definition ?container_hostname:(container_hostname_ : container_hostname option)
    ?image:(image_ : container_image option) ?image_config:(image_config_ : image_config option)
    ?mode:(mode_ : container_mode option) ?model_data_url:(model_data_url_ : url option)
    ?model_data_source:(model_data_source_ : model_data_source option)
    ?additional_model_data_sources:
      (additional_model_data_sources_ : additional_model_data_sources option)
    ?environment:(environment_ : environment_map option)
    ?model_package_name:(model_package_name_ : versioned_arn_or_name option)
    ?inference_specification_name:
      (inference_specification_name_ : inference_specification_name option)
    ?multi_model_config:(multi_model_config_ : multi_model_config option)
    ?container_metrics_config:(container_metrics_config_ : container_metrics_config option) () =
  ({
     container_hostname = container_hostname_;
     image = image_;
     image_config = image_config_;
     mode = mode_;
     model_data_url = model_data_url_;
     model_data_source = model_data_source_;
     additional_model_data_sources = additional_model_data_sources_;
     environment = environment_;
     model_package_name = model_package_name_;
     inference_specification_name = inference_specification_name_;
     multi_model_config = multi_model_config_;
     container_metrics_config = container_metrics_config_;
   }
    : container_definition)

let make_context_source ?source_type:(source_type_ : string256 option)
    ?source_id:(source_id_ : string256 option) ~source_uri:(source_uri_ : source_uri) () =
  ({ source_uri = source_uri_; source_type = source_type_; source_id = source_id_ }
    : context_source)

let make_context_summary ?context_arn:(context_arn_ : context_arn option)
    ?context_name:(context_name_ : context_name option) ?source:(source_ : context_source option)
    ?context_type:(context_type_ : string256 option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     context_arn = context_arn_;
     context_name = context_name_;
     source = source_;
     context_type = context_type_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : context_summary)

let make_continuous_parameter_range
    ?scaling_type:(scaling_type_ : hyper_parameter_scaling_type option)
    ~name:(name_ : parameter_key) ~min_value:(min_value_ : parameter_value)
    ~max_value:(max_value_ : parameter_value) () =
  ({ name = name_; min_value = min_value_; max_value = max_value_; scaling_type = scaling_type_ }
    : continuous_parameter_range)

let make_continuous_parameter_range_specification ~min_value:(min_value_ : parameter_value)
    ~max_value:(max_value_ : parameter_value) () =
  ({ min_value = min_value_; max_value = max_value_ } : continuous_parameter_range_specification)

let make_convergence_detected
    ?complete_on_convergence:(complete_on_convergence_ : complete_on_convergence option) () =
  ({ complete_on_convergence = complete_on_convergence_ } : convergence_detected)

let make_create_ai_benchmark_job_response
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn) () =
  ({ ai_benchmark_job_arn = ai_benchmark_job_arn_ } : create_ai_benchmark_job_response)

let make_create_ai_benchmark_job_request
    ?network_config:(network_config_ : ai_benchmark_network_config option)
    ?tags:(tags_ : tag_list option) ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name)
    ~benchmark_target:(benchmark_target_ : ai_benchmark_target)
    ~output_config:(output_config_ : ai_benchmark_output_config)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     ai_benchmark_job_name = ai_benchmark_job_name_;
     benchmark_target = benchmark_target_;
     output_config = output_config_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     role_arn = role_arn_;
     network_config = network_config_;
     tags = tags_;
   }
    : create_ai_benchmark_job_request)

let make_create_ai_recommendation_job_response
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn) () =
  ({ ai_recommendation_job_arn = ai_recommendation_job_arn_ }
    : create_ai_recommendation_job_response)

let make_create_ai_recommendation_job_request
    ?inference_specification:
      (inference_specification_ : ai_recommendation_inference_specification option)
    ?optimize_model:(optimize_model_ : ai_recommendation_allow_optimization option)
    ?compute_spec:(compute_spec_ : ai_recommendation_compute_spec option)
    ?tags:(tags_ : tag_list option)
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name)
    ~model_source:(model_source_ : ai_model_source)
    ~output_config:(output_config_ : ai_recommendation_output_config)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~performance_target:(performance_target_ : ai_recommendation_performance_target)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     ai_recommendation_job_name = ai_recommendation_job_name_;
     model_source = model_source_;
     output_config = output_config_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     performance_target = performance_target_;
     role_arn = role_arn_;
     inference_specification = inference_specification_;
     optimize_model = optimize_model_;
     compute_spec = compute_spec_;
     tags = tags_;
   }
    : create_ai_recommendation_job_request)

let make_create_ai_workload_config_response
    ~ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn) () =
  ({ ai_workload_config_arn = ai_workload_config_arn_ } : create_ai_workload_config_response)

let make_create_ai_workload_config_request
    ?dataset_config:(dataset_config_ : ai_dataset_config option)
    ?ai_workload_configs:(ai_workload_configs_ : ai_workload_configs option)
    ?tags:(tags_ : tag_list option)
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({
     ai_workload_config_name = ai_workload_config_name_;
     dataset_config = dataset_config_;
     ai_workload_configs = ai_workload_configs_;
     tags = tags_;
   }
    : create_ai_workload_config_request)

let make_create_action_response ?action_arn:(action_arn_ : action_arn option) () =
  ({ action_arn = action_arn_ } : create_action_response)

let make_metadata_properties ?commit_id:(commit_id_ : metadata_property_value option)
    ?repository:(repository_ : metadata_property_value option)
    ?generated_by:(generated_by_ : metadata_property_value option)
    ?project_id:(project_id_ : metadata_property_value option) () =
  ({
     commit_id = commit_id_;
     repository = repository_;
     generated_by = generated_by_;
     project_id = project_id_;
   }
    : metadata_properties)

let make_create_action_request ?description:(description_ : experiment_description option)
    ?status:(status_ : action_status option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?tags:(tags_ : tag_list option) ~action_name:(action_name_ : experiment_entity_name)
    ~source:(source_ : action_source) ~action_type:(action_type_ : string256) () =
  ({
     action_name = action_name_;
     source = source_;
     action_type = action_type_;
     description = description_;
     status = status_;
     properties = properties_;
     metadata_properties = metadata_properties_;
     tags = tags_;
   }
    : create_action_request)

let make_create_algorithm_output ~algorithm_arn:(algorithm_arn_ : algorithm_arn) () =
  ({ algorithm_arn = algorithm_arn_ } : create_algorithm_output)

let make_hyper_parameter_tuning_job_objective
    ~type_:(type__ : hyper_parameter_tuning_job_objective_type)
    ~metric_name:(metric_name_ : metric_name) () =
  ({ type_ = type__; metric_name = metric_name_ } : hyper_parameter_tuning_job_objective)

let make_integer_parameter_range_specification ~min_value:(min_value_ : parameter_value)
    ~max_value:(max_value_ : parameter_value) () =
  ({ min_value = min_value_; max_value = max_value_ } : integer_parameter_range_specification)

let make_parameter_range
    ?integer_parameter_range_specification:
      (integer_parameter_range_specification_ : integer_parameter_range_specification option)
    ?continuous_parameter_range_specification:
      (continuous_parameter_range_specification_ : continuous_parameter_range_specification option)
    ?categorical_parameter_range_specification:
      (categorical_parameter_range_specification_ : categorical_parameter_range_specification option)
    () =
  ({
     integer_parameter_range_specification = integer_parameter_range_specification_;
     continuous_parameter_range_specification = continuous_parameter_range_specification_;
     categorical_parameter_range_specification = categorical_parameter_range_specification_;
   }
    : parameter_range)

let make_hyper_parameter_specification ?description:(description_ : entity_description option)
    ?range:(range_ : parameter_range option) ?is_tunable:(is_tunable_ : boolean_ option)
    ?is_required:(is_required_ : boolean_ option)
    ?default_value:(default_value_ : hyper_parameter_value option) ~name:(name_ : parameter_name)
    ~type_:(type__ : parameter_type) () =
  ({
     name = name_;
     description = description_;
     type_ = type__;
     range = range_;
     is_tunable = is_tunable_;
     is_required = is_required_;
     default_value = default_value_;
   }
    : hyper_parameter_specification)

let make_training_specification
    ?training_image_digest:(training_image_digest_ : image_digest option)
    ?supported_hyper_parameters:
      (supported_hyper_parameters_ : hyper_parameter_specifications option)
    ?supports_distributed_training:(supports_distributed_training_ : boolean_ option)
    ?metric_definitions:(metric_definitions_ : metric_definition_list option)
    ?supported_tuning_job_objective_metrics:
      (supported_tuning_job_objective_metrics_ : hyper_parameter_tuning_job_objectives option)
    ?additional_s3_data_source:(additional_s3_data_source_ : additional_s3_data_source option)
    ~training_image:(training_image_ : container_image)
    ~supported_training_instance_types:
      (supported_training_instance_types_ : training_instance_types)
    ~training_channels:(training_channels_ : channel_specifications) () =
  ({
     training_image = training_image_;
     training_image_digest = training_image_digest_;
     supported_hyper_parameters = supported_hyper_parameters_;
     supported_training_instance_types = supported_training_instance_types_;
     supports_distributed_training = supports_distributed_training_;
     metric_definitions = metric_definitions_;
     training_channels = training_channels_;
     supported_tuning_job_objective_metrics = supported_tuning_job_objective_metrics_;
     additional_s3_data_source = additional_s3_data_source_;
   }
    : training_specification)

let make_create_algorithm_input
    ?algorithm_description:(algorithm_description_ : entity_description option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?validation_specification:
      (validation_specification_ : algorithm_validation_specification option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?tags:(tags_ : tag_list option) ~algorithm_name:(algorithm_name_ : entity_name)
    ~training_specification:(training_specification_ : training_specification) () =
  ({
     algorithm_name = algorithm_name_;
     algorithm_description = algorithm_description_;
     training_specification = training_specification_;
     inference_specification = inference_specification_;
     validation_specification = validation_specification_;
     certify_for_marketplace = certify_for_marketplace_;
     tags = tags_;
   }
    : create_algorithm_input)

let make_create_app_response ?app_arn:(app_arn_ : app_arn option) () =
  ({ app_arn = app_arn_ } : create_app_response)

let make_create_app_request ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?space_name:(space_name_ : space_name option) ?tags:(tags_ : tag_list option)
    ?resource_spec:(resource_spec_ : resource_spec option)
    ?recovery_mode:(recovery_mode_ : boolean_ option) ~domain_id:(domain_id_ : domain_id)
    ~app_type:(app_type_ : app_type) ~app_name:(app_name_ : app_name) () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     space_name = space_name_;
     app_type = app_type_;
     app_name = app_name_;
     tags = tags_;
     resource_spec = resource_spec_;
     recovery_mode = recovery_mode_;
   }
    : create_app_request)

let make_create_app_image_config_response
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option) () =
  ({ app_image_config_arn = app_image_config_arn_ } : create_app_image_config_response)

let make_create_app_image_config_request ?tags:(tags_ : tag_list option)
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option)
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({
     app_image_config_name = app_image_config_name_;
     tags = tags_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     code_editor_app_image_config = code_editor_app_image_config_;
   }
    : create_app_image_config_request)

let make_create_artifact_response ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({ artifact_arn = artifact_arn_ } : create_artifact_response)

let make_create_artifact_request ?artifact_name:(artifact_name_ : experiment_entity_name option)
    ?properties:(properties_ : artifact_properties option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?tags:(tags_ : tag_list option) ~source:(source_ : artifact_source)
    ~artifact_type:(artifact_type_ : string256) () =
  ({
     artifact_name = artifact_name_;
     source = source_;
     artifact_type = artifact_type_;
     properties = properties_;
     metadata_properties = metadata_properties_;
     tags = tags_;
   }
    : create_artifact_request)

let make_create_auto_ml_job_response ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn) () =
  ({ auto_ml_job_arn = auto_ml_job_arn_ } : create_auto_ml_job_response)

let make_model_deploy_config
    ?auto_generate_endpoint_name:(auto_generate_endpoint_name_ : auto_generate_endpoint_name option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({ auto_generate_endpoint_name = auto_generate_endpoint_name_; endpoint_name = endpoint_name_ }
    : model_deploy_config)

let make_create_auto_ml_job_request ?problem_type:(problem_type_ : problem_type option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?auto_ml_job_config:(auto_ml_job_config_ : auto_ml_job_config option)
    ?generate_candidate_definitions_only:
      (generate_candidate_definitions_only_ : generate_candidate_definitions_only option)
    ?tags:(tags_ : tag_list option)
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name)
    ~input_data_config:(input_data_config_ : auto_ml_input_data_config)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     auto_ml_job_name = auto_ml_job_name_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     problem_type = problem_type_;
     auto_ml_job_objective = auto_ml_job_objective_;
     auto_ml_job_config = auto_ml_job_config_;
     role_arn = role_arn_;
     generate_candidate_definitions_only = generate_candidate_definitions_only_;
     tags = tags_;
     model_deploy_config = model_deploy_config_;
   }
    : create_auto_ml_job_request)

let make_create_auto_ml_job_v2_response ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn) () =
  ({ auto_ml_job_arn = auto_ml_job_arn_ } : create_auto_ml_job_v2_response)

let make_create_auto_ml_job_v2_request ?tags:(tags_ : tag_list option)
    ?security_config:(security_config_ : auto_ml_security_config option)
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ?data_split_config:(data_split_config_ : auto_ml_data_split_config option)
    ?auto_ml_compute_config:(auto_ml_compute_config_ : auto_ml_compute_config option)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name)
    ~auto_ml_job_input_data_config:(auto_ml_job_input_data_config_ : auto_ml_job_input_data_config)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~auto_ml_problem_type_config:(auto_ml_problem_type_config_ : auto_ml_problem_type_config)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     auto_ml_job_name = auto_ml_job_name_;
     auto_ml_job_input_data_config = auto_ml_job_input_data_config_;
     output_data_config = output_data_config_;
     auto_ml_problem_type_config = auto_ml_problem_type_config_;
     role_arn = role_arn_;
     tags = tags_;
     security_config = security_config_;
     auto_ml_job_objective = auto_ml_job_objective_;
     model_deploy_config = model_deploy_config_;
     data_split_config = data_split_config_;
     auto_ml_compute_config = auto_ml_compute_config_;
   }
    : create_auto_ml_job_v2_request)

let make_create_cluster_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : create_cluster_response)

let make_create_cluster_request
    ?instance_groups:(instance_groups_ : cluster_instance_group_specifications option)
    ?restricted_instance_groups:
      (restricted_instance_groups_ : cluster_restricted_instance_group_specifications option)
    ?restricted_instance_groups_config:
      (restricted_instance_groups_config_ : cluster_restricted_instance_groups_config option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?tags:(tags_ : tag_list option)
    ?orchestrator:(orchestrator_ : cluster_orchestrator option)
    ?node_recovery:(node_recovery_ : cluster_node_recovery option)
    ?tiered_storage_config:(tiered_storage_config_ : cluster_tiered_storage_config option)
    ?node_provisioning_mode:(node_provisioning_mode_ : cluster_node_provisioning_mode option)
    ?cluster_role:(cluster_role_ : role_arn option)
    ?auto_scaling:(auto_scaling_ : cluster_auto_scaling_config option)
    ~cluster_name:(cluster_name_ : cluster_name) () =
  ({
     cluster_name = cluster_name_;
     instance_groups = instance_groups_;
     restricted_instance_groups = restricted_instance_groups_;
     restricted_instance_groups_config = restricted_instance_groups_config_;
     vpc_config = vpc_config_;
     tags = tags_;
     orchestrator = orchestrator_;
     node_recovery = node_recovery_;
     tiered_storage_config = tiered_storage_config_;
     node_provisioning_mode = node_provisioning_mode_;
     cluster_role = cluster_role_;
     auto_scaling = auto_scaling_;
   }
    : create_cluster_request)

let make_create_cluster_scheduler_config_response
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id) () =
  ({
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
   }
    : create_cluster_scheduler_config_response)

let make_priority_class ~name:(name_ : cluster_scheduler_priority_class_name)
    ~weight:(weight_ : priority_weight) () =
  ({ name = name_; weight = weight_ } : priority_class)

let make_scheduler_config ?priority_classes:(priority_classes_ : priority_class_list option)
    ?fair_share:(fair_share_ : fair_share option)
    ?idle_resource_sharing:(idle_resource_sharing_ : idle_resource_sharing option) () =
  ({
     priority_classes = priority_classes_;
     fair_share = fair_share_;
     idle_resource_sharing = idle_resource_sharing_;
   }
    : scheduler_config)

let make_create_cluster_scheduler_config_request
    ?description:(description_ : entity_description option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : entity_name) ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~scheduler_config:(scheduler_config_ : scheduler_config) () =
  ({
     name = name_;
     cluster_arn = cluster_arn_;
     scheduler_config = scheduler_config_;
     description = description_;
     tags = tags_;
   }
    : create_cluster_scheduler_config_request)

let make_create_code_repository_output
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn) () =
  ({ code_repository_arn = code_repository_arn_ } : create_code_repository_output)

let make_create_code_repository_input ?tags:(tags_ : tag_list option)
    ~code_repository_name:(code_repository_name_ : entity_name)
    ~git_config:(git_config_ : git_config) () =
  ({ code_repository_name = code_repository_name_; git_config = git_config_; tags = tags_ }
    : create_code_repository_input)

let make_create_compilation_job_response
    ~compilation_job_arn:(compilation_job_arn_ : compilation_job_arn) () =
  ({ compilation_job_arn = compilation_job_arn_ } : create_compilation_job_response)

let make_neo_vpc_config ~security_group_ids:(security_group_ids_ : neo_vpc_security_group_ids)
    ~subnets:(subnets_ : neo_vpc_subnets) () =
  ({ security_group_ids = security_group_ids_; subnets = subnets_ } : neo_vpc_config)

let make_target_platform ?accelerator:(accelerator_ : target_platform_accelerator option)
    ~os:(os_ : target_platform_os) ~arch:(arch_ : target_platform_arch) () =
  ({ os = os_; arch = arch_; accelerator = accelerator_ } : target_platform)

let make_output_config ?target_device:(target_device_ : target_device option)
    ?target_platform:(target_platform_ : target_platform option)
    ?compiler_options:(compiler_options_ : compiler_options option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ~s3_output_location:(s3_output_location_ : s3_uri)
    () =
  ({
     s3_output_location = s3_output_location_;
     target_device = target_device_;
     target_platform = target_platform_;
     compiler_options = compiler_options_;
     kms_key_id = kms_key_id_;
   }
    : output_config)

let make_input_config ?data_input_config:(data_input_config_ : data_input_config option)
    ?framework_version:(framework_version_ : framework_version option) ~s3_uri:(s3_uri_ : s3_uri)
    ~framework:(framework_ : framework) () =
  ({
     s3_uri = s3_uri_;
     data_input_config = data_input_config_;
     framework = framework_;
     framework_version = framework_version_;
   }
    : input_config)

let make_create_compilation_job_request
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option)
    ?input_config:(input_config_ : input_config option)
    ?vpc_config:(vpc_config_ : neo_vpc_config option) ?tags:(tags_ : tag_list option)
    ~compilation_job_name:(compilation_job_name_ : entity_name) ~role_arn:(role_arn_ : role_arn)
    ~output_config:(output_config_ : output_config)
    ~stopping_condition:(stopping_condition_ : stopping_condition) () =
  ({
     compilation_job_name = compilation_job_name_;
     role_arn = role_arn_;
     model_package_version_arn = model_package_version_arn_;
     input_config = input_config_;
     output_config = output_config_;
     vpc_config = vpc_config_;
     stopping_condition = stopping_condition_;
     tags = tags_;
   }
    : create_compilation_job_request)

let make_create_compute_quota_response ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id) () =
  ({ compute_quota_arn = compute_quota_arn_; compute_quota_id = compute_quota_id_ }
    : create_compute_quota_response)

let make_create_compute_quota_request ?description:(description_ : entity_description option)
    ?activation_state:(activation_state_ : activation_state option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : entity_name) ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~compute_quota_config:(compute_quota_config_ : compute_quota_config)
    ~compute_quota_target:(compute_quota_target_ : compute_quota_target) () =
  ({
     name = name_;
     description = description_;
     cluster_arn = cluster_arn_;
     compute_quota_config = compute_quota_config_;
     compute_quota_target = compute_quota_target_;
     activation_state = activation_state_;
     tags = tags_;
   }
    : create_compute_quota_request)

let make_create_context_response ?context_arn:(context_arn_ : context_arn option) () =
  ({ context_arn = context_arn_ } : create_context_response)

let make_create_context_request ?description:(description_ : experiment_description option)
    ?properties:(properties_ : lineage_entity_parameters option) ?tags:(tags_ : tag_list option)
    ~context_name:(context_name_ : context_name) ~source:(source_ : context_source)
    ~context_type:(context_type_ : string256) () =
  ({
     context_name = context_name_;
     source = source_;
     context_type = context_type_;
     description = description_;
     properties = properties_;
     tags = tags_;
   }
    : create_context_request)

let make_create_data_quality_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ } : create_data_quality_job_definition_response)

let make_monitoring_stopping_condition
    ~max_runtime_in_seconds:(max_runtime_in_seconds_ : monitoring_max_runtime_in_seconds) () =
  ({ max_runtime_in_seconds = max_runtime_in_seconds_ } : monitoring_stopping_condition)

let make_monitoring_network_config
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?vpc_config:(vpc_config_ : vpc_config option) () =
  ({
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_network_isolation = enable_network_isolation_;
     vpc_config = vpc_config_;
   }
    : monitoring_network_config)

let make_monitoring_cluster_config ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ~instance_count:(instance_count_ : processing_instance_count)
    ~instance_type:(instance_type_ : processing_instance_type)
    ~volume_size_in_g_b:(volume_size_in_g_b_ : processing_volume_size_in_g_b) () =
  ({
     instance_count = instance_count_;
     instance_type = instance_type_;
     volume_size_in_g_b = volume_size_in_g_b_;
     volume_kms_key_id = volume_kms_key_id_;
   }
    : monitoring_cluster_config)

let make_monitoring_resources ~cluster_config:(cluster_config_ : monitoring_cluster_config) () =
  ({ cluster_config = cluster_config_ } : monitoring_resources)

let make_monitoring_s3_output ?s3_upload_mode:(s3_upload_mode_ : processing_s3_upload_mode option)
    ~s3_uri:(s3_uri_ : monitoring_s3_uri) ~local_path:(local_path_ : processing_local_path) () =
  ({ s3_uri = s3_uri_; local_path = local_path_; s3_upload_mode = s3_upload_mode_ }
    : monitoring_s3_output)

let make_monitoring_output ~s3_output:(s3_output_ : monitoring_s3_output) () =
  ({ s3_output = s3_output_ } : monitoring_output)

let make_monitoring_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~monitoring_outputs:(monitoring_outputs_ : monitoring_outputs) () =
  ({ monitoring_outputs = monitoring_outputs_; kms_key_id = kms_key_id_ }
    : monitoring_output_config)

let make_endpoint_input ?s3_input_mode:(s3_input_mode_ : processing_s3_input_mode option)
    ?s3_data_distribution_type:
      (s3_data_distribution_type_ : processing_s3_data_distribution_type option)
    ?features_attribute:(features_attribute_ : string_ option)
    ?inference_attribute:(inference_attribute_ : string_ option)
    ?probability_attribute:(probability_attribute_ : string_ option)
    ?probability_threshold_attribute:
      (probability_threshold_attribute_ : probability_threshold_attribute option)
    ?start_time_offset:(start_time_offset_ : monitoring_time_offset_string option)
    ?end_time_offset:(end_time_offset_ : monitoring_time_offset_string option)
    ?exclude_features_attribute:(exclude_features_attribute_ : exclude_features_attribute option)
    ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~local_path:(local_path_ : processing_local_path) () =
  ({
     endpoint_name = endpoint_name_;
     local_path = local_path_;
     s3_input_mode = s3_input_mode_;
     s3_data_distribution_type = s3_data_distribution_type_;
     features_attribute = features_attribute_;
     inference_attribute = inference_attribute_;
     probability_attribute = probability_attribute_;
     probability_threshold_attribute = probability_threshold_attribute_;
     start_time_offset = start_time_offset_;
     end_time_offset = end_time_offset_;
     exclude_features_attribute = exclude_features_attribute_;
   }
    : endpoint_input)

let make_data_quality_job_input ?endpoint_input:(endpoint_input_ : endpoint_input option)
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option) () =
  ({ endpoint_input = endpoint_input_; batch_transform_input = batch_transform_input_ }
    : data_quality_job_input)

let make_data_quality_app_specification
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ?container_arguments:(container_arguments_ : monitoring_container_arguments option)
    ?record_preprocessor_source_uri:(record_preprocessor_source_uri_ : s3_uri option)
    ?post_analytics_processor_source_uri:(post_analytics_processor_source_uri_ : s3_uri option)
    ?environment:(environment_ : monitoring_environment_map option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     image_uri = image_uri_;
     container_entrypoint = container_entrypoint_;
     container_arguments = container_arguments_;
     record_preprocessor_source_uri = record_preprocessor_source_uri_;
     post_analytics_processor_source_uri = post_analytics_processor_source_uri_;
     environment = environment_;
   }
    : data_quality_app_specification)

let make_monitoring_statistics_resource ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ s3_uri = s3_uri_ } : monitoring_statistics_resource)

let make_monitoring_constraints_resource ?s3_uri:(s3_uri_ : s3_uri option) () =
  ({ s3_uri = s3_uri_ } : monitoring_constraints_resource)

let make_data_quality_baseline_config
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option)
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option)
    ?statistics_resource:(statistics_resource_ : monitoring_statistics_resource option) () =
  ({
     baselining_job_name = baselining_job_name_;
     constraints_resource = constraints_resource_;
     statistics_resource = statistics_resource_;
   }
    : data_quality_baseline_config)

let make_create_data_quality_job_definition_request
    ?data_quality_baseline_config:
      (data_quality_baseline_config_ : data_quality_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?tags:(tags_ : tag_list option)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~data_quality_app_specification:
      (data_quality_app_specification_ : data_quality_app_specification)
    ~data_quality_job_input:(data_quality_job_input_ : data_quality_job_input)
    ~data_quality_job_output_config:(data_quality_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_name = job_definition_name_;
     data_quality_baseline_config = data_quality_baseline_config_;
     data_quality_app_specification = data_quality_app_specification_;
     data_quality_job_input = data_quality_job_input_;
     data_quality_job_output_config = data_quality_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
     tags = tags_;
   }
    : create_data_quality_job_definition_request)

let make_edge_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?preset_deployment_type:(preset_deployment_type_ : edge_preset_deployment_type option)
    ?preset_deployment_config:(preset_deployment_config_ : string_ option)
    ~s3_output_location:(s3_output_location_ : s3_uri) () =
  ({
     s3_output_location = s3_output_location_;
     kms_key_id = kms_key_id_;
     preset_deployment_type = preset_deployment_type_;
     preset_deployment_config = preset_deployment_config_;
   }
    : edge_output_config)

let make_create_device_fleet_request ?role_arn:(role_arn_ : role_arn option)
    ?description:(description_ : device_fleet_description option) ?tags:(tags_ : tag_list option)
    ?enable_iot_role_alias:(enable_iot_role_alias_ : enable_iot_role_alias option)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~output_config:(output_config_ : edge_output_config) () =
  ({
     device_fleet_name = device_fleet_name_;
     role_arn = role_arn_;
     description = description_;
     output_config = output_config_;
     tags = tags_;
     enable_iot_role_alias = enable_iot_role_alias_;
   }
    : create_device_fleet_request)

let make_create_domain_response ?domain_arn:(domain_arn_ : domain_arn option)
    ?domain_id:(domain_id_ : domain_id option) ?url:(url_ : string1024 option) () =
  ({ domain_arn = domain_arn_; domain_id = domain_id_; url = url_ } : create_domain_response)

let make_s3_file_system_config ?mount_path:(mount_path_ : string1024 option)
    ~s3_uri:(s3_uri_ : s3_schema_uri) () =
  ({ mount_path = mount_path_; s3_uri = s3_uri_ } : s3_file_system_config)

let make_f_sx_lustre_file_system_config
    ?file_system_path:(file_system_path_ : file_system_path option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_; file_system_path = file_system_path_ }
    : f_sx_lustre_file_system_config)

let make_efs_file_system_config ?file_system_path:(file_system_path_ : file_system_path option)
    ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_; file_system_path = file_system_path_ }
    : efs_file_system_config)

let make_custom_posix_user_config ~uid:(uid_ : uid) ~gid:(gid_ : gid) () =
  ({ uid = uid_; gid = gid_ } : custom_posix_user_config)

let make_default_ebs_storage_settings
    ~default_ebs_volume_size_in_gb:(default_ebs_volume_size_in_gb_ : space_ebs_volume_size_in_gb)
    ~maximum_ebs_volume_size_in_gb:(maximum_ebs_volume_size_in_gb_ : space_ebs_volume_size_in_gb) ()
    =
  ({
     default_ebs_volume_size_in_gb = default_ebs_volume_size_in_gb_;
     maximum_ebs_volume_size_in_gb = maximum_ebs_volume_size_in_gb_;
   }
    : default_ebs_storage_settings)

let make_default_space_storage_settings
    ?default_ebs_storage_settings:
      (default_ebs_storage_settings_ : default_ebs_storage_settings option) () =
  ({ default_ebs_storage_settings = default_ebs_storage_settings_ }
    : default_space_storage_settings)

let make_emr_settings ?assumable_role_arns:(assumable_role_arns_ : assumable_role_arns option)
    ?execution_role_arns:(execution_role_arns_ : execution_role_arns option) () =
  ({ assumable_role_arns = assumable_role_arns_; execution_role_arns = execution_role_arns_ }
    : emr_settings)

let make_jupyter_lab_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?custom_images:(custom_images_ : custom_images option)
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option)
    ?code_repositories:(code_repositories_ : code_repositories option)
    ?app_lifecycle_management:(app_lifecycle_management_ : app_lifecycle_management option)
    ?emr_settings:(emr_settings_ : emr_settings option)
    ?built_in_lifecycle_config_arn:
      (built_in_lifecycle_config_arn_ : studio_lifecycle_config_arn option) () =
  ({
     default_resource_spec = default_resource_spec_;
     custom_images = custom_images_;
     lifecycle_config_arns = lifecycle_config_arns_;
     code_repositories = code_repositories_;
     app_lifecycle_management = app_lifecycle_management_;
     emr_settings = emr_settings_;
     built_in_lifecycle_config_arn = built_in_lifecycle_config_arn_;
   }
    : jupyter_lab_app_settings)

let make_kernel_gateway_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?custom_images:(custom_images_ : custom_images option)
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option) () =
  ({
     default_resource_spec = default_resource_spec_;
     custom_images = custom_images_;
     lifecycle_config_arns = lifecycle_config_arns_;
   }
    : kernel_gateway_app_settings)

let make_jupyter_server_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?lifecycle_config_arns:(lifecycle_config_arns_ : lifecycle_config_arns option)
    ?code_repositories:(code_repositories_ : code_repositories option) () =
  ({
     default_resource_spec = default_resource_spec_;
     lifecycle_config_arns = lifecycle_config_arns_;
     code_repositories = code_repositories_;
   }
    : jupyter_server_app_settings)

let make_default_space_settings ?execution_role:(execution_role_ : role_arn option)
    ?security_groups:(security_groups_ : security_group_ids option)
    ?jupyter_server_app_settings:(jupyter_server_app_settings_ : jupyter_server_app_settings option)
    ?kernel_gateway_app_settings:(kernel_gateway_app_settings_ : kernel_gateway_app_settings option)
    ?jupyter_lab_app_settings:(jupyter_lab_app_settings_ : jupyter_lab_app_settings option)
    ?space_storage_settings:(space_storage_settings_ : default_space_storage_settings option)
    ?custom_posix_user_config:(custom_posix_user_config_ : custom_posix_user_config option)
    ?custom_file_system_configs:(custom_file_system_configs_ : custom_file_system_configs option) ()
    =
  ({
     execution_role = execution_role_;
     security_groups = security_groups_;
     jupyter_server_app_settings = jupyter_server_app_settings_;
     kernel_gateway_app_settings = kernel_gateway_app_settings_;
     jupyter_lab_app_settings = jupyter_lab_app_settings_;
     space_storage_settings = space_storage_settings_;
     custom_posix_user_config = custom_posix_user_config_;
     custom_file_system_configs = custom_file_system_configs_;
   }
    : default_space_settings)

let make_unified_studio_settings
    ?studio_web_portal_access:(studio_web_portal_access_ : feature_status option)
    ?domain_account_id:(domain_account_id_ : account_id option)
    ?domain_region:(domain_region_ : region_name option)
    ?domain_id:(domain_id_ : unified_studio_domain_id option)
    ?project_id:(project_id_ : unified_studio_project_id option)
    ?environment_id:(environment_id_ : unified_studio_environment_id option)
    ?project_s3_path:(project_s3_path_ : s3_uri option)
    ?single_sign_on_application_arn:
      (single_sign_on_application_arn_ : single_sign_on_application_arn option) () =
  ({
     studio_web_portal_access = studio_web_portal_access_;
     domain_account_id = domain_account_id_;
     domain_region = domain_region_;
     domain_id = domain_id_;
     project_id = project_id_;
     environment_id = environment_id_;
     project_s3_path = project_s3_path_;
     single_sign_on_application_arn = single_sign_on_application_arn_;
   }
    : unified_studio_settings)

let make_docker_settings ?enable_docker_access:(enable_docker_access_ : feature_status option)
    ?vpc_only_trusted_accounts:(vpc_only_trusted_accounts_ : vpc_only_trusted_accounts option)
    ?rootless_docker:(rootless_docker_ : feature_status option) () =
  ({
     enable_docker_access = enable_docker_access_;
     vpc_only_trusted_accounts = vpc_only_trusted_accounts_;
     rootless_docker = rootless_docker_;
   }
    : docker_settings)

let make_trusted_identity_propagation_settings ~status:(status_ : feature_status) () =
  ({ status = status_ } : trusted_identity_propagation_settings)

let make_r_studio_server_pro_domain_settings
    ?r_studio_connect_url:(r_studio_connect_url_ : string_ option)
    ?r_studio_package_manager_url:(r_studio_package_manager_url_ : string_ option)
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ~domain_execution_role_arn:(domain_execution_role_arn_ : role_arn) () =
  ({
     domain_execution_role_arn = domain_execution_role_arn_;
     r_studio_connect_url = r_studio_connect_url_;
     r_studio_package_manager_url = r_studio_package_manager_url_;
     default_resource_spec = default_resource_spec_;
   }
    : r_studio_server_pro_domain_settings)

let make_domain_settings
    ?security_group_ids:(security_group_ids_ : domain_security_group_ids option)
    ?r_studio_server_pro_domain_settings:
      (r_studio_server_pro_domain_settings_ : r_studio_server_pro_domain_settings option)
    ?execution_role_identity_config:
      (execution_role_identity_config_ : execution_role_identity_config option)
    ?trusted_identity_propagation_settings:
      (trusted_identity_propagation_settings_ : trusted_identity_propagation_settings option)
    ?docker_settings:(docker_settings_ : docker_settings option)
    ?amazon_q_settings:(amazon_q_settings_ : amazon_q_settings option)
    ?unified_studio_settings:(unified_studio_settings_ : unified_studio_settings option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option) () =
  ({
     security_group_ids = security_group_ids_;
     r_studio_server_pro_domain_settings = r_studio_server_pro_domain_settings_;
     execution_role_identity_config = execution_role_identity_config_;
     trusted_identity_propagation_settings = trusted_identity_propagation_settings_;
     docker_settings = docker_settings_;
     amazon_q_settings = amazon_q_settings_;
     unified_studio_settings = unified_studio_settings_;
     ip_address_type = ip_address_type_;
   }
    : domain_settings)

let make_hidden_sage_maker_image
    ?sage_maker_image_name:(sage_maker_image_name_ : sage_maker_image_name option)
    ?version_aliases:(version_aliases_ : version_aliases_list option) () =
  ({ sage_maker_image_name = sage_maker_image_name_; version_aliases = version_aliases_ }
    : hidden_sage_maker_image)

let make_studio_web_portal_settings
    ?hidden_ml_tools:(hidden_ml_tools_ : hidden_ml_tools_list option)
    ?hidden_app_types:(hidden_app_types_ : hidden_app_types_list option)
    ?hidden_instance_types:(hidden_instance_types_ : hidden_instance_types_list option)
    ?hidden_sage_maker_image_version_aliases:
      (hidden_sage_maker_image_version_aliases_ :
         hidden_sage_maker_image_version_aliases_list option)
    ?execution_role_session_name_mode:
      (execution_role_session_name_mode_ : execution_role_session_name_mode option) () =
  ({
     hidden_ml_tools = hidden_ml_tools_;
     hidden_app_types = hidden_app_types_;
     hidden_instance_types = hidden_instance_types_;
     hidden_sage_maker_image_version_aliases = hidden_sage_maker_image_version_aliases_;
     execution_role_session_name_mode = execution_role_session_name_mode_;
   }
    : studio_web_portal_settings)

let make_r_session_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?custom_images:(custom_images_ : custom_images option) () =
  ({ default_resource_spec = default_resource_spec_; custom_images = custom_images_ }
    : r_session_app_settings)

let make_r_studio_server_pro_app_settings
    ?access_status:(access_status_ : r_studio_server_pro_access_status option)
    ?user_group:(user_group_ : r_studio_server_pro_user_group option) () =
  ({ access_status = access_status_; user_group = user_group_ } : r_studio_server_pro_app_settings)

let make_tensor_board_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option) () =
  ({ default_resource_spec = default_resource_spec_ } : tensor_board_app_settings)

let make_sharing_settings
    ?notebook_output_option:(notebook_output_option_ : notebook_output_option option)
    ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?s3_kms_key_id:(s3_kms_key_id_ : kms_key_id option) () =
  ({
     notebook_output_option = notebook_output_option_;
     s3_output_path = s3_output_path_;
     s3_kms_key_id = s3_kms_key_id_;
   }
    : sharing_settings)

let make_user_settings ?execution_role:(execution_role_ : role_arn option)
    ?security_groups:(security_groups_ : security_group_ids option)
    ?sharing_settings:(sharing_settings_ : sharing_settings option)
    ?jupyter_server_app_settings:(jupyter_server_app_settings_ : jupyter_server_app_settings option)
    ?kernel_gateway_app_settings:(kernel_gateway_app_settings_ : kernel_gateway_app_settings option)
    ?tensor_board_app_settings:(tensor_board_app_settings_ : tensor_board_app_settings option)
    ?r_studio_server_pro_app_settings:
      (r_studio_server_pro_app_settings_ : r_studio_server_pro_app_settings option)
    ?r_session_app_settings:(r_session_app_settings_ : r_session_app_settings option)
    ?canvas_app_settings:(canvas_app_settings_ : canvas_app_settings option)
    ?code_editor_app_settings:(code_editor_app_settings_ : code_editor_app_settings option)
    ?jupyter_lab_app_settings:(jupyter_lab_app_settings_ : jupyter_lab_app_settings option)
    ?space_storage_settings:(space_storage_settings_ : default_space_storage_settings option)
    ?default_landing_uri:(default_landing_uri_ : landing_uri option)
    ?studio_web_portal:(studio_web_portal_ : studio_web_portal option)
    ?custom_posix_user_config:(custom_posix_user_config_ : custom_posix_user_config option)
    ?custom_file_system_configs:(custom_file_system_configs_ : custom_file_system_configs option)
    ?studio_web_portal_settings:(studio_web_portal_settings_ : studio_web_portal_settings option)
    ?auto_mount_home_ef_s:(auto_mount_home_ef_s_ : auto_mount_home_ef_s option) () =
  ({
     execution_role = execution_role_;
     security_groups = security_groups_;
     sharing_settings = sharing_settings_;
     jupyter_server_app_settings = jupyter_server_app_settings_;
     kernel_gateway_app_settings = kernel_gateway_app_settings_;
     tensor_board_app_settings = tensor_board_app_settings_;
     r_studio_server_pro_app_settings = r_studio_server_pro_app_settings_;
     r_session_app_settings = r_session_app_settings_;
     canvas_app_settings = canvas_app_settings_;
     code_editor_app_settings = code_editor_app_settings_;
     jupyter_lab_app_settings = jupyter_lab_app_settings_;
     space_storage_settings = space_storage_settings_;
     default_landing_uri = default_landing_uri_;
     studio_web_portal = studio_web_portal_;
     custom_posix_user_config = custom_posix_user_config_;
     custom_file_system_configs = custom_file_system_configs_;
     studio_web_portal_settings = studio_web_portal_settings_;
     auto_mount_home_ef_s = auto_mount_home_ef_s_;
   }
    : user_settings)

let make_create_domain_request ?domain_settings:(domain_settings_ : domain_settings option)
    ?subnet_ids:(subnet_ids_ : subnets option) ?vpc_id:(vpc_id_ : vpc_id option)
    ?tags:(tags_ : tag_list option)
    ?app_network_access_type:(app_network_access_type_ : app_network_access_type option)
    ?home_efs_file_system_kms_key_id:(home_efs_file_system_kms_key_id_ : kms_key_id option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?app_security_group_management:
      (app_security_group_management_ : app_security_group_management option)
    ?home_efs_file_system_creation:
      (home_efs_file_system_creation_ : home_efs_file_system_creation option)
    ?tag_propagation:(tag_propagation_ : tag_propagation option)
    ?default_space_settings:(default_space_settings_ : default_space_settings option)
    ~domain_name:(domain_name_ : domain_name) ~auth_mode:(auth_mode_ : auth_mode)
    ~default_user_settings:(default_user_settings_ : user_settings) () =
  ({
     domain_name = domain_name_;
     auth_mode = auth_mode_;
     default_user_settings = default_user_settings_;
     domain_settings = domain_settings_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     tags = tags_;
     app_network_access_type = app_network_access_type_;
     home_efs_file_system_kms_key_id = home_efs_file_system_kms_key_id_;
     kms_key_id = kms_key_id_;
     app_security_group_management = app_security_group_management_;
     home_efs_file_system_creation = home_efs_file_system_creation_;
     tag_propagation = tag_propagation_;
     default_space_settings = default_space_settings_;
   }
    : create_domain_request)

let make_create_edge_deployment_plan_response
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn) () =
  ({ edge_deployment_plan_arn = edge_deployment_plan_arn_ } : create_edge_deployment_plan_response)

let make_edge_deployment_config
    ~failure_handling_policy:(failure_handling_policy_ : failure_handling_policy) () =
  ({ failure_handling_policy = failure_handling_policy_ } : edge_deployment_config)

let make_device_selection_config ?percentage:(percentage_ : percentage option)
    ?device_names:(device_names_ : device_names option)
    ?device_name_contains:(device_name_contains_ : device_name option)
    ~device_subset_type:(device_subset_type_ : device_subset_type) () =
  ({
     device_subset_type = device_subset_type_;
     percentage = percentage_;
     device_names = device_names_;
     device_name_contains = device_name_contains_;
   }
    : device_selection_config)

let make_deployment_stage ?deployment_config:(deployment_config_ : edge_deployment_config option)
    ~stage_name:(stage_name_ : entity_name)
    ~device_selection_config:(device_selection_config_ : device_selection_config) () =
  ({
     stage_name = stage_name_;
     device_selection_config = device_selection_config_;
     deployment_config = deployment_config_;
   }
    : deployment_stage)

let make_edge_deployment_model_config ~model_handle:(model_handle_ : entity_name)
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name) () =
  ({ model_handle = model_handle_; edge_packaging_job_name = edge_packaging_job_name_ }
    : edge_deployment_model_config)

let make_create_edge_deployment_plan_request ?stages:(stages_ : deployment_stages option)
    ?tags:(tags_ : tag_list option)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~model_configs:(model_configs_ : edge_deployment_model_configs)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({
     edge_deployment_plan_name = edge_deployment_plan_name_;
     model_configs = model_configs_;
     device_fleet_name = device_fleet_name_;
     stages = stages_;
     tags = tags_;
   }
    : create_edge_deployment_plan_request)

let make_create_edge_deployment_stage_request
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~stages:(stages_ : deployment_stages) () =
  ({ edge_deployment_plan_name = edge_deployment_plan_name_; stages = stages_ }
    : create_edge_deployment_stage_request)

let make_create_edge_packaging_job_request ?resource_key:(resource_key_ : kms_key_id option)
    ?tags:(tags_ : tag_list option)
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name)
    ~compilation_job_name:(compilation_job_name_ : entity_name)
    ~model_name:(model_name_ : entity_name) ~model_version:(model_version_ : edge_version)
    ~role_arn:(role_arn_ : role_arn) ~output_config:(output_config_ : edge_output_config) () =
  ({
     edge_packaging_job_name = edge_packaging_job_name_;
     compilation_job_name = compilation_job_name_;
     model_name = model_name_;
     model_version = model_version_;
     role_arn = role_arn_;
     output_config = output_config_;
     resource_key = resource_key_;
     tags = tags_;
   }
    : create_edge_packaging_job_request)

let make_create_endpoint_output ~endpoint_arn:(endpoint_arn_ : endpoint_arn) () =
  ({ endpoint_arn = endpoint_arn_ } : create_endpoint_output)

let make_rolling_update_policy
    ?maximum_execution_timeout_in_seconds:
      (maximum_execution_timeout_in_seconds_ : maximum_execution_timeout_in_seconds option)
    ?rollback_maximum_batch_size:(rollback_maximum_batch_size_ : capacity_size option)
    ~maximum_batch_size:(maximum_batch_size_ : capacity_size)
    ~wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_interval_in_seconds) () =
  ({
     maximum_batch_size = maximum_batch_size_;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     maximum_execution_timeout_in_seconds = maximum_execution_timeout_in_seconds_;
     rollback_maximum_batch_size = rollback_maximum_batch_size_;
   }
    : rolling_update_policy)

let make_deployment_config
    ?blue_green_update_policy:(blue_green_update_policy_ : blue_green_update_policy option)
    ?rolling_update_policy:(rolling_update_policy_ : rolling_update_policy option)
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_config option) () =
  ({
     blue_green_update_policy = blue_green_update_policy_;
     rolling_update_policy = rolling_update_policy_;
     auto_rollback_configuration = auto_rollback_configuration_;
   }
    : deployment_config)

let make_create_endpoint_input ?deployment_config:(deployment_config_ : deployment_config option)
    ?tags:(tags_ : tag_list option) ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_config_name = endpoint_config_name_;
     deployment_config = deployment_config_;
     tags = tags_;
   }
    : create_endpoint_input)

let make_create_endpoint_config_output
    ~endpoint_config_arn:(endpoint_config_arn_ : endpoint_config_arn) () =
  ({ endpoint_config_arn = endpoint_config_arn_ } : create_endpoint_config_output)

let make_metrics_config
    ?enable_enhanced_metrics:(enable_enhanced_metrics_ : enable_enhanced_metrics option)
    ?enable_detailed_observability:
      (enable_detailed_observability_ : enable_detailed_observability option)
    ?metric_publish_frequency_in_seconds:
      (metric_publish_frequency_in_seconds_ : metric_publish_frequency_in_seconds option) () =
  ({
     enable_enhanced_metrics = enable_enhanced_metrics_;
     enable_detailed_observability = enable_detailed_observability_;
     metric_publish_frequency_in_seconds = metric_publish_frequency_in_seconds_;
   }
    : metrics_config)

let make_production_variant_capacity_reservation_config
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference option)
    ?ml_reservation_arn:(ml_reservation_arn_ : ml_reservation_arn option) () =
  ({
     capacity_reservation_preference = capacity_reservation_preference_;
     ml_reservation_arn = ml_reservation_arn_;
   }
    : production_variant_capacity_reservation_config)

let make_production_variant_routing_config ~routing_strategy:(routing_strategy_ : routing_strategy)
    () =
  ({ routing_strategy = routing_strategy_ } : production_variant_routing_config)

let make_production_variant_managed_instance_scaling_scale_in_policy
    ?maximum_step_size:(maximum_step_size_ : managed_instance_scaling_maximum_step_size option)
    ?cooldown_in_minutes:
      (cooldown_in_minutes_ : managed_instance_scaling_cooldown_in_minutes option)
    ~strategy:(strategy_ : managed_instance_scaling_scale_in_strategy) () =
  ({
     strategy = strategy_;
     maximum_step_size = maximum_step_size_;
     cooldown_in_minutes = cooldown_in_minutes_;
   }
    : production_variant_managed_instance_scaling_scale_in_policy)

let make_production_variant_managed_instance_scaling
    ?status:(status_ : managed_instance_scaling_status option)
    ?min_instance_count:(min_instance_count_ : managed_instance_scaling_min_instance_count option)
    ?max_instance_count:(max_instance_count_ : managed_instance_scaling_max_instance_count option)
    ?scale_in_policy:
      (scale_in_policy_ : production_variant_managed_instance_scaling_scale_in_policy option) () =
  ({
     status = status_;
     min_instance_count = min_instance_count_;
     max_instance_count = max_instance_count_;
     scale_in_policy = scale_in_policy_;
   }
    : production_variant_managed_instance_scaling)

let make_production_variant_serverless_config
    ?provisioned_concurrency:(provisioned_concurrency_ : serverless_provisioned_concurrency option)
    ~memory_size_in_m_b:(memory_size_in_m_b_ : serverless_memory_size_in_m_b)
    ~max_concurrency:(max_concurrency_ : serverless_max_concurrency) () =
  ({
     memory_size_in_m_b = memory_size_in_m_b_;
     max_concurrency = max_concurrency_;
     provisioned_concurrency = provisioned_concurrency_;
   }
    : production_variant_serverless_config)

let make_production_variant_core_dump_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~destination_s3_uri:(destination_s3_uri_ : destination_s3_uri) () =
  ({ destination_s3_uri = destination_s3_uri_; kms_key_id = kms_key_id_ }
    : production_variant_core_dump_config)

let make_instance_pool ?model_name_override:(model_name_override_ : model_name option)
    ~instance_type:(instance_type_ : production_variant_instance_type)
    ~priority:(priority_ : instance_pool_priority) () =
  ({
     instance_type = instance_type_;
     model_name_override = model_name_override_;
     priority = priority_;
   }
    : instance_pool)

let make_production_variant ?model_name:(model_name_ : model_name option)
    ?initial_instance_count:(initial_instance_count_ : initial_task_count option)
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?instance_pools:(instance_pools_ : instance_pool_list option)
    ?variant_instance_provision_timeout_in_seconds:
      (variant_instance_provision_timeout_in_seconds_ :
         variant_instance_provision_timeout_in_seconds option)
    ?initial_variant_weight:(initial_variant_weight_ : variant_weight option)
    ?accelerator_type:(accelerator_type_ : production_variant_accelerator_type option)
    ?core_dump_config:(core_dump_config_ : production_variant_core_dump_config option)
    ?serverless_config:(serverless_config_ : production_variant_serverless_config option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : production_variant_volume_size_in_g_b option)
    ?model_data_download_timeout_in_seconds:
      (model_data_download_timeout_in_seconds_ :
         production_variant_model_data_download_timeout_in_seconds option)
    ?container_startup_health_check_timeout_in_seconds:
      (container_startup_health_check_timeout_in_seconds_ :
         production_variant_container_startup_health_check_timeout_in_seconds option)
    ?enable_ssm_access:(enable_ssm_access_ : production_variant_ssm_access option)
    ?managed_instance_scaling:
      (managed_instance_scaling_ : production_variant_managed_instance_scaling option)
    ?routing_config:(routing_config_ : production_variant_routing_config option)
    ?inference_ami_version:
      (inference_ami_version_ : production_variant_inference_ami_version option)
    ?capacity_reservation_config:
      (capacity_reservation_config_ : production_variant_capacity_reservation_config option)
    ~variant_name:(variant_name_ : variant_name) () =
  ({
     variant_name = variant_name_;
     model_name = model_name_;
     initial_instance_count = initial_instance_count_;
     instance_type = instance_type_;
     instance_pools = instance_pools_;
     variant_instance_provision_timeout_in_seconds = variant_instance_provision_timeout_in_seconds_;
     initial_variant_weight = initial_variant_weight_;
     accelerator_type = accelerator_type_;
     core_dump_config = core_dump_config_;
     serverless_config = serverless_config_;
     volume_size_in_g_b = volume_size_in_g_b_;
     model_data_download_timeout_in_seconds = model_data_download_timeout_in_seconds_;
     container_startup_health_check_timeout_in_seconds =
       container_startup_health_check_timeout_in_seconds_;
     enable_ssm_access = enable_ssm_access_;
     managed_instance_scaling = managed_instance_scaling_;
     routing_config = routing_config_;
     inference_ami_version = inference_ami_version_;
     capacity_reservation_config = capacity_reservation_config_;
   }
    : production_variant)

let make_explainer_config
    ?clarify_explainer_config:(clarify_explainer_config_ : clarify_explainer_config option) () =
  ({ clarify_explainer_config = clarify_explainer_config_ } : explainer_config)

let make_data_capture_config ?enable_capture:(enable_capture_ : enable_capture option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?capture_content_type_header:(capture_content_type_header_ : capture_content_type_header option)
    ~initial_sampling_percentage:(initial_sampling_percentage_ : sampling_percentage)
    ~destination_s3_uri:(destination_s3_uri_ : destination_s3_uri)
    ~capture_options:(capture_options_ : capture_option_list) () =
  ({
     enable_capture = enable_capture_;
     initial_sampling_percentage = initial_sampling_percentage_;
     destination_s3_uri = destination_s3_uri_;
     kms_key_id = kms_key_id_;
     capture_options = capture_options_;
     capture_content_type_header = capture_content_type_header_;
   }
    : data_capture_config)

let make_create_endpoint_config_input
    ?data_capture_config:(data_capture_config_ : data_capture_config option)
    ?tags:(tags_ : tag_list option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?async_inference_config:(async_inference_config_ : async_inference_config option)
    ?explainer_config:(explainer_config_ : explainer_config option)
    ?shadow_production_variants:(shadow_production_variants_ : production_variant_list option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?metrics_config:(metrics_config_ : metrics_config option)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name)
    ~production_variants:(production_variants_ : production_variant_list) () =
  ({
     endpoint_config_name = endpoint_config_name_;
     production_variants = production_variants_;
     data_capture_config = data_capture_config_;
     tags = tags_;
     kms_key_id = kms_key_id_;
     async_inference_config = async_inference_config_;
     explainer_config = explainer_config_;
     shadow_production_variants = shadow_production_variants_;
     execution_role_arn = execution_role_arn_;
     vpc_config = vpc_config_;
     enable_network_isolation = enable_network_isolation_;
     metrics_config = metrics_config_;
   }
    : create_endpoint_config_input)

let make_create_experiment_response ?experiment_arn:(experiment_arn_ : experiment_arn option) () =
  ({ experiment_arn = experiment_arn_ } : create_experiment_response)

let make_create_experiment_request ?display_name:(display_name_ : experiment_entity_name option)
    ?description:(description_ : experiment_description option) ?tags:(tags_ : tag_list option)
    ~experiment_name:(experiment_name_ : experiment_entity_name) () =
  ({
     experiment_name = experiment_name_;
     display_name = display_name_;
     description = description_;
     tags = tags_;
   }
    : create_experiment_request)

let make_create_feature_group_response ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    () =
  ({ feature_group_arn = feature_group_arn_ } : create_feature_group_response)

let make_throughput_config
    ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ : capacity_unit option)
    ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ : capacity_unit option)
    ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     throughput_mode = throughput_mode_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
   }
    : throughput_config)

let make_data_catalog_config ~table_name:(table_name_ : table_name) ~catalog:(catalog_ : catalog)
    ~database:(database_ : database) () =
  ({ table_name = table_name_; catalog = catalog_; database = database_ } : data_catalog_config)

let make_s3_storage_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?resolved_output_s3_uri:(resolved_output_s3_uri_ : s3_uri option) ~s3_uri:(s3_uri_ : s3_uri) ()
    =
  ({ s3_uri = s3_uri_; kms_key_id = kms_key_id_; resolved_output_s3_uri = resolved_output_s3_uri_ }
    : s3_storage_config)

let make_offline_store_config
    ?disable_glue_table_creation:(disable_glue_table_creation_ : boolean_ option)
    ?data_catalog_config:(data_catalog_config_ : data_catalog_config option)
    ?table_format:(table_format_ : table_format option)
    ~s3_storage_config:(s3_storage_config_ : s3_storage_config) () =
  ({
     s3_storage_config = s3_storage_config_;
     disable_glue_table_creation = disable_glue_table_creation_;
     data_catalog_config = data_catalog_config_;
     table_format = table_format_;
   }
    : offline_store_config)

let make_ttl_duration ?unit_:(unit__ : ttl_duration_unit option)
    ?value:(value_ : ttl_duration_value option) () =
  ({ unit_ = unit__; value = value_ } : ttl_duration)

let make_online_store_security_config ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({ kms_key_id = kms_key_id_ } : online_store_security_config)

let make_online_store_config
    ?security_config:(security_config_ : online_store_security_config option)
    ?enable_online_store:(enable_online_store_ : boolean_ option)
    ?ttl_duration:(ttl_duration_ : ttl_duration option)
    ?storage_type:(storage_type_ : storage_type option) () =
  ({
     security_config = security_config_;
     enable_online_store = enable_online_store_;
     ttl_duration = ttl_duration_;
     storage_type = storage_type_;
   }
    : online_store_config)

let make_feature_definition ?collection_type:(collection_type_ : collection_type option)
    ?collection_config:(collection_config_ : collection_config option)
    ~feature_name:(feature_name_ : feature_name) ~feature_type:(feature_type_ : feature_type) () =
  ({
     feature_name = feature_name_;
     feature_type = feature_type_;
     collection_type = collection_type_;
     collection_config = collection_config_;
   }
    : feature_definition)

let make_create_feature_group_request
    ?online_store_config:(online_store_config_ : online_store_config option)
    ?offline_store_config:(offline_store_config_ : offline_store_config option)
    ?throughput_config:(throughput_config_ : throughput_config option)
    ?role_arn:(role_arn_ : role_arn option) ?description:(description_ : description option)
    ?tags:(tags_ : tag_list option) ~feature_group_name:(feature_group_name_ : feature_group_name)
    ~record_identifier_feature_name:(record_identifier_feature_name_ : feature_name)
    ~event_time_feature_name:(event_time_feature_name_ : feature_name)
    ~feature_definitions:(feature_definitions_ : feature_definitions) () =
  ({
     feature_group_name = feature_group_name_;
     record_identifier_feature_name = record_identifier_feature_name_;
     event_time_feature_name = event_time_feature_name_;
     feature_definitions = feature_definitions_;
     online_store_config = online_store_config_;
     offline_store_config = offline_store_config_;
     throughput_config = throughput_config_;
     role_arn = role_arn_;
     description = description_;
     tags = tags_;
   }
    : create_feature_group_request)

let make_create_flow_definition_response
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn) () =
  ({ flow_definition_arn = flow_definition_arn_ } : create_flow_definition_response)

let make_flow_definition_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ s3_output_path = s3_output_path_; kms_key_id = kms_key_id_ } : flow_definition_output_config)

let make_us_d ?dollars:(dollars_ : dollars option) ?cents:(cents_ : cents option)
    ?tenth_fractions_of_a_cent:(tenth_fractions_of_a_cent_ : tenth_fractions_of_a_cent option) () =
  ({ dollars = dollars_; cents = cents_; tenth_fractions_of_a_cent = tenth_fractions_of_a_cent_ }
    : us_d)

let make_public_workforce_task_price ?amount_in_usd:(amount_in_usd_ : us_d option) () =
  ({ amount_in_usd = amount_in_usd_ } : public_workforce_task_price)

let make_human_loop_config
    ?task_availability_lifetime_in_seconds:
      (task_availability_lifetime_in_seconds_ :
         flow_definition_task_availability_lifetime_in_seconds option)
    ?task_time_limit_in_seconds:
      (task_time_limit_in_seconds_ : flow_definition_task_time_limit_in_seconds option)
    ?task_keywords:(task_keywords_ : flow_definition_task_keywords option)
    ?public_workforce_task_price:(public_workforce_task_price_ : public_workforce_task_price option)
    ~workteam_arn:(workteam_arn_ : workteam_arn)
    ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn)
    ~task_title:(task_title_ : flow_definition_task_title)
    ~task_description:(task_description_ : flow_definition_task_description)
    ~task_count:(task_count_ : flow_definition_task_count) () =
  ({
     workteam_arn = workteam_arn_;
     human_task_ui_arn = human_task_ui_arn_;
     task_title = task_title_;
     task_description = task_description_;
     task_count = task_count_;
     task_availability_lifetime_in_seconds = task_availability_lifetime_in_seconds_;
     task_time_limit_in_seconds = task_time_limit_in_seconds_;
     task_keywords = task_keywords_;
     public_workforce_task_price = public_workforce_task_price_;
   }
    : human_loop_config)

let make_human_loop_activation_conditions_config
    ~human_loop_activation_conditions:
      (human_loop_activation_conditions_ : human_loop_activation_conditions) () =
  ({ human_loop_activation_conditions = human_loop_activation_conditions_ }
    : human_loop_activation_conditions_config)

let make_human_loop_activation_config
    ~human_loop_activation_conditions_config:
      (human_loop_activation_conditions_config_ : human_loop_activation_conditions_config) () =
  ({ human_loop_activation_conditions_config = human_loop_activation_conditions_config_ }
    : human_loop_activation_config)

let make_human_loop_request_source
    ~aws_managed_human_loop_request_source:
      (aws_managed_human_loop_request_source_ : aws_managed_human_loop_request_source) () =
  ({ aws_managed_human_loop_request_source = aws_managed_human_loop_request_source_ }
    : human_loop_request_source)

let make_create_flow_definition_request
    ?human_loop_request_source:(human_loop_request_source_ : human_loop_request_source option)
    ?human_loop_activation_config:
      (human_loop_activation_config_ : human_loop_activation_config option)
    ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ?tags:(tags_ : tag_list option)
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name)
    ~output_config:(output_config_ : flow_definition_output_config) ~role_arn:(role_arn_ : role_arn)
    () =
  ({
     flow_definition_name = flow_definition_name_;
     human_loop_request_source = human_loop_request_source_;
     human_loop_activation_config = human_loop_activation_config_;
     human_loop_config = human_loop_config_;
     output_config = output_config_;
     role_arn = role_arn_;
     tags = tags_;
   }
    : create_flow_definition_request)

let make_create_hub_response ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_arn = hub_arn_ } : create_hub_response)

let make_hub_s3_storage_config ?s3_output_path:(s3_output_path_ : s3_output_path option) () =
  ({ s3_output_path = s3_output_path_ } : hub_s3_storage_config)

let make_create_hub_request ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ?s3_storage_config:(s3_storage_config_ : hub_s3_storage_config option)
    ?tags:(tags_ : tag_list option) ~hub_name:(hub_name_ : hub_name)
    ~hub_description:(hub_description_ : hub_description) () =
  ({
     hub_name = hub_name_;
     hub_description = hub_description_;
     hub_display_name = hub_display_name_;
     hub_search_keywords = hub_search_keywords_;
     s3_storage_config = s3_storage_config_;
     tags = tags_;
   }
    : create_hub_request)

let make_create_hub_content_presigned_urls_response ?next_token:(next_token_ : next_token option)
    ~authorized_url_configs:(authorized_url_configs_ : authorized_url_configs) () =
  ({ authorized_url_configs = authorized_url_configs_; next_token = next_token_ }
    : create_hub_content_presigned_urls_response)

let make_presigned_url_access_config ?accept_eula:(accept_eula_ : boolean_ option)
    ?expected_s3_url:(expected_s3_url_ : s3_model_uri option) () =
  ({ accept_eula = accept_eula_; expected_s3_url = expected_s3_url_ } : presigned_url_access_config)

let make_create_hub_content_presigned_urls_request
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ?access_config:(access_config_ : presigned_url_access_config option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~hub_name:(hub_name_ : hub_name_or_arn) ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name) () =
  ({
     hub_name = hub_name_;
     hub_content_type = hub_content_type_;
     hub_content_name = hub_content_name_;
     hub_content_version = hub_content_version_;
     access_config = access_config_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : create_hub_content_presigned_urls_request)

let make_create_hub_content_reference_response ~hub_arn:(hub_arn_ : hub_arn)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_arn = hub_arn_; hub_content_arn = hub_content_arn_ }
    : create_hub_content_reference_response)

let make_create_hub_content_reference_request
    ?hub_content_name:(hub_content_name_ : hub_content_name option)
    ?min_version:(min_version_ : hub_content_version option) ?tags:(tags_ : tag_list option)
    ~hub_name:(hub_name_ : hub_name_or_arn)
    ~sage_maker_public_hub_content_arn:
      (sage_maker_public_hub_content_arn_ : sage_maker_public_hub_content_arn) () =
  ({
     hub_name = hub_name_;
     sage_maker_public_hub_content_arn = sage_maker_public_hub_content_arn_;
     hub_content_name = hub_content_name_;
     min_version = min_version_;
     tags = tags_;
   }
    : create_hub_content_reference_request)

let make_create_human_task_ui_response ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn)
    () =
  ({ human_task_ui_arn = human_task_ui_arn_ } : create_human_task_ui_response)

let make_ui_template ~content:(content_ : template_content) () =
  ({ content = content_ } : ui_template)

let make_create_human_task_ui_request ?tags:(tags_ : tag_list option)
    ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name)
    ~ui_template:(ui_template_ : ui_template) () =
  ({ human_task_ui_name = human_task_ui_name_; ui_template = ui_template_; tags = tags_ }
    : create_human_task_ui_request)

let make_create_hyper_parameter_tuning_job_response
    ~hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn) () =
  ({ hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_ }
    : create_hyper_parameter_tuning_job_response)

let make_parent_hyper_parameter_tuning_job
    ?hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name option) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : parent_hyper_parameter_tuning_job)

let make_hyper_parameter_tuning_job_warm_start_config
    ~parent_hyper_parameter_tuning_jobs:
      (parent_hyper_parameter_tuning_jobs_ : parent_hyper_parameter_tuning_jobs)
    ~warm_start_type:(warm_start_type_ : hyper_parameter_tuning_job_warm_start_type) () =
  ({
     parent_hyper_parameter_tuning_jobs = parent_hyper_parameter_tuning_jobs_;
     warm_start_type = warm_start_type_;
   }
    : hyper_parameter_tuning_job_warm_start_config)

let make_retry_strategy ~maximum_retry_attempts:(maximum_retry_attempts_ : maximum_retry_attempts)
    () =
  ({ maximum_retry_attempts = maximum_retry_attempts_ } : retry_strategy)

let make_hyper_parameter_tuning_instance_config
    ~instance_type:(instance_type_ : training_instance_type)
    ~instance_count:(instance_count_ : training_instance_count)
    ~volume_size_in_g_b:(volume_size_in_g_b_ : volume_size_in_g_b) () =
  ({
     instance_type = instance_type_;
     instance_count = instance_count_;
     volume_size_in_g_b = volume_size_in_g_b_;
   }
    : hyper_parameter_tuning_instance_config)

let make_hyper_parameter_tuning_resource_config
    ?instance_type:(instance_type_ : training_instance_type option)
    ?instance_count:(instance_count_ : training_instance_count option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?allocation_strategy:(allocation_strategy_ : hyper_parameter_tuning_allocation_strategy option)
    ?instance_configs:(instance_configs_ : hyper_parameter_tuning_instance_configs option) () =
  ({
     instance_type = instance_type_;
     instance_count = instance_count_;
     volume_size_in_g_b = volume_size_in_g_b_;
     volume_kms_key_id = volume_kms_key_id_;
     allocation_strategy = allocation_strategy_;
     instance_configs = instance_configs_;
   }
    : hyper_parameter_tuning_resource_config)

let make_hyper_parameter_algorithm_specification
    ?training_image:(training_image_ : algorithm_image option)
    ?algorithm_name:(algorithm_name_ : arn_or_name option)
    ?metric_definitions:(metric_definitions_ : metric_definition_list option)
    ~training_input_mode:(training_input_mode_ : training_input_mode) () =
  ({
     training_image = training_image_;
     training_input_mode = training_input_mode_;
     algorithm_name = algorithm_name_;
     metric_definitions = metric_definitions_;
   }
    : hyper_parameter_algorithm_specification)

let make_integer_parameter_range ?scaling_type:(scaling_type_ : hyper_parameter_scaling_type option)
    ~name:(name_ : parameter_key) ~min_value:(min_value_ : parameter_value)
    ~max_value:(max_value_ : parameter_value) () =
  ({ name = name_; min_value = min_value_; max_value = max_value_; scaling_type = scaling_type_ }
    : integer_parameter_range)

let make_parameter_ranges
    ?integer_parameter_ranges:(integer_parameter_ranges_ : integer_parameter_ranges option)
    ?continuous_parameter_ranges:(continuous_parameter_ranges_ : continuous_parameter_ranges option)
    ?categorical_parameter_ranges:
      (categorical_parameter_ranges_ : categorical_parameter_ranges option)
    ?auto_parameters:(auto_parameters_ : auto_parameters option) () =
  ({
     integer_parameter_ranges = integer_parameter_ranges_;
     continuous_parameter_ranges = continuous_parameter_ranges_;
     categorical_parameter_ranges = categorical_parameter_ranges_;
     auto_parameters = auto_parameters_;
   }
    : parameter_ranges)

let make_hyper_parameter_training_job_definition
    ?definition_name:(definition_name_ : hyper_parameter_training_job_definition_name option)
    ?tuning_objective:(tuning_objective_ : hyper_parameter_tuning_job_objective option)
    ?hyper_parameter_ranges:(hyper_parameter_ranges_ : parameter_ranges option)
    ?static_hyper_parameters:(static_hyper_parameters_ : hyper_parameters option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?resource_config:(resource_config_ : resource_config option)
    ?hyper_parameter_tuning_resource_config:
      (hyper_parameter_tuning_resource_config_ : hyper_parameter_tuning_resource_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?environment:(environment_ : hyper_parameter_training_job_environment_map option)
    ~algorithm_specification:(algorithm_specification_ : hyper_parameter_algorithm_specification)
    ~role_arn:(role_arn_ : role_arn) ~output_data_config:(output_data_config_ : output_data_config)
    ~stopping_condition:(stopping_condition_ : stopping_condition) () =
  ({
     definition_name = definition_name_;
     tuning_objective = tuning_objective_;
     hyper_parameter_ranges = hyper_parameter_ranges_;
     static_hyper_parameters = static_hyper_parameters_;
     algorithm_specification = algorithm_specification_;
     role_arn = role_arn_;
     input_data_config = input_data_config_;
     vpc_config = vpc_config_;
     output_data_config = output_data_config_;
     resource_config = resource_config_;
     hyper_parameter_tuning_resource_config = hyper_parameter_tuning_resource_config_;
     stopping_condition = stopping_condition_;
     enable_network_isolation = enable_network_isolation_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_managed_spot_training = enable_managed_spot_training_;
     checkpoint_config = checkpoint_config_;
     retry_strategy = retry_strategy_;
     environment = environment_;
   }
    : hyper_parameter_training_job_definition)

let make_tuning_job_completion_criteria
    ?target_objective_metric_value:
      (target_objective_metric_value_ : target_objective_metric_value option)
    ?best_objective_not_improving:
      (best_objective_not_improving_ : best_objective_not_improving option)
    ?convergence_detected:(convergence_detected_ : convergence_detected option) () =
  ({
     target_objective_metric_value = target_objective_metric_value_;
     best_objective_not_improving = best_objective_not_improving_;
     convergence_detected = convergence_detected_;
   }
    : tuning_job_completion_criteria)

let make_resource_limits
    ?max_number_of_training_jobs:(max_number_of_training_jobs_ : max_number_of_training_jobs option)
    ?max_runtime_in_seconds:
      (max_runtime_in_seconds_ : hyper_parameter_tuning_max_runtime_in_seconds option)
    ~max_parallel_training_jobs:(max_parallel_training_jobs_ : max_parallel_training_jobs) () =
  ({
     max_number_of_training_jobs = max_number_of_training_jobs_;
     max_parallel_training_jobs = max_parallel_training_jobs_;
     max_runtime_in_seconds = max_runtime_in_seconds_;
   }
    : resource_limits)

let make_hyperband_strategy_config
    ?min_resource:(min_resource_ : hyperband_strategy_min_resource option)
    ?max_resource:(max_resource_ : hyperband_strategy_max_resource option) () =
  ({ min_resource = min_resource_; max_resource = max_resource_ } : hyperband_strategy_config)

let make_hyper_parameter_tuning_job_strategy_config
    ?hyperband_strategy_config:(hyperband_strategy_config_ : hyperband_strategy_config option) () =
  ({ hyperband_strategy_config = hyperband_strategy_config_ }
    : hyper_parameter_tuning_job_strategy_config)

let make_hyper_parameter_tuning_job_config
    ?strategy_config:(strategy_config_ : hyper_parameter_tuning_job_strategy_config option)
    ?hyper_parameter_tuning_job_objective:
      (hyper_parameter_tuning_job_objective_ : hyper_parameter_tuning_job_objective option)
    ?parameter_ranges:(parameter_ranges_ : parameter_ranges option)
    ?training_job_early_stopping_type:
      (training_job_early_stopping_type_ : training_job_early_stopping_type option)
    ?tuning_job_completion_criteria:
      (tuning_job_completion_criteria_ : tuning_job_completion_criteria option)
    ?random_seed:(random_seed_ : random_seed option)
    ~strategy:(strategy_ : hyper_parameter_tuning_job_strategy_type)
    ~resource_limits:(resource_limits_ : resource_limits) () =
  ({
     strategy = strategy_;
     strategy_config = strategy_config_;
     hyper_parameter_tuning_job_objective = hyper_parameter_tuning_job_objective_;
     resource_limits = resource_limits_;
     parameter_ranges = parameter_ranges_;
     training_job_early_stopping_type = training_job_early_stopping_type_;
     tuning_job_completion_criteria = tuning_job_completion_criteria_;
     random_seed = random_seed_;
   }
    : hyper_parameter_tuning_job_config)

let make_create_hyper_parameter_tuning_job_request
    ?training_job_definition:
      (training_job_definition_ : hyper_parameter_training_job_definition option)
    ?training_job_definitions:
      (training_job_definitions_ : hyper_parameter_training_job_definitions option)
    ?warm_start_config:(warm_start_config_ : hyper_parameter_tuning_job_warm_start_config option)
    ?tags:(tags_ : tag_list option) ?autotune:(autotune_ : autotune option)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name)
    ~hyper_parameter_tuning_job_config:
      (hyper_parameter_tuning_job_config_ : hyper_parameter_tuning_job_config) () =
  ({
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
     hyper_parameter_tuning_job_config = hyper_parameter_tuning_job_config_;
     training_job_definition = training_job_definition_;
     training_job_definitions = training_job_definitions_;
     warm_start_config = warm_start_config_;
     tags = tags_;
     autotune = autotune_;
   }
    : create_hyper_parameter_tuning_job_request)

let make_create_image_response ?image_arn:(image_arn_ : image_arn option) () =
  ({ image_arn = image_arn_ } : create_image_response)

let make_create_image_request ?description:(description_ : image_description option)
    ?display_name:(display_name_ : image_display_name option) ?tags:(tags_ : tag_list option)
    ~image_name:(image_name_ : image_name) ~role_arn:(role_arn_ : role_arn) () =
  ({
     description = description_;
     display_name = display_name_;
     image_name = image_name_;
     role_arn = role_arn_;
     tags = tags_;
   }
    : create_image_request)

let make_create_image_version_response
    ?image_version_arn:(image_version_arn_ : image_version_arn option) () =
  ({ image_version_arn = image_version_arn_ } : create_image_version_response)

let make_create_image_version_request ?aliases:(aliases_ : sage_maker_image_version_aliases option)
    ?vendor_guidance:(vendor_guidance_ : vendor_guidance option)
    ?job_type:(job_type_ : job_type option) ?ml_framework:(ml_framework_ : ml_framework option)
    ?programming_lang:(programming_lang_ : programming_lang option)
    ?processor:(processor_ : processor option) ?horovod:(horovod_ : horovod option)
    ?release_notes:(release_notes_ : release_notes option)
    ~base_image:(base_image_ : image_base_image) ~client_token:(client_token_ : client_token)
    ~image_name:(image_name_ : image_name) () =
  ({
     base_image = base_image_;
     client_token = client_token_;
     image_name = image_name_;
     aliases = aliases_;
     vendor_guidance = vendor_guidance_;
     job_type = job_type_;
     ml_framework = ml_framework_;
     programming_lang = programming_lang_;
     processor = processor_;
     horovod = horovod_;
     release_notes = release_notes_;
   }
    : create_image_version_request)

let make_create_inference_component_output
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn) () =
  ({ inference_component_arn = inference_component_arn_ } : create_inference_component_output)

let make_inference_component_runtime_config
    ~copy_count:(copy_count_ : inference_component_copy_count) () =
  ({ copy_count = copy_count_ } : inference_component_runtime_config)

let make_inference_component_availability_zone_balance
    ?max_imbalance:(max_imbalance_ : availability_zone_balance_max_imbalance option)
    ~enforcement_mode:(enforcement_mode_ : availability_zone_balance_enforcement_mode) () =
  ({ enforcement_mode = enforcement_mode_; max_imbalance = max_imbalance_ }
    : inference_component_availability_zone_balance)

let make_inference_component_scheduling_config
    ?availability_zone_balance:
      (availability_zone_balance_ : inference_component_availability_zone_balance option)
    ~placement_strategy:(placement_strategy_ : inference_component_placement_strategy) () =
  ({
     placement_strategy = placement_strategy_;
     availability_zone_balance = availability_zone_balance_;
   }
    : inference_component_scheduling_config)

let make_inference_component_data_cache_config ~enable_caching:(enable_caching_ : enable_caching) ()
    =
  ({ enable_caching = enable_caching_ } : inference_component_data_cache_config)

let make_inference_component_compute_resource_requirements
    ?number_of_cpu_cores_required:(number_of_cpu_cores_required_ : number_of_cpu_cores option)
    ?number_of_accelerator_devices_required:
      (number_of_accelerator_devices_required_ : number_of_accelerator_devices option)
    ?max_memory_required_in_mb:(max_memory_required_in_mb_ : memory_in_mb option)
    ~min_memory_required_in_mb:(min_memory_required_in_mb_ : memory_in_mb) () =
  ({
     number_of_cpu_cores_required = number_of_cpu_cores_required_;
     number_of_accelerator_devices_required = number_of_accelerator_devices_required_;
     min_memory_required_in_mb = min_memory_required_in_mb_;
     max_memory_required_in_mb = max_memory_required_in_mb_;
   }
    : inference_component_compute_resource_requirements)

let make_inference_component_startup_parameters
    ?model_data_download_timeout_in_seconds:
      (model_data_download_timeout_in_seconds_ :
         production_variant_model_data_download_timeout_in_seconds option)
    ?container_startup_health_check_timeout_in_seconds:
      (container_startup_health_check_timeout_in_seconds_ :
         production_variant_container_startup_health_check_timeout_in_seconds option) () =
  ({
     model_data_download_timeout_in_seconds = model_data_download_timeout_in_seconds_;
     container_startup_health_check_timeout_in_seconds =
       container_startup_health_check_timeout_in_seconds_;
   }
    : inference_component_startup_parameters)

let make_inference_component_container_specification ?image:(image_ : container_image option)
    ?artifact_url:(artifact_url_ : url option) ?environment:(environment_ : environment_map option)
    ?container_metrics_config:(container_metrics_config_ : container_metrics_config option) () =
  ({
     image = image_;
     artifact_url = artifact_url_;
     environment = environment_;
     container_metrics_config = container_metrics_config_;
   }
    : inference_component_container_specification)

let make_inference_component_specification
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?model_name:(model_name_ : model_name option)
    ?container:(container_ : inference_component_container_specification option)
    ?startup_parameters:(startup_parameters_ : inference_component_startup_parameters option)
    ?compute_resource_requirements:
      (compute_resource_requirements_ : inference_component_compute_resource_requirements option)
    ?base_inference_component_name:
      (base_inference_component_name_ : inference_component_name option)
    ?data_cache_config:(data_cache_config_ : inference_component_data_cache_config option)
    ?scheduling_config:(scheduling_config_ : inference_component_scheduling_config option) () =
  ({
     instance_type = instance_type_;
     model_name = model_name_;
     container = container_;
     startup_parameters = startup_parameters_;
     compute_resource_requirements = compute_resource_requirements_;
     base_inference_component_name = base_inference_component_name_;
     data_cache_config = data_cache_config_;
     scheduling_config = scheduling_config_;
   }
    : inference_component_specification)

let make_create_inference_component_input ?variant_name:(variant_name_ : variant_name option)
    ?specification:(specification_ : inference_component_specification option)
    ?specifications:(specifications_ : inference_component_specification_list option)
    ?runtime_config:(runtime_config_ : inference_component_runtime_config option)
    ?tags:(tags_ : tag_list option)
    ~inference_component_name:(inference_component_name_ : inference_component_name)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     inference_component_name = inference_component_name_;
     endpoint_name = endpoint_name_;
     variant_name = variant_name_;
     specification = specification_;
     specifications = specifications_;
     runtime_config = runtime_config_;
     tags = tags_;
   }
    : create_inference_component_input)

let make_create_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : create_inference_experiment_response)

let make_shadow_model_variant_config
    ~shadow_model_variant_name:(shadow_model_variant_name_ : model_variant_name)
    ~sampling_percentage:(sampling_percentage_ : percentage) () =
  ({
     shadow_model_variant_name = shadow_model_variant_name_;
     sampling_percentage = sampling_percentage_;
   }
    : shadow_model_variant_config)

let make_shadow_mode_config
    ~source_model_variant_name:(source_model_variant_name_ : model_variant_name)
    ~shadow_model_variants:(shadow_model_variants_ : shadow_model_variant_config_list) () =
  ({
     source_model_variant_name = source_model_variant_name_;
     shadow_model_variants = shadow_model_variants_;
   }
    : shadow_mode_config)

let make_inference_experiment_data_storage_config ?kms_key:(kms_key_ : kms_key_id option)
    ?content_type:(content_type_ : capture_content_type_header option)
    ~destination:(destination_ : destination_s3_uri) () =
  ({ destination = destination_; kms_key = kms_key_; content_type = content_type_ }
    : inference_experiment_data_storage_config)

let make_real_time_inference_config
    ~instance_type:(instance_type_ : production_variant_instance_type)
    ~instance_count:(instance_count_ : task_count) () =
  ({ instance_type = instance_type_; instance_count = instance_count_ }
    : real_time_inference_config)

let make_model_infrastructure_config
    ~infrastructure_type:(infrastructure_type_ : model_infrastructure_type)
    ~real_time_inference_config:(real_time_inference_config_ : real_time_inference_config) () =
  ({
     infrastructure_type = infrastructure_type_;
     real_time_inference_config = real_time_inference_config_;
   }
    : model_infrastructure_config)

let make_model_variant_config ~model_name:(model_name_ : model_name)
    ~variant_name:(variant_name_ : model_variant_name)
    ~infrastructure_config:(infrastructure_config_ : model_infrastructure_config) () =
  ({
     model_name = model_name_;
     variant_name = variant_name_;
     infrastructure_config = infrastructure_config_;
   }
    : model_variant_config)

let make_inference_experiment_schedule ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) () =
  ({ start_time = start_time_; end_time = end_time_ } : inference_experiment_schedule)

let make_create_inference_experiment_request
    ?schedule:(schedule_ : inference_experiment_schedule option)
    ?description:(description_ : inference_experiment_description option)
    ?data_storage_config:(data_storage_config_ : inference_experiment_data_storage_config option)
    ?kms_key:(kms_key_ : kms_key_id option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : inference_experiment_name) ~type_:(type__ : inference_experiment_type)
    ~role_arn:(role_arn_ : role_arn) ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~model_variants:(model_variants_ : model_variant_config_list)
    ~shadow_mode_config:(shadow_mode_config_ : shadow_mode_config) () =
  ({
     name = name_;
     type_ = type__;
     schedule = schedule_;
     description = description_;
     role_arn = role_arn_;
     endpoint_name = endpoint_name_;
     model_variants = model_variants_;
     data_storage_config = data_storage_config_;
     shadow_mode_config = shadow_mode_config_;
     kms_key = kms_key_;
     tags = tags_;
   }
    : create_inference_experiment_request)

let make_create_inference_recommendations_job_response ~job_arn:(job_arn_ : recommendation_job_arn)
    () =
  ({ job_arn = job_arn_ } : create_inference_recommendations_job_response)

let make_recommendation_job_compiled_output_config ?s3_output_uri:(s3_output_uri_ : s3_uri option)
    () =
  ({ s3_output_uri = s3_output_uri_ } : recommendation_job_compiled_output_config)

let make_recommendation_job_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?compiled_output_config:
      (compiled_output_config_ : recommendation_job_compiled_output_config option) () =
  ({ kms_key_id = kms_key_id_; compiled_output_config = compiled_output_config_ }
    : recommendation_job_output_config)

let make_model_latency_threshold ?percentile:(percentile_ : string64 option)
    ?value_in_milliseconds:(value_in_milliseconds_ : integer option) () =
  ({ percentile = percentile_; value_in_milliseconds = value_in_milliseconds_ }
    : model_latency_threshold)

let make_recommendation_job_stopping_conditions ?max_invocations:(max_invocations_ : integer option)
    ?model_latency_thresholds:(model_latency_thresholds_ : model_latency_thresholds option)
    ?flat_invocations:(flat_invocations_ : flat_invocations option) () =
  ({
     max_invocations = max_invocations_;
     model_latency_thresholds = model_latency_thresholds_;
     flat_invocations = flat_invocations_;
   }
    : recommendation_job_stopping_conditions)

let make_recommendation_job_vpc_config
    ~security_group_ids:(security_group_ids_ : recommendation_job_vpc_security_group_ids)
    ~subnets:(subnets_ : recommendation_job_vpc_subnets) () =
  ({ security_group_ids = security_group_ids_; subnets = subnets_ } : recommendation_job_vpc_config)

let make_endpoint_info ?endpoint_name:(endpoint_name_ : endpoint_name option) () =
  ({ endpoint_name = endpoint_name_ } : endpoint_info)

let make_recommendation_job_payload_config ?sample_payload_url:(sample_payload_url_ : s3_uri option)
    ?supported_content_types:
      (supported_content_types_ : recommendation_job_supported_content_types option) () =
  ({ sample_payload_url = sample_payload_url_; supported_content_types = supported_content_types_ }
    : recommendation_job_payload_config)

let make_recommendation_job_container_config ?domain:(domain_ : string_ option)
    ?task:(task_ : string_ option) ?framework:(framework_ : string_ option)
    ?framework_version:(framework_version_ : recommendation_job_framework_version option)
    ?payload_config:(payload_config_ : recommendation_job_payload_config option)
    ?nearest_model_name:(nearest_model_name_ : string_ option)
    ?supported_instance_types:
      (supported_instance_types_ : recommendation_job_supported_instance_types option)
    ?supported_endpoint_type:
      (supported_endpoint_type_ : recommendation_job_supported_endpoint_type option)
    ?data_input_config:(data_input_config_ : recommendation_job_data_input_config option)
    ?supported_response_mime_types:
      (supported_response_mime_types_ : recommendation_job_supported_response_mime_types option) ()
    =
  ({
     domain = domain_;
     task = task_;
     framework = framework_;
     framework_version = framework_version_;
     payload_config = payload_config_;
     nearest_model_name = nearest_model_name_;
     supported_instance_types = supported_instance_types_;
     supported_endpoint_type = supported_endpoint_type_;
     data_input_config = data_input_config_;
     supported_response_mime_types = supported_response_mime_types_;
   }
    : recommendation_job_container_config)

let make_environment_parameter_ranges
    ?categorical_parameter_ranges:(categorical_parameter_ranges_ : categorical_parameters option) ()
    =
  ({ categorical_parameter_ranges = categorical_parameter_ranges_ } : environment_parameter_ranges)

let make_endpoint_input_configuration
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?serverless_config:(serverless_config_ : production_variant_serverless_config option)
    ?inference_specification_name:
      (inference_specification_name_ : inference_specification_name option)
    ?environment_parameter_ranges:
      (environment_parameter_ranges_ : environment_parameter_ranges option) () =
  ({
     instance_type = instance_type_;
     serverless_config = serverless_config_;
     inference_specification_name = inference_specification_name_;
     environment_parameter_ranges = environment_parameter_ranges_;
   }
    : endpoint_input_configuration)

let make_recommendation_job_resource_limit
    ?max_number_of_tests:(max_number_of_tests_ : max_number_of_tests option)
    ?max_parallel_of_tests:(max_parallel_of_tests_ : max_parallel_of_tests option) () =
  ({ max_number_of_tests = max_number_of_tests_; max_parallel_of_tests = max_parallel_of_tests_ }
    : recommendation_job_resource_limit)

let make_stairs ?duration_in_seconds:(duration_in_seconds_ : traffic_duration_in_seconds option)
    ?number_of_steps:(number_of_steps_ : number_of_steps option)
    ?users_per_step:(users_per_step_ : users_per_step option) () =
  ({
     duration_in_seconds = duration_in_seconds_;
     number_of_steps = number_of_steps_;
     users_per_step = users_per_step_;
   }
    : stairs)

let make_phase ?initial_number_of_users:(initial_number_of_users_ : initial_number_of_users option)
    ?spawn_rate:(spawn_rate_ : spawn_rate option)
    ?duration_in_seconds:(duration_in_seconds_ : traffic_duration_in_seconds option) () =
  ({
     initial_number_of_users = initial_number_of_users_;
     spawn_rate = spawn_rate_;
     duration_in_seconds = duration_in_seconds_;
   }
    : phase)

let make_traffic_pattern ?traffic_type:(traffic_type_ : traffic_type option)
    ?phases:(phases_ : phases option) ?stairs:(stairs_ : stairs option) () =
  ({ traffic_type = traffic_type_; phases = phases_; stairs = stairs_ } : traffic_pattern)

let make_recommendation_job_input_config
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option)
    ?model_name:(model_name_ : model_name option)
    ?job_duration_in_seconds:(job_duration_in_seconds_ : job_duration_in_seconds option)
    ?traffic_pattern:(traffic_pattern_ : traffic_pattern option)
    ?resource_limit:(resource_limit_ : recommendation_job_resource_limit option)
    ?endpoint_configurations:(endpoint_configurations_ : endpoint_input_configurations option)
    ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?container_config:(container_config_ : recommendation_job_container_config option)
    ?endpoints:(endpoints_ : endpoints option)
    ?vpc_config:(vpc_config_ : recommendation_job_vpc_config option) () =
  ({
     model_package_version_arn = model_package_version_arn_;
     model_name = model_name_;
     job_duration_in_seconds = job_duration_in_seconds_;
     traffic_pattern = traffic_pattern_;
     resource_limit = resource_limit_;
     endpoint_configurations = endpoint_configurations_;
     volume_kms_key_id = volume_kms_key_id_;
     container_config = container_config_;
     endpoints = endpoints_;
     vpc_config = vpc_config_;
   }
    : recommendation_job_input_config)

let make_create_inference_recommendations_job_request
    ?job_description:(job_description_ : recommendation_job_description option)
    ?stopping_conditions:(stopping_conditions_ : recommendation_job_stopping_conditions option)
    ?output_config:(output_config_ : recommendation_job_output_config option)
    ?tags:(tags_ : tag_list option) ~job_name:(job_name_ : recommendation_job_name)
    ~job_type:(job_type_ : recommendation_job_type) ~role_arn:(role_arn_ : role_arn)
    ~input_config:(input_config_ : recommendation_job_input_config) () =
  ({
     job_name = job_name_;
     job_type = job_type_;
     role_arn = role_arn_;
     input_config = input_config_;
     job_description = job_description_;
     stopping_conditions = stopping_conditions_;
     output_config = output_config_;
     tags = tags_;
   }
    : create_inference_recommendations_job_request)

let make_create_job_response ~job_arn:(job_arn_ : job_arn) () =
  ({ job_arn = job_arn_ } : create_job_response)

let make_create_job_request ?tags:(tags_ : tag_list option) ~job_name:(job_name_ : job_name)
    ~role_arn:(role_arn_ : role_arn) ~job_category:(job_category_ : job_category)
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version)
    ~job_config_document:(job_config_document_ : job_config_document) () =
  ({
     job_name = job_name_;
     role_arn = role_arn_;
     job_category = job_category_;
     job_config_schema_version = job_config_schema_version_;
     job_config_document = job_config_document_;
     tags = tags_;
   }
    : create_job_request)

let make_create_labeling_job_response ~labeling_job_arn:(labeling_job_arn_ : labeling_job_arn) () =
  ({ labeling_job_arn = labeling_job_arn_ } : create_labeling_job_response)

let make_ui_config ?ui_template_s3_uri:(ui_template_s3_uri_ : s3_uri option)
    ?human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn option) () =
  ({ ui_template_s3_uri = ui_template_s3_uri_; human_task_ui_arn = human_task_ui_arn_ } : ui_config)

let make_human_task_config
    ?pre_human_task_lambda_arn:(pre_human_task_lambda_arn_ : lambda_function_arn option)
    ?task_keywords:(task_keywords_ : task_keywords option)
    ?task_availability_lifetime_in_seconds:
      (task_availability_lifetime_in_seconds_ : task_availability_lifetime_in_seconds option)
    ?max_concurrent_task_count:(max_concurrent_task_count_ : max_concurrent_task_count option)
    ?annotation_consolidation_config:
      (annotation_consolidation_config_ : annotation_consolidation_config option)
    ?public_workforce_task_price:(public_workforce_task_price_ : public_workforce_task_price option)
    ~workteam_arn:(workteam_arn_ : workteam_arn) ~ui_config:(ui_config_ : ui_config)
    ~task_title:(task_title_ : task_title) ~task_description:(task_description_ : task_description)
    ~number_of_human_workers_per_data_object:
      (number_of_human_workers_per_data_object_ : number_of_human_workers_per_data_object)
    ~task_time_limit_in_seconds:(task_time_limit_in_seconds_ : task_time_limit_in_seconds) () =
  ({
     workteam_arn = workteam_arn_;
     ui_config = ui_config_;
     pre_human_task_lambda_arn = pre_human_task_lambda_arn_;
     task_keywords = task_keywords_;
     task_title = task_title_;
     task_description = task_description_;
     number_of_human_workers_per_data_object = number_of_human_workers_per_data_object_;
     task_time_limit_in_seconds = task_time_limit_in_seconds_;
     task_availability_lifetime_in_seconds = task_availability_lifetime_in_seconds_;
     max_concurrent_task_count = max_concurrent_task_count_;
     annotation_consolidation_config = annotation_consolidation_config_;
     public_workforce_task_price = public_workforce_task_price_;
   }
    : human_task_config)

let make_labeling_job_resource_config ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ?vpc_config:(vpc_config_ : vpc_config option) () =
  ({ volume_kms_key_id = volume_kms_key_id_; vpc_config = vpc_config_ }
    : labeling_job_resource_config)

let make_labeling_job_algorithms_config
    ?initial_active_learning_model_arn:(initial_active_learning_model_arn_ : model_arn option)
    ?labeling_job_resource_config:
      (labeling_job_resource_config_ : labeling_job_resource_config option)
    ~labeling_job_algorithm_specification_arn:
      (labeling_job_algorithm_specification_arn_ : labeling_job_algorithm_specification_arn) () =
  ({
     labeling_job_algorithm_specification_arn = labeling_job_algorithm_specification_arn_;
     initial_active_learning_model_arn = initial_active_learning_model_arn_;
     labeling_job_resource_config = labeling_job_resource_config_;
   }
    : labeling_job_algorithms_config)

let make_labeling_job_stopping_conditions
    ?max_human_labeled_object_count:
      (max_human_labeled_object_count_ : max_human_labeled_object_count option)
    ?max_percentage_of_input_dataset_labeled:
      (max_percentage_of_input_dataset_labeled_ : max_percentage_of_input_dataset_labeled option) ()
    =
  ({
     max_human_labeled_object_count = max_human_labeled_object_count_;
     max_percentage_of_input_dataset_labeled = max_percentage_of_input_dataset_labeled_;
   }
    : labeling_job_stopping_conditions)

let make_labeling_job_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?sns_topic_arn:(sns_topic_arn_ : sns_topic_arn option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ s3_output_path = s3_output_path_; kms_key_id = kms_key_id_; sns_topic_arn = sns_topic_arn_ }
    : labeling_job_output_config)

let make_labeling_job_data_attributes
    ?content_classifiers:(content_classifiers_ : content_classifiers option) () =
  ({ content_classifiers = content_classifiers_ } : labeling_job_data_attributes)

let make_labeling_job_sns_data_source ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({ sns_topic_arn = sns_topic_arn_ } : labeling_job_sns_data_source)

let make_labeling_job_s3_data_source ~manifest_s3_uri:(manifest_s3_uri_ : s3_uri) () =
  ({ manifest_s3_uri = manifest_s3_uri_ } : labeling_job_s3_data_source)

let make_labeling_job_data_source
    ?s3_data_source:(s3_data_source_ : labeling_job_s3_data_source option)
    ?sns_data_source:(sns_data_source_ : labeling_job_sns_data_source option) () =
  ({ s3_data_source = s3_data_source_; sns_data_source = sns_data_source_ }
    : labeling_job_data_source)

let make_labeling_job_input_config
    ?data_attributes:(data_attributes_ : labeling_job_data_attributes option)
    ~data_source:(data_source_ : labeling_job_data_source) () =
  ({ data_source = data_source_; data_attributes = data_attributes_ } : labeling_job_input_config)

let make_create_labeling_job_request
    ?label_category_config_s3_uri:(label_category_config_s3_uri_ : s3_uri option)
    ?stopping_conditions:(stopping_conditions_ : labeling_job_stopping_conditions option)
    ?labeling_job_algorithms_config:
      (labeling_job_algorithms_config_ : labeling_job_algorithms_config option)
    ?tags:(tags_ : tag_list option) ~labeling_job_name:(labeling_job_name_ : labeling_job_name)
    ~label_attribute_name:(label_attribute_name_ : label_attribute_name)
    ~input_config:(input_config_ : labeling_job_input_config)
    ~output_config:(output_config_ : labeling_job_output_config) ~role_arn:(role_arn_ : role_arn)
    ~human_task_config:(human_task_config_ : human_task_config) () =
  ({
     labeling_job_name = labeling_job_name_;
     label_attribute_name = label_attribute_name_;
     input_config = input_config_;
     output_config = output_config_;
     role_arn = role_arn_;
     label_category_config_s3_uri = label_category_config_s3_uri_;
     stopping_conditions = stopping_conditions_;
     labeling_job_algorithms_config = labeling_job_algorithms_config_;
     human_task_config = human_task_config_;
     tags = tags_;
   }
    : create_labeling_job_request)

let make_create_mlflow_app_response ?arn:(arn_ : mlflow_app_arn option) () =
  ({ arn = arn_ } : create_mlflow_app_response)

let make_create_mlflow_app_request
    ?model_registration_mode:(model_registration_mode_ : model_registration_mode option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?account_default_status:(account_default_status_ : account_default_status option)
    ?default_domain_id_list:(default_domain_id_list_ : default_domain_id_list option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : mlflow_app_name)
    ~artifact_store_uri:(artifact_store_uri_ : s3_uri) ~role_arn:(role_arn_ : role_arn) () =
  ({
     name = name_;
     artifact_store_uri = artifact_store_uri_;
     role_arn = role_arn_;
     model_registration_mode = model_registration_mode_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     account_default_status = account_default_status_;
     default_domain_id_list = default_domain_id_list_;
     tags = tags_;
   }
    : create_mlflow_app_request)

let make_create_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : create_mlflow_tracking_server_response)

let make_create_mlflow_tracking_server_request
    ?tracking_server_size:(tracking_server_size_ : tracking_server_size option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?automatic_model_registration:(automatic_model_registration_ : boolean_ option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?tags:(tags_ : tag_list option)
    ?s3_bucket_owner_account_id:(s3_bucket_owner_account_id_ : account_id option)
    ?s3_bucket_owner_verification:(s3_bucket_owner_verification_ : boolean_ option)
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name)
    ~artifact_store_uri:(artifact_store_uri_ : s3_uri) ~role_arn:(role_arn_ : role_arn) () =
  ({
     tracking_server_name = tracking_server_name_;
     artifact_store_uri = artifact_store_uri_;
     tracking_server_size = tracking_server_size_;
     mlflow_version = mlflow_version_;
     role_arn = role_arn_;
     automatic_model_registration = automatic_model_registration_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     tags = tags_;
     s3_bucket_owner_account_id = s3_bucket_owner_account_id_;
     s3_bucket_owner_verification = s3_bucket_owner_verification_;
   }
    : create_mlflow_tracking_server_request)

let make_create_model_output ~model_arn:(model_arn_ : model_arn) () =
  ({ model_arn = model_arn_ } : create_model_output)

let make_inference_execution_config ~mode:(mode_ : inference_execution_mode) () =
  ({ mode = mode_ } : inference_execution_config)

let make_create_model_input ?primary_container:(primary_container_ : container_definition option)
    ?containers:(containers_ : container_definition_list option)
    ?inference_execution_config:(inference_execution_config_ : inference_execution_config option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option) ?tags:(tags_ : tag_list option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ~model_name:(model_name_ : model_name) () =
  ({
     model_name = model_name_;
     primary_container = primary_container_;
     containers = containers_;
     inference_execution_config = inference_execution_config_;
     execution_role_arn = execution_role_arn_;
     tags = tags_;
     vpc_config = vpc_config_;
     enable_network_isolation = enable_network_isolation_;
   }
    : create_model_input)

let make_create_model_bias_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ } : create_model_bias_job_definition_response)

let make_monitoring_ground_truth_s3_input ?s3_uri:(s3_uri_ : monitoring_s3_uri option) () =
  ({ s3_uri = s3_uri_ } : monitoring_ground_truth_s3_input)

let make_model_bias_job_input ?endpoint_input:(endpoint_input_ : endpoint_input option)
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ~ground_truth_s3_input:(ground_truth_s3_input_ : monitoring_ground_truth_s3_input) () =
  ({
     endpoint_input = endpoint_input_;
     batch_transform_input = batch_transform_input_;
     ground_truth_s3_input = ground_truth_s3_input_;
   }
    : model_bias_job_input)

let make_model_bias_app_specification
    ?environment:(environment_ : monitoring_environment_map option)
    ~image_uri:(image_uri_ : image_uri) ~config_uri:(config_uri_ : s3_uri) () =
  ({ image_uri = image_uri_; config_uri = config_uri_; environment = environment_ }
    : model_bias_app_specification)

let make_model_bias_baseline_config
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option)
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option) () =
  ({ baselining_job_name = baselining_job_name_; constraints_resource = constraints_resource_ }
    : model_bias_baseline_config)

let make_create_model_bias_job_definition_request
    ?model_bias_baseline_config:(model_bias_baseline_config_ : model_bias_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?tags:(tags_ : tag_list option)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~model_bias_app_specification:(model_bias_app_specification_ : model_bias_app_specification)
    ~model_bias_job_input:(model_bias_job_input_ : model_bias_job_input)
    ~model_bias_job_output_config:(model_bias_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_name = job_definition_name_;
     model_bias_baseline_config = model_bias_baseline_config_;
     model_bias_app_specification = model_bias_app_specification_;
     model_bias_job_input = model_bias_job_input_;
     model_bias_job_output_config = model_bias_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
     tags = tags_;
   }
    : create_model_bias_job_definition_request)

let make_create_model_card_response ~model_card_arn:(model_card_arn_ : model_card_arn) () =
  ({ model_card_arn = model_card_arn_ } : create_model_card_response)

let make_model_card_security_config ?kms_key_id:(kms_key_id_ : kms_key_id option) () =
  ({ kms_key_id = kms_key_id_ } : model_card_security_config)

let make_create_model_card_request
    ?security_config:(security_config_ : model_card_security_config option)
    ?tags:(tags_ : tag_list option) ~model_card_name:(model_card_name_ : entity_name)
    ~content:(content_ : model_card_content)
    ~model_card_status:(model_card_status_ : model_card_status) () =
  ({
     model_card_name = model_card_name_;
     security_config = security_config_;
     content = content_;
     model_card_status = model_card_status_;
     tags = tags_;
   }
    : create_model_card_request)

let make_create_model_card_export_job_response
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn) () =
  ({ model_card_export_job_arn = model_card_export_job_arn_ }
    : create_model_card_export_job_response)

let make_model_card_export_output_config ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ s3_output_path = s3_output_path_ } : model_card_export_output_config)

let make_create_model_card_export_job_request
    ?model_card_version:(model_card_version_ : integer option)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn)
    ~model_card_export_job_name:(model_card_export_job_name_ : entity_name)
    ~output_config:(output_config_ : model_card_export_output_config) () =
  ({
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     model_card_export_job_name = model_card_export_job_name_;
     output_config = output_config_;
   }
    : create_model_card_export_job_request)

let make_create_model_explainability_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ }
    : create_model_explainability_job_definition_response)

let make_model_explainability_job_input ?endpoint_input:(endpoint_input_ : endpoint_input option)
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option) () =
  ({ endpoint_input = endpoint_input_; batch_transform_input = batch_transform_input_ }
    : model_explainability_job_input)

let make_model_explainability_app_specification
    ?environment:(environment_ : monitoring_environment_map option)
    ~image_uri:(image_uri_ : image_uri) ~config_uri:(config_uri_ : s3_uri) () =
  ({ image_uri = image_uri_; config_uri = config_uri_; environment = environment_ }
    : model_explainability_app_specification)

let make_model_explainability_baseline_config
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option)
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option) () =
  ({ baselining_job_name = baselining_job_name_; constraints_resource = constraints_resource_ }
    : model_explainability_baseline_config)

let make_create_model_explainability_job_definition_request
    ?model_explainability_baseline_config:
      (model_explainability_baseline_config_ : model_explainability_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?tags:(tags_ : tag_list option)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~model_explainability_app_specification:
      (model_explainability_app_specification_ : model_explainability_app_specification)
    ~model_explainability_job_input:
      (model_explainability_job_input_ : model_explainability_job_input)
    ~model_explainability_job_output_config:
      (model_explainability_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_name = job_definition_name_;
     model_explainability_baseline_config = model_explainability_baseline_config_;
     model_explainability_app_specification = model_explainability_app_specification_;
     model_explainability_job_input = model_explainability_job_input_;
     model_explainability_job_output_config = model_explainability_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
     tags = tags_;
   }
    : create_model_explainability_job_definition_request)

let make_create_model_package_output ~model_package_arn:(model_package_arn_ : model_package_arn) ()
    =
  ({ model_package_arn = model_package_arn_ } : create_model_package_output)

let make_model_life_cycle ?stage_description:(stage_description_ : stage_description option)
    ~stage:(stage_ : entity_name) ~stage_status:(stage_status_ : entity_name) () =
  ({ stage = stage_; stage_status = stage_status_; stage_description = stage_description_ }
    : model_life_cycle)

let make_model_package_model_card
    ?model_card_content:(model_card_content_ : model_card_content option)
    ?model_card_status:(model_card_status_ : model_card_status option) () =
  ({ model_card_content = model_card_content_; model_card_status = model_card_status_ }
    : model_package_model_card)

let make_model_package_security_config ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({ kms_key_id = kms_key_id_ } : model_package_security_config)

let make_drift_check_model_data_quality ?statistics:(statistics_ : metrics_source option)
    ?constraints:(constraints_ : metrics_source option) () =
  ({ statistics = statistics_; constraints = constraints_ } : drift_check_model_data_quality)

let make_drift_check_model_quality ?statistics:(statistics_ : metrics_source option)
    ?constraints:(constraints_ : metrics_source option) () =
  ({ statistics = statistics_; constraints = constraints_ } : drift_check_model_quality)

let make_file_source ?content_type:(content_type_ : content_type option)
    ?content_digest:(content_digest_ : content_digest option) ~s3_uri:(s3_uri_ : s3_uri) () =
  ({ content_type = content_type_; content_digest = content_digest_; s3_uri = s3_uri_ }
    : file_source)

let make_drift_check_explainability ?constraints:(constraints_ : metrics_source option)
    ?config_file:(config_file_ : file_source option) () =
  ({ constraints = constraints_; config_file = config_file_ } : drift_check_explainability)

let make_drift_check_bias ?config_file:(config_file_ : file_source option)
    ?pre_training_constraints:(pre_training_constraints_ : metrics_source option)
    ?post_training_constraints:(post_training_constraints_ : metrics_source option) () =
  ({
     config_file = config_file_;
     pre_training_constraints = pre_training_constraints_;
     post_training_constraints = post_training_constraints_;
   }
    : drift_check_bias)

let make_drift_check_baselines ?bias:(bias_ : drift_check_bias option)
    ?explainability:(explainability_ : drift_check_explainability option)
    ?model_quality:(model_quality_ : drift_check_model_quality option)
    ?model_data_quality:(model_data_quality_ : drift_check_model_data_quality option) () =
  ({
     bias = bias_;
     explainability = explainability_;
     model_quality = model_quality_;
     model_data_quality = model_data_quality_;
   }
    : drift_check_baselines)

let make_explainability ?report:(report_ : metrics_source option) () =
  ({ report = report_ } : explainability)

let make_model_data_quality ?statistics:(statistics_ : metrics_source option)
    ?constraints:(constraints_ : metrics_source option) () =
  ({ statistics = statistics_; constraints = constraints_ } : model_data_quality)

let make_model_quality ?statistics:(statistics_ : metrics_source option)
    ?constraints:(constraints_ : metrics_source option) () =
  ({ statistics = statistics_; constraints = constraints_ } : model_quality)

let make_model_metrics ?model_quality:(model_quality_ : model_quality option)
    ?model_data_quality:(model_data_quality_ : model_data_quality option)
    ?bias:(bias_ : bias option) ?explainability:(explainability_ : explainability option) () =
  ({
     model_quality = model_quality_;
     model_data_quality = model_data_quality_;
     bias = bias_;
     explainability = explainability_;
   }
    : model_metrics)

let make_source_algorithm ?model_data_url:(model_data_url_ : url option)
    ?model_data_source:(model_data_source_ : model_data_source option)
    ?model_data_e_tag:(model_data_e_tag_ : string_ option)
    ~algorithm_name:(algorithm_name_ : arn_or_name) () =
  ({
     model_data_url = model_data_url_;
     model_data_source = model_data_source_;
     model_data_e_tag = model_data_e_tag_;
     algorithm_name = algorithm_name_;
   }
    : source_algorithm)

let make_source_algorithm_specification
    ~source_algorithms:(source_algorithms_ : source_algorithm_list) () =
  ({ source_algorithms = source_algorithms_ } : source_algorithm_specification)

let make_model_package_validation_profile ~profile_name:(profile_name_ : entity_name)
    ~transform_job_definition:(transform_job_definition_ : transform_job_definition) () =
  ({ profile_name = profile_name_; transform_job_definition = transform_job_definition_ }
    : model_package_validation_profile)

let make_model_package_validation_specification ~validation_role:(validation_role_ : role_arn)
    ~validation_profiles:(validation_profiles_ : model_package_validation_profiles) () =
  ({ validation_role = validation_role_; validation_profiles = validation_profiles_ }
    : model_package_validation_specification)

let make_create_model_package_input ?model_package_name:(model_package_name_ : entity_name option)
    ?model_package_group_name:(model_package_group_name_ : arn_or_name option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?validation_specification:
      (validation_specification_ : model_package_validation_specification option)
    ?source_algorithm_specification:
      (source_algorithm_specification_ : source_algorithm_specification option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?tags:(tags_ : tag_list option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?client_token:(client_token_ : client_token option) ?domain:(domain_ : string_ option)
    ?task:(task_ : string_ option) ?sample_payload_url:(sample_payload_url_ : s3_uri option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?drift_check_baselines:(drift_check_baselines_ : drift_check_baselines option)
    ?additional_inference_specifications:
      (additional_inference_specifications_ : additional_inference_specifications option)
    ?skip_model_validation:(skip_model_validation_ : skip_model_validation option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?security_config:(security_config_ : model_package_security_config option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?managed_storage_type:(managed_storage_type_ : managed_storage_type option) () =
  ({
     model_package_name = model_package_name_;
     model_package_group_name = model_package_group_name_;
     model_package_description = model_package_description_;
     model_package_registration_type = model_package_registration_type_;
     inference_specification = inference_specification_;
     validation_specification = validation_specification_;
     source_algorithm_specification = source_algorithm_specification_;
     certify_for_marketplace = certify_for_marketplace_;
     tags = tags_;
     model_approval_status = model_approval_status_;
     metadata_properties = metadata_properties_;
     model_metrics = model_metrics_;
     client_token = client_token_;
     domain = domain_;
     task = task_;
     sample_payload_url = sample_payload_url_;
     customer_metadata_properties = customer_metadata_properties_;
     drift_check_baselines = drift_check_baselines_;
     additional_inference_specifications = additional_inference_specifications_;
     skip_model_validation = skip_model_validation_;
     source_uri = source_uri_;
     security_config = security_config_;
     model_card = model_card_;
     model_life_cycle = model_life_cycle_;
     managed_storage_type = managed_storage_type_;
   }
    : create_model_package_input)

let make_create_model_package_group_output
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn) () =
  ({ model_package_group_arn = model_package_group_arn_ } : create_model_package_group_output)

let make_managed_configuration
    ?managed_storage_type:(managed_storage_type_ : managed_storage_type option) () =
  ({ managed_storage_type = managed_storage_type_ } : managed_configuration)

let make_create_model_package_group_input
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ?tags:(tags_ : tag_list option)
    ?managed_configuration:(managed_configuration_ : managed_configuration option)
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({
     model_package_group_name = model_package_group_name_;
     model_package_group_description = model_package_group_description_;
     tags = tags_;
     managed_configuration = managed_configuration_;
   }
    : create_model_package_group_input)

let make_create_model_quality_job_definition_response
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn) () =
  ({ job_definition_arn = job_definition_arn_ } : create_model_quality_job_definition_response)

let make_model_quality_job_input ?endpoint_input:(endpoint_input_ : endpoint_input option)
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option)
    ~ground_truth_s3_input:(ground_truth_s3_input_ : monitoring_ground_truth_s3_input) () =
  ({
     endpoint_input = endpoint_input_;
     batch_transform_input = batch_transform_input_;
     ground_truth_s3_input = ground_truth_s3_input_;
   }
    : model_quality_job_input)

let make_model_quality_app_specification
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ?container_arguments:(container_arguments_ : monitoring_container_arguments option)
    ?record_preprocessor_source_uri:(record_preprocessor_source_uri_ : s3_uri option)
    ?post_analytics_processor_source_uri:(post_analytics_processor_source_uri_ : s3_uri option)
    ?problem_type:(problem_type_ : monitoring_problem_type option)
    ?environment:(environment_ : monitoring_environment_map option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     image_uri = image_uri_;
     container_entrypoint = container_entrypoint_;
     container_arguments = container_arguments_;
     record_preprocessor_source_uri = record_preprocessor_source_uri_;
     post_analytics_processor_source_uri = post_analytics_processor_source_uri_;
     problem_type = problem_type_;
     environment = environment_;
   }
    : model_quality_app_specification)

let make_model_quality_baseline_config
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option)
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option) () =
  ({ baselining_job_name = baselining_job_name_; constraints_resource = constraints_resource_ }
    : model_quality_baseline_config)

let make_create_model_quality_job_definition_request
    ?model_quality_baseline_config:
      (model_quality_baseline_config_ : model_quality_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?tags:(tags_ : tag_list option)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~model_quality_app_specification:
      (model_quality_app_specification_ : model_quality_app_specification)
    ~model_quality_job_input:(model_quality_job_input_ : model_quality_job_input)
    ~model_quality_job_output_config:(model_quality_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_name = job_definition_name_;
     model_quality_baseline_config = model_quality_baseline_config_;
     model_quality_app_specification = model_quality_app_specification_;
     model_quality_job_input = model_quality_job_input_;
     model_quality_job_output_config = model_quality_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
     tags = tags_;
   }
    : create_model_quality_job_definition_request)

let make_create_monitoring_schedule_response
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn) () =
  ({ monitoring_schedule_arn = monitoring_schedule_arn_ } : create_monitoring_schedule_response)

let make_network_config
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?vpc_config:(vpc_config_ : vpc_config option) () =
  ({
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_network_isolation = enable_network_isolation_;
     vpc_config = vpc_config_;
   }
    : network_config)

let make_monitoring_app_specification
    ?container_entrypoint:(container_entrypoint_ : container_entrypoint option)
    ?container_arguments:(container_arguments_ : monitoring_container_arguments option)
    ?record_preprocessor_source_uri:(record_preprocessor_source_uri_ : s3_uri option)
    ?post_analytics_processor_source_uri:(post_analytics_processor_source_uri_ : s3_uri option)
    ~image_uri:(image_uri_ : image_uri) () =
  ({
     image_uri = image_uri_;
     container_entrypoint = container_entrypoint_;
     container_arguments = container_arguments_;
     record_preprocessor_source_uri = record_preprocessor_source_uri_;
     post_analytics_processor_source_uri = post_analytics_processor_source_uri_;
   }
    : monitoring_app_specification)

let make_monitoring_input ?endpoint_input:(endpoint_input_ : endpoint_input option)
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option) () =
  ({ endpoint_input = endpoint_input_; batch_transform_input = batch_transform_input_ }
    : monitoring_input)

let make_monitoring_baseline_config
    ?baselining_job_name:(baselining_job_name_ : processing_job_name option)
    ?constraints_resource:(constraints_resource_ : monitoring_constraints_resource option)
    ?statistics_resource:(statistics_resource_ : monitoring_statistics_resource option) () =
  ({
     baselining_job_name = baselining_job_name_;
     constraints_resource = constraints_resource_;
     statistics_resource = statistics_resource_;
   }
    : monitoring_baseline_config)

let make_monitoring_job_definition
    ?baseline_config:(baseline_config_ : monitoring_baseline_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ?environment:(environment_ : monitoring_environment_map option)
    ?network_config:(network_config_ : network_config option)
    ~monitoring_inputs:(monitoring_inputs_ : monitoring_inputs)
    ~monitoring_output_config:(monitoring_output_config_ : monitoring_output_config)
    ~monitoring_resources:(monitoring_resources_ : monitoring_resources)
    ~monitoring_app_specification:(monitoring_app_specification_ : monitoring_app_specification)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     baseline_config = baseline_config_;
     monitoring_inputs = monitoring_inputs_;
     monitoring_output_config = monitoring_output_config_;
     monitoring_resources = monitoring_resources_;
     monitoring_app_specification = monitoring_app_specification_;
     stopping_condition = stopping_condition_;
     environment = environment_;
     network_config = network_config_;
     role_arn = role_arn_;
   }
    : monitoring_job_definition)

let make_schedule_config ?data_analysis_start_time:(data_analysis_start_time_ : string_ option)
    ?data_analysis_end_time:(data_analysis_end_time_ : string_ option)
    ~schedule_expression:(schedule_expression_ : schedule_expression) () =
  ({
     schedule_expression = schedule_expression_;
     data_analysis_start_time = data_analysis_start_time_;
     data_analysis_end_time = data_analysis_end_time_;
   }
    : schedule_config)

let make_monitoring_schedule_config ?schedule_config:(schedule_config_ : schedule_config option)
    ?monitoring_job_definition:(monitoring_job_definition_ : monitoring_job_definition option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option) () =
  ({
     schedule_config = schedule_config_;
     monitoring_job_definition = monitoring_job_definition_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     monitoring_type = monitoring_type_;
   }
    : monitoring_schedule_config)

let make_create_monitoring_schedule_request ?tags:(tags_ : tag_list option)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_config = monitoring_schedule_config_;
     tags = tags_;
   }
    : create_monitoring_schedule_request)

let make_create_notebook_instance_output
    ?notebook_instance_arn:(notebook_instance_arn_ : notebook_instance_arn option) () =
  ({ notebook_instance_arn = notebook_instance_arn_ } : create_notebook_instance_output)

let make_instance_metadata_service_configuration
    ~minimum_instance_metadata_service_version:
      (minimum_instance_metadata_service_version_ : minimum_instance_metadata_service_version) () =
  ({ minimum_instance_metadata_service_version = minimum_instance_metadata_service_version_ }
    : instance_metadata_service_configuration)

let make_create_notebook_instance_input ?subnet_id:(subnet_id_ : subnet_id option)
    ?security_group_ids:(security_group_ids_ : security_group_ids option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?tags:(tags_ : tag_list option)
    ?lifecycle_config_name:(lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?direct_internet_access:(direct_internet_access_ : direct_internet_access option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : notebook_instance_volume_size_in_g_b option)
    ?accelerator_types:(accelerator_types_ : notebook_instance_accelerator_types option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ?root_access:(root_access_ : root_access option)
    ?platform_identifier:(platform_identifier_ : platform_identifier option)
    ?instance_metadata_service_configuration:
      (instance_metadata_service_configuration_ : instance_metadata_service_configuration option)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name)
    ~instance_type:(instance_type_ : instance_type) ~role_arn:(role_arn_ : role_arn) () =
  ({
     notebook_instance_name = notebook_instance_name_;
     instance_type = instance_type_;
     subnet_id = subnet_id_;
     security_group_ids = security_group_ids_;
     ip_address_type = ip_address_type_;
     role_arn = role_arn_;
     kms_key_id = kms_key_id_;
     tags = tags_;
     lifecycle_config_name = lifecycle_config_name_;
     direct_internet_access = direct_internet_access_;
     volume_size_in_g_b = volume_size_in_g_b_;
     accelerator_types = accelerator_types_;
     default_code_repository = default_code_repository_;
     additional_code_repositories = additional_code_repositories_;
     root_access = root_access_;
     platform_identifier = platform_identifier_;
     instance_metadata_service_configuration = instance_metadata_service_configuration_;
   }
    : create_notebook_instance_input)

let make_create_notebook_instance_lifecycle_config_output
    ?notebook_instance_lifecycle_config_arn:
      (notebook_instance_lifecycle_config_arn_ : notebook_instance_lifecycle_config_arn option) () =
  ({ notebook_instance_lifecycle_config_arn = notebook_instance_lifecycle_config_arn_ }
    : create_notebook_instance_lifecycle_config_output)

let make_notebook_instance_lifecycle_hook
    ?content:(content_ : notebook_instance_lifecycle_config_content option) () =
  ({ content = content_ } : notebook_instance_lifecycle_hook)

let make_create_notebook_instance_lifecycle_config_input
    ?on_create:(on_create_ : notebook_instance_lifecycle_config_list option)
    ?on_start:(on_start_ : notebook_instance_lifecycle_config_list option)
    ?tags:(tags_ : tag_list option)
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     on_create = on_create_;
     on_start = on_start_;
     tags = tags_;
   }
    : create_notebook_instance_lifecycle_config_input)

let make_create_optimization_job_response
    ~optimization_job_arn:(optimization_job_arn_ : optimization_job_arn) () =
  ({ optimization_job_arn = optimization_job_arn_ } : create_optimization_job_response)

let make_optimization_vpc_config
    ~security_group_ids:(security_group_ids_ : optimization_vpc_security_group_ids)
    ~subnets:(subnets_ : optimization_vpc_subnets) () =
  ({ security_group_ids = security_group_ids_; subnets = subnets_ } : optimization_vpc_config)

let make_optimization_sage_maker_model ?model_name:(model_name_ : model_name option) () =
  ({ model_name = model_name_ } : optimization_sage_maker_model)

let make_optimization_job_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?sage_maker_model:(sage_maker_model_ : optimization_sage_maker_model option)
    ~s3_output_location:(s3_output_location_ : s3_uri) () =
  ({
     kms_key_id = kms_key_id_;
     s3_output_location = s3_output_location_;
     sage_maker_model = sage_maker_model_;
   }
    : optimization_job_output_config)

let make_model_speculative_decoding_training_data_source ~s3_uri:(s3_uri_ : s3_uri)
    ~s3_data_type:(s3_data_type_ : model_speculative_decoding_s3_data_type) () =
  ({ s3_uri = s3_uri_; s3_data_type = s3_data_type_ }
    : model_speculative_decoding_training_data_source)

let make_model_speculative_decoding_config
    ?training_data_source:
      (training_data_source_ : model_speculative_decoding_training_data_source option)
    ~technique:(technique_ : model_speculative_decoding_technique) () =
  ({ technique = technique_; training_data_source = training_data_source_ }
    : model_speculative_decoding_config)

let make_model_sharding_config ?image:(image_ : optimization_container_image option)
    ?override_environment:(override_environment_ : optimization_job_environment_variables option) ()
    =
  ({ image = image_; override_environment = override_environment_ } : model_sharding_config)

let make_model_compilation_config ?image:(image_ : optimization_container_image option)
    ?override_environment:(override_environment_ : optimization_job_environment_variables option) ()
    =
  ({ image = image_; override_environment = override_environment_ } : model_compilation_config)

let make_model_quantization_config ?image:(image_ : optimization_container_image option)
    ?override_environment:(override_environment_ : optimization_job_environment_variables option) ()
    =
  ({ image = image_; override_environment = override_environment_ } : model_quantization_config)

let make_optimization_model_access_config
    ~accept_eula:(accept_eula_ : optimization_model_accept_eula) () =
  ({ accept_eula = accept_eula_ } : optimization_model_access_config)

let make_optimization_job_model_source_s3 ?s3_uri:(s3_uri_ : s3_uri option)
    ?model_access_config:(model_access_config_ : optimization_model_access_config option) () =
  ({ s3_uri = s3_uri_; model_access_config = model_access_config_ }
    : optimization_job_model_source_s3)

let make_optimization_job_model_source ?s3:(s3_ : optimization_job_model_source_s3 option)
    ?sage_maker_model:(sage_maker_model_ : optimization_sage_maker_model option) () =
  ({ s3 = s3_; sage_maker_model = sage_maker_model_ } : optimization_job_model_source)

let make_create_optimization_job_request
    ?max_instance_count:(max_instance_count_ : optimization_job_max_instance_count option)
    ?optimization_environment:
      (optimization_environment_ : optimization_job_environment_variables option)
    ?tags:(tags_ : tag_list option) ?vpc_config:(vpc_config_ : optimization_vpc_config option)
    ~optimization_job_name:(optimization_job_name_ : entity_name) ~role_arn:(role_arn_ : role_arn)
    ~model_source:(model_source_ : optimization_job_model_source)
    ~deployment_instance_type:
      (deployment_instance_type_ : optimization_job_deployment_instance_type)
    ~optimization_configs:(optimization_configs_ : optimization_configs)
    ~output_config:(output_config_ : optimization_job_output_config)
    ~stopping_condition:(stopping_condition_ : stopping_condition) () =
  ({
     optimization_job_name = optimization_job_name_;
     role_arn = role_arn_;
     model_source = model_source_;
     deployment_instance_type = deployment_instance_type_;
     max_instance_count = max_instance_count_;
     optimization_environment = optimization_environment_;
     optimization_configs = optimization_configs_;
     output_config = output_config_;
     stopping_condition = stopping_condition_;
     tags = tags_;
     vpc_config = vpc_config_;
   }
    : create_optimization_job_request)

let make_create_partner_app_response ?arn:(arn_ : partner_app_arn option) () =
  ({ arn = arn_ } : create_partner_app_response)

let make_role_group_assignment ~role_name:(role_name_ : non_empty_string256)
    ~group_patterns:(group_patterns_ : group_patterns_list) () =
  ({ role_name = role_name_; group_patterns = group_patterns_ } : role_group_assignment)

let make_partner_app_config ?admin_users:(admin_users_ : partner_app_admin_user_list option)
    ?arguments:(arguments_ : partner_app_arguments option)
    ?assigned_group_patterns:(assigned_group_patterns_ : assigned_group_patterns_list option)
    ?role_group_assignments:(role_group_assignments_ : role_group_assignments_list option) () =
  ({
     admin_users = admin_users_;
     arguments = arguments_;
     assigned_group_patterns = assigned_group_patterns_;
     role_group_assignments = role_group_assignments_;
   }
    : partner_app_config)

let make_partner_app_maintenance_config
    ?maintenance_window_start:(maintenance_window_start_ : weekly_schedule_time_format option) () =
  ({ maintenance_window_start = maintenance_window_start_ } : partner_app_maintenance_config)

let make_create_partner_app_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?maintenance_config:(maintenance_config_ : partner_app_maintenance_config option)
    ?application_config:(application_config_ : partner_app_config option)
    ?enable_iam_session_based_identity:(enable_iam_session_based_identity_ : boolean_ option)
    ?enable_auto_minor_version_upgrade:(enable_auto_minor_version_upgrade_ : boolean_ option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : partner_app_name) ~type_:(type__ : partner_app_type)
    ~execution_role_arn:(execution_role_arn_ : role_arn) ~tier:(tier_ : non_empty_string64)
    ~auth_type:(auth_type_ : partner_app_auth_type) () =
  ({
     name = name_;
     type_ = type__;
     execution_role_arn = execution_role_arn_;
     kms_key_id = kms_key_id_;
     maintenance_config = maintenance_config_;
     tier = tier_;
     application_config = application_config_;
     auth_type = auth_type_;
     enable_iam_session_based_identity = enable_iam_session_based_identity_;
     enable_auto_minor_version_upgrade = enable_auto_minor_version_upgrade_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_partner_app_request)

let make_create_partner_app_presigned_url_response ?url:(url_ : string2048 option) () =
  ({ url = url_ } : create_partner_app_presigned_url_response)

let make_create_partner_app_presigned_url_request
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ~arn:(arn_ : partner_app_arn) () =
  ({
     arn = arn_;
     expires_in_seconds = expires_in_seconds_;
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
   }
    : create_partner_app_presigned_url_request)

let make_create_pipeline_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({ pipeline_arn = pipeline_arn_ } : create_pipeline_response)

let make_parallelism_configuration
    ~max_parallel_execution_steps:(max_parallel_execution_steps_ : max_parallel_execution_steps) ()
    =
  ({ max_parallel_execution_steps = max_parallel_execution_steps_ } : parallelism_configuration)

let make_pipeline_definition_s3_location ?version_id:(version_id_ : version_id option)
    ~bucket:(bucket_ : bucket_name) ~object_key:(object_key_ : key) () =
  ({ bucket = bucket_; object_key = object_key_; version_id = version_id_ }
    : pipeline_definition_s3_location)

let make_create_pipeline_request
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option)
    ?pipeline_definition_s3_location:
      (pipeline_definition_s3_location_ : pipeline_definition_s3_location option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?tags:(tags_ : tag_list option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~client_request_token:(client_request_token_ : idempotency_token)
    ~role_arn:(role_arn_ : role_arn) () =
  ({
     pipeline_name = pipeline_name_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_definition = pipeline_definition_;
     pipeline_definition_s3_location = pipeline_definition_s3_location_;
     pipeline_description = pipeline_description_;
     client_request_token = client_request_token_;
     role_arn = role_arn_;
     tags = tags_;
     parallelism_configuration = parallelism_configuration_;
   }
    : create_pipeline_request)

let make_create_presigned_domain_url_response
    ?authorized_url:(authorized_url_ : presigned_domain_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_domain_url_response)

let make_create_presigned_domain_url_request
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ?space_name:(space_name_ : space_name option) ?landing_uri:(landing_uri_ : landing_uri option)
    ~domain_id:(domain_id_ : domain_id) ~user_profile_name:(user_profile_name_ : user_profile_name)
    () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
     expires_in_seconds = expires_in_seconds_;
     space_name = space_name_;
     landing_uri = landing_uri_;
   }
    : create_presigned_domain_url_request)

let make_create_presigned_mlflow_app_url_response
    ?authorized_url:(authorized_url_ : mlflow_app_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_mlflow_app_url_response)

let make_create_presigned_mlflow_app_url_request
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ~arn:(arn_ : mlflow_app_arn) () =
  ({
     arn = arn_;
     expires_in_seconds = expires_in_seconds_;
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
   }
    : create_presigned_mlflow_app_url_request)

let make_create_presigned_mlflow_tracking_server_url_response
    ?authorized_url:(authorized_url_ : tracking_server_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_mlflow_tracking_server_url_response)

let make_create_presigned_mlflow_tracking_server_url_request
    ?expires_in_seconds:(expires_in_seconds_ : expires_in_seconds option)
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({
     tracking_server_name = tracking_server_name_;
     expires_in_seconds = expires_in_seconds_;
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
   }
    : create_presigned_mlflow_tracking_server_url_request)

let make_create_presigned_notebook_instance_url_output
    ?authorized_url:(authorized_url_ : notebook_instance_url option) () =
  ({ authorized_url = authorized_url_ } : create_presigned_notebook_instance_url_output)

let make_create_presigned_notebook_instance_url_input
    ?session_expiration_duration_in_seconds:
      (session_expiration_duration_in_seconds_ : session_expiration_duration_in_seconds option)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({
     notebook_instance_name = notebook_instance_name_;
     session_expiration_duration_in_seconds = session_expiration_duration_in_seconds_;
   }
    : create_presigned_notebook_instance_url_input)

let make_create_processing_job_response
    ~processing_job_arn:(processing_job_arn_ : processing_job_arn) () =
  ({ processing_job_arn = processing_job_arn_ } : create_processing_job_response)

let make_experiment_config ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?trial_name:(trial_name_ : experiment_entity_name option)
    ?trial_component_display_name:(trial_component_display_name_ : experiment_entity_name option)
    ?run_name:(run_name_ : experiment_entity_name option) () =
  ({
     experiment_name = experiment_name_;
     trial_name = trial_name_;
     trial_component_display_name = trial_component_display_name_;
     run_name = run_name_;
   }
    : experiment_config)

let make_processing_stopping_condition
    ~max_runtime_in_seconds:(max_runtime_in_seconds_ : processing_max_runtime_in_seconds) () =
  ({ max_runtime_in_seconds = max_runtime_in_seconds_ } : processing_stopping_condition)

let make_processing_cluster_config ?volume_kms_key_id:(volume_kms_key_id_ : kms_key_id option)
    ~instance_count:(instance_count_ : processing_instance_count)
    ~instance_type:(instance_type_ : processing_instance_type)
    ~volume_size_in_g_b:(volume_size_in_g_b_ : processing_volume_size_in_g_b) () =
  ({
     instance_count = instance_count_;
     instance_type = instance_type_;
     volume_size_in_g_b = volume_size_in_g_b_;
     volume_kms_key_id = volume_kms_key_id_;
   }
    : processing_cluster_config)

let make_processing_resources ~cluster_config:(cluster_config_ : processing_cluster_config) () =
  ({ cluster_config = cluster_config_ } : processing_resources)

let make_processing_feature_store_output
    ~feature_group_name:(feature_group_name_ : feature_group_name) () =
  ({ feature_group_name = feature_group_name_ } : processing_feature_store_output)

let make_processing_s3_output ?local_path:(local_path_ : processing_local_path option)
    ~s3_uri:(s3_uri_ : s3_uri) ~s3_upload_mode:(s3_upload_mode_ : processing_s3_upload_mode) () =
  ({ s3_uri = s3_uri_; local_path = local_path_; s3_upload_mode = s3_upload_mode_ }
    : processing_s3_output)

let make_processing_output ?s3_output:(s3_output_ : processing_s3_output option)
    ?feature_store_output:(feature_store_output_ : processing_feature_store_output option)
    ?app_managed:(app_managed_ : app_managed option) ~output_name:(output_name_ : string_) () =
  ({
     output_name = output_name_;
     s3_output = s3_output_;
     feature_store_output = feature_store_output_;
     app_managed = app_managed_;
   }
    : processing_output)

let make_processing_output_config ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~outputs:(outputs_ : processing_outputs) () =
  ({ outputs = outputs_; kms_key_id = kms_key_id_ } : processing_output_config)

let make_redshift_dataset_definition ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?output_compression:(output_compression_ : redshift_result_compression_type option)
    ~cluster_id:(cluster_id_ : redshift_cluster_id) ~database:(database_ : redshift_database)
    ~db_user:(db_user_ : redshift_user_name) ~query_string:(query_string_ : redshift_query_string)
    ~cluster_role_arn:(cluster_role_arn_ : role_arn) ~output_s3_uri:(output_s3_uri_ : s3_uri)
    ~output_format:(output_format_ : redshift_result_format) () =
  ({
     cluster_id = cluster_id_;
     database = database_;
     db_user = db_user_;
     query_string = query_string_;
     cluster_role_arn = cluster_role_arn_;
     output_s3_uri = output_s3_uri_;
     kms_key_id = kms_key_id_;
     output_format = output_format_;
     output_compression = output_compression_;
   }
    : redshift_dataset_definition)

let make_dataset_definition
    ?athena_dataset_definition:(athena_dataset_definition_ : athena_dataset_definition option)
    ?redshift_dataset_definition:(redshift_dataset_definition_ : redshift_dataset_definition option)
    ?local_path:(local_path_ : processing_local_path option)
    ?data_distribution_type:(data_distribution_type_ : data_distribution_type option)
    ?input_mode:(input_mode_ : input_mode option) () =
  ({
     athena_dataset_definition = athena_dataset_definition_;
     redshift_dataset_definition = redshift_dataset_definition_;
     local_path = local_path_;
     data_distribution_type = data_distribution_type_;
     input_mode = input_mode_;
   }
    : dataset_definition)

let make_processing_s3_input ?local_path:(local_path_ : processing_local_path option)
    ?s3_input_mode:(s3_input_mode_ : processing_s3_input_mode option)
    ?s3_data_distribution_type:
      (s3_data_distribution_type_ : processing_s3_data_distribution_type option)
    ?s3_compression_type:(s3_compression_type_ : processing_s3_compression_type option)
    ~s3_uri:(s3_uri_ : s3_uri) ~s3_data_type:(s3_data_type_ : processing_s3_data_type) () =
  ({
     s3_uri = s3_uri_;
     local_path = local_path_;
     s3_data_type = s3_data_type_;
     s3_input_mode = s3_input_mode_;
     s3_data_distribution_type = s3_data_distribution_type_;
     s3_compression_type = s3_compression_type_;
   }
    : processing_s3_input)

let make_processing_input ?app_managed:(app_managed_ : app_managed option)
    ?s3_input:(s3_input_ : processing_s3_input option)
    ?dataset_definition:(dataset_definition_ : dataset_definition option)
    ~input_name:(input_name_ : string_) () =
  ({
     input_name = input_name_;
     app_managed = app_managed_;
     s3_input = s3_input_;
     dataset_definition = dataset_definition_;
   }
    : processing_input)

let make_create_processing_job_request
    ?processing_inputs:(processing_inputs_ : processing_inputs option)
    ?processing_output_config:(processing_output_config_ : processing_output_config option)
    ?stopping_condition:(stopping_condition_ : processing_stopping_condition option)
    ?environment:(environment_ : processing_environment_map option)
    ?network_config:(network_config_ : network_config option) ?tags:(tags_ : tag_list option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ~processing_job_name:(processing_job_name_ : processing_job_name)
    ~processing_resources:(processing_resources_ : processing_resources)
    ~app_specification:(app_specification_ : app_specification) ~role_arn:(role_arn_ : role_arn) ()
    =
  ({
     processing_inputs = processing_inputs_;
     processing_output_config = processing_output_config_;
     processing_job_name = processing_job_name_;
     processing_resources = processing_resources_;
     stopping_condition = stopping_condition_;
     app_specification = app_specification_;
     environment = environment_;
     network_config = network_config_;
     role_arn = role_arn_;
     tags = tags_;
     experiment_config = experiment_config_;
   }
    : create_processing_job_request)

let make_create_project_output ~project_arn:(project_arn_ : project_arn)
    ~project_id:(project_id_ : project_id) () =
  ({ project_arn = project_arn_; project_id = project_id_ } : create_project_output)

let make_create_template_provider
    ?cfn_template_provider:(cfn_template_provider_ : cfn_create_template_provider option) () =
  ({ cfn_template_provider = cfn_template_provider_ } : create_template_provider)

let make_provisioning_parameter ?key:(key_ : provisioning_parameter_key option)
    ?value:(value_ : provisioning_parameter_value option) () =
  ({ key = key_; value = value_ } : provisioning_parameter)

let make_service_catalog_provisioning_details
    ?provisioning_artifact_id:(provisioning_artifact_id_ : service_catalog_entity_id option)
    ?path_id:(path_id_ : service_catalog_entity_id option)
    ?provisioning_parameters:(provisioning_parameters_ : provisioning_parameters option)
    ~product_id:(product_id_ : service_catalog_entity_id) () =
  ({
     product_id = product_id_;
     provisioning_artifact_id = provisioning_artifact_id_;
     path_id = path_id_;
     provisioning_parameters = provisioning_parameters_;
   }
    : service_catalog_provisioning_details)

let make_create_project_input
    ?project_description:(project_description_ : entity_description option)
    ?service_catalog_provisioning_details:
      (service_catalog_provisioning_details_ : service_catalog_provisioning_details option)
    ?tags:(tags_ : tag_list option)
    ?template_providers:(template_providers_ : create_template_provider_list option)
    ~project_name:(project_name_ : project_entity_name) () =
  ({
     project_name = project_name_;
     project_description = project_description_;
     service_catalog_provisioning_details = service_catalog_provisioning_details_;
     tags = tags_;
     template_providers = template_providers_;
   }
    : create_project_input)

let make_create_space_response ?space_arn:(space_arn_ : space_arn option) () =
  ({ space_arn = space_arn_ } : create_space_response)

let make_space_sharing_settings ~sharing_type:(sharing_type_ : sharing_type) () =
  ({ sharing_type = sharing_type_ } : space_sharing_settings)

let make_ownership_settings ~owner_user_profile_name:(owner_user_profile_name_ : user_profile_name)
    () =
  ({ owner_user_profile_name = owner_user_profile_name_ } : ownership_settings)

let make_s3_file_system ~s3_uri:(s3_uri_ : s3_schema_uri) () =
  ({ s3_uri = s3_uri_ } : s3_file_system)

let make_f_sx_lustre_file_system ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_ } : f_sx_lustre_file_system)

let make_efs_file_system ~file_system_id:(file_system_id_ : file_system_id) () =
  ({ file_system_id = file_system_id_ } : efs_file_system)

let make_ebs_storage_settings
    ~ebs_volume_size_in_gb:(ebs_volume_size_in_gb_ : space_ebs_volume_size_in_gb) () =
  ({ ebs_volume_size_in_gb = ebs_volume_size_in_gb_ } : ebs_storage_settings)

let make_space_storage_settings
    ?ebs_storage_settings:(ebs_storage_settings_ : ebs_storage_settings option) () =
  ({ ebs_storage_settings = ebs_storage_settings_ } : space_storage_settings)

let make_space_idle_settings
    ?idle_timeout_in_minutes:(idle_timeout_in_minutes_ : idle_timeout_in_minutes option) () =
  ({ idle_timeout_in_minutes = idle_timeout_in_minutes_ } : space_idle_settings)

let make_space_app_lifecycle_management ?idle_settings:(idle_settings_ : space_idle_settings option)
    () =
  ({ idle_settings = idle_settings_ } : space_app_lifecycle_management)

let make_space_jupyter_lab_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?code_repositories:(code_repositories_ : code_repositories option)
    ?app_lifecycle_management:(app_lifecycle_management_ : space_app_lifecycle_management option) ()
    =
  ({
     default_resource_spec = default_resource_spec_;
     code_repositories = code_repositories_;
     app_lifecycle_management = app_lifecycle_management_;
   }
    : space_jupyter_lab_app_settings)

let make_space_code_editor_app_settings
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?app_lifecycle_management:(app_lifecycle_management_ : space_app_lifecycle_management option) ()
    =
  ({
     default_resource_spec = default_resource_spec_;
     app_lifecycle_management = app_lifecycle_management_;
   }
    : space_code_editor_app_settings)

let make_space_settings
    ?jupyter_server_app_settings:(jupyter_server_app_settings_ : jupyter_server_app_settings option)
    ?kernel_gateway_app_settings:(kernel_gateway_app_settings_ : kernel_gateway_app_settings option)
    ?code_editor_app_settings:(code_editor_app_settings_ : space_code_editor_app_settings option)
    ?jupyter_lab_app_settings:(jupyter_lab_app_settings_ : space_jupyter_lab_app_settings option)
    ?app_type:(app_type_ : app_type option)
    ?space_storage_settings:(space_storage_settings_ : space_storage_settings option)
    ?space_managed_resources:(space_managed_resources_ : feature_status option)
    ?custom_file_systems:(custom_file_systems_ : custom_file_systems option)
    ?remote_access:(remote_access_ : feature_status option) () =
  ({
     jupyter_server_app_settings = jupyter_server_app_settings_;
     kernel_gateway_app_settings = kernel_gateway_app_settings_;
     code_editor_app_settings = code_editor_app_settings_;
     jupyter_lab_app_settings = jupyter_lab_app_settings_;
     app_type = app_type_;
     space_storage_settings = space_storage_settings_;
     space_managed_resources = space_managed_resources_;
     custom_file_systems = custom_file_systems_;
     remote_access = remote_access_;
   }
    : space_settings)

let make_create_space_request ?tags:(tags_ : tag_list option)
    ?space_settings:(space_settings_ : space_settings option)
    ?ownership_settings:(ownership_settings_ : ownership_settings option)
    ?space_sharing_settings:(space_sharing_settings_ : space_sharing_settings option)
    ?space_display_name:(space_display_name_ : non_empty_string64 option)
    ~domain_id:(domain_id_ : domain_id) ~space_name:(space_name_ : space_name) () =
  ({
     domain_id = domain_id_;
     space_name = space_name_;
     tags = tags_;
     space_settings = space_settings_;
     ownership_settings = ownership_settings_;
     space_sharing_settings = space_sharing_settings_;
     space_display_name = space_display_name_;
   }
    : create_space_request)

let make_create_studio_lifecycle_config_response
    ?studio_lifecycle_config_arn:(studio_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    () =
  ({ studio_lifecycle_config_arn = studio_lifecycle_config_arn_ }
    : create_studio_lifecycle_config_response)

let make_create_studio_lifecycle_config_request ?tags:(tags_ : tag_list option)
    ~studio_lifecycle_config_name:(studio_lifecycle_config_name_ : studio_lifecycle_config_name)
    ~studio_lifecycle_config_content:
      (studio_lifecycle_config_content_ : studio_lifecycle_config_content)
    ~studio_lifecycle_config_app_type:
      (studio_lifecycle_config_app_type_ : studio_lifecycle_config_app_type) () =
  ({
     studio_lifecycle_config_name = studio_lifecycle_config_name_;
     studio_lifecycle_config_content = studio_lifecycle_config_content_;
     studio_lifecycle_config_app_type = studio_lifecycle_config_app_type_;
     tags = tags_;
   }
    : create_studio_lifecycle_config_request)

let make_create_training_job_response ~training_job_arn:(training_job_arn_ : training_job_arn) () =
  ({ training_job_arn = training_job_arn_ } : create_training_job_response)

let make_model_package_config
    ?source_model_package_arn:(source_model_package_arn_ : model_package_arn option)
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn) () =
  ({
     model_package_group_arn = model_package_group_arn_;
     source_model_package_arn = source_model_package_arn_;
   }
    : model_package_config)

let make_mlflow_config
    ?mlflow_experiment_name:(mlflow_experiment_name_ : mlflow_experiment_name option)
    ?mlflow_run_name:(mlflow_run_name_ : mlflow_run_name option)
    ~mlflow_resource_arn:(mlflow_resource_arn_ : ml_flow_resource_arn) () =
  ({
     mlflow_resource_arn = mlflow_resource_arn_;
     mlflow_experiment_name = mlflow_experiment_name_;
     mlflow_run_name = mlflow_run_name_;
   }
    : mlflow_config)

let make_serverless_job_config ?accept_eula:(accept_eula_ : accept_eula option)
    ?customization_technique:(customization_technique_ : customization_technique option)
    ?peft:(peft_ : peft option) ?evaluation_type:(evaluation_type_ : evaluation_type option)
    ?evaluator_arn:(evaluator_arn_ : evaluator_arn option)
    ~base_model_arn:(base_model_arn_ : serverless_job_base_model_arn)
    ~job_type:(job_type_ : serverless_job_type) () =
  ({
     base_model_arn = base_model_arn_;
     accept_eula = accept_eula_;
     job_type = job_type_;
     customization_technique = customization_technique_;
     peft = peft_;
     evaluation_type = evaluation_type_;
     evaluator_arn = evaluator_arn_;
   }
    : serverless_job_config)

let make_session_chaining_config
    ?enable_session_tag_chaining:(enable_session_tag_chaining_ : enable_session_tag_chaining option)
    () =
  ({ enable_session_tag_chaining = enable_session_tag_chaining_ } : session_chaining_config)

let make_infra_check_config ?enable_infra_check:(enable_infra_check_ : enable_infra_check option) ()
    =
  ({ enable_infra_check = enable_infra_check_ } : infra_check_config)

let make_remote_debug_config
    ?enable_remote_debug:(enable_remote_debug_ : enable_remote_debug option) () =
  ({ enable_remote_debug = enable_remote_debug_ } : remote_debug_config)

let make_profiler_rule_configuration ?local_path:(local_path_ : directory_path option)
    ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?instance_type:(instance_type_ : processing_instance_type option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?rule_parameters:(rule_parameters_ : rule_parameters option)
    ~rule_configuration_name:(rule_configuration_name_ : rule_configuration_name)
    ~rule_evaluator_image:(rule_evaluator_image_ : algorithm_image) () =
  ({
     rule_configuration_name = rule_configuration_name_;
     local_path = local_path_;
     s3_output_path = s3_output_path_;
     rule_evaluator_image = rule_evaluator_image_;
     instance_type = instance_type_;
     volume_size_in_g_b = volume_size_in_g_b_;
     rule_parameters = rule_parameters_;
   }
    : profiler_rule_configuration)

let make_profiler_config ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?profiling_interval_in_milliseconds:
      (profiling_interval_in_milliseconds_ : profiling_interval_in_milliseconds option)
    ?profiling_parameters:(profiling_parameters_ : profiling_parameters option)
    ?disable_profiler:(disable_profiler_ : disable_profiler option) () =
  ({
     s3_output_path = s3_output_path_;
     profiling_interval_in_milliseconds = profiling_interval_in_milliseconds_;
     profiling_parameters = profiling_parameters_;
     disable_profiler = disable_profiler_;
   }
    : profiler_config)

let make_tensor_board_output_config ?local_path:(local_path_ : directory_path option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({ local_path = local_path_; s3_output_path = s3_output_path_ } : tensor_board_output_config)

let make_debug_rule_configuration ?local_path:(local_path_ : directory_path option)
    ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?instance_type:(instance_type_ : processing_instance_type option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : optional_volume_size_in_g_b option)
    ?rule_parameters:(rule_parameters_ : rule_parameters option)
    ~rule_configuration_name:(rule_configuration_name_ : rule_configuration_name)
    ~rule_evaluator_image:(rule_evaluator_image_ : algorithm_image) () =
  ({
     rule_configuration_name = rule_configuration_name_;
     local_path = local_path_;
     s3_output_path = s3_output_path_;
     rule_evaluator_image = rule_evaluator_image_;
     instance_type = instance_type_;
     volume_size_in_g_b = volume_size_in_g_b_;
     rule_parameters = rule_parameters_;
   }
    : debug_rule_configuration)

let make_debug_hook_config ?local_path:(local_path_ : directory_path option)
    ?hook_parameters:(hook_parameters_ : hook_parameters option)
    ?collection_configurations:(collection_configurations_ : collection_configurations option)
    ~s3_output_path:(s3_output_path_ : s3_uri) () =
  ({
     local_path = local_path_;
     s3_output_path = s3_output_path_;
     hook_parameters = hook_parameters_;
     collection_configurations = collection_configurations_;
   }
    : debug_hook_config)

let make_create_training_job_request ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ?algorithm_specification:(algorithm_specification_ : algorithm_specification option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?resource_config:(resource_config_ : resource_config option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?stopping_condition:(stopping_condition_ : stopping_condition option)
    ?tags:(tags_ : tag_list option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?debug_hook_config:(debug_hook_config_ : debug_hook_config option)
    ?debug_rule_configurations:(debug_rule_configurations_ : debug_rule_configurations option)
    ?tensor_board_output_config:(tensor_board_output_config_ : tensor_board_output_config option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?profiler_config:(profiler_config_ : profiler_config option)
    ?profiler_rule_configurations:
      (profiler_rule_configurations_ : profiler_rule_configurations option)
    ?environment:(environment_ : training_environment_map option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?remote_debug_config:(remote_debug_config_ : remote_debug_config option)
    ?infra_check_config:(infra_check_config_ : infra_check_config option)
    ?session_chaining_config:(session_chaining_config_ : session_chaining_config option)
    ?serverless_job_config:(serverless_job_config_ : serverless_job_config option)
    ?mlflow_config:(mlflow_config_ : mlflow_config option)
    ?model_package_config:(model_package_config_ : model_package_config option)
    ~training_job_name:(training_job_name_ : training_job_name) ~role_arn:(role_arn_ : role_arn)
    ~output_data_config:(output_data_config_ : output_data_config) () =
  ({
     training_job_name = training_job_name_;
     hyper_parameters = hyper_parameters_;
     algorithm_specification = algorithm_specification_;
     role_arn = role_arn_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     resource_config = resource_config_;
     vpc_config = vpc_config_;
     stopping_condition = stopping_condition_;
     tags = tags_;
     enable_network_isolation = enable_network_isolation_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_managed_spot_training = enable_managed_spot_training_;
     checkpoint_config = checkpoint_config_;
     debug_hook_config = debug_hook_config_;
     debug_rule_configurations = debug_rule_configurations_;
     tensor_board_output_config = tensor_board_output_config_;
     experiment_config = experiment_config_;
     profiler_config = profiler_config_;
     profiler_rule_configurations = profiler_rule_configurations_;
     environment = environment_;
     retry_strategy = retry_strategy_;
     remote_debug_config = remote_debug_config_;
     infra_check_config = infra_check_config_;
     session_chaining_config = session_chaining_config_;
     serverless_job_config = serverless_job_config_;
     mlflow_config = mlflow_config_;
     model_package_config = model_package_config_;
   }
    : create_training_job_request)

let make_create_training_plan_response ~training_plan_arn:(training_plan_arn_ : training_plan_arn)
    () =
  ({ training_plan_arn = training_plan_arn_ } : create_training_plan_response)

let make_create_training_plan_request
    ?spare_instance_count_per_ultra_server:
      (spare_instance_count_per_ultra_server_ : spare_instance_count_per_ultra_server option)
    ?tags:(tags_ : tag_list option) ~training_plan_name:(training_plan_name_ : training_plan_name)
    ~training_plan_offering_id:(training_plan_offering_id_ : training_plan_offering_id) () =
  ({
     training_plan_name = training_plan_name_;
     training_plan_offering_id = training_plan_offering_id_;
     spare_instance_count_per_ultra_server = spare_instance_count_per_ultra_server_;
     tags = tags_;
   }
    : create_training_plan_request)

let make_create_transform_job_response ~transform_job_arn:(transform_job_arn_ : transform_job_arn)
    () =
  ({ transform_job_arn = transform_job_arn_ } : create_transform_job_response)

let make_data_processing ?input_filter:(input_filter_ : json_path option)
    ?output_filter:(output_filter_ : json_path option)
    ?join_source:(join_source_ : join_source option) () =
  ({ input_filter = input_filter_; output_filter = output_filter_; join_source = join_source_ }
    : data_processing)

let make_model_client_config
    ?invocations_timeout_in_seconds:
      (invocations_timeout_in_seconds_ : invocations_timeout_in_seconds option)
    ?invocations_max_retries:(invocations_max_retries_ : invocations_max_retries option) () =
  ({
     invocations_timeout_in_seconds = invocations_timeout_in_seconds_;
     invocations_max_retries = invocations_max_retries_;
   }
    : model_client_config)

let make_create_transform_job_request
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ?model_client_config:(model_client_config_ : model_client_config option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?environment:(environment_ : transform_environment_map option)
    ?data_capture_config:(data_capture_config_ : batch_data_capture_config option)
    ?data_processing:(data_processing_ : data_processing option) ?tags:(tags_ : tag_list option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ~transform_job_name:(transform_job_name_ : transform_job_name)
    ~model_name:(model_name_ : model_name) ~transform_input:(transform_input_ : transform_input)
    ~transform_output:(transform_output_ : transform_output)
    ~transform_resources:(transform_resources_ : transform_resources) () =
  ({
     transform_job_name = transform_job_name_;
     model_name = model_name_;
     max_concurrent_transforms = max_concurrent_transforms_;
     model_client_config = model_client_config_;
     max_payload_in_m_b = max_payload_in_m_b_;
     batch_strategy = batch_strategy_;
     environment = environment_;
     transform_input = transform_input_;
     transform_output = transform_output_;
     data_capture_config = data_capture_config_;
     transform_resources = transform_resources_;
     data_processing = data_processing_;
     tags = tags_;
     experiment_config = experiment_config_;
   }
    : create_transform_job_request)

let make_create_trial_response ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_arn = trial_arn_ } : create_trial_response)

let make_create_trial_request ?display_name:(display_name_ : experiment_entity_name option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?tags:(tags_ : tag_list option) ~trial_name:(trial_name_ : experiment_entity_name)
    ~experiment_name:(experiment_name_ : experiment_entity_name) () =
  ({
     trial_name = trial_name_;
     display_name = display_name_;
     experiment_name = experiment_name_;
     metadata_properties = metadata_properties_;
     tags = tags_;
   }
    : create_trial_request)

let make_create_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_component_arn = trial_component_arn_ } : create_trial_component_response)

let make_trial_component_artifact ?media_type:(media_type_ : media_type option)
    ~value:(value_ : trial_component_artifact_value) () =
  ({ media_type = media_type_; value = value_ } : trial_component_artifact)

let make_trial_component_status
    ?primary_status:(primary_status_ : trial_component_primary_status option)
    ?message:(message_ : trial_component_status_message option) () =
  ({ primary_status = primary_status_; message = message_ } : trial_component_status)

let make_create_trial_component_request
    ?display_name:(display_name_ : experiment_entity_name option)
    ?status:(status_ : trial_component_status option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?tags:(tags_ : tag_list option)
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({
     trial_component_name = trial_component_name_;
     display_name = display_name_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     parameters = parameters_;
     input_artifacts = input_artifacts_;
     output_artifacts = output_artifacts_;
     metadata_properties = metadata_properties_;
     tags = tags_;
   }
    : create_trial_component_request)

let make_create_user_profile_response
    ?user_profile_arn:(user_profile_arn_ : user_profile_arn option) () =
  ({ user_profile_arn = user_profile_arn_ } : create_user_profile_response)

let make_create_user_profile_request
    ?single_sign_on_user_identifier:
      (single_sign_on_user_identifier_ : single_sign_on_user_identifier option)
    ?single_sign_on_user_value:(single_sign_on_user_value_ : string256 option)
    ?tags:(tags_ : tag_list option) ?user_settings:(user_settings_ : user_settings option)
    ~domain_id:(domain_id_ : domain_id) ~user_profile_name:(user_profile_name_ : user_profile_name)
    () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     single_sign_on_user_identifier = single_sign_on_user_identifier_;
     single_sign_on_user_value = single_sign_on_user_value_;
     tags = tags_;
     user_settings = user_settings_;
   }
    : create_user_profile_request)

let make_create_workforce_response ~workforce_arn:(workforce_arn_ : workforce_arn) () =
  ({ workforce_arn = workforce_arn_ } : create_workforce_response)

let make_workforce_vpc_config_request ?vpc_id:(vpc_id_ : workforce_vpc_id option)
    ?security_group_ids:(security_group_ids_ : workforce_security_group_ids option)
    ?subnets:(subnets_ : workforce_subnets option) () =
  ({ vpc_id = vpc_id_; security_group_ids = security_group_ids_; subnets = subnets_ }
    : workforce_vpc_config_request)

let make_source_ip_config ~cidrs:(cidrs_ : cidrs) () = ({ cidrs = cidrs_ } : source_ip_config)

let make_oidc_config ?scope:(scope_ : scope option)
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ : authentication_request_extra_params option)
    ~client_id:(client_id_ : client_id) ~client_secret:(client_secret_ : client_secret)
    ~issuer:(issuer_ : oidc_endpoint)
    ~authorization_endpoint:(authorization_endpoint_ : oidc_endpoint)
    ~token_endpoint:(token_endpoint_ : oidc_endpoint)
    ~user_info_endpoint:(user_info_endpoint_ : oidc_endpoint)
    ~logout_endpoint:(logout_endpoint_ : oidc_endpoint) ~jwks_uri:(jwks_uri_ : oidc_endpoint) () =
  ({
     client_id = client_id_;
     client_secret = client_secret_;
     issuer = issuer_;
     authorization_endpoint = authorization_endpoint_;
     token_endpoint = token_endpoint_;
     user_info_endpoint = user_info_endpoint_;
     logout_endpoint = logout_endpoint_;
     jwks_uri = jwks_uri_;
     scope = scope_;
     authentication_request_extra_params = authentication_request_extra_params_;
   }
    : oidc_config)

let make_create_workforce_request ?cognito_config:(cognito_config_ : cognito_config option)
    ?oidc_config:(oidc_config_ : oidc_config option)
    ?source_ip_config:(source_ip_config_ : source_ip_config option) ?tags:(tags_ : tag_list option)
    ?workforce_vpc_config:(workforce_vpc_config_ : workforce_vpc_config_request option)
    ?ip_address_type:(ip_address_type_ : workforce_ip_address_type option)
    ~workforce_name:(workforce_name_ : workforce_name) () =
  ({
     cognito_config = cognito_config_;
     oidc_config = oidc_config_;
     source_ip_config = source_ip_config_;
     workforce_name = workforce_name_;
     tags = tags_;
     workforce_vpc_config = workforce_vpc_config_;
     ip_address_type = ip_address_type_;
   }
    : create_workforce_request)

let make_create_workteam_response ?workteam_arn:(workteam_arn_ : workteam_arn option) () =
  ({ workteam_arn = workteam_arn_ } : create_workteam_response)

let make_iam_policy_constraints ?source_ip:(source_ip_ : enabled_or_disabled option)
    ?vpc_source_ip:(vpc_source_ip_ : enabled_or_disabled option) () =
  ({ source_ip = source_ip_; vpc_source_ip = vpc_source_ip_ } : iam_policy_constraints)

let make_s3_presign
    ?iam_policy_constraints:(iam_policy_constraints_ : iam_policy_constraints option) () =
  ({ iam_policy_constraints = iam_policy_constraints_ } : s3_presign)

let make_worker_access_configuration ?s3_presign:(s3_presign_ : s3_presign option) () =
  ({ s3_presign = s3_presign_ } : worker_access_configuration)

let make_notification_configuration
    ?notification_topic_arn:(notification_topic_arn_ : notification_topic_arn option) () =
  ({ notification_topic_arn = notification_topic_arn_ } : notification_configuration)

let make_oidc_member_definition ?groups:(groups_ : groups option) () =
  ({ groups = groups_ } : oidc_member_definition)

let make_member_definition
    ?cognito_member_definition:(cognito_member_definition_ : cognito_member_definition option)
    ?oidc_member_definition:(oidc_member_definition_ : oidc_member_definition option) () =
  ({
     cognito_member_definition = cognito_member_definition_;
     oidc_member_definition = oidc_member_definition_;
   }
    : member_definition)

let make_create_workteam_request ?workforce_name:(workforce_name_ : workforce_name option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?worker_access_configuration:(worker_access_configuration_ : worker_access_configuration option)
    ?tags:(tags_ : tag_list option) ~workteam_name:(workteam_name_ : workteam_name)
    ~member_definitions:(member_definitions_ : member_definitions)
    ~description:(description_ : string200) () =
  ({
     workteam_name = workteam_name_;
     workforce_name = workforce_name_;
     member_definitions = member_definitions_;
     description = description_;
     notification_configuration = notification_configuration_;
     worker_access_configuration = worker_access_configuration_;
     tags = tags_;
   }
    : create_workteam_request)

let make_customized_metric_specification ?metric_name:(metric_name_ : string_ option)
    ?namespace:(namespace_ : string_ option) ?statistic:(statistic_ : statistic option) () =
  ({ metric_name = metric_name_; namespace = namespace_; statistic = statistic_ }
    : customized_metric_specification)

let make_data_capture_config_summary ~enable_capture:(enable_capture_ : enable_capture)
    ~capture_status:(capture_status_ : capture_status)
    ~current_sampling_percentage:(current_sampling_percentage_ : sampling_percentage)
    ~destination_s3_uri:(destination_s3_uri_ : destination_s3_uri)
    ~kms_key_id:(kms_key_id_ : kms_key_id) () =
  ({
     enable_capture = enable_capture_;
     capture_status = capture_status_;
     current_sampling_percentage = current_sampling_percentage_;
     destination_s3_uri = destination_s3_uri_;
     kms_key_id = kms_key_id_;
   }
    : data_capture_config_summary)

let make_debug_rule_evaluation_status
    ?rule_configuration_name:(rule_configuration_name_ : rule_configuration_name option)
    ?rule_evaluation_job_arn:(rule_evaluation_job_arn_ : processing_job_arn option)
    ?rule_evaluation_status:(rule_evaluation_status_ : rule_evaluation_status option)
    ?status_details:(status_details_ : status_details option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     rule_configuration_name = rule_configuration_name_;
     rule_evaluation_job_arn = rule_evaluation_job_arn_;
     rule_evaluation_status = rule_evaluation_status_;
     status_details = status_details_;
     last_modified_time = last_modified_time_;
   }
    : debug_rule_evaluation_status)

let make_instance_group_health_check_configuration
    ?instance_ids:(instance_ids_ : instance_ids option)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name)
    ~deep_health_checks:(deep_health_checks_ : deep_health_checks) () =
  ({
     instance_group_name = instance_group_name_;
     instance_ids = instance_ids_;
     deep_health_checks = deep_health_checks_;
   }
    : instance_group_health_check_configuration)

let make_delete_ai_benchmark_job_response
    ?ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn option) () =
  ({ ai_benchmark_job_arn = ai_benchmark_job_arn_ } : delete_ai_benchmark_job_response)

let make_delete_ai_benchmark_job_request
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({ ai_benchmark_job_name = ai_benchmark_job_name_ } : delete_ai_benchmark_job_request)

let make_delete_ai_recommendation_job_response
    ?ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn option) () =
  ({ ai_recommendation_job_arn = ai_recommendation_job_arn_ }
    : delete_ai_recommendation_job_response)

let make_delete_ai_recommendation_job_request
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({ ai_recommendation_job_name = ai_recommendation_job_name_ }
    : delete_ai_recommendation_job_request)

let make_delete_ai_workload_config_response
    ?ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn option) () =
  ({ ai_workload_config_arn = ai_workload_config_arn_ } : delete_ai_workload_config_response)

let make_delete_ai_workload_config_request
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({ ai_workload_config_name = ai_workload_config_name_ } : delete_ai_workload_config_request)

let make_delete_action_response ?action_arn:(action_arn_ : action_arn option) () =
  ({ action_arn = action_arn_ } : delete_action_response)

let make_delete_action_request ~action_name:(action_name_ : experiment_entity_name) () =
  ({ action_name = action_name_ } : delete_action_request)

let make_delete_algorithm_input ~algorithm_name:(algorithm_name_ : entity_name) () =
  ({ algorithm_name = algorithm_name_ } : delete_algorithm_input)

let make_delete_app_request ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?space_name:(space_name_ : space_name option) ~domain_id:(domain_id_ : domain_id)
    ~app_type:(app_type_ : app_type) ~app_name:(app_name_ : app_name) () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     space_name = space_name_;
     app_type = app_type_;
     app_name = app_name_;
   }
    : delete_app_request)

let make_delete_app_image_config_request
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({ app_image_config_name = app_image_config_name_ } : delete_app_image_config_request)

let make_delete_artifact_response ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({ artifact_arn = artifact_arn_ } : delete_artifact_response)

let make_delete_artifact_request ?artifact_arn:(artifact_arn_ : artifact_arn option)
    ?source:(source_ : artifact_source option) () =
  ({ artifact_arn = artifact_arn_; source = source_ } : delete_artifact_request)

let make_delete_association_response ?source_arn:(source_arn_ : association_entity_arn option)
    ?destination_arn:(destination_arn_ : association_entity_arn option) () =
  ({ source_arn = source_arn_; destination_arn = destination_arn_ } : delete_association_response)

let make_delete_association_request ~source_arn:(source_arn_ : association_entity_arn)
    ~destination_arn:(destination_arn_ : association_entity_arn) () =
  ({ source_arn = source_arn_; destination_arn = destination_arn_ } : delete_association_request)

let make_delete_cluster_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : delete_cluster_response)

let make_delete_cluster_request ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_ } : delete_cluster_request)

let make_delete_cluster_scheduler_config_request
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id) () =
  ({ cluster_scheduler_config_id = cluster_scheduler_config_id_ }
    : delete_cluster_scheduler_config_request)

let make_delete_code_repository_input ~code_repository_name:(code_repository_name_ : entity_name) ()
    =
  ({ code_repository_name = code_repository_name_ } : delete_code_repository_input)

let make_delete_compilation_job_request ~compilation_job_name:(compilation_job_name_ : entity_name)
    () =
  ({ compilation_job_name = compilation_job_name_ } : delete_compilation_job_request)

let make_delete_compute_quota_request ~compute_quota_id:(compute_quota_id_ : compute_quota_id) () =
  ({ compute_quota_id = compute_quota_id_ } : delete_compute_quota_request)

let make_delete_context_response ?context_arn:(context_arn_ : context_arn option) () =
  ({ context_arn = context_arn_ } : delete_context_response)

let make_delete_context_request ~context_name:(context_name_ : context_name) () =
  ({ context_name = context_name_ } : delete_context_request)

let make_delete_data_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : delete_data_quality_job_definition_request)

let make_delete_device_fleet_request ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ device_fleet_name = device_fleet_name_ } : delete_device_fleet_request)

let make_retention_policy ?home_efs_file_system:(home_efs_file_system_ : retention_type option) () =
  ({ home_efs_file_system = home_efs_file_system_ } : retention_policy)

let make_delete_domain_request ?retention_policy:(retention_policy_ : retention_policy option)
    ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_; retention_policy = retention_policy_ } : delete_domain_request)

let make_delete_edge_deployment_plan_request
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({ edge_deployment_plan_name = edge_deployment_plan_name_ } : delete_edge_deployment_plan_request)

let make_delete_edge_deployment_stage_request
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~stage_name:(stage_name_ : entity_name) () =
  ({ edge_deployment_plan_name = edge_deployment_plan_name_; stage_name = stage_name_ }
    : delete_edge_deployment_stage_request)

let make_delete_endpoint_input ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({ endpoint_name = endpoint_name_ } : delete_endpoint_input)

let make_delete_endpoint_config_input
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({ endpoint_config_name = endpoint_config_name_ } : delete_endpoint_config_input)

let make_delete_experiment_response ?experiment_arn:(experiment_arn_ : experiment_arn option) () =
  ({ experiment_arn = experiment_arn_ } : delete_experiment_response)

let make_delete_experiment_request ~experiment_name:(experiment_name_ : experiment_entity_name) () =
  ({ experiment_name = experiment_name_ } : delete_experiment_request)

let make_delete_feature_group_request ~feature_group_name:(feature_group_name_ : feature_group_name)
    () =
  ({ feature_group_name = feature_group_name_ } : delete_feature_group_request)

let make_delete_flow_definition_response () = (() : unit)

let make_delete_flow_definition_request
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name) () =
  ({ flow_definition_name = flow_definition_name_ } : delete_flow_definition_request)

let make_delete_hub_request ~hub_name:(hub_name_ : hub_name_or_arn) () =
  ({ hub_name = hub_name_ } : delete_hub_request)

let make_delete_hub_content_request ~hub_name:(hub_name_ : hub_name_or_arn)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_version:(hub_content_version_ : hub_content_version) () =
  ({
     hub_name = hub_name_;
     hub_content_type = hub_content_type_;
     hub_content_name = hub_content_name_;
     hub_content_version = hub_content_version_;
   }
    : delete_hub_content_request)

let make_delete_hub_content_reference_request ~hub_name:(hub_name_ : hub_name_or_arn)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name) () =
  ({
     hub_name = hub_name_;
     hub_content_type = hub_content_type_;
     hub_content_name = hub_content_name_;
   }
    : delete_hub_content_reference_request)

let make_delete_human_task_ui_response () = (() : unit)

let make_delete_human_task_ui_request ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name)
    () =
  ({ human_task_ui_name = human_task_ui_name_ } : delete_human_task_ui_request)

let make_delete_hyper_parameter_tuning_job_request
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : delete_hyper_parameter_tuning_job_request)

let make_delete_image_response () = (() : unit)

let make_delete_image_request ~image_name:(image_name_ : image_name) () =
  ({ image_name = image_name_ } : delete_image_request)

let make_delete_image_version_response () = (() : unit)

let make_delete_image_version_request ?version:(version_ : image_version_number option)
    ?alias:(alias_ : sage_maker_image_version_alias option) ~image_name:(image_name_ : image_name)
    () =
  ({ image_name = image_name_; version = version_; alias = alias_ } : delete_image_version_request)

let make_delete_inference_component_input
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({ inference_component_name = inference_component_name_ } : delete_inference_component_input)

let make_delete_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : delete_inference_experiment_response)

let make_delete_inference_experiment_request ~name:(name_ : inference_experiment_name) () =
  ({ name = name_ } : delete_inference_experiment_request)

let make_delete_job_response () = (() : unit)

let make_delete_job_request ~job_name:(job_name_ : job_name)
    ~job_category:(job_category_ : job_category) () =
  ({ job_name = job_name_; job_category = job_category_ } : delete_job_request)

let make_delete_mlflow_app_response ?arn:(arn_ : mlflow_app_arn option) () =
  ({ arn = arn_ } : delete_mlflow_app_response)

let make_delete_mlflow_app_request ~arn:(arn_ : mlflow_app_arn) () =
  ({ arn = arn_ } : delete_mlflow_app_request)

let make_delete_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : delete_mlflow_tracking_server_response)

let make_delete_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : delete_mlflow_tracking_server_request)

let make_delete_model_input ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : delete_model_input)

let make_delete_model_bias_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : delete_model_bias_job_definition_request)

let make_delete_model_card_request ~model_card_name:(model_card_name_ : entity_name) () =
  ({ model_card_name = model_card_name_ } : delete_model_card_request)

let make_delete_model_explainability_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ }
    : delete_model_explainability_job_definition_request)

let make_delete_model_package_input
    ~model_package_name:(model_package_name_ : versioned_arn_or_name) () =
  ({ model_package_name = model_package_name_ } : delete_model_package_input)

let make_delete_model_package_group_input
    ~model_package_group_name:(model_package_group_name_ : arn_or_name) () =
  ({ model_package_group_name = model_package_group_name_ } : delete_model_package_group_input)

let make_delete_model_package_group_policy_input
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({ model_package_group_name = model_package_group_name_ }
    : delete_model_package_group_policy_input)

let make_delete_model_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : delete_model_quality_job_definition_request)

let make_delete_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : delete_monitoring_schedule_request)

let make_delete_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : delete_notebook_instance_input)

let make_delete_notebook_instance_lifecycle_config_input
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({ notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_ }
    : delete_notebook_instance_lifecycle_config_input)

let make_delete_optimization_job_request
    ~optimization_job_name:(optimization_job_name_ : entity_name) () =
  ({ optimization_job_name = optimization_job_name_ } : delete_optimization_job_request)

let make_delete_partner_app_response ?arn:(arn_ : partner_app_arn option) () =
  ({ arn = arn_ } : delete_partner_app_response)

let make_delete_partner_app_request ?client_token:(client_token_ : client_token option)
    ~arn:(arn_ : partner_app_arn) () =
  ({ arn = arn_; client_token = client_token_ } : delete_partner_app_request)

let make_delete_pipeline_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option) () =
  ({ pipeline_arn = pipeline_arn_ } : delete_pipeline_response)

let make_delete_pipeline_request ~pipeline_name:(pipeline_name_ : pipeline_name)
    ~client_request_token:(client_request_token_ : idempotency_token) () =
  ({ pipeline_name = pipeline_name_; client_request_token = client_request_token_ }
    : delete_pipeline_request)

let make_delete_processing_job_request
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({ processing_job_name = processing_job_name_ } : delete_processing_job_request)

let make_delete_project_input ~project_name:(project_name_ : project_entity_name) () =
  ({ project_name = project_name_ } : delete_project_input)

let make_delete_space_request ~domain_id:(domain_id_ : domain_id)
    ~space_name:(space_name_ : space_name) () =
  ({ domain_id = domain_id_; space_name = space_name_ } : delete_space_request)

let make_delete_studio_lifecycle_config_request
    ~studio_lifecycle_config_name:(studio_lifecycle_config_name_ : studio_lifecycle_config_name) ()
    =
  ({ studio_lifecycle_config_name = studio_lifecycle_config_name_ }
    : delete_studio_lifecycle_config_request)

let make_delete_tags_output () = (() : unit)

let make_delete_tags_input ~resource_arn:(resource_arn_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : delete_tags_input)

let make_delete_training_job_request ~training_job_name:(training_job_name_ : training_job_name) ()
    =
  ({ training_job_name = training_job_name_ } : delete_training_job_request)

let make_delete_trial_response ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_arn = trial_arn_ } : delete_trial_response)

let make_delete_trial_request ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ trial_name = trial_name_ } : delete_trial_request)

let make_delete_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_component_arn = trial_component_arn_ } : delete_trial_component_response)

let make_delete_trial_component_request
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({ trial_component_name = trial_component_name_ } : delete_trial_component_request)

let make_delete_user_profile_request ~domain_id:(domain_id_ : domain_id)
    ~user_profile_name:(user_profile_name_ : user_profile_name) () =
  ({ domain_id = domain_id_; user_profile_name = user_profile_name_ } : delete_user_profile_request)

let make_delete_workforce_response () = (() : unit)

let make_delete_workforce_request ~workforce_name:(workforce_name_ : workforce_name) () =
  ({ workforce_name = workforce_name_ } : delete_workforce_request)

let make_delete_workteam_response ~success:(success_ : success) () =
  ({ success = success_ } : delete_workteam_response)

let make_delete_workteam_request ~workteam_name:(workteam_name_ : workteam_name) () =
  ({ workteam_name = workteam_name_ } : delete_workteam_request)

let make_deployed_image ?specified_image:(specified_image_ : container_image option)
    ?resolved_image:(resolved_image_ : container_image option)
    ?resolution_time:(resolution_time_ : timestamp option) () =
  ({
     specified_image = specified_image_;
     resolved_image = resolved_image_;
     resolution_time = resolution_time_;
   }
    : deployed_image)

let make_real_time_inference_recommendation ?environment:(environment_ : environment_map option)
    ~recommendation_id:(recommendation_id_ : string_)
    ~instance_type:(instance_type_ : production_variant_instance_type) () =
  ({
     recommendation_id = recommendation_id_;
     instance_type = instance_type_;
     environment = environment_;
   }
    : real_time_inference_recommendation)

let make_deployment_recommendation
    ?real_time_inference_recommendations:
      (real_time_inference_recommendations_ : real_time_inference_recommendations option)
    ~recommendation_status:(recommendation_status_ : recommendation_status) () =
  ({
     recommendation_status = recommendation_status_;
     real_time_inference_recommendations = real_time_inference_recommendations_;
   }
    : deployment_recommendation)

let make_edge_deployment_status
    ?edge_deployment_status_message:(edge_deployment_status_message_ : string_ option)
    ?edge_deployment_stage_start_time:(edge_deployment_stage_start_time_ : timestamp option)
    ~stage_status:(stage_status_ : stage_status)
    ~edge_deployment_success_in_stage:(edge_deployment_success_in_stage_ : integer)
    ~edge_deployment_pending_in_stage:(edge_deployment_pending_in_stage_ : integer)
    ~edge_deployment_failed_in_stage:(edge_deployment_failed_in_stage_ : integer) () =
  ({
     stage_status = stage_status_;
     edge_deployment_success_in_stage = edge_deployment_success_in_stage_;
     edge_deployment_pending_in_stage = edge_deployment_pending_in_stage_;
     edge_deployment_failed_in_stage = edge_deployment_failed_in_stage_;
     edge_deployment_status_message = edge_deployment_status_message_;
     edge_deployment_stage_start_time = edge_deployment_stage_start_time_;
   }
    : edge_deployment_status)

let make_deployment_stage_status_summary ~stage_name:(stage_name_ : entity_name)
    ~device_selection_config:(device_selection_config_ : device_selection_config)
    ~deployment_config:(deployment_config_ : edge_deployment_config)
    ~deployment_status:(deployment_status_ : edge_deployment_status) () =
  ({
     stage_name = stage_name_;
     device_selection_config = device_selection_config_;
     deployment_config = deployment_config_;
     deployment_status = deployment_status_;
   }
    : deployment_stage_status_summary)

let make_deregister_devices_request ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~device_names:(device_names_ : device_names) () =
  ({ device_fleet_name = device_fleet_name_; device_names = device_names_ }
    : deregister_devices_request)

let make_derived_information
    ?derived_data_input_config:(derived_data_input_config_ : data_input_config option) () =
  ({ derived_data_input_config = derived_data_input_config_ } : derived_information)

let make_describe_ai_benchmark_job_response
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?network_config:(network_config_ : ai_benchmark_network_config option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?tags:(tags_ : tag_list option) ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name)
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn)
    ~ai_benchmark_job_status:(ai_benchmark_job_status_ : ai_benchmark_job_status)
    ~benchmark_target:(benchmark_target_ : ai_benchmark_target)
    ~output_config:(output_config_ : ai_benchmark_output_result)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~role_arn:(role_arn_ : role_arn) ~creation_time:(creation_time_ : timestamp) () =
  ({
     ai_benchmark_job_name = ai_benchmark_job_name_;
     ai_benchmark_job_arn = ai_benchmark_job_arn_;
     ai_benchmark_job_status = ai_benchmark_job_status_;
     failure_reason = failure_reason_;
     benchmark_target = benchmark_target_;
     output_config = output_config_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     role_arn = role_arn_;
     network_config = network_config_;
     creation_time = creation_time_;
     start_time = start_time_;
     end_time = end_time_;
     tags = tags_;
   }
    : describe_ai_benchmark_job_response)

let make_describe_ai_benchmark_job_request
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({ ai_benchmark_job_name = ai_benchmark_job_name_ } : describe_ai_benchmark_job_request)

let make_describe_ai_recommendation_job_response
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?inference_specification:
      (inference_specification_ : ai_recommendation_inference_specification option)
    ?optimize_model:(optimize_model_ : ai_recommendation_allow_optimization option)
    ?performance_target:(performance_target_ : ai_recommendation_performance_target option)
    ?recommendations:(recommendations_ : ai_recommendation_list option)
    ?compute_spec:(compute_spec_ : ai_recommendation_compute_spec option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?tags:(tags_ : tag_list option)
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name)
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn)
    ~ai_recommendation_job_status:(ai_recommendation_job_status_ : ai_recommendation_job_status)
    ~model_source:(model_source_ : ai_model_source)
    ~output_config:(output_config_ : ai_recommendation_output_result)
    ~ai_workload_config_identifier:(ai_workload_config_identifier_ : ai_resource_identifier)
    ~role_arn:(role_arn_ : role_arn) ~creation_time:(creation_time_ : timestamp) () =
  ({
     ai_recommendation_job_name = ai_recommendation_job_name_;
     ai_recommendation_job_arn = ai_recommendation_job_arn_;
     ai_recommendation_job_status = ai_recommendation_job_status_;
     failure_reason = failure_reason_;
     model_source = model_source_;
     output_config = output_config_;
     inference_specification = inference_specification_;
     ai_workload_config_identifier = ai_workload_config_identifier_;
     optimize_model = optimize_model_;
     performance_target = performance_target_;
     recommendations = recommendations_;
     role_arn = role_arn_;
     compute_spec = compute_spec_;
     creation_time = creation_time_;
     start_time = start_time_;
     end_time = end_time_;
     tags = tags_;
   }
    : describe_ai_recommendation_job_response)

let make_describe_ai_recommendation_job_request
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({ ai_recommendation_job_name = ai_recommendation_job_name_ }
    : describe_ai_recommendation_job_request)

let make_describe_ai_workload_config_response
    ?dataset_config:(dataset_config_ : ai_dataset_config option)
    ?ai_workload_configs:(ai_workload_configs_ : ai_workload_configs option)
    ?tags:(tags_ : tag_list option)
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name)
    ~ai_workload_config_arn:(ai_workload_config_arn_ : ai_workload_config_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     ai_workload_config_name = ai_workload_config_name_;
     ai_workload_config_arn = ai_workload_config_arn_;
     dataset_config = dataset_config_;
     ai_workload_configs = ai_workload_configs_;
     tags = tags_;
     creation_time = creation_time_;
   }
    : describe_ai_workload_config_response)

let make_describe_ai_workload_config_request
    ~ai_workload_config_name:(ai_workload_config_name_ : ai_entity_name) () =
  ({ ai_workload_config_name = ai_workload_config_name_ } : describe_ai_workload_config_request)

let make_describe_action_response ?action_name:(action_name_ : experiment_entity_name_or_arn option)
    ?action_arn:(action_arn_ : action_arn option) ?source:(source_ : action_source option)
    ?action_type:(action_type_ : string256 option)
    ?description:(description_ : experiment_description option)
    ?status:(status_ : action_status option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option) () =
  ({
     action_name = action_name_;
     action_arn = action_arn_;
     source = source_;
     action_type = action_type_;
     description = description_;
     status = status_;
     properties = properties_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     metadata_properties = metadata_properties_;
     lineage_group_arn = lineage_group_arn_;
   }
    : describe_action_response)

let make_describe_action_request ~action_name:(action_name_ : experiment_entity_name_or_arn) () =
  ({ action_name = action_name_ } : describe_action_request)

let make_describe_algorithm_output
    ?algorithm_description:(algorithm_description_ : entity_description option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?validation_specification:
      (validation_specification_ : algorithm_validation_specification option)
    ?product_id:(product_id_ : product_id option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ~algorithm_name:(algorithm_name_ : entity_name) ~algorithm_arn:(algorithm_arn_ : algorithm_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~training_specification:(training_specification_ : training_specification)
    ~algorithm_status:(algorithm_status_ : algorithm_status)
    ~algorithm_status_details:(algorithm_status_details_ : algorithm_status_details) () =
  ({
     algorithm_name = algorithm_name_;
     algorithm_arn = algorithm_arn_;
     algorithm_description = algorithm_description_;
     creation_time = creation_time_;
     training_specification = training_specification_;
     inference_specification = inference_specification_;
     validation_specification = validation_specification_;
     algorithm_status = algorithm_status_;
     algorithm_status_details = algorithm_status_details_;
     product_id = product_id_;
     certify_for_marketplace = certify_for_marketplace_;
   }
    : describe_algorithm_output)

let make_describe_algorithm_input ~algorithm_name:(algorithm_name_ : arn_or_name) () =
  ({ algorithm_name = algorithm_name_ } : describe_algorithm_input)

let make_describe_app_response ?app_arn:(app_arn_ : app_arn option)
    ?app_type:(app_type_ : app_type option) ?app_name:(app_name_ : app_name option)
    ?domain_id:(domain_id_ : domain_id option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?space_name:(space_name_ : space_name option) ?status:(status_ : app_status option)
    ?effective_trusted_identity_propagation_status:
      (effective_trusted_identity_propagation_status_ : feature_status option)
    ?recovery_mode:(recovery_mode_ : boolean_ option)
    ?last_health_check_timestamp:(last_health_check_timestamp_ : timestamp option)
    ?last_user_activity_timestamp:(last_user_activity_timestamp_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?resource_spec:(resource_spec_ : resource_spec option)
    ?built_in_lifecycle_config_arn:
      (built_in_lifecycle_config_arn_ : studio_lifecycle_config_arn option) () =
  ({
     app_arn = app_arn_;
     app_type = app_type_;
     app_name = app_name_;
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     space_name = space_name_;
     status = status_;
     effective_trusted_identity_propagation_status = effective_trusted_identity_propagation_status_;
     recovery_mode = recovery_mode_;
     last_health_check_timestamp = last_health_check_timestamp_;
     last_user_activity_timestamp = last_user_activity_timestamp_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     resource_spec = resource_spec_;
     built_in_lifecycle_config_arn = built_in_lifecycle_config_arn_;
   }
    : describe_app_response)

let make_describe_app_request ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?space_name:(space_name_ : space_name option) ~domain_id:(domain_id_ : domain_id)
    ~app_type:(app_type_ : app_type) ~app_name:(app_name_ : app_name) () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     space_name = space_name_;
     app_type = app_type_;
     app_name = app_name_;
   }
    : describe_app_request)

let make_describe_app_image_config_response
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option)
    ?app_image_config_name:(app_image_config_name_ : app_image_config_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option) () =
  ({
     app_image_config_arn = app_image_config_arn_;
     app_image_config_name = app_image_config_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     code_editor_app_image_config = code_editor_app_image_config_;
   }
    : describe_app_image_config_response)

let make_describe_app_image_config_request
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({ app_image_config_name = app_image_config_name_ } : describe_app_image_config_request)

let make_describe_artifact_response
    ?artifact_name:(artifact_name_ : experiment_entity_name_or_arn option)
    ?artifact_arn:(artifact_arn_ : artifact_arn option) ?source:(source_ : artifact_source option)
    ?artifact_type:(artifact_type_ : string256 option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option) () =
  ({
     artifact_name = artifact_name_;
     artifact_arn = artifact_arn_;
     source = source_;
     artifact_type = artifact_type_;
     properties = properties_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     metadata_properties = metadata_properties_;
     lineage_group_arn = lineage_group_arn_;
   }
    : describe_artifact_response)

let make_describe_artifact_request ~artifact_arn:(artifact_arn_ : artifact_arn) () =
  ({ artifact_arn = artifact_arn_ } : describe_artifact_request)

let make_resolved_attributes
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?problem_type:(problem_type_ : problem_type option)
    ?completion_criteria:(completion_criteria_ : auto_ml_job_completion_criteria option) () =
  ({
     auto_ml_job_objective = auto_ml_job_objective_;
     problem_type = problem_type_;
     completion_criteria = completion_criteria_;
   }
    : resolved_attributes)

let make_describe_auto_ml_job_response
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?problem_type:(problem_type_ : problem_type option)
    ?auto_ml_job_config:(auto_ml_job_config_ : auto_ml_job_config option)
    ?end_time:(end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?partial_failure_reasons:(partial_failure_reasons_ : auto_ml_partial_failure_reasons option)
    ?best_candidate:(best_candidate_ : auto_ml_candidate option)
    ?generate_candidate_definitions_only:
      (generate_candidate_definitions_only_ : generate_candidate_definitions_only option)
    ?auto_ml_job_artifacts:(auto_ml_job_artifacts_ : auto_ml_job_artifacts option)
    ?resolved_attributes:(resolved_attributes_ : resolved_attributes option)
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ?model_deploy_result:(model_deploy_result_ : model_deploy_result option)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name)
    ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn)
    ~input_data_config:(input_data_config_ : auto_ml_input_data_config)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~role_arn:(role_arn_ : role_arn) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~auto_ml_job_status:(auto_ml_job_status_ : auto_ml_job_status)
    ~auto_ml_job_secondary_status:(auto_ml_job_secondary_status_ : auto_ml_job_secondary_status) ()
    =
  ({
     auto_ml_job_name = auto_ml_job_name_;
     auto_ml_job_arn = auto_ml_job_arn_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     role_arn = role_arn_;
     auto_ml_job_objective = auto_ml_job_objective_;
     problem_type = problem_type_;
     auto_ml_job_config = auto_ml_job_config_;
     creation_time = creation_time_;
     end_time = end_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     partial_failure_reasons = partial_failure_reasons_;
     best_candidate = best_candidate_;
     auto_ml_job_status = auto_ml_job_status_;
     auto_ml_job_secondary_status = auto_ml_job_secondary_status_;
     generate_candidate_definitions_only = generate_candidate_definitions_only_;
     auto_ml_job_artifacts = auto_ml_job_artifacts_;
     resolved_attributes = resolved_attributes_;
     model_deploy_config = model_deploy_config_;
     model_deploy_result = model_deploy_result_;
   }
    : describe_auto_ml_job_response)

let make_describe_auto_ml_job_request ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({ auto_ml_job_name = auto_ml_job_name_ } : describe_auto_ml_job_request)

let make_describe_auto_ml_job_v2_response
    ?auto_ml_job_objective:(auto_ml_job_objective_ : auto_ml_job_objective option)
    ?auto_ml_problem_type_config:(auto_ml_problem_type_config_ : auto_ml_problem_type_config option)
    ?auto_ml_problem_type_config_name:
      (auto_ml_problem_type_config_name_ : auto_ml_problem_type_config_name option)
    ?end_time:(end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : auto_ml_failure_reason option)
    ?partial_failure_reasons:(partial_failure_reasons_ : auto_ml_partial_failure_reasons option)
    ?best_candidate:(best_candidate_ : auto_ml_candidate option)
    ?auto_ml_job_artifacts:(auto_ml_job_artifacts_ : auto_ml_job_artifacts option)
    ?resolved_attributes:(resolved_attributes_ : auto_ml_resolved_attributes option)
    ?model_deploy_config:(model_deploy_config_ : model_deploy_config option)
    ?model_deploy_result:(model_deploy_result_ : model_deploy_result option)
    ?data_split_config:(data_split_config_ : auto_ml_data_split_config option)
    ?security_config:(security_config_ : auto_ml_security_config option)
    ?auto_ml_compute_config:(auto_ml_compute_config_ : auto_ml_compute_config option)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name)
    ~auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn)
    ~auto_ml_job_input_data_config:(auto_ml_job_input_data_config_ : auto_ml_job_input_data_config)
    ~output_data_config:(output_data_config_ : auto_ml_output_data_config)
    ~role_arn:(role_arn_ : role_arn) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~auto_ml_job_status:(auto_ml_job_status_ : auto_ml_job_status)
    ~auto_ml_job_secondary_status:(auto_ml_job_secondary_status_ : auto_ml_job_secondary_status) ()
    =
  ({
     auto_ml_job_name = auto_ml_job_name_;
     auto_ml_job_arn = auto_ml_job_arn_;
     auto_ml_job_input_data_config = auto_ml_job_input_data_config_;
     output_data_config = output_data_config_;
     role_arn = role_arn_;
     auto_ml_job_objective = auto_ml_job_objective_;
     auto_ml_problem_type_config = auto_ml_problem_type_config_;
     auto_ml_problem_type_config_name = auto_ml_problem_type_config_name_;
     creation_time = creation_time_;
     end_time = end_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     partial_failure_reasons = partial_failure_reasons_;
     best_candidate = best_candidate_;
     auto_ml_job_status = auto_ml_job_status_;
     auto_ml_job_secondary_status = auto_ml_job_secondary_status_;
     auto_ml_job_artifacts = auto_ml_job_artifacts_;
     resolved_attributes = resolved_attributes_;
     model_deploy_config = model_deploy_config_;
     model_deploy_result = model_deploy_result_;
     data_split_config = data_split_config_;
     security_config = security_config_;
     auto_ml_compute_config = auto_ml_compute_config_;
   }
    : describe_auto_ml_job_v2_response)

let make_describe_auto_ml_job_v2_request ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) ()
    =
  ({ auto_ml_job_name = auto_ml_job_name_ } : describe_auto_ml_job_v2_request)

let make_describe_cluster_response ?cluster_name:(cluster_name_ : cluster_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?failure_message:(failure_message_ : string_ option)
    ?restricted_instance_groups:
      (restricted_instance_groups_ : cluster_restricted_instance_group_details_list option)
    ?restricted_instance_groups_config:
      (restricted_instance_groups_config_ : cluster_restricted_instance_groups_config_output option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?orchestrator:(orchestrator_ : cluster_orchestrator option)
    ?tiered_storage_config:(tiered_storage_config_ : cluster_tiered_storage_config option)
    ?node_recovery:(node_recovery_ : cluster_node_recovery option)
    ?node_provisioning_mode:(node_provisioning_mode_ : cluster_node_provisioning_mode option)
    ?cluster_role:(cluster_role_ : role_arn option)
    ?auto_scaling:(auto_scaling_ : cluster_auto_scaling_config_output option)
    ~cluster_arn:(cluster_arn_ : cluster_arn) ~cluster_status:(cluster_status_ : cluster_status)
    ~instance_groups:(instance_groups_ : cluster_instance_group_details_list) () =
  ({
     cluster_arn = cluster_arn_;
     cluster_name = cluster_name_;
     cluster_status = cluster_status_;
     creation_time = creation_time_;
     failure_message = failure_message_;
     instance_groups = instance_groups_;
     restricted_instance_groups = restricted_instance_groups_;
     restricted_instance_groups_config = restricted_instance_groups_config_;
     vpc_config = vpc_config_;
     orchestrator = orchestrator_;
     tiered_storage_config = tiered_storage_config_;
     node_recovery = node_recovery_;
     node_provisioning_mode = node_provisioning_mode_;
     cluster_role = cluster_role_;
     auto_scaling = auto_scaling_;
   }
    : describe_cluster_response)

let make_describe_cluster_request ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_ } : describe_cluster_request)

let make_describe_cluster_event_response
    ?event_details:(event_details_ : cluster_event_detail option) () =
  ({ event_details = event_details_ } : describe_cluster_event_response)

let make_describe_cluster_event_request ~event_id:(event_id_ : event_id)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ event_id = event_id_; cluster_name = cluster_name_ } : describe_cluster_event_request)

let make_describe_cluster_node_response ~node_details:(node_details_ : cluster_node_details) () =
  ({ node_details = node_details_ } : describe_cluster_node_response)

let make_describe_cluster_node_request ?node_id:(node_id_ : cluster_node_id option)
    ?node_logical_id:(node_logical_id_ : cluster_node_logical_id option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({ cluster_name = cluster_name_; node_id = node_id_; node_logical_id = node_logical_id_ }
    : describe_cluster_node_request)

let make_describe_cluster_scheduler_config_response
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?status_details:(status_details_ : status_details_map option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?scheduler_config:(scheduler_config_ : scheduler_config option)
    ?description:(description_ : entity_description option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id)
    ~name:(name_ : entity_name)
    ~cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer)
    ~status:(status_ : scheduler_resource_status) ~creation_time:(creation_time_ : timestamp) () =
  ({
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
     name = name_;
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
     status = status_;
     failure_reason = failure_reason_;
     status_details = status_details_;
     cluster_arn = cluster_arn_;
     scheduler_config = scheduler_config_;
     description = description_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
   }
    : describe_cluster_scheduler_config_response)

let make_describe_cluster_scheduler_config_request
    ?cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer option)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id) () =
  ({
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
   }
    : describe_cluster_scheduler_config_request)

let make_describe_code_repository_output ?git_config:(git_config_ : git_config option)
    ~code_repository_name:(code_repository_name_ : entity_name)
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~last_modified_time:(last_modified_time_ : last_modified_time) () =
  ({
     code_repository_name = code_repository_name_;
     code_repository_arn = code_repository_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     git_config = git_config_;
   }
    : describe_code_repository_output)

let make_describe_code_repository_input ~code_repository_name:(code_repository_name_ : entity_name)
    () =
  ({ code_repository_name = code_repository_name_ } : describe_code_repository_input)

let make_model_digests ?artifact_digest:(artifact_digest_ : artifact_digest option) () =
  ({ artifact_digest = artifact_digest_ } : model_digests)

let make_model_artifacts ~s3_model_artifacts:(s3_model_artifacts_ : s3_uri) () =
  ({ s3_model_artifacts = s3_model_artifacts_ } : model_artifacts)

let make_describe_compilation_job_response
    ?compilation_start_time:(compilation_start_time_ : timestamp option)
    ?compilation_end_time:(compilation_end_time_ : timestamp option)
    ?inference_image:(inference_image_ : inference_image option)
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option)
    ?model_digests:(model_digests_ : model_digests option)
    ?vpc_config:(vpc_config_ : neo_vpc_config option)
    ?derived_information:(derived_information_ : derived_information option)
    ~compilation_job_name:(compilation_job_name_ : entity_name)
    ~compilation_job_arn:(compilation_job_arn_ : compilation_job_arn)
    ~compilation_job_status:(compilation_job_status_ : compilation_job_status)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~creation_time:(creation_time_ : creation_time)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~failure_reason:(failure_reason_ : failure_reason)
    ~model_artifacts:(model_artifacts_ : model_artifacts) ~role_arn:(role_arn_ : role_arn)
    ~input_config:(input_config_ : input_config) ~output_config:(output_config_ : output_config) ()
    =
  ({
     compilation_job_name = compilation_job_name_;
     compilation_job_arn = compilation_job_arn_;
     compilation_job_status = compilation_job_status_;
     compilation_start_time = compilation_start_time_;
     compilation_end_time = compilation_end_time_;
     stopping_condition = stopping_condition_;
     inference_image = inference_image_;
     model_package_version_arn = model_package_version_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     model_artifacts = model_artifacts_;
     model_digests = model_digests_;
     role_arn = role_arn_;
     input_config = input_config_;
     output_config = output_config_;
     vpc_config = vpc_config_;
     derived_information = derived_information_;
   }
    : describe_compilation_job_response)

let make_describe_compilation_job_request
    ~compilation_job_name:(compilation_job_name_ : entity_name) () =
  ({ compilation_job_name = compilation_job_name_ } : describe_compilation_job_request)

let make_describe_compute_quota_response ?description:(description_ : entity_description option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?compute_quota_config:(compute_quota_config_ : compute_quota_config option)
    ?activation_state:(activation_state_ : activation_state option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id) ~name:(name_ : entity_name)
    ~compute_quota_version:(compute_quota_version_ : integer)
    ~status:(status_ : scheduler_resource_status)
    ~compute_quota_target:(compute_quota_target_ : compute_quota_target)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     compute_quota_arn = compute_quota_arn_;
     compute_quota_id = compute_quota_id_;
     name = name_;
     description = description_;
     compute_quota_version = compute_quota_version_;
     status = status_;
     failure_reason = failure_reason_;
     cluster_arn = cluster_arn_;
     compute_quota_config = compute_quota_config_;
     compute_quota_target = compute_quota_target_;
     activation_state = activation_state_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
   }
    : describe_compute_quota_response)

let make_describe_compute_quota_request
    ?compute_quota_version:(compute_quota_version_ : integer option)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id) () =
  ({ compute_quota_id = compute_quota_id_; compute_quota_version = compute_quota_version_ }
    : describe_compute_quota_request)

let make_describe_context_response ?context_name:(context_name_ : context_name option)
    ?context_arn:(context_arn_ : context_arn option) ?source:(source_ : context_source option)
    ?context_type:(context_type_ : string256 option)
    ?description:(description_ : experiment_description option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option) () =
  ({
     context_name = context_name_;
     context_arn = context_arn_;
     source = source_;
     context_type = context_type_;
     description = description_;
     properties = properties_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     lineage_group_arn = lineage_group_arn_;
   }
    : describe_context_response)

let make_describe_context_request ~context_name:(context_name_ : context_name_or_arn) () =
  ({ context_name = context_name_ } : describe_context_request)

let make_describe_data_quality_job_definition_response
    ?data_quality_baseline_config:
      (data_quality_baseline_config_ : data_quality_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~creation_time:(creation_time_ : timestamp)
    ~data_quality_app_specification:
      (data_quality_app_specification_ : data_quality_app_specification)
    ~data_quality_job_input:(data_quality_job_input_ : data_quality_job_input)
    ~data_quality_job_output_config:(data_quality_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_arn = job_definition_arn_;
     job_definition_name = job_definition_name_;
     creation_time = creation_time_;
     data_quality_baseline_config = data_quality_baseline_config_;
     data_quality_app_specification = data_quality_app_specification_;
     data_quality_job_input = data_quality_job_input_;
     data_quality_job_output_config = data_quality_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
   }
    : describe_data_quality_job_definition_response)

let make_describe_data_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : describe_data_quality_job_definition_request)

let make_edge_model ?latest_sample_time:(latest_sample_time_ : timestamp option)
    ?latest_inference:(latest_inference_ : timestamp option) ~model_name:(model_name_ : entity_name)
    ~model_version:(model_version_ : edge_version) () =
  ({
     model_name = model_name_;
     model_version = model_version_;
     latest_sample_time = latest_sample_time_;
     latest_inference = latest_inference_;
   }
    : edge_model)

let make_describe_device_response ?device_arn:(device_arn_ : device_arn option)
    ?description:(description_ : device_description option)
    ?iot_thing_name:(iot_thing_name_ : thing_name option)
    ?latest_heartbeat:(latest_heartbeat_ : timestamp option) ?models:(models_ : edge_models option)
    ?max_models:(max_models_ : integer option) ?next_token:(next_token_ : next_token option)
    ?agent_version:(agent_version_ : edge_version option) ~device_name:(device_name_ : entity_name)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~registration_time:(registration_time_ : timestamp) () =
  ({
     device_arn = device_arn_;
     device_name = device_name_;
     description = description_;
     device_fleet_name = device_fleet_name_;
     iot_thing_name = iot_thing_name_;
     registration_time = registration_time_;
     latest_heartbeat = latest_heartbeat_;
     models = models_;
     max_models = max_models_;
     next_token = next_token_;
     agent_version = agent_version_;
   }
    : describe_device_response)

let make_describe_device_request ?next_token:(next_token_ : next_token option)
    ~device_name:(device_name_ : entity_name) ~device_fleet_name:(device_fleet_name_ : entity_name)
    () =
  ({ next_token = next_token_; device_name = device_name_; device_fleet_name = device_fleet_name_ }
    : describe_device_request)

let make_describe_device_fleet_response
    ?description:(description_ : device_fleet_description option)
    ?role_arn:(role_arn_ : role_arn option)
    ?iot_role_alias:(iot_role_alias_ : iot_role_alias option)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~device_fleet_arn:(device_fleet_arn_ : device_fleet_arn)
    ~output_config:(output_config_ : edge_output_config) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     device_fleet_name = device_fleet_name_;
     device_fleet_arn = device_fleet_arn_;
     output_config = output_config_;
     description = description_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     role_arn = role_arn_;
     iot_role_alias = iot_role_alias_;
   }
    : describe_device_fleet_response)

let make_describe_device_fleet_request ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ device_fleet_name = device_fleet_name_ } : describe_device_fleet_request)

let make_describe_domain_response ?domain_arn:(domain_arn_ : domain_arn option)
    ?domain_id:(domain_id_ : domain_id option) ?domain_name:(domain_name_ : domain_name option)
    ?home_efs_file_system_id:(home_efs_file_system_id_ : resource_id option)
    ?single_sign_on_managed_application_instance_id:
      (single_sign_on_managed_application_instance_id_ : string256 option)
    ?single_sign_on_application_arn:
      (single_sign_on_application_arn_ : single_sign_on_application_arn option)
    ?status:(status_ : domain_status option) ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?security_group_id_for_domain_boundary:
      (security_group_id_for_domain_boundary_ : security_group_id option)
    ?auth_mode:(auth_mode_ : auth_mode option)
    ?default_user_settings:(default_user_settings_ : user_settings option)
    ?domain_settings:(domain_settings_ : domain_settings option)
    ?app_network_access_type:(app_network_access_type_ : app_network_access_type option)
    ?home_efs_file_system_kms_key_id:(home_efs_file_system_kms_key_id_ : kms_key_id option)
    ?subnet_ids:(subnet_ids_ : subnets option) ?url:(url_ : string1024 option)
    ?vpc_id:(vpc_id_ : vpc_id option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?app_security_group_management:
      (app_security_group_management_ : app_security_group_management option)
    ?home_efs_file_system_creation:
      (home_efs_file_system_creation_ : home_efs_file_system_creation option)
    ?tag_propagation:(tag_propagation_ : tag_propagation option)
    ?default_space_settings:(default_space_settings_ : default_space_settings option) () =
  ({
     domain_arn = domain_arn_;
     domain_id = domain_id_;
     domain_name = domain_name_;
     home_efs_file_system_id = home_efs_file_system_id_;
     single_sign_on_managed_application_instance_id =
       single_sign_on_managed_application_instance_id_;
     single_sign_on_application_arn = single_sign_on_application_arn_;
     status = status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     security_group_id_for_domain_boundary = security_group_id_for_domain_boundary_;
     auth_mode = auth_mode_;
     default_user_settings = default_user_settings_;
     domain_settings = domain_settings_;
     app_network_access_type = app_network_access_type_;
     home_efs_file_system_kms_key_id = home_efs_file_system_kms_key_id_;
     subnet_ids = subnet_ids_;
     url = url_;
     vpc_id = vpc_id_;
     kms_key_id = kms_key_id_;
     app_security_group_management = app_security_group_management_;
     home_efs_file_system_creation = home_efs_file_system_creation_;
     tag_propagation = tag_propagation_;
     default_space_settings = default_space_settings_;
   }
    : describe_domain_response)

let make_describe_domain_request ~domain_id:(domain_id_ : domain_id) () =
  ({ domain_id = domain_id_ } : describe_domain_request)

let make_describe_edge_deployment_plan_response
    ?edge_deployment_success:(edge_deployment_success_ : integer option)
    ?edge_deployment_pending:(edge_deployment_pending_ : integer option)
    ?edge_deployment_failed:(edge_deployment_failed_ : integer option)
    ?next_token:(next_token_ : next_token option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~model_configs:(model_configs_ : edge_deployment_model_configs)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~stages:(stages_ : deployment_stage_status_summaries) () =
  ({
     edge_deployment_plan_arn = edge_deployment_plan_arn_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     model_configs = model_configs_;
     device_fleet_name = device_fleet_name_;
     edge_deployment_success = edge_deployment_success_;
     edge_deployment_pending = edge_deployment_pending_;
     edge_deployment_failed = edge_deployment_failed_;
     stages = stages_;
     next_token = next_token_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : describe_edge_deployment_plan_response)

let make_describe_edge_deployment_plan_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : deployment_stage_max_results option)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name) () =
  ({
     edge_deployment_plan_name = edge_deployment_plan_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_edge_deployment_plan_request)

let make_edge_preset_deployment_output
    ?artifact:(artifact_ : edge_preset_deployment_artifact option)
    ?status:(status_ : edge_preset_deployment_status option)
    ?status_message:(status_message_ : string_ option) ~type_:(type__ : edge_preset_deployment_type)
    () =
  ({ type_ = type__; artifact = artifact_; status = status_; status_message = status_message_ }
    : edge_preset_deployment_output)

let make_describe_edge_packaging_job_response
    ?compilation_job_name:(compilation_job_name_ : entity_name option)
    ?model_name:(model_name_ : entity_name option)
    ?model_version:(model_version_ : edge_version option) ?role_arn:(role_arn_ : role_arn option)
    ?output_config:(output_config_ : edge_output_config option)
    ?resource_key:(resource_key_ : kms_key_id option)
    ?edge_packaging_job_status_message:(edge_packaging_job_status_message_ : string_ option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?model_artifact:(model_artifact_ : s3_uri option)
    ?model_signature:(model_signature_ : string_ option)
    ?preset_deployment_output:(preset_deployment_output_ : edge_preset_deployment_output option)
    ~edge_packaging_job_arn:(edge_packaging_job_arn_ : edge_packaging_job_arn)
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name)
    ~edge_packaging_job_status:(edge_packaging_job_status_ : edge_packaging_job_status) () =
  ({
     edge_packaging_job_arn = edge_packaging_job_arn_;
     edge_packaging_job_name = edge_packaging_job_name_;
     compilation_job_name = compilation_job_name_;
     model_name = model_name_;
     model_version = model_version_;
     role_arn = role_arn_;
     output_config = output_config_;
     resource_key = resource_key_;
     edge_packaging_job_status = edge_packaging_job_status_;
     edge_packaging_job_status_message = edge_packaging_job_status_message_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     model_artifact = model_artifact_;
     model_signature = model_signature_;
     preset_deployment_output = preset_deployment_output_;
   }
    : describe_edge_packaging_job_response)

let make_describe_edge_packaging_job_request
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name) () =
  ({ edge_packaging_job_name = edge_packaging_job_name_ } : describe_edge_packaging_job_request)

let make_ec2_capacity_reservation
    ?ec2_capacity_reservation_id:(ec2_capacity_reservation_id_ : ec2_capacity_reservation_id option)
    ?total_instance_count:(total_instance_count_ : task_count option)
    ?available_instance_count:(available_instance_count_ : task_count option)
    ?used_by_current_endpoint:(used_by_current_endpoint_ : task_count option) () =
  ({
     ec2_capacity_reservation_id = ec2_capacity_reservation_id_;
     total_instance_count = total_instance_count_;
     available_instance_count = available_instance_count_;
     used_by_current_endpoint = used_by_current_endpoint_;
   }
    : ec2_capacity_reservation)

let make_production_variant_capacity_reservation_summary
    ?ml_reservation_arn:(ml_reservation_arn_ : ml_reservation_arn option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : capacity_reservation_preference option)
    ?total_instance_count:(total_instance_count_ : task_count option)
    ?available_instance_count:(available_instance_count_ : task_count option)
    ?used_by_current_endpoint:(used_by_current_endpoint_ : task_count option)
    ?ec2_capacity_reservations:(ec2_capacity_reservations_ : ec2_capacity_reservations_list option)
    () =
  ({
     ml_reservation_arn = ml_reservation_arn_;
     capacity_reservation_preference = capacity_reservation_preference_;
     total_instance_count = total_instance_count_;
     available_instance_count = available_instance_count_;
     used_by_current_endpoint = used_by_current_endpoint_;
     ec2_capacity_reservations = ec2_capacity_reservations_;
   }
    : production_variant_capacity_reservation_summary)

let make_production_variant_status ?status_message:(status_message_ : variant_status_message option)
    ?start_time:(start_time_ : timestamp option) ~status:(status_ : variant_status) () =
  ({ status = status_; status_message = status_message_; start_time = start_time_ }
    : production_variant_status)

let make_instance_pool_summary ~instance_type:(instance_type_ : production_variant_instance_type)
    ~current_instance_count:(current_instance_count_ : task_count) () =
  ({ instance_type = instance_type_; current_instance_count = current_instance_count_ }
    : instance_pool_summary)

let make_production_variant_summary ?deployed_images:(deployed_images_ : deployed_images option)
    ?current_weight:(current_weight_ : variant_weight option)
    ?desired_weight:(desired_weight_ : variant_weight option)
    ?current_instance_count:(current_instance_count_ : task_count option)
    ?desired_instance_count:(desired_instance_count_ : task_count option)
    ?instance_pools:(instance_pools_ : instance_pool_summary_list option)
    ?variant_status:(variant_status_ : production_variant_status_list option)
    ?current_serverless_config:
      (current_serverless_config_ : production_variant_serverless_config option)
    ?desired_serverless_config:
      (desired_serverless_config_ : production_variant_serverless_config option)
    ?managed_instance_scaling:
      (managed_instance_scaling_ : production_variant_managed_instance_scaling option)
    ?routing_config:(routing_config_ : production_variant_routing_config option)
    ?capacity_reservation_config:
      (capacity_reservation_config_ : production_variant_capacity_reservation_summary option)
    ~variant_name:(variant_name_ : variant_name) () =
  ({
     variant_name = variant_name_;
     deployed_images = deployed_images_;
     current_weight = current_weight_;
     desired_weight = desired_weight_;
     current_instance_count = current_instance_count_;
     desired_instance_count = desired_instance_count_;
     instance_pools = instance_pools_;
     variant_status = variant_status_;
     current_serverless_config = current_serverless_config_;
     desired_serverless_config = desired_serverless_config_;
     managed_instance_scaling = managed_instance_scaling_;
     routing_config = routing_config_;
     capacity_reservation_config = capacity_reservation_config_;
   }
    : production_variant_summary)

let make_pending_production_variant_summary
    ?deployed_images:(deployed_images_ : deployed_images option)
    ?current_weight:(current_weight_ : variant_weight option)
    ?desired_weight:(desired_weight_ : variant_weight option)
    ?current_instance_count:(current_instance_count_ : task_count option)
    ?desired_instance_count:(desired_instance_count_ : task_count option)
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?instance_pools:(instance_pools_ : instance_pool_summary_list option)
    ?accelerator_type:(accelerator_type_ : production_variant_accelerator_type option)
    ?variant_status:(variant_status_ : production_variant_status_list option)
    ?current_serverless_config:
      (current_serverless_config_ : production_variant_serverless_config option)
    ?desired_serverless_config:
      (desired_serverless_config_ : production_variant_serverless_config option)
    ?managed_instance_scaling:
      (managed_instance_scaling_ : production_variant_managed_instance_scaling option)
    ?routing_config:(routing_config_ : production_variant_routing_config option)
    ~variant_name:(variant_name_ : variant_name) () =
  ({
     variant_name = variant_name_;
     deployed_images = deployed_images_;
     current_weight = current_weight_;
     desired_weight = desired_weight_;
     current_instance_count = current_instance_count_;
     desired_instance_count = desired_instance_count_;
     instance_type = instance_type_;
     instance_pools = instance_pools_;
     accelerator_type = accelerator_type_;
     variant_status = variant_status_;
     current_serverless_config = current_serverless_config_;
     desired_serverless_config = desired_serverless_config_;
     managed_instance_scaling = managed_instance_scaling_;
     routing_config = routing_config_;
   }
    : pending_production_variant_summary)

let make_pending_deployment_summary
    ?production_variants:(production_variants_ : pending_production_variant_summary_list option)
    ?start_time:(start_time_ : timestamp option)
    ?shadow_production_variants:
      (shadow_production_variants_ : pending_production_variant_summary_list option)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({
     endpoint_config_name = endpoint_config_name_;
     production_variants = production_variants_;
     start_time = start_time_;
     shadow_production_variants = shadow_production_variants_;
   }
    : pending_deployment_summary)

let make_describe_endpoint_output
    ?endpoint_config_name:(endpoint_config_name_ : endpoint_config_name option)
    ?production_variants:(production_variants_ : production_variant_summary_list option)
    ?data_capture_config:(data_capture_config_ : data_capture_config_summary option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_deployment_config:(last_deployment_config_ : deployment_config option)
    ?async_inference_config:(async_inference_config_ : async_inference_config option)
    ?pending_deployment_summary:(pending_deployment_summary_ : pending_deployment_summary option)
    ?explainer_config:(explainer_config_ : explainer_config option)
    ?shadow_production_variants:
      (shadow_production_variants_ : production_variant_summary_list option)
    ?metrics_config:(metrics_config_ : metrics_config option)
    ~endpoint_name:(endpoint_name_ : endpoint_name) ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    ~endpoint_status:(endpoint_status_ : endpoint_status)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_arn = endpoint_arn_;
     endpoint_config_name = endpoint_config_name_;
     production_variants = production_variants_;
     data_capture_config = data_capture_config_;
     endpoint_status = endpoint_status_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_deployment_config = last_deployment_config_;
     async_inference_config = async_inference_config_;
     pending_deployment_summary = pending_deployment_summary_;
     explainer_config = explainer_config_;
     shadow_production_variants = shadow_production_variants_;
     metrics_config = metrics_config_;
   }
    : describe_endpoint_output)

let make_describe_endpoint_input ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({ endpoint_name = endpoint_name_ } : describe_endpoint_input)

let make_describe_endpoint_config_output
    ?data_capture_config:(data_capture_config_ : data_capture_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?async_inference_config:(async_inference_config_ : async_inference_config option)
    ?explainer_config:(explainer_config_ : explainer_config option)
    ?shadow_production_variants:(shadow_production_variants_ : production_variant_list option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?metrics_config:(metrics_config_ : metrics_config option)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name)
    ~endpoint_config_arn:(endpoint_config_arn_ : endpoint_config_arn)
    ~production_variants:(production_variants_ : production_variant_list)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     endpoint_config_name = endpoint_config_name_;
     endpoint_config_arn = endpoint_config_arn_;
     production_variants = production_variants_;
     data_capture_config = data_capture_config_;
     kms_key_id = kms_key_id_;
     creation_time = creation_time_;
     async_inference_config = async_inference_config_;
     explainer_config = explainer_config_;
     shadow_production_variants = shadow_production_variants_;
     execution_role_arn = execution_role_arn_;
     vpc_config = vpc_config_;
     enable_network_isolation = enable_network_isolation_;
     metrics_config = metrics_config_;
   }
    : describe_endpoint_config_output)

let make_describe_endpoint_config_input
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({ endpoint_config_name = endpoint_config_name_ } : describe_endpoint_config_input)

let make_experiment_source ?source_type:(source_type_ : source_type option)
    ~source_arn:(source_arn_ : experiment_source_arn) () =
  ({ source_arn = source_arn_; source_type = source_type_ } : experiment_source)

let make_describe_experiment_response
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?experiment_arn:(experiment_arn_ : experiment_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?source:(source_ : experiment_source option)
    ?description:(description_ : experiment_description option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option) () =
  ({
     experiment_name = experiment_name_;
     experiment_arn = experiment_arn_;
     display_name = display_name_;
     source = source_;
     description = description_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
   }
    : describe_experiment_response)

let make_describe_experiment_request ~experiment_name:(experiment_name_ : experiment_entity_name) ()
    =
  ({ experiment_name = experiment_name_ } : describe_experiment_request)

let make_last_update_status ?failure_reason:(failure_reason_ : failure_reason option)
    ~status:(status_ : last_update_status_value) () =
  ({ status = status_; failure_reason = failure_reason_ } : last_update_status)

let make_offline_store_status ?blocked_reason:(blocked_reason_ : blocked_reason option)
    ~status:(status_ : offline_store_status_value) () =
  ({ status = status_; blocked_reason = blocked_reason_ } : offline_store_status)

let make_throughput_config_description
    ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ : capacity_unit option)
    ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ : capacity_unit option)
    ~throughput_mode:(throughput_mode_ : throughput_mode) () =
  ({
     throughput_mode = throughput_mode_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
   }
    : throughput_config_description)

let make_describe_feature_group_response
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?online_store_config:(online_store_config_ : online_store_config option)
    ?offline_store_config:(offline_store_config_ : offline_store_config option)
    ?throughput_config:(throughput_config_ : throughput_config_description option)
    ?role_arn:(role_arn_ : role_arn option)
    ?feature_group_status:(feature_group_status_ : feature_group_status option)
    ?offline_store_status:(offline_store_status_ : offline_store_status option)
    ?last_update_status:(last_update_status_ : last_update_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?description:(description_ : description option)
    ?online_store_total_size_bytes:
      (online_store_total_size_bytes_ : online_store_total_size_bytes option)
    ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    ~feature_group_name:(feature_group_name_ : feature_group_name)
    ~record_identifier_feature_name:(record_identifier_feature_name_ : feature_name)
    ~event_time_feature_name:(event_time_feature_name_ : feature_name)
    ~feature_definitions:(feature_definitions_ : feature_definitions)
    ~creation_time:(creation_time_ : creation_time) ~next_token:(next_token_ : next_token) () =
  ({
     feature_group_arn = feature_group_arn_;
     feature_group_name = feature_group_name_;
     record_identifier_feature_name = record_identifier_feature_name_;
     event_time_feature_name = event_time_feature_name_;
     feature_definitions = feature_definitions_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     online_store_config = online_store_config_;
     offline_store_config = offline_store_config_;
     throughput_config = throughput_config_;
     role_arn = role_arn_;
     feature_group_status = feature_group_status_;
     offline_store_status = offline_store_status_;
     last_update_status = last_update_status_;
     failure_reason = failure_reason_;
     description = description_;
     next_token = next_token_;
     online_store_total_size_bytes = online_store_total_size_bytes_;
   }
    : describe_feature_group_response)

let make_describe_feature_group_request ?next_token:(next_token_ : next_token option)
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn) () =
  ({ feature_group_name = feature_group_name_; next_token = next_token_ }
    : describe_feature_group_request)

let make_feature_parameter ?key:(key_ : feature_parameter_key option)
    ?value:(value_ : feature_parameter_value option) () =
  ({ key = key_; value = value_ } : feature_parameter)

let make_describe_feature_metadata_response ?description:(description_ : feature_description option)
    ?parameters:(parameters_ : feature_parameters option)
    ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    ~feature_group_name:(feature_group_name_ : feature_group_name)
    ~feature_name:(feature_name_ : feature_name) ~feature_type:(feature_type_ : feature_type)
    ~creation_time:(creation_time_ : creation_time)
    ~last_modified_time:(last_modified_time_ : last_modified_time) () =
  ({
     feature_group_arn = feature_group_arn_;
     feature_group_name = feature_group_name_;
     feature_name = feature_name_;
     feature_type = feature_type_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     description = description_;
     parameters = parameters_;
   }
    : describe_feature_metadata_response)

let make_describe_feature_metadata_request
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn)
    ~feature_name:(feature_name_ : feature_name) () =
  ({ feature_group_name = feature_group_name_; feature_name = feature_name_ }
    : describe_feature_metadata_request)

let make_describe_flow_definition_response
    ?human_loop_request_source:(human_loop_request_source_ : human_loop_request_source option)
    ?human_loop_activation_config:
      (human_loop_activation_config_ : human_loop_activation_config option)
    ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn)
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name)
    ~flow_definition_status:(flow_definition_status_ : flow_definition_status)
    ~creation_time:(creation_time_ : timestamp)
    ~output_config:(output_config_ : flow_definition_output_config) ~role_arn:(role_arn_ : role_arn)
    () =
  ({
     flow_definition_arn = flow_definition_arn_;
     flow_definition_name = flow_definition_name_;
     flow_definition_status = flow_definition_status_;
     creation_time = creation_time_;
     human_loop_request_source = human_loop_request_source_;
     human_loop_activation_config = human_loop_activation_config_;
     human_loop_config = human_loop_config_;
     output_config = output_config_;
     role_arn = role_arn_;
     failure_reason = failure_reason_;
   }
    : describe_flow_definition_response)

let make_describe_flow_definition_request
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name) () =
  ({ flow_definition_name = flow_definition_name_ } : describe_flow_definition_request)

let make_describe_hub_response ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ?hub_description:(hub_description_ : hub_description option)
    ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ?s3_storage_config:(s3_storage_config_ : hub_s3_storage_config option)
    ?failure_reason:(failure_reason_ : failure_reason option) ~hub_name:(hub_name_ : hub_name)
    ~hub_arn:(hub_arn_ : hub_arn) ~hub_status:(hub_status_ : hub_status)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     hub_name = hub_name_;
     hub_arn = hub_arn_;
     hub_display_name = hub_display_name_;
     hub_description = hub_description_;
     hub_search_keywords = hub_search_keywords_;
     s3_storage_config = s3_storage_config_;
     hub_status = hub_status_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : describe_hub_response)

let make_describe_hub_request ~hub_name:(hub_name_ : hub_name_or_arn) () =
  ({ hub_name = hub_name_ } : describe_hub_request)

let make_hub_content_dependency
    ?dependency_origin_path:(dependency_origin_path_ : dependency_origin_path option)
    ?dependency_copy_path:(dependency_copy_path_ : dependency_copy_path option) () =
  ({
     dependency_origin_path = dependency_origin_path_;
     dependency_copy_path = dependency_copy_path_;
   }
    : hub_content_dependency)

let make_describe_hub_content_response
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?hub_content_markdown:(hub_content_markdown_ : hub_content_markdown option)
    ?sage_maker_public_hub_content_arn:
      (sage_maker_public_hub_content_arn_ : sage_maker_public_hub_content_arn option)
    ?reference_min_version:(reference_min_version_ : reference_min_version option)
    ?support_status:(support_status_ : hub_content_support_status option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?hub_content_dependencies:(hub_content_dependencies_ : hub_content_dependency_list option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_content_version:(hub_content_version_ : hub_content_version)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~document_schema_version:(document_schema_version_ : document_schema_version)
    ~hub_name:(hub_name_ : hub_name) ~hub_arn:(hub_arn_ : hub_arn)
    ~hub_content_document:(hub_content_document_ : hub_content_document)
    ~hub_content_status:(hub_content_status_ : hub_content_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     hub_content_name = hub_content_name_;
     hub_content_arn = hub_content_arn_;
     hub_content_version = hub_content_version_;
     hub_content_type = hub_content_type_;
     document_schema_version = document_schema_version_;
     hub_name = hub_name_;
     hub_arn = hub_arn_;
     hub_content_display_name = hub_content_display_name_;
     hub_content_description = hub_content_description_;
     hub_content_markdown = hub_content_markdown_;
     hub_content_document = hub_content_document_;
     sage_maker_public_hub_content_arn = sage_maker_public_hub_content_arn_;
     reference_min_version = reference_min_version_;
     support_status = support_status_;
     hub_content_search_keywords = hub_content_search_keywords_;
     hub_content_dependencies = hub_content_dependencies_;
     hub_content_status = hub_content_status_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : describe_hub_content_response)

let make_describe_hub_content_request
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ~hub_name:(hub_name_ : hub_name_or_arn) ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name) () =
  ({
     hub_name = hub_name_;
     hub_content_type = hub_content_type_;
     hub_content_name = hub_content_name_;
     hub_content_version = hub_content_version_;
   }
    : describe_hub_content_request)

let make_ui_template_info ?url:(url_ : template_url option)
    ?content_sha256:(content_sha256_ : template_content_sha256 option) () =
  ({ url = url_; content_sha256 = content_sha256_ } : ui_template_info)

let make_describe_human_task_ui_response
    ?human_task_ui_status:(human_task_ui_status_ : human_task_ui_status option)
    ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn)
    ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name)
    ~creation_time:(creation_time_ : timestamp) ~ui_template:(ui_template_ : ui_template_info) () =
  ({
     human_task_ui_arn = human_task_ui_arn_;
     human_task_ui_name = human_task_ui_name_;
     human_task_ui_status = human_task_ui_status_;
     creation_time = creation_time_;
     ui_template = ui_template_;
   }
    : describe_human_task_ui_response)

let make_describe_human_task_ui_request
    ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name) () =
  ({ human_task_ui_name = human_task_ui_name_ } : describe_human_task_ui_request)

let make_hyper_parameter_tuning_job_consumed_resources
    ?runtime_in_seconds:(runtime_in_seconds_ : integer option) () =
  ({ runtime_in_seconds = runtime_in_seconds_ } : hyper_parameter_tuning_job_consumed_resources)

let make_hyper_parameter_tuning_job_completion_details
    ?number_of_training_jobs_objective_not_improving:
      (number_of_training_jobs_objective_not_improving_ : integer option)
    ?convergence_detected_time:(convergence_detected_time_ : timestamp option) () =
  ({
     number_of_training_jobs_objective_not_improving =
       number_of_training_jobs_objective_not_improving_;
     convergence_detected_time = convergence_detected_time_;
   }
    : hyper_parameter_tuning_job_completion_details)

let make_final_hyper_parameter_tuning_job_objective_metric
    ?type_:(type__ : hyper_parameter_tuning_job_objective_type option)
    ~metric_name:(metric_name_ : metric_name) ~value:(value_ : metric_value) () =
  ({ type_ = type__; metric_name = metric_name_; value = value_ }
    : final_hyper_parameter_tuning_job_objective_metric)

let make_hyper_parameter_training_job_summary
    ?training_job_definition_name:
      (training_job_definition_name_ : hyper_parameter_training_job_definition_name option)
    ?tuning_job_name:(tuning_job_name_ : hyper_parameter_tuning_job_name option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?final_hyper_parameter_tuning_job_objective_metric:
      (final_hyper_parameter_tuning_job_objective_metric_ :
         final_hyper_parameter_tuning_job_objective_metric option)
    ?objective_status:(objective_status_ : objective_status option)
    ~training_job_name:(training_job_name_ : training_job_name)
    ~training_job_arn:(training_job_arn_ : training_job_arn)
    ~creation_time:(creation_time_ : timestamp)
    ~training_job_status:(training_job_status_ : training_job_status)
    ~tuned_hyper_parameters:(tuned_hyper_parameters_ : hyper_parameters) () =
  ({
     training_job_definition_name = training_job_definition_name_;
     training_job_name = training_job_name_;
     training_job_arn = training_job_arn_;
     tuning_job_name = tuning_job_name_;
     creation_time = creation_time_;
     training_start_time = training_start_time_;
     training_end_time = training_end_time_;
     training_job_status = training_job_status_;
     tuned_hyper_parameters = tuned_hyper_parameters_;
     failure_reason = failure_reason_;
     final_hyper_parameter_tuning_job_objective_metric =
       final_hyper_parameter_tuning_job_objective_metric_;
     objective_status = objective_status_;
   }
    : hyper_parameter_training_job_summary)

let make_objective_status_counters ?succeeded:(succeeded_ : objective_status_counter option)
    ?pending:(pending_ : objective_status_counter option)
    ?failed:(failed_ : objective_status_counter option) () =
  ({ succeeded = succeeded_; pending = pending_; failed = failed_ } : objective_status_counters)

let make_training_job_status_counters ?completed:(completed_ : training_job_status_counter option)
    ?in_progress:(in_progress_ : training_job_status_counter option)
    ?retryable_error:(retryable_error_ : training_job_status_counter option)
    ?non_retryable_error:(non_retryable_error_ : training_job_status_counter option)
    ?stopped:(stopped_ : training_job_status_counter option) () =
  ({
     completed = completed_;
     in_progress = in_progress_;
     retryable_error = retryable_error_;
     non_retryable_error = non_retryable_error_;
     stopped = stopped_;
   }
    : training_job_status_counters)

let make_describe_hyper_parameter_tuning_job_response
    ?training_job_definition:
      (training_job_definition_ : hyper_parameter_training_job_definition option)
    ?training_job_definitions:
      (training_job_definitions_ : hyper_parameter_training_job_definitions option)
    ?hyper_parameter_tuning_end_time:(hyper_parameter_tuning_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?best_training_job:(best_training_job_ : hyper_parameter_training_job_summary option)
    ?overall_best_training_job:
      (overall_best_training_job_ : hyper_parameter_training_job_summary option)
    ?warm_start_config:(warm_start_config_ : hyper_parameter_tuning_job_warm_start_config option)
    ?autotune:(autotune_ : autotune option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?tuning_job_completion_details:
      (tuning_job_completion_details_ : hyper_parameter_tuning_job_completion_details option)
    ?consumed_resources:(consumed_resources_ : hyper_parameter_tuning_job_consumed_resources option)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name)
    ~hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn)
    ~hyper_parameter_tuning_job_config:
      (hyper_parameter_tuning_job_config_ : hyper_parameter_tuning_job_config)
    ~hyper_parameter_tuning_job_status:
      (hyper_parameter_tuning_job_status_ : hyper_parameter_tuning_job_status)
    ~creation_time:(creation_time_ : timestamp)
    ~training_job_status_counters:(training_job_status_counters_ : training_job_status_counters)
    ~objective_status_counters:(objective_status_counters_ : objective_status_counters) () =
  ({
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
     hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_;
     hyper_parameter_tuning_job_config = hyper_parameter_tuning_job_config_;
     training_job_definition = training_job_definition_;
     training_job_definitions = training_job_definitions_;
     hyper_parameter_tuning_job_status = hyper_parameter_tuning_job_status_;
     creation_time = creation_time_;
     hyper_parameter_tuning_end_time = hyper_parameter_tuning_end_time_;
     last_modified_time = last_modified_time_;
     training_job_status_counters = training_job_status_counters_;
     objective_status_counters = objective_status_counters_;
     best_training_job = best_training_job_;
     overall_best_training_job = overall_best_training_job_;
     warm_start_config = warm_start_config_;
     autotune = autotune_;
     failure_reason = failure_reason_;
     tuning_job_completion_details = tuning_job_completion_details_;
     consumed_resources = consumed_resources_;
   }
    : describe_hyper_parameter_tuning_job_response)

let make_describe_hyper_parameter_tuning_job_request
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : describe_hyper_parameter_tuning_job_request)

let make_describe_image_response ?creation_time:(creation_time_ : timestamp option)
    ?description:(description_ : image_description option)
    ?display_name:(display_name_ : image_display_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?image_arn:(image_arn_ : image_arn option) ?image_name:(image_name_ : image_name option)
    ?image_status:(image_status_ : image_status option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?role_arn:(role_arn_ : role_arn option) () =
  ({
     creation_time = creation_time_;
     description = description_;
     display_name = display_name_;
     failure_reason = failure_reason_;
     image_arn = image_arn_;
     image_name = image_name_;
     image_status = image_status_;
     last_modified_time = last_modified_time_;
     role_arn = role_arn_;
   }
    : describe_image_response)

let make_describe_image_request ~image_name:(image_name_ : image_name) () =
  ({ image_name = image_name_ } : describe_image_request)

let make_describe_image_version_response ?base_image:(base_image_ : image_base_image option)
    ?container_image:(container_image_ : image_container_image option)
    ?creation_time:(creation_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?image_arn:(image_arn_ : image_arn option)
    ?image_version_arn:(image_version_arn_ : image_version_arn option)
    ?image_version_status:(image_version_status_ : image_version_status option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?version:(version_ : image_version_number option)
    ?vendor_guidance:(vendor_guidance_ : vendor_guidance option)
    ?job_type:(job_type_ : job_type option) ?ml_framework:(ml_framework_ : ml_framework option)
    ?programming_lang:(programming_lang_ : programming_lang option)
    ?processor:(processor_ : processor option) ?horovod:(horovod_ : horovod option)
    ?release_notes:(release_notes_ : release_notes option) () =
  ({
     base_image = base_image_;
     container_image = container_image_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     image_arn = image_arn_;
     image_version_arn = image_version_arn_;
     image_version_status = image_version_status_;
     last_modified_time = last_modified_time_;
     version = version_;
     vendor_guidance = vendor_guidance_;
     job_type = job_type_;
     ml_framework = ml_framework_;
     programming_lang = programming_lang_;
     processor = processor_;
     horovod = horovod_;
     release_notes = release_notes_;
   }
    : describe_image_version_response)

let make_describe_image_version_request ?version:(version_ : image_version_number option)
    ?alias:(alias_ : sage_maker_image_version_alias option) ~image_name:(image_name_ : image_name)
    () =
  ({ image_name = image_name_; version = version_; alias = alias_ }
    : describe_image_version_request)

let make_inference_component_capacity_size ~type_:(type__ : inference_component_capacity_size_type)
    ~value:(value_ : capacity_size_value) () =
  ({ type_ = type__; value = value_ } : inference_component_capacity_size)

let make_inference_component_rolling_update_policy
    ?maximum_execution_timeout_in_seconds:
      (maximum_execution_timeout_in_seconds_ : maximum_execution_timeout_in_seconds option)
    ?rollback_maximum_batch_size:
      (rollback_maximum_batch_size_ : inference_component_capacity_size option)
    ~maximum_batch_size:(maximum_batch_size_ : inference_component_capacity_size)
    ~wait_interval_in_seconds:(wait_interval_in_seconds_ : wait_interval_in_seconds) () =
  ({
     maximum_batch_size = maximum_batch_size_;
     wait_interval_in_seconds = wait_interval_in_seconds_;
     maximum_execution_timeout_in_seconds = maximum_execution_timeout_in_seconds_;
     rollback_maximum_batch_size = rollback_maximum_batch_size_;
   }
    : inference_component_rolling_update_policy)

let make_inference_component_deployment_config
    ?auto_rollback_configuration:(auto_rollback_configuration_ : auto_rollback_config option)
    ~rolling_update_policy:(rolling_update_policy_ : inference_component_rolling_update_policy) () =
  ({
     rolling_update_policy = rolling_update_policy_;
     auto_rollback_configuration = auto_rollback_configuration_;
   }
    : inference_component_deployment_config)

let make_inference_component_placement_status
    ~instance_type:(instance_type_ : production_variant_instance_type)
    ~current_copy_count:(current_copy_count_ : inference_component_copy_count) () =
  ({ instance_type = instance_type_; current_copy_count = current_copy_count_ }
    : inference_component_placement_status)

let make_inference_component_runtime_config_summary
    ?desired_copy_count:(desired_copy_count_ : inference_component_copy_count option)
    ?current_copy_count:(current_copy_count_ : inference_component_copy_count option)
    ?placement_status:(placement_status_ : inference_component_placement_status_list option) () =
  ({
     desired_copy_count = desired_copy_count_;
     current_copy_count = current_copy_count_;
     placement_status = placement_status_;
   }
    : inference_component_runtime_config_summary)

let make_inference_component_data_cache_config_summary
    ~enable_caching:(enable_caching_ : enable_caching) () =
  ({ enable_caching = enable_caching_ } : inference_component_data_cache_config_summary)

let make_inference_component_container_specification_summary
    ?deployed_image:(deployed_image_ : deployed_image option)
    ?artifact_url:(artifact_url_ : url option) ?environment:(environment_ : environment_map option)
    ?container_metrics_config:(container_metrics_config_ : container_metrics_config option) () =
  ({
     deployed_image = deployed_image_;
     artifact_url = artifact_url_;
     environment = environment_;
     container_metrics_config = container_metrics_config_;
   }
    : inference_component_container_specification_summary)

let make_inference_component_specification_summary
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?model_name:(model_name_ : model_name option)
    ?container:(container_ : inference_component_container_specification_summary option)
    ?startup_parameters:(startup_parameters_ : inference_component_startup_parameters option)
    ?compute_resource_requirements:
      (compute_resource_requirements_ : inference_component_compute_resource_requirements option)
    ?base_inference_component_name:
      (base_inference_component_name_ : inference_component_name option)
    ?data_cache_config:(data_cache_config_ : inference_component_data_cache_config_summary option)
    ?scheduling_config:(scheduling_config_ : inference_component_scheduling_config option) () =
  ({
     instance_type = instance_type_;
     model_name = model_name_;
     container = container_;
     startup_parameters = startup_parameters_;
     compute_resource_requirements = compute_resource_requirements_;
     base_inference_component_name = base_inference_component_name_;
     data_cache_config = data_cache_config_;
     scheduling_config = scheduling_config_;
   }
    : inference_component_specification_summary)

let make_describe_inference_component_output ?variant_name:(variant_name_ : variant_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?specification:(specification_ : inference_component_specification_summary option)
    ?specifications:(specifications_ : inference_component_specification_summary_list option)
    ?runtime_config:(runtime_config_ : inference_component_runtime_config_summary option)
    ?inference_component_status:(inference_component_status_ : inference_component_status option)
    ?last_deployment_config:(last_deployment_config_ : inference_component_deployment_config option)
    ~inference_component_name:(inference_component_name_ : inference_component_name)
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn)
    ~endpoint_name:(endpoint_name_ : endpoint_name) ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     inference_component_name = inference_component_name_;
     inference_component_arn = inference_component_arn_;
     endpoint_name = endpoint_name_;
     endpoint_arn = endpoint_arn_;
     variant_name = variant_name_;
     failure_reason = failure_reason_;
     specification = specification_;
     specifications = specifications_;
     runtime_config = runtime_config_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     inference_component_status = inference_component_status_;
     last_deployment_config = last_deployment_config_;
   }
    : describe_inference_component_output)

let make_describe_inference_component_input
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({ inference_component_name = inference_component_name_ } : describe_inference_component_input)

let make_model_variant_config_summary ~model_name:(model_name_ : model_name)
    ~variant_name:(variant_name_ : model_variant_name)
    ~infrastructure_config:(infrastructure_config_ : model_infrastructure_config)
    ~status:(status_ : model_variant_status) () =
  ({
     model_name = model_name_;
     variant_name = variant_name_;
     infrastructure_config = infrastructure_config_;
     status = status_;
   }
    : model_variant_config_summary)

let make_endpoint_metadata
    ?endpoint_config_name:(endpoint_config_name_ : endpoint_config_name option)
    ?endpoint_status:(endpoint_status_ : endpoint_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_config_name = endpoint_config_name_;
     endpoint_status = endpoint_status_;
     failure_reason = failure_reason_;
   }
    : endpoint_metadata)

let make_describe_inference_experiment_response
    ?schedule:(schedule_ : inference_experiment_schedule option)
    ?status_reason:(status_reason_ : inference_experiment_status_reason option)
    ?description:(description_ : inference_experiment_description option)
    ?creation_time:(creation_time_ : timestamp option)
    ?completion_time:(completion_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?role_arn:(role_arn_ : role_arn option)
    ?data_storage_config:(data_storage_config_ : inference_experiment_data_storage_config option)
    ?shadow_mode_config:(shadow_mode_config_ : shadow_mode_config option)
    ?kms_key:(kms_key_ : kms_key_id option) ~arn:(arn_ : inference_experiment_arn)
    ~name:(name_ : inference_experiment_name) ~type_:(type__ : inference_experiment_type)
    ~status:(status_ : inference_experiment_status)
    ~endpoint_metadata:(endpoint_metadata_ : endpoint_metadata)
    ~model_variants:(model_variants_ : model_variant_config_summary_list) () =
  ({
     arn = arn_;
     name = name_;
     type_ = type__;
     schedule = schedule_;
     status = status_;
     status_reason = status_reason_;
     description = description_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     last_modified_time = last_modified_time_;
     role_arn = role_arn_;
     endpoint_metadata = endpoint_metadata_;
     model_variants = model_variants_;
     data_storage_config = data_storage_config_;
     shadow_mode_config = shadow_mode_config_;
     kms_key = kms_key_;
   }
    : describe_inference_experiment_response)

let make_describe_inference_experiment_request ~name:(name_ : inference_experiment_name) () =
  ({ name = name_ } : describe_inference_experiment_request)

let make_inference_metrics ~max_invocations:(max_invocations_ : integer)
    ~model_latency:(model_latency_ : integer) () =
  ({ max_invocations = max_invocations_; model_latency = model_latency_ } : inference_metrics)

let make_endpoint_performance ~metrics:(metrics_ : inference_metrics)
    ~endpoint_info:(endpoint_info_ : endpoint_info) () =
  ({ metrics = metrics_; endpoint_info = endpoint_info_ } : endpoint_performance)

let make_environment_parameter ~key:(key_ : string_) ~value_type:(value_type_ : string_)
    ~value:(value_ : string_) () =
  ({ key = key_; value_type = value_type_; value = value_ } : environment_parameter)

let make_model_configuration
    ?inference_specification_name:
      (inference_specification_name_ : inference_specification_name option)
    ?environment_parameters:(environment_parameters_ : environment_parameters option)
    ?compilation_job_name:(compilation_job_name_ : recommendation_job_compilation_job_name option)
    () =
  ({
     inference_specification_name = inference_specification_name_;
     environment_parameters = environment_parameters_;
     compilation_job_name = compilation_job_name_;
   }
    : model_configuration)

let make_endpoint_output_configuration
    ?instance_type:(instance_type_ : production_variant_instance_type option)
    ?initial_instance_count:(initial_instance_count_ : initial_instance_count option)
    ?serverless_config:(serverless_config_ : production_variant_serverless_config option)
    ~endpoint_name:(endpoint_name_ : string_) ~variant_name:(variant_name_ : string_) () =
  ({
     endpoint_name = endpoint_name_;
     variant_name = variant_name_;
     instance_type = instance_type_;
     initial_instance_count = initial_instance_count_;
     serverless_config = serverless_config_;
   }
    : endpoint_output_configuration)

let make_recommendation_metrics ?cost_per_hour:(cost_per_hour_ : float_ option)
    ?cost_per_inference:(cost_per_inference_ : float_ option)
    ?max_invocations:(max_invocations_ : integer option)
    ?model_latency:(model_latency_ : integer option)
    ?cpu_utilization:(cpu_utilization_ : utilization_metric option)
    ?memory_utilization:(memory_utilization_ : utilization_metric option)
    ?model_setup_time:(model_setup_time_ : model_setup_time option) () =
  ({
     cost_per_hour = cost_per_hour_;
     cost_per_inference = cost_per_inference_;
     max_invocations = max_invocations_;
     model_latency = model_latency_;
     cpu_utilization = cpu_utilization_;
     memory_utilization = memory_utilization_;
     model_setup_time = model_setup_time_;
   }
    : recommendation_metrics)

let make_inference_recommendation ?recommendation_id:(recommendation_id_ : string_ option)
    ?metrics:(metrics_ : recommendation_metrics option)
    ?invocation_end_time:(invocation_end_time_ : invocation_end_time option)
    ?invocation_start_time:(invocation_start_time_ : invocation_start_time option)
    ~endpoint_configuration:(endpoint_configuration_ : endpoint_output_configuration)
    ~model_configuration:(model_configuration_ : model_configuration) () =
  ({
     recommendation_id = recommendation_id_;
     metrics = metrics_;
     endpoint_configuration = endpoint_configuration_;
     model_configuration = model_configuration_;
     invocation_end_time = invocation_end_time_;
     invocation_start_time = invocation_start_time_;
   }
    : inference_recommendation)

let make_describe_inference_recommendations_job_response
    ?job_description:(job_description_ : recommendation_job_description option)
    ?completion_time:(completion_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?stopping_conditions:(stopping_conditions_ : recommendation_job_stopping_conditions option)
    ?inference_recommendations:(inference_recommendations_ : inference_recommendations option)
    ?endpoint_performances:(endpoint_performances_ : endpoint_performances option)
    ~job_name:(job_name_ : recommendation_job_name) ~job_type:(job_type_ : recommendation_job_type)
    ~job_arn:(job_arn_ : recommendation_job_arn) ~role_arn:(role_arn_ : role_arn)
    ~status:(status_ : recommendation_job_status) ~creation_time:(creation_time_ : creation_time)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~input_config:(input_config_ : recommendation_job_input_config) () =
  ({
     job_name = job_name_;
     job_description = job_description_;
     job_type = job_type_;
     job_arn = job_arn_;
     role_arn = role_arn_;
     status = status_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     input_config = input_config_;
     stopping_conditions = stopping_conditions_;
     inference_recommendations = inference_recommendations_;
     endpoint_performances = endpoint_performances_;
   }
    : describe_inference_recommendations_job_response)

let make_describe_inference_recommendations_job_request
    ~job_name:(job_name_ : recommendation_job_name) () =
  ({ job_name = job_name_ } : describe_inference_recommendations_job_request)

let make_job_secondary_status_transition ?end_time:(end_time_ : timestamp option)
    ?status_message:(status_message_ : string_ option) ~status:(status_ : job_secondary_status)
    ~start_time:(start_time_ : timestamp) () =
  ({
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     status_message = status_message_;
   }
    : job_secondary_status_transition)

let make_describe_job_response
    ?job_config_document:(job_config_document_ : job_config_document option)
    ?end_time:(end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?tags:(tags_ : tag_list option)
    ~job_name:(job_name_ : job_name) ~job_arn:(job_arn_ : job_arn) ~role_arn:(role_arn_ : role_arn)
    ~job_category:(job_category_ : job_category)
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) ~job_status:(job_status_ : job_status)
    ~secondary_status:(secondary_status_ : job_secondary_status)
    ~secondary_status_transitions:(secondary_status_transitions_ : job_secondary_status_transitions)
    () =
  ({
     job_name = job_name_;
     job_arn = job_arn_;
     role_arn = role_arn_;
     job_category = job_category_;
     job_config_schema_version = job_config_schema_version_;
     job_config_document = job_config_document_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     end_time = end_time_;
     job_status = job_status_;
     secondary_status = secondary_status_;
     secondary_status_transitions = secondary_status_transitions_;
     failure_reason = failure_reason_;
     tags = tags_;
   }
    : describe_job_response)

let make_describe_job_request ~job_name:(job_name_ : job_name)
    ~job_category:(job_category_ : job_category) () =
  ({ job_name = job_name_; job_category = job_category_ } : describe_job_request)

let make_describe_job_schema_version_response ~job_category:(job_category_ : job_category)
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version)
    ~job_config_schema:(job_config_schema_ : job_config_document) () =
  ({
     job_category = job_category_;
     job_config_schema_version = job_config_schema_version_;
     job_config_schema = job_config_schema_;
   }
    : describe_job_schema_version_response)

let make_describe_job_schema_version_request
    ?job_config_schema_version:(job_config_schema_version_ : job_schema_version option)
    ~job_category:(job_category_ : job_category) () =
  ({ job_category = job_category_; job_config_schema_version = job_config_schema_version_ }
    : describe_job_schema_version_request)

let make_labeling_job_output
    ?final_active_learning_model_arn:(final_active_learning_model_arn_ : model_arn option)
    ~output_dataset_s3_uri:(output_dataset_s3_uri_ : s3_uri) () =
  ({
     output_dataset_s3_uri = output_dataset_s3_uri_;
     final_active_learning_model_arn = final_active_learning_model_arn_;
   }
    : labeling_job_output)

let make_label_counters ?total_labeled:(total_labeled_ : label_counter option)
    ?human_labeled:(human_labeled_ : label_counter option)
    ?machine_labeled:(machine_labeled_ : label_counter option)
    ?failed_non_retryable_error:(failed_non_retryable_error_ : label_counter option)
    ?unlabeled:(unlabeled_ : label_counter option) () =
  ({
     total_labeled = total_labeled_;
     human_labeled = human_labeled_;
     machine_labeled = machine_labeled_;
     failed_non_retryable_error = failed_non_retryable_error_;
     unlabeled = unlabeled_;
   }
    : label_counters)

let make_describe_labeling_job_response ?failure_reason:(failure_reason_ : failure_reason option)
    ?label_attribute_name:(label_attribute_name_ : label_attribute_name option)
    ?label_category_config_s3_uri:(label_category_config_s3_uri_ : s3_uri option)
    ?stopping_conditions:(stopping_conditions_ : labeling_job_stopping_conditions option)
    ?labeling_job_algorithms_config:
      (labeling_job_algorithms_config_ : labeling_job_algorithms_config option)
    ?tags:(tags_ : tag_list option)
    ?labeling_job_output:(labeling_job_output_ : labeling_job_output option)
    ~labeling_job_status:(labeling_job_status_ : labeling_job_status)
    ~label_counters:(label_counters_ : label_counters) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~job_reference_code:(job_reference_code_ : job_reference_code)
    ~labeling_job_name:(labeling_job_name_ : labeling_job_name)
    ~labeling_job_arn:(labeling_job_arn_ : labeling_job_arn)
    ~input_config:(input_config_ : labeling_job_input_config)
    ~output_config:(output_config_ : labeling_job_output_config) ~role_arn:(role_arn_ : role_arn)
    ~human_task_config:(human_task_config_ : human_task_config) () =
  ({
     labeling_job_status = labeling_job_status_;
     label_counters = label_counters_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     job_reference_code = job_reference_code_;
     labeling_job_name = labeling_job_name_;
     labeling_job_arn = labeling_job_arn_;
     label_attribute_name = label_attribute_name_;
     input_config = input_config_;
     output_config = output_config_;
     role_arn = role_arn_;
     label_category_config_s3_uri = label_category_config_s3_uri_;
     stopping_conditions = stopping_conditions_;
     labeling_job_algorithms_config = labeling_job_algorithms_config_;
     human_task_config = human_task_config_;
     tags = tags_;
     labeling_job_output = labeling_job_output_;
   }
    : describe_labeling_job_response)

let make_describe_labeling_job_request ~labeling_job_name:(labeling_job_name_ : labeling_job_name)
    () =
  ({ labeling_job_name = labeling_job_name_ } : describe_labeling_job_request)

let make_describe_lineage_group_response
    ?lineage_group_name:(lineage_group_name_ : experiment_entity_name option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?description:(description_ : experiment_description option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option) () =
  ({
     lineage_group_name = lineage_group_name_;
     lineage_group_arn = lineage_group_arn_;
     display_name = display_name_;
     description = description_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
   }
    : describe_lineage_group_response)

let make_describe_lineage_group_request
    ~lineage_group_name:(lineage_group_name_ : experiment_entity_name) () =
  ({ lineage_group_name = lineage_group_name_ } : describe_lineage_group_request)

let make_describe_mlflow_app_response ?arn:(arn_ : mlflow_app_arn option)
    ?name:(name_ : mlflow_app_name option) ?artifact_store_uri:(artifact_store_uri_ : s3_uri option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?role_arn:(role_arn_ : role_arn option) ?status:(status_ : mlflow_app_status option)
    ?model_registration_mode:(model_registration_mode_ : model_registration_mode option)
    ?account_default_status:(account_default_status_ : account_default_status option)
    ?default_domain_id_list:(default_domain_id_list_ : default_domain_id_list option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?maintenance_status:(maintenance_status_ : maintenance_status option) () =
  ({
     arn = arn_;
     name = name_;
     artifact_store_uri = artifact_store_uri_;
     mlflow_version = mlflow_version_;
     role_arn = role_arn_;
     status = status_;
     model_registration_mode = model_registration_mode_;
     account_default_status = account_default_status_;
     default_domain_id_list = default_domain_id_list_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     maintenance_status = maintenance_status_;
   }
    : describe_mlflow_app_response)

let make_describe_mlflow_app_request ~arn:(arn_ : mlflow_app_arn) () =
  ({ arn = arn_ } : describe_mlflow_app_request)

let make_describe_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option)
    ?tracking_server_name:(tracking_server_name_ : tracking_server_name option)
    ?artifact_store_uri:(artifact_store_uri_ : s3_uri option)
    ?tracking_server_size:(tracking_server_size_ : tracking_server_size option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?role_arn:(role_arn_ : role_arn option)
    ?tracking_server_status:(tracking_server_status_ : tracking_server_status option)
    ?tracking_server_maintenance_status:
      (tracking_server_maintenance_status_ : tracking_server_maintenance_status option)
    ?is_active:(is_active_ : is_tracking_server_active option)
    ?tracking_server_url:(tracking_server_url_ : tracking_server_url option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?automatic_model_registration:(automatic_model_registration_ : boolean_ option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?s3_bucket_owner_account_id:(s3_bucket_owner_account_id_ : account_id option)
    ?s3_bucket_owner_verification:(s3_bucket_owner_verification_ : boolean_ option) () =
  ({
     tracking_server_arn = tracking_server_arn_;
     tracking_server_name = tracking_server_name_;
     artifact_store_uri = artifact_store_uri_;
     tracking_server_size = tracking_server_size_;
     mlflow_version = mlflow_version_;
     role_arn = role_arn_;
     tracking_server_status = tracking_server_status_;
     tracking_server_maintenance_status = tracking_server_maintenance_status_;
     is_active = is_active_;
     tracking_server_url = tracking_server_url_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     automatic_model_registration = automatic_model_registration_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     s3_bucket_owner_account_id = s3_bucket_owner_account_id_;
     s3_bucket_owner_verification = s3_bucket_owner_verification_;
   }
    : describe_mlflow_tracking_server_response)

let make_describe_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : describe_mlflow_tracking_server_request)

let make_describe_model_output ?primary_container:(primary_container_ : container_definition option)
    ?containers:(containers_ : container_definition_list option)
    ?inference_execution_config:(inference_execution_config_ : inference_execution_config option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?deployment_recommendation:(deployment_recommendation_ : deployment_recommendation option)
    ~model_name:(model_name_ : model_name) ~creation_time:(creation_time_ : timestamp)
    ~model_arn:(model_arn_ : model_arn) () =
  ({
     model_name = model_name_;
     primary_container = primary_container_;
     containers = containers_;
     inference_execution_config = inference_execution_config_;
     execution_role_arn = execution_role_arn_;
     vpc_config = vpc_config_;
     creation_time = creation_time_;
     model_arn = model_arn_;
     enable_network_isolation = enable_network_isolation_;
     deployment_recommendation = deployment_recommendation_;
   }
    : describe_model_output)

let make_describe_model_input ~model_name:(model_name_ : model_name) () =
  ({ model_name = model_name_ } : describe_model_input)

let make_describe_model_bias_job_definition_response
    ?model_bias_baseline_config:(model_bias_baseline_config_ : model_bias_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~creation_time:(creation_time_ : timestamp)
    ~model_bias_app_specification:(model_bias_app_specification_ : model_bias_app_specification)
    ~model_bias_job_input:(model_bias_job_input_ : model_bias_job_input)
    ~model_bias_job_output_config:(model_bias_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_arn = job_definition_arn_;
     job_definition_name = job_definition_name_;
     creation_time = creation_time_;
     model_bias_baseline_config = model_bias_baseline_config_;
     model_bias_app_specification = model_bias_app_specification_;
     model_bias_job_input = model_bias_job_input_;
     model_bias_job_output_config = model_bias_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
   }
    : describe_model_bias_job_definition_response)

let make_describe_model_bias_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : describe_model_bias_job_definition_request)

let make_describe_model_card_response
    ?security_config:(security_config_ : model_card_security_config option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?model_card_processing_status:
      (model_card_processing_status_ : model_card_processing_status option)
    ~model_card_arn:(model_card_arn_ : model_card_arn)
    ~model_card_name:(model_card_name_ : entity_name)
    ~model_card_version:(model_card_version_ : integer) ~content:(content_ : model_card_content)
    ~model_card_status:(model_card_status_ : model_card_status)
    ~creation_time:(creation_time_ : timestamp) ~created_by:(created_by_ : user_context) () =
  ({
     model_card_arn = model_card_arn_;
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     content = content_;
     model_card_status = model_card_status_;
     security_config = security_config_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     model_card_processing_status = model_card_processing_status_;
   }
    : describe_model_card_response)

let make_describe_model_card_request ?model_card_version:(model_card_version_ : integer option)
    ?included_data:(included_data_ : included_data option)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn) () =
  ({
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     included_data = included_data_;
   }
    : describe_model_card_request)

let make_model_card_export_artifacts ~s3_export_artifacts:(s3_export_artifacts_ : s3_uri) () =
  ({ s3_export_artifacts = s3_export_artifacts_ } : model_card_export_artifacts)

let make_describe_model_card_export_job_response
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?export_artifacts:(export_artifacts_ : model_card_export_artifacts option)
    ~model_card_export_job_name:(model_card_export_job_name_ : entity_name)
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn)
    ~status:(status_ : model_card_export_job_status)
    ~model_card_name:(model_card_name_ : entity_name)
    ~model_card_version:(model_card_version_ : integer)
    ~output_config:(output_config_ : model_card_export_output_config)
    ~created_at:(created_at_ : timestamp) ~last_modified_at:(last_modified_at_ : timestamp) () =
  ({
     model_card_export_job_name = model_card_export_job_name_;
     model_card_export_job_arn = model_card_export_job_arn_;
     status = status_;
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     output_config = output_config_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
     failure_reason = failure_reason_;
     export_artifacts = export_artifacts_;
   }
    : describe_model_card_export_job_response)

let make_describe_model_card_export_job_request
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn) () =
  ({ model_card_export_job_arn = model_card_export_job_arn_ }
    : describe_model_card_export_job_request)

let make_describe_model_explainability_job_definition_response
    ?model_explainability_baseline_config:
      (model_explainability_baseline_config_ : model_explainability_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~creation_time:(creation_time_ : timestamp)
    ~model_explainability_app_specification:
      (model_explainability_app_specification_ : model_explainability_app_specification)
    ~model_explainability_job_input:
      (model_explainability_job_input_ : model_explainability_job_input)
    ~model_explainability_job_output_config:
      (model_explainability_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_arn = job_definition_arn_;
     job_definition_name = job_definition_name_;
     creation_time = creation_time_;
     model_explainability_baseline_config = model_explainability_baseline_config_;
     model_explainability_app_specification = model_explainability_app_specification_;
     model_explainability_job_input = model_explainability_job_input_;
     model_explainability_job_output_config = model_explainability_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
   }
    : describe_model_explainability_job_definition_response)

let make_describe_model_explainability_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ }
    : describe_model_explainability_job_definition_request)

let make_model_package_status_item ?failure_reason:(failure_reason_ : string_ option)
    ~name:(name_ : entity_name) ~status:(status_ : detailed_model_package_status) () =
  ({ name = name_; status = status_; failure_reason = failure_reason_ } : model_package_status_item)

let make_model_package_status_details
    ?image_scan_statuses:(image_scan_statuses_ : model_package_status_item_list option)
    ~validation_statuses:(validation_statuses_ : model_package_status_item_list) () =
  ({ validation_statuses = validation_statuses_; image_scan_statuses = image_scan_statuses_ }
    : model_package_status_details)

let make_describe_model_package_output
    ?model_package_group_name:(model_package_group_name_ : entity_name option)
    ?model_package_version:(model_package_version_ : model_package_version option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?source_algorithm_specification:
      (source_algorithm_specification_ : source_algorithm_specification option)
    ?validation_specification:
      (validation_specification_ : model_package_validation_specification option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?created_by:(created_by_ : user_context option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?approval_description:(approval_description_ : approval_description option)
    ?domain:(domain_ : string_ option) ?task:(task_ : string_ option)
    ?sample_payload_url:(sample_payload_url_ : string_ option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?drift_check_baselines:(drift_check_baselines_ : drift_check_baselines option)
    ?additional_inference_specifications:
      (additional_inference_specifications_ : additional_inference_specifications option)
    ?skip_model_validation:(skip_model_validation_ : skip_model_validation option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?security_config:(security_config_ : model_package_security_config option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?managed_storage_type:(managed_storage_type_ : managed_storage_type option)
    ~model_package_name:(model_package_name_ : entity_name)
    ~model_package_arn:(model_package_arn_ : model_package_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~model_package_status:(model_package_status_ : model_package_status)
    ~model_package_status_details:(model_package_status_details_ : model_package_status_details) ()
    =
  ({
     model_package_name = model_package_name_;
     model_package_group_name = model_package_group_name_;
     model_package_version = model_package_version_;
     model_package_registration_type = model_package_registration_type_;
     model_package_arn = model_package_arn_;
     model_package_description = model_package_description_;
     creation_time = creation_time_;
     inference_specification = inference_specification_;
     source_algorithm_specification = source_algorithm_specification_;
     validation_specification = validation_specification_;
     model_package_status = model_package_status_;
     model_package_status_details = model_package_status_details_;
     certify_for_marketplace = certify_for_marketplace_;
     model_approval_status = model_approval_status_;
     created_by = created_by_;
     metadata_properties = metadata_properties_;
     model_metrics = model_metrics_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     approval_description = approval_description_;
     domain = domain_;
     task = task_;
     sample_payload_url = sample_payload_url_;
     customer_metadata_properties = customer_metadata_properties_;
     drift_check_baselines = drift_check_baselines_;
     additional_inference_specifications = additional_inference_specifications_;
     skip_model_validation = skip_model_validation_;
     source_uri = source_uri_;
     security_config = security_config_;
     model_card = model_card_;
     model_life_cycle = model_life_cycle_;
     managed_storage_type = managed_storage_type_;
   }
    : describe_model_package_output)

let make_describe_model_package_input ?included_data:(included_data_ : included_data option)
    ~model_package_name:(model_package_name_ : versioned_arn_or_name) () =
  ({ model_package_name = model_package_name_; included_data = included_data_ }
    : describe_model_package_input)

let make_describe_model_package_group_output
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ?managed_configuration:(managed_configuration_ : managed_configuration option)
    ~model_package_group_name:(model_package_group_name_ : entity_name)
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn)
    ~creation_time:(creation_time_ : creation_time) ~created_by:(created_by_ : user_context)
    ~model_package_group_status:(model_package_group_status_ : model_package_group_status) () =
  ({
     model_package_group_name = model_package_group_name_;
     model_package_group_arn = model_package_group_arn_;
     model_package_group_description = model_package_group_description_;
     creation_time = creation_time_;
     created_by = created_by_;
     model_package_group_status = model_package_group_status_;
     managed_configuration = managed_configuration_;
   }
    : describe_model_package_group_output)

let make_describe_model_package_group_input
    ~model_package_group_name:(model_package_group_name_ : arn_or_name) () =
  ({ model_package_group_name = model_package_group_name_ } : describe_model_package_group_input)

let make_describe_model_quality_job_definition_response
    ?model_quality_baseline_config:
      (model_quality_baseline_config_ : model_quality_baseline_config option)
    ?network_config:(network_config_ : monitoring_network_config option)
    ?stopping_condition:(stopping_condition_ : monitoring_stopping_condition option)
    ~job_definition_arn:(job_definition_arn_ : monitoring_job_definition_arn)
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name)
    ~creation_time:(creation_time_ : timestamp)
    ~model_quality_app_specification:
      (model_quality_app_specification_ : model_quality_app_specification)
    ~model_quality_job_input:(model_quality_job_input_ : model_quality_job_input)
    ~model_quality_job_output_config:(model_quality_job_output_config_ : monitoring_output_config)
    ~job_resources:(job_resources_ : monitoring_resources) ~role_arn:(role_arn_ : role_arn) () =
  ({
     job_definition_arn = job_definition_arn_;
     job_definition_name = job_definition_name_;
     creation_time = creation_time_;
     model_quality_baseline_config = model_quality_baseline_config_;
     model_quality_app_specification = model_quality_app_specification_;
     model_quality_job_input = model_quality_job_input_;
     model_quality_job_output_config = model_quality_job_output_config_;
     job_resources = job_resources_;
     network_config = network_config_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
   }
    : describe_model_quality_job_definition_response)

let make_describe_model_quality_job_definition_request
    ~job_definition_name:(job_definition_name_ : monitoring_job_definition_name) () =
  ({ job_definition_name = job_definition_name_ } : describe_model_quality_job_definition_request)

let make_monitoring_execution_summary
    ?processing_job_arn:(processing_job_arn_ : processing_job_arn option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~scheduled_time:(scheduled_time_ : timestamp) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~monitoring_execution_status:(monitoring_execution_status_ : execution_status) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     scheduled_time = scheduled_time_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     monitoring_execution_status = monitoring_execution_status_;
     processing_job_arn = processing_job_arn_;
     endpoint_name = endpoint_name_;
     failure_reason = failure_reason_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     monitoring_type = monitoring_type_;
   }
    : monitoring_execution_summary)

let make_describe_monitoring_schedule_response
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?last_monitoring_execution_summary:
      (last_monitoring_execution_summary_ : monitoring_execution_summary option)
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config) () =
  ({
     monitoring_schedule_arn = monitoring_schedule_arn_;
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_status = monitoring_schedule_status_;
     monitoring_type = monitoring_type_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     monitoring_schedule_config = monitoring_schedule_config_;
     endpoint_name = endpoint_name_;
     last_monitoring_execution_summary = last_monitoring_execution_summary_;
   }
    : describe_monitoring_schedule_response)

let make_describe_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : describe_monitoring_schedule_request)

let make_describe_notebook_instance_output
    ?notebook_instance_arn:(notebook_instance_arn_ : notebook_instance_arn option)
    ?notebook_instance_name:(notebook_instance_name_ : notebook_instance_name option)
    ?notebook_instance_status:(notebook_instance_status_ : notebook_instance_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?url:(url_ : notebook_instance_url option)
    ?instance_type:(instance_type_ : instance_type option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?subnet_id:(subnet_id_ : subnet_id option)
    ?security_groups:(security_groups_ : security_group_ids option)
    ?role_arn:(role_arn_ : role_arn option) ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?network_interface_id:(network_interface_id_ : network_interface_id option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?direct_internet_access:(direct_internet_access_ : direct_internet_access option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : notebook_instance_volume_size_in_g_b option)
    ?accelerator_types:(accelerator_types_ : notebook_instance_accelerator_types option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ?root_access:(root_access_ : root_access option)
    ?platform_identifier:(platform_identifier_ : platform_identifier option)
    ?instance_metadata_service_configuration:
      (instance_metadata_service_configuration_ : instance_metadata_service_configuration option) ()
    =
  ({
     notebook_instance_arn = notebook_instance_arn_;
     notebook_instance_name = notebook_instance_name_;
     notebook_instance_status = notebook_instance_status_;
     failure_reason = failure_reason_;
     url = url_;
     instance_type = instance_type_;
     ip_address_type = ip_address_type_;
     subnet_id = subnet_id_;
     security_groups = security_groups_;
     role_arn = role_arn_;
     kms_key_id = kms_key_id_;
     network_interface_id = network_interface_id_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     direct_internet_access = direct_internet_access_;
     volume_size_in_g_b = volume_size_in_g_b_;
     accelerator_types = accelerator_types_;
     default_code_repository = default_code_repository_;
     additional_code_repositories = additional_code_repositories_;
     root_access = root_access_;
     platform_identifier = platform_identifier_;
     instance_metadata_service_configuration = instance_metadata_service_configuration_;
   }
    : describe_notebook_instance_output)

let make_describe_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : describe_notebook_instance_input)

let make_describe_notebook_instance_lifecycle_config_output
    ?notebook_instance_lifecycle_config_arn:
      (notebook_instance_lifecycle_config_arn_ : notebook_instance_lifecycle_config_arn option)
    ?notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?on_create:(on_create_ : notebook_instance_lifecycle_config_list option)
    ?on_start:(on_start_ : notebook_instance_lifecycle_config_list option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option) () =
  ({
     notebook_instance_lifecycle_config_arn = notebook_instance_lifecycle_config_arn_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     on_create = on_create_;
     on_start = on_start_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
   }
    : describe_notebook_instance_lifecycle_config_output)

let make_describe_notebook_instance_lifecycle_config_input
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({ notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_ }
    : describe_notebook_instance_lifecycle_config_input)

let make_optimization_output
    ?recommended_inference_image:
      (recommended_inference_image_ : optimization_container_image option) () =
  ({ recommended_inference_image = recommended_inference_image_ } : optimization_output)

let make_describe_optimization_job_response
    ?optimization_start_time:(optimization_start_time_ : timestamp option)
    ?optimization_end_time:(optimization_end_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?optimization_environment:
      (optimization_environment_ : optimization_job_environment_variables option)
    ?max_instance_count:(max_instance_count_ : optimization_job_max_instance_count option)
    ?optimization_output:(optimization_output_ : optimization_output option)
    ?vpc_config:(vpc_config_ : optimization_vpc_config option)
    ~optimization_job_arn:(optimization_job_arn_ : optimization_job_arn)
    ~optimization_job_status:(optimization_job_status_ : optimization_job_status)
    ~creation_time:(creation_time_ : creation_time)
    ~last_modified_time:(last_modified_time_ : last_modified_time)
    ~optimization_job_name:(optimization_job_name_ : entity_name)
    ~model_source:(model_source_ : optimization_job_model_source)
    ~deployment_instance_type:
      (deployment_instance_type_ : optimization_job_deployment_instance_type)
    ~optimization_configs:(optimization_configs_ : optimization_configs)
    ~output_config:(output_config_ : optimization_job_output_config)
    ~role_arn:(role_arn_ : role_arn) ~stopping_condition:(stopping_condition_ : stopping_condition)
    () =
  ({
     optimization_job_arn = optimization_job_arn_;
     optimization_job_status = optimization_job_status_;
     optimization_start_time = optimization_start_time_;
     optimization_end_time = optimization_end_time_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     optimization_job_name = optimization_job_name_;
     model_source = model_source_;
     optimization_environment = optimization_environment_;
     deployment_instance_type = deployment_instance_type_;
     max_instance_count = max_instance_count_;
     optimization_configs = optimization_configs_;
     output_config = output_config_;
     optimization_output = optimization_output_;
     role_arn = role_arn_;
     stopping_condition = stopping_condition_;
     vpc_config = vpc_config_;
   }
    : describe_optimization_job_response)

let make_describe_optimization_job_request
    ~optimization_job_name:(optimization_job_name_ : entity_name) () =
  ({ optimization_job_name = optimization_job_name_ } : describe_optimization_job_request)

let make_error_info ?code:(code_ : non_empty_string64 option)
    ?reason:(reason_ : non_empty_string256 option) () =
  ({ code = code_; reason = reason_ } : error_info)

let make_describe_partner_app_response ?arn:(arn_ : partner_app_arn option)
    ?name:(name_ : partner_app_name option) ?type_:(type__ : partner_app_type option)
    ?status:(status_ : partner_app_status option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?base_url:(base_url_ : string2048 option)
    ?maintenance_config:(maintenance_config_ : partner_app_maintenance_config option)
    ?tier:(tier_ : non_empty_string64 option) ?version:(version_ : non_empty_string64 option)
    ?application_config:(application_config_ : partner_app_config option)
    ?auth_type:(auth_type_ : partner_app_auth_type option)
    ?enable_iam_session_based_identity:(enable_iam_session_based_identity_ : boolean_ option)
    ?error:(error_ : error_info option)
    ?enable_auto_minor_version_upgrade:(enable_auto_minor_version_upgrade_ : boolean_ option)
    ?current_version_eol_date:(current_version_eol_date_ : timestamp option)
    ?available_upgrade:(available_upgrade_ : available_upgrade option) () =
  ({
     arn = arn_;
     name = name_;
     type_ = type__;
     status = status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     execution_role_arn = execution_role_arn_;
     kms_key_id = kms_key_id_;
     base_url = base_url_;
     maintenance_config = maintenance_config_;
     tier = tier_;
     version = version_;
     application_config = application_config_;
     auth_type = auth_type_;
     enable_iam_session_based_identity = enable_iam_session_based_identity_;
     error = error_;
     enable_auto_minor_version_upgrade = enable_auto_minor_version_upgrade_;
     current_version_eol_date = current_version_eol_date_;
     available_upgrade = available_upgrade_;
   }
    : describe_partner_app_response)

let make_describe_partner_app_request
    ?include_available_upgrade:(include_available_upgrade_ : boolean_ option)
    ~arn:(arn_ : partner_app_arn) () =
  ({ arn = arn_; include_available_upgrade = include_available_upgrade_ }
    : describe_partner_app_request)

let make_describe_pipeline_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?role_arn:(role_arn_ : role_arn option)
    ?pipeline_status:(pipeline_status_ : pipeline_status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_run_time:(last_run_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option) () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_name = pipeline_name_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_definition = pipeline_definition_;
     pipeline_description = pipeline_description_;
     role_arn = role_arn_;
     pipeline_status = pipeline_status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_run_time = last_run_time_;
     created_by = created_by_;
     last_modified_by = last_modified_by_;
     parallelism_configuration = parallelism_configuration_;
     pipeline_version_display_name = pipeline_version_display_name_;
     pipeline_version_description = pipeline_version_description_;
   }
    : describe_pipeline_response)

let make_describe_pipeline_request
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn) () =
  ({ pipeline_name = pipeline_name_; pipeline_version_id = pipeline_version_id_ }
    : describe_pipeline_request)

let make_describe_pipeline_definition_for_execution_response
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({ pipeline_definition = pipeline_definition_; creation_time = creation_time_ }
    : describe_pipeline_definition_for_execution_response)

let make_describe_pipeline_definition_for_execution_request
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ }
    : describe_pipeline_definition_for_execution_request)

let make_m_lflow_configuration ?mlflow_resource_arn:(mlflow_resource_arn_ : m_lflow_arn option)
    ?mlflow_experiment_name:(mlflow_experiment_name_ : mlflow_experiment_entity_name option) () =
  ({ mlflow_resource_arn = mlflow_resource_arn_; mlflow_experiment_name = mlflow_experiment_name_ }
    : m_lflow_configuration)

let make_selected_step ~step_name:(step_name_ : string256) () =
  ({ step_name = step_name_ } : selected_step)

let make_selective_execution_config
    ?source_pipeline_execution_arn:(source_pipeline_execution_arn_ : pipeline_execution_arn option)
    ~selected_steps:(selected_steps_ : selected_step_list) () =
  ({
     source_pipeline_execution_arn = source_pipeline_execution_arn_;
     selected_steps = selected_steps_;
   }
    : selective_execution_config)

let make_pipeline_experiment_config
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?trial_name:(trial_name_ : experiment_entity_name option) () =
  ({ experiment_name = experiment_name_; trial_name = trial_name_ } : pipeline_experiment_config)

let make_describe_pipeline_execution_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_execution_status:(pipeline_execution_status_ : pipeline_execution_status option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_experiment_config:(pipeline_experiment_config_ : pipeline_experiment_config option)
    ?failure_reason:(failure_reason_ : pipeline_execution_failure_reason option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?selective_execution_config:(selective_execution_config_ : selective_execution_config option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?m_lflow_config:(m_lflow_config_ : m_lflow_configuration option) () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_execution_arn = pipeline_execution_arn_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_execution_status = pipeline_execution_status_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_experiment_config = pipeline_experiment_config_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     last_modified_by = last_modified_by_;
     parallelism_configuration = parallelism_configuration_;
     selective_execution_config = selective_execution_config_;
     pipeline_version_id = pipeline_version_id_;
     m_lflow_config = m_lflow_config_;
   }
    : describe_pipeline_execution_response)

let make_describe_pipeline_execution_request
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : describe_pipeline_execution_request)

let make_describe_processing_job_response
    ?processing_inputs:(processing_inputs_ : processing_inputs option)
    ?processing_output_config:(processing_output_config_ : processing_output_config option)
    ?stopping_condition:(stopping_condition_ : processing_stopping_condition option)
    ?environment:(environment_ : processing_environment_map option)
    ?network_config:(network_config_ : network_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?exit_message:(exit_message_ : exit_message option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?processing_end_time:(processing_end_time_ : timestamp option)
    ?processing_start_time:(processing_start_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?training_job_arn:(training_job_arn_ : training_job_arn option)
    ~processing_job_name:(processing_job_name_ : processing_job_name)
    ~processing_resources:(processing_resources_ : processing_resources)
    ~app_specification:(app_specification_ : app_specification)
    ~processing_job_arn:(processing_job_arn_ : processing_job_arn)
    ~processing_job_status:(processing_job_status_ : processing_job_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     processing_inputs = processing_inputs_;
     processing_output_config = processing_output_config_;
     processing_job_name = processing_job_name_;
     processing_resources = processing_resources_;
     stopping_condition = stopping_condition_;
     app_specification = app_specification_;
     environment = environment_;
     network_config = network_config_;
     role_arn = role_arn_;
     experiment_config = experiment_config_;
     processing_job_arn = processing_job_arn_;
     processing_job_status = processing_job_status_;
     exit_message = exit_message_;
     failure_reason = failure_reason_;
     processing_end_time = processing_end_time_;
     processing_start_time = processing_start_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     training_job_arn = training_job_arn_;
   }
    : describe_processing_job_response)

let make_describe_processing_job_request
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({ processing_job_name = processing_job_name_ } : describe_processing_job_request)

let make_template_provider_detail
    ?cfn_template_provider_detail:
      (cfn_template_provider_detail_ : cfn_template_provider_detail option) () =
  ({ cfn_template_provider_detail = cfn_template_provider_detail_ } : template_provider_detail)

let make_service_catalog_provisioned_product_details
    ?provisioned_product_id:(provisioned_product_id_ : service_catalog_entity_id option)
    ?provisioned_product_status_message:
      (provisioned_product_status_message_ : provisioned_product_status_message option) () =
  ({
     provisioned_product_id = provisioned_product_id_;
     provisioned_product_status_message = provisioned_product_status_message_;
   }
    : service_catalog_provisioned_product_details)

let make_describe_project_output
    ?project_description:(project_description_ : entity_description option)
    ?service_catalog_provisioning_details:
      (service_catalog_provisioning_details_ : service_catalog_provisioning_details option)
    ?service_catalog_provisioned_product_details:
      (service_catalog_provisioned_product_details_ :
         service_catalog_provisioned_product_details option)
    ?template_provider_details:(template_provider_details_ : template_provider_detail_list option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ~project_arn:(project_arn_ : project_arn) ~project_name:(project_name_ : project_entity_name)
    ~project_id:(project_id_ : project_id) ~project_status:(project_status_ : project_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     project_arn = project_arn_;
     project_name = project_name_;
     project_id = project_id_;
     project_description = project_description_;
     service_catalog_provisioning_details = service_catalog_provisioning_details_;
     service_catalog_provisioned_product_details = service_catalog_provisioned_product_details_;
     project_status = project_status_;
     template_provider_details = template_provider_details_;
     created_by = created_by_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
   }
    : describe_project_output)

let make_describe_project_input ~project_name:(project_name_ : project_entity_name) () =
  ({ project_name = project_name_ } : describe_project_input)

let make_ultra_server_summary ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ?available_spare_instance_count:
      (available_spare_instance_count_ : available_spare_instance_count option)
    ?unhealthy_instance_count:(unhealthy_instance_count_ : unhealthy_instance_count option)
    ~ultra_server_type:(ultra_server_type_ : ultra_server_type)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type) () =
  ({
     ultra_server_type = ultra_server_type_;
     instance_type = instance_type_;
     ultra_server_count = ultra_server_count_;
     available_spare_instance_count = available_spare_instance_count_;
     unhealthy_instance_count = unhealthy_instance_count_;
   }
    : ultra_server_summary)

let make_describe_reserved_capacity_response
    ?reserved_capacity_type:(reserved_capacity_type_ : reserved_capacity_type option)
    ?status:(status_ : reserved_capacity_status option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?duration_hours:(duration_hours_ : reserved_capacity_duration_hours option)
    ?duration_minutes:(duration_minutes_ : reserved_capacity_duration_minutes option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?ultra_server_summary:(ultra_server_summary_ : ultra_server_summary option)
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~total_instance_count:(total_instance_count_ : total_instance_count) () =
  ({
     reserved_capacity_arn = reserved_capacity_arn_;
     reserved_capacity_type = reserved_capacity_type_;
     status = status_;
     availability_zone = availability_zone_;
     duration_hours = duration_hours_;
     duration_minutes = duration_minutes_;
     start_time = start_time_;
     end_time = end_time_;
     instance_type = instance_type_;
     total_instance_count = total_instance_count_;
     available_instance_count = available_instance_count_;
     in_use_instance_count = in_use_instance_count_;
     ultra_server_summary = ultra_server_summary_;
   }
    : describe_reserved_capacity_response)

let make_describe_reserved_capacity_request
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn) () =
  ({ reserved_capacity_arn = reserved_capacity_arn_ } : describe_reserved_capacity_request)

let make_describe_space_response ?domain_id:(domain_id_ : domain_id option)
    ?space_arn:(space_arn_ : space_arn option) ?space_name:(space_name_ : space_name option)
    ?home_efs_file_system_uid:(home_efs_file_system_uid_ : efs_uid option)
    ?status:(status_ : space_status option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?space_settings:(space_settings_ : space_settings option)
    ?ownership_settings:(ownership_settings_ : ownership_settings option)
    ?space_sharing_settings:(space_sharing_settings_ : space_sharing_settings option)
    ?space_display_name:(space_display_name_ : non_empty_string64 option)
    ?url:(url_ : string1024 option) () =
  ({
     domain_id = domain_id_;
     space_arn = space_arn_;
     space_name = space_name_;
     home_efs_file_system_uid = home_efs_file_system_uid_;
     status = status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     space_settings = space_settings_;
     ownership_settings = ownership_settings_;
     space_sharing_settings = space_sharing_settings_;
     space_display_name = space_display_name_;
     url = url_;
   }
    : describe_space_response)

let make_describe_space_request ~domain_id:(domain_id_ : domain_id)
    ~space_name:(space_name_ : space_name) () =
  ({ domain_id = domain_id_; space_name = space_name_ } : describe_space_request)

let make_describe_studio_lifecycle_config_response
    ?studio_lifecycle_config_arn:(studio_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    ?studio_lifecycle_config_name:
      (studio_lifecycle_config_name_ : studio_lifecycle_config_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?studio_lifecycle_config_content:
      (studio_lifecycle_config_content_ : studio_lifecycle_config_content option)
    ?studio_lifecycle_config_app_type:
      (studio_lifecycle_config_app_type_ : studio_lifecycle_config_app_type option) () =
  ({
     studio_lifecycle_config_arn = studio_lifecycle_config_arn_;
     studio_lifecycle_config_name = studio_lifecycle_config_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     studio_lifecycle_config_content = studio_lifecycle_config_content_;
     studio_lifecycle_config_app_type = studio_lifecycle_config_app_type_;
   }
    : describe_studio_lifecycle_config_response)

let make_describe_studio_lifecycle_config_request
    ~studio_lifecycle_config_name:(studio_lifecycle_config_name_ : studio_lifecycle_config_name) ()
    =
  ({ studio_lifecycle_config_name = studio_lifecycle_config_name_ }
    : describe_studio_lifecycle_config_request)

let make_subscribed_workteam ?marketplace_title:(marketplace_title_ : string200 option)
    ?seller_name:(seller_name_ : string_ option)
    ?marketplace_description:(marketplace_description_ : string200 option)
    ?listing_id:(listing_id_ : string_ option) ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({
     workteam_arn = workteam_arn_;
     marketplace_title = marketplace_title_;
     seller_name = seller_name_;
     marketplace_description = marketplace_description_;
     listing_id = listing_id_;
   }
    : subscribed_workteam)

let make_describe_subscribed_workteam_response
    ~subscribed_workteam:(subscribed_workteam_ : subscribed_workteam) () =
  ({ subscribed_workteam = subscribed_workteam_ } : describe_subscribed_workteam_response)

let make_describe_subscribed_workteam_request ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({ workteam_arn = workteam_arn_ } : describe_subscribed_workteam_request)

let make_training_progress_info
    ?total_step_count_per_epoch:(total_step_count_per_epoch_ : total_step_count_per_epoch option)
    ?current_step:(current_step_ : training_step_index option)
    ?current_epoch:(current_epoch_ : training_epoch_index option)
    ?max_epoch:(max_epoch_ : training_epoch_count option) () =
  ({
     total_step_count_per_epoch = total_step_count_per_epoch_;
     current_step = current_step_;
     current_epoch = current_epoch_;
     max_epoch = max_epoch_;
   }
    : training_progress_info)

let make_mlflow_details ?mlflow_experiment_id:(mlflow_experiment_id_ : mlflow_experiment_id option)
    ?mlflow_run_id:(mlflow_run_id_ : mlflow_run_id option) () =
  ({ mlflow_experiment_id = mlflow_experiment_id_; mlflow_run_id = mlflow_run_id_ }
    : mlflow_details)

let make_profiler_rule_evaluation_status
    ?rule_configuration_name:(rule_configuration_name_ : rule_configuration_name option)
    ?rule_evaluation_job_arn:(rule_evaluation_job_arn_ : processing_job_arn option)
    ?rule_evaluation_status:(rule_evaluation_status_ : rule_evaluation_status option)
    ?status_details:(status_details_ : status_details option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     rule_configuration_name = rule_configuration_name_;
     rule_evaluation_job_arn = rule_evaluation_job_arn_;
     rule_evaluation_status = rule_evaluation_status_;
     status_details = status_details_;
     last_modified_time = last_modified_time_;
   }
    : profiler_rule_evaluation_status)

let make_metric_data ?metric_name:(metric_name_ : metric_name option)
    ?value:(value_ : float_ option) ?timestamp:(timestamp_ : timestamp option) () =
  ({ metric_name = metric_name_; value = value_; timestamp = timestamp_ } : metric_data)

let make_secondary_status_transition ?end_time:(end_time_ : timestamp option)
    ?status_message:(status_message_ : status_message option) ~status:(status_ : secondary_status)
    ~start_time:(start_time_ : timestamp) () =
  ({
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     status_message = status_message_;
   }
    : secondary_status_transition)

let make_warm_pool_status
    ?resource_retained_billable_time_in_seconds:
      (resource_retained_billable_time_in_seconds_ :
         resource_retained_billable_time_in_seconds option)
    ?reused_by_job:(reused_by_job_ : training_job_name option)
    ~status:(status_ : warm_pool_resource_status) () =
  ({
     status = status_;
     resource_retained_billable_time_in_seconds = resource_retained_billable_time_in_seconds_;
     reused_by_job = reused_by_job_;
   }
    : warm_pool_status)

let make_describe_training_job_response
    ?tuning_job_arn:(tuning_job_arn_ : hyper_parameter_tuning_job_arn option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ?algorithm_specification:(algorithm_specification_ : algorithm_specification option)
    ?role_arn:(role_arn_ : role_arn option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?resource_config:(resource_config_ : resource_config option)
    ?warm_pool_status:(warm_pool_status_ : warm_pool_status option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?secondary_status_transitions:
      (secondary_status_transitions_ : secondary_status_transitions option)
    ?final_metric_data_list:(final_metric_data_list_ : final_metric_data_list option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?training_time_in_seconds:(training_time_in_seconds_ : training_time_in_seconds option)
    ?billable_time_in_seconds:(billable_time_in_seconds_ : billable_time_in_seconds option)
    ?billable_token_count:(billable_token_count_ : billable_token_count option)
    ?debug_hook_config:(debug_hook_config_ : debug_hook_config option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?debug_rule_configurations:(debug_rule_configurations_ : debug_rule_configurations option)
    ?tensor_board_output_config:(tensor_board_output_config_ : tensor_board_output_config option)
    ?debug_rule_evaluation_statuses:
      (debug_rule_evaluation_statuses_ : debug_rule_evaluation_statuses option)
    ?profiler_config:(profiler_config_ : profiler_config option)
    ?profiler_rule_configurations:
      (profiler_rule_configurations_ : profiler_rule_configurations option)
    ?profiler_rule_evaluation_statuses:
      (profiler_rule_evaluation_statuses_ : profiler_rule_evaluation_statuses option)
    ?profiling_status:(profiling_status_ : profiling_status option)
    ?environment:(environment_ : training_environment_map option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option)
    ?remote_debug_config:(remote_debug_config_ : remote_debug_config option)
    ?infra_check_config:(infra_check_config_ : infra_check_config option)
    ?serverless_job_config:(serverless_job_config_ : serverless_job_config option)
    ?mlflow_config:(mlflow_config_ : mlflow_config option)
    ?model_package_config:(model_package_config_ : model_package_config option)
    ?mlflow_details:(mlflow_details_ : mlflow_details option)
    ?progress_info:(progress_info_ : training_progress_info option)
    ?output_model_package_arn:(output_model_package_arn_ : model_package_arn option)
    ~training_job_name:(training_job_name_ : training_job_name)
    ~training_job_arn:(training_job_arn_ : training_job_arn)
    ~model_artifacts:(model_artifacts_ : model_artifacts)
    ~training_job_status:(training_job_status_ : training_job_status)
    ~secondary_status:(secondary_status_ : secondary_status)
    ~stopping_condition:(stopping_condition_ : stopping_condition)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     training_job_name = training_job_name_;
     training_job_arn = training_job_arn_;
     tuning_job_arn = tuning_job_arn_;
     labeling_job_arn = labeling_job_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     model_artifacts = model_artifacts_;
     training_job_status = training_job_status_;
     secondary_status = secondary_status_;
     failure_reason = failure_reason_;
     hyper_parameters = hyper_parameters_;
     algorithm_specification = algorithm_specification_;
     role_arn = role_arn_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     resource_config = resource_config_;
     warm_pool_status = warm_pool_status_;
     vpc_config = vpc_config_;
     stopping_condition = stopping_condition_;
     creation_time = creation_time_;
     training_start_time = training_start_time_;
     training_end_time = training_end_time_;
     last_modified_time = last_modified_time_;
     secondary_status_transitions = secondary_status_transitions_;
     final_metric_data_list = final_metric_data_list_;
     enable_network_isolation = enable_network_isolation_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_managed_spot_training = enable_managed_spot_training_;
     checkpoint_config = checkpoint_config_;
     training_time_in_seconds = training_time_in_seconds_;
     billable_time_in_seconds = billable_time_in_seconds_;
     billable_token_count = billable_token_count_;
     debug_hook_config = debug_hook_config_;
     experiment_config = experiment_config_;
     debug_rule_configurations = debug_rule_configurations_;
     tensor_board_output_config = tensor_board_output_config_;
     debug_rule_evaluation_statuses = debug_rule_evaluation_statuses_;
     profiler_config = profiler_config_;
     profiler_rule_configurations = profiler_rule_configurations_;
     profiler_rule_evaluation_statuses = profiler_rule_evaluation_statuses_;
     profiling_status = profiling_status_;
     environment = environment_;
     retry_strategy = retry_strategy_;
     remote_debug_config = remote_debug_config_;
     infra_check_config = infra_check_config_;
     serverless_job_config = serverless_job_config_;
     mlflow_config = mlflow_config_;
     model_package_config = model_package_config_;
     mlflow_details = mlflow_details_;
     progress_info = progress_info_;
     output_model_package_arn = output_model_package_arn_;
   }
    : describe_training_job_response)

let make_describe_training_job_request ~training_job_name:(training_job_name_ : training_job_name)
    () =
  ({ training_job_name = training_job_name_ } : describe_training_job_request)

let make_reserved_capacity_summary
    ?reserved_capacity_type:(reserved_capacity_type_ : reserved_capacity_type option)
    ?ultra_server_type:(ultra_server_type_ : ultra_server_type option)
    ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?availability_zone_id:(availability_zone_id_ : availability_zone_id option)
    ?duration_hours:(duration_hours_ : reserved_capacity_duration_hours option)
    ?duration_minutes:(duration_minutes_ : reserved_capacity_duration_minutes option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~total_instance_count:(total_instance_count_ : total_instance_count)
    ~status:(status_ : reserved_capacity_status) () =
  ({
     reserved_capacity_arn = reserved_capacity_arn_;
     reserved_capacity_type = reserved_capacity_type_;
     ultra_server_type = ultra_server_type_;
     ultra_server_count = ultra_server_count_;
     instance_type = instance_type_;
     total_instance_count = total_instance_count_;
     status = status_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     duration_hours = duration_hours_;
     duration_minutes = duration_minutes_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : reserved_capacity_summary)

let make_describe_training_plan_response
    ?status_message:(status_message_ : training_plan_status_message option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours option)
    ?duration_minutes:(duration_minutes_ : training_plan_duration_minutes option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?currency_code:(currency_code_ : currency_code option)
    ?total_instance_count:(total_instance_count_ : total_instance_count option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?unhealthy_instance_count:(unhealthy_instance_count_ : unhealthy_instance_count option)
    ?available_spare_instance_count:
      (available_spare_instance_count_ : available_spare_instance_count option)
    ?total_ultra_server_count:(total_ultra_server_count_ : ultra_server_count option)
    ?target_resources:(target_resources_ : sage_maker_resource_names option)
    ?reserved_capacity_summaries:(reserved_capacity_summaries_ : reserved_capacity_summaries option)
    ~training_plan_arn:(training_plan_arn_ : training_plan_arn)
    ~training_plan_name:(training_plan_name_ : training_plan_name)
    ~status:(status_ : training_plan_status) () =
  ({
     training_plan_arn = training_plan_arn_;
     training_plan_name = training_plan_name_;
     status = status_;
     status_message = status_message_;
     duration_hours = duration_hours_;
     duration_minutes = duration_minutes_;
     start_time = start_time_;
     end_time = end_time_;
     upfront_fee = upfront_fee_;
     currency_code = currency_code_;
     total_instance_count = total_instance_count_;
     available_instance_count = available_instance_count_;
     in_use_instance_count = in_use_instance_count_;
     unhealthy_instance_count = unhealthy_instance_count_;
     available_spare_instance_count = available_spare_instance_count_;
     total_ultra_server_count = total_ultra_server_count_;
     target_resources = target_resources_;
     reserved_capacity_summaries = reserved_capacity_summaries_;
   }
    : describe_training_plan_response)

let make_describe_training_plan_request
    ~training_plan_name:(training_plan_name_ : training_plan_name) () =
  ({ training_plan_name = training_plan_name_ } : describe_training_plan_request)

let make_training_plan_extension ?extended_at:(extended_at_ : timestamp option)
    ?start_date:(start_date_ : timestamp option) ?end_date:(end_date_ : timestamp option)
    ?status:(status_ : string256 option) ?payment_status:(payment_status_ : string256 option)
    ?availability_zone:(availability_zone_ : string256 option)
    ?availability_zone_id:(availability_zone_id_ : availability_zone_id option)
    ?duration_hours:(duration_hours_ : training_plan_extension_duration_hours option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?currency_code:(currency_code_ : currency_code option)
    ~training_plan_extension_offering_id:
      (training_plan_extension_offering_id_ : training_plan_extension_offering_id) () =
  ({
     training_plan_extension_offering_id = training_plan_extension_offering_id_;
     extended_at = extended_at_;
     start_date = start_date_;
     end_date = end_date_;
     status = status_;
     payment_status = payment_status_;
     availability_zone = availability_zone_;
     availability_zone_id = availability_zone_id_;
     duration_hours = duration_hours_;
     upfront_fee = upfront_fee_;
     currency_code = currency_code_;
   }
    : training_plan_extension)

let make_describe_training_plan_extension_history_response
    ?next_token:(next_token_ : next_token option)
    ~training_plan_extensions:(training_plan_extensions_ : training_plan_extensions) () =
  ({ training_plan_extensions = training_plan_extensions_; next_token = next_token_ }
    : describe_training_plan_extension_history_response)

let make_describe_training_plan_extension_history_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~training_plan_arn:(training_plan_arn_ : training_plan_arn) () =
  ({ training_plan_arn = training_plan_arn_; next_token = next_token_; max_results = max_results_ }
    : describe_training_plan_extension_history_request)

let make_describe_transform_job_response ?failure_reason:(failure_reason_ : failure_reason option)
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ?model_client_config:(model_client_config_ : model_client_config option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?environment:(environment_ : transform_environment_map option)
    ?transform_output:(transform_output_ : transform_output option)
    ?data_capture_config:(data_capture_config_ : batch_data_capture_config option)
    ?transform_start_time:(transform_start_time_ : timestamp option)
    ?transform_end_time:(transform_end_time_ : timestamp option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?data_processing:(data_processing_ : data_processing option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ~transform_job_name:(transform_job_name_ : transform_job_name)
    ~transform_job_arn:(transform_job_arn_ : transform_job_arn)
    ~transform_job_status:(transform_job_status_ : transform_job_status)
    ~model_name:(model_name_ : model_name) ~transform_input:(transform_input_ : transform_input)
    ~transform_resources:(transform_resources_ : transform_resources)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     transform_job_name = transform_job_name_;
     transform_job_arn = transform_job_arn_;
     transform_job_status = transform_job_status_;
     failure_reason = failure_reason_;
     model_name = model_name_;
     max_concurrent_transforms = max_concurrent_transforms_;
     model_client_config = model_client_config_;
     max_payload_in_m_b = max_payload_in_m_b_;
     batch_strategy = batch_strategy_;
     environment = environment_;
     transform_input = transform_input_;
     transform_output = transform_output_;
     data_capture_config = data_capture_config_;
     transform_resources = transform_resources_;
     creation_time = creation_time_;
     transform_start_time = transform_start_time_;
     transform_end_time = transform_end_time_;
     labeling_job_arn = labeling_job_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     data_processing = data_processing_;
     experiment_config = experiment_config_;
   }
    : describe_transform_job_response)

let make_describe_transform_job_request
    ~transform_job_name:(transform_job_name_ : transform_job_name) () =
  ({ transform_job_name = transform_job_name_ } : describe_transform_job_request)

let make_trial_source ?source_type:(source_type_ : source_type option)
    ~source_arn:(source_arn_ : trial_source_arn) () =
  ({ source_arn = source_arn_; source_type = source_type_ } : trial_source)

let make_describe_trial_response ?trial_name:(trial_name_ : experiment_entity_name option)
    ?trial_arn:(trial_arn_ : trial_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?source:(source_ : trial_source option) ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option) () =
  ({
     trial_name = trial_name_;
     trial_arn = trial_arn_;
     display_name = display_name_;
     experiment_name = experiment_name_;
     source = source_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     metadata_properties = metadata_properties_;
   }
    : describe_trial_response)

let make_describe_trial_request ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ trial_name = trial_name_ } : describe_trial_request)

let make_trial_component_source ?source_type:(source_type_ : source_type option)
    ~source_arn:(source_arn_ : trial_component_source_arn) () =
  ({ source_arn = source_arn_; source_type = source_type_ } : trial_component_source)

let make_trial_component_metric_summary ?metric_name:(metric_name_ : metric_name option)
    ?source_arn:(source_arn_ : trial_component_source_arn option)
    ?time_stamp:(time_stamp_ : timestamp option) ?max:(max_ : optional_double option)
    ?min:(min_ : optional_double option) ?last:(last_ : optional_double option)
    ?count:(count_ : optional_integer option) ?avg:(avg_ : optional_double option)
    ?std_dev:(std_dev_ : optional_double option) () =
  ({
     metric_name = metric_name_;
     source_arn = source_arn_;
     time_stamp = time_stamp_;
     max = max_;
     min = min_;
     last = last_;
     count = count_;
     avg = avg_;
     std_dev = std_dev_;
   }
    : trial_component_metric_summary)

let make_describe_trial_component_response
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?source:(source_ : trial_component_source option)
    ?status:(status_ : trial_component_status option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?metrics:(metrics_ : trial_component_metric_summaries option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?sources:(sources_ : trial_component_sources option) () =
  ({
     trial_component_name = trial_component_name_;
     trial_component_arn = trial_component_arn_;
     display_name = display_name_;
     source = source_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     parameters = parameters_;
     input_artifacts = input_artifacts_;
     output_artifacts = output_artifacts_;
     metadata_properties = metadata_properties_;
     metrics = metrics_;
     lineage_group_arn = lineage_group_arn_;
     sources = sources_;
   }
    : describe_trial_component_response)

let make_describe_trial_component_request
    ~trial_component_name:(trial_component_name_ : experiment_entity_name_or_arn) () =
  ({ trial_component_name = trial_component_name_ } : describe_trial_component_request)

let make_describe_user_profile_response ?domain_id:(domain_id_ : domain_id option)
    ?user_profile_arn:(user_profile_arn_ : user_profile_arn option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?home_efs_file_system_uid:(home_efs_file_system_uid_ : efs_uid option)
    ?status:(status_ : user_profile_status option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?creation_time:(creation_time_ : creation_time option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?single_sign_on_user_identifier:
      (single_sign_on_user_identifier_ : single_sign_on_user_identifier option)
    ?single_sign_on_user_value:(single_sign_on_user_value_ : string256 option)
    ?user_settings:(user_settings_ : user_settings option) () =
  ({
     domain_id = domain_id_;
     user_profile_arn = user_profile_arn_;
     user_profile_name = user_profile_name_;
     home_efs_file_system_uid = home_efs_file_system_uid_;
     status = status_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     single_sign_on_user_identifier = single_sign_on_user_identifier_;
     single_sign_on_user_value = single_sign_on_user_value_;
     user_settings = user_settings_;
   }
    : describe_user_profile_response)

let make_describe_user_profile_request ~domain_id:(domain_id_ : domain_id)
    ~user_profile_name:(user_profile_name_ : user_profile_name) () =
  ({ domain_id = domain_id_; user_profile_name = user_profile_name_ }
    : describe_user_profile_request)

let make_workforce_vpc_config_response
    ?vpc_endpoint_id:(vpc_endpoint_id_ : workforce_vpc_endpoint_id option)
    ~vpc_id:(vpc_id_ : workforce_vpc_id)
    ~security_group_ids:(security_group_ids_ : workforce_security_group_ids)
    ~subnets:(subnets_ : workforce_subnets) () =
  ({
     vpc_id = vpc_id_;
     security_group_ids = security_group_ids_;
     subnets = subnets_;
     vpc_endpoint_id = vpc_endpoint_id_;
   }
    : workforce_vpc_config_response)

let make_oidc_config_for_response ?client_id:(client_id_ : client_id option)
    ?issuer:(issuer_ : oidc_endpoint option)
    ?authorization_endpoint:(authorization_endpoint_ : oidc_endpoint option)
    ?token_endpoint:(token_endpoint_ : oidc_endpoint option)
    ?user_info_endpoint:(user_info_endpoint_ : oidc_endpoint option)
    ?logout_endpoint:(logout_endpoint_ : oidc_endpoint option)
    ?jwks_uri:(jwks_uri_ : oidc_endpoint option) ?scope:(scope_ : scope option)
    ?authentication_request_extra_params:
      (authentication_request_extra_params_ : authentication_request_extra_params option) () =
  ({
     client_id = client_id_;
     issuer = issuer_;
     authorization_endpoint = authorization_endpoint_;
     token_endpoint = token_endpoint_;
     user_info_endpoint = user_info_endpoint_;
     logout_endpoint = logout_endpoint_;
     jwks_uri = jwks_uri_;
     scope = scope_;
     authentication_request_extra_params = authentication_request_extra_params_;
   }
    : oidc_config_for_response)

let make_workforce ?last_updated_date:(last_updated_date_ : timestamp option)
    ?source_ip_config:(source_ip_config_ : source_ip_config option)
    ?sub_domain:(sub_domain_ : string_ option)
    ?cognito_config:(cognito_config_ : cognito_config option)
    ?oidc_config:(oidc_config_ : oidc_config_for_response option)
    ?create_date:(create_date_ : timestamp option)
    ?workforce_vpc_config:(workforce_vpc_config_ : workforce_vpc_config_response option)
    ?status:(status_ : workforce_status option)
    ?failure_reason:(failure_reason_ : workforce_failure_reason option)
    ?ip_address_type:(ip_address_type_ : workforce_ip_address_type option)
    ~workforce_name:(workforce_name_ : workforce_name)
    ~workforce_arn:(workforce_arn_ : workforce_arn) () =
  ({
     workforce_name = workforce_name_;
     workforce_arn = workforce_arn_;
     last_updated_date = last_updated_date_;
     source_ip_config = source_ip_config_;
     sub_domain = sub_domain_;
     cognito_config = cognito_config_;
     oidc_config = oidc_config_;
     create_date = create_date_;
     workforce_vpc_config = workforce_vpc_config_;
     status = status_;
     failure_reason = failure_reason_;
     ip_address_type = ip_address_type_;
   }
    : workforce)

let make_describe_workforce_response ~workforce:(workforce_ : workforce) () =
  ({ workforce = workforce_ } : describe_workforce_response)

let make_describe_workforce_request ~workforce_name:(workforce_name_ : workforce_name) () =
  ({ workforce_name = workforce_name_ } : describe_workforce_request)

let make_workteam ?workforce_arn:(workforce_arn_ : workforce_arn option)
    ?product_listing_ids:(product_listing_ids_ : product_listings option)
    ?sub_domain:(sub_domain_ : string_ option) ?create_date:(create_date_ : timestamp option)
    ?last_updated_date:(last_updated_date_ : timestamp option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?worker_access_configuration:(worker_access_configuration_ : worker_access_configuration option)
    ~workteam_name:(workteam_name_ : workteam_name)
    ~member_definitions:(member_definitions_ : member_definitions)
    ~workteam_arn:(workteam_arn_ : workteam_arn) ~description:(description_ : string200) () =
  ({
     workteam_name = workteam_name_;
     member_definitions = member_definitions_;
     workteam_arn = workteam_arn_;
     workforce_arn = workforce_arn_;
     product_listing_ids = product_listing_ids_;
     description = description_;
     sub_domain = sub_domain_;
     create_date = create_date_;
     last_updated_date = last_updated_date_;
     notification_configuration = notification_configuration_;
     worker_access_configuration = worker_access_configuration_;
   }
    : workteam)

let make_describe_workteam_response ~workteam:(workteam_ : workteam) () =
  ({ workteam = workteam_ } : describe_workteam_response)

let make_describe_workteam_request ~workteam_name:(workteam_name_ : workteam_name) () =
  ({ workteam_name = workteam_name_ } : describe_workteam_request)

let make_production_variant_serverless_update_config
    ?max_concurrency:(max_concurrency_ : serverless_max_concurrency option)
    ?provisioned_concurrency:(provisioned_concurrency_ : serverless_provisioned_concurrency option)
    () =
  ({ max_concurrency = max_concurrency_; provisioned_concurrency = provisioned_concurrency_ }
    : production_variant_serverless_update_config)

let make_desired_weight_and_capacity ?desired_weight:(desired_weight_ : variant_weight option)
    ?desired_instance_count:(desired_instance_count_ : task_count option)
    ?serverless_update_config:
      (serverless_update_config_ : production_variant_serverless_update_config option)
    ~variant_name:(variant_name_ : variant_name) () =
  ({
     variant_name = variant_name_;
     desired_weight = desired_weight_;
     desired_instance_count = desired_instance_count_;
     serverless_update_config = serverless_update_config_;
   }
    : desired_weight_and_capacity)

let make_detach_cluster_node_volume_response ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~node_id:(node_id_ : cluster_node_id) ~volume_id:(volume_id_ : volume_id)
    ~attach_time:(attach_time_ : timestamp) ~status:(status_ : volume_attachment_status)
    ~device_name:(device_name_ : volume_device_name) () =
  ({
     cluster_arn = cluster_arn_;
     node_id = node_id_;
     volume_id = volume_id_;
     attach_time = attach_time_;
     status = status_;
     device_name = device_name_;
   }
    : detach_cluster_node_volume_response)

let make_detach_cluster_node_volume_request ~cluster_arn:(cluster_arn_ : cluster_arn)
    ~node_id:(node_id_ : cluster_node_id) ~volume_id:(volume_id_ : volume_id) () =
  ({ cluster_arn = cluster_arn_; node_id = node_id_; volume_id = volume_id_ }
    : detach_cluster_node_volume_request)

let make_device ?description:(description_ : device_description option)
    ?iot_thing_name:(iot_thing_name_ : thing_name option) ~device_name:(device_name_ : device_name)
    () =
  ({ device_name = device_name_; description = description_; iot_thing_name = iot_thing_name_ }
    : device)

let make_device_deployment_summary ?deployed_stage_name:(deployed_stage_name_ : entity_name option)
    ?device_fleet_name:(device_fleet_name_ : entity_name option)
    ?device_deployment_status:(device_deployment_status_ : device_deployment_status option)
    ?device_deployment_status_message:(device_deployment_status_message_ : string_ option)
    ?description:(description_ : device_description option)
    ?deployment_start_time:(deployment_start_time_ : timestamp option)
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~stage_name:(stage_name_ : entity_name) ~device_name:(device_name_ : device_name)
    ~device_arn:(device_arn_ : device_arn) () =
  ({
     edge_deployment_plan_arn = edge_deployment_plan_arn_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     stage_name = stage_name_;
     deployed_stage_name = deployed_stage_name_;
     device_fleet_name = device_fleet_name_;
     device_name = device_name_;
     device_arn = device_arn_;
     device_deployment_status = device_deployment_status_;
     device_deployment_status_message = device_deployment_status_message_;
     description = description_;
     deployment_start_time = deployment_start_time_;
   }
    : device_deployment_summary)

let make_device_fleet_summary ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ~device_fleet_arn:(device_fleet_arn_ : device_fleet_arn)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({
     device_fleet_arn = device_fleet_arn_;
     device_fleet_name = device_fleet_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : device_fleet_summary)

let make_device_stats ~connected_device_count:(connected_device_count_ : long)
    ~registered_device_count:(registered_device_count_ : long) () =
  ({
     connected_device_count = connected_device_count_;
     registered_device_count = registered_device_count_;
   }
    : device_stats)

let make_edge_model_summary ~model_name:(model_name_ : entity_name)
    ~model_version:(model_version_ : edge_version) () =
  ({ model_name = model_name_; model_version = model_version_ } : edge_model_summary)

let make_device_summary ?description:(description_ : device_description option)
    ?device_fleet_name:(device_fleet_name_ : entity_name option)
    ?iot_thing_name:(iot_thing_name_ : thing_name option)
    ?registration_time:(registration_time_ : timestamp option)
    ?latest_heartbeat:(latest_heartbeat_ : timestamp option)
    ?models:(models_ : edge_model_summaries option)
    ?agent_version:(agent_version_ : edge_version option) ~device_name:(device_name_ : entity_name)
    ~device_arn:(device_arn_ : device_arn) () =
  ({
     device_name = device_name_;
     device_arn = device_arn_;
     description = description_;
     device_fleet_name = device_fleet_name_;
     iot_thing_name = iot_thing_name_;
     registration_time = registration_time_;
     latest_heartbeat = latest_heartbeat_;
     models = models_;
     agent_version = agent_version_;
   }
    : device_summary)

let make_disable_sagemaker_servicecatalog_portfolio_output () = (() : unit)
let make_disable_sagemaker_servicecatalog_portfolio_input () = (() : unit)

let make_disassociate_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_component_arn = trial_component_arn_; trial_arn = trial_arn_ }
    : disassociate_trial_component_response)

let make_disassociate_trial_component_request
    ~trial_component_name:(trial_component_name_ : experiment_entity_name)
    ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ trial_component_name = trial_component_name_; trial_name = trial_name_ }
    : disassociate_trial_component_request)

let make_domain_details ?domain_arn:(domain_arn_ : domain_arn option)
    ?domain_id:(domain_id_ : domain_id option) ?domain_name:(domain_name_ : domain_name option)
    ?status:(status_ : domain_status option) ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?url:(url_ : string1024 option) () =
  ({
     domain_arn = domain_arn_;
     domain_id = domain_id_;
     domain_name = domain_name_;
     status = status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     url = url_;
   }
    : domain_details)

let make_r_studio_server_pro_domain_settings_for_update
    ?default_resource_spec:(default_resource_spec_ : resource_spec option)
    ?r_studio_connect_url:(r_studio_connect_url_ : string_ option)
    ?r_studio_package_manager_url:(r_studio_package_manager_url_ : string_ option)
    ~domain_execution_role_arn:(domain_execution_role_arn_ : role_arn) () =
  ({
     domain_execution_role_arn = domain_execution_role_arn_;
     default_resource_spec = default_resource_spec_;
     r_studio_connect_url = r_studio_connect_url_;
     r_studio_package_manager_url = r_studio_package_manager_url_;
   }
    : r_studio_server_pro_domain_settings_for_update)

let make_domain_settings_for_update
    ?r_studio_server_pro_domain_settings_for_update:
      (r_studio_server_pro_domain_settings_for_update_ :
         r_studio_server_pro_domain_settings_for_update option)
    ?execution_role_identity_config:
      (execution_role_identity_config_ : execution_role_identity_config option)
    ?security_group_ids:(security_group_ids_ : domain_security_group_ids option)
    ?trusted_identity_propagation_settings:
      (trusted_identity_propagation_settings_ : trusted_identity_propagation_settings option)
    ?docker_settings:(docker_settings_ : docker_settings option)
    ?amazon_q_settings:(amazon_q_settings_ : amazon_q_settings option)
    ?unified_studio_settings:(unified_studio_settings_ : unified_studio_settings option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option) () =
  ({
     r_studio_server_pro_domain_settings_for_update =
       r_studio_server_pro_domain_settings_for_update_;
     execution_role_identity_config = execution_role_identity_config_;
     security_group_ids = security_group_ids_;
     trusted_identity_propagation_settings = trusted_identity_propagation_settings_;
     docker_settings = docker_settings_;
     amazon_q_settings = amazon_q_settings_;
     unified_studio_settings = unified_studio_settings_;
     ip_address_type = ip_address_type_;
   }
    : domain_settings_for_update)

let make_predefined_metric_specification
    ?predefined_metric_type:(predefined_metric_type_ : string_ option) () =
  ({ predefined_metric_type = predefined_metric_type_ } : predefined_metric_specification)

let make_target_tracking_scaling_policy_configuration
    ?metric_specification:(metric_specification_ : metric_specification option)
    ?target_value:(target_value_ : double option) () =
  ({ metric_specification = metric_specification_; target_value = target_value_ }
    : target_tracking_scaling_policy_configuration)

let make_dynamic_scaling_configuration ?min_capacity:(min_capacity_ : integer option)
    ?max_capacity:(max_capacity_ : integer option)
    ?scale_in_cooldown:(scale_in_cooldown_ : integer option)
    ?scale_out_cooldown:(scale_out_cooldown_ : integer option)
    ?scaling_policies:(scaling_policies_ : scaling_policies option) () =
  ({
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
     scale_in_cooldown = scale_in_cooldown_;
     scale_out_cooldown = scale_out_cooldown_;
     scaling_policies = scaling_policies_;
   }
    : dynamic_scaling_configuration)

let make_emr_step_metadata ?cluster_id:(cluster_id_ : string256 option)
    ?step_id:(step_id_ : string256 option) ?step_name:(step_name_ : string256 option)
    ?log_file_path:(log_file_path_ : string1024 option) () =
  ({
     cluster_id = cluster_id_;
     step_id = step_id_;
     step_name = step_name_;
     log_file_path = log_file_path_;
   }
    : emr_step_metadata)

let make_edge ?source_arn:(source_arn_ : association_entity_arn option)
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?association_type:(association_type_ : association_edge_type option) () =
  ({
     source_arn = source_arn_;
     destination_arn = destination_arn_;
     association_type = association_type_;
   }
    : edge)

let make_edge_deployment_plan_summary ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ~edge_deployment_plan_arn:(edge_deployment_plan_arn_ : edge_deployment_plan_arn)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~edge_deployment_success:(edge_deployment_success_ : integer)
    ~edge_deployment_pending:(edge_deployment_pending_ : integer)
    ~edge_deployment_failed:(edge_deployment_failed_ : integer) () =
  ({
     edge_deployment_plan_arn = edge_deployment_plan_arn_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     device_fleet_name = device_fleet_name_;
     edge_deployment_success = edge_deployment_success_;
     edge_deployment_pending = edge_deployment_pending_;
     edge_deployment_failed = edge_deployment_failed_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : edge_deployment_plan_summary)

let make_edge_model_stat ~model_name:(model_name_ : entity_name)
    ~model_version:(model_version_ : edge_version)
    ~offline_device_count:(offline_device_count_ : long)
    ~connected_device_count:(connected_device_count_ : long)
    ~active_device_count:(active_device_count_ : long)
    ~sampling_device_count:(sampling_device_count_ : long) () =
  ({
     model_name = model_name_;
     model_version = model_version_;
     offline_device_count = offline_device_count_;
     connected_device_count = connected_device_count_;
     active_device_count = active_device_count_;
     sampling_device_count = sampling_device_count_;
   }
    : edge_model_stat)

let make_edge_packaging_job_summary
    ?compilation_job_name:(compilation_job_name_ : entity_name option)
    ?model_name:(model_name_ : entity_name option)
    ?model_version:(model_version_ : edge_version option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ~edge_packaging_job_arn:(edge_packaging_job_arn_ : edge_packaging_job_arn)
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name)
    ~edge_packaging_job_status:(edge_packaging_job_status_ : edge_packaging_job_status) () =
  ({
     edge_packaging_job_arn = edge_packaging_job_arn_;
     edge_packaging_job_name = edge_packaging_job_name_;
     edge_packaging_job_status = edge_packaging_job_status_;
     compilation_job_name = compilation_job_name_;
     model_name = model_name_;
     model_version = model_version_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : edge_packaging_job_summary)

let make_enable_sagemaker_servicecatalog_portfolio_output () = (() : unit)
let make_enable_sagemaker_servicecatalog_portfolio_input () = (() : unit)

let make_monitoring_schedule
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option)
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option)
    ?monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?last_monitoring_execution_summary:
      (last_monitoring_execution_summary_ : monitoring_execution_summary option)
    ?tags:(tags_ : tag_list option) () =
  ({
     monitoring_schedule_arn = monitoring_schedule_arn_;
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_status = monitoring_schedule_status_;
     monitoring_type = monitoring_type_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     monitoring_schedule_config = monitoring_schedule_config_;
     endpoint_name = endpoint_name_;
     last_monitoring_execution_summary = last_monitoring_execution_summary_;
     tags = tags_;
   }
    : monitoring_schedule)

let make_endpoint
    ?production_variants:(production_variants_ : production_variant_summary_list option)
    ?data_capture_config:(data_capture_config_ : data_capture_config_summary option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?monitoring_schedules:(monitoring_schedules_ : monitoring_schedule_list option)
    ?tags:(tags_ : tag_list option)
    ?shadow_production_variants:
      (shadow_production_variants_ : production_variant_summary_list option)
    ~endpoint_name:(endpoint_name_ : endpoint_name) ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name)
    ~endpoint_status:(endpoint_status_ : endpoint_status)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_arn = endpoint_arn_;
     endpoint_config_name = endpoint_config_name_;
     production_variants = production_variants_;
     data_capture_config = data_capture_config_;
     endpoint_status = endpoint_status_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     monitoring_schedules = monitoring_schedules_;
     tags = tags_;
     shadow_production_variants = shadow_production_variants_;
   }
    : endpoint)

let make_endpoint_config_step_metadata ?arn:(arn_ : endpoint_config_arn option) () =
  ({ arn = arn_ } : endpoint_config_step_metadata)

let make_endpoint_config_summary
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name)
    ~endpoint_config_arn:(endpoint_config_arn_ : endpoint_config_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     endpoint_config_name = endpoint_config_name_;
     endpoint_config_arn = endpoint_config_arn_;
     creation_time = creation_time_;
   }
    : endpoint_config_summary)

let make_endpoint_step_metadata ?arn:(arn_ : endpoint_arn option) () =
  ({ arn = arn_ } : endpoint_step_metadata)

let make_endpoint_summary ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~endpoint_arn:(endpoint_arn_ : endpoint_arn) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~endpoint_status:(endpoint_status_ : endpoint_status) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_arn = endpoint_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     endpoint_status = endpoint_status_;
   }
    : endpoint_summary)

let make_experiment ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?experiment_arn:(experiment_arn_ : experiment_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?source:(source_ : experiment_source option)
    ?description:(description_ : experiment_description option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option) ?tags:(tags_ : tag_list option) () =
  ({
     experiment_name = experiment_name_;
     experiment_arn = experiment_arn_;
     display_name = display_name_;
     source = source_;
     description = description_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     tags = tags_;
   }
    : experiment)

let make_experiment_summary ?experiment_arn:(experiment_arn_ : experiment_arn option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?experiment_source:(experiment_source_ : experiment_source option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     experiment_arn = experiment_arn_;
     experiment_name = experiment_name_;
     display_name = display_name_;
     experiment_source = experiment_source_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : experiment_summary)

let make_extend_training_plan_response
    ~training_plan_extensions:(training_plan_extensions_ : training_plan_extensions) () =
  ({ training_plan_extensions = training_plan_extensions_ } : extend_training_plan_response)

let make_extend_training_plan_request
    ~training_plan_extension_offering_id:
      (training_plan_extension_offering_id_ : training_plan_extension_offering_id) () =
  ({ training_plan_extension_offering_id = training_plan_extension_offering_id_ }
    : extend_training_plan_request)

let make_fail_step_metadata ?error_message:(error_message_ : string3072 option) () =
  ({ error_message = error_message_ } : fail_step_metadata)

let make_feature_group ?feature_group_arn:(feature_group_arn_ : feature_group_arn option)
    ?feature_group_name:(feature_group_name_ : feature_group_name option)
    ?record_identifier_feature_name:(record_identifier_feature_name_ : feature_name option)
    ?event_time_feature_name:(event_time_feature_name_ : feature_name option)
    ?feature_definitions:(feature_definitions_ : feature_definitions option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?online_store_config:(online_store_config_ : online_store_config option)
    ?offline_store_config:(offline_store_config_ : offline_store_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?feature_group_status:(feature_group_status_ : feature_group_status option)
    ?offline_store_status:(offline_store_status_ : offline_store_status option)
    ?last_update_status:(last_update_status_ : last_update_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?description:(description_ : description option) ?tags:(tags_ : tag_list option) () =
  ({
     feature_group_arn = feature_group_arn_;
     feature_group_name = feature_group_name_;
     record_identifier_feature_name = record_identifier_feature_name_;
     event_time_feature_name = event_time_feature_name_;
     feature_definitions = feature_definitions_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     online_store_config = online_store_config_;
     offline_store_config = offline_store_config_;
     role_arn = role_arn_;
     feature_group_status = feature_group_status_;
     offline_store_status = offline_store_status_;
     last_update_status = last_update_status_;
     failure_reason = failure_reason_;
     description = description_;
     tags = tags_;
   }
    : feature_group)

let make_feature_group_summary
    ?feature_group_status:(feature_group_status_ : feature_group_status option)
    ?offline_store_status:(offline_store_status_ : offline_store_status option)
    ~feature_group_name:(feature_group_name_ : feature_group_name)
    ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     feature_group_name = feature_group_name_;
     feature_group_arn = feature_group_arn_;
     creation_time = creation_time_;
     feature_group_status = feature_group_status_;
     offline_store_status = offline_store_status_;
   }
    : feature_group_summary)

let make_feature_metadata ?feature_group_arn:(feature_group_arn_ : feature_group_arn option)
    ?feature_group_name:(feature_group_name_ : feature_group_name option)
    ?feature_name:(feature_name_ : feature_name option)
    ?feature_type:(feature_type_ : feature_type option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?description:(description_ : feature_description option)
    ?parameters:(parameters_ : feature_parameters option) () =
  ({
     feature_group_arn = feature_group_arn_;
     feature_group_name = feature_group_name_;
     feature_name = feature_name_;
     feature_type = feature_type_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     description = description_;
     parameters = parameters_;
   }
    : feature_metadata)

let make_filter ?operator:(operator_ : operator option) ?value:(value_ : filter_value option)
    ~name:(name_ : resource_property_name) () =
  ({ name = name_; operator = operator_; value = value_ } : filter)

let make_flow_definition_summary ?failure_reason:(failure_reason_ : failure_reason option)
    ~flow_definition_name:(flow_definition_name_ : flow_definition_name)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn)
    ~flow_definition_status:(flow_definition_status_ : flow_definition_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     flow_definition_name = flow_definition_name_;
     flow_definition_arn = flow_definition_arn_;
     flow_definition_status = flow_definition_status_;
     creation_time = creation_time_;
     failure_reason = failure_reason_;
   }
    : flow_definition_summary)

let make_get_device_fleet_report_response
    ?output_config:(output_config_ : edge_output_config option)
    ?description:(description_ : device_fleet_description option)
    ?report_generated:(report_generated_ : timestamp option)
    ?device_stats:(device_stats_ : device_stats option)
    ?agent_versions:(agent_versions_ : agent_versions option)
    ?model_stats:(model_stats_ : edge_model_stats option)
    ~device_fleet_arn:(device_fleet_arn_ : device_fleet_arn)
    ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({
     device_fleet_arn = device_fleet_arn_;
     device_fleet_name = device_fleet_name_;
     output_config = output_config_;
     description = description_;
     report_generated = report_generated_;
     device_stats = device_stats_;
     agent_versions = agent_versions_;
     model_stats = model_stats_;
   }
    : get_device_fleet_report_response)

let make_get_device_fleet_report_request ~device_fleet_name:(device_fleet_name_ : entity_name) () =
  ({ device_fleet_name = device_fleet_name_ } : get_device_fleet_report_request)

let make_get_lineage_group_policy_response
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?resource_policy:(resource_policy_ : resource_policy_string option) () =
  ({ lineage_group_arn = lineage_group_arn_; resource_policy = resource_policy_ }
    : get_lineage_group_policy_response)

let make_get_lineage_group_policy_request
    ~lineage_group_name:(lineage_group_name_ : lineage_group_name_or_arn) () =
  ({ lineage_group_name = lineage_group_name_ } : get_lineage_group_policy_request)

let make_get_model_package_group_policy_output ~resource_policy:(resource_policy_ : policy_string)
    () =
  ({ resource_policy = resource_policy_ } : get_model_package_group_policy_output)

let make_get_model_package_group_policy_input
    ~model_package_group_name:(model_package_group_name_ : entity_name) () =
  ({ model_package_group_name = model_package_group_name_ } : get_model_package_group_policy_input)

let make_get_sagemaker_servicecatalog_portfolio_status_output
    ?status:(status_ : sagemaker_servicecatalog_status option) () =
  ({ status = status_ } : get_sagemaker_servicecatalog_portfolio_status_output)

let make_get_sagemaker_servicecatalog_portfolio_status_input () = (() : unit)

let make_scaling_policy_metric
    ?invocations_per_instance:(invocations_per_instance_ : integer option)
    ?model_latency:(model_latency_ : integer option) () =
  ({ invocations_per_instance = invocations_per_instance_; model_latency = model_latency_ }
    : scaling_policy_metric)

let make_scaling_policy_objective
    ?min_invocations_per_minute:(min_invocations_per_minute_ : integer option)
    ?max_invocations_per_minute:(max_invocations_per_minute_ : integer option) () =
  ({
     min_invocations_per_minute = min_invocations_per_minute_;
     max_invocations_per_minute = max_invocations_per_minute_;
   }
    : scaling_policy_objective)

let make_get_scaling_configuration_recommendation_response
    ?inference_recommendations_job_name:
      (inference_recommendations_job_name_ : recommendation_job_name option)
    ?recommendation_id:(recommendation_id_ : string_ option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?target_cpu_utilization_per_core:
      (target_cpu_utilization_per_core_ : utilization_percentage_per_core option)
    ?scaling_policy_objective:(scaling_policy_objective_ : scaling_policy_objective option)
    ?metric:(metric_ : scaling_policy_metric option)
    ?dynamic_scaling_configuration:
      (dynamic_scaling_configuration_ : dynamic_scaling_configuration option) () =
  ({
     inference_recommendations_job_name = inference_recommendations_job_name_;
     recommendation_id = recommendation_id_;
     endpoint_name = endpoint_name_;
     target_cpu_utilization_per_core = target_cpu_utilization_per_core_;
     scaling_policy_objective = scaling_policy_objective_;
     metric = metric_;
     dynamic_scaling_configuration = dynamic_scaling_configuration_;
   }
    : get_scaling_configuration_recommendation_response)

let make_get_scaling_configuration_recommendation_request
    ?recommendation_id:(recommendation_id_ : string_ option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?target_cpu_utilization_per_core:
      (target_cpu_utilization_per_core_ : utilization_percentage_per_core option)
    ?scaling_policy_objective:(scaling_policy_objective_ : scaling_policy_objective option)
    ~inference_recommendations_job_name:
      (inference_recommendations_job_name_ : recommendation_job_name) () =
  ({
     inference_recommendations_job_name = inference_recommendations_job_name_;
     recommendation_id = recommendation_id_;
     endpoint_name = endpoint_name_;
     target_cpu_utilization_per_core = target_cpu_utilization_per_core_;
     scaling_policy_objective = scaling_policy_objective_;
   }
    : get_scaling_configuration_recommendation_request)

let make_property_name_suggestion ?property_name:(property_name_ : resource_property_name option) ()
    =
  ({ property_name = property_name_ } : property_name_suggestion)

let make_get_search_suggestions_response
    ?property_name_suggestions:(property_name_suggestions_ : property_name_suggestion_list option)
    () =
  ({ property_name_suggestions = property_name_suggestions_ } : get_search_suggestions_response)

let make_property_name_query ~property_name_hint:(property_name_hint_ : property_name_hint) () =
  ({ property_name_hint = property_name_hint_ } : property_name_query)

let make_suggestion_query ?property_name_query:(property_name_query_ : property_name_query option)
    () =
  ({ property_name_query = property_name_query_ } : suggestion_query)

let make_get_search_suggestions_request
    ?suggestion_query:(suggestion_query_ : suggestion_query option)
    ~resource:(resource_ : resource_type) () =
  ({ resource = resource_; suggestion_query = suggestion_query_ } : get_search_suggestions_request)

let make_git_config_for_update ?secret_arn:(secret_arn_ : secret_arn option) () =
  ({ secret_arn = secret_arn_ } : git_config_for_update)

let make_hub_content_info
    ?sage_maker_public_hub_content_arn:
      (sage_maker_public_hub_content_arn_ : sage_maker_public_hub_content_arn option)
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?support_status:(support_status_ : hub_content_support_status option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?original_creation_time:(original_creation_time_ : timestamp option)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn)
    ~hub_content_version:(hub_content_version_ : hub_content_version)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~document_schema_version:(document_schema_version_ : document_schema_version)
    ~hub_content_status:(hub_content_status_ : hub_content_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     hub_content_name = hub_content_name_;
     hub_content_arn = hub_content_arn_;
     sage_maker_public_hub_content_arn = sage_maker_public_hub_content_arn_;
     hub_content_version = hub_content_version_;
     hub_content_type = hub_content_type_;
     document_schema_version = document_schema_version_;
     hub_content_display_name = hub_content_display_name_;
     hub_content_description = hub_content_description_;
     support_status = support_status_;
     hub_content_search_keywords = hub_content_search_keywords_;
     hub_content_status = hub_content_status_;
     creation_time = creation_time_;
     original_creation_time = original_creation_time_;
   }
    : hub_content_info)

let make_hub_info ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ?hub_description:(hub_description_ : hub_description option)
    ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ~hub_name:(hub_name_ : hub_name) ~hub_arn:(hub_arn_ : hub_arn)
    ~hub_status:(hub_status_ : hub_status) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     hub_name = hub_name_;
     hub_arn = hub_arn_;
     hub_display_name = hub_display_name_;
     hub_description = hub_description_;
     hub_search_keywords = hub_search_keywords_;
     hub_status = hub_status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : hub_info)

let make_human_task_ui_summary ~human_task_ui_name:(human_task_ui_name_ : human_task_ui_name)
    ~human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     human_task_ui_name = human_task_ui_name_;
     human_task_ui_arn = human_task_ui_arn_;
     creation_time = creation_time_;
   }
    : human_task_ui_summary)

let make_hyper_parameter_tuning_job_search_entity
    ?hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name option)
    ?hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn option)
    ?hyper_parameter_tuning_job_config:
      (hyper_parameter_tuning_job_config_ : hyper_parameter_tuning_job_config option)
    ?training_job_definition:
      (training_job_definition_ : hyper_parameter_training_job_definition option)
    ?training_job_definitions:
      (training_job_definitions_ : hyper_parameter_training_job_definitions option)
    ?hyper_parameter_tuning_job_status:
      (hyper_parameter_tuning_job_status_ : hyper_parameter_tuning_job_status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?hyper_parameter_tuning_end_time:(hyper_parameter_tuning_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?training_job_status_counters:
      (training_job_status_counters_ : training_job_status_counters option)
    ?objective_status_counters:(objective_status_counters_ : objective_status_counters option)
    ?best_training_job:(best_training_job_ : hyper_parameter_training_job_summary option)
    ?overall_best_training_job:
      (overall_best_training_job_ : hyper_parameter_training_job_summary option)
    ?warm_start_config:(warm_start_config_ : hyper_parameter_tuning_job_warm_start_config option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?tuning_job_completion_details:
      (tuning_job_completion_details_ : hyper_parameter_tuning_job_completion_details option)
    ?consumed_resources:(consumed_resources_ : hyper_parameter_tuning_job_consumed_resources option)
    ?tags:(tags_ : tag_list option) () =
  ({
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
     hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_;
     hyper_parameter_tuning_job_config = hyper_parameter_tuning_job_config_;
     training_job_definition = training_job_definition_;
     training_job_definitions = training_job_definitions_;
     hyper_parameter_tuning_job_status = hyper_parameter_tuning_job_status_;
     creation_time = creation_time_;
     hyper_parameter_tuning_end_time = hyper_parameter_tuning_end_time_;
     last_modified_time = last_modified_time_;
     training_job_status_counters = training_job_status_counters_;
     objective_status_counters = objective_status_counters_;
     best_training_job = best_training_job_;
     overall_best_training_job = overall_best_training_job_;
     warm_start_config = warm_start_config_;
     failure_reason = failure_reason_;
     tuning_job_completion_details = tuning_job_completion_details_;
     consumed_resources = consumed_resources_;
     tags = tags_;
   }
    : hyper_parameter_tuning_job_search_entity)

let make_hyper_parameter_tuning_job_summary
    ?hyper_parameter_tuning_end_time:(hyper_parameter_tuning_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?resource_limits:(resource_limits_ : resource_limits option)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name)
    ~hyper_parameter_tuning_job_arn:
      (hyper_parameter_tuning_job_arn_ : hyper_parameter_tuning_job_arn)
    ~hyper_parameter_tuning_job_status:
      (hyper_parameter_tuning_job_status_ : hyper_parameter_tuning_job_status)
    ~strategy:(strategy_ : hyper_parameter_tuning_job_strategy_type)
    ~creation_time:(creation_time_ : timestamp)
    ~training_job_status_counters:(training_job_status_counters_ : training_job_status_counters)
    ~objective_status_counters:(objective_status_counters_ : objective_status_counters) () =
  ({
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
     hyper_parameter_tuning_job_arn = hyper_parameter_tuning_job_arn_;
     hyper_parameter_tuning_job_status = hyper_parameter_tuning_job_status_;
     strategy = strategy_;
     creation_time = creation_time_;
     hyper_parameter_tuning_end_time = hyper_parameter_tuning_end_time_;
     last_modified_time = last_modified_time_;
     training_job_status_counters = training_job_status_counters_;
     objective_status_counters = objective_status_counters_;
     resource_limits = resource_limits_;
   }
    : hyper_parameter_tuning_job_summary)

let make_image ?description:(description_ : image_description option)
    ?display_name:(display_name_ : image_display_name option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~creation_time:(creation_time_ : timestamp) ~image_arn:(image_arn_ : image_arn)
    ~image_name:(image_name_ : image_name) ~image_status:(image_status_ : image_status)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     creation_time = creation_time_;
     description = description_;
     display_name = display_name_;
     failure_reason = failure_reason_;
     image_arn = image_arn_;
     image_name = image_name_;
     image_status = image_status_;
     last_modified_time = last_modified_time_;
   }
    : image)

let make_image_version ?failure_reason:(failure_reason_ : failure_reason option)
    ~creation_time:(creation_time_ : timestamp) ~image_arn:(image_arn_ : image_arn)
    ~image_version_arn:(image_version_arn_ : image_version_arn)
    ~image_version_status:(image_version_status_ : image_version_status)
    ~last_modified_time:(last_modified_time_ : timestamp) ~version:(version_ : image_version_number)
    () =
  ({
     creation_time = creation_time_;
     failure_reason = failure_reason_;
     image_arn = image_arn_;
     image_version_arn = image_version_arn_;
     image_version_status = image_version_status_;
     last_modified_time = last_modified_time_;
     version = version_;
   }
    : image_version)

let make_import_hub_content_response ~hub_arn:(hub_arn_ : hub_arn)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_arn = hub_arn_; hub_content_arn = hub_content_arn_ } : import_hub_content_response)

let make_import_hub_content_request
    ?hub_content_version:(hub_content_version_ : hub_content_version option)
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?hub_content_markdown:(hub_content_markdown_ : hub_content_markdown option)
    ?support_status:(support_status_ : hub_content_support_status option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?tags:(tags_ : tag_list option) ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~document_schema_version:(document_schema_version_ : document_schema_version)
    ~hub_name:(hub_name_ : hub_name_or_arn)
    ~hub_content_document:(hub_content_document_ : hub_content_document) () =
  ({
     hub_content_name = hub_content_name_;
     hub_content_version = hub_content_version_;
     hub_content_type = hub_content_type_;
     document_schema_version = document_schema_version_;
     hub_name = hub_name_;
     hub_content_display_name = hub_content_display_name_;
     hub_content_description = hub_content_description_;
     hub_content_markdown = hub_content_markdown_;
     hub_content_document = hub_content_document_;
     support_status = support_status_;
     hub_content_search_keywords = hub_content_search_keywords_;
     tags = tags_;
   }
    : import_hub_content_request)

let make_inference_component_metadata ?arn:(arn_ : string2048 option) () =
  ({ arn = arn_ } : inference_component_metadata)

let make_inference_component_summary
    ?inference_component_status:(inference_component_status_ : inference_component_status option)
    ~creation_time:(creation_time_ : timestamp)
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn)
    ~inference_component_name:(inference_component_name_ : inference_component_name)
    ~endpoint_arn:(endpoint_arn_ : endpoint_arn) ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~variant_name:(variant_name_ : variant_name)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     creation_time = creation_time_;
     inference_component_arn = inference_component_arn_;
     inference_component_name = inference_component_name_;
     endpoint_arn = endpoint_arn_;
     endpoint_name = endpoint_name_;
     variant_name = variant_name_;
     inference_component_status = inference_component_status_;
     last_modified_time = last_modified_time_;
   }
    : inference_component_summary)

let make_inference_experiment_summary ?schedule:(schedule_ : inference_experiment_schedule option)
    ?status_reason:(status_reason_ : inference_experiment_status_reason option)
    ?description:(description_ : inference_experiment_description option)
    ?completion_time:(completion_time_ : timestamp option) ?role_arn:(role_arn_ : role_arn option)
    ~name:(name_ : inference_experiment_name) ~type_:(type__ : inference_experiment_type)
    ~status:(status_ : inference_experiment_status) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     name = name_;
     type_ = type__;
     schedule = schedule_;
     status = status_;
     status_reason = status_reason_;
     description = description_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     last_modified_time = last_modified_time_;
     role_arn = role_arn_;
   }
    : inference_experiment_summary)

let make_inference_recommendations_job ?completion_time:(completion_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?model_name:(model_name_ : model_name option)
    ?sample_payload_url:(sample_payload_url_ : s3_uri option)
    ?model_package_version_arn:(model_package_version_arn_ : model_package_arn option)
    ~job_name:(job_name_ : recommendation_job_name)
    ~job_description:(job_description_ : recommendation_job_description)
    ~job_type:(job_type_ : recommendation_job_type) ~job_arn:(job_arn_ : recommendation_job_arn)
    ~status:(status_ : recommendation_job_status) ~creation_time:(creation_time_ : creation_time)
    ~role_arn:(role_arn_ : role_arn) ~last_modified_time:(last_modified_time_ : last_modified_time)
    () =
  ({
     job_name = job_name_;
     job_description = job_description_;
     job_type = job_type_;
     job_arn = job_arn_;
     status = status_;
     creation_time = creation_time_;
     completion_time = completion_time_;
     role_arn = role_arn_;
     last_modified_time = last_modified_time_;
     failure_reason = failure_reason_;
     model_name = model_name_;
     sample_payload_url = sample_payload_url_;
     model_package_version_arn = model_package_version_arn_;
   }
    : inference_recommendations_job)

let make_recommendation_job_inference_benchmark ?metrics:(metrics_ : recommendation_metrics option)
    ?endpoint_metrics:(endpoint_metrics_ : inference_metrics option)
    ?endpoint_configuration:(endpoint_configuration_ : endpoint_output_configuration option)
    ?failure_reason:(failure_reason_ : recommendation_failure_reason option)
    ?invocation_end_time:(invocation_end_time_ : invocation_end_time option)
    ?invocation_start_time:(invocation_start_time_ : invocation_start_time option)
    ~model_configuration:(model_configuration_ : model_configuration) () =
  ({
     metrics = metrics_;
     endpoint_metrics = endpoint_metrics_;
     endpoint_configuration = endpoint_configuration_;
     model_configuration = model_configuration_;
     failure_reason = failure_reason_;
     invocation_end_time = invocation_end_time_;
     invocation_start_time = invocation_start_time_;
   }
    : recommendation_job_inference_benchmark)

let make_inference_recommendations_job_step
    ?inference_benchmark:(inference_benchmark_ : recommendation_job_inference_benchmark option)
    ~step_type:(step_type_ : recommendation_step_type)
    ~job_name:(job_name_ : recommendation_job_name) ~status:(status_ : recommendation_job_status) ()
    =
  ({
     step_type = step_type_;
     job_name = job_name_;
     status = status_;
     inference_benchmark = inference_benchmark_;
   }
    : inference_recommendations_job_step)

let make_job ?job_name:(job_name_ : job_name option) ?job_arn:(job_arn_ : job_arn option)
    ?role_arn:(role_arn_ : role_arn option) ?job_category:(job_category_ : job_category option)
    ?job_config_schema_version:(job_config_schema_version_ : job_schema_version option)
    ?job_config_document:(job_config_document_ : job_config_document option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?job_status:(job_status_ : job_status option)
    ?secondary_status:(secondary_status_ : job_secondary_status option)
    ?secondary_status_transitions:
      (secondary_status_transitions_ : job_secondary_status_transitions option)
    ?failure_reason:(failure_reason_ : failure_reason option) ?tags:(tags_ : tag_list option) () =
  ({
     job_name = job_name_;
     job_arn = job_arn_;
     role_arn = role_arn_;
     job_category = job_category_;
     job_config_schema_version = job_config_schema_version_;
     job_config_document = job_config_document_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     end_time = end_time_;
     job_status = job_status_;
     secondary_status = secondary_status_;
     secondary_status_transitions = secondary_status_transitions_;
     failure_reason = failure_reason_;
     tags = tags_;
   }
    : job)

let make_job_config_schema_version_summary
    ~job_config_schema_version:(job_config_schema_version_ : job_schema_version) () =
  ({ job_config_schema_version = job_config_schema_version_ } : job_config_schema_version_summary)

let make_job_step_metadata ?arn:(arn_ : string1024 option) () = ({ arn = arn_ } : job_step_metadata)

let make_job_summary ?end_time:(end_time_ : timestamp option) ~job_arn:(job_arn_ : job_arn)
    ~job_name:(job_name_ : job_name) ~job_category:(job_category_ : job_category)
    ~job_status:(job_status_ : job_status)
    ~job_secondary_status:(job_secondary_status_ : job_secondary_status)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp) () =
  ({
     job_arn = job_arn_;
     job_name = job_name_;
     job_category = job_category_;
     job_status = job_status_;
     job_secondary_status = job_secondary_status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     end_time = end_time_;
   }
    : job_summary)

let make_label_counters_for_workteam ?human_labeled:(human_labeled_ : label_counter option)
    ?pending_human:(pending_human_ : label_counter option) ?total:(total_ : label_counter option) ()
    =
  ({ human_labeled = human_labeled_; pending_human = pending_human_; total = total_ }
    : label_counters_for_workteam)

let make_labeling_job_for_workteam_summary
    ?labeling_job_name:(labeling_job_name_ : labeling_job_name option)
    ?label_counters:(label_counters_ : label_counters_for_workteam option)
    ?number_of_human_workers_per_data_object:
      (number_of_human_workers_per_data_object_ : number_of_human_workers_per_data_object option)
    ~job_reference_code:(job_reference_code_ : job_reference_code)
    ~work_requester_account_id:(work_requester_account_id_ : account_id)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     labeling_job_name = labeling_job_name_;
     job_reference_code = job_reference_code_;
     work_requester_account_id = work_requester_account_id_;
     creation_time = creation_time_;
     label_counters = label_counters_;
     number_of_human_workers_per_data_object = number_of_human_workers_per_data_object_;
   }
    : labeling_job_for_workteam_summary)

let make_labeling_job_summary
    ?pre_human_task_lambda_arn:(pre_human_task_lambda_arn_ : lambda_function_arn option)
    ?annotation_consolidation_lambda_arn:
      (annotation_consolidation_lambda_arn_ : lambda_function_arn option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?labeling_job_output:(labeling_job_output_ : labeling_job_output option)
    ?input_config:(input_config_ : labeling_job_input_config option)
    ~labeling_job_name:(labeling_job_name_ : labeling_job_name)
    ~labeling_job_arn:(labeling_job_arn_ : labeling_job_arn)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~labeling_job_status:(labeling_job_status_ : labeling_job_status)
    ~label_counters:(label_counters_ : label_counters) ~workteam_arn:(workteam_arn_ : workteam_arn)
    () =
  ({
     labeling_job_name = labeling_job_name_;
     labeling_job_arn = labeling_job_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     labeling_job_status = labeling_job_status_;
     label_counters = label_counters_;
     workteam_arn = workteam_arn_;
     pre_human_task_lambda_arn = pre_human_task_lambda_arn_;
     annotation_consolidation_lambda_arn = annotation_consolidation_lambda_arn_;
     failure_reason = failure_reason_;
     labeling_job_output = labeling_job_output_;
     input_config = input_config_;
   }
    : labeling_job_summary)

let make_lambda_step_metadata ?arn:(arn_ : string256 option)
    ?output_parameters:(output_parameters_ : output_parameter_list option) () =
  ({ arn = arn_; output_parameters = output_parameters_ } : lambda_step_metadata)

let make_lineage_group_summary ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?lineage_group_name:(lineage_group_name_ : experiment_entity_name option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     lineage_group_arn = lineage_group_arn_;
     lineage_group_name = lineage_group_name_;
     display_name = display_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : lineage_group_summary)

let make_lineage_metadata ?action_arns:(action_arns_ : map_string2048 option)
    ?artifact_arns:(artifact_arns_ : map_string2048 option)
    ?context_arns:(context_arns_ : map_string2048 option)
    ?associations:(associations_ : association_info_list option) () =
  ({
     action_arns = action_arns_;
     artifact_arns = artifact_arns_;
     context_arns = context_arns_;
     associations = associations_;
   }
    : lineage_metadata)

let make_list_ai_benchmark_jobs_response ?next_token:(next_token_ : next_token option)
    ~ai_benchmark_jobs:(ai_benchmark_jobs_ : ai_benchmark_job_summary_list) () =
  ({ ai_benchmark_jobs = ai_benchmark_jobs_; next_token = next_token_ }
    : list_ai_benchmark_jobs_response)

let make_list_ai_benchmark_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : ai_benchmark_job_status option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?sort_by:(sort_by_ : list_ai_benchmark_jobs_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_ai_benchmark_jobs_request)

let make_list_ai_recommendation_jobs_response ?next_token:(next_token_ : next_token option)
    ~ai_recommendation_jobs:(ai_recommendation_jobs_ : ai_recommendation_job_summary_list) () =
  ({ ai_recommendation_jobs = ai_recommendation_jobs_; next_token = next_token_ }
    : list_ai_recommendation_jobs_response)

let make_list_ai_recommendation_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : ai_recommendation_job_status option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?sort_by:(sort_by_ : list_ai_recommendation_jobs_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_ai_recommendation_jobs_request)

let make_list_ai_workload_configs_response ?next_token:(next_token_ : next_token option)
    ~ai_workload_configs:(ai_workload_configs_ : ai_workload_config_summary_list) () =
  ({ ai_workload_configs = ai_workload_configs_; next_token = next_token_ }
    : list_ai_workload_configs_response)

let make_list_ai_workload_configs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?sort_by:(sort_by_ : list_ai_workload_configs_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_ai_workload_configs_request)

let make_list_actions_response ?action_summaries:(action_summaries_ : action_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ action_summaries = action_summaries_; next_token = next_token_ } : list_actions_response)

let make_list_actions_request ?source_uri:(source_uri_ : source_uri option)
    ?action_type:(action_type_ : string256 option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_actions_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     source_uri = source_uri_;
     action_type = action_type_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_actions_request)

let make_list_algorithms_output ?next_token:(next_token_ : next_token option)
    ~algorithm_summary_list:(algorithm_summary_list_ : algorithm_summary_list) () =
  ({ algorithm_summary_list = algorithm_summary_list_; next_token = next_token_ }
    : list_algorithms_output)

let make_list_algorithms_input ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?next_token:(next_token_ : next_token option) ?sort_by:(sort_by_ : algorithm_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_algorithms_input)

let make_list_aliases_response
    ?sage_maker_image_version_aliases:
      (sage_maker_image_version_aliases_ : sage_maker_image_version_aliases option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     sage_maker_image_version_aliases = sage_maker_image_version_aliases_;
     next_token = next_token_;
   }
    : list_aliases_response)

let make_list_aliases_request ?alias:(alias_ : sage_maker_image_version_alias option)
    ?version:(version_ : image_version_number option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~image_name:(image_name_ : image_name) () =
  ({
     image_name = image_name_;
     alias = alias_;
     version = version_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_aliases_request)

let make_list_app_image_configs_response ?next_token:(next_token_ : next_token option)
    ?app_image_configs:(app_image_configs_ : app_image_config_list option) () =
  ({ next_token = next_token_; app_image_configs = app_image_configs_ }
    : list_app_image_configs_response)

let make_list_app_image_configs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : app_image_config_name option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?modified_time_before:(modified_time_before_ : timestamp option)
    ?modified_time_after:(modified_time_after_ : timestamp option)
    ?sort_by:(sort_by_ : app_image_config_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     modified_time_before = modified_time_before_;
     modified_time_after = modified_time_after_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_app_image_configs_request)

let make_list_apps_response ?apps:(apps_ : app_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ apps = apps_; next_token = next_token_ } : list_apps_response)

let make_list_apps_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : app_sort_key option)
    ?domain_id_equals:(domain_id_equals_ : domain_id option)
    ?user_profile_name_equals:(user_profile_name_equals_ : user_profile_name option)
    ?space_name_equals:(space_name_equals_ : space_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     domain_id_equals = domain_id_equals_;
     user_profile_name_equals = user_profile_name_equals_;
     space_name_equals = space_name_equals_;
   }
    : list_apps_request)

let make_list_artifacts_response
    ?artifact_summaries:(artifact_summaries_ : artifact_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ artifact_summaries = artifact_summaries_; next_token = next_token_ } : list_artifacts_response)

let make_list_artifacts_request ?source_uri:(source_uri_ : source_uri option)
    ?artifact_type:(artifact_type_ : string256 option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_artifacts_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     source_uri = source_uri_;
     artifact_type = artifact_type_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_artifacts_request)

let make_list_associations_response
    ?association_summaries:(association_summaries_ : association_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ association_summaries = association_summaries_; next_token = next_token_ }
    : list_associations_response)

let make_list_associations_request ?source_arn:(source_arn_ : association_entity_arn option)
    ?destination_arn:(destination_arn_ : association_entity_arn option)
    ?source_type:(source_type_ : string256 option)
    ?destination_type:(destination_type_ : string256 option)
    ?association_type:(association_type_ : association_edge_type option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_associations_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     source_arn = source_arn_;
     destination_arn = destination_arn_;
     source_type = source_type_;
     destination_type = destination_type_;
     association_type = association_type_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_associations_request)

let make_list_auto_ml_jobs_response ?next_token:(next_token_ : next_token option)
    ~auto_ml_job_summaries:(auto_ml_job_summaries_ : auto_ml_job_summaries) () =
  ({ auto_ml_job_summaries = auto_ml_job_summaries_; next_token = next_token_ }
    : list_auto_ml_jobs_response)

let make_list_auto_ml_jobs_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : auto_ml_name_contains option)
    ?status_equals:(status_equals_ : auto_ml_job_status option)
    ?sort_order:(sort_order_ : auto_ml_sort_order option)
    ?sort_by:(sort_by_ : auto_ml_sort_by option)
    ?max_results:(max_results_ : auto_ml_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_auto_ml_jobs_request)

let make_list_candidates_for_auto_ml_job_response ?next_token:(next_token_ : next_token option)
    ~candidates:(candidates_ : auto_ml_candidates) () =
  ({ candidates = candidates_; next_token = next_token_ }
    : list_candidates_for_auto_ml_job_response)

let make_list_candidates_for_auto_ml_job_request
    ?status_equals:(status_equals_ : candidate_status option)
    ?candidate_name_equals:(candidate_name_equals_ : candidate_name option)
    ?sort_order:(sort_order_ : auto_ml_sort_order option)
    ?sort_by:(sort_by_ : candidate_sort_by option)
    ?max_results:(max_results_ : auto_ml_max_results_for_trials option)
    ?next_token:(next_token_ : next_token option)
    ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({
     auto_ml_job_name = auto_ml_job_name_;
     status_equals = status_equals_;
     candidate_name_equals = candidate_name_equals_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_candidates_for_auto_ml_job_request)

let make_list_cluster_events_response ?next_token:(next_token_ : next_token option)
    ?events:(events_ : cluster_event_summaries option) () =
  ({ next_token = next_token_; events = events_ } : list_cluster_events_response)

let make_list_cluster_events_request
    ?instance_group_name:(instance_group_name_ : cluster_instance_group_name option)
    ?node_id:(node_id_ : cluster_node_id option)
    ?event_time_after:(event_time_after_ : timestamp option)
    ?event_time_before:(event_time_before_ : timestamp option)
    ?sort_by:(sort_by_ : event_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?resource_type:(resource_type_ : cluster_event_resource_type option)
    ?max_results:(max_results_ : cluster_event_max_results option)
    ?next_token:(next_token_ : next_token option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     cluster_name = cluster_name_;
     instance_group_name = instance_group_name_;
     node_id = node_id_;
     event_time_after = event_time_after_;
     event_time_before = event_time_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     resource_type = resource_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_cluster_events_request)

let make_list_cluster_nodes_response ?next_token:(next_token_ : next_token option)
    ~cluster_node_summaries:(cluster_node_summaries_ : cluster_node_summaries) () =
  ({ next_token = next_token_; cluster_node_summaries = cluster_node_summaries_ }
    : list_cluster_nodes_response)

let make_list_cluster_nodes_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?instance_group_name_contains:
      (instance_group_name_contains_ : cluster_instance_group_name option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_by:(sort_by_ : cluster_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?include_node_logical_ids:(include_node_logical_ids_ : include_node_logical_ids_boolean option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     cluster_name = cluster_name_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     instance_group_name_contains = instance_group_name_contains_;
     max_results = max_results_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     include_node_logical_ids = include_node_logical_ids_;
   }
    : list_cluster_nodes_request)

let make_list_cluster_scheduler_configs_response
    ?cluster_scheduler_config_summaries:
      (cluster_scheduler_config_summaries_ : cluster_scheduler_config_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     cluster_scheduler_config_summaries = cluster_scheduler_config_summaries_;
     next_token = next_token_;
   }
    : list_cluster_scheduler_configs_response)

let make_list_cluster_scheduler_configs_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?name_contains:(name_contains_ : entity_name option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option)
    ?status:(status_ : scheduler_resource_status option)
    ?sort_by:(sort_by_ : sort_cluster_scheduler_config_by option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     name_contains = name_contains_;
     cluster_arn = cluster_arn_;
     status = status_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_cluster_scheduler_configs_request)

let make_list_clusters_response ?next_token:(next_token_ : next_token option)
    ~cluster_summaries:(cluster_summaries_ : cluster_summaries) () =
  ({ next_token = next_token_; cluster_summaries = cluster_summaries_ } : list_clusters_response)

let make_list_clusters_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?next_token:(next_token_ : next_token option) ?sort_by:(sort_by_ : cluster_sort_by option)
    ?sort_order:(sort_order_ : sort_order option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     training_plan_arn = training_plan_arn_;
   }
    : list_clusters_request)

let make_list_code_repositories_output ?next_token:(next_token_ : next_token option)
    ~code_repository_summary_list:(code_repository_summary_list_ : code_repository_summary_list) ()
    =
  ({ code_repository_summary_list = code_repository_summary_list_; next_token = next_token_ }
    : list_code_repositories_output)

let make_list_code_repositories_input
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : code_repository_name_contains option)
    ?next_token:(next_token_ : next_token option)
    ?sort_by:(sort_by_ : code_repository_sort_by option)
    ?sort_order:(sort_order_ : code_repository_sort_order option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_code_repositories_input)

let make_list_compilation_jobs_response ?next_token:(next_token_ : next_token option)
    ~compilation_job_summaries:(compilation_job_summaries_ : compilation_job_summaries) () =
  ({ compilation_job_summaries = compilation_job_summaries_; next_token = next_token_ }
    : list_compilation_jobs_response)

let make_list_compilation_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?name_contains:(name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : compilation_job_status option)
    ?sort_by:(sort_by_ : list_compilation_jobs_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_compilation_jobs_request)

let make_list_compute_quotas_response
    ?compute_quota_summaries:(compute_quota_summaries_ : compute_quota_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ compute_quota_summaries = compute_quota_summaries_; next_token = next_token_ }
    : list_compute_quotas_response)

let make_list_compute_quotas_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?name_contains:(name_contains_ : entity_name option)
    ?status:(status_ : scheduler_resource_status option)
    ?cluster_arn:(cluster_arn_ : cluster_arn option) ?sort_by:(sort_by_ : sort_quota_by option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     name_contains = name_contains_;
     status = status_;
     cluster_arn = cluster_arn_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_compute_quotas_request)

let make_list_contexts_response ?context_summaries:(context_summaries_ : context_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ context_summaries = context_summaries_; next_token = next_token_ } : list_contexts_response)

let make_list_contexts_request ?source_uri:(source_uri_ : source_uri option)
    ?context_type:(context_type_ : string256 option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_contexts_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     source_uri = source_uri_;
     context_type = context_type_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_contexts_request)

let make_monitoring_job_definition_summary
    ~monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name)
    ~monitoring_job_definition_arn:(monitoring_job_definition_arn_ : monitoring_job_definition_arn)
    ~creation_time:(creation_time_ : timestamp) ~endpoint_name:(endpoint_name_ : endpoint_name) () =
  ({
     monitoring_job_definition_name = monitoring_job_definition_name_;
     monitoring_job_definition_arn = monitoring_job_definition_arn_;
     creation_time = creation_time_;
     endpoint_name = endpoint_name_;
   }
    : monitoring_job_definition_summary)

let make_list_data_quality_job_definitions_response ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ job_definition_summaries = job_definition_summaries_; next_token = next_token_ }
    : list_data_quality_job_definitions_response)

let make_list_data_quality_job_definitions_request
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     endpoint_name = endpoint_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_data_quality_job_definitions_request)

let make_list_device_fleets_response ?next_token:(next_token_ : next_token option)
    ~device_fleet_summaries:(device_fleet_summaries_ : device_fleet_summaries) () =
  ({ device_fleet_summaries = device_fleet_summaries_; next_token = next_token_ }
    : list_device_fleets_response)

let make_list_device_fleets_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_max_results option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?sort_by:(sort_by_ : list_device_fleets_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_device_fleets_request)

let make_list_devices_response ?next_token:(next_token_ : next_token option)
    ~device_summaries:(device_summaries_ : device_summaries) () =
  ({ device_summaries = device_summaries_; next_token = next_token_ } : list_devices_response)

let make_list_devices_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_max_results option)
    ?latest_heartbeat_after:(latest_heartbeat_after_ : timestamp option)
    ?model_name:(model_name_ : entity_name option)
    ?device_fleet_name:(device_fleet_name_ : entity_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     latest_heartbeat_after = latest_heartbeat_after_;
     model_name = model_name_;
     device_fleet_name = device_fleet_name_;
   }
    : list_devices_request)

let make_list_domains_response ?domains:(domains_ : domain_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ domains = domains_; next_token = next_token_ } : list_domains_response)

let make_list_domains_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_domains_request)

let make_list_edge_deployment_plans_response ?next_token:(next_token_ : next_token option)
    ~edge_deployment_plan_summaries:
      (edge_deployment_plan_summaries_ : edge_deployment_plan_summaries) () =
  ({ edge_deployment_plan_summaries = edge_deployment_plan_summaries_; next_token = next_token_ }
    : list_edge_deployment_plans_response)

let make_list_edge_deployment_plans_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_max_results option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?device_fleet_name_contains:(device_fleet_name_contains_ : name_contains option)
    ?sort_by:(sort_by_ : list_edge_deployment_plans_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     device_fleet_name_contains = device_fleet_name_contains_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_edge_deployment_plans_request)

let make_list_edge_packaging_jobs_response ?next_token:(next_token_ : next_token option)
    ~edge_packaging_job_summaries:(edge_packaging_job_summaries_ : edge_packaging_job_summaries) ()
    =
  ({ edge_packaging_job_summaries = edge_packaging_job_summaries_; next_token = next_token_ }
    : list_edge_packaging_jobs_response)

let make_list_edge_packaging_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_max_results option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?model_name_contains:(model_name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : edge_packaging_job_status option)
    ?sort_by:(sort_by_ : list_edge_packaging_jobs_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     model_name_contains = model_name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_edge_packaging_jobs_request)

let make_list_endpoint_configs_output ?next_token:(next_token_ : pagination_token option)
    ~endpoint_configs:(endpoint_configs_ : endpoint_config_summary_list) () =
  ({ endpoint_configs = endpoint_configs_; next_token = next_token_ }
    : list_endpoint_configs_output)

let make_list_endpoint_configs_input ?sort_by:(sort_by_ : endpoint_config_sort_key option)
    ?sort_order:(sort_order_ : order_key option) ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : endpoint_config_name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_endpoint_configs_input)

let make_list_endpoints_output ?next_token:(next_token_ : pagination_token option)
    ~endpoints:(endpoints_ : endpoint_summary_list) () =
  ({ endpoints = endpoints_; next_token = next_token_ } : list_endpoints_output)

let make_list_endpoints_input ?sort_by:(sort_by_ : endpoint_sort_key option)
    ?sort_order:(sort_order_ : order_key option) ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : endpoint_name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : endpoint_status option) () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     status_equals = status_equals_;
   }
    : list_endpoints_input)

let make_list_experiments_response
    ?experiment_summaries:(experiment_summaries_ : experiment_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ experiment_summaries = experiment_summaries_; next_token = next_token_ }
    : list_experiments_response)

let make_list_experiments_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_experiments_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_experiments_request)

let make_list_feature_groups_response ?next_token:(next_token_ : next_token option)
    ~feature_group_summaries:(feature_group_summaries_ : feature_group_summaries) () =
  ({ feature_group_summaries = feature_group_summaries_; next_token = next_token_ }
    : list_feature_groups_response)

let make_list_feature_groups_request
    ?name_contains:(name_contains_ : feature_group_name_contains option)
    ?feature_group_status_equals:(feature_group_status_equals_ : feature_group_status option)
    ?offline_store_status_equals:(offline_store_status_equals_ : offline_store_status_value option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?sort_order:(sort_order_ : feature_group_sort_order option)
    ?sort_by:(sort_by_ : feature_group_sort_by option)
    ?max_results:(max_results_ : feature_group_max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     name_contains = name_contains_;
     feature_group_status_equals = feature_group_status_equals_;
     offline_store_status_equals = offline_store_status_equals_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_feature_groups_request)

let make_list_flow_definitions_response ?next_token:(next_token_ : next_token option)
    ~flow_definition_summaries:(flow_definition_summaries_ : flow_definition_summaries) () =
  ({ flow_definition_summaries = flow_definition_summaries_; next_token = next_token_ }
    : list_flow_definitions_response)

let make_list_flow_definitions_request
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_flow_definitions_request)

let make_list_hub_content_versions_response ?next_token:(next_token_ : next_token option)
    ~hub_content_summaries:(hub_content_summaries_ : hub_content_info_list) () =
  ({ hub_content_summaries = hub_content_summaries_; next_token = next_token_ }
    : list_hub_content_versions_response)

let make_list_hub_content_versions_request ?min_version:(min_version_ : hub_content_version option)
    ?max_schema_version:(max_schema_version_ : document_schema_version option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?sort_by:(sort_by_ : hub_content_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~hub_name:(hub_name_ : hub_name_or_arn) ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_name:(hub_content_name_ : hub_content_name) () =
  ({
     hub_name = hub_name_;
     hub_content_type = hub_content_type_;
     hub_content_name = hub_content_name_;
     min_version = min_version_;
     max_schema_version = max_schema_version_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_hub_content_versions_request)

let make_list_hub_contents_response ?next_token:(next_token_ : next_token option)
    ~hub_content_summaries:(hub_content_summaries_ : hub_content_info_list) () =
  ({ hub_content_summaries = hub_content_summaries_; next_token = next_token_ }
    : list_hub_contents_response)

let make_list_hub_contents_request ?name_contains:(name_contains_ : name_contains option)
    ?max_schema_version:(max_schema_version_ : document_schema_version option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?sort_by:(sort_by_ : hub_content_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~hub_name:(hub_name_ : hub_name_or_arn) ~hub_content_type:(hub_content_type_ : hub_content_type)
    () =
  ({
     hub_name = hub_name_;
     hub_content_type = hub_content_type_;
     name_contains = name_contains_;
     max_schema_version = max_schema_version_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_hub_contents_request)

let make_list_hubs_response ?next_token:(next_token_ : next_token option)
    ~hub_summaries:(hub_summaries_ : hub_info_list) () =
  ({ hub_summaries = hub_summaries_; next_token = next_token_ } : list_hubs_response)

let make_list_hubs_request ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?sort_by:(sort_by_ : hub_sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_hubs_request)

let make_list_human_task_uis_response ?next_token:(next_token_ : next_token option)
    ~human_task_ui_summaries:(human_task_ui_summaries_ : human_task_ui_summaries) () =
  ({ human_task_ui_summaries = human_task_ui_summaries_; next_token = next_token_ }
    : list_human_task_uis_response)

let make_list_human_task_uis_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_human_task_uis_request)

let make_list_hyper_parameter_tuning_jobs_response ?next_token:(next_token_ : next_token option)
    ~hyper_parameter_tuning_job_summaries:
      (hyper_parameter_tuning_job_summaries_ : hyper_parameter_tuning_job_summaries) () =
  ({
     hyper_parameter_tuning_job_summaries = hyper_parameter_tuning_job_summaries_;
     next_token = next_token_;
   }
    : list_hyper_parameter_tuning_jobs_response)

let make_list_hyper_parameter_tuning_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?sort_by:(sort_by_ : hyper_parameter_tuning_job_sort_by_options option)
    ?sort_order:(sort_order_ : sort_order option)
    ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?status_equals:(status_equals_ : hyper_parameter_tuning_job_status option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     name_contains = name_contains_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     status_equals = status_equals_;
   }
    : list_hyper_parameter_tuning_jobs_request)

let make_list_image_versions_response ?image_versions:(image_versions_ : image_versions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ image_versions = image_versions_; next_token = next_token_ } : list_image_versions_response)

let make_list_image_versions_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?sort_by:(sort_by_ : image_version_sort_by option)
    ?sort_order:(sort_order_ : image_version_sort_order option)
    ~image_name:(image_name_ : image_name) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     image_name = image_name_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     max_results = max_results_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_image_versions_request)

let make_list_images_response ?images:(images_ : images option)
    ?next_token:(next_token_ : next_token option) () =
  ({ images = images_; next_token = next_token_ } : list_images_response)

let make_list_images_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : image_name_contains option)
    ?next_token:(next_token_ : next_token option) ?sort_by:(sort_by_ : image_sort_by option)
    ?sort_order:(sort_order_ : image_sort_order option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_images_request)

let make_list_inference_components_output ?next_token:(next_token_ : pagination_token option)
    ~inference_components:(inference_components_ : inference_component_summary_list) () =
  ({ inference_components = inference_components_; next_token = next_token_ }
    : list_inference_components_output)

let make_list_inference_components_input ?sort_by:(sort_by_ : inference_component_sort_key option)
    ?sort_order:(sort_order_ : order_key option) ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : inference_component_name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : inference_component_status option)
    ?endpoint_name_equals:(endpoint_name_equals_ : endpoint_name option)
    ?variant_name_equals:(variant_name_equals_ : variant_name option) () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     status_equals = status_equals_;
     endpoint_name_equals = endpoint_name_equals_;
     variant_name_equals = variant_name_equals_;
   }
    : list_inference_components_input)

let make_list_inference_experiments_response
    ?inference_experiments:(inference_experiments_ : inference_experiment_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ inference_experiments = inference_experiments_; next_token = next_token_ }
    : list_inference_experiments_response)

let make_list_inference_experiments_request ?name_contains:(name_contains_ : name_contains option)
    ?type_:(type__ : inference_experiment_type option)
    ?status_equals:(status_equals_ : inference_experiment_status option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_inference_experiments_by option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     name_contains = name_contains_;
     type_ = type__;
     status_equals = status_equals_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_inference_experiments_request)

let make_list_inference_recommendations_job_steps_response
    ?steps:(steps_ : inference_recommendations_job_steps option)
    ?next_token:(next_token_ : next_token option) () =
  ({ steps = steps_; next_token = next_token_ } : list_inference_recommendations_job_steps_response)

let make_list_inference_recommendations_job_steps_request
    ?status:(status_ : recommendation_job_status option)
    ?step_type:(step_type_ : recommendation_step_type option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~job_name:(job_name_ : recommendation_job_name) () =
  ({
     job_name = job_name_;
     status = status_;
     step_type = step_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_inference_recommendations_job_steps_request)

let make_list_inference_recommendations_jobs_response ?next_token:(next_token_ : next_token option)
    ~inference_recommendations_jobs:
      (inference_recommendations_jobs_ : inference_recommendations_jobs) () =
  ({ inference_recommendations_jobs = inference_recommendations_jobs_; next_token = next_token_ }
    : list_inference_recommendations_jobs_response)

let make_list_inference_recommendations_jobs_request
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?name_contains:(name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : recommendation_job_status option)
    ?sort_by:(sort_by_ : list_inference_recommendations_jobs_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?model_name_equals:(model_name_equals_ : model_name option)
    ?model_package_version_arn_equals:(model_package_version_arn_equals_ : model_package_arn option)
    () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     model_name_equals = model_name_equals_;
     model_package_version_arn_equals = model_package_version_arn_equals_;
   }
    : list_inference_recommendations_jobs_request)

let make_list_job_schema_versions_response ?next_token:(next_token_ : next_token option)
    ~job_config_schemas:(job_config_schemas_ : job_config_schemas) () =
  ({ next_token = next_token_; job_config_schemas = job_config_schemas_ }
    : list_job_schema_versions_response)

let make_list_job_schema_versions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ~job_category:(job_category_ : job_category) ()
    =
  ({ job_category = job_category_; next_token = next_token_; max_results = max_results_ }
    : list_job_schema_versions_request)

let make_list_jobs_response ?next_token:(next_token_ : next_token option)
    ~job_summaries:(job_summaries_ : job_summaries) () =
  ({ next_token = next_token_; job_summaries = job_summaries_ } : list_jobs_response)

let make_list_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option) ?sort_by:(sort_by_ : sort_by option)
    ?sort_order:(sort_order_ : sort_order option)
    ?status_equals:(status_equals_ : job_status option) ~job_category:(job_category_ : job_category)
    () =
  ({
     job_category = job_category_;
     next_token = next_token_;
     max_results = max_results_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     status_equals = status_equals_;
   }
    : list_jobs_request)

let make_list_labeling_jobs_response
    ?labeling_job_summary_list:(labeling_job_summary_list_ : labeling_job_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ labeling_job_summary_list = labeling_job_summary_list_; next_token = next_token_ }
    : list_labeling_jobs_response)

let make_list_labeling_jobs_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : name_contains option) ?sort_by:(sort_by_ : sort_by option)
    ?sort_order:(sort_order_ : sort_order option)
    ?status_equals:(status_equals_ : labeling_job_status option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     status_equals = status_equals_;
   }
    : list_labeling_jobs_request)

let make_list_labeling_jobs_for_workteam_response ?next_token:(next_token_ : next_token option)
    ~labeling_job_summary_list:(labeling_job_summary_list_ : labeling_job_for_workteam_summary_list)
    () =
  ({ labeling_job_summary_list = labeling_job_summary_list_; next_token = next_token_ }
    : list_labeling_jobs_for_workteam_response)

let make_list_labeling_jobs_for_workteam_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?job_reference_code_contains:(job_reference_code_contains_ : job_reference_code_contains option)
    ?sort_by:(sort_by_ : list_labeling_jobs_for_workteam_sort_by_options option)
    ?sort_order:(sort_order_ : sort_order option) ~workteam_arn:(workteam_arn_ : workteam_arn) () =
  ({
     workteam_arn = workteam_arn_;
     max_results = max_results_;
     next_token = next_token_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     job_reference_code_contains = job_reference_code_contains_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_labeling_jobs_for_workteam_request)

let make_list_lineage_groups_response
    ?lineage_group_summaries:(lineage_group_summaries_ : lineage_group_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ lineage_group_summaries = lineage_group_summaries_; next_token = next_token_ }
    : list_lineage_groups_response)

let make_list_lineage_groups_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_lineage_groups_by option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_lineage_groups_request)

let make_mlflow_app_summary ?arn:(arn_ : mlflow_app_arn option)
    ?name:(name_ : mlflow_app_name option) ?status:(status_ : mlflow_app_status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option) () =
  ({
     arn = arn_;
     name = name_;
     status = status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     mlflow_version = mlflow_version_;
   }
    : mlflow_app_summary)

let make_list_mlflow_apps_response ?summaries:(summaries_ : mlflow_app_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_mlflow_apps_response)

let make_list_mlflow_apps_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?status:(status_ : mlflow_app_status option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?default_for_domain_id:(default_for_domain_id_ : string_ option)
    ?account_default_status:(account_default_status_ : account_default_status option)
    ?sort_by:(sort_by_ : sort_mlflow_app_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     status = status_;
     mlflow_version = mlflow_version_;
     default_for_domain_id = default_for_domain_id_;
     account_default_status = account_default_status_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_mlflow_apps_request)

let make_tracking_server_summary
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option)
    ?tracking_server_name:(tracking_server_name_ : tracking_server_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?tracking_server_status:(tracking_server_status_ : tracking_server_status option)
    ?is_active:(is_active_ : is_tracking_server_active option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option) () =
  ({
     tracking_server_arn = tracking_server_arn_;
     tracking_server_name = tracking_server_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     tracking_server_status = tracking_server_status_;
     is_active = is_active_;
     mlflow_version = mlflow_version_;
   }
    : tracking_server_summary)

let make_list_mlflow_tracking_servers_response
    ?tracking_server_summaries:(tracking_server_summaries_ : tracking_server_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tracking_server_summaries = tracking_server_summaries_; next_token = next_token_ }
    : list_mlflow_tracking_servers_response)

let make_list_mlflow_tracking_servers_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?tracking_server_status:(tracking_server_status_ : tracking_server_status option)
    ?mlflow_version:(mlflow_version_ : mlflow_version option)
    ?sort_by:(sort_by_ : sort_tracking_server_by option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     tracking_server_status = tracking_server_status_;
     mlflow_version = mlflow_version_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_mlflow_tracking_servers_request)

let make_list_model_bias_job_definitions_response ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ job_definition_summaries = job_definition_summaries_; next_token = next_token_ }
    : list_model_bias_job_definitions_response)

let make_list_model_bias_job_definitions_request
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     endpoint_name = endpoint_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_model_bias_job_definitions_request)

let make_model_card_export_job_summary
    ~model_card_export_job_name:(model_card_export_job_name_ : entity_name)
    ~model_card_export_job_arn:(model_card_export_job_arn_ : model_card_export_job_arn)
    ~status:(status_ : model_card_export_job_status)
    ~model_card_name:(model_card_name_ : entity_name)
    ~model_card_version:(model_card_version_ : integer) ~created_at:(created_at_ : timestamp)
    ~last_modified_at:(last_modified_at_ : timestamp) () =
  ({
     model_card_export_job_name = model_card_export_job_name_;
     model_card_export_job_arn = model_card_export_job_arn_;
     status = status_;
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     created_at = created_at_;
     last_modified_at = last_modified_at_;
   }
    : model_card_export_job_summary)

let make_list_model_card_export_jobs_response ?next_token:(next_token_ : next_token option)
    ~model_card_export_job_summaries:
      (model_card_export_job_summaries_ : model_card_export_job_summary_list) () =
  ({ model_card_export_job_summaries = model_card_export_job_summaries_; next_token = next_token_ }
    : list_model_card_export_jobs_response)

let make_list_model_card_export_jobs_request
    ?model_card_version:(model_card_version_ : integer option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?model_card_export_job_name_contains:(model_card_export_job_name_contains_ : entity_name option)
    ?status_equals:(status_equals_ : model_card_export_job_status option)
    ?sort_by:(sort_by_ : model_card_export_job_sort_by option)
    ?sort_order:(sort_order_ : model_card_export_job_sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~model_card_name:(model_card_name_ : entity_name) () =
  ({
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     model_card_export_job_name_contains = model_card_export_job_name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_model_card_export_jobs_request)

let make_model_card_version_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ~model_card_name:(model_card_name_ : entity_name)
    ~model_card_arn:(model_card_arn_ : model_card_arn)
    ~model_card_status:(model_card_status_ : model_card_status)
    ~model_card_version:(model_card_version_ : integer) ~creation_time:(creation_time_ : timestamp)
    () =
  ({
     model_card_name = model_card_name_;
     model_card_arn = model_card_arn_;
     model_card_status = model_card_status_;
     model_card_version = model_card_version_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : model_card_version_summary)

let make_list_model_card_versions_response ?next_token:(next_token_ : next_token option)
    ~model_card_version_summary_list:
      (model_card_version_summary_list_ : model_card_version_summary_list) () =
  ({ model_card_version_summary_list = model_card_version_summary_list_; next_token = next_token_ }
    : list_model_card_versions_response)

let make_list_model_card_versions_request
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?next_token:(next_token_ : next_token option)
    ?sort_by:(sort_by_ : model_card_version_sort_by option)
    ?sort_order:(sort_order_ : model_card_sort_order option)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     model_card_name = model_card_name_;
     model_card_status = model_card_status_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_model_card_versions_request)

let make_model_card_summary ?last_modified_time:(last_modified_time_ : timestamp option)
    ~model_card_name:(model_card_name_ : entity_name)
    ~model_card_arn:(model_card_arn_ : model_card_arn)
    ~model_card_status:(model_card_status_ : model_card_status)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     model_card_name = model_card_name_;
     model_card_arn = model_card_arn_;
     model_card_status = model_card_status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : model_card_summary)

let make_list_model_cards_response ?next_token:(next_token_ : next_token option)
    ~model_card_summaries:(model_card_summaries_ : model_card_summary_list) () =
  ({ model_card_summaries = model_card_summaries_; next_token = next_token_ }
    : list_model_cards_response)

let make_list_model_cards_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : entity_name option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?next_token:(next_token_ : next_token option) ?sort_by:(sort_by_ : model_card_sort_by option)
    ?sort_order:(sort_order_ : model_card_sort_order option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     model_card_status = model_card_status_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_model_cards_request)

let make_list_model_explainability_job_definitions_response
    ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ job_definition_summaries = job_definition_summaries_; next_token = next_token_ }
    : list_model_explainability_job_definitions_response)

let make_list_model_explainability_job_definitions_request
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     endpoint_name = endpoint_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_model_explainability_job_definitions_request)

let make_model_metadata_summary ~domain:(domain_ : string_) ~framework:(framework_ : string_)
    ~task:(task_ : string_) ~model:(model_ : string_)
    ~framework_version:(framework_version_ : string_) () =
  ({
     domain = domain_;
     framework = framework_;
     task = task_;
     model = model_;
     framework_version = framework_version_;
   }
    : model_metadata_summary)

let make_list_model_metadata_response ?next_token:(next_token_ : next_token option)
    ~model_metadata_summaries:(model_metadata_summaries_ : model_metadata_summaries) () =
  ({ model_metadata_summaries = model_metadata_summaries_; next_token = next_token_ }
    : list_model_metadata_response)

let make_model_metadata_filter ~name:(name_ : model_metadata_filter_type)
    ~value:(value_ : string256) () =
  ({ name = name_; value = value_ } : model_metadata_filter)

let make_model_metadata_search_expression ?filters:(filters_ : model_metadata_filters option) () =
  ({ filters = filters_ } : model_metadata_search_expression)

let make_list_model_metadata_request
    ?search_expression:(search_expression_ : model_metadata_search_expression option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ search_expression = search_expression_; next_token = next_token_; max_results = max_results_ }
    : list_model_metadata_request)

let make_model_package_group_summary
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ?managed_configuration:(managed_configuration_ : managed_configuration option)
    ~model_package_group_name:(model_package_group_name_ : entity_name)
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~model_package_group_status:(model_package_group_status_ : model_package_group_status) () =
  ({
     model_package_group_name = model_package_group_name_;
     model_package_group_arn = model_package_group_arn_;
     model_package_group_description = model_package_group_description_;
     creation_time = creation_time_;
     model_package_group_status = model_package_group_status_;
     managed_configuration = managed_configuration_;
   }
    : model_package_group_summary)

let make_list_model_package_groups_output ?next_token:(next_token_ : next_token option)
    ~model_package_group_summary_list:
      (model_package_group_summary_list_ : model_package_group_summary_list) () =
  ({
     model_package_group_summary_list = model_package_group_summary_list_;
     next_token = next_token_;
   }
    : list_model_package_groups_output)

let make_list_model_package_groups_input
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?next_token:(next_token_ : next_token option)
    ?sort_by:(sort_by_ : model_package_group_sort_by option)
    ?sort_order:(sort_order_ : sort_order option)
    ?cross_account_filter_option:(cross_account_filter_option_ : cross_account_filter_option option)
    () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     cross_account_filter_option = cross_account_filter_option_;
   }
    : list_model_package_groups_input)

let make_model_package_summary ?model_package_name:(model_package_name_ : entity_name option)
    ?model_package_group_name:(model_package_group_name_ : entity_name option)
    ?model_package_version:(model_package_version_ : model_package_version option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ~model_package_arn:(model_package_arn_ : model_package_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~model_package_status:(model_package_status_ : model_package_status) () =
  ({
     model_package_name = model_package_name_;
     model_package_group_name = model_package_group_name_;
     model_package_version = model_package_version_;
     model_package_arn = model_package_arn_;
     model_package_description = model_package_description_;
     creation_time = creation_time_;
     model_package_status = model_package_status_;
     model_approval_status = model_approval_status_;
     model_life_cycle = model_life_cycle_;
     model_package_registration_type = model_package_registration_type_;
   }
    : model_package_summary)

let make_list_model_packages_output ?next_token:(next_token_ : next_token option)
    ~model_package_summary_list:(model_package_summary_list_ : model_package_summary_list) () =
  ({ model_package_summary_list = model_package_summary_list_; next_token = next_token_ }
    : list_model_packages_output)

let make_list_model_packages_input
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?model_package_group_name:(model_package_group_name_ : arn_or_name option)
    ?model_package_type:(model_package_type_ : model_package_type option)
    ?next_token:(next_token_ : next_token option) ?sort_by:(sort_by_ : model_package_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     model_approval_status = model_approval_status_;
     model_package_group_name = model_package_group_name_;
     model_package_type = model_package_type_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_model_packages_input)

let make_list_model_quality_job_definitions_response ?next_token:(next_token_ : next_token option)
    ~job_definition_summaries:(job_definition_summaries_ : monitoring_job_definition_summary_list)
    () =
  ({ job_definition_summaries = job_definition_summaries_; next_token = next_token_ }
    : list_model_quality_job_definitions_response)

let make_list_model_quality_job_definitions_request
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?sort_by:(sort_by_ : monitoring_job_definition_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     endpoint_name = endpoint_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_model_quality_job_definitions_request)

let make_model_summary ~model_name:(model_name_ : model_name) ~model_arn:(model_arn_ : model_arn)
    ~creation_time:(creation_time_ : timestamp) () =
  ({ model_name = model_name_; model_arn = model_arn_; creation_time = creation_time_ }
    : model_summary)

let make_list_models_output ?next_token:(next_token_ : pagination_token option)
    ~models:(models_ : model_summary_list) () =
  ({ models = models_; next_token = next_token_ } : list_models_output)

let make_list_models_input ?sort_by:(sort_by_ : model_sort_key option)
    ?sort_order:(sort_order_ : order_key option) ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : model_name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option) () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
   }
    : list_models_input)

let make_monitoring_alert_history_summary
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name)
    ~creation_time:(creation_time_ : timestamp)
    ~alert_status:(alert_status_ : monitoring_alert_status) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_alert_name = monitoring_alert_name_;
     creation_time = creation_time_;
     alert_status = alert_status_;
   }
    : monitoring_alert_history_summary)

let make_list_monitoring_alert_history_response
    ?monitoring_alert_history:(monitoring_alert_history_ : monitoring_alert_history_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ monitoring_alert_history = monitoring_alert_history_; next_token = next_token_ }
    : list_monitoring_alert_history_response)

let make_list_monitoring_alert_history_request
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option)
    ?monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name option)
    ?sort_by:(sort_by_ : monitoring_alert_history_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : monitoring_alert_status option) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_alert_name = monitoring_alert_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     status_equals = status_equals_;
   }
    : list_monitoring_alert_history_request)

let make_model_dashboard_indicator_action ?enabled:(enabled_ : boolean_ option) () =
  ({ enabled = enabled_ } : model_dashboard_indicator_action)

let make_monitoring_alert_actions
    ?model_dashboard_indicator:
      (model_dashboard_indicator_ : model_dashboard_indicator_action option) () =
  ({ model_dashboard_indicator = model_dashboard_indicator_ } : monitoring_alert_actions)

let make_monitoring_alert_summary
    ~monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~alert_status:(alert_status_ : monitoring_alert_status)
    ~datapoints_to_alert:(datapoints_to_alert_ : monitoring_datapoints_to_alert)
    ~evaluation_period:(evaluation_period_ : monitoring_evaluation_period)
    ~actions:(actions_ : monitoring_alert_actions) () =
  ({
     monitoring_alert_name = monitoring_alert_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     alert_status = alert_status_;
     datapoints_to_alert = datapoints_to_alert_;
     evaluation_period = evaluation_period_;
     actions = actions_;
   }
    : monitoring_alert_summary)

let make_list_monitoring_alerts_response
    ?monitoring_alert_summaries:(monitoring_alert_summaries_ : monitoring_alert_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ monitoring_alert_summaries = monitoring_alert_summaries_; next_token = next_token_ }
    : list_monitoring_alerts_response)

let make_list_monitoring_alerts_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_monitoring_alerts_request)

let make_list_monitoring_executions_response ?next_token:(next_token_ : next_token option)
    ~monitoring_execution_summaries:
      (monitoring_execution_summaries_ : monitoring_execution_summary_list) () =
  ({ monitoring_execution_summaries = monitoring_execution_summaries_; next_token = next_token_ }
    : list_monitoring_executions_response)

let make_list_monitoring_executions_request
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?sort_by:(sort_by_ : monitoring_execution_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?scheduled_time_before:(scheduled_time_before_ : timestamp option)
    ?scheduled_time_after:(scheduled_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : execution_status option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?monitoring_type_equals:(monitoring_type_equals_ : monitoring_type option) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     endpoint_name = endpoint_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     scheduled_time_before = scheduled_time_before_;
     scheduled_time_after = scheduled_time_after_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     status_equals = status_equals_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     monitoring_type_equals = monitoring_type_equals_;
   }
    : list_monitoring_executions_request)

let make_monitoring_schedule_summary ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn)
    ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     monitoring_schedule_status = monitoring_schedule_status_;
     endpoint_name = endpoint_name_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     monitoring_type = monitoring_type_;
   }
    : monitoring_schedule_summary)

let make_list_monitoring_schedules_response ?next_token:(next_token_ : next_token option)
    ~monitoring_schedule_summaries:
      (monitoring_schedule_summaries_ : monitoring_schedule_summary_list) () =
  ({ monitoring_schedule_summaries = monitoring_schedule_summaries_; next_token = next_token_ }
    : list_monitoring_schedules_response)

let make_list_monitoring_schedules_request ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?sort_by:(sort_by_ : monitoring_schedule_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : name_contains option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?status_equals:(status_equals_ : schedule_status option)
    ?monitoring_job_definition_name:
      (monitoring_job_definition_name_ : monitoring_job_definition_name option)
    ?monitoring_type_equals:(monitoring_type_equals_ : monitoring_type option) () =
  ({
     endpoint_name = endpoint_name_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     status_equals = status_equals_;
     monitoring_job_definition_name = monitoring_job_definition_name_;
     monitoring_type_equals = monitoring_type_equals_;
   }
    : list_monitoring_schedules_request)

let make_notebook_instance_lifecycle_config_summary
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name)
    ~notebook_instance_lifecycle_config_arn:
      (notebook_instance_lifecycle_config_arn_ : notebook_instance_lifecycle_config_arn) () =
  ({
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     notebook_instance_lifecycle_config_arn = notebook_instance_lifecycle_config_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : notebook_instance_lifecycle_config_summary)

let make_list_notebook_instance_lifecycle_configs_output
    ?next_token:(next_token_ : next_token option)
    ?notebook_instance_lifecycle_configs:
      (notebook_instance_lifecycle_configs_ : notebook_instance_lifecycle_config_summary_list option)
    () =
  ({
     next_token = next_token_;
     notebook_instance_lifecycle_configs = notebook_instance_lifecycle_configs_;
   }
    : list_notebook_instance_lifecycle_configs_output)

let make_list_notebook_instance_lifecycle_configs_input
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?sort_by:(sort_by_ : notebook_instance_lifecycle_config_sort_key option)
    ?sort_order:(sort_order_ : notebook_instance_lifecycle_config_sort_order option)
    ?name_contains:(name_contains_ : notebook_instance_lifecycle_config_name_contains option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
   }
    : list_notebook_instance_lifecycle_configs_input)

let make_notebook_instance_summary
    ?notebook_instance_status:(notebook_instance_status_ : notebook_instance_status option)
    ?url:(url_ : notebook_instance_url option)
    ?instance_type:(instance_type_ : instance_type option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name)
    ~notebook_instance_arn:(notebook_instance_arn_ : notebook_instance_arn) () =
  ({
     notebook_instance_name = notebook_instance_name_;
     notebook_instance_arn = notebook_instance_arn_;
     notebook_instance_status = notebook_instance_status_;
     url = url_;
     instance_type = instance_type_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     default_code_repository = default_code_repository_;
     additional_code_repositories = additional_code_repositories_;
   }
    : notebook_instance_summary)

let make_list_notebook_instances_output ?next_token:(next_token_ : next_token option)
    ?notebook_instances:(notebook_instances_ : notebook_instance_summary_list option) () =
  ({ next_token = next_token_; notebook_instances = notebook_instances_ }
    : list_notebook_instances_output)

let make_list_notebook_instances_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?sort_by:(sort_by_ : notebook_instance_sort_key option)
    ?sort_order:(sort_order_ : notebook_instance_sort_order option)
    ?name_contains:(name_contains_ : notebook_instance_name_contains option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?status_equals:(status_equals_ : notebook_instance_status option)
    ?notebook_instance_lifecycle_config_name_contains:
      (notebook_instance_lifecycle_config_name_contains_ :
         notebook_instance_lifecycle_config_name option)
    ?default_code_repository_contains:
      (default_code_repository_contains_ : code_repository_contains option)
    ?additional_code_repository_equals:
      (additional_code_repository_equals_ : code_repository_name_or_url option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     name_contains = name_contains_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     last_modified_time_before = last_modified_time_before_;
     last_modified_time_after = last_modified_time_after_;
     status_equals = status_equals_;
     notebook_instance_lifecycle_config_name_contains =
       notebook_instance_lifecycle_config_name_contains_;
     default_code_repository_contains = default_code_repository_contains_;
     additional_code_repository_equals = additional_code_repository_equals_;
   }
    : list_notebook_instances_input)

let make_optimization_job_summary
    ?optimization_start_time:(optimization_start_time_ : timestamp option)
    ?optimization_end_time:(optimization_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?max_instance_count:(max_instance_count_ : optimization_job_max_instance_count option)
    ~optimization_job_name:(optimization_job_name_ : entity_name)
    ~optimization_job_arn:(optimization_job_arn_ : optimization_job_arn)
    ~creation_time:(creation_time_ : creation_time)
    ~optimization_job_status:(optimization_job_status_ : optimization_job_status)
    ~deployment_instance_type:
      (deployment_instance_type_ : optimization_job_deployment_instance_type)
    ~optimization_types:(optimization_types_ : optimization_types) () =
  ({
     optimization_job_name = optimization_job_name_;
     optimization_job_arn = optimization_job_arn_;
     creation_time = creation_time_;
     optimization_job_status = optimization_job_status_;
     optimization_start_time = optimization_start_time_;
     optimization_end_time = optimization_end_time_;
     last_modified_time = last_modified_time_;
     deployment_instance_type = deployment_instance_type_;
     max_instance_count = max_instance_count_;
     optimization_types = optimization_types_;
   }
    : optimization_job_summary)

let make_list_optimization_jobs_response ?next_token:(next_token_ : next_token option)
    ~optimization_job_summaries:(optimization_job_summaries_ : optimization_job_summaries) () =
  ({ optimization_job_summaries = optimization_job_summaries_; next_token = next_token_ }
    : list_optimization_jobs_response)

let make_list_optimization_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_after:(creation_time_after_ : creation_time option)
    ?creation_time_before:(creation_time_before_ : creation_time option)
    ?last_modified_time_after:(last_modified_time_after_ : last_modified_time option)
    ?last_modified_time_before:(last_modified_time_before_ : last_modified_time option)
    ?optimization_contains:(optimization_contains_ : name_contains option)
    ?name_contains:(name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : optimization_job_status option)
    ?sort_by:(sort_by_ : list_optimization_jobs_sort_by option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     optimization_contains = optimization_contains_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_optimization_jobs_request)

let make_partner_app_summary ?arn:(arn_ : partner_app_arn option)
    ?name:(name_ : partner_app_name option) ?type_:(type__ : partner_app_type option)
    ?status:(status_ : partner_app_status option) ?creation_time:(creation_time_ : timestamp option)
    () =
  ({ arn = arn_; name = name_; type_ = type__; status = status_; creation_time = creation_time_ }
    : partner_app_summary)

let make_list_partner_apps_response ?summaries:(summaries_ : partner_app_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summaries = summaries_; next_token = next_token_ } : list_partner_apps_response)

let make_list_partner_apps_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_partner_apps_request)

let make_quality_check_step_metadata ?check_type:(check_type_ : string256 option)
    ?baseline_used_for_drift_check_statistics:
      (baseline_used_for_drift_check_statistics_ : string1024 option)
    ?baseline_used_for_drift_check_constraints:
      (baseline_used_for_drift_check_constraints_ : string1024 option)
    ?calculated_baseline_statistics:(calculated_baseline_statistics_ : string1024 option)
    ?calculated_baseline_constraints:(calculated_baseline_constraints_ : string1024 option)
    ?model_package_group_name:(model_package_group_name_ : string256 option)
    ?violation_report:(violation_report_ : string1024 option)
    ?check_job_arn:(check_job_arn_ : string256 option) ?skip_check:(skip_check_ : boolean_ option)
    ?register_new_baseline:(register_new_baseline_ : boolean_ option) () =
  ({
     check_type = check_type_;
     baseline_used_for_drift_check_statistics = baseline_used_for_drift_check_statistics_;
     baseline_used_for_drift_check_constraints = baseline_used_for_drift_check_constraints_;
     calculated_baseline_statistics = calculated_baseline_statistics_;
     calculated_baseline_constraints = calculated_baseline_constraints_;
     model_package_group_name = model_package_group_name_;
     violation_report = violation_report_;
     check_job_arn = check_job_arn_;
     skip_check = skip_check_;
     register_new_baseline = register_new_baseline_;
   }
    : quality_check_step_metadata)

let make_register_model_step_metadata ?arn:(arn_ : string256 option) () =
  ({ arn = arn_ } : register_model_step_metadata)

let make_model_step_metadata ?arn:(arn_ : string256 option) () =
  ({ arn = arn_ } : model_step_metadata)

let make_tuning_job_step_meta_data ?arn:(arn_ : hyper_parameter_tuning_job_arn option) () =
  ({ arn = arn_ } : tuning_job_step_meta_data)

let make_transform_job_step_metadata ?arn:(arn_ : transform_job_arn option) () =
  ({ arn = arn_ } : transform_job_step_metadata)

let make_processing_job_step_metadata ?arn:(arn_ : processing_job_arn option) () =
  ({ arn = arn_ } : processing_job_step_metadata)

let make_training_job_step_metadata ?arn:(arn_ : training_job_arn option) () =
  ({ arn = arn_ } : training_job_step_metadata)

let make_pipeline_execution_step_metadata
    ?training_job:(training_job_ : training_job_step_metadata option)
    ?processing_job:(processing_job_ : processing_job_step_metadata option)
    ?transform_job:(transform_job_ : transform_job_step_metadata option)
    ?tuning_job:(tuning_job_ : tuning_job_step_meta_data option)
    ?model:(model_ : model_step_metadata option)
    ?register_model:(register_model_ : register_model_step_metadata option)
    ?condition:(condition_ : condition_step_metadata option)
    ?callback:(callback_ : callback_step_metadata option)
    ?lambda:(lambda_ : lambda_step_metadata option) ?em_r:(em_r_ : emr_step_metadata option)
    ?quality_check:(quality_check_ : quality_check_step_metadata option)
    ?clarify_check:(clarify_check_ : clarify_check_step_metadata option)
    ?fail:(fail_ : fail_step_metadata option)
    ?auto_ml_job:(auto_ml_job_ : auto_ml_job_step_metadata option)
    ?endpoint:(endpoint_ : endpoint_step_metadata option)
    ?endpoint_config:(endpoint_config_ : endpoint_config_step_metadata option)
    ?bedrock_custom_model:(bedrock_custom_model_ : bedrock_custom_model_metadata option)
    ?bedrock_custom_model_deployment:
      (bedrock_custom_model_deployment_ : bedrock_custom_model_deployment_metadata option)
    ?bedrock_provisioned_model_throughput:
      (bedrock_provisioned_model_throughput_ : bedrock_provisioned_model_throughput_metadata option)
    ?bedrock_model_import:(bedrock_model_import_ : bedrock_model_import_metadata option)
    ?inference_component:(inference_component_ : inference_component_metadata option)
    ?lineage:(lineage_ : lineage_metadata option) ?job:(job_ : job_step_metadata option) () =
  ({
     training_job = training_job_;
     processing_job = processing_job_;
     transform_job = transform_job_;
     tuning_job = tuning_job_;
     model = model_;
     register_model = register_model_;
     condition = condition_;
     callback = callback_;
     lambda = lambda_;
     em_r = em_r_;
     quality_check = quality_check_;
     clarify_check = clarify_check_;
     fail = fail_;
     auto_ml_job = auto_ml_job_;
     endpoint = endpoint_;
     endpoint_config = endpoint_config_;
     bedrock_custom_model = bedrock_custom_model_;
     bedrock_custom_model_deployment = bedrock_custom_model_deployment_;
     bedrock_provisioned_model_throughput = bedrock_provisioned_model_throughput_;
     bedrock_model_import = bedrock_model_import_;
     inference_component = inference_component_;
     lineage = lineage_;
     job = job_;
   }
    : pipeline_execution_step_metadata)

let make_pipeline_execution_step ?step_name:(step_name_ : step_name option)
    ?step_display_name:(step_display_name_ : step_display_name option)
    ?step_description:(step_description_ : step_description option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?step_status:(step_status_ : step_status option)
    ?cache_hit_result:(cache_hit_result_ : cache_hit_result option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?metadata:(metadata_ : pipeline_execution_step_metadata option)
    ?attempt_count:(attempt_count_ : integer option)
    ?selective_execution_result:(selective_execution_result_ : selective_execution_result option) ()
    =
  ({
     step_name = step_name_;
     step_display_name = step_display_name_;
     step_description = step_description_;
     start_time = start_time_;
     end_time = end_time_;
     step_status = step_status_;
     cache_hit_result = cache_hit_result_;
     failure_reason = failure_reason_;
     metadata = metadata_;
     attempt_count = attempt_count_;
     selective_execution_result = selective_execution_result_;
   }
    : pipeline_execution_step)

let make_list_pipeline_execution_steps_response
    ?pipeline_execution_steps:(pipeline_execution_steps_ : pipeline_execution_step_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pipeline_execution_steps = pipeline_execution_steps_; next_token = next_token_ }
    : list_pipeline_execution_steps_response)

let make_list_pipeline_execution_steps_request
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     pipeline_execution_arn = pipeline_execution_arn_;
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
   }
    : list_pipeline_execution_steps_request)

let make_pipeline_execution_summary
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option)
    ?start_time:(start_time_ : timestamp option)
    ?pipeline_execution_status:(pipeline_execution_status_ : pipeline_execution_status option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_execution_failure_reason:(pipeline_execution_failure_reason_ : string3072 option) () =
  ({
     pipeline_execution_arn = pipeline_execution_arn_;
     start_time = start_time_;
     pipeline_execution_status = pipeline_execution_status_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_execution_failure_reason = pipeline_execution_failure_reason_;
   }
    : pipeline_execution_summary)

let make_list_pipeline_executions_response
    ?pipeline_execution_summaries:
      (pipeline_execution_summaries_ : pipeline_execution_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pipeline_execution_summaries = pipeline_execution_summaries_; next_token = next_token_ }
    : list_pipeline_executions_response)

let make_list_pipeline_executions_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_pipeline_executions_by option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn) () =
  ({
     pipeline_name = pipeline_name_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_pipeline_executions_request)

let make_parameter ~name:(name_ : pipeline_parameter_name) ~value:(value_ : string1024) () =
  ({ name = name_; value = value_ } : parameter)

let make_list_pipeline_parameters_for_execution_response
    ?pipeline_parameters:(pipeline_parameters_ : parameter_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pipeline_parameters = pipeline_parameters_; next_token = next_token_ }
    : list_pipeline_parameters_for_execution_response)

let make_list_pipeline_parameters_for_execution_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({
     pipeline_execution_arn = pipeline_execution_arn_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_pipeline_parameters_for_execution_request)

let make_pipeline_version_summary ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?creation_time:(creation_time_ : timestamp option)
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?last_execution_pipeline_execution_arn:
      (last_execution_pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_version_id = pipeline_version_id_;
     creation_time = creation_time_;
     pipeline_version_description = pipeline_version_description_;
     pipeline_version_display_name = pipeline_version_display_name_;
     last_execution_pipeline_execution_arn = last_execution_pipeline_execution_arn_;
   }
    : pipeline_version_summary)

let make_list_pipeline_versions_response
    ?pipeline_version_summaries:(pipeline_version_summaries_ : pipeline_version_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pipeline_version_summaries = pipeline_version_summaries_; next_token = next_token_ }
    : list_pipeline_versions_response)

let make_list_pipeline_versions_request ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_order:(sort_order_ : sort_order option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn) () =
  ({
     pipeline_name = pipeline_name_;
     created_after = created_after_;
     created_before = created_before_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_pipeline_versions_request)

let make_pipeline_summary ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?role_arn:(role_arn_ : role_arn option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_execution_time:(last_execution_time_ : timestamp option) () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_name = pipeline_name_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_description = pipeline_description_;
     role_arn = role_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_execution_time = last_execution_time_;
   }
    : pipeline_summary)

let make_list_pipelines_response
    ?pipeline_summaries:(pipeline_summaries_ : pipeline_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ pipeline_summaries = pipeline_summaries_; next_token = next_token_ } : list_pipelines_response)

let make_list_pipelines_request ?pipeline_name_prefix:(pipeline_name_prefix_ : pipeline_name option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_pipelines_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     pipeline_name_prefix = pipeline_name_prefix_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_pipelines_request)

let make_processing_job_summary ?processing_end_time:(processing_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?exit_message:(exit_message_ : exit_message option)
    ~processing_job_name:(processing_job_name_ : processing_job_name)
    ~processing_job_arn:(processing_job_arn_ : processing_job_arn)
    ~creation_time:(creation_time_ : timestamp)
    ~processing_job_status:(processing_job_status_ : processing_job_status) () =
  ({
     processing_job_name = processing_job_name_;
     processing_job_arn = processing_job_arn_;
     creation_time = creation_time_;
     processing_end_time = processing_end_time_;
     last_modified_time = last_modified_time_;
     processing_job_status = processing_job_status_;
     failure_reason = failure_reason_;
     exit_message = exit_message_;
   }
    : processing_job_summary)

let make_list_processing_jobs_response ?next_token:(next_token_ : next_token option)
    ~processing_job_summaries:(processing_job_summaries_ : processing_job_summaries) () =
  ({ processing_job_summaries = processing_job_summaries_; next_token = next_token_ }
    : list_processing_jobs_response)

let make_list_processing_jobs_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : string_ option)
    ?status_equals:(status_equals_ : processing_job_status option)
    ?sort_by:(sort_by_ : sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_processing_jobs_request)

let make_project_summary ?project_description:(project_description_ : entity_description option)
    ~project_name:(project_name_ : project_entity_name) ~project_arn:(project_arn_ : project_arn)
    ~project_id:(project_id_ : project_id) ~creation_time:(creation_time_ : timestamp)
    ~project_status:(project_status_ : project_status) () =
  ({
     project_name = project_name_;
     project_description = project_description_;
     project_arn = project_arn_;
     project_id = project_id_;
     creation_time = creation_time_;
     project_status = project_status_;
   }
    : project_summary)

let make_list_projects_output ?next_token:(next_token_ : next_token option)
    ~project_summary_list:(project_summary_list_ : project_summary_list) () =
  ({ project_summary_list = project_summary_list_; next_token = next_token_ }
    : list_projects_output)

let make_list_projects_input ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?max_results:(max_results_ : max_results option)
    ?name_contains:(name_contains_ : project_entity_name option)
    ?next_token:(next_token_ : next_token option) ?sort_by:(sort_by_ : project_sort_by option)
    ?sort_order:(sort_order_ : project_sort_order option) () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     max_results = max_results_;
     name_contains = name_contains_;
     next_token = next_token_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_projects_input)

let make_resource_catalog ~resource_catalog_arn:(resource_catalog_arn_ : resource_catalog_arn)
    ~resource_catalog_name:(resource_catalog_name_ : resource_catalog_name)
    ~description:(description_ : resource_catalog_description)
    ~creation_time:(creation_time_ : timestamp) () =
  ({
     resource_catalog_arn = resource_catalog_arn_;
     resource_catalog_name = resource_catalog_name_;
     description = description_;
     creation_time = creation_time_;
   }
    : resource_catalog)

let make_list_resource_catalogs_response
    ?resource_catalogs:(resource_catalogs_ : resource_catalog_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resource_catalogs = resource_catalogs_; next_token = next_token_ }
    : list_resource_catalogs_response)

let make_list_resource_catalogs_request
    ?name_contains:(name_contains_ : resource_catalog_name option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?sort_order:(sort_order_ : resource_catalog_sort_order option)
    ?sort_by:(sort_by_ : resource_catalog_sort_by option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({
     name_contains = name_contains_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_resource_catalogs_request)

let make_ownership_settings_summary
    ?owner_user_profile_name:(owner_user_profile_name_ : user_profile_name option) () =
  ({ owner_user_profile_name = owner_user_profile_name_ } : ownership_settings_summary)

let make_space_sharing_settings_summary ?sharing_type:(sharing_type_ : sharing_type option) () =
  ({ sharing_type = sharing_type_ } : space_sharing_settings_summary)

let make_space_settings_summary ?app_type:(app_type_ : app_type option)
    ?remote_access:(remote_access_ : feature_status option)
    ?space_storage_settings:(space_storage_settings_ : space_storage_settings option) () =
  ({
     app_type = app_type_;
     remote_access = remote_access_;
     space_storage_settings = space_storage_settings_;
   }
    : space_settings_summary)

let make_space_details ?domain_id:(domain_id_ : domain_id option)
    ?space_name:(space_name_ : space_name option) ?status:(status_ : space_status option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option)
    ?space_settings_summary:(space_settings_summary_ : space_settings_summary option)
    ?space_sharing_settings_summary:
      (space_sharing_settings_summary_ : space_sharing_settings_summary option)
    ?ownership_settings_summary:(ownership_settings_summary_ : ownership_settings_summary option)
    ?space_display_name:(space_display_name_ : non_empty_string64 option) () =
  ({
     domain_id = domain_id_;
     space_name = space_name_;
     status = status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     space_settings_summary = space_settings_summary_;
     space_sharing_settings_summary = space_sharing_settings_summary_;
     ownership_settings_summary = ownership_settings_summary_;
     space_display_name = space_display_name_;
   }
    : space_details)

let make_list_spaces_response ?spaces:(spaces_ : space_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ spaces = spaces_; next_token = next_token_ } : list_spaces_response)

let make_list_spaces_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : space_sort_key option)
    ?domain_id_equals:(domain_id_equals_ : domain_id option)
    ?space_name_contains:(space_name_contains_ : space_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     domain_id_equals = domain_id_equals_;
     space_name_contains = space_name_contains_;
   }
    : list_spaces_request)

let make_list_stage_devices_response ?next_token:(next_token_ : next_token option)
    ~device_deployment_summaries:(device_deployment_summaries_ : device_deployment_summaries) () =
  ({ device_deployment_summaries = device_deployment_summaries_; next_token = next_token_ }
    : list_stage_devices_response)

let make_list_stage_devices_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_max_results option)
    ?exclude_devices_deployed_in_other_stage:
      (exclude_devices_deployed_in_other_stage_ : boolean_ option)
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~stage_name:(stage_name_ : entity_name) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     edge_deployment_plan_name = edge_deployment_plan_name_;
     exclude_devices_deployed_in_other_stage = exclude_devices_deployed_in_other_stage_;
     stage_name = stage_name_;
   }
    : list_stage_devices_request)

let make_studio_lifecycle_config_details
    ?studio_lifecycle_config_arn:(studio_lifecycle_config_arn_ : studio_lifecycle_config_arn option)
    ?studio_lifecycle_config_name:
      (studio_lifecycle_config_name_ : studio_lifecycle_config_name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?studio_lifecycle_config_app_type:
      (studio_lifecycle_config_app_type_ : studio_lifecycle_config_app_type option) () =
  ({
     studio_lifecycle_config_arn = studio_lifecycle_config_arn_;
     studio_lifecycle_config_name = studio_lifecycle_config_name_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     studio_lifecycle_config_app_type = studio_lifecycle_config_app_type_;
   }
    : studio_lifecycle_config_details)

let make_list_studio_lifecycle_configs_response ?next_token:(next_token_ : next_token option)
    ?studio_lifecycle_configs:(studio_lifecycle_configs_ : studio_lifecycle_configs_list option) ()
    =
  ({ next_token = next_token_; studio_lifecycle_configs = studio_lifecycle_configs_ }
    : list_studio_lifecycle_configs_response)

let make_list_studio_lifecycle_configs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?name_contains:(name_contains_ : studio_lifecycle_config_name option)
    ?app_type_equals:(app_type_equals_ : studio_lifecycle_config_app_type option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?modified_time_before:(modified_time_before_ : timestamp option)
    ?modified_time_after:(modified_time_after_ : timestamp option)
    ?sort_by:(sort_by_ : studio_lifecycle_config_sort_key option)
    ?sort_order:(sort_order_ : sort_order option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     name_contains = name_contains_;
     app_type_equals = app_type_equals_;
     creation_time_before = creation_time_before_;
     creation_time_after = creation_time_after_;
     modified_time_before = modified_time_before_;
     modified_time_after = modified_time_after_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_studio_lifecycle_configs_request)

let make_list_subscribed_workteams_response ?next_token:(next_token_ : next_token option)
    ~subscribed_workteams:(subscribed_workteams_ : subscribed_workteams) () =
  ({ subscribed_workteams = subscribed_workteams_; next_token = next_token_ }
    : list_subscribed_workteams_response)

let make_list_subscribed_workteams_request ?name_contains:(name_contains_ : workteam_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ name_contains = name_contains_; next_token = next_token_; max_results = max_results_ }
    : list_subscribed_workteams_request)

let make_list_tags_output ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_output)

let make_list_tags_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : list_tags_max_results option)
    ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_; next_token = next_token_; max_results = max_results_ }
    : list_tags_input)

let make_training_job_summary ?training_end_time:(training_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?secondary_status:(secondary_status_ : secondary_status option)
    ?warm_pool_status:(warm_pool_status_ : warm_pool_status option)
    ?training_plan_arn:(training_plan_arn_ : training_plan_arn option)
    ~training_job_name:(training_job_name_ : training_job_name)
    ~training_job_arn:(training_job_arn_ : training_job_arn)
    ~creation_time:(creation_time_ : timestamp)
    ~training_job_status:(training_job_status_ : training_job_status) () =
  ({
     training_job_name = training_job_name_;
     training_job_arn = training_job_arn_;
     creation_time = creation_time_;
     training_end_time = training_end_time_;
     last_modified_time = last_modified_time_;
     training_job_status = training_job_status_;
     secondary_status = secondary_status_;
     warm_pool_status = warm_pool_status_;
     training_plan_arn = training_plan_arn_;
   }
    : training_job_summary)

let make_list_training_jobs_response ?next_token:(next_token_ : next_token option)
    ~training_job_summaries:(training_job_summaries_ : training_job_summaries) () =
  ({ training_job_summaries = training_job_summaries_; next_token = next_token_ }
    : list_training_jobs_response)

let make_list_training_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : training_job_status option)
    ?sort_by:(sort_by_ : sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?warm_pool_status_equals:(warm_pool_status_equals_ : warm_pool_resource_status option)
    ?training_plan_arn_equals:(training_plan_arn_equals_ : training_plan_arn option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     warm_pool_status_equals = warm_pool_status_equals_;
     training_plan_arn_equals = training_plan_arn_equals_;
   }
    : list_training_jobs_request)

let make_list_training_jobs_for_hyper_parameter_tuning_job_response
    ?next_token:(next_token_ : next_token option)
    ~training_job_summaries:(training_job_summaries_ : hyper_parameter_training_job_summaries) () =
  ({ training_job_summaries = training_job_summaries_; next_token = next_token_ }
    : list_training_jobs_for_hyper_parameter_tuning_job_response)

let make_list_training_jobs_for_hyper_parameter_tuning_job_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?status_equals:(status_equals_ : training_job_status option)
    ?sort_by:(sort_by_ : training_job_sort_by_options option)
    ?sort_order:(sort_order_ : sort_order option)
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({
     hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_;
     next_token = next_token_;
     max_results = max_results_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
   }
    : list_training_jobs_for_hyper_parameter_tuning_job_request)

let make_training_plan_summary
    ?status_message:(status_message_ : training_plan_status_message option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours option)
    ?duration_minutes:(duration_minutes_ : training_plan_duration_minutes option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?currency_code:(currency_code_ : currency_code option)
    ?total_instance_count:(total_instance_count_ : total_instance_count option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?total_ultra_server_count:(total_ultra_server_count_ : ultra_server_count option)
    ?target_resources:(target_resources_ : sage_maker_resource_names option)
    ?reserved_capacity_summaries:(reserved_capacity_summaries_ : reserved_capacity_summaries option)
    ~training_plan_arn:(training_plan_arn_ : training_plan_arn)
    ~training_plan_name:(training_plan_name_ : training_plan_name)
    ~status:(status_ : training_plan_status) () =
  ({
     training_plan_arn = training_plan_arn_;
     training_plan_name = training_plan_name_;
     status = status_;
     status_message = status_message_;
     duration_hours = duration_hours_;
     duration_minutes = duration_minutes_;
     start_time = start_time_;
     end_time = end_time_;
     upfront_fee = upfront_fee_;
     currency_code = currency_code_;
     total_instance_count = total_instance_count_;
     available_instance_count = available_instance_count_;
     in_use_instance_count = in_use_instance_count_;
     total_ultra_server_count = total_ultra_server_count_;
     target_resources = target_resources_;
     reserved_capacity_summaries = reserved_capacity_summaries_;
   }
    : training_plan_summary)

let make_list_training_plans_response ?next_token:(next_token_ : next_token option)
    ~training_plan_summaries:(training_plan_summaries_ : training_plan_summaries) () =
  ({ next_token = next_token_; training_plan_summaries = training_plan_summaries_ }
    : list_training_plans_response)

let make_training_plan_filter ~name:(name_ : training_plan_filter_name) ~value:(value_ : string64)
    () =
  ({ name = name_; value = value_ } : training_plan_filter)

let make_list_training_plans_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?start_time_after:(start_time_after_ : timestamp option)
    ?start_time_before:(start_time_before_ : timestamp option)
    ?sort_by:(sort_by_ : training_plan_sort_by option)
    ?sort_order:(sort_order_ : training_plan_sort_order option)
    ?filters:(filters_ : training_plan_filters option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     start_time_after = start_time_after_;
     start_time_before = start_time_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     filters = filters_;
   }
    : list_training_plans_request)

let make_transform_job_summary ?transform_end_time:(transform_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ~transform_job_name:(transform_job_name_ : transform_job_name)
    ~transform_job_arn:(transform_job_arn_ : transform_job_arn)
    ~creation_time:(creation_time_ : timestamp)
    ~transform_job_status:(transform_job_status_ : transform_job_status) () =
  ({
     transform_job_name = transform_job_name_;
     transform_job_arn = transform_job_arn_;
     creation_time = creation_time_;
     transform_end_time = transform_end_time_;
     last_modified_time = last_modified_time_;
     transform_job_status = transform_job_status_;
     failure_reason = failure_reason_;
   }
    : transform_job_summary)

let make_list_transform_jobs_response ?next_token:(next_token_ : next_token option)
    ~transform_job_summaries:(transform_job_summaries_ : transform_job_summaries) () =
  ({ transform_job_summaries = transform_job_summaries_; next_token = next_token_ }
    : list_transform_jobs_response)

let make_list_transform_jobs_request ?creation_time_after:(creation_time_after_ : timestamp option)
    ?creation_time_before:(creation_time_before_ : timestamp option)
    ?last_modified_time_after:(last_modified_time_after_ : timestamp option)
    ?last_modified_time_before:(last_modified_time_before_ : timestamp option)
    ?name_contains:(name_contains_ : name_contains option)
    ?status_equals:(status_equals_ : transform_job_status option)
    ?sort_by:(sort_by_ : sort_by option) ?sort_order:(sort_order_ : sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     creation_time_after = creation_time_after_;
     creation_time_before = creation_time_before_;
     last_modified_time_after = last_modified_time_after_;
     last_modified_time_before = last_modified_time_before_;
     name_contains = name_contains_;
     status_equals = status_equals_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_transform_jobs_request)

let make_trial_component_summary
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_component_source:(trial_component_source_ : trial_component_source option)
    ?status:(status_ : trial_component_status option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option) () =
  ({
     trial_component_name = trial_component_name_;
     trial_component_arn = trial_component_arn_;
     display_name = display_name_;
     trial_component_source = trial_component_source_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
   }
    : trial_component_summary)

let make_list_trial_components_response
    ?trial_component_summaries:(trial_component_summaries_ : trial_component_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ trial_component_summaries = trial_component_summaries_; next_token = next_token_ }
    : list_trial_components_response)

let make_list_trial_components_request
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?trial_name:(trial_name_ : experiment_entity_name option)
    ?source_arn:(source_arn_ : string256 option) ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option)
    ?sort_by:(sort_by_ : sort_trial_components_by option)
    ?sort_order:(sort_order_ : sort_order option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     experiment_name = experiment_name_;
     trial_name = trial_name_;
     source_arn = source_arn_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_trial_components_request)

let make_trial_summary ?trial_arn:(trial_arn_ : trial_arn option)
    ?trial_name:(trial_name_ : experiment_entity_name option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_source:(trial_source_ : trial_source option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     trial_arn = trial_arn_;
     trial_name = trial_name_;
     display_name = display_name_;
     trial_source = trial_source_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : trial_summary)

let make_list_trials_response ?trial_summaries:(trial_summaries_ : trial_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ trial_summaries = trial_summaries_; next_token = next_token_ } : list_trials_response)

let make_list_trials_request ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option)
    ?created_after:(created_after_ : timestamp option)
    ?created_before:(created_before_ : timestamp option) ?sort_by:(sort_by_ : sort_trials_by option)
    ?sort_order:(sort_order_ : sort_order option) ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({
     experiment_name = experiment_name_;
     trial_component_name = trial_component_name_;
     created_after = created_after_;
     created_before = created_before_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_trials_request)

let make_ultra_server
    ?configured_spare_instance_count:
      (configured_spare_instance_count_ : configured_spare_instance_count option)
    ?available_instance_count:(available_instance_count_ : available_instance_count option)
    ?in_use_instance_count:(in_use_instance_count_ : in_use_instance_count option)
    ?available_spare_instance_count:
      (available_spare_instance_count_ : available_spare_instance_count option)
    ?unhealthy_instance_count:(unhealthy_instance_count_ : unhealthy_instance_count option)
    ?health_status:(health_status_ : ultra_server_health_status option)
    ~ultra_server_id:(ultra_server_id_ : non_empty_string256)
    ~ultra_server_type:(ultra_server_type_ : ultra_server_type)
    ~availability_zone:(availability_zone_ : availability_zone)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~total_instance_count:(total_instance_count_ : total_instance_count) () =
  ({
     ultra_server_id = ultra_server_id_;
     ultra_server_type = ultra_server_type_;
     availability_zone = availability_zone_;
     instance_type = instance_type_;
     total_instance_count = total_instance_count_;
     configured_spare_instance_count = configured_spare_instance_count_;
     available_instance_count = available_instance_count_;
     in_use_instance_count = in_use_instance_count_;
     available_spare_instance_count = available_spare_instance_count_;
     unhealthy_instance_count = unhealthy_instance_count_;
     health_status = health_status_;
   }
    : ultra_server)

let make_list_ultra_servers_by_reserved_capacity_response
    ?next_token:(next_token_ : next_token option) ~ultra_servers:(ultra_servers_ : ultra_servers) ()
    =
  ({ next_token = next_token_; ultra_servers = ultra_servers_ }
    : list_ultra_servers_by_reserved_capacity_response)

let make_list_ultra_servers_by_reserved_capacity_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~reserved_capacity_arn:(reserved_capacity_arn_ : reserved_capacity_arn) () =
  ({
     reserved_capacity_arn = reserved_capacity_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_ultra_servers_by_reserved_capacity_request)

let make_user_profile_details ?domain_id:(domain_id_ : domain_id option)
    ?user_profile_name:(user_profile_name_ : user_profile_name option)
    ?status:(status_ : user_profile_status option)
    ?creation_time:(creation_time_ : creation_time option)
    ?last_modified_time:(last_modified_time_ : last_modified_time option) () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     status = status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : user_profile_details)

let make_list_user_profiles_response ?user_profiles:(user_profiles_ : user_profile_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ user_profiles = user_profiles_; next_token = next_token_ } : list_user_profiles_response)

let make_list_user_profiles_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?sort_order:(sort_order_ : sort_order option)
    ?sort_by:(sort_by_ : user_profile_sort_key option)
    ?domain_id_equals:(domain_id_equals_ : domain_id option)
    ?user_profile_name_contains:(user_profile_name_contains_ : user_profile_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     sort_order = sort_order_;
     sort_by = sort_by_;
     domain_id_equals = domain_id_equals_;
     user_profile_name_contains = user_profile_name_contains_;
   }
    : list_user_profiles_request)

let make_list_workforces_response ?next_token:(next_token_ : next_token option)
    ~workforces:(workforces_ : workforces) () =
  ({ workforces = workforces_; next_token = next_token_ } : list_workforces_response)

let make_list_workforces_request ?sort_by:(sort_by_ : list_workforces_sort_by_options option)
    ?sort_order:(sort_order_ : sort_order option)
    ?name_contains:(name_contains_ : workforce_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_workforces_request)

let make_list_workteams_response ?next_token:(next_token_ : next_token option)
    ~workteams:(workteams_ : workteams) () =
  ({ workteams = workteams_; next_token = next_token_ } : list_workteams_response)

let make_list_workteams_request ?sort_by:(sort_by_ : list_workteams_sort_by_options option)
    ?sort_order:(sort_order_ : sort_order option)
    ?name_contains:(name_contains_ : workteam_name option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     sort_by = sort_by_;
     sort_order = sort_order_;
     name_contains = name_contains_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_workteams_request)

let make_model ?model_name:(model_name_ : model_name option)
    ?primary_container:(primary_container_ : container_definition option)
    ?containers:(containers_ : container_definition_list option)
    ?inference_execution_config:(inference_execution_config_ : inference_execution_config option)
    ?execution_role_arn:(execution_role_arn_ : role_arn option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?creation_time:(creation_time_ : timestamp option)
    ?model_arn:(model_arn_ : model_arn option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?tags:(tags_ : tag_list option)
    ?deployment_recommendation:(deployment_recommendation_ : deployment_recommendation option) () =
  ({
     model_name = model_name_;
     primary_container = primary_container_;
     containers = containers_;
     inference_execution_config = inference_execution_config_;
     execution_role_arn = execution_role_arn_;
     vpc_config = vpc_config_;
     creation_time = creation_time_;
     model_arn = model_arn_;
     enable_network_isolation = enable_network_isolation_;
     tags = tags_;
     deployment_recommendation = deployment_recommendation_;
   }
    : model)

let make_model_card ?model_card_arn:(model_card_arn_ : model_card_arn option)
    ?model_card_name:(model_card_name_ : entity_name option)
    ?model_card_version:(model_card_version_ : integer option)
    ?content:(content_ : model_card_content option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?security_config:(security_config_ : model_card_security_config option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option) ?tags:(tags_ : tag_list option)
    ?model_id:(model_id_ : string_ option) ?risk_rating:(risk_rating_ : string_ option)
    ?model_package_group_name:(model_package_group_name_ : string_ option) () =
  ({
     model_card_arn = model_card_arn_;
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     content = content_;
     model_card_status = model_card_status_;
     security_config = security_config_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     tags = tags_;
     model_id = model_id_;
     risk_rating = risk_rating_;
     model_package_group_name = model_package_group_name_;
   }
    : model_card)

let make_model_dashboard_endpoint ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~endpoint_arn:(endpoint_arn_ : endpoint_arn) ~creation_time:(creation_time_ : timestamp)
    ~last_modified_time:(last_modified_time_ : timestamp)
    ~endpoint_status:(endpoint_status_ : endpoint_status) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_arn = endpoint_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     endpoint_status = endpoint_status_;
   }
    : model_dashboard_endpoint)

let make_model_dashboard_model_card ?model_card_arn:(model_card_arn_ : model_card_arn option)
    ?model_card_name:(model_card_name_ : entity_name option)
    ?model_card_version:(model_card_version_ : integer option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ?security_config:(security_config_ : model_card_security_config option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option) ?tags:(tags_ : tag_list option)
    ?model_id:(model_id_ : string_ option) ?risk_rating:(risk_rating_ : string_ option) () =
  ({
     model_card_arn = model_card_arn_;
     model_card_name = model_card_name_;
     model_card_version = model_card_version_;
     model_card_status = model_card_status_;
     security_config = security_config_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     tags = tags_;
     model_id = model_id_;
     risk_rating = risk_rating_;
   }
    : model_dashboard_model_card)

let make_model_dashboard_monitoring_schedule
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option)
    ?monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name option)
    ?monitoring_schedule_status:(monitoring_schedule_status_ : schedule_status option)
    ?monitoring_type:(monitoring_type_ : monitoring_type option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config option)
    ?endpoint_name:(endpoint_name_ : endpoint_name option)
    ?monitoring_alert_summaries:(monitoring_alert_summaries_ : monitoring_alert_summary_list option)
    ?last_monitoring_execution_summary:
      (last_monitoring_execution_summary_ : monitoring_execution_summary option)
    ?batch_transform_input:(batch_transform_input_ : batch_transform_input option) () =
  ({
     monitoring_schedule_arn = monitoring_schedule_arn_;
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_status = monitoring_schedule_status_;
     monitoring_type = monitoring_type_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     monitoring_schedule_config = monitoring_schedule_config_;
     endpoint_name = endpoint_name_;
     monitoring_alert_summaries = monitoring_alert_summaries_;
     last_monitoring_execution_summary = last_monitoring_execution_summary_;
     batch_transform_input = batch_transform_input_;
   }
    : model_dashboard_monitoring_schedule)

let make_transform_job ?transform_job_name:(transform_job_name_ : transform_job_name option)
    ?transform_job_arn:(transform_job_arn_ : transform_job_arn option)
    ?transform_job_status:(transform_job_status_ : transform_job_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?model_name:(model_name_ : model_name option)
    ?max_concurrent_transforms:(max_concurrent_transforms_ : max_concurrent_transforms option)
    ?model_client_config:(model_client_config_ : model_client_config option)
    ?max_payload_in_m_b:(max_payload_in_m_b_ : max_payload_in_m_b option)
    ?batch_strategy:(batch_strategy_ : batch_strategy option)
    ?environment:(environment_ : transform_environment_map option)
    ?transform_input:(transform_input_ : transform_input option)
    ?transform_output:(transform_output_ : transform_output option)
    ?data_capture_config:(data_capture_config_ : batch_data_capture_config option)
    ?transform_resources:(transform_resources_ : transform_resources option)
    ?creation_time:(creation_time_ : timestamp option)
    ?transform_start_time:(transform_start_time_ : timestamp option)
    ?transform_end_time:(transform_end_time_ : timestamp option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?data_processing:(data_processing_ : data_processing option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?tags:(tags_ : tag_list option) () =
  ({
     transform_job_name = transform_job_name_;
     transform_job_arn = transform_job_arn_;
     transform_job_status = transform_job_status_;
     failure_reason = failure_reason_;
     model_name = model_name_;
     max_concurrent_transforms = max_concurrent_transforms_;
     model_client_config = model_client_config_;
     max_payload_in_m_b = max_payload_in_m_b_;
     batch_strategy = batch_strategy_;
     environment = environment_;
     transform_input = transform_input_;
     transform_output = transform_output_;
     data_capture_config = data_capture_config_;
     transform_resources = transform_resources_;
     creation_time = creation_time_;
     transform_start_time = transform_start_time_;
     transform_end_time = transform_end_time_;
     labeling_job_arn = labeling_job_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     data_processing = data_processing_;
     experiment_config = experiment_config_;
     tags = tags_;
   }
    : transform_job)

let make_model_dashboard_model ?model:(model_ : model option)
    ?endpoints:(endpoints_ : model_dashboard_endpoints option)
    ?last_batch_transform_job:(last_batch_transform_job_ : transform_job option)
    ?monitoring_schedules:(monitoring_schedules_ : model_dashboard_monitoring_schedules option)
    ?model_card:(model_card_ : model_dashboard_model_card option) () =
  ({
     model = model_;
     endpoints = endpoints_;
     last_batch_transform_job = last_batch_transform_job_;
     monitoring_schedules = monitoring_schedules_;
     model_card = model_card_;
   }
    : model_dashboard_model)

let make_model_package ?model_package_name:(model_package_name_ : entity_name option)
    ?model_package_group_name:(model_package_group_name_ : entity_name option)
    ?model_package_version:(model_package_version_ : model_package_version option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?model_package_arn:(model_package_arn_ : model_package_arn option)
    ?model_package_description:(model_package_description_ : entity_description option)
    ?creation_time:(creation_time_ : creation_time option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?source_algorithm_specification:
      (source_algorithm_specification_ : source_algorithm_specification option)
    ?validation_specification:
      (validation_specification_ : model_package_validation_specification option)
    ?model_package_status:(model_package_status_ : model_package_status option)
    ?model_package_status_details:
      (model_package_status_details_ : model_package_status_details option)
    ?certify_for_marketplace:(certify_for_marketplace_ : certify_for_marketplace option)
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?created_by:(created_by_ : user_context option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?model_metrics:(model_metrics_ : model_metrics option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?approval_description:(approval_description_ : approval_description option)
    ?domain:(domain_ : string_ option) ?task:(task_ : string_ option)
    ?sample_payload_url:(sample_payload_url_ : string_ option)
    ?additional_inference_specifications:
      (additional_inference_specifications_ : additional_inference_specifications option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?security_config:(security_config_ : model_package_security_config option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option) ?tags:(tags_ : tag_list option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?drift_check_baselines:(drift_check_baselines_ : drift_check_baselines option)
    ?skip_model_validation:(skip_model_validation_ : skip_model_validation option) () =
  ({
     model_package_name = model_package_name_;
     model_package_group_name = model_package_group_name_;
     model_package_version = model_package_version_;
     model_package_registration_type = model_package_registration_type_;
     model_package_arn = model_package_arn_;
     model_package_description = model_package_description_;
     creation_time = creation_time_;
     inference_specification = inference_specification_;
     source_algorithm_specification = source_algorithm_specification_;
     validation_specification = validation_specification_;
     model_package_status = model_package_status_;
     model_package_status_details = model_package_status_details_;
     certify_for_marketplace = certify_for_marketplace_;
     model_approval_status = model_approval_status_;
     created_by = created_by_;
     metadata_properties = metadata_properties_;
     model_metrics = model_metrics_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     approval_description = approval_description_;
     domain = domain_;
     task = task_;
     sample_payload_url = sample_payload_url_;
     additional_inference_specifications = additional_inference_specifications_;
     source_uri = source_uri_;
     security_config = security_config_;
     model_card = model_card_;
     model_life_cycle = model_life_cycle_;
     tags = tags_;
     customer_metadata_properties = customer_metadata_properties_;
     drift_check_baselines = drift_check_baselines_;
     skip_model_validation = skip_model_validation_;
   }
    : model_package)

let make_model_package_group
    ?model_package_group_name:(model_package_group_name_ : entity_name option)
    ?model_package_group_arn:(model_package_group_arn_ : model_package_group_arn option)
    ?model_package_group_description:(model_package_group_description_ : entity_description option)
    ?creation_time:(creation_time_ : creation_time option)
    ?created_by:(created_by_ : user_context option)
    ?model_package_group_status:(model_package_group_status_ : model_package_group_status option)
    ?tags:(tags_ : tag_list option) () =
  ({
     model_package_group_name = model_package_group_name_;
     model_package_group_arn = model_package_group_arn_;
     model_package_group_description = model_package_group_description_;
     creation_time = creation_time_;
     created_by = created_by_;
     model_package_group_status = model_package_group_status_;
     tags = tags_;
   }
    : model_package_group)

let make_nested_filters ~nested_property_name:(nested_property_name_ : resource_property_name)
    ~filters:(filters_ : filter_list) () =
  ({ nested_property_name = nested_property_name_; filters = filters_ } : nested_filters)

let make_online_store_config_update ?ttl_duration:(ttl_duration_ : ttl_duration option) () =
  ({ ttl_duration = ttl_duration_ } : online_store_config_update)

let make_parent ?trial_name:(trial_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option) () =
  ({ trial_name = trial_name_; experiment_name = experiment_name_ } : parent)

let make_pipeline ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_name:(pipeline_name_ : pipeline_name option)
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?role_arn:(role_arn_ : role_arn option)
    ?pipeline_status:(pipeline_status_ : pipeline_status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_run_time:(last_run_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?tags:(tags_ : tag_list option) () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_name = pipeline_name_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_description = pipeline_description_;
     role_arn = role_arn_;
     pipeline_status = pipeline_status_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_run_time = last_run_time_;
     created_by = created_by_;
     last_modified_by = last_modified_by_;
     parallelism_configuration = parallelism_configuration_;
     tags = tags_;
   }
    : pipeline)

let make_pipeline_execution ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_execution_status:(pipeline_execution_status_ : pipeline_execution_status option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_experiment_config:(pipeline_experiment_config_ : pipeline_experiment_config option)
    ?failure_reason:(failure_reason_ : pipeline_execution_failure_reason option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?selective_execution_config:(selective_execution_config_ : selective_execution_config option)
    ?pipeline_parameters:(pipeline_parameters_ : parameter_list option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_execution_arn = pipeline_execution_arn_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_execution_status = pipeline_execution_status_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_experiment_config = pipeline_experiment_config_;
     failure_reason = failure_reason_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     last_modified_by = last_modified_by_;
     parallelism_configuration = parallelism_configuration_;
     selective_execution_config = selective_execution_config_;
     pipeline_parameters = pipeline_parameters_;
     pipeline_version_id = pipeline_version_id_;
     pipeline_version_display_name = pipeline_version_display_name_;
   }
    : pipeline_execution)

let make_pipeline_version ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?last_executed_pipeline_execution_arn:
      (last_executed_pipeline_execution_arn_ : pipeline_execution_arn option)
    ?last_executed_pipeline_execution_display_name:
      (last_executed_pipeline_execution_display_name_ : pipeline_execution_name option)
    ?last_executed_pipeline_execution_status:
      (last_executed_pipeline_execution_status_ : pipeline_execution_status option) () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_version_id = pipeline_version_id_;
     pipeline_version_display_name = pipeline_version_display_name_;
     pipeline_version_description = pipeline_version_description_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     created_by = created_by_;
     last_modified_by = last_modified_by_;
     last_executed_pipeline_execution_arn = last_executed_pipeline_execution_arn_;
     last_executed_pipeline_execution_display_name = last_executed_pipeline_execution_display_name_;
     last_executed_pipeline_execution_status = last_executed_pipeline_execution_status_;
   }
    : pipeline_version)

let make_processing_job ?processing_inputs:(processing_inputs_ : processing_inputs option)
    ?processing_output_config:(processing_output_config_ : processing_output_config option)
    ?processing_job_name:(processing_job_name_ : processing_job_name option)
    ?processing_resources:(processing_resources_ : processing_resources option)
    ?stopping_condition:(stopping_condition_ : processing_stopping_condition option)
    ?app_specification:(app_specification_ : app_specification option)
    ?environment:(environment_ : processing_environment_map option)
    ?network_config:(network_config_ : network_config option)
    ?role_arn:(role_arn_ : role_arn option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?processing_job_arn:(processing_job_arn_ : processing_job_arn option)
    ?processing_job_status:(processing_job_status_ : processing_job_status option)
    ?exit_message:(exit_message_ : exit_message option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?processing_end_time:(processing_end_time_ : timestamp option)
    ?processing_start_time:(processing_start_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?training_job_arn:(training_job_arn_ : training_job_arn option) ?tags:(tags_ : tag_list option)
    () =
  ({
     processing_inputs = processing_inputs_;
     processing_output_config = processing_output_config_;
     processing_job_name = processing_job_name_;
     processing_resources = processing_resources_;
     stopping_condition = stopping_condition_;
     app_specification = app_specification_;
     environment = environment_;
     network_config = network_config_;
     role_arn = role_arn_;
     experiment_config = experiment_config_;
     processing_job_arn = processing_job_arn_;
     processing_job_status = processing_job_status_;
     exit_message = exit_message_;
     failure_reason = failure_reason_;
     processing_end_time = processing_end_time_;
     processing_start_time = processing_start_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     monitoring_schedule_arn = monitoring_schedule_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     training_job_arn = training_job_arn_;
     tags = tags_;
   }
    : processing_job)

let make_profiler_config_for_update ?s3_output_path:(s3_output_path_ : s3_uri option)
    ?profiling_interval_in_milliseconds:
      (profiling_interval_in_milliseconds_ : profiling_interval_in_milliseconds option)
    ?profiling_parameters:(profiling_parameters_ : profiling_parameters option)
    ?disable_profiler:(disable_profiler_ : disable_profiler option) () =
  ({
     s3_output_path = s3_output_path_;
     profiling_interval_in_milliseconds = profiling_interval_in_milliseconds_;
     profiling_parameters = profiling_parameters_;
     disable_profiler = disable_profiler_;
   }
    : profiler_config_for_update)

let make_project ?project_arn:(project_arn_ : project_arn option)
    ?project_name:(project_name_ : project_entity_name option)
    ?project_id:(project_id_ : project_id option)
    ?project_description:(project_description_ : entity_description option)
    ?service_catalog_provisioning_details:
      (service_catalog_provisioning_details_ : service_catalog_provisioning_details option)
    ?service_catalog_provisioned_product_details:
      (service_catalog_provisioned_product_details_ :
         service_catalog_provisioned_product_details option)
    ?project_status:(project_status_ : project_status option)
    ?created_by:(created_by_ : user_context option)
    ?creation_time:(creation_time_ : timestamp option)
    ?template_provider_details:(template_provider_details_ : template_provider_detail_list option)
    ?tags:(tags_ : tag_list option) ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option) () =
  ({
     project_arn = project_arn_;
     project_name = project_name_;
     project_id = project_id_;
     project_description = project_description_;
     service_catalog_provisioning_details = service_catalog_provisioning_details_;
     service_catalog_provisioned_product_details = service_catalog_provisioned_product_details_;
     project_status = project_status_;
     created_by = created_by_;
     creation_time = creation_time_;
     template_provider_details = template_provider_details_;
     tags = tags_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
   }
    : project)

let make_put_model_package_group_policy_output
    ~model_package_group_arn:(model_package_group_arn_ : model_package_group_arn) () =
  ({ model_package_group_arn = model_package_group_arn_ } : put_model_package_group_policy_output)

let make_put_model_package_group_policy_input
    ~model_package_group_name:(model_package_group_name_ : entity_name)
    ~resource_policy:(resource_policy_ : policy_string) () =
  ({ model_package_group_name = model_package_group_name_; resource_policy = resource_policy_ }
    : put_model_package_group_policy_input)

let make_query_filters ?types:(types_ : query_types option)
    ?lineage_types:(lineage_types_ : query_lineage_types option)
    ?created_before:(created_before_ : timestamp option)
    ?created_after:(created_after_ : timestamp option)
    ?modified_before:(modified_before_ : timestamp option)
    ?modified_after:(modified_after_ : timestamp option)
    ?properties:(properties_ : query_properties option) () =
  ({
     types = types_;
     lineage_types = lineage_types_;
     created_before = created_before_;
     created_after = created_after_;
     modified_before = modified_before_;
     modified_after = modified_after_;
     properties = properties_;
   }
    : query_filters)

let make_vertex ?arn:(arn_ : association_entity_arn option) ?type_:(type__ : string40 option)
    ?lineage_type:(lineage_type_ : lineage_type option) () =
  ({ arn = arn_; type_ = type__; lineage_type = lineage_type_ } : vertex)

let make_query_lineage_response ?vertices:(vertices_ : vertices option)
    ?edges:(edges_ : edges option) ?next_token:(next_token_ : string8192 option) () =
  ({ vertices = vertices_; edges = edges_; next_token = next_token_ } : query_lineage_response)

let make_query_lineage_request ?start_arns:(start_arns_ : query_lineage_start_arns option)
    ?direction:(direction_ : direction option) ?include_edges:(include_edges_ : boolean_ option)
    ?filters:(filters_ : query_filters option)
    ?max_depth:(max_depth_ : query_lineage_max_depth option)
    ?max_results:(max_results_ : query_lineage_max_results option)
    ?next_token:(next_token_ : string8192 option) () =
  ({
     start_arns = start_arns_;
     direction = direction_;
     include_edges = include_edges_;
     filters = filters_;
     max_depth = max_depth_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : query_lineage_request)

let make_register_devices_request ?tags:(tags_ : tag_list option)
    ~device_fleet_name:(device_fleet_name_ : entity_name) ~devices:(devices_ : devices) () =
  ({ device_fleet_name = device_fleet_name_; devices = devices_; tags = tags_ }
    : register_devices_request)

let make_remote_debug_config_for_update
    ?enable_remote_debug:(enable_remote_debug_ : enable_remote_debug option) () =
  ({ enable_remote_debug = enable_remote_debug_ } : remote_debug_config_for_update)

let make_rendering_error ~code:(code_ : string_) ~message:(message_ : string_) () =
  ({ code = code_; message = message_ } : rendering_error)

let make_render_ui_template_response ~rendered_content:(rendered_content_ : string_)
    ~errors:(errors_ : rendering_error_list) () =
  ({ rendered_content = rendered_content_; errors = errors_ } : render_ui_template_response)

let make_renderable_task ~input:(input_ : task_input) () = ({ input = input_ } : renderable_task)

let make_render_ui_template_request ?ui_template:(ui_template_ : ui_template option)
    ?human_task_ui_arn:(human_task_ui_arn_ : human_task_ui_arn option)
    ~task:(task_ : renderable_task) ~role_arn:(role_arn_ : role_arn) () =
  ({
     ui_template = ui_template_;
     task = task_;
     role_arn = role_arn_;
     human_task_ui_arn = human_task_ui_arn_;
   }
    : render_ui_template_request)

let make_reserved_capacity_offering
    ?reserved_capacity_type:(reserved_capacity_type_ : reserved_capacity_type option)
    ?ultra_server_type:(ultra_server_type_ : ultra_server_type option)
    ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?duration_hours:(duration_hours_ : reserved_capacity_duration_hours option)
    ?duration_minutes:(duration_minutes_ : reserved_capacity_duration_minutes option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?extension_start_time:(extension_start_time_ : timestamp option)
    ?extension_end_time:(extension_end_time_ : timestamp option)
    ~instance_type:(instance_type_ : reserved_capacity_instance_type)
    ~instance_count:(instance_count_ : reserved_capacity_instance_count) () =
  ({
     reserved_capacity_type = reserved_capacity_type_;
     ultra_server_type = ultra_server_type_;
     ultra_server_count = ultra_server_count_;
     instance_type = instance_type_;
     instance_count = instance_count_;
     availability_zone = availability_zone_;
     duration_hours = duration_hours_;
     duration_minutes = duration_minutes_;
     start_time = start_time_;
     end_time = end_time_;
     extension_start_time = extension_start_time_;
     extension_end_time = extension_end_time_;
   }
    : reserved_capacity_offering)

let make_resource_config_for_update
    ~keep_alive_period_in_seconds:(keep_alive_period_in_seconds_ : keep_alive_period_in_seconds) ()
    =
  ({ keep_alive_period_in_seconds = keep_alive_period_in_seconds_ } : resource_config_for_update)

let make_retry_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : retry_pipeline_execution_response)

let make_retry_pipeline_execution_request
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn)
    ~client_request_token:(client_request_token_ : idempotency_token) () =
  ({
     pipeline_execution_arn = pipeline_execution_arn_;
     client_request_token = client_request_token_;
     parallelism_configuration = parallelism_configuration_;
   }
    : retry_pipeline_execution_request)

let make_update_workteam_response ~workteam:(workteam_ : workteam) () =
  ({ workteam = workteam_ } : update_workteam_response)

let make_update_workteam_request
    ?member_definitions:(member_definitions_ : member_definitions option)
    ?description:(description_ : string200 option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?worker_access_configuration:(worker_access_configuration_ : worker_access_configuration option)
    ~workteam_name:(workteam_name_ : workteam_name) () =
  ({
     workteam_name = workteam_name_;
     member_definitions = member_definitions_;
     description = description_;
     notification_configuration = notification_configuration_;
     worker_access_configuration = worker_access_configuration_;
   }
    : update_workteam_request)

let make_update_workforce_response ~workforce:(workforce_ : workforce) () =
  ({ workforce = workforce_ } : update_workforce_response)

let make_update_workforce_request ?source_ip_config:(source_ip_config_ : source_ip_config option)
    ?oidc_config:(oidc_config_ : oidc_config option)
    ?workforce_vpc_config:(workforce_vpc_config_ : workforce_vpc_config_request option)
    ?ip_address_type:(ip_address_type_ : workforce_ip_address_type option)
    ~workforce_name:(workforce_name_ : workforce_name) () =
  ({
     workforce_name = workforce_name_;
     source_ip_config = source_ip_config_;
     oidc_config = oidc_config_;
     workforce_vpc_config = workforce_vpc_config_;
     ip_address_type = ip_address_type_;
   }
    : update_workforce_request)

let make_update_user_profile_response
    ?user_profile_arn:(user_profile_arn_ : user_profile_arn option) () =
  ({ user_profile_arn = user_profile_arn_ } : update_user_profile_response)

let make_update_user_profile_request ?user_settings:(user_settings_ : user_settings option)
    ~domain_id:(domain_id_ : domain_id) ~user_profile_name:(user_profile_name_ : user_profile_name)
    () =
  ({
     domain_id = domain_id_;
     user_profile_name = user_profile_name_;
     user_settings = user_settings_;
   }
    : update_user_profile_request)

let make_update_trial_component_response
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option) () =
  ({ trial_component_arn = trial_component_arn_ } : update_trial_component_response)

let make_update_trial_component_request
    ?display_name:(display_name_ : experiment_entity_name option)
    ?status:(status_ : trial_component_status option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?parameters_to_remove:(parameters_to_remove_ : list_trial_component_key256 option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?input_artifacts_to_remove:(input_artifacts_to_remove_ : list_trial_component_key256 option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?output_artifacts_to_remove:(output_artifacts_to_remove_ : list_trial_component_key256 option)
    ~trial_component_name:(trial_component_name_ : experiment_entity_name) () =
  ({
     trial_component_name = trial_component_name_;
     display_name = display_name_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     parameters = parameters_;
     parameters_to_remove = parameters_to_remove_;
     input_artifacts = input_artifacts_;
     input_artifacts_to_remove = input_artifacts_to_remove_;
     output_artifacts = output_artifacts_;
     output_artifacts_to_remove = output_artifacts_to_remove_;
   }
    : update_trial_component_request)

let make_update_trial_response ?trial_arn:(trial_arn_ : trial_arn option) () =
  ({ trial_arn = trial_arn_ } : update_trial_response)

let make_update_trial_request ?display_name:(display_name_ : experiment_entity_name option)
    ~trial_name:(trial_name_ : experiment_entity_name) () =
  ({ trial_name = trial_name_; display_name = display_name_ } : update_trial_request)

let make_update_training_job_response ~training_job_arn:(training_job_arn_ : training_job_arn) () =
  ({ training_job_arn = training_job_arn_ } : update_training_job_response)

let make_update_training_job_request
    ?profiler_config:(profiler_config_ : profiler_config_for_update option)
    ?profiler_rule_configurations:
      (profiler_rule_configurations_ : profiler_rule_configurations option)
    ?resource_config:(resource_config_ : resource_config_for_update option)
    ?remote_debug_config:(remote_debug_config_ : remote_debug_config_for_update option)
    ~training_job_name:(training_job_name_ : training_job_name) () =
  ({
     training_job_name = training_job_name_;
     profiler_config = profiler_config_;
     profiler_rule_configurations = profiler_rule_configurations_;
     resource_config = resource_config_;
     remote_debug_config = remote_debug_config_;
   }
    : update_training_job_request)

let make_update_space_response ?space_arn:(space_arn_ : space_arn option) () =
  ({ space_arn = space_arn_ } : update_space_response)

let make_update_space_request ?space_settings:(space_settings_ : space_settings option)
    ?space_display_name:(space_display_name_ : non_empty_string64 option)
    ~domain_id:(domain_id_ : domain_id) ~space_name:(space_name_ : space_name) () =
  ({
     domain_id = domain_id_;
     space_name = space_name_;
     space_settings = space_settings_;
     space_display_name = space_display_name_;
   }
    : update_space_request)

let make_update_project_output ~project_arn:(project_arn_ : project_arn) () =
  ({ project_arn = project_arn_ } : update_project_output)

let make_update_template_provider
    ?cfn_template_provider:(cfn_template_provider_ : cfn_update_template_provider option) () =
  ({ cfn_template_provider = cfn_template_provider_ } : update_template_provider)

let make_service_catalog_provisioning_update_details
    ?provisioning_artifact_id:(provisioning_artifact_id_ : service_catalog_entity_id option)
    ?provisioning_parameters:(provisioning_parameters_ : provisioning_parameters option) () =
  ({
     provisioning_artifact_id = provisioning_artifact_id_;
     provisioning_parameters = provisioning_parameters_;
   }
    : service_catalog_provisioning_update_details)

let make_update_project_input
    ?project_description:(project_description_ : entity_description option)
    ?service_catalog_provisioning_update_details:
      (service_catalog_provisioning_update_details_ :
         service_catalog_provisioning_update_details option) ?tags:(tags_ : tag_list option)
    ?template_providers_to_update:
      (template_providers_to_update_ : update_template_provider_list option)
    ~project_name:(project_name_ : project_entity_name) () =
  ({
     project_name = project_name_;
     project_description = project_description_;
     service_catalog_provisioning_update_details = service_catalog_provisioning_update_details_;
     tags = tags_;
     template_providers_to_update = template_providers_to_update_;
   }
    : update_project_input)

let make_update_pipeline_version_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option) () =
  ({ pipeline_arn = pipeline_arn_; pipeline_version_id = pipeline_version_id_ }
    : update_pipeline_version_response)

let make_update_pipeline_version_request
    ?pipeline_version_display_name:(pipeline_version_display_name_ : pipeline_version_name option)
    ?pipeline_version_description:
      (pipeline_version_description_ : pipeline_version_description option)
    ~pipeline_arn:(pipeline_arn_ : pipeline_arn)
    ~pipeline_version_id:(pipeline_version_id_ : pipeline_version_id) () =
  ({
     pipeline_arn = pipeline_arn_;
     pipeline_version_id = pipeline_version_id_;
     pipeline_version_display_name = pipeline_version_display_name_;
     pipeline_version_description = pipeline_version_description_;
   }
    : update_pipeline_version_request)

let make_update_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : update_pipeline_execution_response)

let make_update_pipeline_execution_request
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn) () =
  ({
     pipeline_execution_arn = pipeline_execution_arn_;
     pipeline_execution_description = pipeline_execution_description_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     parallelism_configuration = parallelism_configuration_;
   }
    : update_pipeline_execution_request)

let make_update_pipeline_response ?pipeline_arn:(pipeline_arn_ : pipeline_arn option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option) () =
  ({ pipeline_arn = pipeline_arn_; pipeline_version_id = pipeline_version_id_ }
    : update_pipeline_response)

let make_update_pipeline_request
    ?pipeline_display_name:(pipeline_display_name_ : pipeline_name option)
    ?pipeline_definition:(pipeline_definition_ : pipeline_definition option)
    ?pipeline_definition_s3_location:
      (pipeline_definition_s3_location_ : pipeline_definition_s3_location option)
    ?pipeline_description:(pipeline_description_ : pipeline_description option)
    ?role_arn:(role_arn_ : role_arn option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ~pipeline_name:(pipeline_name_ : pipeline_name) () =
  ({
     pipeline_name = pipeline_name_;
     pipeline_display_name = pipeline_display_name_;
     pipeline_definition = pipeline_definition_;
     pipeline_definition_s3_location = pipeline_definition_s3_location_;
     pipeline_description = pipeline_description_;
     role_arn = role_arn_;
     parallelism_configuration = parallelism_configuration_;
   }
    : update_pipeline_request)

let make_update_partner_app_response ?arn:(arn_ : partner_app_arn option) () =
  ({ arn = arn_ } : update_partner_app_response)

let make_update_partner_app_request
    ?maintenance_config:(maintenance_config_ : partner_app_maintenance_config option)
    ?tier:(tier_ : non_empty_string64 option)
    ?application_config:(application_config_ : partner_app_config option)
    ?enable_iam_session_based_identity:(enable_iam_session_based_identity_ : boolean_ option)
    ?enable_auto_minor_version_upgrade:(enable_auto_minor_version_upgrade_ : boolean_ option)
    ?app_version:(app_version_ : major_minor_version option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ~arn:(arn_ : partner_app_arn) () =
  ({
     arn = arn_;
     maintenance_config = maintenance_config_;
     tier = tier_;
     application_config = application_config_;
     enable_iam_session_based_identity = enable_iam_session_based_identity_;
     enable_auto_minor_version_upgrade = enable_auto_minor_version_upgrade_;
     app_version = app_version_;
     client_token = client_token_;
     tags = tags_;
   }
    : update_partner_app_request)

let make_update_notebook_instance_lifecycle_config_output () = (() : unit)

let make_update_notebook_instance_lifecycle_config_input
    ?on_create:(on_create_ : notebook_instance_lifecycle_config_list option)
    ?on_start:(on_start_ : notebook_instance_lifecycle_config_list option)
    ~notebook_instance_lifecycle_config_name:
      (notebook_instance_lifecycle_config_name_ : notebook_instance_lifecycle_config_name) () =
  ({
     notebook_instance_lifecycle_config_name = notebook_instance_lifecycle_config_name_;
     on_create = on_create_;
     on_start = on_start_;
   }
    : update_notebook_instance_lifecycle_config_input)

let make_update_notebook_instance_output () = (() : unit)

let make_update_notebook_instance_input ?instance_type:(instance_type_ : instance_type option)
    ?ip_address_type:(ip_address_type_ : ip_address_type option)
    ?platform_identifier:(platform_identifier_ : platform_identifier option)
    ?role_arn:(role_arn_ : role_arn option)
    ?lifecycle_config_name:(lifecycle_config_name_ : notebook_instance_lifecycle_config_name option)
    ?disassociate_lifecycle_config:
      (disassociate_lifecycle_config_ : disassociate_notebook_instance_lifecycle_config option)
    ?volume_size_in_g_b:(volume_size_in_g_b_ : notebook_instance_volume_size_in_g_b option)
    ?default_code_repository:(default_code_repository_ : code_repository_name_or_url option)
    ?additional_code_repositories:
      (additional_code_repositories_ : additional_code_repository_names_or_urls option)
    ?accelerator_types:(accelerator_types_ : notebook_instance_accelerator_types option)
    ?disassociate_accelerator_types:
      (disassociate_accelerator_types_ : disassociate_notebook_instance_accelerator_types option)
    ?disassociate_default_code_repository:
      (disassociate_default_code_repository_ : disassociate_default_code_repository option)
    ?disassociate_additional_code_repositories:
      (disassociate_additional_code_repositories_ : disassociate_additional_code_repositories option)
    ?root_access:(root_access_ : root_access option)
    ?instance_metadata_service_configuration:
      (instance_metadata_service_configuration_ : instance_metadata_service_configuration option)
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({
     notebook_instance_name = notebook_instance_name_;
     instance_type = instance_type_;
     ip_address_type = ip_address_type_;
     platform_identifier = platform_identifier_;
     role_arn = role_arn_;
     lifecycle_config_name = lifecycle_config_name_;
     disassociate_lifecycle_config = disassociate_lifecycle_config_;
     volume_size_in_g_b = volume_size_in_g_b_;
     default_code_repository = default_code_repository_;
     additional_code_repositories = additional_code_repositories_;
     accelerator_types = accelerator_types_;
     disassociate_accelerator_types = disassociate_accelerator_types_;
     disassociate_default_code_repository = disassociate_default_code_repository_;
     disassociate_additional_code_repositories = disassociate_additional_code_repositories_;
     root_access = root_access_;
     instance_metadata_service_configuration = instance_metadata_service_configuration_;
   }
    : update_notebook_instance_input)

let make_update_monitoring_schedule_response
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn) () =
  ({ monitoring_schedule_arn = monitoring_schedule_arn_ } : update_monitoring_schedule_response)

let make_update_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~monitoring_schedule_config:(monitoring_schedule_config_ : monitoring_schedule_config) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_schedule_config = monitoring_schedule_config_;
   }
    : update_monitoring_schedule_request)

let make_update_monitoring_alert_response
    ?monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name option)
    ~monitoring_schedule_arn:(monitoring_schedule_arn_ : monitoring_schedule_arn) () =
  ({
     monitoring_schedule_arn = monitoring_schedule_arn_;
     monitoring_alert_name = monitoring_alert_name_;
   }
    : update_monitoring_alert_response)

let make_update_monitoring_alert_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name)
    ~monitoring_alert_name:(monitoring_alert_name_ : monitoring_alert_name)
    ~datapoints_to_alert:(datapoints_to_alert_ : monitoring_datapoints_to_alert)
    ~evaluation_period:(evaluation_period_ : monitoring_evaluation_period) () =
  ({
     monitoring_schedule_name = monitoring_schedule_name_;
     monitoring_alert_name = monitoring_alert_name_;
     datapoints_to_alert = datapoints_to_alert_;
     evaluation_period = evaluation_period_;
   }
    : update_monitoring_alert_request)

let make_update_model_package_output ~model_package_arn:(model_package_arn_ : model_package_arn) ()
    =
  ({ model_package_arn = model_package_arn_ } : update_model_package_output)

let make_update_model_package_input
    ?model_approval_status:(model_approval_status_ : model_approval_status option)
    ?model_package_registration_type:
      (model_package_registration_type_ : model_package_registration_type option)
    ?approval_description:(approval_description_ : approval_description option)
    ?customer_metadata_properties:(customer_metadata_properties_ : customer_metadata_map option)
    ?customer_metadata_properties_to_remove:
      (customer_metadata_properties_to_remove_ : customer_metadata_key_list option)
    ?additional_inference_specifications_to_add:
      (additional_inference_specifications_to_add_ : additional_inference_specifications option)
    ?inference_specification:(inference_specification_ : inference_specification option)
    ?source_uri:(source_uri_ : model_package_source_uri option)
    ?model_card:(model_card_ : model_package_model_card option)
    ?model_life_cycle:(model_life_cycle_ : model_life_cycle option)
    ?client_token:(client_token_ : client_token option)
    ~model_package_arn:(model_package_arn_ : model_package_arn) () =
  ({
     model_package_arn = model_package_arn_;
     model_approval_status = model_approval_status_;
     model_package_registration_type = model_package_registration_type_;
     approval_description = approval_description_;
     customer_metadata_properties = customer_metadata_properties_;
     customer_metadata_properties_to_remove = customer_metadata_properties_to_remove_;
     additional_inference_specifications_to_add = additional_inference_specifications_to_add_;
     inference_specification = inference_specification_;
     source_uri = source_uri_;
     model_card = model_card_;
     model_life_cycle = model_life_cycle_;
     client_token = client_token_;
   }
    : update_model_package_input)

let make_update_model_card_response ~model_card_arn:(model_card_arn_ : model_card_arn) () =
  ({ model_card_arn = model_card_arn_ } : update_model_card_response)

let make_update_model_card_request ?content:(content_ : model_card_content option)
    ?model_card_status:(model_card_status_ : model_card_status option)
    ~model_card_name:(model_card_name_ : model_card_name_or_arn) () =
  ({
     model_card_name = model_card_name_;
     content = content_;
     model_card_status = model_card_status_;
   }
    : update_model_card_request)

let make_update_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : update_mlflow_tracking_server_response)

let make_update_mlflow_tracking_server_request
    ?artifact_store_uri:(artifact_store_uri_ : s3_uri option)
    ?tracking_server_size:(tracking_server_size_ : tracking_server_size option)
    ?automatic_model_registration:(automatic_model_registration_ : boolean_ option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?s3_bucket_owner_account_id:(s3_bucket_owner_account_id_ : account_id option)
    ?s3_bucket_owner_verification:(s3_bucket_owner_verification_ : boolean_ option)
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({
     tracking_server_name = tracking_server_name_;
     artifact_store_uri = artifact_store_uri_;
     tracking_server_size = tracking_server_size_;
     automatic_model_registration = automatic_model_registration_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     s3_bucket_owner_account_id = s3_bucket_owner_account_id_;
     s3_bucket_owner_verification = s3_bucket_owner_verification_;
   }
    : update_mlflow_tracking_server_request)

let make_update_mlflow_app_response ?arn:(arn_ : mlflow_app_arn option) () =
  ({ arn = arn_ } : update_mlflow_app_response)

let make_update_mlflow_app_request ?name:(name_ : mlflow_app_name option)
    ?artifact_store_uri:(artifact_store_uri_ : s3_uri option)
    ?model_registration_mode:(model_registration_mode_ : model_registration_mode option)
    ?weekly_maintenance_window_start:
      (weekly_maintenance_window_start_ : weekly_maintenance_window_start option)
    ?default_domain_id_list:(default_domain_id_list_ : default_domain_id_list option)
    ?account_default_status:(account_default_status_ : account_default_status option)
    ~arn:(arn_ : mlflow_app_arn) () =
  ({
     arn = arn_;
     name = name_;
     artifact_store_uri = artifact_store_uri_;
     model_registration_mode = model_registration_mode_;
     weekly_maintenance_window_start = weekly_maintenance_window_start_;
     default_domain_id_list = default_domain_id_list_;
     account_default_status = account_default_status_;
   }
    : update_mlflow_app_request)

let make_update_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : update_inference_experiment_response)

let make_update_inference_experiment_request
    ?schedule:(schedule_ : inference_experiment_schedule option)
    ?description:(description_ : inference_experiment_description option)
    ?model_variants:(model_variants_ : model_variant_config_list option)
    ?data_storage_config:(data_storage_config_ : inference_experiment_data_storage_config option)
    ?shadow_mode_config:(shadow_mode_config_ : shadow_mode_config option)
    ~name:(name_ : inference_experiment_name) () =
  ({
     name = name_;
     schedule = schedule_;
     description = description_;
     model_variants = model_variants_;
     data_storage_config = data_storage_config_;
     shadow_mode_config = shadow_mode_config_;
   }
    : update_inference_experiment_request)

let make_update_inference_component_runtime_config_output
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn) () =
  ({ inference_component_arn = inference_component_arn_ }
    : update_inference_component_runtime_config_output)

let make_update_inference_component_runtime_config_input
    ~inference_component_name:(inference_component_name_ : inference_component_name)
    ~desired_runtime_config:(desired_runtime_config_ : inference_component_runtime_config) () =
  ({
     inference_component_name = inference_component_name_;
     desired_runtime_config = desired_runtime_config_;
   }
    : update_inference_component_runtime_config_input)

let make_update_inference_component_output
    ~inference_component_arn:(inference_component_arn_ : inference_component_arn) () =
  ({ inference_component_arn = inference_component_arn_ } : update_inference_component_output)

let make_update_inference_component_input
    ?specification:(specification_ : inference_component_specification option)
    ?specifications:(specifications_ : inference_component_specification_list option)
    ?runtime_config:(runtime_config_ : inference_component_runtime_config option)
    ?deployment_config:(deployment_config_ : inference_component_deployment_config option)
    ~inference_component_name:(inference_component_name_ : inference_component_name) () =
  ({
     inference_component_name = inference_component_name_;
     specification = specification_;
     specifications = specifications_;
     runtime_config = runtime_config_;
     deployment_config = deployment_config_;
   }
    : update_inference_component_input)

let make_update_image_version_response
    ?image_version_arn:(image_version_arn_ : image_version_arn option) () =
  ({ image_version_arn = image_version_arn_ } : update_image_version_response)

let make_update_image_version_request ?alias:(alias_ : sage_maker_image_version_alias option)
    ?version:(version_ : image_version_number option)
    ?aliases_to_add:(aliases_to_add_ : sage_maker_image_version_aliases option)
    ?aliases_to_delete:(aliases_to_delete_ : sage_maker_image_version_aliases option)
    ?vendor_guidance:(vendor_guidance_ : vendor_guidance option)
    ?job_type:(job_type_ : job_type option) ?ml_framework:(ml_framework_ : ml_framework option)
    ?programming_lang:(programming_lang_ : programming_lang option)
    ?processor:(processor_ : processor option) ?horovod:(horovod_ : horovod option)
    ?release_notes:(release_notes_ : release_notes option) ~image_name:(image_name_ : image_name) ()
    =
  ({
     image_name = image_name_;
     alias = alias_;
     version = version_;
     aliases_to_add = aliases_to_add_;
     aliases_to_delete = aliases_to_delete_;
     vendor_guidance = vendor_guidance_;
     job_type = job_type_;
     ml_framework = ml_framework_;
     programming_lang = programming_lang_;
     processor = processor_;
     horovod = horovod_;
     release_notes = release_notes_;
   }
    : update_image_version_request)

let make_update_image_response ?image_arn:(image_arn_ : image_arn option) () =
  ({ image_arn = image_arn_ } : update_image_response)

let make_update_image_request
    ?delete_properties:(delete_properties_ : image_delete_property_list option)
    ?description:(description_ : image_description option)
    ?display_name:(display_name_ : image_display_name option)
    ?role_arn:(role_arn_ : role_arn option) ~image_name:(image_name_ : image_name) () =
  ({
     delete_properties = delete_properties_;
     description = description_;
     display_name = display_name_;
     image_name = image_name_;
     role_arn = role_arn_;
   }
    : update_image_request)

let make_update_hub_content_reference_response ~hub_arn:(hub_arn_ : hub_arn)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_arn = hub_arn_; hub_content_arn = hub_content_arn_ }
    : update_hub_content_reference_response)

let make_update_hub_content_reference_request
    ?min_version:(min_version_ : hub_content_version option) ~hub_name:(hub_name_ : hub_name_or_arn)
    ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type) () =
  ({
     hub_name = hub_name_;
     hub_content_name = hub_content_name_;
     hub_content_type = hub_content_type_;
     min_version = min_version_;
   }
    : update_hub_content_reference_request)

let make_update_hub_content_response ~hub_arn:(hub_arn_ : hub_arn)
    ~hub_content_arn:(hub_content_arn_ : hub_content_arn) () =
  ({ hub_arn = hub_arn_; hub_content_arn = hub_content_arn_ } : update_hub_content_response)

let make_update_hub_content_request
    ?hub_content_display_name:(hub_content_display_name_ : hub_content_display_name option)
    ?hub_content_description:(hub_content_description_ : hub_content_description option)
    ?hub_content_markdown:(hub_content_markdown_ : hub_content_markdown option)
    ?hub_content_search_keywords:
      (hub_content_search_keywords_ : hub_content_search_keyword_list option)
    ?support_status:(support_status_ : hub_content_support_status option)
    ~hub_name:(hub_name_ : hub_name_or_arn) ~hub_content_name:(hub_content_name_ : hub_content_name)
    ~hub_content_type:(hub_content_type_ : hub_content_type)
    ~hub_content_version:(hub_content_version_ : hub_content_version) () =
  ({
     hub_name = hub_name_;
     hub_content_name = hub_content_name_;
     hub_content_type = hub_content_type_;
     hub_content_version = hub_content_version_;
     hub_content_display_name = hub_content_display_name_;
     hub_content_description = hub_content_description_;
     hub_content_markdown = hub_content_markdown_;
     hub_content_search_keywords = hub_content_search_keywords_;
     support_status = support_status_;
   }
    : update_hub_content_request)

let make_update_hub_response ~hub_arn:(hub_arn_ : hub_arn) () =
  ({ hub_arn = hub_arn_ } : update_hub_response)

let make_update_hub_request ?hub_description:(hub_description_ : hub_description option)
    ?hub_display_name:(hub_display_name_ : hub_display_name option)
    ?hub_search_keywords:(hub_search_keywords_ : hub_search_keyword_list option)
    ~hub_name:(hub_name_ : hub_name_or_arn) () =
  ({
     hub_name = hub_name_;
     hub_description = hub_description_;
     hub_display_name = hub_display_name_;
     hub_search_keywords = hub_search_keywords_;
   }
    : update_hub_request)

let make_update_feature_metadata_request ?description:(description_ : feature_description option)
    ?parameter_additions:(parameter_additions_ : feature_parameter_additions option)
    ?parameter_removals:(parameter_removals_ : feature_parameter_removals option)
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn)
    ~feature_name:(feature_name_ : feature_name) () =
  ({
     feature_group_name = feature_group_name_;
     feature_name = feature_name_;
     description = description_;
     parameter_additions = parameter_additions_;
     parameter_removals = parameter_removals_;
   }
    : update_feature_metadata_request)

let make_update_feature_group_response ~feature_group_arn:(feature_group_arn_ : feature_group_arn)
    () =
  ({ feature_group_arn = feature_group_arn_ } : update_feature_group_response)

let make_throughput_config_update ?throughput_mode:(throughput_mode_ : throughput_mode option)
    ?provisioned_read_capacity_units:(provisioned_read_capacity_units_ : capacity_unit option)
    ?provisioned_write_capacity_units:(provisioned_write_capacity_units_ : capacity_unit option) ()
    =
  ({
     throughput_mode = throughput_mode_;
     provisioned_read_capacity_units = provisioned_read_capacity_units_;
     provisioned_write_capacity_units = provisioned_write_capacity_units_;
   }
    : throughput_config_update)

let make_update_feature_group_request
    ?feature_additions:(feature_additions_ : feature_additions option)
    ?online_store_config:(online_store_config_ : online_store_config_update option)
    ?throughput_config:(throughput_config_ : throughput_config_update option)
    ~feature_group_name:(feature_group_name_ : feature_group_name_or_arn) () =
  ({
     feature_group_name = feature_group_name_;
     feature_additions = feature_additions_;
     online_store_config = online_store_config_;
     throughput_config = throughput_config_;
   }
    : update_feature_group_request)

let make_update_experiment_response ?experiment_arn:(experiment_arn_ : experiment_arn option) () =
  ({ experiment_arn = experiment_arn_ } : update_experiment_response)

let make_update_experiment_request ?display_name:(display_name_ : experiment_entity_name option)
    ?description:(description_ : experiment_description option)
    ~experiment_name:(experiment_name_ : experiment_entity_name) () =
  ({ experiment_name = experiment_name_; display_name = display_name_; description = description_ }
    : update_experiment_request)

let make_update_endpoint_weights_and_capacities_output ~endpoint_arn:(endpoint_arn_ : endpoint_arn)
    () =
  ({ endpoint_arn = endpoint_arn_ } : update_endpoint_weights_and_capacities_output)

let make_update_endpoint_weights_and_capacities_input
    ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~desired_weights_and_capacities:
      (desired_weights_and_capacities_ : desired_weight_and_capacity_list) () =
  ({
     endpoint_name = endpoint_name_;
     desired_weights_and_capacities = desired_weights_and_capacities_;
   }
    : update_endpoint_weights_and_capacities_input)

let make_update_endpoint_output ~endpoint_arn:(endpoint_arn_ : endpoint_arn) () =
  ({ endpoint_arn = endpoint_arn_ } : update_endpoint_output)

let make_variant_property ~variant_property_type:(variant_property_type_ : variant_property_type) ()
    =
  ({ variant_property_type = variant_property_type_ } : variant_property)

let make_update_endpoint_input
    ?retain_all_variant_properties:(retain_all_variant_properties_ : boolean_ option)
    ?exclude_retained_variant_properties:
      (exclude_retained_variant_properties_ : variant_property_list option)
    ?deployment_config:(deployment_config_ : deployment_config option)
    ?retain_deployment_config:(retain_deployment_config_ : boolean_ option)
    ~endpoint_name:(endpoint_name_ : endpoint_name)
    ~endpoint_config_name:(endpoint_config_name_ : endpoint_config_name) () =
  ({
     endpoint_name = endpoint_name_;
     endpoint_config_name = endpoint_config_name_;
     retain_all_variant_properties = retain_all_variant_properties_;
     exclude_retained_variant_properties = exclude_retained_variant_properties_;
     deployment_config = deployment_config_;
     retain_deployment_config = retain_deployment_config_;
   }
    : update_endpoint_input)

let make_update_domain_response ?domain_arn:(domain_arn_ : domain_arn option) () =
  ({ domain_arn = domain_arn_ } : update_domain_response)

let make_update_domain_request
    ?default_user_settings:(default_user_settings_ : user_settings option)
    ?domain_settings_for_update:(domain_settings_for_update_ : domain_settings_for_update option)
    ?app_security_group_management:
      (app_security_group_management_ : app_security_group_management option)
    ?default_space_settings:(default_space_settings_ : default_space_settings option)
    ?subnet_ids:(subnet_ids_ : subnets option)
    ?app_network_access_type:(app_network_access_type_ : app_network_access_type option)
    ?tag_propagation:(tag_propagation_ : tag_propagation option)
    ?home_efs_file_system_creation:
      (home_efs_file_system_creation_ : home_efs_file_system_creation option)
    ?vpc_id:(vpc_id_ : vpc_id option) ~domain_id:(domain_id_ : domain_id) () =
  ({
     domain_id = domain_id_;
     default_user_settings = default_user_settings_;
     domain_settings_for_update = domain_settings_for_update_;
     app_security_group_management = app_security_group_management_;
     default_space_settings = default_space_settings_;
     subnet_ids = subnet_ids_;
     app_network_access_type = app_network_access_type_;
     tag_propagation = tag_propagation_;
     home_efs_file_system_creation = home_efs_file_system_creation_;
     vpc_id = vpc_id_;
   }
    : update_domain_request)

let make_update_devices_request ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~devices:(devices_ : devices) () =
  ({ device_fleet_name = device_fleet_name_; devices = devices_ } : update_devices_request)

let make_update_device_fleet_request ?role_arn:(role_arn_ : role_arn option)
    ?description:(description_ : device_fleet_description option)
    ?enable_iot_role_alias:(enable_iot_role_alias_ : enable_iot_role_alias option)
    ~device_fleet_name:(device_fleet_name_ : entity_name)
    ~output_config:(output_config_ : edge_output_config) () =
  ({
     device_fleet_name = device_fleet_name_;
     role_arn = role_arn_;
     description = description_;
     output_config = output_config_;
     enable_iot_role_alias = enable_iot_role_alias_;
   }
    : update_device_fleet_request)

let make_update_context_response ?context_arn:(context_arn_ : context_arn option) () =
  ({ context_arn = context_arn_ } : update_context_response)

let make_update_context_request ?description:(description_ : experiment_description option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?properties_to_remove:(properties_to_remove_ : list_lineage_entity_parameter_key option)
    ~context_name:(context_name_ : context_name) () =
  ({
     context_name = context_name_;
     description = description_;
     properties = properties_;
     properties_to_remove = properties_to_remove_;
   }
    : update_context_request)

let make_update_compute_quota_response ~compute_quota_arn:(compute_quota_arn_ : compute_quota_arn)
    ~compute_quota_version:(compute_quota_version_ : integer) () =
  ({ compute_quota_arn = compute_quota_arn_; compute_quota_version = compute_quota_version_ }
    : update_compute_quota_response)

let make_update_compute_quota_request
    ?compute_quota_config:(compute_quota_config_ : compute_quota_config option)
    ?compute_quota_target:(compute_quota_target_ : compute_quota_target option)
    ?activation_state:(activation_state_ : activation_state option)
    ?description:(description_ : entity_description option)
    ~compute_quota_id:(compute_quota_id_ : compute_quota_id)
    ~target_version:(target_version_ : integer) () =
  ({
     compute_quota_id = compute_quota_id_;
     target_version = target_version_;
     compute_quota_config = compute_quota_config_;
     compute_quota_target = compute_quota_target_;
     activation_state = activation_state_;
     description = description_;
   }
    : update_compute_quota_request)

let make_update_code_repository_output
    ~code_repository_arn:(code_repository_arn_ : code_repository_arn) () =
  ({ code_repository_arn = code_repository_arn_ } : update_code_repository_output)

let make_update_code_repository_input ?git_config:(git_config_ : git_config_for_update option)
    ~code_repository_name:(code_repository_name_ : entity_name) () =
  ({ code_repository_name = code_repository_name_; git_config = git_config_ }
    : update_code_repository_input)

let make_update_cluster_software_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : update_cluster_software_response)

let make_update_cluster_software_instance_group_specification
    ?image_release_version:(image_release_version_ : image_release_version option)
    ~instance_group_name:(instance_group_name_ : cluster_instance_group_name) () =
  ({ instance_group_name = instance_group_name_; image_release_version = image_release_version_ }
    : update_cluster_software_instance_group_specification)

let make_update_cluster_software_request
    ?instance_groups:(instance_groups_ : update_cluster_software_instance_groups option)
    ?deployment_config:(deployment_config_ : deployment_configuration option)
    ?image_id:(image_id_ : image_id option) ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     cluster_name = cluster_name_;
     instance_groups = instance_groups_;
     deployment_config = deployment_config_;
     image_id = image_id_;
   }
    : update_cluster_software_request)

let make_update_cluster_scheduler_config_response
    ~cluster_scheduler_config_arn:(cluster_scheduler_config_arn_ : cluster_scheduler_config_arn)
    ~cluster_scheduler_config_version:(cluster_scheduler_config_version_ : integer) () =
  ({
     cluster_scheduler_config_arn = cluster_scheduler_config_arn_;
     cluster_scheduler_config_version = cluster_scheduler_config_version_;
   }
    : update_cluster_scheduler_config_response)

let make_update_cluster_scheduler_config_request
    ?scheduler_config:(scheduler_config_ : scheduler_config option)
    ?description:(description_ : entity_description option)
    ~cluster_scheduler_config_id:(cluster_scheduler_config_id_ : cluster_scheduler_config_id)
    ~target_version:(target_version_ : integer) () =
  ({
     cluster_scheduler_config_id = cluster_scheduler_config_id_;
     target_version = target_version_;
     scheduler_config = scheduler_config_;
     description = description_;
   }
    : update_cluster_scheduler_config_request)

let make_update_cluster_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : update_cluster_response)

let make_update_cluster_request
    ?instance_groups:(instance_groups_ : cluster_instance_group_specifications option)
    ?restricted_instance_groups:
      (restricted_instance_groups_ : cluster_restricted_instance_group_specifications option)
    ?restricted_instance_groups_config:
      (restricted_instance_groups_config_ : cluster_restricted_instance_groups_config option)
    ?tiered_storage_config:(tiered_storage_config_ : cluster_tiered_storage_config option)
    ?node_recovery:(node_recovery_ : cluster_node_recovery option)
    ?instance_groups_to_delete:
      (instance_groups_to_delete_ : cluster_instance_groups_to_delete option)
    ?node_provisioning_mode:(node_provisioning_mode_ : cluster_node_provisioning_mode option)
    ?cluster_role:(cluster_role_ : role_arn option)
    ?auto_scaling:(auto_scaling_ : cluster_auto_scaling_config option)
    ?orchestrator:(orchestrator_ : cluster_orchestrator option)
    ~cluster_name:(cluster_name_ : cluster_name_or_arn) () =
  ({
     cluster_name = cluster_name_;
     instance_groups = instance_groups_;
     restricted_instance_groups = restricted_instance_groups_;
     restricted_instance_groups_config = restricted_instance_groups_config_;
     tiered_storage_config = tiered_storage_config_;
     node_recovery = node_recovery_;
     instance_groups_to_delete = instance_groups_to_delete_;
     node_provisioning_mode = node_provisioning_mode_;
     cluster_role = cluster_role_;
     auto_scaling = auto_scaling_;
     orchestrator = orchestrator_;
   }
    : update_cluster_request)

let make_update_artifact_response ?artifact_arn:(artifact_arn_ : artifact_arn option) () =
  ({ artifact_arn = artifact_arn_ } : update_artifact_response)

let make_update_artifact_request ?artifact_name:(artifact_name_ : experiment_entity_name option)
    ?properties:(properties_ : artifact_properties option)
    ?properties_to_remove:(properties_to_remove_ : list_lineage_entity_parameter_key option)
    ~artifact_arn:(artifact_arn_ : artifact_arn) () =
  ({
     artifact_arn = artifact_arn_;
     artifact_name = artifact_name_;
     properties = properties_;
     properties_to_remove = properties_to_remove_;
   }
    : update_artifact_request)

let make_update_app_image_config_response
    ?app_image_config_arn:(app_image_config_arn_ : app_image_config_arn option) () =
  ({ app_image_config_arn = app_image_config_arn_ } : update_app_image_config_response)

let make_update_app_image_config_request
    ?kernel_gateway_image_config:(kernel_gateway_image_config_ : kernel_gateway_image_config option)
    ?jupyter_lab_app_image_config:
      (jupyter_lab_app_image_config_ : jupyter_lab_app_image_config option)
    ?code_editor_app_image_config:
      (code_editor_app_image_config_ : code_editor_app_image_config option)
    ~app_image_config_name:(app_image_config_name_ : app_image_config_name) () =
  ({
     app_image_config_name = app_image_config_name_;
     kernel_gateway_image_config = kernel_gateway_image_config_;
     jupyter_lab_app_image_config = jupyter_lab_app_image_config_;
     code_editor_app_image_config = code_editor_app_image_config_;
   }
    : update_app_image_config_request)

let make_update_action_response ?action_arn:(action_arn_ : action_arn option) () =
  ({ action_arn = action_arn_ } : update_action_response)

let make_update_action_request ?description:(description_ : experiment_description option)
    ?status:(status_ : action_status option)
    ?properties:(properties_ : lineage_entity_parameters option)
    ?properties_to_remove:(properties_to_remove_ : list_lineage_entity_parameter_key option)
    ~action_name:(action_name_ : experiment_entity_name) () =
  ({
     action_name = action_name_;
     description = description_;
     status = status_;
     properties = properties_;
     properties_to_remove = properties_to_remove_;
   }
    : update_action_request)

let make_stop_transform_job_request ~transform_job_name:(transform_job_name_ : transform_job_name)
    () =
  ({ transform_job_name = transform_job_name_ } : stop_transform_job_request)

let make_stop_training_job_request ~training_job_name:(training_job_name_ : training_job_name) () =
  ({ training_job_name = training_job_name_ } : stop_training_job_request)

let make_stop_processing_job_request
    ~processing_job_name:(processing_job_name_ : processing_job_name) () =
  ({ processing_job_name = processing_job_name_ } : stop_processing_job_request)

let make_stop_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : stop_pipeline_execution_response)

let make_stop_pipeline_execution_request
    ~pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn)
    ~client_request_token:(client_request_token_ : idempotency_token) () =
  ({
     pipeline_execution_arn = pipeline_execution_arn_;
     client_request_token = client_request_token_;
   }
    : stop_pipeline_execution_request)

let make_stop_optimization_job_request ~optimization_job_name:(optimization_job_name_ : entity_name)
    () =
  ({ optimization_job_name = optimization_job_name_ } : stop_optimization_job_request)

let make_stop_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : stop_notebook_instance_input)

let make_stop_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : stop_monitoring_schedule_request)

let make_stop_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : stop_mlflow_tracking_server_response)

let make_stop_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : stop_mlflow_tracking_server_request)

let make_stop_labeling_job_request ~labeling_job_name:(labeling_job_name_ : labeling_job_name) () =
  ({ labeling_job_name = labeling_job_name_ } : stop_labeling_job_request)

let make_stop_job_response () = (() : unit)

let make_stop_job_request ~job_name:(job_name_ : job_name)
    ~job_category:(job_category_ : job_category) () =
  ({ job_name = job_name_; job_category = job_category_ } : stop_job_request)

let make_stop_inference_recommendations_job_request ~job_name:(job_name_ : recommendation_job_name)
    () =
  ({ job_name = job_name_ } : stop_inference_recommendations_job_request)

let make_stop_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : stop_inference_experiment_response)

let make_stop_inference_experiment_request
    ?desired_model_variants:(desired_model_variants_ : model_variant_config_list option)
    ?desired_state:(desired_state_ : inference_experiment_stop_desired_state option)
    ?reason:(reason_ : inference_experiment_status_reason option)
    ~name:(name_ : inference_experiment_name)
    ~model_variant_actions:(model_variant_actions_ : model_variant_action_map) () =
  ({
     name = name_;
     model_variant_actions = model_variant_actions_;
     desired_model_variants = desired_model_variants_;
     desired_state = desired_state_;
     reason = reason_;
   }
    : stop_inference_experiment_request)

let make_stop_hyper_parameter_tuning_job_request
    ~hyper_parameter_tuning_job_name:
      (hyper_parameter_tuning_job_name_ : hyper_parameter_tuning_job_name) () =
  ({ hyper_parameter_tuning_job_name = hyper_parameter_tuning_job_name_ }
    : stop_hyper_parameter_tuning_job_request)

let make_stop_edge_packaging_job_request
    ~edge_packaging_job_name:(edge_packaging_job_name_ : entity_name) () =
  ({ edge_packaging_job_name = edge_packaging_job_name_ } : stop_edge_packaging_job_request)

let make_stop_edge_deployment_stage_request
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~stage_name:(stage_name_ : entity_name) () =
  ({ edge_deployment_plan_name = edge_deployment_plan_name_; stage_name = stage_name_ }
    : stop_edge_deployment_stage_request)

let make_stop_compilation_job_request ~compilation_job_name:(compilation_job_name_ : entity_name) ()
    =
  ({ compilation_job_name = compilation_job_name_ } : stop_compilation_job_request)

let make_stop_auto_ml_job_request ~auto_ml_job_name:(auto_ml_job_name_ : auto_ml_job_name) () =
  ({ auto_ml_job_name = auto_ml_job_name_ } : stop_auto_ml_job_request)

let make_stop_ai_recommendation_job_response
    ~ai_recommendation_job_arn:(ai_recommendation_job_arn_ : ai_recommendation_job_arn) () =
  ({ ai_recommendation_job_arn = ai_recommendation_job_arn_ } : stop_ai_recommendation_job_response)

let make_stop_ai_recommendation_job_request
    ~ai_recommendation_job_name:(ai_recommendation_job_name_ : ai_entity_name) () =
  ({ ai_recommendation_job_name = ai_recommendation_job_name_ }
    : stop_ai_recommendation_job_request)

let make_stop_ai_benchmark_job_response
    ~ai_benchmark_job_arn:(ai_benchmark_job_arn_ : ai_benchmark_job_arn) () =
  ({ ai_benchmark_job_arn = ai_benchmark_job_arn_ } : stop_ai_benchmark_job_response)

let make_stop_ai_benchmark_job_request
    ~ai_benchmark_job_name:(ai_benchmark_job_name_ : ai_entity_name) () =
  ({ ai_benchmark_job_name = ai_benchmark_job_name_ } : stop_ai_benchmark_job_request)

let make_start_session_response ?session_id:(session_id_ : session_id option)
    ?stream_url:(stream_url_ : stream_url option) ?token_value:(token_value_ : token_value option)
    () =
  ({ session_id = session_id_; stream_url = stream_url_; token_value = token_value_ }
    : start_session_response)

let make_start_session_request ~resource_identifier:(resource_identifier_ : resource_identifier) ()
    =
  ({ resource_identifier = resource_identifier_ } : start_session_request)

let make_start_pipeline_execution_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ } : start_pipeline_execution_response)

let make_start_pipeline_execution_request
    ?pipeline_execution_display_name:
      (pipeline_execution_display_name_ : pipeline_execution_name option)
    ?pipeline_parameters:(pipeline_parameters_ : parameter_list option)
    ?pipeline_execution_description:
      (pipeline_execution_description_ : pipeline_execution_description option)
    ?parallelism_configuration:(parallelism_configuration_ : parallelism_configuration option)
    ?selective_execution_config:(selective_execution_config_ : selective_execution_config option)
    ?pipeline_version_id:(pipeline_version_id_ : pipeline_version_id option)
    ?mlflow_experiment_name:(mlflow_experiment_name_ : mlflow_experiment_entity_name option)
    ~pipeline_name:(pipeline_name_ : pipeline_name_or_arn)
    ~client_request_token:(client_request_token_ : idempotency_token) () =
  ({
     pipeline_name = pipeline_name_;
     pipeline_execution_display_name = pipeline_execution_display_name_;
     pipeline_parameters = pipeline_parameters_;
     pipeline_execution_description = pipeline_execution_description_;
     client_request_token = client_request_token_;
     parallelism_configuration = parallelism_configuration_;
     selective_execution_config = selective_execution_config_;
     pipeline_version_id = pipeline_version_id_;
     mlflow_experiment_name = mlflow_experiment_name_;
   }
    : start_pipeline_execution_request)

let make_start_notebook_instance_input
    ~notebook_instance_name:(notebook_instance_name_ : notebook_instance_name) () =
  ({ notebook_instance_name = notebook_instance_name_ } : start_notebook_instance_input)

let make_start_monitoring_schedule_request
    ~monitoring_schedule_name:(monitoring_schedule_name_ : monitoring_schedule_name) () =
  ({ monitoring_schedule_name = monitoring_schedule_name_ } : start_monitoring_schedule_request)

let make_start_mlflow_tracking_server_response
    ?tracking_server_arn:(tracking_server_arn_ : tracking_server_arn option) () =
  ({ tracking_server_arn = tracking_server_arn_ } : start_mlflow_tracking_server_response)

let make_start_mlflow_tracking_server_request
    ~tracking_server_name:(tracking_server_name_ : tracking_server_name) () =
  ({ tracking_server_name = tracking_server_name_ } : start_mlflow_tracking_server_request)

let make_start_inference_experiment_response
    ~inference_experiment_arn:(inference_experiment_arn_ : inference_experiment_arn) () =
  ({ inference_experiment_arn = inference_experiment_arn_ } : start_inference_experiment_response)

let make_start_inference_experiment_request ~name:(name_ : inference_experiment_name) () =
  ({ name = name_ } : start_inference_experiment_request)

let make_start_edge_deployment_stage_request
    ~edge_deployment_plan_name:(edge_deployment_plan_name_ : entity_name)
    ~stage_name:(stage_name_ : entity_name) () =
  ({ edge_deployment_plan_name = edge_deployment_plan_name_; stage_name = stage_name_ }
    : start_edge_deployment_stage_request)

let make_start_cluster_health_check_response ~cluster_arn:(cluster_arn_ : cluster_arn) () =
  ({ cluster_arn = cluster_arn_ } : start_cluster_health_check_response)

let make_start_cluster_health_check_request ~cluster_name:(cluster_name_ : cluster_name_or_arn)
    ~deep_health_check_configurations:
      (deep_health_check_configurations_ : deep_health_check_configurations) () =
  ({
     cluster_name = cluster_name_;
     deep_health_check_configurations = deep_health_check_configurations_;
   }
    : start_cluster_health_check_request)

let make_send_pipeline_execution_step_success_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ }
    : send_pipeline_execution_step_success_response)

let make_send_pipeline_execution_step_success_request
    ?output_parameters:(output_parameters_ : output_parameter_list option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ~callback_token:(callback_token_ : callback_token) () =
  ({
     callback_token = callback_token_;
     output_parameters = output_parameters_;
     client_request_token = client_request_token_;
   }
    : send_pipeline_execution_step_success_request)

let make_send_pipeline_execution_step_failure_response
    ?pipeline_execution_arn:(pipeline_execution_arn_ : pipeline_execution_arn option) () =
  ({ pipeline_execution_arn = pipeline_execution_arn_ }
    : send_pipeline_execution_step_failure_response)

let make_send_pipeline_execution_step_failure_request
    ?failure_reason:(failure_reason_ : string256 option)
    ?client_request_token:(client_request_token_ : idempotency_token option)
    ~callback_token:(callback_token_ : callback_token) () =
  ({
     callback_token = callback_token_;
     failure_reason = failure_reason_;
     client_request_token = client_request_token_;
   }
    : send_pipeline_execution_step_failure_request)

let make_training_plan_extension_offering ?availability_zone:(availability_zone_ : string256 option)
    ?start_date:(start_date_ : timestamp option) ?end_date:(end_date_ : timestamp option)
    ?duration_hours:(duration_hours_ : training_plan_extension_duration_hours option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?currency_code:(currency_code_ : currency_code option)
    ~training_plan_extension_offering_id:
      (training_plan_extension_offering_id_ : training_plan_extension_offering_id) () =
  ({
     training_plan_extension_offering_id = training_plan_extension_offering_id_;
     availability_zone = availability_zone_;
     start_date = start_date_;
     end_date = end_date_;
     duration_hours = duration_hours_;
     upfront_fee = upfront_fee_;
     currency_code = currency_code_;
   }
    : training_plan_extension_offering)

let make_training_plan_offering
    ?requested_start_time_after:(requested_start_time_after_ : timestamp option)
    ?requested_end_time_before:(requested_end_time_before_ : timestamp option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours option)
    ?duration_minutes:(duration_minutes_ : training_plan_duration_minutes option)
    ?upfront_fee:(upfront_fee_ : string256 option)
    ?currency_code:(currency_code_ : currency_code option)
    ?reserved_capacity_offerings:(reserved_capacity_offerings_ : reserved_capacity_offerings option)
    ~training_plan_offering_id:(training_plan_offering_id_ : training_plan_offering_id)
    ~target_resources:(target_resources_ : sage_maker_resource_names) () =
  ({
     training_plan_offering_id = training_plan_offering_id_;
     target_resources = target_resources_;
     requested_start_time_after = requested_start_time_after_;
     requested_end_time_before = requested_end_time_before_;
     duration_hours = duration_hours_;
     duration_minutes = duration_minutes_;
     upfront_fee = upfront_fee_;
     currency_code = currency_code_;
     reserved_capacity_offerings = reserved_capacity_offerings_;
   }
    : training_plan_offering)

let make_search_training_plan_offerings_response
    ?training_plan_extension_offerings:
      (training_plan_extension_offerings_ : training_plan_extension_offerings option)
    ~training_plan_offerings:(training_plan_offerings_ : training_plan_offerings) () =
  ({
     training_plan_offerings = training_plan_offerings_;
     training_plan_extension_offerings = training_plan_extension_offerings_;
   }
    : search_training_plan_offerings_response)

let make_search_training_plan_offerings_request
    ?instance_type:(instance_type_ : reserved_capacity_instance_type option)
    ?instance_count:(instance_count_ : reserved_capacity_instance_count option)
    ?ultra_server_type:(ultra_server_type_ : ultra_server_type option)
    ?ultra_server_count:(ultra_server_count_ : ultra_server_count option)
    ?start_time_after:(start_time_after_ : timestamp option)
    ?end_time_before:(end_time_before_ : timestamp option)
    ?duration_hours:(duration_hours_ : training_plan_duration_hours_input option)
    ?target_resources:(target_resources_ : sage_maker_resource_names option)
    ?training_plan_arn:(training_plan_arn_ : string_ option) () =
  ({
     instance_type = instance_type_;
     instance_count = instance_count_;
     ultra_server_type = ultra_server_type_;
     ultra_server_count = ultra_server_count_;
     start_time_after = start_time_after_;
     end_time_before = end_time_before_;
     duration_hours = duration_hours_;
     target_resources = target_resources_;
     training_plan_arn = training_plan_arn_;
   }
    : search_training_plan_offerings_request)

let make_total_hits ?value:(value_ : long option) ?relation:(relation_ : relation option) () =
  ({ value = value_; relation = relation_ } : total_hits)

let make_training_job ?training_job_name:(training_job_name_ : training_job_name option)
    ?training_job_arn:(training_job_arn_ : training_job_arn option)
    ?tuning_job_arn:(tuning_job_arn_ : hyper_parameter_tuning_job_arn option)
    ?labeling_job_arn:(labeling_job_arn_ : labeling_job_arn option)
    ?auto_ml_job_arn:(auto_ml_job_arn_ : auto_ml_job_arn option)
    ?model_artifacts:(model_artifacts_ : model_artifacts option)
    ?training_job_status:(training_job_status_ : training_job_status option)
    ?secondary_status:(secondary_status_ : secondary_status option)
    ?failure_reason:(failure_reason_ : failure_reason option)
    ?hyper_parameters:(hyper_parameters_ : hyper_parameters option)
    ?algorithm_specification:(algorithm_specification_ : algorithm_specification option)
    ?role_arn:(role_arn_ : role_arn option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?output_data_config:(output_data_config_ : output_data_config option)
    ?resource_config:(resource_config_ : resource_config option)
    ?warm_pool_status:(warm_pool_status_ : warm_pool_status option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?stopping_condition:(stopping_condition_ : stopping_condition option)
    ?creation_time:(creation_time_ : timestamp option)
    ?training_start_time:(training_start_time_ : timestamp option)
    ?training_end_time:(training_end_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?secondary_status_transitions:
      (secondary_status_transitions_ : secondary_status_transitions option)
    ?final_metric_data_list:(final_metric_data_list_ : final_metric_data_list option)
    ?enable_network_isolation:(enable_network_isolation_ : boolean_ option)
    ?enable_inter_container_traffic_encryption:
      (enable_inter_container_traffic_encryption_ : boolean_ option)
    ?enable_managed_spot_training:(enable_managed_spot_training_ : boolean_ option)
    ?checkpoint_config:(checkpoint_config_ : checkpoint_config option)
    ?training_time_in_seconds:(training_time_in_seconds_ : training_time_in_seconds option)
    ?billable_time_in_seconds:(billable_time_in_seconds_ : billable_time_in_seconds option)
    ?debug_hook_config:(debug_hook_config_ : debug_hook_config option)
    ?experiment_config:(experiment_config_ : experiment_config option)
    ?debug_rule_configurations:(debug_rule_configurations_ : debug_rule_configurations option)
    ?tensor_board_output_config:(tensor_board_output_config_ : tensor_board_output_config option)
    ?debug_rule_evaluation_statuses:
      (debug_rule_evaluation_statuses_ : debug_rule_evaluation_statuses option)
    ?output_model_package_arn:(output_model_package_arn_ : model_package_arn option)
    ?model_package_config:(model_package_config_ : model_package_config option)
    ?profiler_config:(profiler_config_ : profiler_config option)
    ?environment:(environment_ : training_environment_map option)
    ?retry_strategy:(retry_strategy_ : retry_strategy option) ?tags:(tags_ : tag_list option) () =
  ({
     training_job_name = training_job_name_;
     training_job_arn = training_job_arn_;
     tuning_job_arn = tuning_job_arn_;
     labeling_job_arn = labeling_job_arn_;
     auto_ml_job_arn = auto_ml_job_arn_;
     model_artifacts = model_artifacts_;
     training_job_status = training_job_status_;
     secondary_status = secondary_status_;
     failure_reason = failure_reason_;
     hyper_parameters = hyper_parameters_;
     algorithm_specification = algorithm_specification_;
     role_arn = role_arn_;
     input_data_config = input_data_config_;
     output_data_config = output_data_config_;
     resource_config = resource_config_;
     warm_pool_status = warm_pool_status_;
     vpc_config = vpc_config_;
     stopping_condition = stopping_condition_;
     creation_time = creation_time_;
     training_start_time = training_start_time_;
     training_end_time = training_end_time_;
     last_modified_time = last_modified_time_;
     secondary_status_transitions = secondary_status_transitions_;
     final_metric_data_list = final_metric_data_list_;
     enable_network_isolation = enable_network_isolation_;
     enable_inter_container_traffic_encryption = enable_inter_container_traffic_encryption_;
     enable_managed_spot_training = enable_managed_spot_training_;
     checkpoint_config = checkpoint_config_;
     training_time_in_seconds = training_time_in_seconds_;
     billable_time_in_seconds = billable_time_in_seconds_;
     debug_hook_config = debug_hook_config_;
     experiment_config = experiment_config_;
     debug_rule_configurations = debug_rule_configurations_;
     tensor_board_output_config = tensor_board_output_config_;
     debug_rule_evaluation_statuses = debug_rule_evaluation_statuses_;
     output_model_package_arn = output_model_package_arn_;
     model_package_config = model_package_config_;
     profiler_config = profiler_config_;
     environment = environment_;
     retry_strategy = retry_strategy_;
     tags = tags_;
   }
    : training_job)

let make_trial_component_source_detail ?source_arn:(source_arn_ : trial_component_source_arn option)
    ?training_job:(training_job_ : training_job option)
    ?processing_job:(processing_job_ : processing_job option)
    ?transform_job:(transform_job_ : transform_job option) () =
  ({
     source_arn = source_arn_;
     training_job = training_job_;
     processing_job = processing_job_;
     transform_job = transform_job_;
   }
    : trial_component_source_detail)

let make_trial_component
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?source:(source_ : trial_component_source option)
    ?status:(status_ : trial_component_status option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?parameters:(parameters_ : trial_component_parameters option)
    ?input_artifacts:(input_artifacts_ : trial_component_artifacts option)
    ?output_artifacts:(output_artifacts_ : trial_component_artifacts option)
    ?metrics:(metrics_ : trial_component_metric_summaries option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?source_detail:(source_detail_ : trial_component_source_detail option)
    ?lineage_group_arn:(lineage_group_arn_ : lineage_group_arn option)
    ?tags:(tags_ : tag_list option) ?parents:(parents_ : parents option)
    ?run_name:(run_name_ : experiment_entity_name option) () =
  ({
     trial_component_name = trial_component_name_;
     display_name = display_name_;
     trial_component_arn = trial_component_arn_;
     source = source_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     parameters = parameters_;
     input_artifacts = input_artifacts_;
     output_artifacts = output_artifacts_;
     metrics = metrics_;
     metadata_properties = metadata_properties_;
     source_detail = source_detail_;
     lineage_group_arn = lineage_group_arn_;
     tags = tags_;
     parents = parents_;
     run_name = run_name_;
   }
    : trial_component)

let make_trial_component_simple_summary
    ?trial_component_name:(trial_component_name_ : experiment_entity_name option)
    ?trial_component_arn:(trial_component_arn_ : trial_component_arn option)
    ?trial_component_source:(trial_component_source_ : trial_component_source option)
    ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option) () =
  ({
     trial_component_name = trial_component_name_;
     trial_component_arn = trial_component_arn_;
     trial_component_source = trial_component_source_;
     creation_time = creation_time_;
     created_by = created_by_;
   }
    : trial_component_simple_summary)

let make_trial ?trial_name:(trial_name_ : experiment_entity_name option)
    ?trial_arn:(trial_arn_ : trial_arn option)
    ?display_name:(display_name_ : experiment_entity_name option)
    ?experiment_name:(experiment_name_ : experiment_entity_name option)
    ?source:(source_ : trial_source option) ?creation_time:(creation_time_ : timestamp option)
    ?created_by:(created_by_ : user_context option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_modified_by:(last_modified_by_ : user_context option)
    ?metadata_properties:(metadata_properties_ : metadata_properties option)
    ?tags:(tags_ : tag_list option)
    ?trial_component_summaries:
      (trial_component_summaries_ : trial_component_simple_summaries option) () =
  ({
     trial_name = trial_name_;
     trial_arn = trial_arn_;
     display_name = display_name_;
     experiment_name = experiment_name_;
     source = source_;
     creation_time = creation_time_;
     created_by = created_by_;
     last_modified_time = last_modified_time_;
     last_modified_by = last_modified_by_;
     metadata_properties = metadata_properties_;
     tags = tags_;
     trial_component_summaries = trial_component_summaries_;
   }
    : trial)

let make_search_record ?training_job:(training_job_ : training_job option)
    ?experiment:(experiment_ : experiment option) ?trial:(trial_ : trial option)
    ?trial_component:(trial_component_ : trial_component option)
    ?endpoint:(endpoint_ : endpoint option) ?model_package:(model_package_ : model_package option)
    ?model_package_group:(model_package_group_ : model_package_group option)
    ?pipeline:(pipeline_ : pipeline option)
    ?pipeline_execution:(pipeline_execution_ : pipeline_execution option)
    ?pipeline_version:(pipeline_version_ : pipeline_version option)
    ?feature_group:(feature_group_ : feature_group option)
    ?feature_metadata:(feature_metadata_ : feature_metadata option)
    ?project:(project_ : project option)
    ?hyper_parameter_tuning_job:
      (hyper_parameter_tuning_job_ : hyper_parameter_tuning_job_search_entity option)
    ?model_card:(model_card_ : model_card option) ?model:(model_ : model_dashboard_model option)
    ?job:(job_ : job option) () =
  ({
     training_job = training_job_;
     experiment = experiment_;
     trial = trial_;
     trial_component = trial_component_;
     endpoint = endpoint_;
     model_package = model_package_;
     model_package_group = model_package_group_;
     pipeline = pipeline_;
     pipeline_execution = pipeline_execution_;
     pipeline_version = pipeline_version_;
     feature_group = feature_group_;
     feature_metadata = feature_metadata_;
     project = project_;
     hyper_parameter_tuning_job = hyper_parameter_tuning_job_;
     model_card = model_card_;
     model = model_;
     job = job_;
   }
    : search_record)

let make_search_response ?results:(results_ : search_results_list option)
    ?next_token:(next_token_ : next_token option) ?total_hits:(total_hits_ : total_hits option) () =
  ({ results = results_; next_token = next_token_; total_hits = total_hits_ } : search_response)

let make_visibility_conditions ?key:(key_ : visibility_conditions_key option)
    ?value:(value_ : visibility_conditions_value option) () =
  ({ key = key_; value = value_ } : visibility_conditions)

let make_search_expression ?filters:(filters_ : filter_list option)
    ?nested_filters:(nested_filters_ : nested_filters_list option)
    ?sub_expressions:(sub_expressions_ : search_expression_list option)
    ?operator:(operator_ : boolean_operator option) () =
  ({
     filters = filters_;
     nested_filters = nested_filters_;
     sub_expressions = sub_expressions_;
     operator = operator_;
   }
    : search_expression)

let make_search_request ?search_expression:(search_expression_ : search_expression option)
    ?sort_by:(sort_by_ : resource_property_name option)
    ?sort_order:(sort_order_ : search_sort_order option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?cross_account_filter_option:(cross_account_filter_option_ : cross_account_filter_option option)
    ?visibility_conditions:(visibility_conditions_ : visibility_conditions_list option)
    ~resource:(resource_ : resource_type) () =
  ({
     resource = resource_;
     search_expression = search_expression_;
     sort_by = sort_by_;
     sort_order = sort_order_;
     next_token = next_token_;
     max_results = max_results_;
     cross_account_filter_option = cross_account_filter_option_;
     visibility_conditions = visibility_conditions_;
   }
    : search_request)
